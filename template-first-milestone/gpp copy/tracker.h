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


void storeMatrixToBuffer( cv::Mat &frame, Uint8 *dataBuffer);

#endif 