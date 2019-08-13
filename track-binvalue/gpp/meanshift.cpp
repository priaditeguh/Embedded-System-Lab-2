/*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/

#include "meanshift.h"

using namespace std;

MeanShift::MeanShift()
{
    cfg.MaxIter = 8;
    cfg.num_bins = 16;
    cfg.piexl_range = 256;
    bin_width = cfg.piexl_range / cfg.num_bins;
}

void  MeanShift::Init_target_frame(const cv::Mat &frame,const cv::Rect &rect, float normalized_C, cv::Mat kernel)
{
    target_Region = rect;
    target_model = pdf_representation(frame,target_Region,normalized_C, kernel);
}

float  MeanShift::Epanechnikov_kernel(cv::Mat &kernel)
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

cv::Mat MeanShift::pdf_representation(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel)
{
  /**  
  *   @brief  Calculating pdf model for row of  
  *  
  *   @param  
  *     frame          - Single frame of a video
  *     rect           - Rectangle for tracking the car
  *     kernel         - result from Epanechnikov_kernel multiplied with normalized_C
  *     normalized_C   - 1/sum of kernel elements
  *   @return 
  *     pdf model reference
  */  

    cv::Mat pdf_model(3,16,CV_32F,cv::Scalar(1e-10));

    int row_index = rect.y;
    int clo_index = rect.x;
    
    // storing the pointer of pdf_model for each row
    float* pdf_ptr;
    float* pdf_ptr_0 = pdf_model.ptr<float>(0);
    float* pdf_ptr_1 = pdf_model.ptr<float>(1);
    float* pdf_ptr_2 = pdf_model.ptr<float>(2);

    cv::Vec3i bin_value;
    
    clo_index = clo_index*3; // multiplied by because of 3 channel image 
    for(int i=0;i<rect.height;i++)
    {
        // store the address of frame row 
        const uchar* data= frame.ptr<const uchar>(row_index);
        
        // the address is added with clo_index to point to desired x position
        data += clo_index;
        
        // store the address of kernel row
        float* kernel_ptr = kernel.ptr<float>(i);
        
        for(int j=0;j<rect.width;j++)
        {
            // divide the blue-gree-red pixel value with bin_width
            bin_value[0] = (int)(*data/bin_width); data++;           
            bin_value[1] = (int)(*data/bin_width); data++;
            bin_value[2] = (int)(*data/bin_width); data++;
            
            float temp = *kernel_ptr * normalized_C;
            
            // update the pdf_model at row 0, column bin_value[0]
            pdf_ptr = pdf_ptr_0 + bin_value[0];
            *pdf_ptr += temp; 
            
            // update the pdf_model at row 1, column bin_value[1]
            pdf_ptr = pdf_ptr_1 + bin_value[1];
            *pdf_ptr += temp; 
            
            // update the pdf_model at row 2, column bin_value[2]
            pdf_ptr = pdf_ptr_2 + bin_value[2];
            *pdf_ptr += temp; 

            kernel_ptr++;
        }
        row_index++;
    }
    
    return pdf_model;
}

cv::Mat MeanShift::CalBinValue(const cv::Mat &frame, cv::Rect &rect)
{
  /**  
  *   @brief  Calculating Bin Value  
  *  
  *   @param  
  *     frame  - Single frame of a video
  *     rect   - Rectangle for tracking the car
  *   @return 
  *     Matrix of bin value
  */  
    
    // store the rectangle parameter
    int row_index = rect.y;
    int clo_index = rect.x * 3; // multiplied by because of 3 channel image    
    int width = rect.width;
    int height = rect.height;
    
    cv::Mat bin_value(height,width*3,CV_8U,cv::Scalar(0));
         
    for(int i=0;i<height;i++)
    {
        // store the first element address of tracking rectangle 
        const uchar* pixel_ptr= frame.ptr<const uchar>(row_index) + clo_index;       
        
        // store the bin_value row pointer 
        uchar* bin_value_ptr = bin_value.ptr<uchar>(i);
        
        for(int j=0;j<width;j++)
        {
            // update bin_value at blue channel
            *bin_value_ptr = (*pixel_ptr/bin_width);
            pixel_ptr++; bin_value_ptr++;          
            
            // update bin_value at green channel
            *bin_value_ptr = (*pixel_ptr/bin_width); 
            pixel_ptr++; bin_value_ptr++;
            
            // update bin_value at red channel  
            *bin_value_ptr = (*pixel_ptr/bin_width);
            pixel_ptr++; bin_value_ptr++;
        }
        row_index++;
    }
      
    return bin_value;    
}

cv::Mat MeanShift::pdf_representation_part_top_opt(const cv::Rect &rect, cv::Mat normalized_kernel, cv::Mat bin_value, int length)
{
  /**  
  *   @brief  Calculating pdf model for row of  
  *  
  *   @param  
  *     rect                - Rectangle for tracking the car
  *     normalized_kernel   - result from Epanechnikov_kernel multiplied with normalized_C
  *     bin_value           - result from CalBinValue
  *     length              - total row that are computed in the ARM side    
  *   @return 
  *     pdf model
  */  
  
    cv::Mat pdf_model(3,16,CV_32F,cv::Scalar(1e-10));
    
    // storing the pointer of each row of pdf_model
    float* pdf_ptr_0 = pdf_model.ptr<float>(0);
    float* pdf_ptr_1 = pdf_model.ptr<float>(1);
    float* pdf_ptr_2 = pdf_model.ptr<float>(2);
    
    // multiply the input row with width rectangle
    int maxIter = length*rect.width;
    
    // store the first element address of kernel    
    float* kernel_ptr = normalized_kernel.ptr<float>(0); // assuming the address of bin_value is continuous
    
    // store the first element address of bin_value    
    uchar* bin_value_ptr = bin_value.ptr<uchar>(0); // assuming the address of bin_value is continuous
  
    for(int i=0;i<maxIter;i++)
    {  
       // update the pdf_model at row 0, column bin_value[0]         
       *(pdf_ptr_0 + *bin_value_ptr) += *(kernel_ptr); 
       bin_value_ptr++;
       
       // update the pdf_model at row 1, column bin_value[1]
       *(pdf_ptr_1 + *bin_value_ptr) += *(kernel_ptr); 
       bin_value_ptr++;
       
       // update the pdf_model at row 2, column bin_value[2]
       *(pdf_ptr_2 + *bin_value_ptr) += *(kernel_ptr);             
       bin_value_ptr++;
       
       kernel_ptr++;                    
    }
    return pdf_model;
}

cv::Mat MeanShift::CalWeight_opt(cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec, cv::Mat bin_value)
{
  /**  
  *   @brief  Calculating weight
  *  
  *   @param  
  *     target_model     - matrix model reference for the tracking
  *     target_candidate - matrix candidate for the tracking
  *     rec              - red rectangle of the tracked object
  *     bin_value        - result from CalBinValue  
  *   @return 
  *     weight 
  */
    
    // store the rectangle parameter
    int rows = rec.height;
    int cols = rec.width;

    cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));
    
    // store bin_widht into vector 4 elements
    float32x4_t bin_width_4 = vmovq_n_f32(bin_width);
    
    // estimate division : 1/bin_widhth 
    float32x4_t reciprocal = vrecpeq_f32(bin_width_4);
    reciprocal = vmulq_f32(vrecpsq_f32(bin_width_4, reciprocal), reciprocal);
        
    int maxIter = rows*cols;    

    for(int k = 0; k < 3;  k++)
    {
        // store the address of first element of bin_value 
        uchar* bin_value_ptr = bin_value.ptr<uchar>(0);
        // increment to point to k channel
        bin_value_ptr += k;
        
        // store the first element of row k from target model 
        float* target_model_ptr = target_model.ptr<float>(k);
        
        // store the first element of row k from target candidate        
        float* target_candidate_ptr = target_candidate.ptr<float>(k);
        
        // store the address of first element of weight 
        float* weight_ptr = (weight.ptr<float>(0));     
            
        for(int j=0;j<maxIter;j+=4)
        {
            // load the target_model by adding its pointer with bin_value
            float32x4_t load_model = {*(target_model_ptr + bin_value_ptr[0]),*(target_model_ptr + bin_value_ptr[3]),*(target_model_ptr + bin_value_ptr[6]),*(target_model_ptr + bin_value_ptr[9])};

            // load the target_candidate by adding its pointer with bin_value            
            float32x4_t load_candidate = {*(target_candidate_ptr + bin_value_ptr[0]),*(target_candidate_ptr + bin_value_ptr[3]),*(target_candidate_ptr + bin_value_ptr[6]),*(target_candidate_ptr + bin_value_ptr[9])};
            
            bin_value_ptr+=12;
            
            // target_model is divide with target_candidate
            float32x4_t reciprocal2 = vrecpeq_f32(load_candidate);
            reciprocal2 = vmulq_f32(vrecpsq_f32(load_candidate, reciprocal2), reciprocal2);
            float32x4_t temp = vmulq_f32(load_model,reciprocal2);
            float32x4_t gg = temp;
            
            // square root the division result
            float32x4_t sqrt_reciprocal = vrsqrteq_f32(temp);
            float32x4_t temp_2 = vmulq_f32(vrsqrtsq_f32(vmulq_f32(gg,sqrt_reciprocal), sqrt_reciprocal),sqrt_reciprocal);
            float32x4_t temp_3 = vmulq_f32(temp_2,gg);

            // multiply weight with the result from square root
            float32x4_t weight_2 = vld1q_f32((float32_t*)weight_ptr);
            float32x4_t result2 = vmulq_f32(temp_3,weight_2);
            
            // store the result back to weight 
            vst1q_f32((float32_t*)weight_ptr,result2);
            weight_ptr+=4;
        }
    }
    
    return weight;
}

cv::Mat MeanShift::pdf_representation_part_bottom_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel, int length)
{
    cv::Mat pdf_model(3,16,CV_32F,cv::Scalar(1e-10));
    int row_index = rect.y + rect.height - length;
    int clo_index = rect.x;
    
    float* pdf_ptr;
    float* pdf_ptr_0 = pdf_model.ptr<float>(0);
    float* pdf_ptr_1 = pdf_model.ptr<float>(1);
    float* pdf_ptr_2 = pdf_model.ptr<float>(2);

    clo_index = clo_index*3;
    cv::Vec3i bin_value;    
    // cout << "pdf_representation_half_bottom_float" << endl;
    for(int i=rect.height-length;i<rect.height;i++)
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

cv::Mat MeanShift::pdf_representation_part_top_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel, int length)
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
    // cout << "pdf_representation_half_bottom_float" << endl;
    for(int i=0;i<length;i++)
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