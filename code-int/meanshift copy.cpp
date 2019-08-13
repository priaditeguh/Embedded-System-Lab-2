/*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/

#include "meanshift.h"

using namespace std;

#define multiplier 1000000

MeanShift::MeanShift()
{
    cfg.MaxIter = 8;
    cfg.num_bins = 16;
    cfg.piexl_range = 256;
    bin_width = cfg.piexl_range / cfg.num_bins;
}

void  MeanShift::Init_target_frame(const cv::Mat &frame,const cv::Rect &rect)
{
    target_Region = rect;
    target_model = pdf_representation(frame,target_Region);
}

// float  MeanShift::Epanechnikov_kernel(cv::Mat &kernel)
int  MeanShift::Epanechnikov_kernel(cv::Mat &kernel)
{
    int h = kernel.rows;
    int w = kernel.cols;
    // cout << "h " << h << " w " << w << endl;

    // float epanechnikov_cd = 0.1*PI*h*w;
    // float kernel_sum = 0.0;
    // int epanechnikov_cd = (PI2*h*w);
    int epanechnikov_cd = 31.415926*58*86;
    // int epanechnikov_cd1 = (PI*h*w);
    // int epanechnikov_cd2 = (PI*h*w*0.1);
    // int epanechnikov_cd3 = (PI*h*w*0.1);
    // float epanechnikov_cd4 = 0.1*PI*h*w;
    // float epanechnikov_cd5 = 0.1*PI2*h*w;
    // int epanechnikov_cd6 = 0.1*PI2*h*w;
    cout << "epanechnikov_cd " << epanechnikov_cd << endl;
    // cout << "epanechnikov_cd1 " << epanechnikov_cd1 << endl;
    // cout << "epanechnikov_cd2 " << epanechnikov_cd2 << endl;
    // cout << "epanechnikov_cd3 " << epanechnikov_cd3 << endl;
    // cout << "epanechnikov_cd4 " << epanechnikov_cd4 << endl;
    // cout << "epanechnikov_cd5 " << epanechnikov_cd5 << endl;
    // cout << "epanechnikov_cd6 " << epanechnikov_cd6 << endl;

    int64_t kernel_sum = 0;

    for(int i=0;i<h;i++)
    {
        for(int j=0;j<w;j++)
        {
            // float x = static_cast<float>(i - h/2);
            // float y = static_cast<float> (j - w/2);
            // float norm_x = x*x/(h*h/4)+y*y/(w*w/4);
            // float result =norm_x<1?(epanechnikov_cd*(1.0-norm_x)):0;
            // kernel.at<float>(i,j) = result;
            // kernel_sum += result;
            int x = (i - h/2);
            int y = (j - w/2);
            int norm_x = x*x*multiplier / (h*h/4) + y*y*multiplier / (w*w/4);
            
            int result;
            if (norm_x < multiplier) { 
                result = epanechnikov_cd/1000 * (multiplier-norm_x)/1000  ;
            } else {
                result = 0;
            }
            
            kernel.at<int>(i,j) = result;
            kernel_sum += result;
            // cout << "x " << x << " y " << y << " norm_x " << norm_x << " result " << result << " kernel_sum " << kernel_sum << endl;
        }
    }
    // cout << "kernel_sum " << kernel_sum << endl;
    return kernel_sum;
}
cv::Mat MeanShift::pdf_representation(const cv::Mat &frame, const cv::Rect &rect)
{
    cv::Mat kernel(rect.height,rect.width,CV_32S,cv::Scalar(0));
    int ep = Epanechnikov_kernel(kernel); // kelipatan 100
    int64_t normalized_C = multiplier * 1000 / ep ; 

    cv::Mat pdf_model(8,16,CV_32S,cv::Scalar(1));

    cv::Vec3i curr_pixel_value;
    cv::Vec3i bin_value;

    // cout << "bin_width " << bin_width << endl;
    cout << "Epanechnikov_kernel " << ep << endl;
    cout << "normalized_C " << normalized_C << endl;

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
            cout << "bin_value " << bin_value[0] << ", " << bin_value[1] << ", " << bin_value[2] << endl;
            cout << "kernel " << kernel.at<int>(i,j) << endl;
            
            pdf_model.at<int>(0,bin_value[0]) += kernel.at<int>(i,j)*normalized_C;
            pdf_model.at<int>(1,bin_value[1]) += kernel.at<int>(i,j)*normalized_C;
            pdf_model.at<int>(2,bin_value[2]) += kernel.at<int>(i,j)*normalized_C;
            cout << "pdf_model " << pdf_model.at<int>(0,bin_value[0]) << ", " << pdf_model.at<int>(1,bin_value[1]) << ", " << pdf_model.at<int>(2,bin_value[2]) << endl;
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

    cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));
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
                weight.at<float>(i,j) *= static_cast<float>((sqrt(target_model.at<float>(k, bin_value)/target_candidate.at<float>(k, bin_value))));
                col_index++;
            }
            row_index++;
        }
    }

    return weight;
}

cv::Rect MeanShift::track(const cv::Mat &next_frame)
{
    cv::Rect next_rect;
    for(int iter=0;iter<cfg.MaxIter;iter++)
    {
        cv::Mat target_candidate = pdf_representation(next_frame,target_Region);
        // cout << "target_candidate = " << target_candidate.rows << ", " << target_candidate.cols << endl << " "  << target_candidate << endl << endl;
        // cout << "target_Region = " << endl << " "  << target_Region << endl << endl;
        // cout << "target_model = " << target_model.rows << ", " << target_model.cols << endl << " "  << target_model << endl << endl;
        cv::Mat weight = CalWeight(next_frame,target_model,target_candidate,target_Region);
        // cout << "weight " << weight.rows << ", " << weight.cols << endl;
        float delta_x = 0.0;
        float sum_wij = 0.0;
        float delta_y = 0.0;
        float centre = static_cast<float>((weight.rows-1)/2.0);
        double mult = 0.0;

        next_rect.x = target_Region.x;
        next_rect.y = target_Region.y;
        next_rect.width = target_Region.width;
        next_rect.height = target_Region.height;

        for(int i=0;i<weight.rows;i++)
        {
            for(int j=0;j<weight.cols;j++)
            {
                float norm_i = static_cast<float>(i-centre)/centre;
                float norm_j = static_cast<float>(j-centre)/centre;
                mult = pow(norm_i,2)+pow(norm_j,2)>1.0?0.0:1.0;
                delta_x += static_cast<float>(norm_j*weight.at<float>(i,j)*mult);
                delta_y += static_cast<float>(norm_i*weight.at<float>(i,j)*mult);
                sum_wij += static_cast<float>(weight.at<float>(i,j)*mult);
            }
        }

        next_rect.x += static_cast<int>((delta_x/sum_wij)*centre);
        next_rect.y += static_cast<int>((delta_y/sum_wij)*centre);

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


