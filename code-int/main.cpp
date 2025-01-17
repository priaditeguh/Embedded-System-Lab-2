#include "meanshift.h"
#include "Timer.h"
#include <iostream>

using namespace std;
// #ifndef ARMCC
// #include "markers.h"
// #endif

int main(int argc, char ** argv)
{
    Timer totalTimer("Total Time");

    cv::VideoCapture frame_capture;
    if(argc<2)
    {
        std::cout <<"specifiy an input video file to track" << std::endl;
        std::cout <<"Usage:  ./" << argv[0] << " car.avi" << std::endl;
        return -1;
    }
    else
    {
        frame_capture = cv::VideoCapture( argv[1] );
    }

    // this is used for testing the car video
    // instead of selection of object of interest using mouse
    cv::Rect rect(228,367,86,58);
    cv::Mat frame;
    frame_capture.read(frame);
    
    MeanShift ms; // creat meanshift obj
    // ms.Init_target_frame(frame,rect); // init the meanshift
    cv::Mat kernel(rect.height,rect.width,CV_32S,cv::Scalar(0));
    // float normalized_C = 1.0 / ms.Epanechnikov_kernel(kernel);   
    float normalized_C_float = 1.0 / ms.Epanechnikov_kernel_float(kernel);   
    int normalized_C = static_cast<int>(1000000000000*normalized_C_float);
    cout << "normalized_C " << normalized_C << " normalized_C_float " << normalized_C_float << endl;
    ms.Init_target_frame(frame,rect,normalized_C,kernel); // init the meanshift

    int codec = CV_FOURCC('F', 'L', 'V', '1');
    cv::VideoWriter writer("tracking_result.avi", codec, 20, cv::Size(frame.cols,frame.rows));

    totalTimer.Start();
    // #ifndef ARMCC
    // MCPROF_START();
    // #endif
    int TotalFrames = 32;
    int fcount;
    for(fcount=0; fcount<TotalFrames; ++fcount)
    {
        // read a frame
        int status = frame_capture.read(frame);
        if( 0 == status ) break;

        // track object
        #ifndef ARMCC
        // MCPROF_START();
        #endif
        // cv::Rect ms_rect =  ms.track(frame,normalized_C, kernel);
        cv::Rect ms_rect =  ms.track_float(frame,normalized_C, kernel);
        #ifndef ARMCC
        // MCPROF_STOP();
        #endif
        
        // mark the tracked object in frame
        cv::rectangle(frame,ms_rect,cv::Scalar(0,0,255),3);

        // write the frame
        writer << frame;
    }
    // #ifndef ARMCC
    // MCPROF_STOP();
    // #endif
    totalTimer.Pause();

    totalTimer.Print();

    std::cout << "Processed " << fcount << " frames" << std::endl;
    std::cout << "Time: " << totalTimer.GetTime() <<" sec\nFPS : " << fcount/totalTimer.GetTime() << std::endl;

    return 0;
}

