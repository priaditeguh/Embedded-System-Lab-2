#include "tracker.h"
#include <string.h>

using namespace std;

void storeFrame2ToBuffer( cv::Mat &frame, Uint8 *dataBuffer)
{
    int i, j, k;
    cv::Vec3f curr_pixel_value;

    k = 0;
    for (i = 0;i < frame.rows; i++)
    {
        for (j = 0; j < frame.cols; j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(i,j);
            dataBuffer[k] =  curr_pixel_value[2];
            k++;
        }
    }        
}

void storeFrame1ToBuffer( cv::Mat &frame, Uint8 *dataBuffer)
{
    int i, j, k;
    cv::Vec3f curr_pixel_value;

    k = frame.rows * frame.cols;
    for (i = 0;i < frame.rows; i++)
    {
        for (j = 0; j < frame.cols; j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(i,j);
            dataBuffer[k] =  curr_pixel_value[1];
            k++;
        }
    }        
}

void storeFrame0ToBuffer( cv::Mat &frame, Uint8 *dataBuffer)
{
    int i, j, k;
    cv::Vec3f curr_pixel_value;

    k = 0;
    for (i = 0;i < frame.rows; i++)
    {
        for (j = 0; j < frame.cols; j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(i,j);
            dataBuffer[k] =  curr_pixel_value[0];
            k++;
        }
    }        
}

void storeKernelToBuffer( cv::Mat &kernel, Uint8 *dataBuffer)
{
    int i, j, k;
    
    k = 5;
    for (i = 0;i < kernel.rows; i++)
    {
        for (j = 0; j < kernel.cols; j++)
        {
            int value = kernel.at<int>(i,j);
            dataBuffer[k++] =  (Uint8) (value >> 24);
            dataBuffer[k++] =  (Uint8) (value >> 16);
            dataBuffer[k++] =  (Uint8) (value >> 8);
            dataBuffer[k++] =  (Uint8) (value);
        }
    }        
}

void storeBufferToPdf0( int *pdf_model0, Uint8 *dataBuffer)
{
    int i, k;
    
    k = 0;
    // cout << "storeBufferToPdf0" << endl;
    for (i = 0;i < 16; i++)
    {
        // int a = (int) (dataBuffer[k++] << 24 | dataBuffer[k++] << 16 | dataBuffer[k++] << 8 | dataBuffer[k++]);
        // cout << a << " ";
        // cout << "dataBuffer" << endl;
        // printBits(sizeof(Uint8), &dataBuffer[i*4+0]);
        // printBits(sizeof(Uint8), &dataBuffer[i*4+1]);
        // printBits(sizeof(Uint8), &dataBuffer[i*4+2]);
        // printBits(sizeof(Uint8), &dataBuffer[i*4+3]);
        int a = (int) (dataBuffer[i*4+0] << 24 | 
            dataBuffer[i*4+1] << 16 | 
            dataBuffer[i*4+2] << 8 | 
            dataBuffer[i*4+3]);
        // cout << "a" << endl;
        // printBits(sizeof(int), &a);
        pdf_model0[i] = a;
    }        
    // cout << endl;
}

void storeVariableToBuffer(Uint8 *dataBuffer, int bin_width, int normalized_C)
{
    dataBuffer[0] = (Uint8) bin_width;
    
    dataBuffer[1] = (Uint8) (normalized_C >> 24);
    dataBuffer[2] = (Uint8) (normalized_C >> 16);
    dataBuffer[3] = (Uint8) (normalized_C >> 8);
    dataBuffer[4] = (Uint8) normalized_C;

    // printf("kentu %d %d %d %d\n", 
    //       (Int16) (dataBuffer[0] << 8 | dataBuffer[1]), 
    //       (Int16) (dataBuffer[2] << 8 | dataBuffer[3]), 
    //       (Int16) (dataBuffer[4] << 8 | dataBuffer[5]), 
    //       (Int16) (dataBuffer[6] << 8 | dataBuffer[7]));
    // printf("asu %d\n", (int) (dataBuffer[9] << 24 | dataBuffer[10] << 16 | dataBuffer[11] << 8 | dataBuffer[12]));
    // printBits(sizeof(int16_t), &target_Region.x);
    // printBits(sizeof(uint8_t), &dataBuffer[k++]);
    // printBits(sizeof(uint8_t), &dataBuffer[k++]);
    // printBits(sizeof(int16_t), &target_Region.y);
    // printBits(sizeof(uint8_t), &dataBuffer[k++]);
    // printBits(sizeof(uint8_t), &dataBuffer[k++]);
    // printBits(sizeof(int16_t), &target_Region.width);
    // printBits(sizeof(uint8_t), &dataBuffer[k++]);
    // printBits(sizeof(uint8_t), &dataBuffer[k++]);
    // printBits(sizeof(int16_t), &target_Region.height);
    // printBits(sizeof(uint8_t), &dataBuffer[k++]);
    // printBits(sizeof(uint8_t), &dataBuffer[k++]);

    // printBits(sizeof(int), &normalized_C);
    // printBits(sizeof(Uint8), &dataBuffer[9]);
    // printBits(sizeof(Uint8), &dataBuffer[10]);
    // printBits(sizeof(Uint8), &dataBuffer[11]);
    // printBits(sizeof(Uint8), &dataBuffer[12]);
    
}

void storeTargetRegionToBuffer(Uint8 *dataBuffer, cv::Rect &target_Region, cv::Mat &frame)
{
    int size = frame.rows * frame.cols;
    dataBuffer[size] = (Uint8) (target_Region.x >> 8);
    dataBuffer[size+1] = (Uint8) target_Region.x ;
    dataBuffer[size+2] = (Uint8) (target_Region.y >> 8);
    dataBuffer[size+3] = (Uint8) target_Region.y ;
    dataBuffer[size+4] = (Uint8) (target_Region.width >> 8);
    dataBuffer[size+5] = (Uint8) target_Region.width ;
    dataBuffer[size+6] = (Uint8) (target_Region.height >> 8);
    dataBuffer[size+7] = (Uint8) target_Region.height ;
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

void printBits(size_t const size, void const * const ptr)
{
  unsigned char *b = (unsigned char*) ptr;
  unsigned char byte;
  int i, j, k;

  for (i=size-1;i>=0;i--)
  {
    for (j=7;j>=0;j--)
    {
      byte = (b[i] >> j) & 1;
      printf("%u", byte);
      k++;
      if (k%4==0)
        printf(" ");
    }
  }
  puts("");
}

void printMatInt(std::string name, cv::Mat &input){
    cout << name << endl;
    for (int i =0; i < input.rows; i++){
        for (int j=0; j < input.cols; j++){
            cout << FormatWithCommas(input.at<int>(i,j)) << " ; ";
        }
        cout << endl;
    }
}

std::string FormatWithCommas(int value)
{
    std::stringstream ss;
    ss.imbue(std::locale(""));
    ss << std::fixed << value;
    return ss.str();
}
