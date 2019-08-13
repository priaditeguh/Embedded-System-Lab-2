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

Int32* buf;

float* weight;

float delta_x;
float sum_wij;
float delta_y;
float centre;
double mult;

Rect next_rect;
Rect target_Region;

int iteration = 0;
int checkGPP = 1;
int bufferBytesPerData = 1; //Uint8 = 1 byte
int bufferSize;
int runningCode;
Int16 weightCols, weightRows;

int address_next_rect_x;
int address_next_rect_y;
int address_next_rect_width;
int address_next_rect_height;

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
  SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;
  // wait frame rows
  SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;

  return status ;
}
  
Int Task_execute (Task_TransferInfo * info)
{
  while(runningCode != END_CODE){
    //wait for semaphore
    SEM_pend (&(info->notifySemObj), SYS_FOREVER);
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)101);

    //invalidate cache
    BCACHE_inv ((Ptr)buf, bufferSize, TRUE);
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)102);

    assignBufferToVariable();
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)103);

    // debug
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(1000 + weightRows));
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(1000 + weightCols));

    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(2000 + next_rect.x));
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(2000 + next_rect.y));
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(2000 + next_rect.width));
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(2000 + next_rect.height));


    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(3000 + target_Region.x));
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(3000 + target_Region.y));
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(3000 + target_Region.width));
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)(3000 + target_Region.height));

    calculate();
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)104);

    assignVariableToBuffer();
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)105);

    // write from DSP cache to shared memory
    BCACHE_wb((Ptr)&buf[0], 4, TRUE); 
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)106); 

    //notify the result
    iteration++;
    NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)iteration);
    // NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)107);
  }

  NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)END_CODE);
    
  return SYS_OK;
}

Void assignBufferToVariable(){
  // weight = buf;

  address_next_rect_x = weightRows*weightCols;
  address_next_rect_y = address_next_rect_x;
  address_next_rect_width = address_next_rect_y + 1;
  address_next_rect_height = address_next_rect_width;

  address_target_region_x = address_next_rect_height + 1;
  address_target_region_y = address_target_region_x;
  address_target_region_width = address_target_region_y + 1;
  address_target_region_height = address_target_region_width;


  next_rect.x = (Int16) (buf[address_next_rect_x] >> 16);
  next_rect.y = (Int16) (buf[address_next_rect_y] );
  next_rect.width = (Int16) (buf[address_next_rect_width] >> 16);
  next_rect.height = (Int16) (buf[address_next_rect_height]);
  
  target_Region.x = (Int16) (buf[address_target_region_x] >> 16);
  target_Region.y = (Int16) (buf[address_target_region_y]);
  target_Region.width = (Int16) (buf[address_target_region_width] >> 16);
  target_Region.height = (Int16) (buf[address_target_region_height]);
}

Void calculate(){
  int i,j;
  int index;
  float bufValue, norm_i, norm_j; 

  delta_x = 0.0;
  sum_wij = 0.0;
  delta_y = 0.0;
  centre = (float)((weightRows-1)/2.0);
  mult = 0.0;

  for(i=0;i<weightRows;i++)
  {
      for(j=0;j<weightCols;j++)
      {
          norm_i = (float)(i-centre)/centre;
          norm_j = (float)(j-centre)/centre;
          mult = pow(norm_i,2)+pow(norm_j,2)>1.0?0.0:1.0;
          index = i*weightCols+j;
          bufValue = *((float*)(&buf[index]));
          delta_x += (float)(norm_j*bufValue*mult);
          delta_y += (float)(norm_i*bufValue*mult);
          sum_wij += (float)(bufValue*mult);
      }
  }

  next_rect.x += (int)((delta_x/sum_wij)*centre);
  next_rect.y += (int)((delta_y/sum_wij)*centre);

  if(abs(next_rect.x-target_Region.x)<1 && abs(next_rect.y-target_Region.y)<1)
  {
      return;
  }
  else
  {
      target_Region.x = next_rect.x;
      target_Region.y = next_rect.y;
  }
}

Void assignVariableToBuffer(){
  // write result to buffer
  buf[0] = next_rect.x << 16;
  buf[0] = next_rect.y | buf[0];
  buf[1] = next_rect.width << 16;
  buf[1] = next_rect.height | buf[1];
  
  buf[2] = target_Region.x << 16;
  buf[2] = target_Region.y | buf[2];
  buf[3] = target_Region.width << 16;
  buf[3] = target_Region.height | buf[3];
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


static Void Task_notify (Uint32 eventNo, Ptr arg, Ptr info)
{
  static int count = 0;
  Task_TransferInfo * mpcsInfo = (Task_TransferInfo *) arg ;

  (Void) eventNo ; /* To avoid compiler warning. */

  count++;
  if (count==1) {
    buf =(Int32*)info ;    
  } else if (count==2) {
    bufferSize = (int)info;
  } else if (count==3) {
    weightCols = (int)info;
  } else if (count==4) {
    weightRows = (int)info;
  } else if (count>4) {
    // checkGPP = (int)info;
    runningCode = (int) info;
  }
  
  SEM_post(&(mpcsInfo->notifySemObj));
}
