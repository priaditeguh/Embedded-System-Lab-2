#include "tracker.h"
#include <string.h>

void storeMatrixToBuffer( cv::Mat &frame, 
    // cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec, 
    Uint8 *dataBuffer)
{
    int i, j, k;
    int startTargetModel, startTargetCandidate, startRec;
    cv::Vec3f curr_pixel_value;

    startTargetModel = frame.rows*frame.cols;
    // startTargetCandidate = target_model.rows*target_model.cols;
    // startRec = target_candidate.rows*target_candidate.cols;

    // fill frame to buffer
    std::cout << "storeMatrixToBuffer " << std::endl;
    k = 0;
    for (i = 0;i < frame.rows; i++)
    {
        for (j = 0; j < frame.cols; j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(i,j);
            dataBuffer[k] =  curr_pixel_value[0];
            dataBuffer[k+1] =  curr_pixel_value[1];
            dataBuffer[k+2] =  curr_pixel_value[2];
            k += 3;
            // std::cout << "k= " << k << ", curr_pixel_value : " << curr_pixel_value[0] << ", " << curr_pixel_value[1] << ", " << curr_pixel_value[2] << std::endl;
        }
    }

    // // fill target model to buffer
    // for (i = 0;i < target_model.rows; i++)
    // {
    //     for (j = 0; j < target_model.cols; j++)
    //     {
    //         curr_pixel_value = frame.at<cv::Vec3b>(i,j);
    //         dataBuffer[k] =  curr_pixel_value[0];
    //         dataBuffer[k+1] =  curr_pixel_value[1];
    //         dataBuffer[k+2] =  curr_pixel_value[2];
    //         k += 3;
    //     }
    // }

    // // fill target model to buffer
    // for (i = 0;i < target_candidate.rows; i++)
    // {
    //     for (j = 0; j < target_candidate.cols; j++)
    //     {
    //         curr_pixel_value = frame.at<cv::Vec3b>(i,j);
    //         dataBuffer[k] =  curr_pixel_value[0];
    //         dataBuffer[k+1] =  curr_pixel_value[1];
    //         dataBuffer[k+2] =  curr_pixel_value[2];
    //         k += 3;
    //     }
    // }

    // dataBuffer[k] =  rec.height;
        
}
