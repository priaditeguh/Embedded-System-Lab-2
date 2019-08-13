#include <stdlib.h>
#include <stdio.h>

#include <semaphore.h>
/*  ----------------------------------- DSP/BIOS Link                   */
#include <dsplink.h>

/*  ----------------------------------- DSP/BIOS LINK API               */
#include <proc.h>
#include <pool.h>
#include <mpcs.h>
#include <notify.h>
#include "util.h"
#if defined (DA8XXGEM)
#include <loaderdefs.h>
#endif
#include "meanshift.h"
// #include "Timer.h"
#include <iostream>


/*  ----------------------------------- Application Header              */
#include <pool_notify.h>

#include <sys/time.h>

using namespace std;

long long get_usec(void);

long long get_usec(void) {
  long long r;
  struct timeval t;
  gettimeofday(&t,NULL);
  r=t.tv_sec*1000000+t.tv_usec;
  return r;
}

// frame
cv::Rect rect(228,367,86,58);
cv::Mat frame;
cv::VideoCapture frame_capture;

MeanShift ms; // create meanshift obj

// track
int TotalFrames = 32;
int fcount;

int address_target_region_x;
int address_target_region_y;
int address_target_region_width;
int address_target_region_height;

//#include <pool_notify_os.h>

#define END_CODE                       9999

/*  ============================================================================
 *  @const   NUM_ARGS
 *
 *  @desc   Number of arguments specified to the DSP application.
 *  ============================================================================
 */
#define NUM_ARGS                       1

/** ============================================================================
 *  @name   SAMPLE_POOL_ID
 *
 *  @desc   ID of the POOL used for the sample.
 *  ============================================================================
 */
#define SAMPLE_POOL_ID                 0

/** ============================================================================
 *  @name   NUM_BUF_SIZES
 *
 *  @desc   Number of buffer pools to be configured for the allocator.
 *  ============================================================================
 */
#define NUM_BUF_SIZES                  1

/** ============================================================================
 *  @const  NUM_BUF_POOL0
 *
 *  @desc   Number of buffers in first buffer pool.
 *  ============================================================================
 */
#define NUM_BUF_POOL0                  1

/*  ============================================================================
 *  @const   pool_notify_INVALID_ID
 *
 *  @desc   Indicates invalid processor ID within the pool_notify_Ctrl structure.
 *  ============================================================================
 */
#define pool_notify_INVALID_ID            (Uint32) -1

/** ============================================================================
 *  @const  pool_notify_IPS_ID
 *
 *  @desc   The IPS ID to be used for sending notification events to the DSP.
 *  ============================================================================
 */
#define pool_notify_IPS_ID                0

/** ============================================================================
 *  @const  pool_notify_IPS_EVENTNO
 *
 *  @desc   The IPS event number to be used for sending notification events to
 *          the DSP.
 *  ============================================================================
 */
#define pool_notify_IPS_EVENTNO           5


/*  ============================================================================
 *  @name   bufferSize
 *
 *  @desc   Size of buffer to be used for data transfer.
 *  ============================================================================
 */
STATIC Uint32  bufferSize ;

/*  ============================================================================
 *  @name   numIterations
 *
 *  @desc   Number of iterations of data transfer.
 *  ============================================================================
 */
STATIC Uint32  numIterations ;

/** ============================================================================
 *  @name   dataBuffer
 *
 *  @desc   Pointer to the shared data buffer used by the pool_notify sample
 *          application.
 *  ============================================================================
 */
Uint8 * dataBuffer = NULL ;


/** ============================================================================
 *  @func   pool_notify_Notify
 *
 *  @desc   This function implements the event callback registered with the
 *          NOTIFY component to receive notification indicating that the DSP-
 *          side application has completed its setup phase.
 *
 *  @arg    eventNo
 *              Event number associated with the callback being invoked.
 *  @arg    arg
 *              Fixed argument registered with the IPS component along with
 *              the callback function.
 *  @arg    info
 *              Run-time information provided to the upper layer by the NOTIFY
 *              component. This information is specific to the IPS being
 *              implemented.
 *
 *  @ret    None.
 *
 *  @enter  None.
 *
 *  @leave  None.
 *
 *  @see    None.
 *  ============================================================================
 */
STATIC
Void
pool_notify_Notify (Uint32 eventNo, Pvoid arg, Pvoid info) ;

sem_t sem;

/** ============================================================================
 *  @func   pool_notify_Create
 *
 *  @desc   This function allocates and initializes resources used by
 *          this application.
 *
 *  @modif  None
 *  ============================================================================
 */
NORMAL_API
DSP_STATUS
pool_notify_Create (IN Char8 * dspExecutable,
  IN Uint8   processorId)
{
  DSP_STATUS      status     = DSP_SOK  ;
  Uint32          numArgs    = NUM_ARGS ;
  Void *          dspDataBuf = NULL ;
  Uint32          numBufs [NUM_BUF_SIZES] = {NUM_BUF_POOL0,
  } ;
  Uint32          size    [NUM_BUF_SIZES] ;
  SMAPOOL_Attrs   poolAttrs ;
  Char8 *         args [NUM_ARGS] ;

#ifdef DEBUG
  printf ("Entered pool_notify_Create ()\n") ;
#endif

  sem_init(&sem,0,0);

    /*
     *  Create and initialize the proc object.
     */
  status = PROC_setup (NULL) ;

    /*
     *  Attach the Dsp with which the transfers have to be done.
     */
  if (DSP_SUCCEEDED (status)) {
    status = PROC_attach (processorId, NULL) ;
    if (DSP_FAILED (status)) {
      printf ("PROC_attach () failed. Status = [0x%x]\n",
        (int)status) ;
    } else {
      std::cout << "PROC_attach" << std::endl;
    }
  }
  else {
    printf ("PROC_setup () failed. Status = [0x%x]\n", (int)status) ;
  }

    /*
     *  Open the pool.
     */
  if (DSP_SUCCEEDED (status)) {
    size [0] = bufferSize ;
    poolAttrs.bufSizes      = (Uint32 *) &size ;
    poolAttrs.numBuffers    = (Uint32 *) &numBufs ;
    poolAttrs.numBufPools   = NUM_BUF_SIZES ;
    poolAttrs.exactMatchReq = TRUE ;
    status = POOL_open (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
      &poolAttrs) ;
    if (DSP_FAILED (status)) {
      printf ("POOL_open () failed. Status = [0x%x]\n",
       (int)status) ;
    } else {
      std::cout << "POOL_open" << std::endl;
    }
  }

    /*
     *  Allocate the data buffer to be used for the application.
     */
  if (DSP_SUCCEEDED (status)) {
    status = POOL_alloc (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
     (Void **) &dataBuffer,
     bufferSize) ;

        /* Get the translated DSP address to be sent to the DSP. */
    if (DSP_SUCCEEDED (status)) {
      status = POOL_translateAddr (
       POOL_makePoolId(processorId, SAMPLE_POOL_ID),
       &dspDataBuf,
       AddrType_Dsp,
       (Void *) dataBuffer,
       AddrType_Usr) ;

      if (DSP_FAILED (status)) {
        printf ("POOL_translateAddr () DataBuf failed."
         " Status = [0x%x]\n",
         (int)status) ;
      }
    }
    else {
      printf ("POOL_alloc () DataBuf failed. Status = [0x%x]\n",
       (int)status) ;
    }
  }

    /*
     *  Register for notification that the DSP-side application setup is
     *  complete.
     */
  if (DSP_SUCCEEDED (status)) {
    status = NOTIFY_register (processorId,
      pool_notify_IPS_ID,
      pool_notify_IPS_EVENTNO,
      (FnNotifyCbck) pool_notify_Notify,
                                  0/* vladms XFER_SemPtr*/) ;
      if (DSP_FAILED (status)) {
        printf ("NOTIFY_register () failed Status = [0x%x]\n",
         (int)status) ;
      }
    }

    /*
     *  Load the executable on the DSP.
     */
    if (DSP_SUCCEEDED (status)) {
        // args [0] = strBufferSize ;
      {
        status = PROC_load (processorId, dspExecutable, numArgs, args) ;
      }

      if (DSP_FAILED (status)) {
        printf ("PROC_load () failed. Status = [0x%x]\n", (int)status) ;
      }
    }

    /*
     *  Start execution on DSP.
     */
    if (DSP_SUCCEEDED (status)) {
      status = PROC_start (processorId) ;
      if (DSP_FAILED (status)) {
        printf ("PROC_start () failed. Status = [0x%x]\n",
         (int)status) ;
      }
    }

    /*
     *  Wait for the DSP-side application to indicate that it has completed its
     *  setup. The DSP-side application sends notification of the IPS event
     *  when it is ready to proceed with further execution of the application.
     */
    if (DSP_SUCCEEDED (status)) {
        // wait for initialization 
      sem_wait(&sem);
    }

    /*
     *  Send notifications to the DSP with information about the address of the
     *  control structure and data buffer to be used by the application.
     *
     */
    status = NOTIFY_notify (processorId,
      pool_notify_IPS_ID,
      pool_notify_IPS_EVENTNO,
      (Uint32) dspDataBuf);
    if (DSP_FAILED (status)) {
      printf ("NOTIFY_notify () DataBuf failed."
        " Status = [0x%x]\n",
        (int)status) ;
    }

    status = NOTIFY_notify (processorId,
      pool_notify_IPS_ID,
      pool_notify_IPS_EVENTNO,
      (Uint32) bufferSize);
    if (DSP_FAILED (status)) {
      printf ("NOTIFY_notify () bufferSize failed."
        " Status = [0x%x]\n",
        (int)status) ;
    }
    
    // status = NOTIFY_notify (processorId,
    //   pool_notify_IPS_ID,
    //   pool_notify_IPS_EVENTNO,
    //   (Uint32) frame.cols);
    // if (DSP_FAILED (status)) {
    //   printf ("NOTIFY_notify () frame.cols failed."
    //     " Status = [0x%x]\n",
    //     (int)status) ;
    // }

    // status = NOTIFY_notify (processorId,
    //   pool_notify_IPS_ID,
    //   pool_notify_IPS_EVENTNO,
    //   (Uint32) frame.rows);
    // if (DSP_FAILED (status)) {
    //   printf ("NOTIFY_notify () frame.rows failed."
    //     " Status = [0x%x]\n",
    //     (int)status) ;
    // }

#ifdef DEBUG
    printf ("Leaving pool_notify_Create ()\n") ;
#endif

    return status ;
  }

/** ============================================================================
 *  @func   pool_notify_Execute
 *
 *  @desc   This function implements the execute phase for this application.
 *
 *  @modif  None
 *  ============================================================================
 */
  NORMAL_API
  DSP_STATUS
  pool_notify_Execute (IN Uint32 numIterations, Uint8 processorId)
  {
    cv::Mat kernel(rect.height,rect.width,CV_32S,cv::Scalar(0));

    float normalized_C_float = 1.0 / ms.Epanechnikov_kernel_float(kernel);   
    unsigned long long normalized_C_long = 1000000000000ULL*normalized_C_float;
    int normalized_C = static_cast<int>(normalized_C_long);
    // cout << "normalized_C " << normalized_C << " normalized_C_float " << normalized_C_float << endl;
    ms.Init_target_frame(frame,rect,normalized_C,kernel); // init the meanshift

    int codec = CV_FOURCC('F', 'L', 'V', '1');
    cv::VideoWriter writer("tracking_result.avi", codec, 20, cv::Size(frame.cols,frame.rows));

    address_target_region_x = frame.rows*frame.cols;
    address_target_region_y = address_target_region_x;
    address_target_region_width = address_target_region_y + 1;
    address_target_region_height = address_target_region_width;

    DSP_STATUS  status    = DSP_SOK ;

    printf ("Entered pool_notify_Execute ()\n") ;

    // int statusRead = frame_capture.read(frame);
    
    // cout << "storeVariableToBuffer" << endl;
    int TotalFrames = 32;
    int fcount;
    for(fcount=0; fcount<TotalFrames; ++fcount)
    {
      // read a frame
      int status = frame_capture.read(frame);
      if( 0 == status ) break;
    
      // --------------- TRACK ------------------
      if (fcount == 0) {
        storeVariableToBuffer(dataBuffer, ms.bin_width, normalized_C);
        storeKernelToBuffer(kernel, dataBuffer);

        POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
          dataBuffer,
          bufferSize);

        NOTIFY_notify (processorId,pool_notify_IPS_ID,pool_notify_IPS_EVENTNO,1);
        sem_wait(&sem);
      }

      // ---------------------------------------------------
      cv::Rect next_rect;
      for(int iter=0;iter<ms.cfg.MaxIter;iter++)
      {
        // printf("--------------- FCount %d Iteration %d ----------------\n", fcount, iter);
        // cout << "storeFrameToBuffer" << endl;

        storeFrame0ToBuffer(frame, dataBuffer);
        storeTargetRegionToBuffer(dataBuffer, ms.target_Region, frame);

        POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
          dataBuffer,
          bufferSize);

        NOTIFY_notify (processorId,pool_notify_IPS_ID,pool_notify_IPS_EVENTNO,1);

        // printf("target_Region %d %d %d %d\n", ms.target_Region.x, ms.target_Region.y, ms.target_Region.width, ms.target_Region.height);
        // printf("bin_width %d normalized_C %d\n", ms.bin_width, normalized_C);
        // printf("kernel %d\n", kernel.at<int>(30,30));

        
        sem_wait(&sem);

        int pdf_model0[16];
        storeBufferToPdf0(pdf_model0, dataBuffer);
        // cout << "pdf_model0" << endl;
        // for (int i = 0; i < 16; i++) {
        //   cout << FormatWithCommas(pdf_model0[i]) << " ";
        // }
        // cout << endl;

        // tester
        // cv::Mat pdf_model(3,16,CV_32S,cv::Scalar(1));
        // ms.pdf_representation0(frame, ms.target_Region, normalized_C, kernel, pdf_model);
        // cout << "pdf_representation original " << endl;
        // for (int i = 0; i < 16; i++) {
        //   cout << FormatWithCommas(pdf_model.at<int>(0, i)) << " ";
        // }
        // cout << endl;

        // ------------------------ work by gpp ----------------------
        cv::Mat target_candidate(3,16,CV_32S,cv::Scalar(1));
        for (int i=0; i < 16; i++){
          target_candidate.at<int>(0,i) = pdf_model0[i];
        }

        // ms.pdf_representation0(frame, ms.target_Region, normalized_C, kernel, target_candidate);
        ms.pdf_representation1(frame, ms.target_Region, normalized_C, kernel, target_candidate);
        ms.pdf_representation2(frame, ms.target_Region, normalized_C, kernel, target_candidate);    

        // printMatInt("target_candidate = pdf_representation", target_candidate);

        cv::Mat weight = ms.CalWeight(frame,ms.target_model,target_candidate,ms.target_Region);
        
        float delta_x = 0.0;
        float sum_wij = 0.0;
        float delta_y = 0.0;
        float centre = static_cast<float>((weight.rows-1)/2.0);
        double mult = 0.0;
        
        next_rect.x = ms.target_Region.x;
        next_rect.y = ms.target_Region.y;
        next_rect.width = ms.target_Region.width;
        next_rect.height = ms.target_Region.height;

        for(int i=0;i<weight.rows;i++)
        {
            for(int j=0;j<weight.cols;j++)
            {
                float norm_i = static_cast<float>(i-centre)/centre;
                float norm_j = static_cast<float>(j-centre)/centre;
                mult = pow(norm_i,2)+pow(norm_j,2)>1.0?0.0:1.0;
                int w = weight.at<int>(i,j);
                float d_x = norm_j*w*mult/1000000;
                float d_y = norm_i*w*mult/1000000;
                float d_w = w*mult/1000000;
                delta_x += static_cast<float>(d_x);
                delta_y += static_cast<float>(d_y);
                sum_wij += static_cast<float>(d_w);
            }
        }

        // float asd = delta_x/sum_wij;
        // float d_x = (delta_x/sum_wij)*centre;
        // float d_y = (delta_y/sum_wij)*centre;
        // cout << "delta_x " << delta_x << " delta_y " << delta_y << " sum_wij " << sum_wij << " centre " << centre <<  " asd " << asd << " d_x " << d_x << " d_y " << d_y << endl;
        
        next_rect.x += static_cast<int>((delta_x/sum_wij)*centre);
        next_rect.y += static_cast<int>((delta_y/sum_wij)*centre);

        cout << "after next_rect x " << next_rect.x << " y " << next_rect.y << endl << endl;
        
        if(abs(next_rect.x-ms.target_Region.x)<1 && abs(next_rect.y-ms.target_Region.y)<1)
        {
            break;
        }
        else
        {
            ms.target_Region.x = next_rect.x;
            ms.target_Region.y = next_rect.y;
        }
      }

      // --------------- END TRACK ------------------

      cv::rectangle(frame,next_rect,cv::Scalar(0,0,255),3);

      // write the frame
      writer << frame;
    }

    printf("FINISH ASUUUUU\n");
    NOTIFY_notify (processorId,pool_notify_IPS_ID,pool_notify_IPS_EVENTNO, END_CODE);

    return status ;
  }

/** ============================================================================
 *  @func   pool_notify_Delete
 *
 *  @desc   This function releases resources allocated earlier by call to
 *          pool_notify_Create ().
 *          During cleanup, the allocated resources are being freed
 *          unconditionally. Actual applications may require stricter check
 *          against return values for robustness.
 *
 *  @modif  None
 *  ============================================================================
 */
  NORMAL_API
  Void
  pool_notify_Delete (Uint8 processorId)
  {
    DSP_STATUS status    = DSP_SOK ;
    DSP_STATUS tmpStatus = DSP_SOK ;

#ifdef DEBUG
    printf ("Entered pool_notify_Delete ()\n") ;
#endif

    /*
     *  Stop execution on DSP.
     */
    status = PROC_stop (processorId) ;
    if (DSP_FAILED (status)) {
      printf ("PROC_stop () failed. Status = [0x%x]\n", (int)status) ;
    }

    /*
     *  Unregister for notification of event registered earlier.
     */
    tmpStatus = NOTIFY_unregister (processorId,
     pool_notify_IPS_ID,
     pool_notify_IPS_EVENTNO,
     (FnNotifyCbck) pool_notify_Notify,
                                   0/* vladms pool_notify_SemPtr*/) ;
     if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
      status = tmpStatus ;
      printf ("NOTIFY_unregister () failed Status = [0x%x]\n",
       (int)status) ;
    }

    /*
     *  Free the memory allocated for the data buffer.
     */
    tmpStatus = POOL_free (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
     (Void *) dataBuffer,
     bufferSize) ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
      status = tmpStatus ;
      printf ("POOL_free () DataBuf failed. Status = [0x%x]\n",
       (int)status) ;
    }

    /*
     *  Close the pool
     */
    tmpStatus = POOL_close (POOL_makePoolId(processorId, SAMPLE_POOL_ID)) ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
      status = tmpStatus ;
      printf ("POOL_close () failed. Status = [0x%x]\n", (int)status) ;
    }

    /*
     *  Detach from the processor
     */
    tmpStatus = PROC_detach  (processorId) ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
      status = tmpStatus ;
      printf ("PROC_detach () failed. Status = [0x%x]\n", (int)status) ;
    }

    /*
     *  Destroy the PROC object.
     */
    tmpStatus = PROC_destroy () ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
      status = tmpStatus ;
      printf ("PROC_destroy () failed. Status = [0x%x]\n", (int)status) ;
    }

#ifdef DEBUG
    printf ("Leaving pool_notify_Delete ()\n") ;
#endif
  }


/** ============================================================================
 *  @func   pool_notify_Main
 *
 *  @desc   Entry point for the application
 *
 *  @modif  None
 *  ============================================================================
 */
  NORMAL_API
  Void
  pool_notify_Main (IN Char8 * dspExecutable,
    IN Char8 * videoName)
  {
    DSP_STATUS status       = DSP_SOK ;
    Uint8      processorId  = 0 ;
    int tryBufferSize;

    std::cout << "videoName " << videoName << std::endl;
    std::cout << "frame " << frame.rows << ", " << frame.cols << std::endl;
    
    frame_capture = cv::VideoCapture(videoName);
    frame_capture.read(frame);
    // ms.Init_target_frame(frame,rect); // init the meanshift
    
    if ((dspExecutable != NULL)) {
        /*
         *  Validate the buffer size and number of iterations specified.
         */
      tryBufferSize = (frame.cols * frame.rows) + 8;
      bufferSize = DSPLINK_ALIGN ( tryBufferSize,
       DSPLINK_BUF_ALIGN) ;
#ifdef DEBUG
      printf(" Allocated a buffer of %d bytes\n",(int)bufferSize );
#endif
      processorId            = 0 ;
      if (bufferSize == 0) {
        status = DSP_EINVALIDARG ;
        printf ("ERROR! Invalid arguments specified for  ");
        printf ("     Buffer size    = %d\n",
         (int)bufferSize) ;
      }

        /*
         *  Specify the dsp executable file name and the buffer size for
         *  pool_notify creation phase.
         */
      status = pool_notify_Create (dspExecutable, 0) ;

      if (DSP_SUCCEEDED (status)) {
        status = pool_notify_Execute (numIterations, 0) ;
      }

      pool_notify_Delete (processorId) ;

    }
    else {
      status = DSP_EINVALIDARG ;
      printf ("ERROR! Invalid arguments specified for  "
       "pool_notify application\n") ;
    }

    printf ("====================================================\n") ;
  }

/** ----------------------------------------------------------------------------
 *  @func   pool_notify_Notify
 *
 *  @desc   This function implements the event callback registered with the
 *          NOTIFY component to receive notification indicating that the DSP-
 *          side application has completed its setup phase.
 *
 *  @modif  None
 *  ----------------------------------------------------------------------------
 */
  STATIC
  Void
  pool_notify_Notify (Uint32 eventNo, Pvoid arg, Pvoid info)
  {
    if((int)info==END_CODE) {
      printf(" END_CODE %d \n", (int)info);
      sem_post(&sem);
    } else if ((int)info > 500) {
        std::cout << "jembut " << (int) info << std::endl;
      // std::cout << "jembut " << reinterpret_cast<float*>(info) << " kontol " << (int)info << std::endl;
    } else {
      // printf(" lala %u \n", (Uint32)info);
      sem_post(&sem);
    }
  }