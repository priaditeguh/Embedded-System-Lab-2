/*  ----------------------------------- OS Specific Headers           */
#include <stdio.h>
#include <stdlib.h>

/*  ----------------------------------- DSP/BIOS Link                 */
#include <dsplink.h>

/*  ----------------------------------- Application Header            */
#include <pool_notify.h>
// #include "meanshift.h"
// #include "Timer.h"
// #include <iostream>

/** ============================================================================
 *  @func   main
 *
 *  @desc   Entry point for the application
 *
 *  @modif  None
 *  ============================================================================
 */
int main (int argc, char ** argv)
{
    Char8 * dspExecutable    = NULL ;
    Char8 * videoName = NULL;

    // if (argc != 3) {
    //     printf ("Usage : %s <absolute path of DSP executable> "
    //        "<Buffer Size> <number of transfers>\n",
    //        argv [0]) ;
    // }
    // else {
        dspExecutable    = argv [1] ;
        videoName        = argv [2] ;

        pool_notify_Main (dspExecutable,
                          videoName) ;
    // }

  // Timer totalTimer("Total Time");

  // cv::VideoCapture frame_capture;
  // if(argc<2)
  // {
  //   std::cout <<"specifiy an input video file to track" << std::endl;
  //   std::cout <<"Usage:  ./" << argv[0] << " car.avi" << std::endl;
  //   return -1;
  // }
  // else
  // {
  //   frame_capture = cv::VideoCapture( argv[1] );
  // }

  //   // this is used for testing the car video
  //   // instead of selection of object of interest using mouse
  // cv::Rect rect(228,367,86,58);
  // cv::Mat frame;
  // frame_capture.read(frame);
  
  //   MeanShift ms; // creat meanshift obj
  //   ms.Init_target_frame(frame,rect); // init the meanshift

  //   int codec = CV_FOURCC('F', 'L', 'V', '1');
  //   cv::VideoWriter writer("tracking_result.avi", codec, 20, cv::Size(frame.cols,frame.rows));

  //   totalTimer.Start();
  //   // #ifndef ARMCC
  //   // MCPROF_START();
  //   // #endif
  //   int TotalFrames = 32;
  //   int fcount;
  //   for(fcount=0; fcount<TotalFrames; ++fcount)
  //   {
  //       // read a frame
  //     int status = frame_capture.read(frame);
  //     if( 0 == status ) break;

  //       // track object
  //       #ifndef ARMCC
  //       // MCPROF_START();
  //       #endif
  //     cv::Rect ms_rect =  ms.track(frame);
  //       #ifndef ARMCC
  //       // MCPROF_STOP();
  //       #endif
      
  //       // mark the tracked object in frame
  //     cv::rectangle(frame,ms_rect,cv::Scalar(0,0,255),3);

  //       // write the frame
  //     writer << frame;
  //   }
  //   // #ifndef ARMCC
  //   // MCPROF_STOP();
  //   // #endif
  //   totalTimer.Pause();

  //   totalTimer.Print();

  //   std::cout << "Processed " << fcount << " frames" << std::endl;
  //   std::cout << "Time: " << totalTimer.GetTime() <<" sec\nFPS : " << fcount/totalTimer.GetTime() << std::endl;

    return 0 ;
  }
