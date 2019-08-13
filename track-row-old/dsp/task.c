/*  ----------------------------------- DSP/BIOS Headers            */
#include <std.h>
#include <gbl.h>
#include <log.h>
#include <swi.h>
#include <sys.h>
#include <tsk.h>
#include <pool.h>

/*  ----------------------------------- DSP/BIOS LINK Headers       */
#include <failure.h>
#include <dsplink.h>
#include <platform.h>
#include <notify.h>
#include <bcache.h>
/*  ----------------------------------- Sample Headers              */
#include <pool_notify_config.h>
#include <task.h>
#include <math.h>

extern Uint16 MPCSXFER_BufferSize ;

#define M_PI 3.14159265358979323846

Uint8* buf;

Int16 frameCols = 640, frameRows = 480;
Int16 kernelCols = 86, kernelRows = 58;

int sizeFrame = 307200;
int sizeKernel = 4988;
// priadi
// int sizeHalfFrame = (640*480*3)/2;
int sizeHalfRect;

// pdf representation
int pdf_model0[16];
int pdf_model_full[3*16];
int pdf_size = 3*16;

int kernel[58][86];

float* weight;

int normalized_C;

// meanshift
Rect target_Region;
Int8 bin_width;

int iteration = 0;
int checkGPP = 1;
int bufferBytesPerData = 1; //Uint8 = 1 byte
int bufferSize;
int runningCode;

int address_target_region_x;
int address_target_region_y;
int address_target_region_width;
int address_target_region_height;

#define END_CODE                        9999

#define CONTINUE_CODE                   9998

static Void Task_notify (Uint32 eventNo, Ptr arg, Ptr info) ;

Int Task_create (Task_TransferInfo ** infoPtr)
{
  Int status    = SYS_OK ;
  Task_TransferInfo * info = NULL ;

    /* Allocate Task_TransferInfo structure that will be initialized
     * and passed to other phases of the application */
  if (status == SYS_OK) 
  {
    *infoPtr = MEM_calloc (DSPLINK_SEGID,
     sizeof (Task_TransferInfo),
                               0) ; /* No alignment restriction */
     if (*infoPtr == NULL) 
     {
      status = SYS_EALLOC ;
    }
    else 
    {
      info = *infoPtr ;
    }
  }

    /* Fill up the transfer info structure */
  if (status == SYS_OK) 
  {
    info->dataBuf       = NULL ; /* Set through notification callback. */
    info->bufferSize    = MPCSXFER_BufferSize ;
    SEM_new (&(info->notifySemObj), 0) ;
  }

    /*
     *  Register notification for the event callback to get control and data
     *  buffer pointers from the GPP-side.
     */
  if (status == SYS_OK) 
  {
    status = NOTIFY_register (ID_GPP,
      MPCSXFER_IPS_ID,
      MPCSXFER_IPS_EVENTNO,
      (FnNotifyCbck) Task_notify,
      info) ;
    if (status != SYS_OK) 
    {
      return status;
    }
  }

    /*
     *  Send notification to the GPP-side that the application has completed its
     *  setup and is ready for further execution.
     */
  if (status == SYS_OK) 
  {
    status = NOTIFY_notify (ID_GPP,
      MPCSXFER_IPS_ID,
      MPCSXFER_IPS_EVENTNO,
                              (Uint32) 0) ; /* No payload to be sent. */
      if (status != SYS_OK) 
      {
        return status;
      }
    }

  // wait data buffer pointer
    SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;
  // wait buffer size
    SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;

    return status ;
  }
  
  Int Task_execute (Task_TransferInfo * info)
  {
    int a;

    SEM_pend (&(info->notifySemObj), SYS_FOREVER);

    BCACHE_inv ((Ptr)buf, bufferSize, TRUE);
    assignBufferToVariable();
    assignBufferToKernel();
    NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)101);
    
    sizeHalfRect = (58 / 2)*(86 * 3);
    
    while(runningCode != END_CODE){
      SEM_pend (&(info->notifySemObj), SYS_FOREVER);

      BCACHE_inv ((Ptr)buf, bufferSize, TRUE);
      assignBufferToTargetRegion();

      // pdf_representation0();
      // priadi
      // pdf_representation_half();
      pdf_representation_half(buf,pdf_model_full);//,kernel);
      
      // priadi
      // assignPdfModelFullToBuffer();
      assignPdfModelFullToBuffer(buf,pdf_model_full);
      
      // assignPdfModelToBuffer();

      // note : revert result on beginning, frame on last
      BCACHE_wb((Ptr)buf, bufferSize, TRUE); 

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)101);
    }

    return SYS_OK;
  }

  Void assignBufferToVariable(){
    bin_width = (Int8) (buf[0]);
    
    normalized_C = (int) (buf[1] << 24 | buf[2] << 16 | buf[3] << 8 | buf[4]);
  }

  Void assignBufferToTargetRegion(){
     target_Region.x = (Int16) (buf[sizeHalfRect+0] << 8 | buf[sizeHalfRect+1]);
     target_Region.y = (Int16) (buf[sizeHalfRect+2] << 8 | buf[sizeHalfRect+3]);
     target_Region.width = (Int16) (buf[sizeHalfRect+4] << 8 | buf[sizeHalfRect+5]);
     target_Region.height = (Int16) (buf[sizeHalfRect+6] << 8 | buf[sizeHalfRect+7]);  

    // target_Region.x = (Int16) (buf[sizeHalfFrame+0] << 8 | buf[sizeHalfFrame+1]);
    // target_Region.y = (Int16) (buf[sizeHalfFrame+2] << 8 | buf[sizeHalfFrame+3]);
    // target_Region.width = (Int16) (buf[sizeHalfFrame+4] << 8 | buf[sizeHalfFrame+5]);
    // target_Region.height = (Int16) (buf[sizeHalfFrame+6] << 8 | buf[sizeHalfFrame+7]);  
    // priadi
//    target_Region.x = (Int16) (buf[sizeFrame+0] << 8 | buf[sizeFrame+1]);
//    target_Region.y = (Int16) (buf[sizeFrame+2] << 8 | buf[sizeFrame+3]);
//    target_Region.width = (Int16) (buf[sizeFrame+4] << 8 | buf[sizeFrame+5]);
//    target_Region.height = (Int16) (buf[sizeFrame+6] << 8 | buf[sizeFrame+7]);
  }

  Void assignBufferToKernel(){
    int i = 0;
    int j = 0;
    int k = 5;

    while (i < kernelRows) {
      kernel[i][j] = (int) (buf[k++] << 24 | buf[k++] << 16 | buf[k++] << 8 | buf[k++]);
      j++;
      if (j>=kernelCols) {
        j=0;
        i++;
      }
    }
  }

  Void assignPdfModelToBuffer(){
    int i = 0;
    int k = sizeFrame + 8;

    while (i < 16) {
      buf[k++] = (Uint8) (pdf_model0[i] >> 24);
      buf[k++] = (Uint8) (pdf_model0[i] >> 16);
      buf[k++] = (Uint8) (pdf_model0[i] >> 8);
      buf[k++] = (Uint8) (pdf_model0[i]);
      i++;
    }
  }

  // Void assignPdfModelFullToBuffer()
  Void assignPdfModelFullToBuffer(Uint8* restrict buffer, int* restrict pdf_model)  
  {
    int i = 0;
    int k = sizeHalfRect + 8;// sizeHalfFrame + 8;
    int j;
    int index;
    
    for (j=0; j<3; j++)
    {
      // _nassert((Uint8) buffer % 8 == 0);
      // _nassert((int) pdf_model % 8 == 0);
      // #pragma MUST_ITERATE(1,16,4)
      // #pragma UNROLL(4)
      for (i=0; i < 16; i++) 
      {
        index = j*16 + i; 
        buffer[k] = (Uint8) (pdf_model[index] >> 24);
        buffer[k+1] = (Uint8) (pdf_model[index] >> 16);
        buffer[k+2] = (Uint8) (pdf_model[index] >> 8);
        buffer[k+3] = (Uint8) (pdf_model[index]);
        k+=4;

//         buf[k++] = (Uint8) (pdf_model_full[index] >> 24);
//         buf[k++] = (Uint8) (pdf_model_full[index] >> 16);
//         buf[k++] = (Uint8) (pdf_model_full[index] >> 8);
//         buf[k++] = (Uint8) (pdf_model_full[index]);
               
        // i++;
      }
    }  
  }

  Int Task_delete (Task_TransferInfo * info)
  {
    Int    status     = SYS_OK ;
    /*
     *  Unregister notification for the event callback used to get control and
     *  data buffer pointers from the GPP-side.
     */
    status = NOTIFY_unregister (ID_GPP,
      MPCSXFER_IPS_ID,
      MPCSXFER_IPS_EVENTNO,
      (FnNotifyCbck) Task_notify,
      info) ;

    /* Free the info structure */
    MEM_free (DSPLINK_SEGID,
      info,
      sizeof (Task_TransferInfo)) ;
    info = NULL ;

    return status ;
  }

  Void pdf_representation0()
  {
    int bin_value;
    int i, j, k;

    int row_index = target_Region.y;
    int clo_index = target_Region.x;

    for (i=0;i<16;i++)
      pdf_model0[i]=1;

    for(i=0;i<target_Region.height;i++)
    {
      clo_index = target_Region.x;
      for(j=0;j<target_Region.width;j++)
      {
        bin_value = (buf[row_index*frameCols+clo_index]/bin_width);

        pdf_model0[bin_value] = pdf_model0[bin_value] + kernel[i][j]*normalized_C;
        // pdf_model0[bin_value] = pdf_model0[bin_value] + kernel[i][j]/1000*normalized_C;
        clo_index++;
      }
      row_index++;
    }
  }


  // Void pdf_representation_half()
  Void pdf_representation_half(Uint8* restrict buffer, int* restrict pdf_model)//, int** restrict kernel_i)
  {
    int bin_value_0,bin_value_1,bin_value_2;
    int curr_pixel_value_0,curr_pixel_value_1,curr_pixel_value_2; 
    int i, j, k;
    int temp;
    int height,width;
    int index = 0;
  
    for (i=0;i<pdf_size;i++)
    {
      pdf_model[i] = 1;
    } 
    
    height = target_Region.height/2;
    width = target_Region.width * 3;
    for(i=height;i<target_Region.height;i++)
    {
      for(j=0;j<target_Region.width;j++)// j++)
      {
          curr_pixel_value_0 = buffer[index]; 
          curr_pixel_value_1 = buffer[index+1]; 
          curr_pixel_value_2 = buffer[index+2]; 
  
          bin_value_0 = curr_pixel_value_0/bin_width;
          bin_value_1 = curr_pixel_value_1/bin_width;
          bin_value_2 = curr_pixel_value_2/bin_width;
          
          temp = kernel[i][j]*normalized_C;
          
          pdf_model[bin_value_0] += temp;
          pdf_model[16 + bin_value_1] += temp;
          pdf_model[32 + bin_value_2] += temp;
          // if (index < 100) {
            // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)1000+buffer[index]);
            // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)1000+buffer[index+1]);
            // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)1000+buffer[index+2]);
          
            // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)2000+bin_value_0);
            // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)2000+bin_value_1);
            // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)2000+bin_value_2);

          //   NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)3000+kernel[i][j]);
          //   NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)4000+normalized_C);
          // }
          index += 3;
      }
    }
    // for (i=0;i<48;i++) {
    //   NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)10000+pdf_model[i]);
    // }
    // for (i=30;i<50;i++) {
    //  NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)2000+kernel[2][i]); 
    // }
  }

  static Void Task_notify (Uint32 eventNo, Ptr arg, Ptr info)
  {
    static int count = 0;
    Task_TransferInfo * mpcsInfo = (Task_TransferInfo *) arg ;

  (Void) eventNo ; /* To avoid compiler warning. */

    count++;
    if (count==1) {
      buf =(Uint8*) info ;          
    } else if (count==2) {
      bufferSize = (int) info;
    // } else if (count==3) {
    //   frameCols = (Int16) info >> 16;
    //   frameRows = (Int16) info;
    // } else if (count==4) {
    //   kernelCols = (Int16) info >> 16;
    //   kernelRows = (Int16) info;

      address_target_region_x = sizeFrame;
      address_target_region_y = address_target_region_x + 2;
      address_target_region_width = address_target_region_y + 2;
      address_target_region_height = address_target_region_width + 2;
    } else {
      runningCode = (int) info;
    }

    SEM_post(&(mpcsInfo->notifySemObj));
  }
