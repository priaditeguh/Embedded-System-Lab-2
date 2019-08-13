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
        const uchar* ptr = frame.ptr<const uchar>(i);
        for (j = 0; j < frame.cols; j++)
        {

            // curr_pixel_value = frame.at<cv::Vec3b>(i,j);
            // dataBuffer[k] =  curr_pixel_value[0];
            dataBuffer[k] = *ptr; ptr += 3;
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
    int i;
    
    for (i = 0;i < 16; i++)
    {
        int a = (int) (dataBuffer[i*4+0] << 24 | 
            dataBuffer[i*4+1] << 16 | 
            dataBuffer[i*4+2] << 8 | 
            dataBuffer[i*4+3]);
        pdf_model0[i] = a;
    }        
}

void storeBufferToTargetCandidate(cv::Mat &frame, cv::Mat target_candidate, Uint8 *dataBuffer)
{
    int i;
    int startAddress = frame.rows * frame.cols + 8;
    
    int* ptr = target_candidate.ptr<int>(0);
    for (i = 0;i < 16; i++)
    {
        int a = (int) (dataBuffer[startAddress] << 24 | 
            dataBuffer[startAddress+1] << 16 | 
            dataBuffer[startAddress+2] << 8 | 
            dataBuffer[startAddress+3]);
        // target_candidate.at<int>(0,i) = a;
        *ptr = a; ptr++;
    }
}

// from ade
void storeBufferToTargetCandidateFloat(cv::Rect rect, cv::Mat &target_candidate, Uint8 *dataBuffer)
{
    int i,k;
    int startAddress = (rect.height/2) * (rect.width * 3) + 8;
    
    for (k = 0;k < 3; k++)
    {
      float* ptr = target_candidate.ptr<float>(k);    
      for (i = 0;i < 16; i++)
      {
          uint32_t a = (uint32_t) (dataBuffer[startAddress] << 24 | 
              dataBuffer[startAddress+1] << 16 | 
              dataBuffer[startAddress+2] << 8 | 
              dataBuffer[startAddress+3]);
          // target_candidate.at<int>(0,i) = a;
          *ptr = static_cast<float>(a) / 10000000000ULL;
          ptr++;
          startAddress += 4;
          // *ptr += a; ptr++;
      }
    }
}

// priadi
// void storeAdddBufferToTargetCandidate(cv::Mat &frame, cv::Mat target_candidate, Uint8 *dataBuffer)
void storeAddBufferToTargetCandidate(cv::Rect rect, cv::Mat &target_candidate, Uint8 *dataBuffer)
{
    int i,k;
    // int startAddress = (frame.rows * frame.cols * 3)/2 + 8;
    int startAddress = (rect.height/2) * (rect.width * 3) + 8;
    
    for (k = 0;k < 3; k++)
    {
      int* ptr = target_candidate.ptr<int>(k);    
      for (i = 0;i < 16; i++)
      {
          int a = (int) (dataBuffer[startAddress] << 24 | 
              dataBuffer[startAddress+1] << 16 | 
              dataBuffer[startAddress+2] << 8 | 
              dataBuffer[startAddress+3]);
          // target_candidate.at<int>(0,i) = a;
          *ptr += a; ptr++;
          startAddress+=4;
      }
    }
}

// void storeAdddBufferToTargetCandidateFloat(cv::Mat &frame, cv::Mat target_candidate, Uint8 *dataBuffer)
void storeAddBufferToTargetCandidateFloat(cv::Rect &rect, cv::Mat target_candidate, Uint8 *dataBuffer)
{
    int i,k;
    int startAddress = (rect.height/2) * (rect.width * 3) + 8;
    
    for (k = 0;k < 3; k++)
    {
      float* ptr = target_candidate.ptr<float>(k);    
      for (i = 0;i < 16; i++)
      {
          uint32_t a = (uint32_t) (dataBuffer[startAddress] << 24 | 
              dataBuffer[startAddress+1] << 16 | 
              dataBuffer[startAddress+2] << 8 | 
              dataBuffer[startAddress+3]);
          // target_candidate.at<int>(0,i) = a;
          *ptr += static_cast<float>(a) / 10000000000ULL;
          ptr++;
          startAddress += 4;
          // *ptr += a; ptr++;
      }
    }
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

void storeTargetRegionToBuffer(Uint8 *dataBuffer, cv::Rect &target_Region, cv::Mat &frame) // ,int start_index)
{
    // int size = frame.rows * frame.cols;
    
    // priadi
    // int size = frame.rows/2 * frame.cols * 3;
    int size = target_Region.height/2 * target_Region.width * 3;
    
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

// priadi
void storeHalfToBuffer( cv::Mat &frame, Uint8 *dataBuffer)
{
	// int row = frame.rows/2;
	// int col = frame.cols*3; 

	int row = frame.rows/2; // number of lines
	int col = frame.cols * 3;// frame.channels(); 
	
	if (frame.isContinuous()) 
	{
		
		// then no padded pixels
		col= col*row; 
		row= 1; // it is now a 1D array
		// std::cout << "Alhamdulilah it's contiuous " << std::endl;
		const uchar* ptr = frame.ptr<const uchar>(0);
		memcpy(dataBuffer,ptr,col);		
		
	} else {
		
		// std::cout << "Oh no it's no contiuous " << std::endl;
		// k = 0;
		for (int i = 0;i < row; i++)
		{
			const uchar* ptr = frame.ptr<const uchar>(i);
			memcpy(dataBuffer,ptr,col);	
			// for (j = 0; j < col; j++)
			// {
				// dataBuffer[k] = *ptr++;
				// k++;
			// }
		}     		
	}   
}

void storeHalfRectToBuffer(cv::Mat &frame, Uint8 *dataBuffer, const cv::Rect &rect)
{
	int row = rect.height / 2;
	int col = rect.width * 3; 

  int row_index = rect.y + row;
  int clo_index = rect.x * 3;

  for(int i=0;i<row;i++)
  {
  		const uchar* ptr = frame.ptr<const uchar>(row_index) + clo_index;
  		memcpy(dataBuffer,ptr,col);	
      row_index++;
      dataBuffer+=col;
  }	
}