#ifndef TRACKER_H
#define TRACKER_H
#include <iostream>
#include <math.h>
#include "opencv2/core/core.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"

/*  ----------------------------------- OS Specific Headers           */
#include <stdio.h>
#include <stdlib.h>

#include "pool_notify.h"

/**
* Partially store the last 'length' row of kernel matrix to the buffer
* @normalized_kernel - normalized_kernel value to store
* @dataBuffer        - buffer to contain the normalized kernel
* @length            - length of the last row of kernel to store 
*/
void storePartKernelToBuffer( cv::Mat &normalized_kernel, Uint8 *dataBuffer, int length);

/** 
* Add the result of pdf presentation from the dsp side into the target candidate in the gpp side
* @rect             - the red rectangle size
* @target_candidate - target candidate destination
* @dataBuffer       - data buffer that store the target candidate result
*/
void storeAddBufferToTargetCandidateFloat(cv::Rect &rect, cv::Mat target_candidate, Uint8 *dataBuffer);

/**
  Partially store the last 'length' row of bin value matrix to the buffer
  @bin_value  - bin value to store to buffer
  @dataBuffer - buffer to filled with
  @length     - length of the last row of bin value to store 
*/
void storePartBinValueToBuffer(cv::Mat &bin_value, Uint8 *dataBuffer, int length);

#endif 