#include <iostream>

//#define SMALL_TEST

#ifndef SMALL_TEST
#include "meanshift.h"
#else
#include "opencv2/core/core.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#endif

void test_cpp(int i)
{
	cv::VideoCapture frame_capture;
	frame_capture = cv::VideoCapture("car.avi");
#ifdef SMALL_TEST
	int frame_count = frame_capture.get(CV_CAP_PROP_FRAME_COUNT);
	std::cout << "Number of frames = " << frame_count << std::endl;
	std::cout << "i = " << i << std::endl;
#else
    cv::Rect rect(228,367,86,58); // this is used for testing the car video
    cv::Mat frame;
    frame_capture.read(frame);
    
    MeanShift ms; // creat meanshift obj
    ms.Init_target_frame(frame,rect); // init the meanshift

    cv::VideoWriter writer("tracking_result.avi",CV_FOURCC('M','J','P','G'),20,cv::Size(frame.cols,frame.rows));
	
	int fctr = 0;
	int frame_count = frame_capture.get(CV_CAP_PROP_FRAME_COUNT);
	
	for(int f = 0; f < (frame_count - 4); f++)
	{
		fctr++;
        if(!frame_capture.read(frame))
			break;
		
        // tracking
		cv::Rect ms_rect =  ms.track(frame);
		
        // show the tracking reslut;
		cv::rectangle(frame,ms_rect,cv::Scalar(0,0,255),3);
		
        // write the frame to avi file
		writer << frame;
	}
	std::cout << "Done! fctr = " << fctr << std::endl;
#endif
}