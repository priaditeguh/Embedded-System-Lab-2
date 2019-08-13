/*  ----------------------------------- OS Specific Headers           */
#include <stdio.h>
#include <stdlib.h>

/*  ----------------------------------- DSP/BIOS Link                 */
#include <dsplink.h>

/*  ----------------------------------- Application Header            */
#include <pool_notify.h>
// #include "meanshift.h"
// #include "Timer.h"
// #include <iostream>

/** ============================================================================
 *  @func   main
 *
 *  @desc   Entry point for the application
 *
 *  @modif  None
 *  ============================================================================
 */
int main (int argc, char ** argv)
{
  Char8 * dspExecutable    = NULL ;
  Char8 * videoName = NULL;
  int LENGTH_TO_COUNT;

  dspExecutable    = argv [1];
  videoName        = argv [2];
  LENGTH_TO_COUNT  = atoi(argv[3]);

  if (argc < 4) {
    std::cout << "ARGUMENT : gpp dspExecutable videoName LENGTH_TO_COUNT(Optimum:21)" << std::endl;
    return 0;
  }

  pool_notify_Main (dspExecutable,
    videoName, LENGTH_TO_COUNT) ;

  return 0 ;
}
