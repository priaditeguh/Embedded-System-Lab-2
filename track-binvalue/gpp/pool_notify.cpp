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
// #include "util.h"
#if defined (DA8XXGEM)
#include <loaderdefs.h>
#endif
#include "meanshift.h"
#include "Timer.h"
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

int wait_dsp = 1;

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
// priadi
// STATIC Uint32  frameBufferSize ;
// STATIC Uint32  targetRegionBufferSize ;
// STATIC Uint32  pdfRepBufferSize;

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
pool_notify_Create (IN Char8 * dspExecutable, IN Uint8   processorId, int LENGTH_TO_COUNT)
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
    
    int kernel_rows = 58;
    int kernel_cols = 86;
    int value_to_notify = (kernel_rows << 16) | (kernel_cols << 8) | LENGTH_TO_COUNT;
    
    status = NOTIFY_notify (processorId,
      pool_notify_IPS_ID,
      pool_notify_IPS_EVENTNO,
      (Uint32) value_to_notify);
    if (DSP_FAILED (status)) {
      printf ("NOTIFY_notify () value_to_notify failed."
        " Status = [0x%x]\n",
        (int)status) ;
    }

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
  pool_notify_Execute (IN Uint32 numIterations, Uint8 processorId, int LENGTH_TO_COUNT)
  {
    // timer 
    Timer binValueTimer("calculate binValue in gpp"); 
    
    Timer storeHalfRectToBufferTimer("store part of bin value to buffer");
    Timer writeBackTimer("write part of bin value in buffer to dsp"); 
    Timer pdfTimer("calculate PDF in gpp"); 
    Timer dspPdfTimer("calculate PDF in dsp"); 
    Timer readBufferTimer("copy result of pdf calculated in dsp from buffer"); 
    
    Timer weightTimer("calculate weight"); 
    Timer otherCount("calculate after calWeight"); 
    Timer writeFrame("write frame"); 
    Timer readFrame("read frame"); 

    Timer totalTimer("Total Time");
    Timer trackTimer("Track Time"); 
    
    std::ofstream myfile;
    myfile.open ("targetRegion.txt");

	  cv::Mat kernel_int;
    cv::Mat kernel_opt;
    cv::Mat kernel_float(rect.height,rect.width,CV_32F,cv::Scalar(0));
    
    // calculate normalized C and kernel
    float normalized_C_float = 1.0 / ms.Epanechnikov_kernel(kernel_float);   
    // calculate normalized kernel = kernel * normalized_C_float
    kernel_float.convertTo(kernel_opt, CV_32F, normalized_C_float, 0); 
    // calculate int version of normalized kernel
    kernel_opt.convertTo(kernel_int, CV_32S, 10000000000ULL, 0); 
    
    // Ask DSP to store a part of the int version of the normalized kernel  
    POOL_invalidate(POOL_makePoolId(processorId, SAMPLE_POOL_ID),dataBuffer,bufferSize); // 
    storePartKernelToBuffer(kernel_int, dataBuffer, LENGTH_TO_COUNT);
    POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
      dataBuffer,
      bufferSize);
    NOTIFY_notify (processorId,pool_notify_IPS_ID,pool_notify_IPS_EVENTNO,1);
    sem_wait(&sem);

    // Initialize target frameC
    ms.Init_target_frame(frame,rect,normalized_C_float,kernel_float); 
    
    int codec = CV_FOURCC('F', 'L', 'V', '1');
    cv::VideoWriter writer("tracking_result.avi", codec, 20, cv::Size(frame.cols,frame.rows));

    DSP_STATUS  status    = DSP_SOK ;

    printf ("Entered pool_notify_Execute ()\n") ;

    totalTimer.Start();
    int TotalFrames = 32;
    int fcount;
    for(fcount=0; fcount<TotalFrames; ++fcount)
    {
      // read a frame
      readFrame.Start();
      int status = frame_capture.read(frame);
      readFrame.Pause();
      if( 0 == status ) break;
      
      // ------------------------------------------------------------------------------------------------------------
      // -------------------------------------- START TRACK ---------------------------------------------------------
      // ------------------------------------------------------------------------------------------------------------
      cv::Rect next_rect;
      trackTimer.Start();
      for(int iter=0;iter<ms.cfg.MaxIter;iter++)
      {
        // ----------------------------------------------------------------------------------------------------------
        // ------------------------------------- CALCULATE BIN VALUE ------------------------------------------------
        // ----------------------------------------------------------------------------------------------------------
        binValueTimer.Start();
        cv::Mat bin_value = ms.CalBinValue(frame, ms.target_Region);
        binValueTimer.Pause();

        // ----------------------------------------------------------------------------------------------------------
        // ----------------------------------- WRITE BIN VALUE TO DSP -----------------------------------------------
        // ----------------------------------------------------------------------------------------------------------
        // invalidate buffer of frame
        POOL_invalidate(POOL_makePoolId(processorId, SAMPLE_POOL_ID),dataBuffer,bufferSize); // 
 
        storeHalfRectToBufferTimer.Start();
        storePartBinValueToBuffer(bin_value, dataBuffer, LENGTH_TO_COUNT);
        storeHalfRectToBufferTimer.Pause();

        writeBackTimer.Start();
        POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
          dataBuffer,
          bufferSize);
        writeBackTimer.Pause();

        // ----------------------------------------------------------------------------------------------------------
        // ------------------------------------- PDF REPRESENTATION -------------------------------------------------
        // ----------------------------------------------------------------------------------------------------------
        dspPdfTimer.Start();
        NOTIFY_notify (processorId,pool_notify_IPS_ID,pool_notify_IPS_EVENTNO,1);
        
        pdfTimer.Start();
        cv::Mat target_candidate = ms.pdf_representation_part_top_opt(ms.target_Region, kernel_opt, bin_value, ms.target_Region.height - LENGTH_TO_COUNT);
        pdfTimer.Pause();

        sem_wait(&sem);
        dspPdfTimer.Pause();
        
        //  calculate timer buffer
        readBufferTimer.Start();
        storeAddBufferToTargetCandidateFloat(ms.target_Region, target_candidate, dataBuffer);
        readBufferTimer.Pause();

        // ----------------------------------------------------------------------------------------------------------
        // ------------------------------------- CALCULATE WEIGHT ---------------------------------------------------
        // ----------------------------------------------------------------------------------------------------------

        weightTimer.Start();
        cv::Mat weight = ms.CalWeight_opt(ms.target_model,target_candidate,ms.target_Region,bin_value);
        weightTimer.Pause();

        otherCount.Start();
        float delta_x = 0.0;
        float sum_wij = 0.0;
        float delta_y = 0.0;
        float centre = static_cast<float>((weight.rows-1)/2.0);
        
        next_rect.x = ms.target_Region.x;
        next_rect.y = ms.target_Region.y;
        next_rect.width = ms.target_Region.width;
        next_rect.height = ms.target_Region.height;

        float32x4_t incr = {0.0,1.0,2.0,3.0};
        float32x4_t centre_4 = vmovq_n_f32(centre);
        float32x4_t ones = vmovq_n_f32(1.0);
        float32x4_t zeros = vmovq_n_f32(0.0);
        for(int i=0;i<weight.rows;i++)
        {

         float32_t* weight_ptr = (float32_t*)weight.ptr<float>(i);
         float32_t norm_i = (i-centre)/centre;
         float32x4_t norm_i_4 = vmovq_n_f32(norm_i);

         for(int j=0;j<weight.cols;j+=4)
         {
          float32x4_t j_4 = vmovq_n_f32(j);
          float32x4_t temp = vsubq_f32(vaddq_f32(j_4,incr),centre_4);     

          float32x4_t reciprocal = vrecpeq_f32(centre_4);
          reciprocal = vmulq_f32(vrecpsq_f32(centre_4, reciprocal), reciprocal);
          float32x4_t norm_j_4 = vmulq_f32(temp,reciprocal);                  

          float32x4_t norm_i_i = vmulq_f32(norm_i_4,norm_i_4);
          float32x4_t norm_j_j = vmulq_f32(norm_j_4,norm_j_4);
          float32x4_t norm_i_plus_j = vaddq_f32(norm_j_j,norm_i_i);

          uint32x4_t mask = vcgtq_f32(norm_i_plus_j,ones);                  
          float32x4_t mult_4 = vbslq_f32(mask,zeros,ones);

          float32x4_t load_weight = vld1q_f32(weight_ptr);
          float32x4_t temp_x = vmulq_f32(norm_j_4,vmulq_f32(load_weight,mult_4));
          float32x4_t temp_y = vmulq_f32(norm_i_4,vmulq_f32(load_weight,mult_4));
          float32x4_t temp_ij = vmulq_f32(load_weight,mult_4);
          weight_ptr+=4;

          delta_x += vgetq_lane_f32(temp_x,0) + vgetq_lane_f32(temp_x,1) + vgetq_lane_f32(temp_x,2) + vgetq_lane_f32(temp_x,3);
          delta_y += vgetq_lane_f32(temp_y,0) + vgetq_lane_f32(temp_y,1) + vgetq_lane_f32(temp_y,2) + vgetq_lane_f32(temp_y,3);
          sum_wij += vgetq_lane_f32(temp_ij,0) + vgetq_lane_f32(temp_ij,1) + vgetq_lane_f32(temp_ij,2) + vgetq_lane_f32(temp_ij,3);        
        }
      }

      next_rect.x += static_cast<int>((delta_x/sum_wij)*centre);
      next_rect.y += static_cast<int>((delta_y/sum_wij)*centre);

      otherCount.Pause();
      
      if(abs(next_rect.x-ms.target_Region.x)<1 && abs(next_rect.y-ms.target_Region.y)<1)
      {
        break;
      }
      else
      {
        ms.target_Region.x = next_rect.x;
        ms.target_Region.y = next_rect.y;

        #ifdef DEBUG
          myfile << "target_Region.x " << ms.target_Region.x << std::endl;
          myfile << "target_Region.y " << ms.target_Region.y << std::endl;
        #endif
      }
    }

    trackTimer.Pause();
    // ----------------------------------------------------------------------------------------------------------
    // ----------------------------------------- END TRACK ------------------------------------------------------
    // ----------------------------------------------------------------------------------------------------------

    // ----------------------------------------------------------------------------------------------------------
    // ----------------------------------------- WRITE FRAME ----------------------------------------------------
    // ----------------------------------------------------------------------------------------------------------
    writeFrame.Start();
    cv::rectangle(frame,next_rect,cv::Scalar(0,0,255),3);
    writer << frame;
    writeFrame.Pause();
  }

  totalTimer.Stop();

  // ----------------------------------------------------------------------------------------------------------
  // -------------------------------------- PRINT ALL TIMER ---------------------------------------------------
  // ----------------------------------------------------------------------------------------------------------
  binValueTimer.Print(); 
    
  storeHalfRectToBufferTimer.Print(); 
  writeBackTimer.Print(); 
  pdfTimer.Print(); 
  dspPdfTimer.Print(); 
  readBufferTimer.Print(); 
    
  weightTimer.Print(); 
  otherCount.Print(); 
  writeFrame.Print(); 
  readFrame.Print();

  trackTimer.Print(); 
  totalTimer.Print(); 
  
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
  IN Char8 * videoName, int LENGTH_TO_COUNT)
{
  DSP_STATUS status       = DSP_SOK ;
  Uint8      processorId  = 0 ;
  int tryBufferSize;
  int halfRect = (LENGTH_TO_COUNT * rect.width * sizeof(int));

  frame_capture = cv::VideoCapture(videoName);
  frame_capture.read(frame);

  if ((dspExecutable != NULL)) {
    /*
     *  Validate the buffer size and number of iterations specified.
     */
    tryBufferSize = halfRect;// + pdf_representation_size;

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
    status = pool_notify_Create (dspExecutable, 0, LENGTH_TO_COUNT) ;

    if (DSP_SUCCEEDED (status)) {
      status = pool_notify_Execute (numIterations, 0, LENGTH_TO_COUNT) ;
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
      std::cout << "test " << (int) info << std::endl;
    } else if ((int) info == 101) {
      // wait_dsp = 0;
      sem_post(&sem);
    } else {
      // wait_dsp = 0;
      // printf(" lala %u \n", (Uint32)info);
      sem_post(&sem);
    }
  }