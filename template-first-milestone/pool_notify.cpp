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
cv::Mat weight;
cv::VideoCapture frame_capture;

MeanShift ms; // create meanshift obj

// track
int TotalFrames = 32;
int fcount;

// int address_weight_rows;
// int address_weight_cols;

int address_next_rect_x;
int address_next_rect_y;
int address_next_rect_width;
int address_next_rect_height;

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
Int32 * dataBuffer = NULL ;


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
    
    status = NOTIFY_notify (processorId,
                            pool_notify_IPS_ID,
                            pool_notify_IPS_EVENTNO,
                            (Uint32) weight.cols);
    if (DSP_FAILED (status)) {
        printf ("NOTIFY_notify () weight.cols failed."
                " Status = [0x%x]\n",
                 (int)status) ;
    }

    status = NOTIFY_notify (processorId,
                            pool_notify_IPS_ID,
                            pool_notify_IPS_EVENTNO,
                            (Uint32) weight.rows);
    if (DSP_FAILED (status)) {
        printf ("NOTIFY_notify () weight.rows failed."
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
pool_notify_Execute (IN Uint32 numIterations, Uint8 processorId)
{
    int codec = CV_FOURCC('F', 'L', 'V', '1');
    cv::VideoWriter writer("tracking_result.avi", codec, 20, cv::Size(frame.cols,frame.rows));

    // set address
    // address_weight_rows = frame.rows*frame.cols;
    // address_weight_cols = address_weight_rows;

    address_next_rect_x = frame.rows*frame.cols;
    address_next_rect_y = address_next_rect_x;
    address_next_rect_width = address_next_rect_y + 1;
    address_next_rect_height = address_next_rect_width;

    address_target_region_x = address_next_rect_height + 1;
    address_target_region_y = address_target_region_x;
    address_target_region_width = address_target_region_y + 1;
    address_target_region_height = address_target_region_width;

    int iteration;

    DSP_STATUS  status    = DSP_SOK ;

    long long start;
	
    unsigned char *buf_dsp;

    printf ("Entered pool_notify_Execute ()\n") ;

    for(fcount=0; fcount<TotalFrames; ++fcount)
    {
        // read a frame
        int status = frame_capture.read(frame);
        if( 0 == status ) break;

        // cv::Rect ms_rect =  ms.track(frame);
        cv::Rect next_rect;
        for(int iter=0;iter<ms.cfg.MaxIter;iter++)
        {
            printf("--------------- FCount %d Iteration %d ----------------\n", fcount, iter);
            cv::Mat target_candidate = ms.pdf_representation(frame,ms.target_Region);
            cv::Mat weight = ms.CalWeight(frame,ms.target_model,target_candidate,ms.target_Region);

            storeWeightToBuffer(weight, dataBuffer);

            // printWeight(weight);
            printf("weight rows %d cols %d\n", weight.rows, weight.cols);
            printf("next_rect x %d y %d width %d height %d\n", next_rect.x, next_rect.y, next_rect.width, next_rect.height);
            printf("target_Region x %d y %d width %d height %d\n", ms.target_Region.x, ms.target_Region.y, ms.target_Region.width, ms.target_Region.height);

            // assignVariableToBuffer
            dataBuffer[address_next_rect_x] = next_rect.x << 16;
            dataBuffer[address_next_rect_y] = next_rect.y | dataBuffer[address_next_rect_x];
            dataBuffer[address_next_rect_width] = next_rect.width << 16;
            dataBuffer[address_next_rect_height] = next_rect.height | dataBuffer[address_next_rect_width];
            
            dataBuffer[address_target_region_x] = ms.target_Region.x << 16;
            dataBuffer[address_target_region_y] = ms.target_Region.y | dataBuffer[address_target_region_x];
            dataBuffer[address_target_region_width] = ms.target_Region.width << 16;
            dataBuffer[address_target_region_height] = ms.target_Region.height | dataBuffer[address_target_region_width];
            
            // debug
            printf("next_rect x %d \n", (Int16) (dataBuffer[address_next_rect_x] >> 16));
            printf("next_rect y %d \n", (Int16) (dataBuffer[address_next_rect_y]));
            printf("next_rect width %d \n", (Int16) (dataBuffer[address_next_rect_width] >> 16));
            printf("next_rect height %d \n", (Int16) (dataBuffer[address_next_rect_height]));

            printf("target_Region x %d \n", (Int16) (dataBuffer[address_target_region_x] >> 16));
            printf("target_Region y %d \n", (Int16) (dataBuffer[address_target_region_y]));
            printf("target_Region width %d \n", (Int16) (dataBuffer[address_target_region_width] >> 16));
            printf("target_Region height %d \n", (Int16) (dataBuffer[address_target_region_height]));

            POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                        dataBuffer,
                        bufferSize);
        
            POOL_translateAddr ( POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                                 (void**)&buf_dsp,
                                 AddrType_Dsp,
                                 (Void *) dataBuffer,
                                 AddrType_Usr) ;
            NOTIFY_notify (processorId,pool_notify_IPS_ID,pool_notify_IPS_EVENTNO,1);

            // check
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
                    delta_x += static_cast<float>(norm_j*weight.at<float>(i,j)*mult);
                    delta_y += static_cast<float>(norm_i*weight.at<float>(i,j)*mult);
                    sum_wij += static_cast<float>(weight.at<float>(i,j)*mult);
                }
            }

            next_rect.x += static_cast<int>((delta_x/sum_wij)*centre);
            next_rect.y += static_cast<int>((delta_y/sum_wij)*centre);

            if(abs(next_rect.x-ms.target_Region.x)<1 && abs(next_rect.y-ms.target_Region.y)<1)
            {
                break;
            }
            else
            {
                ms.target_Region.x = next_rect.x;
                ms.target_Region.y = next_rect.y;
            }
            printf("GPP : next_rect x %d y %d width %d height %d\n", 
                next_rect.x, next_rect.y, next_rect.width, next_rect.height);
            printf("GPP : target_Region x %d y %d width %d height %d\n", 
                ms.target_Region.x, ms.target_Region.y, ms.target_Region.width, ms.target_Region.height );

            sem_wait(&sem);

            next_rect.x = (Int16) (dataBuffer[0] >> 16);
            next_rect.y = (Int16) (dataBuffer[0]);
            next_rect.width = (Int16) (dataBuffer[1] >> 16);
            next_rect.height = (Int16) (dataBuffer[1]);

            ms.target_Region.x = (Int16) (dataBuffer[2] >> 16);
            ms.target_Region.y = (Int16) (dataBuffer[2] );
            ms.target_Region.width = (Int16) (dataBuffer[3] >> 16);
            ms.target_Region.height = (Int16) (dataBuffer[3]);

            printf("DSP : next_rect x %d y %d width %d height %d\n", 
                next_rect.x, next_rect.y, next_rect.width, next_rect.height);
            printf("DSP : target_Region x %d y %d width %d height %d\n", 
                ms.target_Region.x, ms.target_Region.y, ms.target_Region.width, ms.target_Region.height);

        }

        cv::Rect ms_rect = next_rect;
        
        // mark the tracked object in frame
        cv::rectangle(frame,ms_rect,cv::Scalar(0,0,255),3);

        // write the frame
        writer << frame;
        
        sem_wait(&sem);
    }
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
    std::cout << "weight " << weight.rows << ", " << weight.cols << std::endl;

    frame_capture = cv::VideoCapture(videoName);
          
    // this is used for testing the car video
    // instead of selection of object of interest using mouse
    frame_capture.read(frame);

    ms.Init_target_frame(frame,rect); // init the meanshift
    
    cv::Rect next_rect;
    cv::Mat target_candidate = ms.pdf_representation(frame,ms.target_Region);
    weight = ms.CalWeight(frame,ms.target_model,target_candidate,ms.target_Region);
    printf("weight rows %d cols %d\n", weight.rows, weight.cols);
    
    if ((dspExecutable != NULL)) {
        /*
         *  Validate the buffer size and number of iterations specified.
         */
        tryBufferSize = (weight.cols * weight.rows + 4) * 4;
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

         //jembutabang

        // Timer msTimer;
        // msTimer.start();

        // for(fcount=0; fcount<TotalFrames; ++fcount)
        // {
        //     // read a frame
        //     int status = frame_capture.read(frame);
        //     if( 0 == status ) break;

        //     // track object
        //     cv::Rect ms_rect =  ms.track(frame);
            
        //     // mark the tracked object in frame
        //     cv::rectangle(frame,ms_rect,cv::Scalar(0,0,255),3);

        //     // write the frame
        //     writer << frame;
        // }
        
        // std::cout << "Processed " << fcount << " frames" << std::endl;
        
        // msTimer.stop();
        // std::cout << "jembutabang took " << msTimer.getSecsF() << " secs" << std::endl;

         //mbuts

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
// #ifdef DEBUG
//     printf("Notification %8d \n", (int)info);
// #endif
    /* Post the semaphore. */
    if((int)info==END_CODE) {
        printf(" END_CODE %d \n", (int)info);
        sem_post(&sem);
    } else if ((int)info > 100) {
        // std::cout << "jembut " << (int) info << std::endl;
        printf(" jembut %d \n", (int)info);
    } else {
        sem_post(&sem);
        // std::cout << "Iteration " << (int) info << std::endl;
        // printf("Iteration %d", info);
        // printf("--------------- Iteration %d ----------------\n", (int)info);
    }
}