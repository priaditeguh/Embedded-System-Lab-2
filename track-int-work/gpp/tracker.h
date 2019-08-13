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

void storeFrame2ToBuffer( cv::Mat &frame, Uint8 *dataBuffer);

void storeFrame1ToBuffer( cv::Mat &frame, Uint8 *dataBuffer);

void storeFrame0ToBuffer( cv::Mat &frame, Uint8 *dataBuffer);

void storeVariableToBuffer(Uint8 *dataBuffer, int bin_width, int normalized_C);

void storeTargetRegionToBuffer(Uint8 *dataBuffer, cv::Rect &target_Region, cv::Mat &frame);

void storeKernelToBuffer( cv::Mat &kernel, Uint8 *dataBuffer);

void storeWeightToBuffer( cv::Mat &weight, Int32 *dataBuffer);

void storeBufferToPdf0( int * pdf_model0, Uint8 *dataBuffer);

void printWeight( cv::Mat &weight);

void printBits(size_t const size, void const * const ptr);

void printMatInt(std::string name, cv::Mat &input);

std::string FormatWithCommas(int value);

#endif 