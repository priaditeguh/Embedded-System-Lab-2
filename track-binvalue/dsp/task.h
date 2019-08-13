#if !defined (TASK_)
#define TASK_

/*  ----------------------------------- DSP/BIOS Headers            */
#include <sem.h>

/*  ----------------------------------- Sample Headers              */
#include <pool_notify_config.h>


typedef struct Task_TransferInfo_tag {
	Uint16 *        dataBuf ;
	SEM_Obj         notifySemObj ;
	Uint32          bufferSize ;
} Task_TransferInfo ;

Int Task_create (Task_TransferInfo ** transferInfo) ;

Int Task_execute (Task_TransferInfo * transferInfo) ;

Int Task_delete (Task_TransferInfo * transferInfo) ;

Void assignBufferToVariable();

Void allocateMemory();

Void calculate();

Void assignVariableToBuffer();

Void assignBufferToTargetRegion();

Void assignBufferToKernel();

Void assignPdfModelToBuffer();

Void pdf_representation_half_opt();

Void pdf_representation_part_opt();

Void assignPdfModelFullToBuffer();

Void CalBinValue_half_bottom();

#endif /* !defined (Task_) */
