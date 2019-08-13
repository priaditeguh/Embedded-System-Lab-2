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
#define PI2 31.415926

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
    void Init_target_frame(const cv::Mat &frame,const cv::Rect &rect, int normalized_C, cv::Mat kernel);
    void Init_target_frame_float(const cv::Mat &frame,const cv::Rect &rect, float normalized_C, cv::Mat kernel);
    int Epanechnikov_kernel_int(cv::Mat &kernel);
    float Epanechnikov_kernel_float(cv::Mat &kernel);
    
    // priadi
    cv::Mat pdf_representation_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel); 
    cv::Mat pdf_representation_int(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel);
    cv::Mat pdf_representation_half_top_int(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel);
    cv::Mat pdf_representation_half_bottom_int(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel);
    cv::Mat pdf_representation_half_top_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel);
    cv::Mat pdf_representation_half_bottom_float(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel);
    cv::Mat pdf_representation_half_bottom_buffer(uint8_t * dataBuffer, const cv::Rect &rect, int normalized_C, cv::Mat kernel);
    cv::Mat pdf_representation_neon(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel);
    cv::Mat CalWeight_float(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec);    
    
    
    cv::Mat pdf_representation_split(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel);
    void pdf_representation0(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel, cv::Mat &pdf_model);
    void pdf_representation1(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel, cv::Mat &pdf_model);
    void pdf_representation2(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel, cv::Mat &pdf_model);
    void pdf_representation_neon(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel, cv::Mat &pdf_model);
    void pdf_representation_neon_12(const cv::Mat &frame, const cv::Rect &rect, float normalized_C, cv::Mat kernel, cv::Mat &pdf_model);
    
    cv::Mat CalWeight(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec);
    cv::Mat CalWeight_split(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec);
    void CalWeight0(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec, cv::Mat &weight);
    void CalWeight1(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec, cv::Mat &weight);
    void CalWeight2(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec, cv::Mat &weight);
    cv::Mat CalWeight_neon(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec);
    cv::Mat CalWeight_buffer(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec, uint8_t *dataBuffer);
    
    cv::Rect track_float(const cv::Mat &next_frame, int normalized_C, cv::Mat kernel);
    std::string FormatWithCommas(int value);
    void printMatInt(std::string name, cv::Mat &input);
};

#endif // MEANSHIFT_H
