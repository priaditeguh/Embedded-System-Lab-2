#include "tracker.h"
#include <string.h>

void storeMatrixToBuffer( cv::Mat &frame, 
    // cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec, 
    Uint8 *dataBuffer)
{
    int i, j, k;
    cv::Vec3f curr_pixel_value;

    // fill frame to buffer
    // std::cout << "storeMatrixToBuffer " << std::endl;
    k = 0;
    for (i = 0;i < frame.rows; i++)
    {
        for (j = 0; j < frame.cols; j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(i,j);
            dataBuffer[k] =  curr_pixel_value[0];
            // dataBuffer[k+1] =  curr_pixel_value[1];
            // dataBuffer[k+2] =  curr_pixel_value[2];
            // k += 3;
            k++;
            // std::cout << "k= " << k << ", curr_pixel_value : " << curr_pixel_value[0] << ", " << curr_pixel_value[1] << ", " << curr_pixel_value[2] << std::endl;
        }
    }        
}

void storeWeightToBuffer( cv::Mat &weight, Int32 *dataBuffer)
{
    int i, j, k;
    float value;

    // fill frame to buffer
    // std::cout << "storeWeightToBuffer " << std::endl;
    k = 0;
    for (i = 0;i < weight.rows; i++)
    {
        for (j = 0; j < weight.cols; j++)
        {
            value = weight.at<float>(i,j);
            dataBuffer[k] = *((int*)(&value));
            k++;
        }
    }
}

void printWeight( cv::Mat &weight){
    for (int i =0; i < weight.rows; i++){
        for (int j=0; j < weight.cols; j++) {
            printf("%.6f\t", weight.at<float>(i,j));
        }
        printf("\n");
    }

}