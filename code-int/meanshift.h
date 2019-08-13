#ifndef MEANSHIFT_H
#define MEANSHIFT_H
#include <iostream>
#include <math.h>
#include "opencv2/core/core.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <iomanip>
#include <locale>

#define PI 3.1415926
#define PI2 31.415926

class MeanShift
{
 private:
    // float bin_width;
    int bin_width;
    cv::Mat target_model;
    cv::Rect target_Region;

    struct config{
        int num_bins;
        int piexl_range;
        int MaxIter;
    }cfg;

public:
    MeanShift();
    void Init_target_frame(const cv::Mat &frame,const cv::Rect &rect, int normalized_C, cv::Mat kernel);
    // float Epanechnikov_kernel(cv::Mat &kernel);
    int Epanechnikov_kernel(cv::Mat &kernel);
    int Epanechnikov_kernel_float(cv::Mat &kernel);
    // cv::Mat pdf_representation(const cv::Mat &frame,const cv::Rect &rect);
    cv::Mat pdf_representation(const cv::Mat &frame, const cv::Rect &rect, int normalized_C, cv::Mat kernel);
    cv::Mat CalWeight(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec);
    cv::Mat CalWeight_opt(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec);
    cv::Rect track(const cv::Mat &next_frame, int normalized_C, cv::Mat kernel);
    cv::Rect track_float(const cv::Mat &next_frame, int normalized_C, cv::Mat kernel);
    std::string FormatWithCommas(int value);
    void printMatInt(std::string name, cv::Mat &input);
};

#endif // MEANSHIFT_H
