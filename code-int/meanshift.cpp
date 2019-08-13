/*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/

#include "meanshift.h"

using namespace std;

#define multiplier 1000000
#define GET_VARIABLE_NAME(Variable) (#Variable)

MeanShift::MeanShift()
{
    cfg.MaxIter = 1;
    cfg.num_bins = 16;
    cfg.piexl_range = 256;
    bin_width = cfg.piexl_range / cfg.num_bins;
}

// void  MeanShift::Init_target_frame(const cv::Mat &frame,const cv::Rect &rect)
void  MeanShift::Init_target_frame(const cv::Mat &frame,const cv::Rect &rect, int normalized_C, cv::Mat kernel)
{
    target_Region = rect;
    target_model = pdf_representation(frame,target_Region,normalized_C, kernel);

    // cout << "target_model" << endl << target_model << endl << endl;
    // printMatInt("target_model", target_model);
}

int  MeanShift::Epanechnikov_kernel_float(cv::Mat &kernel)
{
    int h = kernel.rows;
    int w = kernel.cols;
    // cout << "h " << h << " w " << w << endl;
    float epanechnikov_cd = 0.1*PI*h*w;
    // cout << "epanechnikov_cd " << epanechnikov_cd << endl;

    int kernel_sum = 0;
    for(int i=0;i<h;i++)
    {
        for(int j=0;j<w;j++)
        {
            float x = static_cast<float>(i - h/2);
            float y = static_cast<float> (j - w/2);
            float norm_x = (x*x/(h*h/4)+y*y/(w*w/4));
            float result =norm_x < 1 ? (epanechnikov_cd*(1.0-norm_x)) * 100 : 0;
            kernel.at<int>(i,j) = static_cast<int>(result);
            kernel_sum += static_cast<int>(result);
            // cout << "x " << x << " y " << y << " norm_x " << norm_x << " result " << result << " kernel_sum " << kernel_sum << endl;

            // cout << "x " << x << " y " << y << 
            // " norm_x " << FormatWithCommas((int) (norm_x*100)) << " result " << FormatWithCommas((int) (result*100)) 
            // << " kernel_sum " << FormatWithCommas((int) (kernel_sum*100)) << endl;

        }
    }

    // cout << "kernel_sum " << kernel_sum << endl; 
    return kernel_sum;
}

int  MeanShift::Epanechnikov_kernel(cv::Mat &kernel)
{
    int h = kernel.rows;
    int w = kernel.cols;
    // cout << "h " << h << " w " << w << endl;

    int epanechnikov_cd = 31.415926*58*86;
    // cout << "epanechnikov_cd " << epanechnikov_cd << endl;

    int kernel_sum = 0;

    for(int i=0;i<h;i++)
    {
        for(int j=0;j<w;j++)
        {
            int x = (i - h/2);
            int y = (j - w/2);
            int norm_x = x*x*multiplier / (h*h/4) + y*y*multiplier / (w*w/4);
            
            int result;
            if (norm_x < multiplier) { 
                result = epanechnikov_cd/10000 * (multiplier-norm_x)/10000  ;
            } else {
                result = 0;
            }
            
            kernel.at<int>(i,j) = result;
            kernel_sum += result;

            // cout << "x " << x << " y " << y << 
            // " norm_x " << FormatWithCommas(norm_x) << " result " << FormatWithCommas(result) 
            // << " kernel_sum " << FormatWithCommas(kernel_sum) << endl;
        }
    }
    return kernel_sum;
}

// cv::Mat MeanShift::pdf_representation(const cv::Mat &frame, const cv::Rect &rect)
cv::Mat MeanShift::pdf_representation(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel)
{
    // cv::Mat kernel(rect.height,rect.width,CV_32S,cv::Scalar(0));
    // int ep = Epanechnikov_kernel(kernel); // kelipatan 100
    // int ep = Epanechnikov_kernel_float(kernel); // kelipatan 100
    // int normalized_C = 10000000000 / ep ; 

    // printMatInt("kernel", kernel);

    cv::Mat pdf_model(8,16,CV_32S,cv::Scalar(1));

    cv::Vec3i curr_pixel_value;
    cv::Vec3i bin_value;

    // cout << "bin_width " << bin_width << endl;
    // cout << "Epanechnikov_kernel " << FormatWithCommas(ep) << endl;
    // cout << "normalized_C " << normalized_C << endl;

    int row_index = rect.y;
    int clo_index = rect.x;

    for(int i=0;i<rect.height;i++)
    {
        clo_index = rect.x;
        for(int j=0;j<rect.width;j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(row_index,clo_index);
            bin_value[0] = (curr_pixel_value[0]/bin_width);
            bin_value[1] = (curr_pixel_value[1]/bin_width);
            bin_value[2] = (curr_pixel_value[2]/bin_width);
            // cout << "bin_value " << bin_value[0] << ", " << bin_value[1] << ", " << bin_value[2] << endl;
            // cout << "kernel " << kernel.at<int>(i,j) << endl;
            
            pdf_model.at<int>(0,bin_value[0]) += kernel.at<int>(i,j)/1000*normalized_C;
            pdf_model.at<int>(1,bin_value[1]) += kernel.at<int>(i,j)/1000*normalized_C;
            pdf_model.at<int>(2,bin_value[2]) += kernel.at<int>(i,j)/1000*normalized_C;
            // cout << "pdf_model " << pdf_model.at<int>(0,bin_value[0]) << ", " << pdf_model.at<int>(1,bin_value[1]) << ", " << pdf_model.at<int>(2,bin_value[2]) << endl;
            clo_index++;
        }
        row_index++;
    }

    return pdf_model;

}

cv::Mat MeanShift::CalWeight(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec)
{
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    cv::Mat weight(rows,cols,CV_32S,cv::Scalar(1));
    vector<cv::Mat> bgr_planes;
    cv::split(frame, bgr_planes);

    for(int k = 0; k < 3;  k++)
    {
        row_index = rec.y;
        for(int i=0;i<rows;i++)
        {
            col_index = rec.x;
            for(int j=0;j<cols;j++)
            {
                int curr_pixel = (bgr_planes[k].at<uchar>(row_index,col_index));
                int bin_value = curr_pixel/bin_width;
                weight.at<int>(i,j) *= static_cast<int>(100 * 
                    (sqrt(target_model.at<int>(k, bin_value)) /
                        sqrt(target_candidate.at<int>(k, bin_value))));
                // cout << "target_model " << FormatWithCommas(target_model.at<int>(k, bin_value)) << 
                //     " target_candidate " << FormatWithCommas(target_candidate.at<int>(k, bin_value)) <<
                //     " weight " << FormatWithCommas(weight.at<int>(i,j)) << endl;
                col_index++;
            }
            row_index++;
        }
    }

    return weight;
}

cv::Rect MeanShift::track(const cv::Mat &next_frame, int normalized_C, cv::Mat kernel)
{
    cv::Rect next_rect;
    for(int iter=0;iter<cfg.MaxIter;iter++)
    {
        cv::Mat target_candidate = pdf_representation(next_frame,target_Region, normalized_C, kernel);
        // cout << "target_candidate " << endl << target_candidate << endl << endl;
        // printMatInt("target_candidate = pdf_representation", target_candidate);

        // cout << "target_candidate = " << target_candidate.rows << ", " << target_candidate.cols << endl << " "  << target_candidate << endl << endl;
        // cout << "target_Region = " << endl << " "  << target_Region << endl << endl;
        // cout << "target_model = " << target_model.rows << ", " << target_model.cols << endl << " "  << target_model << endl << endl;

        cv::Mat weight = CalWeight(next_frame,target_model,target_candidate,target_Region);
        // cout << "weight " << endl << weight << endl << endl;
        // printMatInt("weight", weight);

        // cout << "weight " << weight.rows << ", " << weight.cols << endl;
        int delta_x = 0;
        int sum_wij = 0;
        int delta_y = 0;
        int centre = static_cast<int>((weight.rows-1)*10/2);
        float centre_float = static_cast<int>((weight.rows-1)/2);
        // cout << "centre " << centre << endl;
        int mult = 0;

        next_rect.x = target_Region.x;
        next_rect.y = target_Region.y;
        next_rect.width = target_Region.width;
        next_rect.height = target_Region.height;

        // int i=0;
        // int j=0;
        for(int i=0;i<weight.rows;i++)
        {
            for(int j=0;j<weight.cols;j++)
            {
                // float a_i = static_cast<float>(i-centre_float)/centre_float;
                // float a_j = static_cast<float>(j-centre_float)/centre_float;
                int norm_i = static_cast<int>((i*10-centre)*10000/centre);
                int norm_j = static_cast<int>((j*10-centre)*10000/centre);
                // int norm_i = static_cast<int>(a_i*1000);
                // int norm_j = static_cast<int>(a_j*1000);
                int k = pow(norm_i,2)+pow(norm_j,2);
                mult = k > 100000000 ? 0 : 1;
                int w = weight.at<int>(i,j)/1000;
                int d_x = norm_j*w/10*mult;
                int d_y = norm_i*w/10*mult;
                int d_w = w*mult/10;
                delta_x += static_cast<int>(d_x);
                delta_y += static_cast<int>(d_y);
                sum_wij += static_cast<int>(d_w);
                if (d_x != 0 || d_y != 0 || d_w != 0) {
                    cout << "norm_i " << norm_i << " norm_j " << norm_j << " k " << k << " mult " << mult << endl;
                    cout << "d_x " << FormatWithCommas(d_x) << " d_y " << FormatWithCommas(d_y) << " d_w " << FormatWithCommas(d_w)<< endl;
                    cout << "weight " << weight.at<int>(i,j) << " delta_x " << FormatWithCommas(delta_x) << " delta_y " << FormatWithCommas(delta_y) << " sum_wij " <<  FormatWithCommas(sum_wij) << endl << endl;
                }
            }
        }

        int asd = delta_x/sum_wij;
        int d_x = (asd)*centre/10000;
        int d_y = (asd)*centre/10000;
        // cout << "delta_x " << FormatWithCommas(delta_x) << " delta_y " << FormatWithCommas(delta_y) << " sum_wij " << FormatWithCommas(sum_wij) << " centre " << FormatWithCommas(centre) <<  " asd " << FormatWithCommas(asd) << endl;
        // cout << "before next_rect x " << next_rect.x << " y " << next_rect.y 
        // << " d_x " << d_x << " d_y" << d_y << endl;
        next_rect.x += d_x;
        next_rect.y += d_y;

        // cout << endl << "delta_x " << delta_x << " y " << delta_y << " sum_wij " << sum_wij << " centre " << centre << endl;
        // cout << "after next_rect x " << next_rect.x << " y " << next_rect.y << endl;
        // cout << "diff x " << abs(next_rect.x-target_Region.x) << " y " << abs(next_rect.y-target_Region.y) << endl;

        if(abs(next_rect.x-target_Region.x)<1 && abs(next_rect.y-target_Region.y)<1)
        {
            break;
        }
        else
        {
            target_Region.x = next_rect.x;
            target_Region.y = next_rect.y;
        }
    }

    return next_rect;
}

cv::Rect MeanShift::track_float(const cv::Mat &next_frame, int normalized_C, cv::Mat kernel)
{
    cv::Rect next_rect;
    for(int iter=0;iter<cfg.MaxIter;iter++)
    {
        cv::Mat target_candidate = pdf_representation(next_frame,target_Region, normalized_C, kernel);
        // cout << "target_candidate " << endl << target_candidate << endl << endl;
        // printMatInt("target_candidate = pdf_representation", target_candidate);

        // cout << "target_candidate = " << target_candidate.rows << ", " << target_candidate.cols << endl << " "  << target_candidate << endl << endl;
        // cout << "target_Region = " << endl << " "  << target_Region << endl << endl;
        // cout << "target_model = " << target_model.rows << ", " << target_model.cols << endl << " "  << target_model << endl << endl;

        cv::Mat weight = CalWeight(next_frame,target_model,target_candidate,target_Region);
        // cout << "weight " << endl << weight << endl << endl;
        // printMatInt("weight", weight);

        float delta_x = 0.0;
        float sum_wij = 0.0;
        float delta_y = 0.0;
        float centre = static_cast<float>((weight.rows-1)/2.0);
        double mult = 0.0;
        // cout << "centre " << centre << endl;

        next_rect.x = target_Region.x;
        next_rect.y = target_Region.y;
        next_rect.width = target_Region.width;
        next_rect.height = target_Region.height;

        // int i=0;
        // int j=0;
        for(int i=0;i<weight.rows;i++)
        {
            for(int j=0;j<weight.cols;j++)
            {
                float norm_i = static_cast<float>(i-centre)/centre;
                float norm_j = static_cast<float>(j-centre)/centre;
                float k = pow(norm_i,2)+pow(norm_j,2);
                mult = pow(norm_i,2)+pow(norm_j,2)>1.0?0.0:1.0;
                int w = weight.at<int>(i,j);
                float d_x = norm_j*w*mult/1000000;
                float d_y = norm_i*w*mult/1000000;
                float d_w = w*mult/1000000;
                delta_x += static_cast<float>(d_x);
                delta_y += static_cast<float>(d_y);
                sum_wij += static_cast<float>(d_w);

                // cout << "weight " << w << " delta_x " << delta_x << " delta_y " << delta_y << " sum_wij " <<  sum_wij << endl << endl;
                // if (d_x != 0 || d_y != 0 || d_w != 0) {
                //     int a,b,c,d,e,f,g,h,i;
                //     a = delta_x*10000;
                //     b = delta_y*10000;
                //     c = sum_wij*10000;
                //     d = norm_i*10000;
                //     e = norm_j*10000;
                //     f = k*1000;
                //     g = d_x*1000000;
                //     h = d_y*1000000;
                //     i = d_w*100;

                //     cout << "norm_i " << d << " norm_j " << e << " k " <<f << " mult " << mult << endl;
                //     cout << "d_x " << g << " " << d_x << " d_y " << h << " " << d_y << " d_w " << i << " " << d_w << endl;
                //     cout << "weight " << weight.at<float>(i,j) << " delta_x " << FormatWithCommas(a) << " delta_y " << FormatWithCommas(b) << " sum_wij " <<  FormatWithCommas(c) << endl << endl;
                // }
            }
        }

        // float asd = delta_x/sum_wij;
        // float d_x = (delta_x/sum_wij)*centre;
        // float d_y = (delta_y/sum_wij)*centre;
        // cout << "delta_x " << delta_x << " delta_y " << delta_y << " sum_wij " << sum_wij << " centre " << centre <<  " asd " << asd << endl;
        
        // cout << "before next_rect x " << next_rect.x << " y " << next_rect.y << " d_x " << d_x << " d_y" << d_y << endl;
        next_rect.x += static_cast<int>((delta_x/sum_wij)*centre);
        next_rect.y += static_cast<int>((delta_y/sum_wij)*centre);

        // cout << endl << "delta_x " << delta_x << " y " << delta_y << " sum_wij " << sum_wij << " centre " << centre << endl;
        cout << "after next_rect x " << next_rect.x << " y " << next_rect.y << endl;
        // cout << "diff x " << abs(next_rect.x-target_Region.x) << " y " << abs(next_rect.y-target_Region.y) << endl;

        if(abs(next_rect.x-target_Region.x)<1 && abs(next_rect.y-target_Region.y)<1)
        {
            break;
        }
        else
        {
            target_Region.x = next_rect.x;
            target_Region.y = next_rect.y;
        }
    }

    return next_rect;
}

std::string MeanShift::FormatWithCommas(int value)
{
    std::stringstream ss;
    ss.imbue(std::locale(""));
    ss << std::fixed << value;
    return ss.str();
}

void MeanShift::printMatInt(std::string name, cv::Mat &input){
    cout << name << endl;
    for (int i =0; i < input.rows; i++){
        for (int j=0; j < input.cols; j++){
            cout << FormatWithCommas(input.at<int>(i,j)) << " ; ";
        }
        cout << endl;
    }
}

