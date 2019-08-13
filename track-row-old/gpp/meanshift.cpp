/*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/

#include "meanshift.h"

using namespace std;

MeanShift::MeanShift()
{
    cfg.MaxIter = 8; //1;//
    cfg.num_bins = 16;
    cfg.piexl_range = 256;
    bin_width = cfg.piexl_range / cfg.num_bins;
}

void  MeanShift::Init_target_frame(const cv::Mat &frame,const cv::Rect &rect, int normalized_C, cv::Mat kernel)
{
    target_Region = rect;
    target_model = pdf_representation_split(frame,target_Region,normalized_C, kernel);
}

void  MeanShift::Init_target_frame_float(const cv::Mat &frame,const cv::Rect &rect, float normalized_C, cv::Mat kernel)
{
    target_Region = rect;
    // priadi
    // target_model = pdf_representation_float(frame,target_Region,normalized_C, kernel); 
    target_model = pdf_representation_neon(frame,target_Region,normalized_C, kernel);
}

int  MeanShift::Epanechnikov_kernel_int(cv::Mat &kernel)
{
    int h = kernel.rows;
    int w = kernel.cols;
    float epanechnikov_cd = 0.1*PI*h*w;
    
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
        }
    }

    return kernel_sum;
}

float  MeanShift::Epanechnikov_kernel_float(cv::Mat &kernel)
{
    float h = kernel.rows;
    float w = kernel.cols;
    float epanechnikov_cd = 0.1*PI*h*w;
    
    float kernel_sum = 0.0;
    for(int i=0;i<h;i++)
    {
        for(int j=0;j<w;j++)
        {
            float x = static_cast<float>(i - h/2);
            float y = static_cast<float> (j - w/2);
            float norm_x = (x*x/(h*h/4)+y*y/(w*w/4));
            float result =norm_x < 1 ? (epanechnikov_cd*(1.0-norm_x)) : 0;
            kernel.at<float>(i,j) = static_cast<float>(result);
            kernel_sum += static_cast<float>(result);
        }
    }

    return kernel_sum;
}

cv::Mat MeanShift::pdf_representation_half_top_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(3,16,CV_32F,cv::Scalar(1e-10));
    int row_index = rect.y;
    int clo_index = rect.x;
    
    int height = rect.height/2;
    
    float* pdf_ptr;
    float* pdf_ptr_0 = pdf_model.ptr<float>(0);
    float* pdf_ptr_1 = pdf_model.ptr<float>(1);
    float* pdf_ptr_2 = pdf_model.ptr<float>(2);

    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    for(int i=0;i<height;i++)
    {
        // clo_index = rect.x;
        const uchar* data= frame.ptr<const uchar>(row_index);
        data += clo_index;// clo_index*3;
        
        float* kernel_ptr = kernel.ptr<float>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            bin_value[0] = (int)(*data/bin_width); data++;           
            bin_value[1] = (int)(*data/bin_width); data++;
            bin_value[2] = (int)(*data/bin_width); data++;
            
            float temp = *kernel_ptr * normalized_C;
            
             pdf_ptr = pdf_ptr_0 + bin_value[0];
             *pdf_ptr += temp; // *(pdf_ptr_0 + bin_value[0]) += temp;
            
             pdf_ptr = pdf_ptr_1 + bin_value[1];
             *pdf_ptr += temp; // *(pdf_ptr_1 + bin_value[1]) += temp;
            
             pdf_ptr = pdf_ptr_2 + bin_value[2];
             *pdf_ptr += temp; // *(pdf_ptr_2 + bin_value[2]) += temp;
            
            kernel_ptr++;
        }
        row_index++;
    }
    return pdf_model;
}

cv::Mat MeanShift::pdf_representation_half_bottom_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(3,16,CV_32F,cv::Scalar(1e-10));
    int row_index = rect.y + rect.height/2;
    int clo_index = rect.x;
    
    float* pdf_ptr;
    float* pdf_ptr_0 = pdf_model.ptr<float>(0);
    float* pdf_ptr_1 = pdf_model.ptr<float>(1);
    float* pdf_ptr_2 = pdf_model.ptr<float>(2);

    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    for(int i=rect.height/2;i<rect.height;i++)
    {
        // clo_index = rect.x;
        const uchar* data= frame.ptr<const uchar>(row_index);
        data += clo_index;// clo_index*3;
        
        float* kernel_ptr = kernel.ptr<float>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            bin_value[0] = (int)(*data/bin_width); data++;           
            bin_value[1] = (int)(*data/bin_width); data++;
            bin_value[2] = (int)(*data/bin_width); data++;
            
            float temp = *kernel_ptr * normalized_C;
            
             pdf_ptr = pdf_ptr_0 + bin_value[0];
             *pdf_ptr += temp; // *(pdf_ptr_0 + bin_value[0]) += temp;
            
             pdf_ptr = pdf_ptr_1 + bin_value[1];
             *pdf_ptr += temp; // *(pdf_ptr_1 + bin_value[1]) += temp;
            
             pdf_ptr = pdf_ptr_2 + bin_value[2];
             *pdf_ptr += temp; // *(pdf_ptr_2 + bin_value[2]) += temp;
            
            kernel_ptr++;
        }
        row_index++;
    }

    return pdf_model;
}

cv::Mat MeanShift::pdf_representation_half_top_int(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(3,16,CV_32S,cv::Scalar(1));
    int row_index = rect.y;
    int clo_index = rect.x;
    
    int* pdf_ptr;
    int* pdf_ptr_0 = pdf_model.ptr<int>(0);
    int* pdf_ptr_1 = pdf_model.ptr<int>(1);
    int* pdf_ptr_2 = pdf_model.ptr<int>(2);

    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    
    int height = rect.height/2;
    
    for(int i=0;i<height;i++)
    {
        // clo_index = rect.x;
        const uchar* data= frame.ptr<const uchar>(row_index);
        data += clo_index;// clo_index*3;
        
        int* kernel_ptr = kernel.ptr<int>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            bin_value[0] = (int)(*data/bin_width); data++;           
            bin_value[1] = (int)(*data/bin_width); data++;
            bin_value[2] = (int)(*data/bin_width); data++;
            
            // int temp = *kernel_ptr/1000 * normalized_C;
            int temp = *kernel_ptr * normalized_C;
            
             pdf_ptr = pdf_ptr_0 + bin_value[0];
             *pdf_ptr += temp; // *(pdf_ptr_0 + bin_value[0]) += temp;
            
             pdf_ptr = pdf_ptr_1 + bin_value[1];
             *pdf_ptr += temp; // *(pdf_ptr_1 + bin_value[1]) += temp;
            
             pdf_ptr = pdf_ptr_2 + bin_value[2];
             *pdf_ptr += temp; // *(pdf_ptr_2 + bin_value[2]) += temp;
            
            kernel_ptr++;
        }
        row_index++;
    }

    return pdf_model;
}

cv::Mat MeanShift::pdf_representation_half_bottom_int(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(3,16,CV_32S,cv::Scalar(1));

    int row_index = rect.y + rect.height/2;
    int clo_index = rect.x;
    
    int* pdf_ptr;
    int* pdf_ptr_0 = pdf_model.ptr<int>(0);
    int* pdf_ptr_1 = pdf_model.ptr<int>(1);
    int* pdf_ptr_2 = pdf_model.ptr<int>(2);

    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    
    int height = rect.height/2;
    
    cout << "pdf_representation_half_bottom_int" << endl;
    int index = 0;
    for(int i=height;i<rect.height;i++)
    {
        // clo_index = rect.x;
        const uchar* data= frame.ptr<const uchar>(row_index);
        data += clo_index;// clo_index*3;
        
        int* kernel_ptr = kernel.ptr<int>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            bin_value[0] = (int)(*data/bin_width); data++;           
            bin_value[1] = (int)(*data/bin_width); data++;
            bin_value[2] = (int)(*data/bin_width); data++;
            
            // int temp = *kernel_ptr/1000 * normalized_C;
            int temp = *kernel_ptr * normalized_C;
            
             pdf_ptr = pdf_ptr_0 + bin_value[0];
             *pdf_ptr += temp; // *(pdf_ptr_0 + bin_value[0]) += temp;
            
             pdf_ptr = pdf_ptr_1 + bin_value[1];
             *pdf_ptr += temp; // *(pdf_ptr_1 + bin_value[1]) += temp;
            
             pdf_ptr = pdf_ptr_2 + bin_value[2];
             *pdf_ptr += temp; // *(pdf_ptr_2 + bin_value[2]) += temp;
            
            // if (index < 100) 
            //     cout << bin_value[0] << " " << bin_value[1] << " " << bin_value[2] << endl;
            // index++;

            kernel_ptr++;
        }
        row_index++;
    }

    return pdf_model;
}

cv::Mat MeanShift::pdf_representation_half_bottom_buffer(uint8_t * dataBuffer, const cv::Rect &rect, int normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(3,16,CV_32S,cv::Scalar(1));

    int row_index = rect.y + rect.height/2;
    int clo_index = rect.x;
    
    int* pdf_ptr;
    int* pdf_ptr_0 = pdf_model.ptr<int>(0);
    int* pdf_ptr_1 = pdf_model.ptr<int>(1);
    int* pdf_ptr_2 = pdf_model.ptr<int>(2);

    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    
    int height = rect.height/2;
    int index = 0;
    
    for(int i=height;i<rect.height;i++)
    {
        // clo_index = rect.x;
        // const uchar* data= frame.ptr<const uchar>(row_index);
        // data += clo_index;// clo_index*3;
        
        int* kernel_ptr = kernel.ptr<int>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            bin_value[0] = (int)(dataBuffer[index++]/bin_width);
            bin_value[1] = (int)(dataBuffer[index++]/bin_width);
            bin_value[2] = (int)(dataBuffer[index++]/bin_width);
            
            // int temp = *kernel_ptr/1000 * normalized_C;
            int temp = *kernel_ptr * normalized_C;
            
             pdf_ptr = pdf_ptr_0 + bin_value[0];
             *pdf_ptr += temp; // *(pdf_ptr_0 + bin_value[0]) += temp;
            
             pdf_ptr = pdf_ptr_1 + bin_value[1];
             *pdf_ptr += temp; // *(pdf_ptr_1 + bin_value[1]) += temp;
            
             pdf_ptr = pdf_ptr_2 + bin_value[2];
             *pdf_ptr += temp; // *(pdf_ptr_2 + bin_value[2]) += temp;
            
            kernel_ptr++;
        }
        row_index++;
    }

    return pdf_model;
}

cv::Mat MeanShift::pdf_representation_int(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(3,16,CV_32S,cv::Scalar(1));

    pdf_representation0(frame, rect, normalized_C, kernel, pdf_model);
    pdf_representation1(frame, rect, normalized_C, kernel, pdf_model);
    pdf_representation2(frame, rect, normalized_C, kernel, pdf_model);    

    return pdf_model;
}

cv::Mat MeanShift::pdf_representation_split(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(8,16,CV_32S,cv::Scalar(1));

    pdf_representation0(frame, rect, normalized_C, kernel, pdf_model);
    pdf_representation1(frame, rect, normalized_C, kernel, pdf_model);
    pdf_representation2(frame, rect, normalized_C, kernel, pdf_model);    

    return pdf_model;
}


void MeanShift::pdf_representation0(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel, cv::Mat &pdf_model)
{
    cv::Vec3i curr_pixel_value;
    int bin_value;

    int row_index = rect.y;
    int clo_index = rect.x;

    for(int i=0;i<rect.height;i++)
    {
        clo_index = rect.x;
        for(int j=0;j<rect.width;j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(row_index,clo_index);
            bin_value = (curr_pixel_value[0]/bin_width);
            
            pdf_model.at<int>(0,bin_value) += kernel.at<int>(i,j)/1000*normalized_C;
            clo_index++;
        }
        row_index++;
    }
}

void MeanShift::pdf_representation1(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel, cv::Mat &pdf_model)
{
    cv::Vec3i curr_pixel_value;
    int bin_value;

    int row_index = rect.y;
    int clo_index = rect.x;

    for(int i=0;i<rect.height;i++)
    {
        clo_index = rect.x;
        for(int j=0;j<rect.width;j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(row_index,clo_index);
            bin_value = (curr_pixel_value[1]/bin_width);
            
            pdf_model.at<int>(1,bin_value) += kernel.at<int>(i,j)/1000*normalized_C;
            clo_index++;
        }
        row_index++;
    }
}

void MeanShift::pdf_representation2(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel, cv::Mat &pdf_model)
{
    cv::Vec3i curr_pixel_value;
    int bin_value;

    int row_index = rect.y;
    int clo_index = rect.x;

    for(int i=0;i<rect.height;i++)
    {
        clo_index = rect.x;
        for(int j=0;j<rect.width;j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(row_index,clo_index);
            bin_value = (curr_pixel_value[2]/bin_width);
            
            pdf_model.at<int>(2,bin_value) += kernel.at<int>(i,j)/1000*normalized_C;
            clo_index++;
        }
        row_index++;
    }
}

cv::Mat MeanShift::CalWeight_float(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec)
{
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));
    std::vector<cv::Mat> bgr_planes;
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
                col_index++;
            }
            row_index++;
        }
    }

    return weight;
}

cv::Mat MeanShift::CalWeight_split(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec)
{
    int rows = rec.height;
    int cols = rec.width;

    cv::Mat weight(rows,cols,CV_32S,cv::Scalar(1));
    CalWeight0(frame, target_model, target_candidate, rec, weight);
    CalWeight1(frame, target_model, target_candidate, rec, weight);
    CalWeight2(frame, target_model, target_candidate, rec, weight);
 
    return weight;
}

void MeanShift::CalWeight0(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec, cv::Mat &weight)
{
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    vector<cv::Mat> bgr_planes;
    cv::split(frame, bgr_planes);

    row_index = rec.y;
    for(int i=0;i<rows;i++)
    {
        col_index = rec.x;
        for(int j=0;j<cols;j++)
        {
            int curr_pixel = (bgr_planes[0].at<uchar>(row_index,col_index));
            int bin_value = curr_pixel/bin_width;
            weight.at<int>(i,j) *= static_cast<int>(100 * 
                (sqrt(target_model.at<int>(0, bin_value)) /
                    sqrt(target_candidate.at<int>(0, bin_value))));
            col_index++;
        }
        row_index++;
    }
}

void MeanShift::CalWeight1(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec, cv::Mat &weight)
{
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    vector<cv::Mat> bgr_planes;
    cv::split(frame, bgr_planes);

    row_index = rec.y;
    for(int i=0;i<rows;i++)
    {
        col_index = rec.x;
        for(int j=0;j<cols;j++)
        {
            int curr_pixel = (bgr_planes[1].at<uchar>(row_index,col_index));
            int bin_value = curr_pixel/bin_width;
            weight.at<int>(i,j) *= static_cast<int>(100 * 
                (sqrt(target_model.at<int>(1, bin_value)) /
                    sqrt(target_candidate.at<int>(1, bin_value))));
            col_index++;
        }
        row_index++;
    }
}

void MeanShift::CalWeight2(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec, cv::Mat &weight)
{
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    vector<cv::Mat> bgr_planes;
    cv::split(frame, bgr_planes);

    row_index = rec.y;
    for(int i=0;i<rows;i++)
    {
        col_index = rec.x;
        for(int j=0;j<cols;j++)
        {
            int curr_pixel = (bgr_planes[2].at<uchar>(row_index,col_index));
            int bin_value = curr_pixel/bin_width;
            weight.at<int>(i,j) *= static_cast<int>(100 * 
                (sqrt(target_model.at<int>(2, bin_value)) /
                    sqrt(target_candidate.at<int>(2, bin_value))));
            col_index++;
        }
        row_index++;
    }
}

cv::Rect MeanShift::track_float(const cv::Mat &next_frame, int normalized_C, cv::Mat kernel)
{
    cv::Rect next_rect;
    for(int iter=0;iter<cfg.MaxIter;iter++)
    {
        cv::Mat target_candidate = pdf_representation_split(next_frame,target_Region, normalized_C, kernel);
        
        cv::Mat weight = CalWeight(next_frame,target_model,target_candidate,target_Region);
        
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
                int w = weight.at<int>(i,j);
                int wmult = w*mult;
                float d_x = norm_j*wmult/1000000;
                float d_y = norm_i*wmult/1000000;
                float d_w = wmult/1000000;
                delta_x += static_cast<float>(d_x);
                delta_y += static_cast<float>(d_y);
                sum_wij += static_cast<float>(d_w);
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

cv::Mat MeanShift::pdf_representation_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(3,16,CV_32F,cv::Scalar(1e-10));

    int row_index = rect.y;
    int clo_index = rect.x;
    
    float* pdf_ptr;
    float* pdf_ptr_0 = pdf_model.ptr<float>(0);
    float* pdf_ptr_1 = pdf_model.ptr<float>(1);
    float* pdf_ptr_2 = pdf_model.ptr<float>(2);
    
    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    for(int i=0;i<rect.height;i++)
    {
        // clo_index = rect.x;
        const uchar* data= frame.ptr<const uchar>(row_index);
        data += clo_index;// clo_index*3;
        
        float* kernel_ptr = kernel.ptr<float>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            bin_value[0] = (int)(*data/bin_width); data++;           
            bin_value[1] = (int)(*data/bin_width); data++;
            bin_value[2] = (int)(*data/bin_width); data++;
            
            float temp = *kernel_ptr * normalized_C;
            
            pdf_ptr = pdf_ptr_0 + bin_value[0];
            *pdf_ptr += temp; // *(pdf_ptr_0 + bin_value[0]) += temp;

            pdf_ptr = pdf_ptr_1 + bin_value[1];
            *pdf_ptr += temp; // *(pdf_ptr_1 + bin_value[1]) += temp;

            pdf_ptr = pdf_ptr_2 + bin_value[2];
            *pdf_ptr += temp; // *(pdf_ptr_2 + bin_value[2]) += temp;

            kernel_ptr++;
        }
        row_index++;
    }
    
    return pdf_model;
}

cv::Mat MeanShift::pdf_representation_neon(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel)
{
    cv::Mat pdf_model(3,16,CV_32F,cv::Scalar(1e-10));

    int row_index = rect.y;
    int clo_index = rect.x;
    
    float* pdf_ptr;
    float* pdf_ptr_0 = pdf_model.ptr<float>(0);
    float* pdf_ptr_1 = pdf_model.ptr<float>(1);
    float* pdf_ptr_2 = pdf_model.ptr<float>(2);
    
    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    for(int i=0;i<rect.height;i++)
    {
        // clo_index = rect.x;
        const uchar* data= frame.ptr<const uchar>(row_index);
        data += clo_index;// clo_index*3;
        
        float* kernel_ptr = kernel.ptr<float>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            bin_value[0] = (int)(*data/bin_width); data++;           
            bin_value[1] = (int)(*data/bin_width); data++;
            bin_value[2] = (int)(*data/bin_width); data++;
            
            float temp = *kernel_ptr * normalized_C;
            
            pdf_ptr = pdf_ptr_0 + bin_value[0];
            *pdf_ptr += temp; // *(pdf_ptr_0 + bin_value[0]) += temp;

            pdf_ptr = pdf_ptr_1 + bin_value[1];
            *pdf_ptr += temp; // *(pdf_ptr_1 + bin_value[1]) += temp;

            pdf_ptr = pdf_ptr_2 + bin_value[2];
            *pdf_ptr += temp; // *(pdf_ptr_2 + bin_value[2]) += temp;

            kernel_ptr++;
        }
        row_index++;
    }
    
    return pdf_model;
}

void MeanShift::pdf_representation_neon_12(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel, cv::Mat &pdf_model)
{
    int row_index = rect.y;
    int clo_index = rect.x;
    
    float* pdf_ptr;
    float* pdf_ptr_1 = pdf_model.ptr<float>(1);
    float* pdf_ptr_2 = pdf_model.ptr<float>(2);
    
    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    for(int i=0;i<rect.height;i++)
    {
        // clo_index = rect.x;
        const uchar* data= frame.ptr<const uchar>(row_index);
        data += clo_index;// clo_index*3;
        
        float* kernel_ptr = kernel.ptr<float>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            bin_value[1] = (int)(*data/bin_width); data++;
            bin_value[2] = (int)(*data/bin_width); data++;
            
            float temp = *kernel_ptr * normalized_C;
            
            pdf_ptr = pdf_ptr_1 + bin_value[1];
            *pdf_ptr += temp; // *(pdf_ptr_1 + bin_value[1]) += temp;

            pdf_ptr = pdf_ptr_2 + bin_value[2];
            *pdf_ptr += temp; // *(pdf_ptr_2 + bin_value[2]) += temp;

            kernel_ptr++;
        }
        row_index++;
    }
}

cv::Mat MeanShift::CalWeight_neon(const cv::Mat &frame, cv::Mat &target_model,
                    cv::Mat &target_candidate, cv::Rect &rec)//, cv::Mat &weight)
{
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));
    
    float32x4_t bin_width_4 = vmovq_n_f32(bin_width);// {bin_width,bin_width,bin_width,bin_width};
    float32x4_t reciprocal = vrecpeq_f32(bin_width_4);
    reciprocal = vmulq_f32(vrecpsq_f32(bin_width_4, reciprocal), reciprocal);
        
    col_index = col_index*3;
    for(int k = 0; k < 3;  k++)
    {
        float* target_model_ptr = target_model.ptr<float>(k);
        float* target_candidate_ptr = target_candidate.ptr<float>(k);
        row_index = rec.y;
        for(int i=0;i<rows;i++)
        {
            // col_index = rec.x;            
            const uchar* data = frame.ptr<const uchar>(row_index);
            float32_t* weight_ptr = (float32_t*)(weight.ptr<float>(i));
            // data += k + col_index*3;        
            data += k + col_index;        
            
            for(int j=0;j<cols;j+=4)
            {
                float curr_pixel_1 = *data; data += 3; // int curr_pixel_1 = *data; data += 3; // 
                float curr_pixel_2 = *data; data += 3; // int curr_pixel_2 = *data; data += 3; //
                float curr_pixel_3 = *data; data += 3; // int curr_pixel_3 = *data; data += 3; // 
                float curr_pixel_4 = *data; data += 3; // int curr_pixel_4 = *data; data += 3; // 
                
                float32x4_t curr_pix = {curr_pixel_1,curr_pixel_2,curr_pixel_3,curr_pixel_4};
                
                float32x4_t temp_ = reciprocal; // int32x4_t temp_ = reciprocal_i; // 
                float32x4_t result = vmulq_f32(curr_pix,temp_); //int32x4_t bin_value = vmulq_s32(curr_pix,temp_); // 

                int32x4_t bin_value = vcvtq_s32_f32(result);

                float32x4_t load_model = {*(target_model_ptr+vgetq_lane_s32(bin_value,0)),*(target_model_ptr+vgetq_lane_s32(bin_value,1)),*(target_model_ptr+vgetq_lane_s32(bin_value,2)),*(target_model_ptr+vgetq_lane_s32(bin_value,3))};
                float32x4_t load_candidate = {*(target_candidate_ptr+vgetq_lane_s32(bin_value,0)),*(target_candidate_ptr+vgetq_lane_s32(bin_value,1)),*(target_candidate_ptr+vgetq_lane_s32(bin_value,2)),*(target_candidate_ptr+vgetq_lane_s32(bin_value,3))};
                
                float32x4_t reciprocal2 = vrecpeq_f32(load_candidate);
                reciprocal2 = vmulq_f32(vrecpsq_f32(load_candidate, reciprocal2), reciprocal2);
                float32x4_t temp = vmulq_f32(load_model,reciprocal2);
                float32x4_t gg = temp;

                float32x4_t sqrt_reciprocal = vrsqrteq_f32(temp);
                float32x4_t temp_2 = vmulq_f32(vrsqrtsq_f32(vmulq_f32(gg,sqrt_reciprocal), sqrt_reciprocal),sqrt_reciprocal);
                float32x4_t temp_3 = vmulq_f32(temp_2,gg);

                float32x4_t weight_2 = vld1q_f32(weight_ptr);
                float32x4_t result2 = vmulq_f32(temp_3,weight_2);

                vst1q_f32(weight_ptr,result2);
                weight_ptr+=4;
            }
            row_index++;
        }
    }
    return weight;
}

cv::Mat MeanShift::CalWeight_buffer(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec, uint8_t *dataBuffer)
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
                if (k == 0) {
                    int val = (int) (dataBuffer[bin_value*4] << 24 | dataBuffer[bin_value*4+1] << 16 | dataBuffer[bin_value*4+2] << 8 | dataBuffer[bin_value*4+3]);
                    weight.at<int>(i,j) *= static_cast<int>(100 * 
                        (sqrt(target_model.at<int>(k, bin_value)) /
                            sqrt(val)));
                } else {
                    weight.at<int>(i,j) *= static_cast<int>(100 * 
                        (sqrt(target_model.at<int>(k, bin_value)) /
                            sqrt(target_candidate.at<int>(k, bin_value))));
                }
                col_index++;
            }
            row_index++;
        }
    }

    return weight;
}