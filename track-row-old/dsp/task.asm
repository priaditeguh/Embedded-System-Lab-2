;******************************************************************************
;* TMS320C6x C/C++ Codegen                                       Unix v6.1.17 *
;* Date/Time created: Tue Jun  6 20:52:47 2017                                *
;******************************************************************************
	.compiler_opts --c64p_l1d_workaround=default --disable:=sploop --endian=little --hll_source=on --mem_model:code=far --mem_model:const=data --mem_model:data=far --predefine_memory_model_macros --quiet --silicon_version=6500 --symdebug:skeletal 

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C64x+                                          *
;*   Optimization      : Enabled at level 3                                   *
;*   Optimizing for    : Speed                                                *
;*                       Based on options: -o3, no -ms                        *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Data Access Model : Far                                                  *
;*   Pipelining        : Enabled                                              *
;*   Speculate Loads   : Disabled                                             *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : DWARF Debug for Program Analysis w/Optimization      *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss


$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("task.c")
	.dwattr $C$DW$CU, DW_AT_producer("TMS320C6x C/C++ Codegen Unix v6.1.17 Copyright (c) 1996-2010 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp")
;*****************************************************************************
;* CINIT RECORDS                                                             *
;*****************************************************************************
	.sect	".cinit"
	.align	8
	.field  	2,32
	.field  	_frameCols+0,32
	.field  	640,16			; _frameCols @ 0

	.sect	".cinit"
	.align	8
	.field  	2,32
	.field  	_frameRows+0,32
	.field  	480,16			; _frameRows @ 0

	.sect	".cinit"
	.align	8
	.field  	2,32
	.field  	_kernelCols+0,32
	.field  	86,16			; _kernelCols @ 0

	.sect	".cinit"
	.align	8
	.field  	2,32
	.field  	_kernelRows+0,32
	.field  	58,16			; _kernelRows @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sizeFrame+0,32
	.field  	307200,32			; _sizeFrame @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sizeKernel+0,32
	.field  	4988,32			; _sizeKernel @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_pdf_size+0,32
	.field  	48,32			; _pdf_size @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_iteration+0,32
	.field  	0,32			; _iteration @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_checkGPP+0,32
	.field  	1,32			; _checkGPP @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_bufferBytesPerData+0,32
	.field  	1,32			; _bufferBytesPerData @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_count$1+0,32
	.field  	0,32			; _count$1 @ 0


$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("MEM_free")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("_MEM_free")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$22)
$C$DW$3	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$41)
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$42)
	.dwendtag $C$DW$1


$C$DW$5	.dwtag  DW_TAG_subprogram, DW_AT_name("MEM_valloc")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("_MEM_valloc")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
$C$DW$6	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$22)
$C$DW$7	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$42)
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$42)
$C$DW$9	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$43)
	.dwendtag $C$DW$5


$C$DW$10	.dwtag  DW_TAG_subprogram, DW_AT_name("SEM_pend")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("_SEM_pend")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$10, DW_AT_declaration
	.dwattr $C$DW$10, DW_AT_external
$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$52)
$C$DW$12	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$79)
	.dwendtag $C$DW$10


$C$DW$13	.dwtag  DW_TAG_subprogram, DW_AT_name("SEM_post")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("_SEM_post")
	.dwattr $C$DW$13, DW_AT_declaration
	.dwattr $C$DW$13, DW_AT_external
$C$DW$14	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$52)
	.dwendtag $C$DW$13


$C$DW$15	.dwtag  DW_TAG_subprogram, DW_AT_name("_SEM_dopost")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("__SEM_dopost")
	.dwattr $C$DW$15, DW_AT_declaration
	.dwattr $C$DW$15, DW_AT_external
$C$DW$16	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$52)
	.dwendtag $C$DW$15


$C$DW$17	.dwtag  DW_TAG_subprogram, DW_AT_name("NOTIFY_register")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("_NOTIFY_register")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$17, DW_AT_declaration
	.dwattr $C$DW$17, DW_AT_external
$C$DW$18	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$37)
$C$DW$19	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$37)
$C$DW$20	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$37)
$C$DW$21	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$58)
$C$DW$22	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$41)
	.dwendtag $C$DW$17


$C$DW$23	.dwtag  DW_TAG_subprogram, DW_AT_name("NOTIFY_unregister")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("_NOTIFY_unregister")
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$23, DW_AT_declaration
	.dwattr $C$DW$23, DW_AT_external
$C$DW$24	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$37)
$C$DW$25	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$37)
$C$DW$26	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$37)
$C$DW$27	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$58)
$C$DW$28	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$3)
	.dwendtag $C$DW$23


$C$DW$29	.dwtag  DW_TAG_subprogram, DW_AT_name("NOTIFY_notify")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("_NOTIFY_notify")
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$29, DW_AT_declaration
	.dwattr $C$DW$29, DW_AT_external
$C$DW$30	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$37)
$C$DW$31	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$37)
$C$DW$32	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$37)
$C$DW$33	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$37)
	.dwendtag $C$DW$29


$C$DW$34	.dwtag  DW_TAG_subprogram, DW_AT_name("BCACHE_inv")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("_BCACHE_inv")
	.dwattr $C$DW$34, DW_AT_declaration
	.dwattr $C$DW$34, DW_AT_external
$C$DW$35	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$41)
$C$DW$36	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$42)
$C$DW$37	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$59)
	.dwendtag $C$DW$34


$C$DW$38	.dwtag  DW_TAG_subprogram, DW_AT_name("BCACHE_wb")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("_BCACHE_wb")
	.dwattr $C$DW$38, DW_AT_declaration
	.dwattr $C$DW$38, DW_AT_external
$C$DW$39	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$41)
$C$DW$40	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$42)
$C$DW$41	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$59)
	.dwendtag $C$DW$38

$C$DW$42	.dwtag  DW_TAG_variable, DW_AT_name("DDR2")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("_DDR2")
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$42, DW_AT_declaration
	.dwattr $C$DW$42, DW_AT_external
$C$DW$43	.dwtag  DW_TAG_variable, DW_AT_name("MPCSXFER_BufferSize")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("_MPCSXFER_BufferSize")
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$43, DW_AT_declaration
	.dwattr $C$DW$43, DW_AT_external
	.global	_buf
_buf:	.usect	".far",4,4
$C$DW$44	.dwtag  DW_TAG_variable, DW_AT_name("buf")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("_buf")
	.dwattr $C$DW$44, DW_AT_location[DW_OP_addr _buf]
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$44, DW_AT_external
	.global	_frameCols
_frameCols:	.usect	".far",2,2
$C$DW$45	.dwtag  DW_TAG_variable, DW_AT_name("frameCols")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("_frameCols")
	.dwattr $C$DW$45, DW_AT_location[DW_OP_addr _frameCols]
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$45, DW_AT_external
	.global	_frameRows
_frameRows:	.usect	".far",2,2
$C$DW$46	.dwtag  DW_TAG_variable, DW_AT_name("frameRows")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("_frameRows")
	.dwattr $C$DW$46, DW_AT_location[DW_OP_addr _frameRows]
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$46, DW_AT_external
	.global	_kernelCols
_kernelCols:	.usect	".far",2,2
$C$DW$47	.dwtag  DW_TAG_variable, DW_AT_name("kernelCols")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("_kernelCols")
	.dwattr $C$DW$47, DW_AT_location[DW_OP_addr _kernelCols]
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$47, DW_AT_external
	.global	_kernelRows
_kernelRows:	.usect	".far",2,2
$C$DW$48	.dwtag  DW_TAG_variable, DW_AT_name("kernelRows")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("_kernelRows")
	.dwattr $C$DW$48, DW_AT_location[DW_OP_addr _kernelRows]
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$48, DW_AT_external
	.global	_sizeFrame
_sizeFrame:	.usect	".far",4,4
$C$DW$49	.dwtag  DW_TAG_variable, DW_AT_name("sizeFrame")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("_sizeFrame")
	.dwattr $C$DW$49, DW_AT_location[DW_OP_addr _sizeFrame]
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$49, DW_AT_external
	.global	_sizeKernel
_sizeKernel:	.usect	".far",4,4
$C$DW$50	.dwtag  DW_TAG_variable, DW_AT_name("sizeKernel")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("_sizeKernel")
	.dwattr $C$DW$50, DW_AT_location[DW_OP_addr _sizeKernel]
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$50, DW_AT_external
	.global	_sizeHalfRect
_sizeHalfRect:	.usect	".far",4,4
$C$DW$51	.dwtag  DW_TAG_variable, DW_AT_name("sizeHalfRect")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("_sizeHalfRect")
	.dwattr $C$DW$51, DW_AT_location[DW_OP_addr _sizeHalfRect]
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$51, DW_AT_external
	.global	_pdf_model0
_pdf_model0:	.usect	".far",64,8
$C$DW$52	.dwtag  DW_TAG_variable, DW_AT_name("pdf_model0")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("_pdf_model0")
	.dwattr $C$DW$52, DW_AT_location[DW_OP_addr _pdf_model0]
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$94)
	.dwattr $C$DW$52, DW_AT_external
	.global	_pdf_model_full
_pdf_model_full:	.usect	".far",192,8
$C$DW$53	.dwtag  DW_TAG_variable, DW_AT_name("pdf_model_full")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("_pdf_model_full")
	.dwattr $C$DW$53, DW_AT_location[DW_OP_addr _pdf_model_full]
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$95)
	.dwattr $C$DW$53, DW_AT_external
	.global	_pdf_size
_pdf_size:	.usect	".far",4,4
$C$DW$54	.dwtag  DW_TAG_variable, DW_AT_name("pdf_size")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("_pdf_size")
	.dwattr $C$DW$54, DW_AT_location[DW_OP_addr _pdf_size]
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$54, DW_AT_external
	.global	_kernel
_kernel:	.usect	".far",19952,8
$C$DW$55	.dwtag  DW_TAG_variable, DW_AT_name("kernel")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("_kernel")
	.dwattr $C$DW$55, DW_AT_location[DW_OP_addr _kernel]
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$97)
	.dwattr $C$DW$55, DW_AT_external
	.global	_weight
_weight:	.usect	".far",4,4
$C$DW$56	.dwtag  DW_TAG_variable, DW_AT_name("weight")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("_weight")
	.dwattr $C$DW$56, DW_AT_location[DW_OP_addr _weight]
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$109)
	.dwattr $C$DW$56, DW_AT_external
	.global	_normalized_C
_normalized_C:	.usect	".far",4,4
$C$DW$57	.dwtag  DW_TAG_variable, DW_AT_name("normalized_C")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("_normalized_C")
	.dwattr $C$DW$57, DW_AT_location[DW_OP_addr _normalized_C]
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$57, DW_AT_external
	.global	_target_Region
_target_Region:	.usect	".far",8,2
$C$DW$58	.dwtag  DW_TAG_variable, DW_AT_name("target_Region")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("_target_Region")
	.dwattr $C$DW$58, DW_AT_location[DW_OP_addr _target_Region]
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$119)
	.dwattr $C$DW$58, DW_AT_external
	.global	_bin_width
_bin_width:	.usect	".far",1,1
$C$DW$59	.dwtag  DW_TAG_variable, DW_AT_name("bin_width")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("_bin_width")
	.dwattr $C$DW$59, DW_AT_location[DW_OP_addr _bin_width]
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$112)
	.dwattr $C$DW$59, DW_AT_external
	.global	_iteration
_iteration:	.usect	".far",4,4
$C$DW$60	.dwtag  DW_TAG_variable, DW_AT_name("iteration")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("_iteration")
	.dwattr $C$DW$60, DW_AT_location[DW_OP_addr _iteration]
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$60, DW_AT_external
	.global	_checkGPP
_checkGPP:	.usect	".far",4,4
$C$DW$61	.dwtag  DW_TAG_variable, DW_AT_name("checkGPP")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("_checkGPP")
	.dwattr $C$DW$61, DW_AT_location[DW_OP_addr _checkGPP]
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$61, DW_AT_external
	.global	_bufferBytesPerData
_bufferBytesPerData:	.usect	".far",4,4
$C$DW$62	.dwtag  DW_TAG_variable, DW_AT_name("bufferBytesPerData")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("_bufferBytesPerData")
	.dwattr $C$DW$62, DW_AT_location[DW_OP_addr _bufferBytesPerData]
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$62, DW_AT_external
	.global	_bufferSize
_bufferSize:	.usect	".far",4,4
$C$DW$63	.dwtag  DW_TAG_variable, DW_AT_name("bufferSize")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("_bufferSize")
	.dwattr $C$DW$63, DW_AT_location[DW_OP_addr _bufferSize]
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$63, DW_AT_external
	.global	_runningCode
_runningCode:	.usect	".far",4,4
$C$DW$64	.dwtag  DW_TAG_variable, DW_AT_name("runningCode")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("_runningCode")
	.dwattr $C$DW$64, DW_AT_location[DW_OP_addr _runningCode]
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$64, DW_AT_external
	.global	_address_target_region_x
_address_target_region_x:	.usect	".far",4,4
$C$DW$65	.dwtag  DW_TAG_variable, DW_AT_name("address_target_region_x")
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("_address_target_region_x")
	.dwattr $C$DW$65, DW_AT_location[DW_OP_addr _address_target_region_x]
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$65, DW_AT_external
	.global	_address_target_region_y
_address_target_region_y:	.usect	".far",4,4
$C$DW$66	.dwtag  DW_TAG_variable, DW_AT_name("address_target_region_y")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("_address_target_region_y")
	.dwattr $C$DW$66, DW_AT_location[DW_OP_addr _address_target_region_y]
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$66, DW_AT_external
	.global	_address_target_region_width
_address_target_region_width:	.usect	".far",4,4
$C$DW$67	.dwtag  DW_TAG_variable, DW_AT_name("address_target_region_width")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("_address_target_region_width")
	.dwattr $C$DW$67, DW_AT_location[DW_OP_addr _address_target_region_width]
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$67, DW_AT_external
	.global	_address_target_region_height
_address_target_region_height:	.usect	".far",4,4
$C$DW$68	.dwtag  DW_TAG_variable, DW_AT_name("address_target_region_height")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("_address_target_region_height")
	.dwattr $C$DW$68, DW_AT_location[DW_OP_addr _address_target_region_height]
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$68, DW_AT_external
_count$1:	.usect	".far",4,4
;	/data/bbToolChain/usr/local/share/c6000/bin/opt6x /tmp/02987S1tjte /tmp/02987inNz6m 
	.sect	".text"
	.clink
	.global	_pdf_representation_half

$C$DW$69	.dwtag  DW_TAG_subprogram, DW_AT_name("pdf_representation_half")
	.dwattr $C$DW$69, DW_AT_low_pc(_pdf_representation_half)
	.dwattr $C$DW$69, DW_AT_high_pc(0x00)
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("_pdf_representation_half")
	.dwattr $C$DW$69, DW_AT_external
	.dwattr $C$DW$69, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$69, DW_AT_TI_begin_line(0x137)
	.dwattr $C$DW$69, DW_AT_TI_begin_column(0x08)
	.dwattr $C$DW$69, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$69, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 312,column 3,is_stmt,address _pdf_representation_half
$C$DW$70	.dwtag  DW_TAG_formal_parameter, DW_AT_name("buffer")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("_buffer")
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$70, DW_AT_location[DW_OP_reg4]
$C$DW$71	.dwtag  DW_TAG_formal_parameter, DW_AT_name("pdf_model")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("_pdf_model")
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$71, DW_AT_location[DW_OP_reg20]

;******************************************************************************
;* FUNCTION NAME: pdf_representation_half                                     *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,A16,A17,A18,A19,A20,A21,A30,A31,B16,B17,*
;*                           B31                                              *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A30,A31,B16, *
;*                           B17,B31                                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_pdf_representation_half:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     _pdf_size,A3
           MVKH    .S1     _pdf_size,A3
           LDW     .D1T1   *A3,A0            ; |327| 
           MVK     .L2     0x1,B6
           MV      .L1X    B4,A16            ; |312| 
           MV      .L1     A4,A17            ; |312| 
           MV      .L1X    B3,A19            ; |312| 
           CMPGT   .L1     A0,0,A1           ; |327| 

   [!A1]   BNOP    .S1     $C$L4,5           ; |327| 
|| [ A1]   SUB     .L1     A0,1,A0

           ; BRANCHCC OCCURS {$C$L4}         ; |327| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 327
;*      Loop opening brace source line   : 328
;*      Loop closing brace source line   : 331
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 0
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 1
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     1*       0     
;*      .D units                     0        1*    
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        1*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1*       0     
;*      Bound(.L .S .D .LS .LSD)     1*       1*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 1  Schedule found with 6 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*                               |    **                          |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 5
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 2
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 5 + trip_cnt * 1        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A0,1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C25:
;*   0      [ A0]   BDEC    .S1     $C$C25,A0         ; |327| 
;*   1              NOP             4
;*   5              STW     .D2T2   B4,*B5++          ; |327| 
;*   6              ; BRANCHCC OCCURS {$C$C25}        ; |327| 
;*----------------------------------------------------------------------------*
$C$L1:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 5
   [ A0]   BDEC    .S1     $C$L2,A0          ; |327| (P) <0,0> 
   [ A0]   BDEC    .S1     $C$L2,A0          ; |327| (P) <1,0> 
   [ A0]   BDEC    .S1     $C$L2,A0          ; |327| (P) <2,0> 
   [ A0]   BDEC    .S1     $C$L2,A0          ; |327| (P) <3,0> 
	.dwpsn	file "task.c",line 327,column 0,is_stmt

           MV      .L2     B4,B5
||         MV      .S2     B6,B4
|| [ A0]   BDEC    .S1     $C$L2,A0          ; |327| (P) <4,0> 

;** --------------------------------------------------------------------------*
$C$L2:    ; PIPED LOOP KERNEL
$C$DW$L$_pdf_representation_half$3$B:
	.dwpsn	file "task.c",line 328,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 1
	.dwpsn	file "task.c",line 331,column 0,is_stmt

           STW     .D2T2   B4,*B5++          ; |327| <0,5> 
|| [ A0]   BDEC    .S1     $C$L2,A0          ; |327| <5,0> 

$C$DW$L$_pdf_representation_half$3$E:
;** --------------------------------------------------------------------------*
$C$L3:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 18
           MVKL    .S1     _target_Region+4,A4
           MVKH    .S1     _target_Region+4,A4

           ADD     .L1     2,A4,A3
||         LDH     .D1T1   *A4,A18           ; |343| 

           LDH     .D1T1   *A3,A3            ; |344| 
           ZERO    .L1     A5                ; |344| 
           NOP             2

           MPYLI   .M1     A18,A5,A7:A6
||         MPY     .M2X    A18,3,B8          ; |343| 

           SHRU    .S1     A3,31,A4          ; |344| 
           ADD     .L1     A3,A4,A3          ; |344| 
           SHR     .S1     A3,1,A3           ; |344| 

           CMPGT   .L1     A3,0,A0           ; |344| 
||         MV      .S1     A3,A8             ; |347| 

   [!A0]   B       .S1     $C$L8             ; |344| 
|| [ A0]   CMPGT   .L2     B8,0,B0           ; |350| 

   [ B0]   MVK     .S1     344,A3
|| [ B0]   MVKL    .S2     _bin_width,B4

   [ B0]   MVK     .L1     3,A31
   [ B0]   MPYLI   .M1     A3,A5,A21:A20
   [ B0]   MVKL    .S1     __divi,A3         ; |369| 
           MPYLI   .M1     A31,A6,A7:A6
           ; BRANCHCC OCCURS {$C$L8}         ; |344| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

   [ B0]   MVKH    .S2     _bin_width,B4
|| [ B0]   MVKH    .S1     __divi,A3         ; |369| 

	.dwpsn	file "task.c",line 344,column 0,is_stmt
   [!B0]   B       .S1     $C$L7             ; |350| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L5
;** --------------------------------------------------------------------------*
$C$L5:    
$C$DW$L$_pdf_representation_half$7$B:
	.dwpsn	file "task.c",line 345,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 5
   [ B0]   LDB     .D2T2   *B4,B6
           NOP             3
           ADD     .L1     A17,A6,A4
           ; BRANCHCC OCCURS {$C$L7}         ; |350| 
$C$DW$L$_pdf_representation_half$7$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_pdf_representation_half$8$B:
;          EXCLUSIVE CPU CYCLES: 5
$C$DW$72	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$72, DW_AT_low_pc(0x00)
	.dwattr $C$DW$72, DW_AT_name("__divi")
	.dwattr $C$DW$72, DW_AT_TI_call

           CALL    .S2X    A3                ; |369| 
||         SUB     .L1     A4,3,A9
||         MVKL    .S1     _normalized_C,A30
||         ADD     .D1X    2,B8,A7
||         MV      .L2     B6,B4             ; |369| 

           LDBU    .D1T1   *++A9(3),A4       ; |369| 
||         MVKL    .S2     _kernel,B5
||         MVKH    .S1     _normalized_C,A30
||         MV      .L2X    A16,B31

           MVKH    .S2     _kernel,B5
||         LDW     .D1T2   *A30,B7
||         ADDAD   .D2     B31,16,B9

           ADD     .L2X    B5,A20,B16
	.dwpsn	file "task.c",line 350,column 0,is_stmt
           LDW     .D2T2   *B16++(12),B17    ; |350| 
$C$DW$L$_pdf_representation_half$8$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L6:    
$C$DW$L$_pdf_representation_half$9$B:
	.dwpsn	file "task.c",line 351,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL0,B3,0       ; |369| 
$C$RL0:    ; CALL OCCURS {__divi} {0}        ; |369| 
$C$DW$L$_pdf_representation_half$9$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_pdf_representation_half$10$B:
;          EXCLUSIVE CPU CYCLES: 25
           MVKL    .S2     __divi,B5         ; |370| 
           MV      .L1     A4,A6             ; |369| 

           MPY32   .M2     B7,B17,B17        ; |350| 
||         MVKH    .S2     __divi,B5         ; |370| 
||         LDW     .D1T1   *+A16[A6],A3      ; |369| 

$C$DW$73	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$73, DW_AT_low_pc(0x00)
	.dwattr $C$DW$73, DW_AT_name("__divi")
	.dwattr $C$DW$73, DW_AT_TI_call
           CALL    .S2     B5                ; |370| 
           LDBU    .D1T1   *+A9(1),A4        ; |370| 
           ADDKPC  .S2     $C$RL1,B3,1       ; |370| 
           ADD     .L1X    B17,A3,A3         ; |369| 

           MV      .L2     B6,B4             ; |370| 
||         STW     .D1T1   A3,*+A16[A6]      ; |369| 

$C$RL1:    ; CALL OCCURS {__divi} {0}        ; |370| 
           ADDAW   .D1     A16,A4,A3         ; |370| 
           ADDAD   .D1     A3,8,A6           ; |370| 
           LDW     .D1T1   *A6,A3            ; |370| 
           LDBU    .D1T1   *+A9(2),A4        ; |371| 
           NOP             3

           ADD     .L2X    B17,A3,B4         ; |370| 
||         MVKL    .S1     __divi,A3         ; |371| 

           MVKH    .S1     __divi,A3         ; |371| 
           STW     .D1T2   B4,*A6            ; |370| 
$C$DW$74	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$74, DW_AT_low_pc(0x00)
	.dwattr $C$DW$74, DW_AT_name("__divi")
	.dwattr $C$DW$74, DW_AT_TI_call
           CALL    .S2X    A3                ; |371| 
           MV      .L2     B6,B4             ; |371| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |371| 
$C$RL2:    ; CALL OCCURS {__divi} {0}        ; |371| 
$C$DW$L$_pdf_representation_half$10$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_pdf_representation_half$11$B:
;          EXCLUSIVE CPU CYCLES: 8

           SUB     .L1     A7,3,A7           ; |350| 
||         MVKL    .S1     __divi,A3         ; |369| 
||         MV      .L2X    A4,B5             ; |371| 

           LDW     .D2T2   *+B9[B5],B4       ; |371| 
||         CMPLTU  .L1     A7,3,A0           ; |350| 
||         MVKH    .S1     __divi,A3         ; |369| 

   [!A0]   B       .S1     $C$L6             ; |350| 
$C$DW$75	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$75, DW_AT_low_pc(0x00)
	.dwattr $C$DW$75, DW_AT_name("__divi")
	.dwattr $C$DW$75, DW_AT_TI_call
   [!A0]   CALL    .S2X    A3                ; |369| 
   [!A0]   LDBU    .D1T1   *++A9(3),A4       ; |369| 
           NOP             1

           ADD     .L2     B17,B4,B4         ; |371| 
|| [!A0]   LDW     .D2T2   *B16++(12),B17    ; |350| 

	.dwpsn	file "task.c",line 379,column 0,is_stmt

           STW     .D2T2   B4,*+B9[B5]       ; |371| 
|| [!A0]   MV      .L2     B6,B4             ; |369| 

           ; BRANCHCC OCCURS {$C$L6}         ; |350| 
$C$DW$L$_pdf_representation_half$11$E:
;** --------------------------------------------------------------------------*
$C$L7:    
$C$DW$L$_pdf_representation_half$12$B:
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A8,1,A0           ; |344| 
||         ADD     .S1     1,A5,A5           ; |344| 
||         CMPGT   .L2     B8,0,B0           ; |350| 
||         SUB     .D1     A8,1,A8           ; |344| 

   [ A0]   B       .S2     $C$L5             ; |344| 
|| [ A0]   MPYLI   .M1     A18,A5,A7:A6
|| [ B0]   MVK     .S1     344,A3
|| [ B0]   MVK     .L1     3,A31

   [ B0]   MPYLI   .M1     A3,A5,A21:A20
|| [ B0]   MVKL    .S1     __divi,A3         ; |369| 
|| [ B0]   MVKL    .S2     _bin_width,B4

   [ B0]   MVKH    .S1     __divi,A3         ; |369| 
|| [ B0]   MVKH    .S2     _bin_width,B4

   [!A0]   MVK     .L2     0x1,B0            ; |369| nullify predicate
   [ A0]   MPYLI   .M1     A31,A6,A7:A6
	.dwpsn	file "task.c",line 381,column 0,is_stmt
   [!B0]   B       .S1     $C$L7             ; |350| 
           ; BRANCHCC OCCURS {$C$L5}         ; |344| 
$C$DW$L$_pdf_representation_half$12$E:
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 6
	.dwpsn	file "task.c",line 383,column 3,is_stmt
$C$DW$76	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$76, DW_AT_low_pc(0x00)
	.dwattr $C$DW$76, DW_AT_TI_return
           RETNOP  .S2X    A19,5             ; |383| 
           ; BRANCH OCCURS {A19}             ; |383| 

$C$DW$77	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$77, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L5:1:1496782367")
	.dwattr $C$DW$77, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$77, DW_AT_TI_begin_line(0x158)
	.dwattr $C$DW$77, DW_AT_TI_end_line(0x17d)
$C$DW$78	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$78, DW_AT_low_pc($C$DW$L$_pdf_representation_half$7$B)
	.dwattr $C$DW$78, DW_AT_high_pc($C$DW$L$_pdf_representation_half$7$E)
$C$DW$79	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$79, DW_AT_low_pc($C$DW$L$_pdf_representation_half$8$B)
	.dwattr $C$DW$79, DW_AT_high_pc($C$DW$L$_pdf_representation_half$8$E)
$C$DW$80	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$80, DW_AT_low_pc($C$DW$L$_pdf_representation_half$12$B)
	.dwattr $C$DW$80, DW_AT_high_pc($C$DW$L$_pdf_representation_half$12$E)

$C$DW$81	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$81, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L6:2:1496782367")
	.dwattr $C$DW$81, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$81, DW_AT_TI_begin_line(0x15e)
	.dwattr $C$DW$81, DW_AT_TI_end_line(0x17b)
$C$DW$82	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$82, DW_AT_low_pc($C$DW$L$_pdf_representation_half$9$B)
	.dwattr $C$DW$82, DW_AT_high_pc($C$DW$L$_pdf_representation_half$9$E)
$C$DW$83	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$83, DW_AT_low_pc($C$DW$L$_pdf_representation_half$10$B)
	.dwattr $C$DW$83, DW_AT_high_pc($C$DW$L$_pdf_representation_half$10$E)
$C$DW$84	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$84, DW_AT_low_pc($C$DW$L$_pdf_representation_half$11$B)
	.dwattr $C$DW$84, DW_AT_high_pc($C$DW$L$_pdf_representation_half$11$E)
	.dwendtag $C$DW$81

	.dwendtag $C$DW$77


$C$DW$85	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$85, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L2:1:1496782367")
	.dwattr $C$DW$85, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$85, DW_AT_TI_begin_line(0x147)
	.dwattr $C$DW$85, DW_AT_TI_end_line(0x14b)
$C$DW$86	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$86, DW_AT_low_pc($C$DW$L$_pdf_representation_half$3$B)
	.dwattr $C$DW$86, DW_AT_high_pc($C$DW$L$_pdf_representation_half$3$E)
	.dwendtag $C$DW$85

	.dwattr $C$DW$69, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$69, DW_AT_TI_end_line(0x17f)
	.dwattr $C$DW$69, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$69

	.sect	".text"
	.clink
	.global	_pdf_representation0

$C$DW$87	.dwtag  DW_TAG_subprogram, DW_AT_name("pdf_representation0")
	.dwattr $C$DW$87, DW_AT_low_pc(_pdf_representation0)
	.dwattr $C$DW$87, DW_AT_high_pc(0x00)
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("_pdf_representation0")
	.dwattr $C$DW$87, DW_AT_external
	.dwattr $C$DW$87, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$87, DW_AT_TI_begin_line(0x11b)
	.dwattr $C$DW$87, DW_AT_TI_begin_column(0x08)
	.dwattr $C$DW$87, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$87, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 284,column 3,is_stmt,address _pdf_representation0

;******************************************************************************
;* FUNCTION NAME: pdf_representation0                                         *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,A16,A17,A18,A19,A20,A21,A22,A31,B16,B31 *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,A31,B16, *
;*                           B31                                              *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_pdf_representation0:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
           MVKL    .S1     _pdf_model0,A17
           MVKL    .S1     _target_Region+2,A4
           MVKH    .S1     _pdf_model0,A17

           MVKH    .S1     _target_Region+2,A4
||         MVK     .L1     3,A0              ; |291| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 291
;*      Loop opening brace source line   : 292
;*      Loop closing brace source line   : 292
;*      Loop Unroll Multiple             : 2x
;*      Known Minimum Trip Count         : 8                    
;*      Known Maximum Trip Count         : 8                    
;*      Known Max Trip Count Factor      : 8
;*      Loop Carried Dependency Bound(^) : 0
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 1
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     1*       0     
;*      .D units                     0        1*    
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        1*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1*       0     
;*      Bound(.L .S .D .LS .LSD)     1*       1*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 1  Schedule found with 6 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*                               |    ***                         |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Epilog not entirely removed
;*      Collapsed epilog stages       : 1
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 5 (after unrolling)
;*
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 5 + min_trip_cnt * 1 = 13        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A0,1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C72:
;*   0      [ A0]   BDEC    .S1     $C$C72,A0         ; |291| 
;*   1              NOP             4
;*   5              STDW    .D2T2   B5:B4,*B6++       ; |291| 
;*   6              ; BRANCHCC OCCURS {$C$C72}        ; |291| 
;*----------------------------------------------------------------------------*
$C$L9:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 5

           LDH     .D1T2   *A4,B9            ; |288| 
|| [ A0]   BDEC    .S1     $C$L10,A0         ; |291| (P) <0,0> 

   [ A0]   BDEC    .S1     $C$L10,A0         ; |291| (P) <1,0> 
   [ A0]   BDEC    .S1     $C$L10,A0         ; |291| (P) <2,0> 

           MVK     .L2     1,B4
|| [ A0]   BDEC    .S1     $C$L10,A0         ; |291| (P) <3,0> 

	.dwpsn	file "task.c",line 291,column 0,is_stmt

           MV      .L1X    B3,A22            ; |284| 
||         MV      .L2     B4,B5
||         MV      .S2X    A17,B6
|| [ A0]   BDEC    .S1     $C$L10,A0         ; |291| (P) <4,0> 

;** --------------------------------------------------------------------------*
$C$L10:    ; PIPED LOOP KERNEL
$C$DW$L$_pdf_representation0$3$B:
	.dwpsn	file "task.c",line 292,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 1

           STDW    .D2T2   B5:B4,*B6++       ; |291| <0,5> 
|| [ A0]   BDEC    .S1     $C$L10,A0         ; |291| <5,0> 

$C$DW$L$_pdf_representation0$3$E:
;** --------------------------------------------------------------------------*
$C$L11:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16

           STDW    .D2T2   B5:B4,*B6++       ; |291| (E) <2,5> 
||         ADD     .L1     4,A4,A3

           STDW    .D2T2   B5:B4,*B6++       ; |291| (E) <3,5> 
           STDW    .D2T2   B5:B4,*B6++       ; |291| (E) <4,5> 
           STDW    .D2T2   B5:B4,*B6++       ; |291| (E) <5,5> 
           LDH     .D1T1   *A3,A3            ; |294| 
           ZERO    .L1     A5                ; |294| 
           ADD     .L2X    2,A4,B5
           ADD     .L1     -2,A4,A4
           NOP             1

           CMPGT   .L1     A3,0,A0           ; |294| 
||         MV      .S1     A3,A9

   [!A0]   BNOP    .S1     $C$L15,4          ; |294| 
|| [ A0]   LDH     .D2T2   *B5,B8

           CMPGT   .L2     B8,0,B0           ; |297| 
           ; BRANCHCC OCCURS {$C$L15}        ; |294| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVKL    .S1     _frameCols,A3
|| [ B0]   MVKL    .S2     _buf,B4
||         LDH     .D1T1   *A4,A7

   [ B0]   MVKH    .S2     _buf,B4
||         MVKH    .S1     _frameCols,A3

	.dwpsn	file "task.c",line 294,column 0,is_stmt

   [ B0]   MVK     .S1     344,A4
|| [ B0]   MVKL    .S2     _bin_width,B31

;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L12
;** --------------------------------------------------------------------------*
$C$L12:    
$C$DW$L$_pdf_representation0$7$B:
	.dwpsn	file "task.c",line 295,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 7

   [ B0]   LDH     .D1T1   *A3,A3
|| [ B0]   MVKH    .S2     _bin_width,B31
|| [ B0]   LDW     .D2T2   *B4,B5
|| [ B0]   MPYLI   .M1     A4,A5,A21:A20

   [!B0]   BNOP    .S1     $C$L14,3          ; |297| 
|| [ B0]   LDB     .D2T2   *B31,B6

           MPYLI   .M1X    A3,B9,A19:A18
           NOP             1
           ; BRANCHCC OCCURS {$C$L14}        ; |297| 
$C$DW$L$_pdf_representation0$7$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_pdf_representation0$8$B:
;          EXCLUSIVE CPU CYCLES: 6

           MVKL    .S2     _kernel,B7
||         MVKL    .S1     _normalized_C,A31
||         MV      .L1X    B8,A8

           MVKH    .S2     _kernel,B7
||         MVKH    .S1     _normalized_C,A31
||         MV      .L2     B6,B4             ; |297| 

           ADD     .L1     A7,A18,A4
||         ADD     .L2X    B7,A20,B16
||         LDW     .D1T2   *A31,B7

           ADD     .L1X    B5,A4,A16
||         MVKL    .S2     __divi,B5         ; |297| 

           MVKH    .S2     __divi,B5         ; |297| 
	.dwpsn	file "task.c",line 297,column 0,is_stmt
$C$DW$88	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$88, DW_AT_low_pc(0x00)
	.dwattr $C$DW$88, DW_AT_name("__divi")
	.dwattr $C$DW$88, DW_AT_TI_call
           CALL    .S2     B5                ; |297| 
$C$DW$L$_pdf_representation0$8$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L13:    
$C$DW$L$_pdf_representation0$9$B:
	.dwpsn	file "task.c",line 298,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 5
           LDBU    .D1T1   *A16++,A4         ; |297| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |297| 
$C$RL3:    ; CALL OCCURS {__divi} {0}        ; |297| 
$C$DW$L$_pdf_representation0$9$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_pdf_representation0$10$B:
;          EXCLUSIVE CPU CYCLES: 11

           LDW     .D2T2   *B16++,B4         ; |297| 
||         SUB     .L1     A8,1,A0           ; |297| 

           SUB     .L1     A8,1,A8           ; |297| 
           LDW     .D1T1   *+A17[A4],A3      ; |297| 
   [ A0]   MVKL    .S2     __divi,B5         ; |297| 
   [ A0]   MVKH    .S2     __divi,B5         ; |297| 

   [ A0]   BNOP    .S1     $C$L13,3          ; |297| 
||         MPY32   .M2     B7,B4,B4          ; |297| 

           ADD     .L2X    B4,A3,B4          ; |297| 
	.dwpsn	file "task.c",line 304,column 0,is_stmt
$C$DW$89	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$89, DW_AT_low_pc(0x00)
	.dwattr $C$DW$89, DW_AT_name("__divi")
	.dwattr $C$DW$89, DW_AT_TI_call

   [ A0]   CALL    .S2     B5                ; |297| 
||         STW     .D1T2   B4,*+A17[A4]      ; |297| 
|| [ A0]   MV      .L2     B6,B4             ; |297| 

           ; BRANCHCC OCCURS {$C$L13}        ; |297| 
$C$DW$L$_pdf_representation0$10$E:
;** --------------------------------------------------------------------------*
$C$L14:    
$C$DW$L$_pdf_representation0$11$B:
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A9,1,A0           ; |294| 
||         CMPGT   .L2     B8,0,B0           ; |297| 
||         SUB     .S1     A9,1,A9           ; |294| 
||         ADD     .S2     1,B9,B9           ; |294| 
||         ADD     .D1     1,A5,A5           ; |294| 

   [ A0]   B       .S1     $C$L12            ; |294| 
|| [ B0]   MVKL    .S2     _buf,B4

   [ B0]   MVKH    .S2     _buf,B4
   [ A0]   MVKL    .S1     _frameCols,A3
   [ B0]   MVKL    .S2     _bin_width,B31
   [ A0]   MVKH    .S1     _frameCols,A3
	.dwpsn	file "task.c",line 306,column 0,is_stmt
   [ B0]   MVK     .S1     344,A4
           ; BRANCHCC OCCURS {$C$L12}        ; |294| 
$C$DW$L$_pdf_representation0$11$E:
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 6
	.dwpsn	file "task.c",line 307,column 3,is_stmt
$C$DW$90	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$90, DW_AT_low_pc(0x00)
	.dwattr $C$DW$90, DW_AT_TI_return
           RETNOP  .S2X    A22,5             ; |307| 
           ; BRANCH OCCURS {A22}             ; |307| 

$C$DW$91	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$91, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L12:1:1496782367")
	.dwattr $C$DW$91, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$91, DW_AT_TI_begin_line(0x126)
	.dwattr $C$DW$91, DW_AT_TI_end_line(0x132)
$C$DW$92	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$92, DW_AT_low_pc($C$DW$L$_pdf_representation0$7$B)
	.dwattr $C$DW$92, DW_AT_high_pc($C$DW$L$_pdf_representation0$7$E)
$C$DW$93	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$93, DW_AT_low_pc($C$DW$L$_pdf_representation0$8$B)
	.dwattr $C$DW$93, DW_AT_high_pc($C$DW$L$_pdf_representation0$8$E)
$C$DW$94	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$94, DW_AT_low_pc($C$DW$L$_pdf_representation0$11$B)
	.dwattr $C$DW$94, DW_AT_high_pc($C$DW$L$_pdf_representation0$11$E)

$C$DW$95	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$95, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L13:2:1496782367")
	.dwattr $C$DW$95, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$95, DW_AT_TI_begin_line(0x129)
	.dwattr $C$DW$95, DW_AT_TI_end_line(0x130)
$C$DW$96	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$96, DW_AT_low_pc($C$DW$L$_pdf_representation0$9$B)
	.dwattr $C$DW$96, DW_AT_high_pc($C$DW$L$_pdf_representation0$9$E)
$C$DW$97	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$97, DW_AT_low_pc($C$DW$L$_pdf_representation0$10$B)
	.dwattr $C$DW$97, DW_AT_high_pc($C$DW$L$_pdf_representation0$10$E)
	.dwendtag $C$DW$95

	.dwendtag $C$DW$91


$C$DW$98	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$98, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L10:1:1496782367")
	.dwattr $C$DW$98, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$98, DW_AT_TI_begin_line(0x123)
	.dwattr $C$DW$98, DW_AT_TI_end_line(0x124)
$C$DW$99	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$99, DW_AT_low_pc($C$DW$L$_pdf_representation0$3$B)
	.dwattr $C$DW$99, DW_AT_high_pc($C$DW$L$_pdf_representation0$3$E)
	.dwendtag $C$DW$98

	.dwattr $C$DW$87, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$87, DW_AT_TI_end_line(0x133)
	.dwattr $C$DW$87, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$87

	.sect	".text"
	.clink
	.global	_assignPdfModelToBuffer

$C$DW$100	.dwtag  DW_TAG_subprogram, DW_AT_name("assignPdfModelToBuffer")
	.dwattr $C$DW$100, DW_AT_low_pc(_assignPdfModelToBuffer)
	.dwattr $C$DW$100, DW_AT_high_pc(0x00)
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("_assignPdfModelToBuffer")
	.dwattr $C$DW$100, DW_AT_external
	.dwattr $C$DW$100, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$100, DW_AT_TI_begin_line(0xd8)
	.dwattr $C$DW$100, DW_AT_TI_begin_column(0x08)
	.dwattr $C$DW$100, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$100, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 216,column 32,is_stmt,address _assignPdfModelToBuffer

;******************************************************************************
;* FUNCTION NAME: assignPdfModelToBuffer                                      *
;*                                                                            *
;*   Regs Modified     : A3,A4,A5,A6,A7,A8,B0,B4,B5,B6                        *
;*   Regs Used         : A3,A4,A5,A6,A7,A8,B0,B3,B4,B5,B6                     *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_assignPdfModelToBuffer:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S1     _sizeFrame,A3
           MVKH    .S1     _sizeFrame,A3

           LDW     .D1T1   *A3,A3            ; |218| 
||         MVKL    .S2     _buf,B5

           MVKL    .S2     _pdf_model0,B4
           MVK     .S2     0x10,B6
           MVKH    .S2     _buf,B5
           DINT                              ; interrupts off

           MV      .L1X    B5,A3
||         ADD     .S1     8,A3,A6           ; |218| 
||         LDW     .D2T1   *B5,A4
||         SUB     .L2     B6,1,B0
||         MVKH    .S2     _pdf_model0,B4

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 220
;*      Loop opening brace source line   : 220
;*      Loop closing brace source line   : 226
;*      Known Minimum Trip Count         : 16                    
;*      Known Maximum Trip Count         : 16                    
;*      Known Max Trip Count Factor      : 16
;*      Loop Carried Dependency Bound(^) : 27
;*      Unpartitioned Resource Bound     : 5
;*      Partitioned Resource Bound(*)    : 5
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     2        2     
;*      .D units                     4        5*    
;*      .M units                     0        0     
;*      .X cross paths               0        1     
;*      .T address paths             5*       4     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          3        2     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        1     
;*      Bound(.L .S .D .LS .LSD)     3        3     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 27 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |   ** *                         |*   *                           |
;*       1: |   ** *                         |*   *                           |
;*       2: |   ** *                         |*   *                           |
;*       3: |   ** *                         |*   *                           |
;*       4: |   ** *                         |*   *                           |
;*       5: |   ****                         |*   *                           |
;*       6: |   ****                         |*   *                           |
;*       7: |   *  *                         |*   *                           |
;*       8: |   *  *                         |*   *                           |
;*       9: |   *  *                         |*   *                           |
;*      10: |   *  *                         |*   *                           |
;*      11: |   *  *                         |*   *                           |
;*      12: |   ** *                         |*   **                          |
;*      13: |   ******                       |*   *                           |
;*      14: |   *****                        |*   *                           |
;*      15: |   *****                        |*   *                           |
;*      16: |   *****                        |*   *                           |
;*      17: |   *****                        |*   *                           |
;*      18: |   *****                        |*   *                           |
;*      19: |   *****                        |*   **                          |
;*      20: |   *****                        |*   **                          |
;*      21: |   ** **                        |*   *                           |
;*      22: |   ** **                        |*   *                           |
;*      23: |   ** **                        |*   *                           |
;*      24: |   ** **                        |*   *                           |
;*      25: |   ** **                        |*   *                           |
;*      26: |   ** **                        |*   **                          |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*
;*      Minimum safe trip count       : 1
;*
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.125, max 1.000 }
;*      Mem bank perf. penalty (est.) : 0.5%
;*
;*      Effective ii                : { min 27.00, est 27.12, max 28.00 }
;*
;*
;*      Total cycles (est.)         : 0 + min_trip_cnt * 27 = 432        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             B0,1,B0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C118:
;*   0              LDW     .D2T1   *B4,A5            ; |220|  ^ 
;*   1              NOP             4
;*   5              SHR     .S1     A5,24,A5          ; |220|  ^ 
;*   6              STB     .D1T1   A5,*+A6[A4]       ; |220|  ^ 
;*   7              LDW     .D1T1   *A3,A4            ; |222| 
;*     ||           LDW     .D2T2   *B4,B5            ; |222|  ^ 
;*   8              NOP             4
;*  12              ADD     .D1     A6,A4,A5          ; |222| 
;*     ||           SHR     .S1X    B5,16,A8          ; |222|  ^ 
;*     ||           ADD     .L1     A4,A6,A7          ; |224| 
;*  13              STB     .D1T1   A8,*+A5(1)        ; |222|  ^ 
;*  14              LDW     .D2T2   *B4,B5            ; |223|  ^ 
;*  15              NOP             4
;*  19              SHR     .S2     B5,8,B5           ; |223|  ^ 
;*  20              STB     .D1T2   B5,*+A5(2)        ; |223|  ^ 
;*  21              LDBU    .D2T2   *B4++(4),B5       ; |224|  ^ 
;*     ||   [ B0]   BDEC    .S2     $C$C118,B0        ; |220| 
;*  22              NOP             4
;*  26              STB     .D1T2   B5,*+A7(3)        ; |224|  ^ 
;*     ||           ADD     .L1     4,A6,A6           ; |224| 
;*  27              ; BRANCHCC OCCURS {$C$C118}       ; |220| 
;*----------------------------------------------------------------------------*
$C$L16:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L17:    ; PIPED LOOP KERNEL
$C$DW$L$_assignPdfModelToBuffer$3$B:
	.dwpsn	file "task.c",line 220,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 27
           LDW     .D2T1   *B4,A5            ; |220| <0,0>  ^ 
           NOP             4
           SHR     .S1     A5,24,A5          ; |220| <0,5>  ^ 
           STB     .D1T1   A5,*+A6[A4]       ; |220| <0,6>  ^ 

           LDW     .D1T1   *A3,A4            ; |222| <0,7> 
||         LDW     .D2T2   *B4,B5            ; |222| <0,7>  ^ 

           NOP             4

           ADD     .L1     A4,A6,A7          ; |224| <0,12> 
||         ADD     .D1     A6,A4,A5          ; |222| <0,12> 
||         SHR     .S1X    B5,16,A8          ; |222| <0,12>  ^ 

           STB     .D1T1   A8,*+A5(1)        ; |222| <0,13>  ^ 
           LDW     .D2T2   *B4,B5            ; |223| <0,14>  ^ 
           NOP             4
           SHR     .S2     B5,8,B5           ; |223| <0,19>  ^ 
           STB     .D1T2   B5,*+A5(2)        ; |223| <0,20>  ^ 

   [ B0]   BDEC    .S2     $C$L17,B0         ; |220| <0,21> 
||         LDBU    .D2T2   *B4++(4),B5       ; |224| <0,21>  ^ 

           NOP             4
	.dwpsn	file "task.c",line 226,column 0,is_stmt

           ADD     .L1     4,A6,A6           ; |224| <0,26> 
||         STB     .D1T2   B5,*+A7(3)        ; |224| <0,26>  ^ 

$C$DW$L$_assignPdfModelToBuffer$3$E:
;** --------------------------------------------------------------------------*
$C$L18:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
$C$DW$101	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$101, DW_AT_low_pc(0x00)
	.dwattr $C$DW$101, DW_AT_TI_return
           RETNOP  .S2     B3,4              ; |227| 
	.dwpsn	file "task.c",line 227,column 3,is_stmt
           RINT                              ; interrupts on
           ; BRANCH OCCURS {B3}              ; |227| 

$C$DW$102	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$102, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L17:1:1496782367")
	.dwattr $C$DW$102, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$102, DW_AT_TI_begin_line(0xdc)
	.dwattr $C$DW$102, DW_AT_TI_end_line(0xe2)
$C$DW$103	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$103, DW_AT_low_pc($C$DW$L$_assignPdfModelToBuffer$3$B)
	.dwattr $C$DW$103, DW_AT_high_pc($C$DW$L$_assignPdfModelToBuffer$3$E)
	.dwendtag $C$DW$102

	.dwattr $C$DW$100, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$100, DW_AT_TI_end_line(0xe3)
	.dwattr $C$DW$100, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$100

	.sect	".text"
	.clink
	.global	_assignPdfModelFullToBuffer

$C$DW$104	.dwtag  DW_TAG_subprogram, DW_AT_name("assignPdfModelFullToBuffer")
	.dwattr $C$DW$104, DW_AT_low_pc(_assignPdfModelFullToBuffer)
	.dwattr $C$DW$104, DW_AT_high_pc(0x00)
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("_assignPdfModelFullToBuffer")
	.dwattr $C$DW$104, DW_AT_external
	.dwattr $C$DW$104, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$104, DW_AT_TI_begin_line(0xe6)
	.dwattr $C$DW$104, DW_AT_TI_begin_column(0x08)
	.dwattr $C$DW$104, DW_AT_frame_base[DW_OP_breg31 208]
	.dwattr $C$DW$104, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 231,column 3,is_stmt,address _assignPdfModelFullToBuffer
$C$DW$105	.dwtag  DW_TAG_formal_parameter, DW_AT_name("buffer")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("_buffer")
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$105, DW_AT_location[DW_OP_reg4]
$C$DW$106	.dwtag  DW_TAG_formal_parameter, DW_AT_name("pdf_model")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("_pdf_model")
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$106, DW_AT_location[DW_OP_reg20]

;******************************************************************************
;* FUNCTION NAME: assignPdfModelFullToBuffer                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Local Frame Size  : 0 Args + 152 Auto + 56 Save = 208 byte               *
;******************************************************************************
_assignPdfModelFullToBuffer:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 74
           STW     .D2T1   A11,*SP--(8)      ; |231| 
           STW     .D2T1   A10,*SP--(8)      ; |231| 
           STDW    .D2T2   B13:B12,*SP--     ; |231| 
           STDW    .D2T2   B11:B10,*SP--     ; |231| 
           STDW    .D2T1   A15:A14,*SP--     ; |231| 

           STDW    .D2T1   A13:A12,*SP--     ; |231| 
||         MVKL    .S1     _sizeHalfRect,A3

           STW     .D2T2   B3,*SP--(8)       ; |231| 
||         MVKH    .S1     _sizeHalfRect,A3

           LDW     .D1T1   *A3,A31
           ADDK    .S2     -152,SP           ; |231| 
           MVK     .S2     53,B7
           MVK     .S2     71,B6
           MVK     .S2     67,B5
           ADD     .L1     A4,A31,A5

           ADDAD   .D1     A5,6,A22
||         ADD     .L1     A4,A31,A8

           STW     .D2T1   A22,*+SP(4)
||         ADDAD   .D1     A8,5,A14
||         ADD     .L1     A4,A31,A9

           STW     .D2T1   A14,*+SP(20)
||         ADDAH   .D1     A9,23,A9
||         ADD     .L1     A4,A31,A10

           STW     .D2T1   A9,*+SP(8)
||         ADD     .L1X    B7,A10,A10
||         ADD     .S1     A4,A31,A0

           STW     .D2T1   A10,*+SP(52)
||         ADD     .L1     A4,A31,A28
||         ADDAW   .D1     A0,15,A0

           ADD     .L1     A4,A31,A25
||         ADDAH   .D1     A28,31,A28
||         STW     .D2T1   A0,*+SP(64)

           ADD     .L1     A4,A31,A13
||         ADD     .S1     A4,A31,A17
||         ADDAW   .D1     A25,11,A22
||         STW     .D2T1   A28,*+SP(72)

           ADDAH   .D1     A13,25,A14
||         ADD     .L1X    B6,A17,A13
||         STW     .D2T1   A22,*+SP(12)

           STW     .D2T1   A13,*+SP(28)
||         ADD     .L1     A4,A31,A6

           MVK     .S2     51,B6
||         ADD     .L1     A4,A31,A16
||         ADDAH   .D1     A6,29,A10
||         STW     .D2T1   A14,*+SP(24)

           ADD     .L1     A4,A31,A9
||         ADD     .S1     A4,A31,A2
||         ADDAH   .D1     A16,21,A22
||         STW     .D2T1   A10,*+SP(56)

           ADD     .L1X    B6,A2,A2
||         MVK     .S2     65,B6
||         STW     .D2T1   A22,*+SP(16)
||         ADD     .D1     A4,A31,A25
||         MVK     .S1     55,A27

           ADD     .L1     A4,A31,A12
||         ADD     .S1     A4,A31,A18
||         ADD     .L2X    B6,A9,B25
||         ADD     .D1     A27,A25,A9
||         STW     .D2T1   A2,*+SP(60)

           ADDAW   .D1     A12,13,A13
||         ADD     .L1X    B5,A18,A12
||         MVK     .S1     59,A24
||         STW     .D2T1   A9,*+SP(84)

           MV      .L1X    B4,A3             ; |231| 
||         STW     .D2T1   A12,*+SP(36)
||         ADD     .D1     A4,A31,A16
||         MVK     .S1     63,A21

           MVK     .S2     57,B4
||         ADD     .L1     A4,A31,A19
||         ADD     .S1     A4,A31,A18
||         ADDAD   .D1     A16,8,A16
||         STW     .D2T1   A13,*+SP(32)

           ADD     .L1     A4,A31,A11
||         ADD     .S1     A4,A31,A29
||         ADD     .D1     A24,A18,A9
||         STW     .D2T1   A16,*+SP(80)

           ADDAH   .D1     A11,27,A12
||         ADD     .L1X    B4,A19,A11
||         MVK     .S2     47,B4
||         ADD     .S1     A4,A31,A5
||         STW     .D2T1   A9,*+SP(92)

           ADD     .L1     A4,A31,A26
||         ADD     .S1     A4,A31,A7
||         STW     .D2T1   A11,*+SP(44)
||         ADD     .D1     A31,A4,A30

           MVK     .S2     45,B7
||         ADD     .L1X    B4,A29,A5
||         MV      .L2X    A5,B4             ; Define a twin register
||         ADD     .S1     A4,A31,A8
||         ADD     .D1     A4,A31,A1
||         STW     .D2T1   A12,*+SP(40)

           MVK     .S2     43,B8
||         STW     .D2T1   A5,*+SP(76)
||         ADDAD   .D1     A7,7,A11
||         ADD     .L1     A4,A31,A6
||         ADD     .S1     A4,A31,A17

           ADD     .L1X    B7,A26,A5
||         ADD     .S1     A4,A31,A22
||         ADD     .D1     A4,A31,A19
||         STW     .D2T1   A11,*+SP(48)

           STW     .D2T1   A5,*+SP(88)
||         ADD     .L1X    B8,A22,A5
||         ADD     .S1     A4,A31,A7
||         ADD     .D1     A4,A31,A4

           MVK     .S2     41,B6
||         MVK     .S1     70,A20
||         STW     .D2T1   A5,*+SP(100)
||         ADD     .L1     A21,A4,A4

           MVK     .S2     49,B5
||         ADD     .L1     A20,A6,A5
||         STW     .D2T1   A4,*+SP(104)

           ADD     .L1X    B6,A19,A6
||         STW     .D2T1   A5,*+SP(108)

           ADD     .L1X    B5,A1,A31
||         MVK     .S2     66,B5
||         MVK     .S1     61,A23
||         STW     .D2T1   A6,*+SP(112)

           ADD     .L2X    B5,A8,B26
||         ADD     .L1     A23,A17,A8
||         STW     .D2T1   A31,*+SP(68)

           STW     .D2T1   A8,*+SP(96)
||         MVK     .S1     56,A4             ; |243| 

           LDNDW   .D1T1   *+A3(A4),A5:A4    ; |247| 
           MVK     .S1     40,A19            ; |243| 
           MVK     .S1     56,A31            ; |243| 
           ADD     .L1     8,A30,A2
           MVK     .S1     48,A30            ; |243| 
           STW     .D2T1   A4,*+SP(116)      ; |247| 

           MV      .L1     A5,A6             ; |247| 
||         LDNDW   .D1T1   *+A3(A19),A5:A4   ; |243| 

           LDNDW   .D1T1   *+A3(A31),A21:A20 ; |243| 
           LDNDW   .D1T1   *+A3(A30),A23:A22 ; |249| 
           LDNDW   .D1T1   *+A3(A30),A25:A24 ; |243| 

           MVK     .S2     69,B5
||         LDNDW   .D1T1   *+A3(A30),A17:A16 ; |247| 

           ADD     .L2X    B5,A7,B28
||         LDNDW   .D1T1   *+A3(A30),A9:A8   ; |248| 
||         MVK     .S1     32,A18            ; |243| 

           MVK     .S1     56,A7             ; |243| 
||         MV      .L2X    A5,B19            ; |243| 
||         LDNDW   .D1T1   *+A3(A18),A11:A10 ; |247| 

           MV      .L2X    A4,B7             ; |243| 
||         LDNDW   .D1T1   *+A3(A7),A5:A4    ; |249| 

           LDNDW   .D1T1   *+A3(A19),A29:A28 ; |248| 
           LDNDW   .D1T1   *+A3(A19),A27:A26 ; |249| 

           SHR     .S1     A8,8,A14          ; |248| 
||         LDNDW   .D1T1   *+A3(A19),A31:A30 ; |247| 

           SHR     .S2X    A20,24,B16        ; |243| 
||         SHR     .S1     A9,16,A20         ; |247| 
||         LDNDW   .D1T1   *+A3(8),A9:A8     ; |247| 

           STW     .D2T1   A5,*+SP(120)      ; |249| 
||         MVK     .S1     32,A19            ; |243| 

           MV      .L2X    A4,B9             ; |249| 
||         LDNDW   .D1T1   *+A3(A19),A5:A4   ; |249| 

           LDNDW   .D1T1   *+A3(A19),A1:A0   ; |248| 
           LDW     .D2T1   *+SP(104),A7      ; |249| 
           MVK     .S1     32,A18            ; |243| 
           SHR     .S1     A23,24,A23        ; |243| 
           MV      .L2X    A4,B23            ; |249| 

           MV      .L2X    A5,B17            ; |249| 
||         LDNDW   .D1T1   *+A3(24),A5:A4    ; |247| 

           ADDAW   .D2     B4,17,B27
           SHR     .S2X    A17,8,B4          ; |248| 
           MV      .L1X    B9,A19            ; |249| 

           SHR     .S2X    A1,16,B9          ; |247| 
||         LDNDW   .D1T1   *+A3(A18),A13:A12 ; |243| 
||         SHR     .S1     A27,24,A27        ; |243| 

           MV      .L2X    A4,B2             ; |247| 
||         LDW     .D2T1   *+SP(92),A18      ; |249| 
||         SHR     .S1     A24,24,A24        ; |243| 

	.dwpsn	file "task.c",line 237,column 0,is_stmt

           MV      .L2X    A5,B20            ; |247| 
||         LDNDW   .D1T1   *+A3(24),A5:A4    ; |248| 
||         MV      .L1X    B23,A1            ; |249| 
||         SHR     .S1     A16,16,A15        ; |247| 
||         MVK     .S2     0x3,B0            ; |237| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 237
;*      Loop opening brace source line   : 238
;*      Loop closing brace source line   : 258
;*      Known Minimum Trip Count         : 3                    
;*      Known Maximum Trip Count         : 3                    
;*      Known Max Trip Count Factor      : 3
;*      Loop Carried Dependency Bound(^) : 1
;*      Unpartitioned Resource Bound     : 48
;*      Partitioned Resource Bound(*)    : 75
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                    21       23     
;*      .D units                    34       40     
;*      .M units                     0        0     
;*      .X cross paths              17       16     
;*      .T address paths            52       52     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)            11       12     
;*      Bound(.L .S .D .LS .LSD)    19       21     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 75 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 75 Did not find schedule
;*         ii = 76 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 76 Did not find schedule
;*         ii = 78 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 78 Did not find schedule
;*         ii = 82 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 82 Did not find schedule
;*         ii = 90 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 90 Did not find schedule
;*      Disqualified loop: Did not find schedule
;*----------------------------------------------------------------------------*
$C$L19:    
$C$DW$L$_assignPdfModelFullToBuffer$2$B:
	.dwpsn	file "task.c",line 238,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 104

           STB     .D1T1   A25,*A7           ; |249| 
||         MV      .L1X    B17,A25           ; |249| 

           LDW     .D2T1   *+SP(28),A7       ; |248| 
||         MV      .L2X    A9,B1             ; |247| 
||         MV      .L1X    B7,A9             ; |248| 

           STW     .D2T1   A8,*+SP(140)      ; |247| 
||         SHR     .S2X    A11,8,B7          ; |248| 

           LDW     .D2T1   *+SP(84),A8       ; |249| 

           MV      .L2X    A4,B29            ; |248| 
||         STB     .D1T1   A22,*A18          ; |249| 
||         SHR     .S1     A25,24,A22        ; |243| 

           MV      .L2X    A5,B21            ; |248| 
||         LDNDW   .D1T1   *+A3(24),A5:A4    ; |249| 
||         SHR     .S1     A0,8,A25          ; |248| 

           STB     .D1T1   A21,*A7           ; |249| 
||         SHR     .S1     A9,24,A21         ; |243| 
||         MV      .L1X    B19,A9            ; |249| 

           LDW     .D2T1   *+SP(76),A18      ; |249| 
           STB     .D1T1   A9,*A8            ; |249| 
           LDW     .D2T1   *+SP(100),A9      ; |249| 

           STW     .D2T1   A4,*+SP(124)      ; |249| 
||         MV      .L1     A6,A4             ; |249| 
||         MV      .L2X    A5,B22            ; |249| 

           LDW     .D2T1   *+SP(60),A7       ; |249| 

           SHR     .S2X    A4,8,B18          ; |248| 
||         LDNDW   .D1T1   *+A3(24),A5:A4    ; |243| 
||         MV      .L1X    B22,A0            ; |248| 

           STB     .D1T1   A13,*A18          ; |249| 
||         SHR     .S1     A0,24,A13         ; |243| 
||         MV      .L1X    B2,A0             ; |248| 

           LDW     .D2T1   *+SP(36),A18      ; |249| 

           STB     .D1T1   A1,*A9            ; |249| 
||         MV      .L1X    B16,A1            ; |248| 

           LDW     .D2T1   *+SP(80),A9       ; |248| 

           MV      .L2X    A4,B30            ; |248| 
||         STW     .D2T1   A5,*+SP(128)      ; |248| 

           LDNDW   .D1T1   *+A3(16),A5:A4    ; |247| 
           STB     .D1T1   A19,*A18          ; |249| 
           LDW     .D2T1   *+SP(56),A19      ; |243| 
           LDW     .D2T1   *+SP(108),A8      ; |249| 

           STB     .D1T1   A1,*A9            ; |243| 
||         MV      .L1X    B29,A9            ; |243| 

           MV      .L2X    A4,B12            ; |243| 
||         LDW     .D2T1   *+SP(64),A1       ; |247| 

           MV      .L2X    A5,B31            ; |243| 
||         LDNDW   .D1T1   *+A3(16),A5:A4    ; |248| 

           LDW     .D2T1   *+SP(72),A6       ; |243| 
           LDW     .D2T1   *+SP(32),A18      ; |248| 
           LDNDW   .D1T1   *+A3(8),A17:A16   ; |248| 

           STB     .D1T1   A26,*A7           ; |249| 
||         SHR     .S1     A10,16,A26        ; |247| 
||         MV      .L1X    B21,A7            ; |249| 

           MV      .L2X    A4,B3             ; |248| 
||         SHR     .S1     A12,24,A10        ; |243| 
||         MV      .L1X    B18,A12           ; |249| 
||         STB     .D1T1   A14,*A19          ; |248| 

           MV      .L2X    A5,B24            ; |248| 
||         LDNDW   .D1T1   *+A3(16),A5:A4    ; |249| 

           LDW     .D2T1   *+SP(96),A19      ; |248| 

           STB     .D1T1   A12,*A8           ; |248| 
||         SHR     .S1     A7,16,A12         ; |247| 
||         MV      .L1X    B4,A7             ; |243| 
||         MV      .L2X    A16,B13           ; |248| 

           STB     .D1T1   A23,*A1           ; |243| 
||         SHR     .S1     A9,8,A8           ; |248| 
||         MV      .L1X    B24,A9            ; |248| 
||         SHR     .S2X    A0,16,B4          ; |247| 

           LDW     .D2T1   *+SP(24),A1       ; |243| 
||         SHR     .S1     A9,16,A14         ; |247| 

           MV      .L2X    A5,B5             ; |247| 
||         STW     .D2T1   A4,*+SP(132)      ; |247| 

           LDNDW   .D1T1   *A3,A5:A4         ; |249| 

           STB     .D1T1   A7,*A6            ; |248| 
||         MV      .L1X    B5,A0             ; |247| 

           LDNDW   .D1T1   *+A3(16),A7:A6    ; |243| 
           LDW     .D2T1   *+SP(48),A23      ; |247| 
           STB     .D1T1   A27,*A18          ; |243| 

           MV      .L2X    A4,B11            ; |249| 
||         STW     .D2T1   A5,*+SP(144)      ; |249| 

           LDNDW   .D1T1   *+A3(8),A5:A4     ; |243| 

           LDW     .D2T1   *+SP(44),A18      ; |248| 
||         MV      .L2X    A6,B6             ; |243| 

           LDW     .D2T1   *+SP(40),A16      ; |243| 
           LDW     .D2T1   *+SP(68),A9       ; |248| 

           STB     .D1T1   A20,*A19          ; |247| 
||         SHR     .S1     A28,8,A19         ; |248| 
||         MV      .L1X    B3,A20            ; |243| 

           MV      .L2X    A4,B10            ; |243| 
||         STW     .D2T1   A5,*+SP(148)      ; |243| 
||         SHR     .S1     A20,8,A6          ; |248| 

           LDNDW   .D1T1   *A3,A5:A4         ; |243| 

           STB     .D1T1   A19,*A1           ; |248| 
||         SHR     .S1     A31,8,A19         ; |248| 
||         MV      .L1X    B12,A1            ; |248| 

           MVK     .S1     56,A31            ; |243| 
||         STW     .D2T1   A7,*+SP(136)      ; |243| 

           STB     .D1T1   A19,*A16          ; |248| 
||         MV      .L1X    B11,A16           ; |243| 

           LDW     .D2T1   *+SP(4),A19       ; |247| 

           STW     .D2T1   A4,*+SP(152)      ; |243| 
||         MV      .L2X    A5,B8             ; |243| 
||         MV      .L1X    B10,A5            ; |249| 

           STB     .D1T1   A24,*A23          ; |243| 
||         SHR     .S1     A0,24,A24         ; |243| 

           STB     .D1T1   A15,*A18          ; |247| 
||         SHR     .S1     A1,16,A15         ; |247| 

           LDNDW   .D1T1   *+A3(A31),A1:A0   ; |248| 
||         SHR     .S1     A29,16,A18        ; |247| 

           LDW     .D2T1   *+SP(152),A29     ; |249| 
||         SHR     .S1     A30,16,A23        ; |247| 
||         MV      .L1X    B8,A30            ; |249| 

           LDW     .D2T1   *+SP(52),A28      ; |248| 
           LDW     .D2T1   *+SP(84),A31      ; |249| 

           STB     .D1T1   A23,*A9           ; |247| 
||         MV      .L1X    B6,A9             ; |243| 

           SHR     .S1     A9,24,A7          ; |243| 
||         LDW     .D2T1   *+SP(60),A9       ; |249| 
||         MV      .L2X    A0,B5             ; |248| 

           LDW     .D2T1   *+SP(28),A23      ; |249| 
||         SHR     .S1     A29,24,A0         ; |243| 

           LDW     .D2T1   *+SP(36),A20      ; |249| 

           LDW     .D2T1   *+SP(96),A29      ; |249| 
||         ADDK    .S1     64,A31            ; |249| 

           STB     .D1T1   A21,*A19          ; |243| 

           LDW     .D2T1   *+SP(100),A19     ; |249| 
||         ADDK    .S1     64,A9             ; |249| 

           STB     .D1T1   A18,*A28          ; |247| 
||         ADDK    .S1     64,A23            ; |249| 

           LDW     .D2T1   *+SP(92),A18      ; |249| 
||         ADDK    .S1     64,A20            ; |249| 

           LDW     .D2T1   *+SP(104),A28     ; |249| 
||         ADDK    .S1     64,A29            ; |249| 

           LDW     .D2T1   *+SP(124),A27     ; |249| 

           LDW     .D2T1   *+SP(76),A21      ; |249| 
||         ADDK    .S1     64,A19            ; |249| 

           STW     .D2T1   A31,*+SP(84)      ; |249| 

           LDW     .D2T1   *+SP(44),A31      ; |249| 
||         ADDK    .S1     64,A18            ; |249| 

           STB     .D1T1   A30,*+A2(7)       ; |249| 
||         ADDK    .S1     64,A28            ; |249| 

           LDW     .D2T1   *+SP(80),A30      ; |249| 

           STW     .D2T1   A23,*+SP(28)      ; |249| 
||         ADDK    .S1     64,A21            ; |249| 

           STW     .D2T1   A20,*+SP(36)      ; |249| 

           STW     .D2T1   A9,*+SP(60)       ; |249| 
||         ADDK    .S1     64,A31            ; |249| 

           LDW     .D2T1   *+SP(48),A9       ; |249| 

           LDW     .D2T1   *+SP(64),A23      ; |249| 
||         ADDK    .S1     64,A30            ; |249| 

           LDW     .D2T1   *+SP(56),A20      ; |249| 
           STB     .D1T1   A16,*+A2(3)       ; |249| 
           LDW     .D2T1   *+SP(108),A16     ; |249| 

           STB     .D1T1   A27,*+A2(27)      ; |249| 
||         SHR     .S1     A5,24,A27         ; |243| 

           LDW     .D2T1   *+SP(72),A5       ; |249| 
||         ADDK    .S1     64,A9             ; |249| 

           STW     .D2T1   A29,*+SP(96)      ; |249| 
||         ADDK    .S1     64,A23            ; |249| 

           STW     .D2T1   A19,*+SP(100)     ; |249| 
||         ADDK    .S1     64,A20            ; |249| 

           STW     .D2T1   A18,*+SP(92)      ; |249| 
||         ADDK    .S1     64,A16            ; |249| 

           STW     .D2T1   A28,*+SP(104)     ; |249| 

           LDNDW   .D1T1   *A3,A29:A28       ; |247| 
||         ADDK    .S1     64,A5             ; |249| 

           LDNDW   .D1T1   *+A3(8),A19:A18   ; |249| 
           STW     .D2T1   A21,*+SP(76)      ; |249| 
           LDW     .D2T1   *+SP(40),A21      ; |249| 
           STW     .D2T1   A31,*+SP(44)      ; |249| 
           STW     .D2T1   A30,*+SP(80)      ; |249| 
           LDNDW   .D1T1   *A3,A31:A30       ; |248| 
           STW     .D2T1   A20,*+SP(56)      ; |249| 
           STW     .D2T1   A23,*+SP(64)      ; |249| 
           STW     .D2T1   A5,*+SP(72)       ; |249| 
           LDW     .D2T1   *+SP(148),A23     ; |249| 
           STW     .D2T1   A9,*+SP(48)       ; |249| 

           STB     .D1T1   A18,*+A2(11)      ; |249| 
||         SHR     .S1     A29,8,A18         ; |248| 

           STW     .D2T1   A16,*+SP(108)     ; |249| 
$C$DW$L$_assignPdfModelFullToBuffer$2$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_assignPdfModelFullToBuffer$3$B:
;          EXCLUSIVE CPU CYCLES: 91

           LDW     .D2T1   *+SP(132),A20     ; |249| 
||         ADDK    .S1     64,A21            ; |249| 
||         MV      .L2X    A1,B6             ; |248| 
||         SUB     .S2     B0,1,B0           ; |237| 
||         MV      .L1X    B20,A11           ; |249| 

           STW     .D2T1   A21,*+SP(40)      ; |249| 
||         SHR     .S1     A31,16,A29        ; |247| 
||         SHR     .S2     B6,16,B6          ; |247| 

           LDW     .D2T1   *+SP(136),A21     ; |249| 
||         SHR     .S1     A17,16,A17        ; |247| 
||         SHR     .S2     B5,8,B5           ; |248| 

           LDW     .D2T1   *+SP(144),A9      ; |249| 
||         SHR     .S1     A19,24,A19        ; |243| 

           LDW     .D2T1   *+SP(32),A5       ; |249| 
|| [ B0]   MVK     .S1     56,A4             ; |243| 

           STB     .D1T1   A20,*+A2(19)      ; |249| 
||         ADDK    .S1     64,A3             ; |237| 
||         STB     .D2T2   B6,*B28           ; |247| 
||         ADDK    .S2     64,B28            ; |249| 

           LDW     .D2T1   *+SP(8),A20       ; |249| 
||         SHR     .S1     A30,8,A30         ; |248| 

           STB     .D1T1   A21,*+A2(23)      ; |249| 
||         SHR     .S1     A11,8,A11         ; |248| 
||         STB     .D2T2   B5,*B26           ; |248| 
||         ADDK    .S2     64,B26            ; |249| 

           LDW     .D2T1   *+SP(24),A21      ; |249| 
||         SHR     .S1     A9,24,A31         ; |243| 
||         MV      .L1X    B7,A9             ; |249| 

           LDW     .D2T1   *+SP(52),A16      ; |249| 
||         ADDK    .S1     64,A5             ; |249| 

           STB     .D1T1   A23,*+A2(15)      ; |249| 
           STB     .D1T1   A9,*A20           ; |248| 
           LDW     .D2T1   *+SP(4),A9        ; |249| 

           LDW     .D2T1   *+SP(128),A23     ; |249| 
||         ADDK    .S1     64,A21            ; |249| 

           LDW     .D2T1   *+SP(88),A1       ; |249| 
||         ADDK    .S1     64,A16            ; |249| 

           LDW     .D2T1   *+SP(12),A20      ; |249| 
           STW     .D2T1   A5,*+SP(32)       ; |249| 

           LDW     .D2T1   *+SP(68),A5       ; |249| 
||         ADDK    .S1     64,A9             ; |249| 

           STW     .D2T1   A21,*+SP(24)      ; |249| 
||         MV      .L1X    B9,A21            ; |249| 

           STW     .D2T1   A9,*+SP(4)        ; |249| 
||         MV      .L1X    B30,A9            ; |247| 

           STB     .D1T1   A21,*A1           ; |247| 
||         MV      .L1X    B31,A21           ; |243| 

           STW     .D2T1   A16,*+SP(52)      ; |249| 
||         MV      .L1     A28,A16           ; |249| 

           STB     .D1T1   A23,*+A2(31)      ; |249| 
||         MV      .L1X    B13,A23           ; |247| 
||         SHR     .S1     A16,16,A28        ; |247| 

           STB     .D1T1   A22,*A20          ; |243| 
||         SHR     .S1     A9,24,A20         ; |243| 
||         MV      .L1X    B4,A22            ; |249| 

           SHR     .S1     A23,8,A16         ; |248| 
||         STB     .D1T1   A20,*+A2(24)      ; |243| 

           SHR     .S1     A21,8,A23         ; |248| 
||         LDW     .D2T1   *+SP(112),A20     ; |249| 

           ADDK    .S1     64,A5             ; |249| 
||         STB     .D1T1   A23,*+A2(22)      ; |248| 

           LDW     .D2T1   *+SP(20),A23      ; |249| 
           STW     .D2T1   A5,*+SP(68)       ; |249| 
           LDW     .D2T1   *+SP(12),A5       ; |249| 

           STB     .D1T1   A17,*+A2(13)      ; |247| 
||         ADDK    .S1     64,A20            ; |249| 

           LDW     .D2T1   *+SP(8),A17       ; |249| 

           STB     .D1T1   A8,*+A2(26)       ; |248| 
||         ADDK    .S1     64,A23            ; |249| 

           LDW     .D2T1   *+SP(16),A8       ; |249| 

           STB     .D1T1   A19,*+A2(12)      ; |243| 
||         ADDK    .S1     64,A5             ; |249| 

           LDW     .D2T1   *+SP(16),A19      ; |249| 

           STB     .D1T1   A16,*+A2(10)      ; |248| 
||         MV      .L1     A1,A16            ; |249| 
||         ADDK    .S1     64,A17            ; |249| 

           ADDK    .S1     64,A16            ; |249| 
||         STW     .D2T1   A5,*+SP(12)       ; |249| 

           ADDK    .S1     64,A8             ; |249| 
||         STW     .D2T1   A16,*+SP(88)      ; |249| 

           LDW     .D2T1   *+SP(20),A16      ; |249| 
           STW     .D2T1   A23,*+SP(20)      ; |249| 
           STW     .D2T1   A17,*+SP(8)       ; |249| 
           LDW     .D2T1   *+SP(112),A17     ; |249| 
           STW     .D2T1   A20,*+SP(112)     ; |249| 
           STW     .D2T1   A8,*+SP(16)       ; |249| 
           STB     .D1T1   A25,*A19          ; |248| 
           LDW     .D2T1   *+SP(140),A19     ; |243| 
   [ B0]   LDNDW   .D1T1   *+A3(A4),A5:A4    ; |247| 
           LDW     .D2T1   *+SP(116),A9      ; |249| 
           STB     .D1T1   A6,*+A2(18)       ; |248| 

           STB     .D1T1   A7,*+A2(16)       ; |243| 
|| [ B0]   MVK     .S1     56,A7             ; |243| 

           SHR     .S1     A19,16,A21        ; |247| 
||         MV      .L1X    B1,A19            ; |248| 
||         LDW     .D2T1   *+SP(120),A8      ; |249| 

   [ B0]   STW     .D2T1   A4,*+SP(116)      ; |247| 
|| [ B0]   MV      .L1     A5,A6             ; |247| 

           SHR     .S2X    A9,16,B7          ; |247| 
||         SHR     .S1     A19,8,A9          ; |248| 
||         STB     .D1T1   A31,*+A2(4)       ; |243| 

   [ B0]   MVK     .S1     40,A19            ; |243| 
||         STB     .D2T2   B7,*B25           ; |247| 
||         STB     .D1T1   A30,*+A2(2)       ; |248| 
||         ADDK    .S2     64,B25            ; |249| 

   [ B0]   LDNDW   .D1T1   *+A3(A19),A5:A4   ; |243| 
|| [ B0]   MVK     .S1     56,A31            ; |243| 

   [ B0]   MVK     .S1     48,A30            ; |243| 
||         STB     .D1T1   A18,*+A2(6)       ; |248| 
||         SHR     .S2X    A8,24,B4          ; |243| 

   [ B0]   MVK     .S1     32,A18            ; |243| 
||         STB     .D1T1   A9,*+A2(14)       ; |248| 
||         STB     .D2T2   B4,*B27           ; |243| 
||         ADDK    .S2     64,B27            ; |249| 

           STB     .D1T1   A22,*+A2(25)      ; |247| 
           STB     .D1T1   A21,*+A2(9)       ; |247| 

   [ B0]   MV      .L2X    A5,B19            ; |243| 
|| [ B0]   LDNDW   .D1T1   *+A3(A31),A21:A20 ; |243| 

   [ B0]   MV      .L2X    A4,B7             ; |243| 
|| [ B0]   LDNDW   .D1T1   *+A3(A7),A5:A4    ; |249| 

   [ B0]   LDNDW   .D1T1   *+A3(A30),A9:A8   ; |248| 
   [ B0]   LDNDW   .D1T1   *+A3(A30),A23:A22 ; |249| 
           STB     .D1T1   A10,*A16          ; |243| 

           STB     .D1T1   A26,*A17          ; |247| 
|| [ B0]   SHR     .S2X    A20,24,B16        ; |243| 

   [ B0]   LDNDW   .D1T1   *+A3(A30),A17:A16 ; |247| 
|| [ B0]   MV      .L2X    A4,B9             ; |249| 

           STB     .D1T1   A28,*+A2(1)       ; |247| 
|| [ B0]   SHR     .S1     A9,16,A20         ; |247| 

           STB     .D1T1   A11,*+A2(30)      ; |248| 
|| [ B0]   SHR     .S1     A23,24,A23        ; |243| 

           STB     .D1T1   A29,*+A2(5)       ; |247| 
   [ B0]   LDNDW   .D1T1   *+A3(A19),A29:A28 ; |248| 

   [ B0]   LDNDW   .D1T1   *+A3(A18),A11:A10 ; |247| 
|| [ B0]   MVK     .S1     32,A18            ; |243| 
|| [ B0]   SHR     .S2X    A17,8,B4          ; |248| 

           STB     .D1T1   A24,*+A2(20)      ; |243| 
   [ B0]   LDNDW   .D1T1   *+A3(A30),A25:A24 ; |243| 
   [ B0]   LDNDW   .D1T1   *+A3(A19),A31:A30 ; |247| 
           STB     .D1T1   A27,*+A2(8)       ; |243| 

   [ B0]   LDNDW   .D1T1   *+A3(A19),A27:A26 ; |249| 
|| [ B0]   MVK     .S1     32,A19            ; |243| 

   [ B0]   STW     .D2T1   A5,*+SP(120)      ; |249| 

   [ B0]   LDNDW   .D1T1   *+A3(A19),A5:A4   ; |249| 
|| [ B0]   SHR     .S1     A24,24,A24        ; |243| 

           STB     .D1T1   A0,*A2            ; |243| 

   [ B0]   LDNDW   .D1T1   *+A3(A19),A1:A0   ; |248| 
|| [ B0]   MV      .L1X    B9,A19            ; |249| 

   [ B0]   LDW     .D2T1   *+SP(104),A7      ; |249| 
|| [ B0]   SHR     .S1     A27,24,A27        ; |243| 

           STB     .D1T1   A14,*+A2(21)      ; |247| 
|| [ B0]   SHR     .S1     A8,8,A14          ; |248| 

   [ B0]   MV      .L2X    A5,B17            ; |249| 
|| [ B0]   LDNDW   .D1T1   *+A3(8),A9:A8     ; |247| 

   [ B0]   MV      .L2X    A4,B23            ; |249| 
|| [ B0]   LDNDW   .D1T1   *+A3(24),A5:A4    ; |247| 

   [ B0]   B       .S1     $C$L19            ; |237| 
|| [ B0]   SHR     .S2X    A1,16,B9          ; |247| 
||         STB     .D1T1   A15,*+A2(17)      ; |247| 

   [ B0]   SHR     .S1     A16,16,A15        ; |247| 
||         STB     .D1T1   A12,*+A2(29)      ; |247| 
|| [ B0]   MV      .L1X    B23,A1            ; |249| 

           STB     .D1T1   A13,*+A2(28)      ; |243| 
||         ADDK    .S1     64,A2             ; |249| 

   [ B0]   LDNDW   .D1T1   *+A3(A18),A13:A12 ; |243| 

   [ B0]   MV      .L2X    A5,B20            ; |247| 
|| [ B0]   LDW     .D2T1   *+SP(92),A18      ; |249| 

	.dwpsn	file "task.c",line 258,column 0,is_stmt

   [ B0]   MV      .L2X    A4,B2             ; |247| 
|| [ B0]   LDNDW   .D1T1   *+A3(24),A5:A4    ; |248| 
|| [!B0]   ADDK    .S2     152,SP            ; |259| 

           ; BRANCHCC OCCURS {$C$L19}        ; |237| 
$C$DW$L$_assignPdfModelFullToBuffer$3$E:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(8),B3       ; |259| 
           LDDW    .D2T1   *++SP,A13:A12     ; |259| 
           LDDW    .D2T1   *++SP,A15:A14     ; |259| 
           LDDW    .D2T2   *++SP,B11:B10     ; |259| 
           LDDW    .D2T2   *++SP,B13:B12     ; |259| 
$C$DW$107	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$107, DW_AT_low_pc(0x04)
	.dwattr $C$DW$107, DW_AT_TI_return

           LDW     .D2T1   *++SP(8),A10      ; |259| 
||         RET     .S2     B3                ; |259| 

           LDW     .D2T1   *++SP(8),A11      ; |259| 
	.dwpsn	file "task.c",line 259,column 3,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |259| 

$C$DW$108	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$108, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L19:1:1496782367")
	.dwattr $C$DW$108, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$108, DW_AT_TI_begin_line(0xed)
	.dwattr $C$DW$108, DW_AT_TI_end_line(0x102)
$C$DW$109	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$109, DW_AT_low_pc($C$DW$L$_assignPdfModelFullToBuffer$2$B)
	.dwattr $C$DW$109, DW_AT_high_pc($C$DW$L$_assignPdfModelFullToBuffer$2$E)
$C$DW$110	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$110, DW_AT_low_pc($C$DW$L$_assignPdfModelFullToBuffer$3$B)
	.dwattr $C$DW$110, DW_AT_high_pc($C$DW$L$_assignPdfModelFullToBuffer$3$E)
	.dwendtag $C$DW$108

	.dwattr $C$DW$104, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$104, DW_AT_TI_end_line(0x103)
	.dwattr $C$DW$104, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$104

	.sect	".text"
	.clink
	.global	_assignBufferToVariable

$C$DW$111	.dwtag  DW_TAG_subprogram, DW_AT_name("assignBufferToVariable")
	.dwattr $C$DW$111, DW_AT_low_pc(_assignBufferToVariable)
	.dwattr $C$DW$111, DW_AT_high_pc(0x00)
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("_assignBufferToVariable")
	.dwattr $C$DW$111, DW_AT_external
	.dwattr $C$DW$111, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$111, DW_AT_TI_begin_line(0xb2)
	.dwattr $C$DW$111, DW_AT_TI_begin_column(0x08)
	.dwattr $C$DW$111, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$111, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 178,column 32,is_stmt,address _assignBufferToVariable

;******************************************************************************
;* FUNCTION NAME: assignBufferToVariable                                      *
;*                                                                            *
;*   Regs Modified     : A3,A4,A5,A6,A7,A8,B4                                 *
;*   Regs Used         : A3,A4,A5,A6,A7,A8,B3,B4                              *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_assignBufferToVariable:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVKL    .S1     _buf,A3
           MVKH    .S1     _buf,A3
           LDW     .D1T1   *A3,A3            ; |179| 
           MVKL    .S1     _bin_width,A4
           MVKH    .S1     _bin_width,A4
           MVKL    .S2     _normalized_C,B4
           MVKH    .S2     _normalized_C,B4
           LDBU    .D1T1   *+A3(1),A5        ; |181| 
           LDBU    .D1T1   *+A3(2),A7        ; |181| 
           LDBU    .D1T1   *+A3(3),A8        ; |181| 
           LDBU    .D1T1   *+A3(4),A6        ; |181| 
           NOP             1

           SHL     .S1     A5,8,A3           ; |181| 
||         LDB     .D1T1   *A3,A5            ; |179| 

$C$DW$112	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$112, DW_AT_low_pc(0x04)
	.dwattr $C$DW$112, DW_AT_TI_return

           OR      .L1     A7,A3,A3          ; |181| 
||         RET     .S2     B3                ; |182| 

           SHL     .S1     A3,8,A3           ; |181| 
           OR      .L1     A8,A3,A3          ; |181| 
           SHL     .S1     A3,8,A3           ; |181| 

           STB     .D1T1   A5,*A4            ; |179| 
||         OR      .L1     A6,A3,A3          ; |181| 

	.dwpsn	file "task.c",line 182,column 3,is_stmt
           STW     .D2T1   A3,*B4            ; |181| 
           ; BRANCH OCCURS {B3}              ; |182| 
	.dwattr $C$DW$111, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$111, DW_AT_TI_end_line(0xb6)
	.dwattr $C$DW$111, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$111

	.sect	".text"
	.clink
	.global	_assignBufferToTargetRegion

$C$DW$113	.dwtag  DW_TAG_subprogram, DW_AT_name("assignBufferToTargetRegion")
	.dwattr $C$DW$113, DW_AT_low_pc(_assignBufferToTargetRegion)
	.dwattr $C$DW$113, DW_AT_high_pc(0x00)
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("_assignBufferToTargetRegion")
	.dwattr $C$DW$113, DW_AT_external
	.dwattr $C$DW$113, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$113, DW_AT_TI_begin_line(0xb8)
	.dwattr $C$DW$113, DW_AT_TI_begin_column(0x08)
	.dwattr $C$DW$113, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$113, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 184,column 36,is_stmt,address _assignBufferToTargetRegion

;******************************************************************************
;* FUNCTION NAME: assignBufferToTargetRegion                                  *
;*                                                                            *
;*   Regs Modified     : A3,A4,A5,B4,B5,B6                                    *
;*   Regs Used         : A3,A4,A5,B3,B4,B5,B6                                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_assignBufferToTargetRegion:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S1     _buf,A3

           MVKH    .S1     _buf,A3
||         MVKL    .S2     _sizeHalfRect,B4

           LDW     .D1T1   *A3,A3            ; |185| 
||         MVKH    .S2     _sizeHalfRect,B4

           LDW     .D2T2   *B4,B5            ; |185| 
           NOP             3
           MV      .L2X    A3,B4             ; |185| Define a twin register
           LDBU    .D2T2   *+B5[B4],B4       ; |185| 
           ADD     .L1X    B5,A3,A3          ; |185| 
           LDBU    .D1T1   *+A3(1),A4        ; |185| 
           MVKL    .S2     _target_Region,B5
           MVKH    .S2     _target_Region,B5
           SHL     .S2     B4,8,B4           ; |185| 
           NOP             1
           OR      .L2X    A4,B4,B4          ; |185| 
           STH     .D2T2   B4,*B5            ; |185| 
           LDBU    .D1T1   *+A3(2),A4        ; |186| 
           LDBU    .D1T2   *+A3(3),B4        ; |186| 
           NOP             3
           SHL     .S1     A4,8,A4           ; |186| 
           NOP             1

           OR      .L2X    B4,A4,B6          ; |186| 
||         ADD     .S2     2,B5,B4

           STH     .D2T2   B6,*B4            ; |186| 
           LDBU    .D1T1   *+A3(4),A4        ; |187| 
           LDBU    .D1T2   *+A3(5),B4        ; |187| 
           ADD     .L2     4,B5,B6
           NOP             2
           SHL     .S1     A4,8,A4           ; |187| 
           NOP             1
           OR      .L2X    B4,A4,B4          ; |187| 
           STH     .D2T2   B4,*B6            ; |187| 
           LDBU    .D1T1   *+A3(6),A4        ; |188| 
           LDBU    .D1T1   *+A3(7),A5        ; |188| 
$C$DW$114	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$114, DW_AT_low_pc(0x00)
	.dwattr $C$DW$114, DW_AT_TI_return
           RETNOP  .S2     B3,2              ; |199| 
           SHL     .S1     A4,8,A3           ; |188| 

           OR      .L1     A5,A3,A3          ; |188| 
||         ADD     .L2     6,B5,B4

	.dwpsn	file "task.c",line 199,column 3,is_stmt
           STH     .D2T1   A3,*B4            ; |188| 
           ; BRANCH OCCURS {B3}              ; |199| 
	.dwattr $C$DW$113, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$113, DW_AT_TI_end_line(0xc7)
	.dwattr $C$DW$113, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$113

	.sect	".text"
	.clink
	.global	_assignBufferToKernel

$C$DW$115	.dwtag  DW_TAG_subprogram, DW_AT_name("assignBufferToKernel")
	.dwattr $C$DW$115, DW_AT_low_pc(_assignBufferToKernel)
	.dwattr $C$DW$115, DW_AT_high_pc(0x00)
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("_assignBufferToKernel")
	.dwattr $C$DW$115, DW_AT_external
	.dwattr $C$DW$115, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$115, DW_AT_TI_begin_line(0xc9)
	.dwattr $C$DW$115, DW_AT_TI_begin_column(0x08)
	.dwattr $C$DW$115, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$115, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 201,column 30,is_stmt,address _assignBufferToKernel

;******************************************************************************
;* FUNCTION NAME: assignBufferToKernel                                        *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,A5,A6,A7,B0,B4,B5,B6,B7,B8,B9               *
;*   Regs Used         : A0,A3,A4,A5,A6,A7,B0,B3,B4,B5,B6,B7,B8,B9            *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_assignBufferToKernel:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S1     _kernelRows,A3
||         MVKL    .S2     _kernelCols,B4
||         ZERO    .L2     B8                ; |203| 
||         ZERO    .D2     B6                ; |203| 
||         ZERO    .L1     A5                ; |203| 

           MVKH    .S1     _kernelRows,A3
||         MVKL    .S2     _kernel,B5

           LDH     .D1T1   *A3,A3            ; |206| 
           MVKH    .S2     _kernelCols,B4
           MVKL    .S1     _buf,A4
           MVKH    .S2     _kernel,B5
           MVKH    .S1     _buf,A4
           CMPGT   .L1     A3,0,A0           ; |206| 

   [!A0]   BNOP    .S1     $C$L23,4          ; |206| 
|| [ A0]   LDW     .D1T1   *A4,A4

   [ A0]   LDH     .D2T1   *B4,A7
           ; BRANCHCC OCCURS {$C$L23}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           MV      .L2X    A5,B7
||         ADD     .L1     5,A4,A6
||         DINT                              ; interrupts off

           MV      .L2X    A3,B4
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 206
;*      Loop opening brace source line   : 206
;*      Loop closing brace source line   : 213
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 12
;*      Unpartitioned Resource Bound     : 3
;*      Partitioned Resource Bound(*)    : 3
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1        1     
;*      .S units                     3*       2     
;*      .D units                     1        2     
;*      .M units                     0        0     
;*      .X cross paths               1        0     
;*      .T address paths             2        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          4        4     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2        2     
;*      Bound(.L .S .D .LS .LSD)     3*       3*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 12 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |      **                        |    *****                       |
;*       1: |      **                        |    ******                      |
;*       2: |      **                        |    ******                      |
;*       3: |      **                        |    ******                      |
;*       4: |*     **                        |    ******                      |
;*       5: |*    ***                        |    ******                      |
;*       6: |*  *****                        |*   ******                      |
;*       7: |*  *****                        |    ******                      |
;*       8: |*  *****                        |    ******                      |
;*       9: |*  ** **                        |    ******                      |
;*      10: |*  ** **                        |    ******                      |
;*      11: |*  *  **                        |    ******                      |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*
;*      Minimum safe trip count       : 1
;*
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 0 + trip_cnt * 12        
;*----------------------------------------------------------------------------*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C246:
;*   0              LDBU    .D1T1   *A6++(4),A5       ; |207|  ^ 
;*     ||           ADDAW   .D2     B6,B8,B9          ; |207| 
;*   1              ADD     .L2     B5,B9,B9          ; |207| 
;*     ||           ADD     .S2     1,B8,B8           ; |209| 
;*   2              NOP             1
;*   3              CMPLT   .L1X    B8,A7,A0          ; |209| 
;*   4      [!A0]   ADDK    .S2     344,B6            ; |211| 
;*     ||   [!A0]   ADD     .L2     1,B7,B7           ; |211| 
;*   5              MV      .L1     A5,A4             ; |207| Split a long life
;*     ||           SHL     .S1     A5,8,A3           ; |207|  ^ 
;*     ||           CMPLT   .L2     B7,B4,B0          ; |206| 
;*   6              OR      .L1     A5,A3,A3          ; |207|  ^ 
;*     ||   [ B0]   B       .S2     $C$C246           ; |206| 
;*   7              SHL     .S1     A3,8,A3           ; |207|  ^ 
;*   8              OR      .L1     A5,A3,A3          ; |207|  ^ 
;*   9              SHL     .S1     A3,8,A3           ; |207|  ^ 
;*  10              OR      .L1     A4,A3,A3          ; |207|  ^ 
;*  11              STW     .D2T1   A3,*B9            ; |207|  ^ 
;*     ||   [!A0]   ZERO    .L2     B8                ; |210| 
;*  12              ; BRANCHCC OCCURS {$C$C246}       ; |206| 
;*----------------------------------------------------------------------------*
$C$L20:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L21:    ; PIPED LOOP KERNEL
$C$DW$L$_assignBufferToKernel$4$B:
	.dwpsn	file "task.c",line 206,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 12

           ADDAW   .D2     B6,B8,B9          ; |207| <0,0> 
||         LDBU    .D1T1   *A6++(4),A5       ; |207| <0,0>  ^ 

           ADD     .L2     B5,B9,B9          ; |207| <0,1> 
||         ADD     .S2     1,B8,B8           ; |209| <0,1> 

           NOP             1
           CMPLT   .L1X    B8,A7,A0          ; |209| <0,3> 

   [!A0]   ADDK    .S2     344,B6            ; |211| <0,4> 
|| [!A0]   ADD     .L2     1,B7,B7           ; |211| <0,4> 

           MV      .L1     A5,A4             ; |207| <0,5> Split a long life
||         CMPLT   .L2     B7,B4,B0          ; |206| <0,5> 
||         SHL     .S1     A5,8,A3           ; |207| <0,5>  ^ 

   [ B0]   B       .S2     $C$L21            ; |206| <0,6> 
||         OR      .L1     A5,A3,A3          ; |207| <0,6>  ^ 

           SHL     .S1     A3,8,A3           ; |207| <0,7>  ^ 
           OR      .L1     A5,A3,A3          ; |207| <0,8>  ^ 
           SHL     .S1     A3,8,A3           ; |207| <0,9>  ^ 
           OR      .L1     A4,A3,A3          ; |207| <0,10>  ^ 
	.dwpsn	file "task.c",line 213,column 0,is_stmt

   [!A0]   ZERO    .L2     B8                ; |210| <0,11> 
||         STW     .D2T1   A3,*B9            ; |207| <0,11>  ^ 

$C$DW$L$_assignBufferToKernel$4$E:
;** --------------------------------------------------------------------------*
$C$L22:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           RINT                              ; interrupts on
;** --------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 6
	.dwpsn	file "task.c",line 214,column 3,is_stmt
$C$DW$116	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$116, DW_AT_low_pc(0x00)
	.dwattr $C$DW$116, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |214| 
           ; BRANCH OCCURS {B3}              ; |214| 

$C$DW$117	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$117, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L21:1:1496782367")
	.dwattr $C$DW$117, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$117, DW_AT_TI_begin_line(0xce)
	.dwattr $C$DW$117, DW_AT_TI_end_line(0xd5)
$C$DW$118	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$118, DW_AT_low_pc($C$DW$L$_assignBufferToKernel$4$B)
	.dwattr $C$DW$118, DW_AT_high_pc($C$DW$L$_assignBufferToKernel$4$E)
	.dwendtag $C$DW$117

	.dwattr $C$DW$115, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$115, DW_AT_TI_end_line(0xd6)
	.dwattr $C$DW$115, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$115

	.sect	".text"
	.clink

$C$DW$119	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_notify")
	.dwattr $C$DW$119, DW_AT_low_pc(_Task_notify)
	.dwattr $C$DW$119, DW_AT_high_pc(0x00)
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("_Task_notify")
	.dwattr $C$DW$119, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$119, DW_AT_TI_begin_line(0x181)
	.dwattr $C$DW$119, DW_AT_TI_begin_column(0x0f)
	.dwattr $C$DW$119, DW_AT_frame_base[DW_OP_breg31 8]
	.dwattr $C$DW$119, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 386,column 3,is_stmt,address _Task_notify
$C$DW$120	.dwtag  DW_TAG_formal_parameter, DW_AT_name("eventNo")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("_eventNo")
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$120, DW_AT_location[DW_OP_reg4]
$C$DW$121	.dwtag  DW_TAG_formal_parameter, DW_AT_name("arg")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("_arg")
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$121, DW_AT_location[DW_OP_reg20]
$C$DW$122	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$122, DW_AT_location[DW_OP_reg6]

;******************************************************************************
;* FUNCTION NAME: Task_notify                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,*
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24, *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************
_Task_notify:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           MVKL    .S1     _count$1,A5
           MVKH    .S1     _count$1,A5
           LDW     .D1T1   *A5,A3            ; |392| 
           MVKL    .S2     _sizeFrame,B17
           MVKH    .S2     _sizeFrame,B17
           MVKL    .S1     _buf,A7
           MVKH    .S1     _buf,A7
           ADD     .L1     1,A3,A3           ; |392| 
           STW     .D1T1   A3,*A5            ; |392| 
           CMPEQ   .L2X    A3,1,B0           ; |393| 
   [!B0]   LDW     .D2T2   *B17,B5           ; |395| 

           MVKL    .S1     _SEM_post,A5      ; |412| 
|| [!B0]   MVKL    .S2     _runningCode,B7

           MVKH    .S1     _SEM_post,A5      ; |412| 
||         CMPEQ   .L1     A3,2,A0           ; |395| 
|| [!B0]   MVKL    .S2     _address_target_region_width,B8

   [ B0]   MVK     .L1     0x1,A0            ; |407| 
|| [!B0]   MVKL    .S1     _address_target_region_y,A8
|| [!B0]   MVKL    .S2     _address_target_region_x,B16

$C$DW$123	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$123, DW_AT_low_pc(0x00)
	.dwattr $C$DW$123, DW_AT_name("_SEM_post")
	.dwattr $C$DW$123, DW_AT_TI_call
	.dwattr $C$DW$123, DW_AT_TI_return

           CALLRET .S2X    A5                ; |412| 
||         MV      .L1     A0,A1             ; |409| 
|| [!B0]   MVKL    .S1     _bufferSize,A9

   [!B0]   MVKH    .S2     _runningCode,B7
|| [!B0]   ADD     .L2     2,B5,B9           ; |405| 
|| [ B0]   ZERO    .L1     A1                ; |409| 
|| [!B0]   MVKH    .S1     _address_target_region_y,A8

   [!B0]   MVKL    .S1     _address_target_region_height,A4
|| [!A0]   STW     .D2T1   A6,*B7            ; |409| 
|| [!B0]   ADD     .L2     4,B5,B6           ; |406| 
|| [!B0]   MVKH    .S2     _address_target_region_width,B8
|| [ A1]   STW     .D1T2   B9,*A8            ; |405| 

   [!B0]   MVKH    .S2     _address_target_region_x,B16
|| [!B0]   MVKH    .S1     _bufferSize,A9
|| [ A1]   STW     .D2T2   B6,*B8            ; |406| 
|| [ B0]   STW     .D1T1   A6,*A7            ; |394| 

   [!B0]   ADD     .L2     6,B5,B7           ; |407| 
|| [!B0]   MVKH    .S1     _address_target_region_height,A4
||         MV      .L1X    B4,A3             ; |386| 
|| [ A1]   STW     .D2T2   B5,*B16           ; |404| 
|| [ A1]   STW     .D1T1   A6,*A9            ; |396| 

	.dwpsn	file "task.c",line 413,column 3,is_stmt

   [ A1]   STW     .D1T2   B7,*A4            ; |407| 
||         ADD     .L1     4,A3,A4           ; |412| 

$C$RL4:    ; CALL-RETURN OCCURS {_SEM_post} {0}  ; |412| 
	.dwattr $C$DW$119, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$119, DW_AT_TI_end_line(0x19d)
	.dwattr $C$DW$119, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$119

	.sect	".text"
	.clink
	.global	_Task_execute

$C$DW$124	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_execute")
	.dwattr $C$DW$124, DW_AT_low_pc(_Task_execute)
	.dwattr $C$DW$124, DW_AT_high_pc(0x00)
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("_Task_execute")
	.dwattr $C$DW$124, DW_AT_external
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$124, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$124, DW_AT_TI_begin_line(0x8b)
	.dwattr $C$DW$124, DW_AT_TI_begin_column(0x07)
	.dwattr $C$DW$124, DW_AT_frame_base[DW_OP_breg31 232]
	.dwattr $C$DW$124, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 140,column 3,is_stmt,address _Task_execute
$C$DW$125	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$125, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_execute                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Local Frame Size  : 0 Args + 172 Auto + 56 Save = 228 byte               *
;******************************************************************************
_Task_execute:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           STW     .D2T1   A11,*SP--(8)      ; |140| 

           STW     .D2T1   A10,*SP--(8)      ; |140| 
||         MVKL    .S2     _SEM_pend,B5      ; |143| 

           STDW    .D2T2   B13:B12,*SP--     ; |140| 
||         MVKH    .S2     _SEM_pend,B5      ; |143| 

$C$DW$126	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$126, DW_AT_low_pc(0x00)
	.dwattr $C$DW$126, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$126, DW_AT_TI_call

           CALL    .S2     B5                ; |143| 
||         STDW    .D2T2   B11:B10,*SP--     ; |140| 

           STDW    .D2T1   A15:A14,*SP--     ; |140| 
           STDW    .D2T1   A13:A12,*SP--     ; |140| 
           STW     .D2T2   B3,*SP--(8)       ; |140| 

           ADDK    .S2     -176,SP           ; |140| 
||         ADD     .L1     4,A4,A3           ; |143| 

           ADDKPC  .S2     $C$RL5,B3,0       ; |143| 
||         STW     .D2T1   A3,*+SP(4)        ; |143| 
||         ADD     .L1     4,A4,A4           ; |143| 
||         MVK     .L2     0xffffffff,B4     ; |143| 

$C$RL5:    ; CALL OCCURS {_SEM_pend} {0}     ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 39
           MVKL    .S1     _bufferSize,A3
           MVKL    .S1     _BCACHE_inv,A5    ; |145| 
           MVKH    .S1     _bufferSize,A3
           MVKH    .S1     _BCACHE_inv,A5    ; |145| 

           LDW     .D1T2   *A3,B4            ; |145| 
||         MVKL    .S1     _buf,A3

$C$DW$127	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$127, DW_AT_low_pc(0x00)
	.dwattr $C$DW$127, DW_AT_name("_BCACHE_inv")
	.dwattr $C$DW$127, DW_AT_TI_call

           CALL    .S2X    A5                ; |145| 
||         MVKH    .S1     _buf,A3

           LDW     .D1T1   *A3,A4            ; |145| 
           ADDKPC  .S2     $C$RL6,B3,2       ; |145| 
           MVK     .L1     0x1,A6            ; |145| 
$C$RL6:    ; CALL OCCURS {_BCACHE_inv} {0}   ; |145| 
           MVKL    .S1     _buf,A3
           MVKH    .S1     _buf,A3
           LDW     .D1T1   *A3,A3            ; |179| 
           MVKL    .S2     _assignBufferToKernel,B4 ; |147| 
           MVKH    .S2     _assignBufferToKernel,B4 ; |147| 
           MVKL    .S1     _bin_width,A6
           MVKH    .S1     _bin_width,A6
           LDBU    .D1T1   *+A3(1),A8        ; |181| 
           LDBU    .D1T1   *+A3(2),A4        ; |181| 
           LDBU    .D1T1   *+A3(3),A5        ; |181| 
           LDBU    .D1T1   *+A3(4),A7        ; |181| 
           LDB     .D1T1   *A3,A3            ; |179| 
           SHL     .S1     A8,8,A8           ; |181| 
$C$DW$128	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$128, DW_AT_low_pc(0x04)
	.dwattr $C$DW$128, DW_AT_name("_assignBufferToKernel")
	.dwattr $C$DW$128, DW_AT_TI_call

           OR      .L1     A4,A8,A4          ; |181| 
||         CALL    .S2     B4                ; |147| 

           SHL     .S1     A4,8,A4           ; |181| 
           OR      .L1     A5,A4,A4          ; |181| 

           SHL     .S1     A4,8,A4           ; |181| 
||         MVKL    .S2     _normalized_C,B5

           STB     .D1T1   A3,*A6            ; |179| 
||         OR      .L1     A7,A4,A3          ; |181| 
||         MVKH    .S2     _normalized_C,B5

           STW     .D2T1   A3,*B5            ; |181| 
||         ADDKPC  .S2     $C$RL7,B3,0       ; |147| 

$C$RL7:    ; CALL OCCURS {_assignBufferToKernel} {0}  ; |147| 
           MVKL    .S1     _NOTIFY_notify,A3 ; |148| 
           MVKH    .S1     _NOTIFY_notify,A3 ; |148| 
           MVK     .S2     0x65,B4           ; |148| 
$C$DW$129	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$129, DW_AT_low_pc(0x00)
	.dwattr $C$DW$129, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$129, DW_AT_TI_call
           CALL    .S2X    A3                ; |148| 
           ADDKPC  .S2     $C$RL8,B3,3       ; |148| 

           MV      .L2     B4,B6             ; |148| 
||         ZERO    .S2     B4                ; |148| 
||         MVK     .L1     0x5,A6            ; |148| 
||         MVK     .S1     0x1,A4            ; |148| 

$C$RL8:    ; CALL OCCURS {_NOTIFY_notify} {0}  ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 25

           MVK     .L2     3,B6              ; |150| 
||         MVKL    .S1     _target_Region+6,A3

           MVKH    .S1     _target_Region+6,A3
           LDH     .D1T1   *A3,A4            ; |150| 
           MVKL    .S2     _runningCode,B13
           MVKH    .S2     _runningCode,B13
           ADD     .L2X    -2,A3,B10
           LDH     .D2T2   *B10,B4           ; |150| 
           SHRU    .S1     A4,31,A3          ; |150| 
           ADD     .L1     A4,A3,A3          ; |150| 
           SHR     .S1     A3,1,A3           ; |150| 
           MVKL    .S2     _sizeHalfRect,B11
           MPY     .M2X    A3,B4,B4          ; |150| 
           LDW     .D2T2   *B13,B5           ; |152| 
           MPYLI   .M2     B6,B4,B7:B6       ; |150| 
           MVKH    .S2     _sizeHalfRect,B11
           MVKL    .S2     _pdf_model_full,B12
           MVKH    .S2     _pdf_model_full,B12

           MVK     .S2     9999,B7           ; |152| 
||         STW     .D2T2   B6,*B11           ; |150| 

           CMPEQ   .L2     B5,B7,B0          ; |152| 
||         MVKL    .S2     _SEM_pend,B5      ; |153| 

   [ B0]   BNOP    .S1     $C$L26,5          ; |152| 
||         MVKH    .S2     _SEM_pend,B5      ; |153| 

           ; BRANCHCC OCCURS {$C$L26}        ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
$C$DW$130	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$130, DW_AT_low_pc(0x00)
	.dwattr $C$DW$130, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$130, DW_AT_TI_call
           CALL    .S2     B5                ; |153| 
           LDW     .D2T1   *+SP(4),A4        ; |153| 
           MVK     .L2     0xffffffff,B4     ; |143| 
	.dwpsn	file "task.c",line 152,column 0,is_stmt
           NOP             2
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L24
;** --------------------------------------------------------------------------*
$C$L24:    
$C$DW$L$_Task_execute$5$B:
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL9,B3,0       ; |153| 
$C$RL9:    ; CALL OCCURS {_SEM_pend} {0}     ; |153| 
$C$DW$L$_Task_execute$5$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$6$B:
;          EXCLUSIVE CPU CYCLES: 52
           MVKL    .S1     _bufferSize,A3

           MVKH    .S1     _bufferSize,A3
||         MVKL    .S2     _BCACHE_inv,B5    ; |155| 

           LDW     .D1T2   *A3,B4            ; |155| 
||         MVKL    .S1     _buf,A3
||         MVKH    .S2     _BCACHE_inv,B5    ; |155| 

$C$DW$131	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$131, DW_AT_low_pc(0x04)
	.dwattr $C$DW$131, DW_AT_name("_BCACHE_inv")
	.dwattr $C$DW$131, DW_AT_TI_call

           MVKH    .S1     _buf,A3
||         CALL    .S2     B5                ; |155| 

           LDW     .D1T1   *A3,A4            ; |155| 
           ADDKPC  .S2     $C$RL10,B3,2      ; |155| 
           MVK     .L1     0x1,A6            ; |155| 
$C$RL10:   ; CALL OCCURS {_BCACHE_inv} {0}   ; |155| 
           MVKL    .S1     _buf,A3
           MVKH    .S1     _buf,A3

           LDW     .D1T1   *A3,A4            ; |185| 
||         MV      .L2     B11,B4            ; |155| 

           LDW     .D2T2   *B4,B5            ; |185| 
           MVKL    .S1     _target_Region+6,A31
           MVKH    .S1     _target_Region+6,A31
           MVKL    .S1     _target_Region+6,A30
           MV      .L2X    A4,B4             ; |185| Define a twin register

           LDBU    .D2T2   *+B5[B4],B4       ; |185| 
||         ADD     .L1X    B5,A4,A5          ; |185| 

           LDBU    .D1T1   *+A5(1),A6        ; |185| 
           ADD     .L2X    -6,A31,B31
           MVKH    .S1     _target_Region+6,A30
           MV      .L2     B10,B30           ; |187| 
           SHL     .S2     B4,8,B5           ; |185| 
           OR      .L2X    A6,B5,B5          ; |185| 
           STH     .D2T2   B5,*B31           ; |185| 
           LDBU    .D1T1   *+A5(2),A3        ; |186| 
           LDBU    .D1T2   *+A5(3),B4        ; |186| 
           MVKL    .S2     _pdf_representation_half,B5 ; |161| 
           MVKH    .S2     _pdf_representation_half,B5 ; |161| 
           NOP             1
           SHL     .S1     A3,8,A6           ; |186| 
           ADD     .L1     -4,A30,A3
           OR      .L2X    B4,A6,B4          ; |186| 
           STH     .D1T2   B4,*A3            ; |186| 
           LDBU    .D1T1   *+A5(4),A3        ; |187| 
           LDBU    .D1T2   *+A5(5),B4        ; |187| 
           NOP             3
           SHL     .S1     A3,8,A3           ; |187| 
           NOP             1
           OR      .L2X    B4,A3,B4          ; |187| 
           STH     .D2T2   B4,*B30           ; |187| 
           LDBU    .D1T1   *+A5(6),A3        ; |188| 
           LDBU    .D1T1   *+A5(7),A6        ; |188| 
           MV      .L2     B12,B4            ; |161| 
$C$DW$132	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$132, DW_AT_low_pc(0x00)
	.dwattr $C$DW$132, DW_AT_name("_pdf_representation_half")
	.dwattr $C$DW$132, DW_AT_TI_call
           CALL    .S2     B5                ; |161| 
           ADDKPC  .S2     $C$RL11,B3,0      ; |161| 
           SHL     .S1     A3,8,A5           ; |188| 
           MVKL    .S1     _target_Region+6,A3

           OR      .L1     A6,A5,A5          ; |188| 
||         MVKH    .S1     _target_Region+6,A3

           STH     .D1T1   A5,*A3            ; |188| 
$C$RL11:   ; CALL OCCURS {_pdf_representation_half} {0}  ; |161| 
$C$DW$L$_Task_execute$6$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$7$B:
;          EXCLUSIVE CPU CYCLES: 73
           MVKL    .S1     _buf,A3

           MVKH    .S1     _buf,A3
||         MV      .L2     B11,B4            ; |155| 

           LDW     .D1T1   *A3,A5            ; |165| 
||         LDW     .D2T2   *B4,B16

           MVK     .S2     61,B5
           MVK     .S2     57,B7
           MVK     .S2     70,B29
           MVK     .S2     53,B6
           ADD     .L1X    A5,B16,A7
           ADD     .L1X    A5,B16,A20
           ADD     .L1X    A5,B16,A11
           ADD     .L1X    A5,B16,A21
           ADD     .L1X    A5,B16,A14
           ADD     .L1X    A5,B16,A6
           ADD     .L1X    A5,B16,A9
           ADD     .L1X    A5,B16,A18

           ADD     .L1X    A5,B16,A8
||         ADDAD   .D1     A7,5,A29

           ADD     .L1X    A5,B16,A12
||         ADDAH   .D1     A20,25,A20
||         STW     .D2T1   A29,*+SP(44)

           ADDAH   .D1     A11,31,A31
||         ADD     .L1X    A5,B16,A16
||         STW     .D2T1   A20,*+SP(24)

           STW     .D2T1   A31,*+SP(56)
||         ADDAW   .D1     A21,13,A21
||         ADD     .L1X    A5,B16,A1

           ADDAW   .D1     A14,15,A26
||         ADD     .L1X    A5,B16,A2
||         STW     .D2T1   A21,*+SP(20)

           ADD     .L1X    A5,B16,A19
||         STW     .D2T1   A26,*+SP(48)
||         ADDAW   .D1     A6,11,A6

           ADDAH   .D1     A9,23,A25
||         STW     .D2T1   A6,*+SP(36)
||         ADD     .L1X    A5,B16,A4

           ADDAH   .D1     A18,27,A18
||         STW     .D2T1   A25,*+SP(32)
||         ADD     .L1X    A5,B16,A13

           ADDAD   .D1     A8,6,A28
||         ADD     .L1X    A5,B16,A17
||         STW     .D2T1   A18,*+SP(16)

           ADD     .L1X    B5,A12,A0
||         STW     .D2T1   A28,*+SP(28)

           STW     .D2T1   A0,*+SP(60)
||         ADDAH   .D1     A16,29,A16
||         ADD     .L1X    A5,B16,A24

           ADD     .L1X    A5,B16,A27
||         STW     .D2T1   A16,*+SP(8)
||         ADDAD   .D1     A1,8,A1

           ADD     .L1X    B7,A2,A3
||         STW     .D2T1   A1,*+SP(64)

           STW     .D2T1   A3,*+SP(68)
||         ADDAD   .D1     A19,7,A29
||         ADD     .L1X    A5,B16,A22

           ADD     .L1X    A5,B16,A30
||         STW     .D2T1   A29,*+SP(12)
||         ADDAH   .D1     A4,21,A4

           MVK     .S2     47,B17
||         ADD     .L1X    B29,A13,A13
||         STW     .D2T1   A4,*+SP(40)

           ADD     .L1X    B6,A17,A20
||         MVK     .S1     45,A31
||         STW     .D2T1   A13,*+SP(52)

           MVK     .S1     71,A23
||         STW     .D2T1   A20,*+SP(80)
||         ADD     .L1     A31,A27,A21
||         ADD     .D1X    B17,A24,A19

           ADD     .L1X    A5,B16,A26
||         MVK     .S1     41,A0
||         ADD     .D1     A23,A22,A6
||         STW     .D2T1   A21,*+SP(76)

           ADD     .L1     A0,A30,A18
||         ADD     .S1X    A5,B16,A25
||         STW     .D2T1   A6,*+SP(112)

           MVK     .S1     55,A28
||         STW     .D2T1   A18,*+SP(72)
||         ADD     .L1X    A5,B16,A3

           ADD     .L1     A28,A26,A16
||         ADD     .D1X    A5,B16,A20
||         MVK     .S1     51,A29
||         STW     .D2T1   A19,*+SP(104)

           MVK     .S1     67,A22
||         MVK     .S2     43,B9
||         ADD     .L1X    A5,B16,A21
||         ADD     .D1     A29,A25,A8
||         STW     .D2T1   A16,*+SP(88)

           ADD     .L1X    A5,B16,A18
||         ADD     .D1     A22,A20,A9
||         MVK     .S1     63,A25
||         STW     .D2T1   A8,*+SP(84)

           MVK     .S2     49,B28
||         ADD     .L1X    B9,A21,A28
||         STW     .D2T1   A9,*+SP(108)
||         ADD     .S1     A25,A3,A1

           ADD     .L1X    A5,B16,A26
||         STW     .D2T1   A1,*+SP(100)

           ADD     .L1X    B28,A26,A7
||         MVK     .S1     59,A26
||         STW     .D2T1   A28,*+SP(116)
||         ADD     .L2X    A5,B16,B20

           ADD     .L1     A26,A18,A9
||         STW     .D2T1   A7,*+SP(92)
||         ADD     .L2X    A5,B16,B19

           STW     .D2T1   A9,*+SP(96)
||         MV      .L1X    B12,A3            ; |165| 
||         MVK     .S1     56,A4             ; |243| 
||         ADD     .L2X    A5,B16,B26

           ADD     .L1X    B16,A5,A10
||         ADD     .L2X    A5,B16,B27
||         LDNDW   .D1T1   *+A3(A4),A5:A4    ; |247| 

           MVK     .S1     32,A16            ; |243| 
           MVK     .S1     48,A30            ; |243| 
           MVK     .S1     65,A23
           MVK     .S2     66,B8
           STW     .D2T1   A4,*+SP(120)      ; |247| 

           MV      .L1     A5,A8             ; |247| 
||         LDNDW   .D1T1   *+A3(A16),A5:A4   ; |247| 

           LDNDW   .D1T1   *+A3(A30),A21:A20 ; |248| 
           LDNDW   .D1T1   *+A3(A30),A19:A18 ; |249| 
           LDNDW   .D1T1   *+A3(A30),A25:A24 ; |243| 

           MVK     .S1     56,A31            ; |243| 
||         ADD     .L2X    A23,B26,B22
||         LDNDW   .D1T1   *+A3(A30),A23:A22 ; |247| 

           MVK     .S1     56,A9             ; |243| 
||         ADD     .L2     B8,B19,B23
||         MV      .S2X    A4,B19            ; |247| 
||         LDNDW   .D1T1   *+A3(A31),A7:A6   ; |243| 

           MV      .L2X    A5,B9             ; |247| 
||         LDNDW   .D1T1   *+A3(A9),A5:A4    ; |249| 
||         MVK     .S1     40,A17            ; |243| 

           LDNDW   .D1T1   *+A3(A17),A29:A28 ; |248| 
           LDNDW   .D1T1   *+A3(A17),A27:A26 ; |249| 
           LDNDW   .D1T1   *+A3(A17),A1:A0   ; |243| 
           LDNDW   .D1T1   *+A3(A17),A31:A30 ; |247| 

           STW     .D2T1   A5,*+SP(124)      ; |249| 
||         MVK     .S1     32,A17            ; |243| 

           MV      .L2X    A4,B8             ; |249| 
||         LDNDW   .D1T1   *+A3(A17),A5:A4   ; |243| 

           SHR     .S1     A21,16,A15        ; |247| 
           LDNDW   .D1T1   *+A3(A17),A13:A12 ; |248| 
           MVK     .S2     69,B21
           SHR     .S1     A23,8,A23         ; |248| 
           MV      .L2X    A5,B18            ; |243| 

           ADD     .L2     B21,B20,B25
||         MV      .S2X    A4,B21            ; |243| 
||         LDNDW   .D1T1   *+A3(24),A5:A4    ; |247| 
||         SHR     .S1     A19,24,A19        ; |243| 

           ADD     .L1     8,A10,A2
||         LDNDW   .D1T1   *+A3(A17),A11:A10 ; |249| 
||         MV      .L2X    A7,B4             ; |243| 
||         SHR     .S1     A22,16,A22        ; |247| 

           LDNDW   .D1T1   *+A3(16),A17:A16  ; |249| 
||         SHR     .S2X    A20,8,B5          ; |248| 
||         SHR     .S1     A24,24,A24        ; |243| 

           SHR     .S2X    A6,24,B17         ; |243| 
||         SHR     .S1     A27,24,A27        ; |243| 

	.dwpsn	file "task.c",line 237,column 0,is_stmt

           MV      .L1X    B4,A7             ; |248| 
||         SHR     .S2X    A13,16,B4         ; |247| 
||         LDNDW   .D1T1   *+A3(8),A21:A20   ; |247| 
||         SHR     .S1     A0,24,A0          ; |243| 
||         ADDAW   .D2     B27,17,B24
||         MVK     .L2     0x3,B0            ; |237| 

$C$DW$L$_Task_execute$7$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 237
;*      Loop opening brace source line   : 238
;*      Loop closing brace source line   : 258
;*      Known Minimum Trip Count         : 3                    
;*      Known Maximum Trip Count         : 3                    
;*      Known Max Trip Count Factor      : 3
;*      Loop Carried Dependency Bound(^) : 1
;*      Unpartitioned Resource Bound     : 48
;*      Partitioned Resource Bound(*)    : 75
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                    21       23     
;*      .D units                    34       40     
;*      .M units                     0        0     
;*      .X cross paths              17       16     
;*      .T address paths            52       52     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)            11       12     
;*      Bound(.L .S .D .LS .LSD)    19       21     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 75 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 75 Did not find schedule
;*         ii = 76 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 76 Did not find schedule
;*         ii = 78 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 78 Did not find schedule
;*         ii = 82 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 82 Did not find schedule
;*         ii = 90 Cannot allocate machine registers
;*                   Regs Live Always   : 26/14 (A/B-side)
;*                   Max Regs Live      : 57/17
;*                   Max Cond Regs Live :  0/1 
;*         ii = 90 Did not find schedule
;*      Disqualified loop: Did not find schedule
;*----------------------------------------------------------------------------*
$C$L25:    
$C$DW$L$_Task_execute$8$B:
	.dwpsn	file "task.c",line 238,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 118
           MV      .L2X    A4,B1             ; |247| 

           MV      .L2X    A5,B20            ; |247| 
||         LDNDW   .D1T1   *+A3(24),A5:A4    ; |248| 

           STW     .D2T1   A16,*+SP(140)     ; |247| 
           MV      .L1X    B8,A16            ; |249| 
           STW     .D2T1   A20,*+SP(148)     ; |247| 
           NOP             1
           MV      .L2X    A5,B27            ; |248| 

           MV      .L2X    A4,B29            ; |248| 
||         LDNDW   .D1T1   *+A3(24),A5:A4    ; |249| 

           NOP             4

           STW     .D2T1   A4,*+SP(128)      ; |249| 
||         MV      .L1     A8,A4             ; |249| 
||         MV      .L2X    A5,B26            ; |249| 

           LDNDW   .D1T1   *+A3(16),A9:A8    ; |248| 
||         SHR     .S1     A4,8,A14          ; |248| 

           LDNDW   .D1T1   *+A3(24),A5:A4    ; |243| 
           NOP             3

           MV      .L2X    A8,B2             ; |248| 
||         LDW     .D2T1   *+SP(112),A8      ; |248| 

           STW     .D2T1   A5,*+SP(132)      ; |248| 
||         MV      .L2X    A4,B30            ; |248| 

           LDNDW   .D1T1   *+A3(16),A5:A4    ; |243| 
           MV      .L2X    A9,B31            ; |248| 
           LDW     .D2T1   *+SP(96),A9       ; |249| 
           STB     .D1T1   A7,*A8            ; |249| 
           LDW     .D2T1   *+SP(108),A8      ; |249| 

           LDW     .D2T1   *+SP(100),A7      ; |249| 
||         MV      .L2X    A4,B3             ; |243| 

           STW     .D2T1   A5,*+SP(144)      ; |243| 
           LDNDW   .D1T1   *+A3(8),A5:A4     ; |248| 

           STB     .D1T1   A18,*A9           ; |249| 
||         MV      .L1X    B18,A9            ; |249| 

           STB     .D1T1   A16,*A8           ; |249| 
||         MV      .L1X    B20,A18           ; |249| 

           LDW     .D2T1   *+SP(84),A8       ; |249| 
           LDW     .D2T1   *+SP(88),A16      ; |249| 

           STB     .D1T1   A25,*A7           ; |249| 
||         MV      .L1X    B19,A25           ; |249| 
||         MV      .L2X    A5,B16            ; |248| 

           STW     .D2T1   A4,*+SP(152)      ; |248| 
           LDNDW   .D1T1   *+A3(8),A5:A4     ; |249| 

           STB     .D1T1   A26,*A8           ; |249| 
||         SHR     .S1     A25,16,A26        ; |247| 
||         MV      .L1X    B9,A8             ; |249| 
||         SHR     .S2X    A11,24,B9         ; |243| 

           STB     .D1T1   A1,*A16           ; |249| 
||         MV      .L1X    B21,A16           ; |249| 

           LDW     .D2T1   *+SP(116),A25     ; |249| 
||         SHR     .S1     A16,24,A1         ; |243| 

           LDW     .D2T1   *+SP(64),A16      ; |248| 

           LDW     .D2T1   *+SP(104),A7      ; |249| 
||         MV      .L2X    A5,B6             ; |249| 

           STW     .D2T1   A4,*+SP(156)      ; |249| 
           LDNDW   .D1T1   *A3,A5:A4         ; |249| 

           STB     .D1T1   A10,*A25          ; |249| 
||         MV      .L1X    B17,A25           ; |248| 
||         SHR     .S1     A18,8,A10         ; |248| 

           STB     .D1T1   A25,*A16          ; |243| 
           LDW     .D2T1   *+SP(48),A25      ; |247| 

           STB     .D1T1   A9,*A7            ; |249| 
||         MV      .L1X    B27,A7            ; |249| 

           LDW     .D2T1   *+SP(52),A9       ; |249| 
||         MV      .L1     A4,A20            ; |249| 
||         SHR     .S1     A7,16,A11         ; |247| 

           LDW     .D2T1   *+SP(56),A18      ; |243| 
           LDW     .D2T1   *+SP(8),A16       ; |243| 
           STB     .D1T1   A19,*A25          ; |243| 
           LDW     .D2T1   *+SP(16),A25      ; |243| 
           STW     .D2T1   A5,*+SP(160)      ; |249| 
           STB     .D1T1   A14,*A9           ; |248| 
           LDW     .D2T1   *+SP(60),A9       ; |248| 
           LDNDW   .D1T1   *+A3(8),A5:A4     ; |243| 
           LDNDW   .D1T1   *+A3(16),A7:A6    ; |247| 

           STB     .D1T1   A23,*A18          ; |248| 
||         MV      .L1X    B5,A23            ; |243| 

           STB     .D1T1   A23,*A16          ; |248| 
||         SHR     .S1     A31,8,A16         ; |248| 
||         MV      .L1X    B3,A31            ; |243| 

           STB     .D1T1   A16,*A25          ; |248| 
           LDW     .D2T1   *+SP(12),A25      ; |247| 

           STW     .D2T1   A4,*+SP(164)      ; |243| 
||         MV      .L2X    A7,B28            ; |243| 

           STW     .D2T1   A5,*+SP(168)      ; |243| 

           LDNDW   .D1T1   *A3,A5:A4         ; |243| 
||         MV      .L1X    B28,A18           ; |243| 

           STB     .D1T1   A15,*A9           ; |247| 
||         SHR     .S1     A18,8,A19         ; |248| 

           LDW     .D2T1   *+SP(68),A9       ; |248| 
           LDW     .D2T1   *+SP(80),A7       ; |248| 
           STW     .D2T1   A6,*+SP(136)      ; |243| 

           LDW     .D2T1   *+SP(136),A18     ; |248| 
||         MV      .L2X    A5,B7             ; |243| 

           STB     .D1T1   A24,*A25          ; |243| 
||         SHR     .S1     A28,8,A25         ; |248| 

           LDW     .D2T1   *+SP(148),A28     ; |243| 
||         SHR     .S1     A31,24,A24        ; |243| 
||         MV      .L1X    B6,A31            ; |248| 

           LDW     .D2T1   *+SP(20),A16      ; |248| 
||         SHR     .S1     A31,24,A15        ; |243| 
||         MV      .L1X    B7,A5             ; |249| 

           STW     .D2T1   A4,*+SP(172)      ; |243| 

           STB     .D1T1   A22,*A9           ; |247| 
||         SHR     .S1     A29,16,A9         ; |247| 
||         MV      .L1     A21,A29           ; |248| 

           MVK     .S1     56,A22            ; |243| 
||         STB     .D1T1   A9,*A7            ; |247| 

           LDNDW   .D1T1   *+A3(A22),A7:A6   ; |248| 
||         SHR     .S1     A18,16,A23        ; |247| 
||         MV      .L1X    B16,A18           ; |243| 

           LDW     .D2T1   *+SP(28),A22      ; |247| 
||         SHR     .S1     A29,8,A21         ; |248| 
||         MV      .L1     A20,A29           ; |243| 

           LDW     .D2T1   *+SP(24),A4       ; |243| 
||         SHR     .S1     A28,16,A20        ; |247| 

           LDW     .D2T1   *+SP(92),A9       ; |248| 

           STB     .D1T1   A27,*A16          ; |243| 
||         SHR     .S1     A18,16,A27        ; |247| 

           SHR     .S1     A30,16,A18        ; |247| 
||         LDW     .D2T1   *+SP(112),A28     ; |249| 
||         MV      .L2X    A7,B8             ; |248| 

           LDW     .D2T1   *+SP(128),A7      ; |249| 
||         MV      .L2X    A6,B5             ; |248| 

           STB     .D1T1   A0,*A22           ; |243| 
           STB     .D1T1   A18,*A9           ; |247| 
           LDW     .D2T1   *+SP(140),A9      ; |249| 

           LDW     .D2T1   *+SP(144),A22     ; |249| 
||         ADDK    .S1     64,A28            ; |249| 

           STB     .D1T1   A25,*A4           ; |248| 
           LDW     .D2T1   *+SP(156),A25     ; |249| 
           LDW     .D2T1   *+SP(160),A31     ; |249| 
           LDW     .D2T1   *+SP(168),A18     ; |249| 
           LDW     .D2T1   *+SP(152),A16     ; |247| 
           LDW     .D2T1   *+SP(164),A30     ; |249| 
           STB     .D1T1   A29,*+A2(3)       ; |249| 
           LDW     .D2T1   *+SP(172),A29     ; |249| 
           STW     .D2T1   A28,*+SP(112)     ; |249| 

           LDW     .D2T1   *+SP(64),A28      ; |249| 
||         SHR     .S1     A16,8,A0          ; |248| 

           STB     .D1T1   A25,*+A2(11)      ; |249| 
||         SHR     .S1     A31,24,A16        ; |243| 

           STB     .D1T1   A22,*+A2(23)      ; |249| 
||         SHR     .S1     A30,24,A6         ; |243| 

           STB     .D1T1   A7,*+A2(27)       ; |249| 
||         SHR     .S1     A29,24,A7         ; |243| 

           STB     .D1T1   A9,*+A2(19)       ; |249| 

           STB     .D1T1   A18,*+A2(15)      ; |249| 
||         ADDK    .S1     64,A28            ; |249| 

           LDW     .D2T1   *+SP(84),A9       ; |249| 
           LDW     .D2T1   *+SP(116),A22     ; |249| 
           LDW     .D2T1   *+SP(96),A25      ; |249| 
           LDW     .D2T1   *+SP(88),A18      ; |249| 
           LDW     .D2T1   *+SP(52),A29      ; |249| 

           LDW     .D2T1   *+SP(104),A31     ; |249| 
||         ADDK    .S1     64,A9             ; |249| 

           LDW     .D2T1   *+SP(100),A30     ; |249| 
||         ADDK    .S1     64,A22            ; |249| 

           STB     .D1T1   A5,*+A2(7)        ; |249| 
||         ADDK    .S1     64,A25            ; |249| 

           LDW     .D2T1   *+SP(108),A5      ; |249| 
||         ADDK    .S1     64,A18            ; |249| 

           ADDK    .S1     64,A29            ; |249| 
||         STW     .D2T1   A28,*+SP(64)      ; |249| 

           ADDK    .S1     64,A31            ; |249| 
||         STW     .D2T1   A9,*+SP(84)       ; |249| 

           ADDK    .S1     64,A30            ; |249| 
||         STW     .D2T1   A18,*+SP(88)      ; |249| 

           STW     .D2T1   A22,*+SP(116)     ; |249| 

           ADDK    .S1     64,A5             ; |249| 
||         STW     .D2T1   A25,*+SP(96)      ; |249| 

           STW     .D2T1   A31,*+SP(104)     ; |249| 
           STW     .D2T1   A29,*+SP(52)      ; |249| 
           STW     .D2T1   A30,*+SP(100)     ; |249| 
           STW     .D2T1   A5,*+SP(108)      ; |249| 
$C$DW$L$_Task_execute$8$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$9$B:
;          EXCLUSIVE CPU CYCLES: 97

           LDW     .D2T1   *+SP(56),A5       ; |249| 
||         SHR     .S1     A8,8,A8           ; |248| 
||         SUB     .L2     B0,1,B0           ; |237| 
||         SHR     .S2     B8,16,B19         ; |247| 

           LDW     .D2T1   *+SP(80),A28      ; |249| 
|| [ B0]   MVK     .S1     56,A4             ; |243| 
||         SHR     .S2     B5,8,B5           ; |248| 

           LDW     .D2T1   *+SP(8),A18       ; |249| 
||         SHR     .S1     A17,24,A17        ; |243| 

           LDW     .D2T1   *+SP(12),A31      ; |249| 
           LDW     .D2T1   *+SP(48),A25      ; |249| 

           ADDK    .S1     64,A5             ; |249| 
||         LDW     .D2T1   *+SP(68),A9       ; |249| 

           STW     .D2T1   A5,*+SP(56)       ; |249| 
||         ADDK    .S1     64,A28            ; |249| 

           LDW     .D2T1   *+SP(20),A5       ; |249| 
||         ADDK    .S1     64,A18            ; |249| 

           STW     .D2T1   A28,*+SP(80)      ; |249| 
||         ADDK    .S1     64,A31            ; |249| 

           LDW     .D2T1   *+SP(92),A28      ; |249| 
||         ADDK    .S1     64,A25            ; |249| 

           LDW     .D2T1   *+SP(60),A30      ; |249| 
||         ADDK    .S1     64,A9             ; |249| 

           LDW     .D2T1   *+SP(132),A29     ; |249| 

           ADDK    .S1     64,A5             ; |249| 
||         STW     .D2T1   A18,*+SP(8)       ; |249| 

           STW     .D2T1   A5,*+SP(20)       ; |249| 

           LDW     .D2T1   *+SP(28),A5       ; |249| 
||         ADDK    .S1     64,A28            ; |249| 

           LDW     .D2T1   *+SP(24),A18      ; |249| 
||         ADDK    .S1     64,A30            ; |249| 

           STW     .D2T1   A31,*+SP(12)      ; |249| 
||         MV      .L1X    B31,A31           ; |248| 

           LDW     .D2T1   *+SP(16),A22      ; |249| 
           STW     .D2T1   A25,*+SP(48)      ; |249| 

           STW     .D2T1   A9,*+SP(68)       ; |249| 
||         SHR     .S1     A31,16,A9         ; |247| 
||         MV      .L1X    B26,A31           ; |248| 

           LDW     .D2T1   *+SP(76),A25      ; |249| 
||         ADDK    .S1     64,A5             ; |249| 

           STB     .D1T1   A9,*+A2(21)       ; |247| 
||         ADDK    .S1     64,A18            ; |249| 
||         STB     .D2T2   B19,*B25          ; |247| 
||         ADDK    .S2     64,B25            ; |249| 

           LDW     .D2T1   *+SP(40),A9       ; |249| 
||         ADDK    .S1     64,A22            ; |249| 

           STW     .D2T1   A5,*+SP(28)       ; |249| 
           LDW     .D2T1   *+SP(32),A5       ; |249| 
           STW     .D2T1   A28,*+SP(92)      ; |249| 

           STB     .D1T1   A29,*+A2(31)      ; |249| 
||         STB     .D2T2   B5,*B23           ; |248| 
||         ADDK    .S2     64,B23            ; |249| 

           LDNDW   .D1T1   *A3,A29:A28       ; |247| 
           STW     .D2T1   A30,*+SP(60)      ; |249| 

           LDW     .D2T1   *+SP(32),A30      ; |249| 
||         ADDK    .S1     64,A5             ; |249| 

           STW     .D2T1   A18,*+SP(24)      ; |249| 
||         MV      .L1X    B4,A18            ; |249| 

           STB     .D1T1   A18,*A25          ; |247| 
||         MV      .L1X    B29,A25           ; |243| 

           STW     .D2T1   A22,*+SP(16)      ; |249| 
||         SHR     .S1     A12,8,A22         ; |248| 

           SHR     .S1     A25,8,A18         ; |248| 
||         STB     .D1T1   A22,*A9           ; |248| 
||         MV      .L1X    B30,A9            ; |247| 

           SHR     .S1     A29,8,A29         ; |248| 
||         STB     .D1T1   A18,*+A2(26)      ; |248| 

           SHR     .S1     A9,24,A18         ; |243| 
||         STB     .D1T1   A8,*A30           ; |248| 

           LDW     .D2T1   *+SP(36),A8       ; |249| 
||         SHR     .S1     A28,16,A28        ; |247| 

           STW     .D2T1   A5,*+SP(32)       ; |249| 
||         SHR     .S1     A31,24,A12        ; |243| 

           LDW     .D2T1   *+SP(40),A5       ; |249| 
           STB     .D1T1   A29,*+A2(6)       ; |248| 
           LDW     .D2T1   *+SP(76),A29      ; |249| 
           STB     .D1T1   A18,*+A2(24)      ; |243| 
           LDW     .D2T1   *+SP(44),A18      ; |249| 

           LDW     .D2T1   *+SP(72),A9       ; |249| 
||         ADDK    .S1     64,A5             ; |249| 

           STB     .D1T1   A28,*+A2(1)       ; |247| 
||         MV      .L1     A8,A28            ; |249| 

           ADDK    .S1     64,A29            ; |249| 
||         STW     .D2T1   A5,*+SP(40)       ; |249| 

           ADDK    .S1     64,A28            ; |249| 
||         STW     .D2T1   A29,*+SP(76)      ; |249| 

           ADDK    .S1     64,A18            ; |249| 
||         LDW     .D2T1   *+SP(44),A29      ; |249| 

           ADDK    .S1     64,A9             ; |249| 
||         STW     .D2T1   A18,*+SP(44)      ; |249| 

           STW     .D2T1   A28,*+SP(36)      ; |249| 
|| [!B0]   MVKL    .S1     _BCACHE_wb,A5     ; |170| 

           LDW     .D2T1   *+SP(72),A25      ; |249| 
|| [!B0]   MVKH    .S1     _BCACHE_wb,A5     ; |170| 

           STW     .D2T1   A9,*+SP(72)       ; |249| 
|| [ B0]   MVK     .S1     56,A9             ; |243| 

           LDNDW   .D1T1   *A3,A31:A30       ; |248| 
||         ADDK    .S1     64,A3             ; |237| 

   [ B0]   LDNDW   .D1T1   *+A3(A4),A5:A4    ; |247| 
|| [!B0]   MVKL    .S1     _bufferSize,A3

           LDW     .D2T1   *+SP(120),A28     ; |249| 
|| [!B0]   MVKH    .S1     _bufferSize,A3

           STB     .D1T1   A17,*+A2(20)      ; |243| 
||         MV      .L1X    B9,A17            ; |249| 

           STB     .D1T1   A16,*+A2(4)       ; |243| 
|| [ B0]   MVK     .S1     32,A16            ; |243| 

           STB     .D1T1   A17,*A8           ; |243| 
||         MV      .L1X    B1,A17            ; |248| 
||         SHR     .S1     A31,16,A31        ; |247| 

   [ B0]   STW     .D2T1   A4,*+SP(120)      ; |247| 
|| [ B0]   MV      .L1     A5,A8             ; |247| 
||         SHR     .S1     A17,16,A14        ; |247| 

   [ B0]   LDNDW   .D1T1   *+A3(A16),A5:A4   ; |247| 
||         SHR     .S1     A30,8,A30         ; |248| 
||         SHR     .S2X    A28,16,B6         ; |247| 

           LDW     .D2T1   *+SP(124),A17     ; |249| 

           STB     .D1T1   A26,*A25          ; |247| 
||         MV      .L1X    B2,A25            ; |243| 
||         STB     .D2T2   B6,*B22           ; |247| 
||         ADDK    .S2     64,B22            ; |249| 

           SHR     .S1     A25,8,A22         ; |248| 
||         STB     .D1T1   A31,*+A2(5)       ; |247| 

   [ B0]   MVK     .S1     56,A31            ; |243| 
||         STB     .D1T1   A30,*+A2(2)       ; |248| 

   [ B0]   MV      .L2X    A5,B9             ; |247| 
|| [ B0]   MVK     .S1     48,A30            ; |243| 
||         STB     .D1T1   A1,*A29           ; |243| 

   [ B0]   MV      .L2X    A4,B19            ; |247| 
|| [ B0]   LDNDW   .D1T1   *+A3(A9),A5:A4    ; |249| 

           SHR     .S2X    A17,24,B4         ; |243| 
|| [ B0]   MVK     .S1     40,A17            ; |243| 
||         STB     .D1T1   A22,*+A2(18)      ; |248| 

   [ B0]   LDNDW   .D1T1   *+A3(A17),A29:A28 ; |248| 

           STB     .D1T1   A19,*+A2(22)      ; |248| 
||         STB     .D2T2   B4,*B24           ; |243| 
||         ADDK    .S2     64,B24            ; |249| 

   [ B0]   LDNDW   .D1T1   *+A3(A30),A19:A18 ; |249| 

           STB     .D1T1   A24,*+A2(16)      ; |243| 
|| [ B0]   MV      .L2X    A4,B8             ; |249| 

   [ B0]   LDNDW   .D1T1   *+A3(A30),A25:A24 ; |243| 
           STB     .D1T1   A23,*+A2(17)      ; |247| 
   [ B0]   LDNDW   .D1T1   *+A3(A30),A23:A22 ; |247| 

           STB     .D1T1   A21,*+A2(14)      ; |248| 
|| [ B0]   SHR     .S1     A19,24,A19        ; |243| 

           STB     .D1T1   A27,*+A2(13)      ; |247| 

   [ B0]   LDNDW   .D1T1   *+A3(A17),A27:A26 ; |249| 
|| [ B0]   SHR     .S1     A24,24,A24        ; |243| 

           STB     .D1T1   A0,*+A2(10)       ; |248| 

   [ B0]   LDNDW   .D1T1   *+A3(A17),A1:A0   ; |243| 
|| [ B0]   SHR     .S1     A22,16,A22        ; |247| 

           STB     .D1T1   A20,*+A2(9)       ; |247| 
|| [ B0]   SHR     .S1     A23,8,A23         ; |248| 

   [ B0]   LDNDW   .D1T1   *+A3(A30),A21:A20 ; |248| 

           STB     .D1T1   A6,*+A2(8)        ; |243| 
|| [ B0]   SHR     .S1     A27,24,A27        ; |243| 

           STB     .D1T1   A7,*A2            ; |243| 

   [ B0]   LDNDW   .D1T1   *+A3(A31),A7:A6   ; |243| 
|| [ B0]   SHR     .S1     A0,24,A0          ; |243| 

   [ B0]   LDNDW   .D1T1   *+A3(A17),A31:A30 ; |247| 
|| [ B0]   MVK     .S1     32,A17            ; |243| 

   [ B0]   STW     .D2T1   A5,*+SP(124)      ; |249| 
|| [ B0]   SHR     .S2X    A20,8,B5          ; |248| 

   [ B0]   LDNDW   .D1T1   *+A3(A17),A5:A4   ; |243| 
           STB     .D1T1   A12,*+A2(28)      ; |243| 

   [ B0]   LDNDW   .D1T1   *+A3(A17),A13:A12 ; |248| 
|| [ B0]   MV      .L2X    A7,B4             ; |243| 

           STB     .D1T1   A10,*+A2(30)      ; |248| 
|| [ B0]   SHR     .S2X    A6,24,B17         ; |243| 

           STB     .D1T1   A11,*+A2(29)      ; |247| 
|| [ B0]   MV      .L1X    B4,A7             ; |248| 

   [ B0]   MV      .L2X    A5,B18            ; |243| 
|| [ B0]   B       .S1     $C$L25            ; |237| 
|| [ B0]   LDNDW   .D1T1   *+A3(A17),A11:A10 ; |249| 

   [ B0]   MV      .L2X    A4,B21            ; |243| 
|| [ B0]   LDNDW   .D1T1   *+A3(24),A5:A4    ; |247| 

   [ B0]   LDNDW   .D1T1   *+A3(16),A17:A16  ; |249| 
|| [ B0]   SHR     .S2X    A13,16,B4         ; |247| 

           STB     .D1T1   A14,*+A2(25)      ; |247| 

           STB     .D1T1   A15,*+A2(12)      ; |243| 
|| [ B0]   SHR     .S1     A21,16,A15        ; |247| 

	.dwpsn	file "task.c",line 258,column 0,is_stmt

           ADDK    .S1     64,A2             ; |249| 
|| [ B0]   LDNDW   .D1T1   *+A3(8),A21:A20   ; |247| 

           ; BRANCHCC OCCURS {$C$L25}        ; |237| 
$C$DW$L$_Task_execute$9$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$10$B:
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D1T2   *A3,B4            ; |170| 
||         MVKL    .S1     _buf,A3

$C$DW$133	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$133, DW_AT_low_pc(0x04)
	.dwattr $C$DW$133, DW_AT_name("_BCACHE_wb")
	.dwattr $C$DW$133, DW_AT_TI_call

           MVKH    .S1     _buf,A3
||         CALL    .S2X    A5                ; |170| 

           LDW     .D1T1   *A3,A4            ; |170| 
           ADDKPC  .S2     $C$RL12,B3,2      ; |170| 
           MVK     .L1     0x1,A6            ; |170| 
$C$RL12:   ; CALL OCCURS {_BCACHE_wb} {0}    ; |170| 
$C$DW$L$_Task_execute$10$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$11$B:
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _NOTIFY_notify,B5 ; |172| 
           MVKH    .S2     _NOTIFY_notify,B5 ; |172| 
$C$DW$134	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$134, DW_AT_low_pc(0x00)
	.dwattr $C$DW$134, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$134, DW_AT_TI_call
           CALL    .S2     B5                ; |172| 
           MVK     .S2     0x65,B6           ; |148| 
           ADDKPC  .S2     $C$RL13,B3,2      ; |172| 

           MVK     .L1     0x1,A4            ; |172| 
||         ZERO    .L2     B4                ; |172| 
||         MVK     .S1     0x5,A6            ; |172| 

$C$RL13:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |172| 
$C$DW$L$_Task_execute$11$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$12$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *B13,B5           ; |152| 
           MVK     .S2     0x270f,B4         ; |152| 
           NOP             3

           CMPEQ   .L2     B5,B4,B0          ; |152| 
||         MVKL    .S2     _SEM_pend,B5      ; |153| 

   [!B0]   B       .S1     $C$L24            ; |152| 
||         MVKH    .S2     _SEM_pend,B5      ; |153| 

$C$DW$135	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$135, DW_AT_low_pc(0x00)
	.dwattr $C$DW$135, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$135, DW_AT_TI_call
   [!B0]   CALL    .S2     B5                ; |153| 
   [!B0]   LDW     .D2T1   *+SP(4),A4        ; |153| 
   [!B0]   MVK     .L2     0xffffffff,B4     ; |143| 
	.dwpsn	file "task.c",line 173,column 0,is_stmt
           NOP             2
           ; BRANCHCC OCCURS {$C$L24}        ; |152| 
$C$DW$L$_Task_execute$12$E:
;** --------------------------------------------------------------------------*
$C$L26:    
;          EXCLUSIVE CPU CYCLES: 12
           ADDK    .S2     176,SP            ; |176| 
           LDW     .D2T2   *++SP(8),B3       ; |176| 
           LDDW    .D2T1   *++SP,A13:A12     ; |176| 
           LDDW    .D2T1   *++SP,A15:A14     ; |176| 
           LDDW    .D2T2   *++SP,B11:B10     ; |176| 
           LDDW    .D2T2   *++SP,B13:B12     ; |176| 
$C$DW$136	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$136, DW_AT_low_pc(0x04)
	.dwattr $C$DW$136, DW_AT_TI_return

           LDW     .D2T1   *++SP(8),A10      ; |176| 
||         RET     .S2     B3                ; |176| 

           LDW     .D2T1   *++SP(8),A11      ; |176| 
           ZERO    .L1     A4                ; |175| 
	.dwpsn	file "task.c",line 176,column 3,is_stmt
           NOP             3
           ; BRANCH OCCURS {B3}              ; |176| 

$C$DW$137	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$137, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L24:1:1496782367")
	.dwattr $C$DW$137, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$137, DW_AT_TI_begin_line(0x98)
	.dwattr $C$DW$137, DW_AT_TI_end_line(0xad)
$C$DW$138	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$138, DW_AT_low_pc($C$DW$L$_Task_execute$5$B)
	.dwattr $C$DW$138, DW_AT_high_pc($C$DW$L$_Task_execute$5$E)
$C$DW$139	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$139, DW_AT_low_pc($C$DW$L$_Task_execute$6$B)
	.dwattr $C$DW$139, DW_AT_high_pc($C$DW$L$_Task_execute$6$E)
$C$DW$140	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$140, DW_AT_low_pc($C$DW$L$_Task_execute$7$B)
	.dwattr $C$DW$140, DW_AT_high_pc($C$DW$L$_Task_execute$7$E)
$C$DW$141	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$141, DW_AT_low_pc($C$DW$L$_Task_execute$10$B)
	.dwattr $C$DW$141, DW_AT_high_pc($C$DW$L$_Task_execute$10$E)
$C$DW$142	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$142, DW_AT_low_pc($C$DW$L$_Task_execute$11$B)
	.dwattr $C$DW$142, DW_AT_high_pc($C$DW$L$_Task_execute$11$E)
$C$DW$143	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$143, DW_AT_low_pc($C$DW$L$_Task_execute$12$B)
	.dwattr $C$DW$143, DW_AT_high_pc($C$DW$L$_Task_execute$12$E)

$C$DW$144	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$144, DW_AT_name("/data/home/in4342-05/priadi/assignment_2/track-neon/dsp/task.asm:$C$L25:2:1496782367")
	.dwattr $C$DW$144, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$144, DW_AT_TI_begin_line(0xed)
	.dwattr $C$DW$144, DW_AT_TI_end_line(0x102)
$C$DW$145	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$145, DW_AT_low_pc($C$DW$L$_Task_execute$8$B)
	.dwattr $C$DW$145, DW_AT_high_pc($C$DW$L$_Task_execute$8$E)
$C$DW$146	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$146, DW_AT_low_pc($C$DW$L$_Task_execute$9$B)
	.dwattr $C$DW$146, DW_AT_high_pc($C$DW$L$_Task_execute$9$E)
	.dwendtag $C$DW$144

	.dwendtag $C$DW$137

	.dwattr $C$DW$124, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$124, DW_AT_TI_end_line(0xb0)
	.dwattr $C$DW$124, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$124

	.sect	".text"
	.clink
	.global	_Task_delete

$C$DW$147	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_delete")
	.dwattr $C$DW$147, DW_AT_low_pc(_Task_delete)
	.dwattr $C$DW$147, DW_AT_high_pc(0x00)
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("_Task_delete")
	.dwattr $C$DW$147, DW_AT_external
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$147, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$147, DW_AT_TI_begin_line(0x105)
	.dwattr $C$DW$147, DW_AT_TI_begin_column(0x07)
	.dwattr $C$DW$147, DW_AT_frame_base[DW_OP_breg31 16]
	.dwattr $C$DW$147, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 262,column 3,is_stmt,address _Task_delete
$C$DW$148	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$148, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_delete                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B13,SP,A16,A17,A18,A19,A20,A21,   *
;*                           A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17, *
;*                           B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29, *
;*                           B30,B31                                          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B13,SP,A16,A17,A18,A19,A20,A21,   *
;*                           A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17, *
;*                           B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29, *
;*                           B30,B31                                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 16 Save = 16 byte                  *
;******************************************************************************
_Task_delete:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     _NOTIFY_unregister,A3 ; |268| 
           MVKH    .S1     _NOTIFY_unregister,A3 ; |268| 
           MVKL    .S2     _Task_notify,B6   ; |268| 
$C$DW$149	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$149, DW_AT_low_pc(0x00)
	.dwattr $C$DW$149, DW_AT_name("_NOTIFY_unregister")
	.dwattr $C$DW$149, DW_AT_TI_call
           CALL    .S2X    A3                ; |268| 
           STW     .D2T2   B13,*SP--(8)      ; |262| 
           MVKH    .S2     _Task_notify,B6   ; |268| 
           MV      .L1     A4,A8             ; |262| 
           ZERO    .L2     B4                ; |268| 

           STDW    .D2T1   A11:A10,*SP--     ; |262| 
||         MV      .L1     A4,A11            ; |262| 
||         MV      .L2     B3,B13            ; |262| 
||         ADDKPC  .S2     $C$RL14,B3,0      ; |268| 
||         MVK     .S1     0x5,A6            ; |268| 
||         MVK     .D1     0x1,A4            ; |268| 

$C$RL14:   ; CALL OCCURS {_NOTIFY_unregister} {0}  ; |268| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _MEM_free,B5      ; |275| 

           MVKH    .S2     _MEM_free,B5      ; |275| 
||         MVKL    .S1     _DDR2,A3

$C$DW$150	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$150, DW_AT_low_pc(0x00)
	.dwattr $C$DW$150, DW_AT_name("_MEM_free")
	.dwattr $C$DW$150, DW_AT_TI_call

           CALL    .S2     B5                ; |275| 
||         MVKH    .S1     _DDR2,A3

           MV      .L1     A4,A10            ; |268| 
||         LDW     .D1T1   *A3,A4            ; |275| 

           ADDKPC  .S2     $C$RL15,B3,2      ; |275| 

           MV      .L2X    A11,B4            ; |275| 
||         MVK     .S1     0x28,A6           ; |275| 

$C$RL15:   ; CALL OCCURS {_MEM_free} {0}     ; |275| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L2     B13,B3            ; |281| 
$C$DW$151	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$151, DW_AT_low_pc(0x00)
	.dwattr $C$DW$151, DW_AT_TI_return

           RET     .S2     B3                ; |281| 
||         MV      .L1     A10,A4            ; |280| 
||         LDDW    .D2T1   *++SP,A11:A10     ; |281| 

           LDW     .D2T2   *++SP(8),B13      ; |281| 
	.dwpsn	file "task.c",line 281,column 3,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |281| 
	.dwattr $C$DW$147, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$147, DW_AT_TI_end_line(0x119)
	.dwattr $C$DW$147, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$147

	.sect	".text"
	.clink
	.global	_Task_create

$C$DW$152	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_create")
	.dwattr $C$DW$152, DW_AT_low_pc(_Task_create)
	.dwattr $C$DW$152, DW_AT_high_pc(0x00)
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("_Task_create")
	.dwattr $C$DW$152, DW_AT_external
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$152, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$152, DW_AT_TI_begin_line(0x44)
	.dwattr $C$DW$152, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$152, DW_AT_frame_base[DW_OP_breg31 24]
	.dwattr $C$DW$152, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 69,column 1,is_stmt,address _Task_create
$C$DW$153	.dwtag  DW_TAG_formal_parameter, DW_AT_name("infoPtr")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("_infoPtr")
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$90)
	.dwattr $C$DW$153, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_create                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,A19,A20,   *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,A19,A20,   *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 24 Save = 24 byte                  *
;******************************************************************************
_Task_create:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     _MEM_valloc,A3    ; |77| 

           MVKH    .S1     _MEM_valloc,A3    ; |77| 
||         STW     .D2T1   A11,*SP--(8)      ; |69| 

           STDW    .D2T2   B11:B10,*SP--     ; |69| 
||         MV      .L2X    A4,B10            ; |69| 
||         MVKL    .S1     _DDR2,A4

$C$DW$154	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$154, DW_AT_low_pc(0x00)
	.dwattr $C$DW$154, DW_AT_name("_MEM_valloc")
	.dwattr $C$DW$154, DW_AT_TI_call

           CALL    .S2X    A3                ; |77| 
||         STW     .D2T1   A10,*SP--(8)      ; |69| 
||         MVKH    .S1     _DDR2,A4

           LDW     .D1T1   *A4,A4            ; |77| 
           MVK     .S2     0x28,B4           ; |77| 
           MV      .L2     B3,B11            ; |69| 
           ADDKPC  .S2     $C$RL16,B3,0      ; |77| 

           ZERO    .L1     A6                ; |77| 
||         ZERO    .L2     B6                ; |77| 

$C$RL16:   ; CALL OCCURS {_MEM_valloc} {0}   ; |77| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S2     _MPCSXFER_BufferSize,B4
||         MV      .L1     A4,A0             ; |80| 
||         ZERO    .D1     A10               ; |71| 
||         MVKL    .S1     __SEM_dopost,A3
||         STW     .D2T1   A4,*B10           ; |77| 
||         ZERO    .L2     B9                ; |93| 

           MVKH    .S2     _MPCSXFER_BufferSize,B4
|| [ A0]   MV      .L1     A0,A10            ; |86| 
||         MVKH    .S1     __SEM_dopost,A3
||         MVK     .D1     0x1,A4            ; |104| 
||         ZERO    .L2     B8                ; |93| 

           LDHU    .D2T2   *B4,B7            ; |91| 
||         MVK     .L2     0x1,B4            ; |82| 
||         MVKL    .S2     _Task_notify,B6   ; |104| 
||         MVK     .L1     0x5,A6            ; |104| 
||         ADD     .D1     A10,24,A5         ; |87| 
||         MV      .S1     A10,A8            ; |104| 

           MVKH    .S2     _Task_notify,B6   ; |104| 

           MV      .L1X    B4,A11            ; |91| 
||         MVKL    .S2     _NOTIFY_register,B5 ; |104| 
||         ZERO    .L2     B4                ; |93| 

   [ A0]   ZERO    .L1     A11               ; |70| 
||         MVKH    .S2     _NOTIFY_register,B5 ; |104| 

           MV      .L1     A11,A0            ; |104| 

   [ A0]   MVKL    .S1     _NOTIFY_notify,A3 ; |121| 
|| [ A0]   MVK     .L1     0x5,A6            ; |121| 
|| [ A0]   MVK     .D1     0x1,A4            ; |121| 
|| [ A0]   ZERO    .L2     B4                ; |121| 
|| [ A0]   ZERO    .S2     B6                ; |121| 

   [ A0]   B       .S2     $C$L27            ; |91| 
|| [ A0]   MVKH    .S1     _NOTIFY_notify,A3 ; |121| 
|| [!A0]   STW     .D1T2   B9,*+A10(20)      ; |86| 

   [ A0]   BNOP    .S1     $C$L29,3          ; |119| 
$C$DW$155	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$155, DW_AT_low_pc(0x00)
	.dwattr $C$DW$155, DW_AT_name("_NOTIFY_register")
	.dwattr $C$DW$155, DW_AT_TI_call

   [!A0]   CALL    .S2     B5                ; |104| 
|| [!A0]   STW     .D1T2   B7,*+A10(36)      ; |94| 

           ; BRANCHCC OCCURS {$C$L27}        ; |91| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           STW     .D1T2   B8,*A10           ; |93| 
           STW     .D1T1   A3,*+A10(16)      ; |89| 
           STW     .D1T2   B9,*+A10(12)      ; |88| 
           STW     .D1T1   A5,*+A10(24)      ; |87| 

           STW     .D1T1   A5,*+A10(28)      ; |87| 
||         ADDKPC  .S2     $C$RL17,B3,0      ; |104| 

$C$RL17:   ; CALL OCCURS {_NOTIFY_register} {0}  ; |104| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MV      .L1     A4,A0             ; |104| 
||         MV      .S1     A4,A11            ; |104| 

   [ A0]   BNOP    .S2     $C$L28,4          ; |104| 
|| [!A0]   MVKL    .S1     _NOTIFY_notify,A3 ; |121| 
|| [!A0]   MVK     .L1     0x1,A4            ; |121| 
|| [!A0]   ZERO    .L2     B6                ; |121| 
|| [!A0]   ZERO    .D2     B4                ; |121| 
|| [!A0]   MVK     .D1     0x5,A6            ; |121| 

   [!A0]   MVKH    .S1     _NOTIFY_notify,A3 ; |121| 
           ; BRANCHCC OCCURS {$C$L28}        ; |104| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
   [ A0]   BNOP    .S1     $C$L29,4          ; |119| 
;** --------------------------------------------------------------------------*
$C$L27:    
;          EXCLUSIVE CPU CYCLES: 1
$C$DW$156	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$156, DW_AT_low_pc(0x00)
	.dwattr $C$DW$156, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$156, DW_AT_TI_call
   [!A0]   CALL    .S2X    A3                ; |121| 
           ; BRANCHCC OCCURS {$C$L29}        ; |119| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           ADDKPC  .S2     $C$RL18,B3,4      ; |121| 
$C$RL18:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |121| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     _SEM_pend,A3      ; |132| 
||         MV      .L1     A4,A0             ; |121| 

   [!A0]   BNOP    .S2     $C$L30,1          ; |121| 
||         MVKH    .S1     _SEM_pend,A3      ; |132| 

$C$DW$157	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$157, DW_AT_low_pc(0x00)
	.dwattr $C$DW$157, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$157, DW_AT_TI_call
   [!A0]   CALL    .S2X    A3                ; |132| 
           MV      .L1     A4,A11            ; |121| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L30}        ; |121| 
;** --------------------------------------------------------------------------*
$C$L28:    
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T1   *++SP(8),A10      ; |137| 
||         MV      .L2     B11,B3            ; |137| 

$C$DW$158	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$158, DW_AT_low_pc(0x04)
	.dwattr $C$DW$158, DW_AT_TI_return

           LDDW    .D2T2   *++SP,B11:B10     ; |137| 
||         RET     .S2     B3                ; |137| 

           LDW     .D2T1   *++SP(8),A11      ; |137| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |137| 
;** --------------------------------------------------------------------------*
$C$L29:    
;          EXCLUSIVE CPU CYCLES: 7
           MVKL    .S1     _SEM_pend,A3      ; |132| 
           MVKH    .S1     _SEM_pend,A3      ; |132| 
           NOP             1
$C$DW$159	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$159, DW_AT_low_pc(0x00)
	.dwattr $C$DW$159, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$159, DW_AT_TI_call
           CALL    .S2X    A3                ; |132| 
           NOP             3
;** --------------------------------------------------------------------------*
$C$L30:    
;          EXCLUSIVE CPU CYCLES: 2
           ADD     .L1     4,A10,A4          ; |132| 

           ADD     .L1     4,A10,A10         ; |132| 
||         MVK     .L2     0xffffffff,B4     ; |132| 
||         ADDKPC  .S2     $C$RL19,B3,0      ; |132| 

$C$RL19:   ; CALL OCCURS {_SEM_pend} {0}     ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _SEM_pend,B5      ; |134| 
           MVKH    .S2     _SEM_pend,B5      ; |134| 
$C$DW$160	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$160, DW_AT_low_pc(0x00)
	.dwattr $C$DW$160, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$160, DW_AT_TI_call
           CALL    .S2     B5                ; |134| 
           ADDKPC  .S2     $C$RL20,B3,3      ; |134| 

           MV      .L1     A10,A4            ; |134| 
||         MVK     .L2     0xffffffff,B4     ; |134| 

$C$RL20:   ; CALL OCCURS {_SEM_pend} {0}     ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T1   *++SP(8),A10      ; |137| 
||         MV      .L2     B11,B3            ; |137| 

$C$DW$161	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$161, DW_AT_low_pc(0x04)
	.dwattr $C$DW$161, DW_AT_TI_return

           LDDW    .D2T2   *++SP,B11:B10     ; |137| 
||         RET     .S2     B3                ; |137| 

           MV      .L1     A11,A4            ; |134| 
||         LDW     .D2T1   *++SP(8),A11      ; |137| 

	.dwpsn	file "task.c",line 137,column 3,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |137| 
	.dwattr $C$DW$152, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$152, DW_AT_TI_end_line(0x89)
	.dwattr $C$DW$152, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$152

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_MEM_free
	.global	_MEM_valloc
	.global	_SEM_pend
	.global	_SEM_post
	.global	__SEM_dopost
	.global	_NOTIFY_register
	.global	_NOTIFY_unregister
	.global	_NOTIFY_notify
	.global	_BCACHE_inv
	.global	_BCACHE_wb
	.global	_DDR2
	.global	_MPCSXFER_BufferSize
	.global	__divi

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************
$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_address_class(0x20)
$C$DW$T$41	.dwtag  DW_TAG_typedef, DW_AT_name("Ptr")
	.dwattr $C$DW$T$41, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$T$41, DW_AT_language(DW_LANG_C)

$C$DW$T$25	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$25, DW_AT_language(DW_LANG_C)
$C$DW$162	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$24)
	.dwendtag $C$DW$T$25

$C$DW$T$26	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$26, DW_AT_address_class(0x20)
$C$DW$T$27	.dwtag  DW_TAG_typedef, DW_AT_name("KNL_Fxn")
	.dwattr $C$DW$T$27, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$27, DW_AT_language(DW_LANG_C)

$C$DW$T$56	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$56, DW_AT_language(DW_LANG_C)
$C$DW$163	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$37)
$C$DW$164	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$41)
$C$DW$165	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$41)
	.dwendtag $C$DW$T$56

$C$DW$T$57	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$57, DW_AT_address_class(0x20)
$C$DW$T$58	.dwtag  DW_TAG_typedef, DW_AT_name("FnNotifyCbck")
	.dwattr $C$DW$T$58, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$T$58, DW_AT_language(DW_LANG_C)
$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)
$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)
$C$DW$T$64	.dwtag  DW_TAG_typedef, DW_AT_name("Uint8")
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$64, DW_AT_language(DW_LANG_C)
$C$DW$T$65	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$65, DW_AT_type(*$C$DW$T$64)
	.dwattr $C$DW$T$65, DW_AT_address_class(0x20)
$C$DW$T$66	.dwtag  DW_TAG_TI_restrict_type
	.dwattr $C$DW$T$66, DW_AT_type(*$C$DW$T$65)
$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x02)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$39	.dwtag  DW_TAG_typedef, DW_AT_name("Int16")
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$39, DW_AT_language(DW_LANG_C)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$34	.dwtag  DW_TAG_typedef, DW_AT_name("Uint16")
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
$C$DW$T$35	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$T$35, DW_AT_address_class(0x20)
$C$DW$T$59	.dwtag  DW_TAG_typedef, DW_AT_name("Bool")
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$59, DW_AT_language(DW_LANG_C)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$22	.dwtag  DW_TAG_typedef, DW_AT_name("Int")
	.dwattr $C$DW$T$22, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)
$C$DW$T$67	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$67, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$67, DW_AT_address_class(0x20)
$C$DW$T$68	.dwtag  DW_TAG_TI_restrict_type
	.dwattr $C$DW$T$68, DW_AT_type(*$C$DW$T$67)

$C$DW$T$94	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$94, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$94, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$94, DW_AT_byte_size(0x40)
$C$DW$166	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$166, DW_AT_upper_bound(0x0f)
	.dwendtag $C$DW$T$94


$C$DW$T$95	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$95, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$95, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$95, DW_AT_byte_size(0xc0)
$C$DW$167	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$167, DW_AT_upper_bound(0x2f)
	.dwendtag $C$DW$T$95


$C$DW$T$96	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$96, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$96, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$96, DW_AT_byte_size(0x158)
$C$DW$168	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$168, DW_AT_upper_bound(0x55)
	.dwendtag $C$DW$T$96


$C$DW$T$97	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$97, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$97, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$97, DW_AT_byte_size(0x4df0)
$C$DW$169	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$169, DW_AT_upper_bound(0x39)
$C$DW$170	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$170, DW_AT_upper_bound(0x55)
	.dwendtag $C$DW$T$97

$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$37	.dwtag  DW_TAG_typedef, DW_AT_name("Uint32")
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
$C$DW$T$42	.dwtag  DW_TAG_typedef, DW_AT_name("size_t")
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$42, DW_AT_language(DW_LANG_C)
$C$DW$T$79	.dwtag  DW_TAG_typedef, DW_AT_name("Uns")
	.dwattr $C$DW$T$79, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$79, DW_AT_language(DW_LANG_C)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$12, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$12, DW_AT_bit_offset(0x18)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$13, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$13, DW_AT_bit_offset(0x18)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)
$C$DW$T$109	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$109, DW_AT_type(*$C$DW$T$16)
	.dwattr $C$DW$T$109, DW_AT_address_class(0x20)
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)

$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_name("QUE_Elem")
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x08)
$C$DW$171	.dwtag  DW_TAG_member
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$171, DW_AT_name("next")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("_next")
	.dwattr $C$DW$171, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$171, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$172	.dwtag  DW_TAG_member
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$172, DW_AT_name("prev")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("_prev")
	.dwattr $C$DW$172, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$172, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$20

$C$DW$T$19	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$19, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$19, DW_AT_address_class(0x20)
$C$DW$T$21	.dwtag  DW_TAG_typedef, DW_AT_name("QUE_Obj")
	.dwattr $C$DW$T$21, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$21, DW_AT_language(DW_LANG_C)

$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_name("KNL_Job")
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x10)
$C$DW$173	.dwtag  DW_TAG_member
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$173, DW_AT_name("wListElem")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("_wListElem")
	.dwattr $C$DW$173, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$173, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$174	.dwtag  DW_TAG_member
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$174, DW_AT_name("wCount")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("_wCount")
	.dwattr $C$DW$174, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$174, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$175	.dwtag  DW_TAG_member
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$175, DW_AT_name("fxn")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("_fxn")
	.dwattr $C$DW$175, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$175, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$28

$C$DW$T$23	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$T$23, DW_AT_address_class(0x20)
$C$DW$T$24	.dwtag  DW_TAG_typedef, DW_AT_name("KNL_JobHandle")
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
$C$DW$T$29	.dwtag  DW_TAG_typedef, DW_AT_name("KNL_Job")
	.dwattr $C$DW$T$29, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$T$29, DW_AT_language(DW_LANG_C)
$C$DW$T$30	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$30, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$30, DW_AT_name("signed char")
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x01)
$C$DW$T$31	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$31, DW_AT_address_class(0x20)
$C$DW$T$32	.dwtag  DW_TAG_typedef, DW_AT_name("String")
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
$C$DW$T$43	.dwtag  DW_TAG_typedef, DW_AT_name("Char")
	.dwattr $C$DW$T$43, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$43, DW_AT_language(DW_LANG_C)
$C$DW$T$112	.dwtag  DW_TAG_typedef, DW_AT_name("Int8")
	.dwattr $C$DW$T$112, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$112, DW_AT_language(DW_LANG_C)

$C$DW$T$33	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$33, DW_AT_name("SEM_Obj")
	.dwattr $C$DW$T$33, DW_AT_byte_size(0x20)
$C$DW$176	.dwtag  DW_TAG_member
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$176, DW_AT_name("job")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("_job")
	.dwattr $C$DW$176, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$176, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$177	.dwtag  DW_TAG_member
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$177, DW_AT_name("count")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("_count")
	.dwattr $C$DW$177, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$177, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$178	.dwtag  DW_TAG_member
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$178, DW_AT_name("pendQ")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("_pendQ")
	.dwattr $C$DW$178, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$178, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$179	.dwtag  DW_TAG_member
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$179, DW_AT_name("name")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("_name")
	.dwattr $C$DW$179, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$179, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$33

$C$DW$T$36	.dwtag  DW_TAG_typedef, DW_AT_name("SEM_Obj")
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$36, DW_AT_language(DW_LANG_C)
$C$DW$T$51	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$51, DW_AT_address_class(0x20)
$C$DW$T$52	.dwtag  DW_TAG_typedef, DW_AT_name("SEM_Handle")
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$T$52, DW_AT_language(DW_LANG_C)

$C$DW$T$38	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$38, DW_AT_name("Task_TransferInfo_tag")
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x28)
$C$DW$180	.dwtag  DW_TAG_member
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$180, DW_AT_name("dataBuf")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("_dataBuf")
	.dwattr $C$DW$180, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$180, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$181	.dwtag  DW_TAG_member
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$181, DW_AT_name("notifySemObj")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("_notifySemObj")
	.dwattr $C$DW$181, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$181, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$182	.dwtag  DW_TAG_member
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$182, DW_AT_name("bufferSize")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("_bufferSize")
	.dwattr $C$DW$182, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$182, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$38

$C$DW$T$88	.dwtag  DW_TAG_typedef, DW_AT_name("Task_TransferInfo")
	.dwattr $C$DW$T$88, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$88, DW_AT_language(DW_LANG_C)
$C$DW$T$89	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$89, DW_AT_type(*$C$DW$T$88)
	.dwattr $C$DW$T$89, DW_AT_address_class(0x20)
$C$DW$T$90	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$90, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$T$90, DW_AT_address_class(0x20)

$C$DW$T$40	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$40, DW_AT_name("Rect_tag")
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x08)
$C$DW$183	.dwtag  DW_TAG_member
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$183, DW_AT_name("x")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("_x")
	.dwattr $C$DW$183, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$183, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$184	.dwtag  DW_TAG_member
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$184, DW_AT_name("y")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("_y")
	.dwattr $C$DW$184, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$184, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$185	.dwtag  DW_TAG_member
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$185, DW_AT_name("width")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("_width")
	.dwattr $C$DW$185, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$185, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$186	.dwtag  DW_TAG_member
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$186, DW_AT_name("height")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("_height")
	.dwattr $C$DW$186, DW_AT_data_member_location[DW_OP_plus_uconst 0x6]
	.dwattr $C$DW$186, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$40

$C$DW$T$119	.dwtag  DW_TAG_typedef, DW_AT_name("Rect")
	.dwattr $C$DW$T$119, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$T$119, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$187	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A0")
	.dwattr $C$DW$187, DW_AT_location[DW_OP_reg0]
$C$DW$188	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A1")
	.dwattr $C$DW$188, DW_AT_location[DW_OP_reg1]
$C$DW$189	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A2")
	.dwattr $C$DW$189, DW_AT_location[DW_OP_reg2]
$C$DW$190	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A3")
	.dwattr $C$DW$190, DW_AT_location[DW_OP_reg3]
$C$DW$191	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A4")
	.dwattr $C$DW$191, DW_AT_location[DW_OP_reg4]
$C$DW$192	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A5")
	.dwattr $C$DW$192, DW_AT_location[DW_OP_reg5]
$C$DW$193	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A6")
	.dwattr $C$DW$193, DW_AT_location[DW_OP_reg6]
$C$DW$194	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A7")
	.dwattr $C$DW$194, DW_AT_location[DW_OP_reg7]
$C$DW$195	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A8")
	.dwattr $C$DW$195, DW_AT_location[DW_OP_reg8]
$C$DW$196	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A9")
	.dwattr $C$DW$196, DW_AT_location[DW_OP_reg9]
$C$DW$197	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A10")
	.dwattr $C$DW$197, DW_AT_location[DW_OP_reg10]
$C$DW$198	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A11")
	.dwattr $C$DW$198, DW_AT_location[DW_OP_reg11]
$C$DW$199	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A12")
	.dwattr $C$DW$199, DW_AT_location[DW_OP_reg12]
$C$DW$200	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A13")
	.dwattr $C$DW$200, DW_AT_location[DW_OP_reg13]
$C$DW$201	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A14")
	.dwattr $C$DW$201, DW_AT_location[DW_OP_reg14]
$C$DW$202	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A15")
	.dwattr $C$DW$202, DW_AT_location[DW_OP_reg15]
$C$DW$203	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B0")
	.dwattr $C$DW$203, DW_AT_location[DW_OP_reg16]
$C$DW$204	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B1")
	.dwattr $C$DW$204, DW_AT_location[DW_OP_reg17]
$C$DW$205	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B2")
	.dwattr $C$DW$205, DW_AT_location[DW_OP_reg18]
$C$DW$206	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B3")
	.dwattr $C$DW$206, DW_AT_location[DW_OP_reg19]
$C$DW$207	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B4")
	.dwattr $C$DW$207, DW_AT_location[DW_OP_reg20]
$C$DW$208	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B5")
	.dwattr $C$DW$208, DW_AT_location[DW_OP_reg21]
$C$DW$209	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B6")
	.dwattr $C$DW$209, DW_AT_location[DW_OP_reg22]
$C$DW$210	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B7")
	.dwattr $C$DW$210, DW_AT_location[DW_OP_reg23]
$C$DW$211	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B8")
	.dwattr $C$DW$211, DW_AT_location[DW_OP_reg24]
$C$DW$212	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B9")
	.dwattr $C$DW$212, DW_AT_location[DW_OP_reg25]
$C$DW$213	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B10")
	.dwattr $C$DW$213, DW_AT_location[DW_OP_reg26]
$C$DW$214	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B11")
	.dwattr $C$DW$214, DW_AT_location[DW_OP_reg27]
$C$DW$215	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B12")
	.dwattr $C$DW$215, DW_AT_location[DW_OP_reg28]
$C$DW$216	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B13")
	.dwattr $C$DW$216, DW_AT_location[DW_OP_reg29]
$C$DW$217	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DP")
	.dwattr $C$DW$217, DW_AT_location[DW_OP_reg30]
$C$DW$218	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SP")
	.dwattr $C$DW$218, DW_AT_location[DW_OP_reg31]
$C$DW$219	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FP")
	.dwattr $C$DW$219, DW_AT_location[DW_OP_regx 0x20]
$C$DW$220	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC")
	.dwattr $C$DW$220, DW_AT_location[DW_OP_regx 0x21]
$C$DW$221	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IRP")
	.dwattr $C$DW$221, DW_AT_location[DW_OP_regx 0x22]
$C$DW$222	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IFR")
	.dwattr $C$DW$222, DW_AT_location[DW_OP_regx 0x23]
$C$DW$223	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NRP")
	.dwattr $C$DW$223, DW_AT_location[DW_OP_regx 0x24]
$C$DW$224	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A16")
	.dwattr $C$DW$224, DW_AT_location[DW_OP_regx 0x25]
$C$DW$225	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A17")
	.dwattr $C$DW$225, DW_AT_location[DW_OP_regx 0x26]
$C$DW$226	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A18")
	.dwattr $C$DW$226, DW_AT_location[DW_OP_regx 0x27]
$C$DW$227	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A19")
	.dwattr $C$DW$227, DW_AT_location[DW_OP_regx 0x28]
$C$DW$228	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A20")
	.dwattr $C$DW$228, DW_AT_location[DW_OP_regx 0x29]
$C$DW$229	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A21")
	.dwattr $C$DW$229, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$230	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A22")
	.dwattr $C$DW$230, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$231	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A23")
	.dwattr $C$DW$231, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$232	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A24")
	.dwattr $C$DW$232, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$233	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A25")
	.dwattr $C$DW$233, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$234	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A26")
	.dwattr $C$DW$234, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$235	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A27")
	.dwattr $C$DW$235, DW_AT_location[DW_OP_regx 0x30]
$C$DW$236	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A28")
	.dwattr $C$DW$236, DW_AT_location[DW_OP_regx 0x31]
$C$DW$237	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A29")
	.dwattr $C$DW$237, DW_AT_location[DW_OP_regx 0x32]
$C$DW$238	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A30")
	.dwattr $C$DW$238, DW_AT_location[DW_OP_regx 0x33]
$C$DW$239	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A31")
	.dwattr $C$DW$239, DW_AT_location[DW_OP_regx 0x34]
$C$DW$240	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B16")
	.dwattr $C$DW$240, DW_AT_location[DW_OP_regx 0x35]
$C$DW$241	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B17")
	.dwattr $C$DW$241, DW_AT_location[DW_OP_regx 0x36]
$C$DW$242	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B18")
	.dwattr $C$DW$242, DW_AT_location[DW_OP_regx 0x37]
$C$DW$243	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B19")
	.dwattr $C$DW$243, DW_AT_location[DW_OP_regx 0x38]
$C$DW$244	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B20")
	.dwattr $C$DW$244, DW_AT_location[DW_OP_regx 0x39]
$C$DW$245	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B21")
	.dwattr $C$DW$245, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$246	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B22")
	.dwattr $C$DW$246, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$247	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B23")
	.dwattr $C$DW$247, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$248	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B24")
	.dwattr $C$DW$248, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$249	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B25")
	.dwattr $C$DW$249, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$250	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B26")
	.dwattr $C$DW$250, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$251	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B27")
	.dwattr $C$DW$251, DW_AT_location[DW_OP_regx 0x40]
$C$DW$252	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B28")
	.dwattr $C$DW$252, DW_AT_location[DW_OP_regx 0x41]
$C$DW$253	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B29")
	.dwattr $C$DW$253, DW_AT_location[DW_OP_regx 0x42]
$C$DW$254	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B30")
	.dwattr $C$DW$254, DW_AT_location[DW_OP_regx 0x43]
$C$DW$255	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B31")
	.dwattr $C$DW$255, DW_AT_location[DW_OP_regx 0x44]
$C$DW$256	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("AMR")
	.dwattr $C$DW$256, DW_AT_location[DW_OP_regx 0x45]
$C$DW$257	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CSR")
	.dwattr $C$DW$257, DW_AT_location[DW_OP_regx 0x46]
$C$DW$258	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISR")
	.dwattr $C$DW$258, DW_AT_location[DW_OP_regx 0x47]
$C$DW$259	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ICR")
	.dwattr $C$DW$259, DW_AT_location[DW_OP_regx 0x48]
$C$DW$260	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IER")
	.dwattr $C$DW$260, DW_AT_location[DW_OP_regx 0x49]
$C$DW$261	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISTP")
	.dwattr $C$DW$261, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$262	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IN")
	.dwattr $C$DW$262, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$263	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OUT")
	.dwattr $C$DW$263, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$264	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ACR")
	.dwattr $C$DW$264, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$265	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ADR")
	.dwattr $C$DW$265, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$266	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FADCR")
	.dwattr $C$DW$266, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$267	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FAUCR")
	.dwattr $C$DW$267, DW_AT_location[DW_OP_regx 0x50]
$C$DW$268	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FMCR")
	.dwattr $C$DW$268, DW_AT_location[DW_OP_regx 0x51]
$C$DW$269	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GFPGFR")
	.dwattr $C$DW$269, DW_AT_location[DW_OP_regx 0x52]
$C$DW$270	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DIER")
	.dwattr $C$DW$270, DW_AT_location[DW_OP_regx 0x53]
$C$DW$271	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("REP")
	.dwattr $C$DW$271, DW_AT_location[DW_OP_regx 0x54]
$C$DW$272	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCL")
	.dwattr $C$DW$272, DW_AT_location[DW_OP_regx 0x55]
$C$DW$273	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCH")
	.dwattr $C$DW$273, DW_AT_location[DW_OP_regx 0x56]
$C$DW$274	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ARP")
	.dwattr $C$DW$274, DW_AT_location[DW_OP_regx 0x57]
$C$DW$275	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ILC")
	.dwattr $C$DW$275, DW_AT_location[DW_OP_regx 0x58]
$C$DW$276	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RILC")
	.dwattr $C$DW$276, DW_AT_location[DW_OP_regx 0x59]
$C$DW$277	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DNUM")
	.dwattr $C$DW$277, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$278	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SSR")
	.dwattr $C$DW$278, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$279	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYA")
	.dwattr $C$DW$279, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$280	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYB")
	.dwattr $C$DW$280, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$281	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSR")
	.dwattr $C$DW$281, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$282	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ITSR")
	.dwattr $C$DW$282, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$283	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NTSR")
	.dwattr $C$DW$283, DW_AT_location[DW_OP_regx 0x60]
$C$DW$284	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("EFR")
	.dwattr $C$DW$284, DW_AT_location[DW_OP_regx 0x61]
$C$DW$285	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ECR")
	.dwattr $C$DW$285, DW_AT_location[DW_OP_regx 0x62]
$C$DW$286	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IERR")
	.dwattr $C$DW$286, DW_AT_location[DW_OP_regx 0x63]
$C$DW$287	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DMSG")
	.dwattr $C$DW$287, DW_AT_location[DW_OP_regx 0x64]
$C$DW$288	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CMSG")
	.dwattr $C$DW$288, DW_AT_location[DW_OP_regx 0x65]
$C$DW$289	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_ADDR")
	.dwattr $C$DW$289, DW_AT_location[DW_OP_regx 0x66]
$C$DW$290	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_DATA")
	.dwattr $C$DW$290, DW_AT_location[DW_OP_regx 0x67]
$C$DW$291	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_CNTL")
	.dwattr $C$DW$291, DW_AT_location[DW_OP_regx 0x68]
$C$DW$292	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCU_CNTL")
	.dwattr $C$DW$292, DW_AT_location[DW_OP_regx 0x69]
$C$DW$293	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_REC_CNTL")
	.dwattr $C$DW$293, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$294	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_XMT_CNTL")
	.dwattr $C$DW$294, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$295	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_CFG")
	.dwattr $C$DW$295, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$296	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RDATA")
	.dwattr $C$DW$296, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$297	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WDATA")
	.dwattr $C$DW$297, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$298	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RADDR")
	.dwattr $C$DW$298, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$299	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WADDR")
	.dwattr $C$DW$299, DW_AT_location[DW_OP_regx 0x70]
$C$DW$300	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("MFREG0")
	.dwattr $C$DW$300, DW_AT_location[DW_OP_regx 0x71]
$C$DW$301	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DBG_STAT")
	.dwattr $C$DW$301, DW_AT_location[DW_OP_regx 0x72]
$C$DW$302	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("BRK_EN")
	.dwattr $C$DW$302, DW_AT_location[DW_OP_regx 0x73]
$C$DW$303	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0_CNT")
	.dwattr $C$DW$303, DW_AT_location[DW_OP_regx 0x74]
$C$DW$304	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0")
	.dwattr $C$DW$304, DW_AT_location[DW_OP_regx 0x75]
$C$DW$305	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP1")
	.dwattr $C$DW$305, DW_AT_location[DW_OP_regx 0x76]
$C$DW$306	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP2")
	.dwattr $C$DW$306, DW_AT_location[DW_OP_regx 0x77]
$C$DW$307	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP3")
	.dwattr $C$DW$307, DW_AT_location[DW_OP_regx 0x78]
$C$DW$308	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OVERLAY")
	.dwattr $C$DW$308, DW_AT_location[DW_OP_regx 0x79]
$C$DW$309	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC_PROF")
	.dwattr $C$DW$309, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$310	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ATSR")
	.dwattr $C$DW$310, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$311	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TRR")
	.dwattr $C$DW$311, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$312	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCRR")
	.dwattr $C$DW$312, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$313	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DESR")
	.dwattr $C$DW$313, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$314	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DETR")
	.dwattr $C$DW$314, DW_AT_location[DW_OP_regx 0x7f]
$C$DW$315	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$315, DW_AT_location[DW_OP_regx 0xe4]
	.dwendtag $C$DW$CU

