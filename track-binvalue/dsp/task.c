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
#include <stdlib.h>

extern Uint16 MPCSXFER_BufferSize ;

Uint8* restrict buf;

Uint8 kernelCols, kernelRows;
Uint8 lengthToCount;

int sizeToCount;

Uint32* restrict pdf_model_full;

int size_pdf = 3*16;

Uint32* kernel;
int kernel_size;

int bufferBytesPerData = 1; //Uint8 = 1 byte
int bufferSize;
int runningCode;

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
    status = NOTIFY_notify (ID_GPP, MPCSXFER_IPS_ID, MPCSXFER_IPS_EVENTNO, (Uint32) 0) ; /* No payload to be sent. */
    if (status != SYS_OK) 
    {
      return status;
    }
  }

  // wait data buffer pointer
  SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;
  // wait buffer size
  SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;
  // wait variable
  SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;

  return status ;
}
  
Int Task_execute (Task_TransferInfo * info)
{
  int  i =0;
  // int size_to_invalidate;

  allocateMemory();
  
  SEM_pend (&(info->notifySemObj), SYS_FOREVER);

  BCACHE_inv ((Ptr)buf, bufferSize, TRUE);
  assignBufferToKernel();
  
  NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)101);
  
  sizeToCount = lengthToCount * kernelCols * 3;
  // size_to_invalidate = sizeToCount + 4 * sizeof(Uint16);
  
  while(runningCode != END_CODE){
    SEM_pend (&(info->notifySemObj), SYS_FOREVER);

    BCACHE_inv ((Ptr)buf, bufferSize, TRUE);
    
    // calculate pdf representation
    //pdf_representation_part_opt();
    pdf_representation_part_opt(buf,pdf_model_full);

    assignPdfModelFullToBuffer();

    BCACHE_wb((Ptr)buf, bufferSize, TRUE); 
    // BCACHE_wb((Ptr)buf, size_pdf, TRUE); 

    NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)101);

    i+=1;
  }

  return SYS_OK;
}

Void assignBufferToKernel(){
  int i = 0;
  int k = 0;
  
  for (i = 0; i < kernel_size; i++) {
    // kernel[i] = (int) (buf[k] << 24 | buf[k+1] << 16 | buf[k+2] << 8 | buf[k+3]);
    kernel[i] = (int) (buf[k+3] << 24 | buf[k+2] << 16 | buf[k+1] << 8 | buf[k]);
    k+=4;
  }
}

Void allocateMemory(){
  /****************************************************************************
    * Allocate a temporary buffer kernel.
  ****************************************************************************/
  if((kernel = (Uint32 *) malloc(kernel_size* sizeof(Uint32))) == NULL)
  {
      // out of memory
    NOTIFY_notify (ID_GPP, MPCSXFER_IPS_ID, MPCSXFER_IPS_EVENTNO, 10001);
  }


  if((pdf_model_full = (Uint32 *) malloc((16*3)*sizeof(Uint32))) == NULL)
  {
      // out of memory
    NOTIFY_notify (ID_GPP, MPCSXFER_IPS_ID, MPCSXFER_IPS_EVENTNO, 10002);
  }
}

Void assignPdfModelFullToBuffer()  
{
  int i = 0;
  int k = 0;
  int index = 0;
  
  for (i=0; i < size_pdf; i++) 
  {
    buf[k] = (Uint8) (pdf_model_full[index] >> 24);
    buf[k+1] = (Uint8) (pdf_model_full[index] >> 16);
    buf[k+2] = (Uint8) (pdf_model_full[index] >> 8);
    buf[k+3] = (Uint8) (pdf_model_full[index]);
    k+=4;
    index += 1;
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

  free(kernel);
  free(pdf_model_full);

  return status ;
}

Void pdf_representation_part_opt(Uint8* restrict buf,Uint32* restrict pdf_model_full)
{
  int i;
  int temp;
  int index = 0;
  
  #pragma MUST_ITERATE(1,48,4)
  #pragma UNROLL(4)
  for (i=0;i<size_pdf;i++)
  {
    pdf_model_full[i] = 1;
  } 
  
    #pragma MUST_ITERATE(1,16,1)
  #pragma UNROLL(1)
  for(i=0;i<kernel_size;i++)
  {
    temp = kernel[i];

    pdf_model_full[buf[index]] += temp;
    pdf_model_full[16 + buf[index+1]] += temp;
    pdf_model_full[32 + buf[index+2]] += temp;
    index += 3;
  }
}

static Void Task_notify (Uint32 eventNo, Ptr arg, Ptr info)
{
  static int count = 0;
  int value;
  Task_TransferInfo * mpcsInfo = (Task_TransferInfo *) arg ;

  (Void) eventNo ; /* To avoid compiler warning. */

  count++;
  if (count==1) {
    buf =(Uint8*) info ;          
  } else if (count==2) {
    bufferSize = (int) info;
  } else if (count == 3) { 
    value = (int) info;
    kernelRows = (Uint8) (value >> 16);
    kernelCols = (Uint8) (value >> 8);
    lengthToCount = (Uint8) value;
    kernel_size = lengthToCount * kernelCols;
  } else {
    runningCode = (int) info;
  }

  SEM_post(&(mpcsInfo->notifySemObj));
}
