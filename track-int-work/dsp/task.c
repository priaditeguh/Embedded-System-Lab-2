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

// pdf representation
// float pdfModelRed[8][16], pdfModelGreen[8][16], pdfModelBlue[8][16];
// float binValueRed, binValueGreen, binValueBlue;
int pdf_model0[16];

// float** kernel; 
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
  // wait frame cols
    // SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;
  // wait frame rows
    // SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;

  // kernel = (float**)malloc(86 * sizeof(float*));
  // for (i=0;i<58;i++){
  //   kernel[i]=(float*)malloc(58 * sizeof(float));
  // }

    return status ;
  }
  
  Int Task_execute (Task_TransferInfo * info)
  {
    // int iterate = 0;
    int a;

    SEM_pend (&(info->notifySemObj), SYS_FOREVER);

    BCACHE_inv ((Ptr)buf, bufferSize, TRUE);
    assignBufferToVariable();
    assignBufferToKernel();
    NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)101);

    while(runningCode != END_CODE){
      SEM_pend (&(info->notifySemObj), SYS_FOREVER);

      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(1000 + target_Region.x));
      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(1000 + target_Region.y));
      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(1000 + target_Region.width));
      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(1000 + target_Region.height));

      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(2000 + bin_width));

      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(3000 + normalized_C));

      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(kernel[30][30]));

      BCACHE_inv ((Ptr)buf, bufferSize, TRUE);
      assignBufferToTargetRegion();

      pdf_representation0();
      
      assignPdfModelToBuffer();

      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(pdf_model0[0]));
      // a = (int) (buf[0] >> 24 | buf[1] >> 16 | buf[2] >> 8 | buf[3]);
      // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32) a);

      BCACHE_wb((Ptr)buf, bufferSize, TRUE); 

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)101);
    }

    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)END_CODE);
    
    return SYS_OK;
  }

  Void assignBufferToVariable(){
    bin_width = (Int8) (buf[0]);
    
    normalized_C = (int) (buf[1] << 24 | buf[2] << 16 | buf[3] << 8 | buf[4]);
  }

  Void assignBufferToTargetRegion(){
    target_Region.x = (Int16) (buf[sizeFrame+0] << 8 | buf[sizeFrame+1]);
    target_Region.y = (Int16) (buf[sizeFrame+2] << 8 | buf[sizeFrame+3]);
    target_Region.width = (Int16) (buf[sizeFrame+4] << 8 | buf[sizeFrame+5]);
    target_Region.height = (Int16) (buf[sizeFrame+6] << 8 | buf[sizeFrame+7]);
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
    int k = 0;

    while (i < 16) {
      buf[k++] = (Uint8) (pdf_model0[i] >> 24);
      buf[k++] = (Uint8) (pdf_model0[i] >> 16);
      buf[k++] = (Uint8) (pdf_model0[i] >> 8);
      buf[k++] = (Uint8) (pdf_model0[i]);
      i++;
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

            // pdf_model.at<int>(0,bin_value) += kernel.at<int>(i,j)/1000*normalized_C;
        pdf_model0[bin_value] = pdf_model0[bin_value] + kernel[i][j]/1000*normalized_C;
        clo_index++;
      }
      row_index++;
    }
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
