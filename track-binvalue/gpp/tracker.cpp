#include "tracker.h"
#include <string.h>

using namespace std;

/**
* Partially store the last 'length' row of kernel matrix to the buffer
* @normalized_kernel - normalized_kernel value to store
* @dataBuffer        - buffer to contain the normalized kernel
* @length            - length of the last row of kernel to store 
*/
void storePartKernelToBuffer( cv::Mat &normalized_kernel, Uint8 *dataBuffer, int length)
{
  int* ptr = normalized_kernel.ptr<int>(normalized_kernel.rows-length);
  memcpy(dataBuffer,ptr,length*normalized_kernel.cols*sizeof(int)); 
}

/** 
* Add the result of pdf presentation from the dsp side into the target candidate in the gpp side
* @rect             - the red rectangle size
* @target_candidate - target candidate destination
* @dataBuffer       - data buffer that store the target candidate result
*/
void storeAddBufferToTargetCandidateFloat(cv::Rect &rect, cv::Mat target_candidate, Uint8 *dataBuffer)
{
  int i,k;
  int startAddress = 0;
  
  for (k = 0;k < 3; k++)
  {
    float* ptr = target_candidate.ptr<float>(k);    
    for (i = 0;i < 16; i++)
    {
      uint32_t a = (uint32_t) (dataBuffer[startAddress] << 24 | 
        dataBuffer[startAddress+1] << 16 | 
        dataBuffer[startAddress+2] << 8 | 
        dataBuffer[startAddress+3]);
      *ptr += static_cast<float>(a) / 10000000000ULL;
      ptr++;
      startAddress += 4;
    }
  }
}

/**
  Partially store the last 'length' row of bin value matrix to the buffer
  @bin_value  - bin value to store to buffer
  @dataBuffer - buffer to filled with
  @length     - length of the last row of bin value to store 
*/
void storePartBinValueToBuffer(cv::Mat &bin_value, Uint8 *dataBuffer, int length)
{
  int index = bin_value.rows - length;
  const uchar* ptr = bin_value.ptr<const uchar>(index);
  memcpy(dataBuffer,ptr,length*bin_value.cols); 
}