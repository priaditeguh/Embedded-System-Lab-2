#ifndef MEANSHIFT_H
#define MEANSHIFT_H
#include <iostream>
#include <math.h>
#include "opencv2/core/core.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <iomanip>
#include <locale>
#include <arm_neon.h>
#include <pthread.h>

#define PI 3.1415926

class MeanShift
{
public:
    struct config{
        int num_bins;
        int piexl_range;
        int MaxIter;
    }cfg;

    cv::Rect target_Region;
    int bin_width;
    cv::Mat target_model;
    
    MeanShift();

    void  Init_target_frame(const cv::Mat &frame,const cv::Rect &rect, float normalized_C, cv::Mat kernel);

    float  Epanechnikov_kernel(cv::Mat &kernel);

    cv::Mat pdf_representation(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel);

    cv::Mat CalBinValue(const cv::Mat &frame, cv::Rect &rect);

    cv::Mat pdf_representation_part_top_opt(const cv::Rect &rect, cv::Mat kernel, cv::Mat bin_value, int length);

    cv::Mat pdf_representation_part_bottom_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel, int length);

    cv::Mat pdf_representation_part_top_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel, int length);
/**  
  *   @brief  Calculating pdf model for row of  
  *  
  *   @param  
  *     target_model     - Rectangle for tracking the car
  *     target_candidate - 
  *     rec           - result from Epanechnikov_kernel multiplied with normalized_C
  *     bin_value        - result from CalBinValue  
  *   @return 
  *     weight 
  */
    cv::Mat CalWeight_opt(cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec, cv::Mat bin_value);
};

#endif // MEANSHIFT_H
