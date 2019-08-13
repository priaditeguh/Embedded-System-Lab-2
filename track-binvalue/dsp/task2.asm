;******************************************************************************
;* TMS320C6x C/C++ Codegen                                       Unix v6.1.17 *
;* Date/Time created: Sat Jun 10 11:05:06 2017                                *
;******************************************************************************
	.compiler_opts --c64p_l1d_workaround=default --disable:=sploop --endian=little --hll_source=on --mem_model:code=near --mem_model:const=data --mem_model:data=far_aggregates --quiet --silicon_version=6500 --symdebug:skeletal 

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C64x+                                          *
;*   Optimization      : Enabled at level 3                                   *
;*   Optimizing for    : Speed                                                *
;*                       Based on options: -o3, no -ms                        *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Data Access Model : Far Aggregate Data                                   *
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
	.dwattr $C$DW$CU, DW_AT_comp_dir("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp")
;*****************************************************************************
;* CINIT RECORDS                                                             *
;*****************************************************************************
	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_size_pdf+0,32
	.field  	48,32			; _size_pdf @ 0

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
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$61)
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
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$10, DW_AT_declaration
	.dwattr $C$DW$10, DW_AT_external
$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$54)
$C$DW$12	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$73)
	.dwendtag $C$DW$10


$C$DW$13	.dwtag  DW_TAG_subprogram, DW_AT_name("SEM_post")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("_SEM_post")
	.dwattr $C$DW$13, DW_AT_declaration
	.dwattr $C$DW$13, DW_AT_external
$C$DW$14	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$54)
	.dwendtag $C$DW$13


$C$DW$15	.dwtag  DW_TAG_subprogram, DW_AT_name("_SEM_dopost")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("__SEM_dopost")
	.dwattr $C$DW$15, DW_AT_declaration
	.dwattr $C$DW$15, DW_AT_external
$C$DW$16	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$54)
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
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$60)
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
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$60)
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
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$61)
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
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$61)
	.dwendtag $C$DW$38


$C$DW$42	.dwtag  DW_TAG_subprogram, DW_AT_name("malloc")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("_malloc")
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$42, DW_AT_declaration
	.dwattr $C$DW$42, DW_AT_external
$C$DW$43	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$42)
	.dwendtag $C$DW$42

$C$DW$44	.dwtag  DW_TAG_variable, DW_AT_name("DDR2")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("_DDR2")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$44, DW_AT_declaration
	.dwattr $C$DW$44, DW_AT_external
$C$DW$45	.dwtag  DW_TAG_variable, DW_AT_name("MPCSXFER_BufferSize")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("_MPCSXFER_BufferSize")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$45, DW_AT_declaration
	.dwattr $C$DW$45, DW_AT_external
	.global	_buf
	.bss	_buf,4,4
$C$DW$46	.dwtag  DW_TAG_variable, DW_AT_name("buf")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("_buf")
	.dwattr $C$DW$46, DW_AT_location[DW_OP_addr _buf]
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$46, DW_AT_external
	.global	_kernelCols
	.bss	_kernelCols,1,1
$C$DW$47	.dwtag  DW_TAG_variable, DW_AT_name("kernelCols")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("_kernelCols")
	.dwattr $C$DW$47, DW_AT_location[DW_OP_addr _kernelCols]
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$47, DW_AT_external
	.global	_kernelRows
	.bss	_kernelRows,1,1
$C$DW$48	.dwtag  DW_TAG_variable, DW_AT_name("kernelRows")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("_kernelRows")
	.dwattr $C$DW$48, DW_AT_location[DW_OP_addr _kernelRows]
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$48, DW_AT_external
	.global	_lengthToCount
	.bss	_lengthToCount,1,1
$C$DW$49	.dwtag  DW_TAG_variable, DW_AT_name("lengthToCount")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("_lengthToCount")
	.dwattr $C$DW$49, DW_AT_location[DW_OP_addr _lengthToCount]
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$49, DW_AT_external
	.global	_sizeToCount
	.bss	_sizeToCount,4,4
$C$DW$50	.dwtag  DW_TAG_variable, DW_AT_name("sizeToCount")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("_sizeToCount")
	.dwattr $C$DW$50, DW_AT_location[DW_OP_addr _sizeToCount]
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$50, DW_AT_external
	.global	_pdf_model_full
	.bss	_pdf_model_full,4,4
$C$DW$51	.dwtag  DW_TAG_variable, DW_AT_name("pdf_model_full")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("_pdf_model_full")
	.dwattr $C$DW$51, DW_AT_location[DW_OP_addr _pdf_model_full]
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$97)
	.dwattr $C$DW$51, DW_AT_external
	.global	_size_pdf
	.bss	_size_pdf,4,4
$C$DW$52	.dwtag  DW_TAG_variable, DW_AT_name("size_pdf")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("_size_pdf")
	.dwattr $C$DW$52, DW_AT_location[DW_OP_addr _size_pdf]
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$52, DW_AT_external
	.global	_kernel
	.bss	_kernel,4,4
$C$DW$53	.dwtag  DW_TAG_variable, DW_AT_name("kernel")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("_kernel")
	.dwattr $C$DW$53, DW_AT_location[DW_OP_addr _kernel]
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$97)
	.dwattr $C$DW$53, DW_AT_external
	.global	_kernel_size
	.bss	_kernel_size,4,4
$C$DW$54	.dwtag  DW_TAG_variable, DW_AT_name("kernel_size")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("_kernel_size")
	.dwattr $C$DW$54, DW_AT_location[DW_OP_addr _kernel_size]
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$54, DW_AT_external
	.global	_target_Region
_target_Region:	.usect	".far",8,2
$C$DW$55	.dwtag  DW_TAG_variable, DW_AT_name("target_Region")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("_target_Region")
	.dwattr $C$DW$55, DW_AT_location[DW_OP_addr _target_Region]
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$105)
	.dwattr $C$DW$55, DW_AT_external
	.global	_bufferBytesPerData
	.bss	_bufferBytesPerData,4,4
$C$DW$56	.dwtag  DW_TAG_variable, DW_AT_name("bufferBytesPerData")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("_bufferBytesPerData")
	.dwattr $C$DW$56, DW_AT_location[DW_OP_addr _bufferBytesPerData]
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$56, DW_AT_external
	.global	_bufferSize
	.bss	_bufferSize,4,4
$C$DW$57	.dwtag  DW_TAG_variable, DW_AT_name("bufferSize")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("_bufferSize")
	.dwattr $C$DW$57, DW_AT_location[DW_OP_addr _bufferSize]
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$57, DW_AT_external
	.global	_runningCode
	.bss	_runningCode,4,4
$C$DW$58	.dwtag  DW_TAG_variable, DW_AT_name("runningCode")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("_runningCode")
	.dwattr $C$DW$58, DW_AT_location[DW_OP_addr _runningCode]
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$58, DW_AT_external
	.bss	_count$1,4,4
;	/data/bbToolChain/usr/local/share/c6000/bin/opt6x /tmp/22329LRdIxL /tmp/22329HmCDiY 
	.sect	".text"
	.clink
	.global	_pdf_representation_part_opt

$C$DW$59	.dwtag  DW_TAG_subprogram, DW_AT_name("pdf_representation_part_opt")
	.dwattr $C$DW$59, DW_AT_low_pc(_pdf_representation_part_opt)
	.dwattr $C$DW$59, DW_AT_high_pc(0x00)
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("_pdf_representation_part_opt")
	.dwattr $C$DW$59, DW_AT_external
	.dwattr $C$DW$59, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$59, DW_AT_TI_begin_line(0xe5)
	.dwattr $C$DW$59, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$59, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$59, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 230,column 1,is_stmt,address _pdf_representation_part_opt

;******************************************************************************
;* FUNCTION NAME: pdf_representation_part_opt                                 *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,A5,A6,A7,B0,B4,B5,B6,B7,B8,B9,B16,B17       *
;*   Regs Used         : A0,A3,A4,A5,A6,A7,B0,B3,B4,B5,B6,B7,B8,B9,DP,B16,B17 *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_pdf_representation_part_opt:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+DP(_size_pdf),B6 ; |235| 
           MVK     .L1     0x1,A3
           LDW     .D2T2   *+DP(_pdf_model_full),B4
           NOP             2
           CMPGT   .L2     B6,0,B0           ; |235| 

   [!B0]   BNOP    .S1     $C$L4,5           ; |235| 
|| [ B0]   SUB     .L1X    B6,1,A0

           ; BRANCHCC OCCURS {$C$L4}         ; |235| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 235
;*      Loop opening brace source line   : 236
;*      Loop closing brace source line   : 238
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
;*        $C$C57:
;*   0      [ A0]   BDEC    .S1     $C$C57,A0         ; |235| 
;*   1              NOP             4
;*   5              STW     .D2T2   B5,*B4++          ; |235| 
;*   6              ; BRANCHCC OCCURS {$C$C57}        ; |235| 
;*----------------------------------------------------------------------------*
$C$L1:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 5
   [ A0]   BDEC    .S1     $C$L2,A0          ; |235| (P) <0,0> 
   [ A0]   BDEC    .S1     $C$L2,A0          ; |235| (P) <1,0> 
   [ A0]   BDEC    .S1     $C$L2,A0          ; |235| (P) <2,0> 
   [ A0]   BDEC    .S1     $C$L2,A0          ; |235| (P) <3,0> 
	.dwpsn	file "task.c",line 235,column 0,is_stmt

           MV      .L2X    A3,B5
|| [ A0]   BDEC    .S1     $C$L2,A0          ; |235| (P) <4,0> 

;** --------------------------------------------------------------------------*
$C$L2:    ; PIPED LOOP KERNEL
$C$DW$L$_pdf_representation_part_opt$3$B:
	.dwpsn	file "task.c",line 236,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 1
	.dwpsn	file "task.c",line 238,column 0,is_stmt

           STW     .D2T2   B5,*B4++          ; |235| <0,5> 
|| [ A0]   BDEC    .S1     $C$L2,A0          ; |235| <5,0> 

$C$DW$L$_pdf_representation_part_opt$3$E:
;** --------------------------------------------------------------------------*
$C$L3:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+DP(_kernel_size),B6 ; |240| 
           LDW     .D2T2   *+DP(_buf),B5
           ZERO    .L1     A5                ; |240| 
           LDW     .D2T2   *+DP(_pdf_model_full),B9
           LDW     .D2T2   *+DP(_kernel),B4
           CMPGT   .L2     B6,0,B0           ; |240| 

   [!B0]   BNOP    .S1     $C$L8,4           ; |240| 
||         SUB     .L2     B5,3,B17

           ADDAD   .D2     B9,16,B16
           ; BRANCHCC OCCURS {$C$L8}         ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MV      .L1X    B9,A6
||         MV      .L2X    A5,B5
||         DINT                              ; interrupts off

           ADD     .L1X    5,B17,A4
           MV      .L1X    B16,A3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 240
;*      Loop opening brace source line   : 241
;*      Loop closing brace source line   : 248
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 38
;*      Unpartitioned Resource Bound     : 7
;*      Partitioned Resource Bound(*)    : 7
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        1     
;*      .S units                     0        1     
;*      .D units                     7*       6     
;*      .M units                     0        0     
;*      .X cross paths               2        1     
;*      .T address paths             6        5     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          2        9     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             0        1     
;*      Bound(.L .S .D .LS .LSD)     3        6     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 38 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |   ** *                         |    **   *    * **              |
;*       1: |   ** *                         |    **   *    * **              |
;*       2: |   ** *                         |    **   *    * **              |
;*       3: |   ** *                         |    **   *    * **              |
;*       4: |   ** *                         |    **   *    * **              |
;*       5: |   ** *                         |    **  **    * **              |
;*       6: |   ** *                         |    **  **    * **              |
;*       7: |   ** *                         |    **  **    * **              |
;*       8: |   ** *                         |    **  **    * **              |
;*       9: |   ** *                         |    *** **    * **              |
;*      10: |   ** *                         |    ******    * **              |
;*      11: |   ** *                         |    ******    * **              |
;*      12: |   ** *                         |    ***  *    * **              |
;*      13: |   ** *                         |    ***  *    * **              |
;*      14: |   ** *                         |    ***  *    * **              |
;*      15: |   ** *                         |    ***  *    * **              |
;*      16: |   ** *                         |    ***  *    * **              |
;*      17: |   ****                         |    ***  *    * **              |
;*      18: |   ****                         |    ***  *    * **              |
;*      19: |   ** **                        |    ***  *    * **              |
;*      20: |   ** **                        |    ***  *    * **              |
;*      21: |   ** **                        |    ***  *    * **              |
;*      22: |   ** **                        |    ***  *    * **              |
;*      23: |   ** **                        |    ***  *    * **              |
;*      24: |   *****                        |    ***  *    * **              |
;*      25: |   *****                        |    ***  *    * **              |
;*      26: |   ** *                         |    ***  *    * **              |
;*      27: |   ** *                         |    ***  *    * **              |
;*      28: |   ** *                         |    ***  *    * **              |
;*      29: |   ** *                         |    ***  *    * **              |
;*      30: |   ** *                         |    ***  *    * **              |
;*      31: |   ****                         |    **** *    * **              |
;*      32: |   ** *                         |*   **** *    * **              |
;*      33: |   ** *                         |    **** *    * **              |
;*      34: |   ** *                         |    **** *    * **              |
;*      35: |   ** *                         |    **** *    * **              |
;*      36: |   ****                         |    **** *    * **              |
;*      37: |   ****                         |    ** * *    * **              |
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
;*      Mem bank perf. penalty (est.) : 0.3%
;*
;*      Effective ii                : { min 38.00, est 38.12, max 39.00 }
;*
;*
;*      Total cycles (est.)         : 0 + trip_cnt * 38        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MV              A4,B17
;*                  MV              A3,B16
;*                  MV              A6,B9
;*                  ADD             5,A4,A4
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C23:
;*   0              LDBU    .D2T2   *++B17(3),B8      ; |244|  ^ 
;*   1              NOP             3
;*   4              LDW     .D2T2   *B4++,B6          ; |240| 
;*   5              LDW     .D2T2   *+B9[B8],B7       ; |244|  ^ 
;*   6              NOP             4
;*  10              ADD     .L2     B6,B7,B7          ; |244|  ^ 
;*  11              STW     .D2T2   B7,*+B9[B8]       ; |244|  ^ 
;*  12              LDBU    .D1T1   *-A4(1),A5        ; |245|  ^ 
;*  13              NOP             4
;*  17              ADDAW   .D1     A6,A5,A5          ; |245|  ^ 
;*  18              ADDAD   .D1     A5,8,A7           ; |245|  ^ 
;*  19              LDW     .D1T1   *A7,A5            ; |245|  ^ 
;*  20              NOP             4
;*  24              ADD     .L1X    B6,A5,A5          ; |245|  ^ 
;*  25              STW     .D1T1   A5,*A7            ; |245|  ^ 
;*  26              LDBU    .D1T1   *A4++(3),A5       ; |246|  ^ 
;*     ||           LDW     .D2T2   *+DP(_kernel_size),B7 ; |240| 
;*  27              NOP             3
;*  30              ADD     .L2     1,B5,B5           ; |240| 
;*  31              MV      .S2X    A5,B7             ; |246| Define a twin register
;*     ||           LDW     .D1T1   *+A3[A5],A5       ; |246|  ^ 
;*     ||           CMPGT   .L2     B7,B5,B0          ; |240| 
;*  32      [ B0]   B       .S2     $C$C23            ; |240| 
;*  33              NOP             3
;*  36              ADD     .L1X    B6,A5,A5          ; |246|  ^ 
;*  37              STW     .D2T1   A5,*+B16[B7]      ; |246|  ^ 
;*  38              ; BRANCHCC OCCURS {$C$C23}        ; |240| 
;*----------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP KERNEL
$C$DW$L$_pdf_representation_part_opt$8$B:
	.dwpsn	file "task.c",line 241,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 38
           LDBU    .D2T2   *++B17(3),B8      ; |244| <0,0>  ^ 
           NOP             3
           LDW     .D2T2   *B4++,B6          ; |240| <0,4> 
           LDW     .D2T2   *+B9[B8],B7       ; |244| <0,5>  ^ 
           NOP             4
           ADD     .L2     B6,B7,B7          ; |244| <0,10>  ^ 
           STW     .D2T2   B7,*+B9[B8]       ; |244| <0,11>  ^ 
           LDBU    .D1T1   *-A4(1),A5        ; |245| <0,12>  ^ 
           NOP             4
           ADDAW   .D1     A6,A5,A5          ; |245| <0,17>  ^ 
           ADDAD   .D1     A5,8,A7           ; |245| <0,18>  ^ 
           LDW     .D1T1   *A7,A5            ; |245| <0,19>  ^ 
           NOP             4
           ADD     .L1X    B6,A5,A5          ; |245| <0,24>  ^ 
           STW     .D1T1   A5,*A7            ; |245| <0,25>  ^ 

           LDW     .D2T2   *+DP(_kernel_size),B7 ; |240| <0,26> 
||         LDBU    .D1T1   *A4++(3),A5       ; |246| <0,26>  ^ 

           NOP             3
           ADD     .L2     1,B5,B5           ; |240| <0,30> 

           MV      .S2X    A5,B7             ; |246| <0,31> Define a twin register
||         CMPGT   .L2     B7,B5,B0          ; |240| <0,31> 
||         LDW     .D1T1   *+A3[A5],A5       ; |246| <0,31>  ^ 

   [ B0]   BNOP    .S2     $C$L6,3           ; |240| <0,32> 
           ADD     .L1X    B6,A5,A5          ; |246| <0,36>  ^ 
	.dwpsn	file "task.c",line 248,column 0,is_stmt
           STW     .D2T1   A5,*+B16[B7]      ; |246| <0,37>  ^ 
$C$DW$L$_pdf_representation_part_opt$8$E:
;** --------------------------------------------------------------------------*
$C$L7:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           RINT                              ; interrupts on
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 6
	.dwpsn	file "task.c",line 249,column 1,is_stmt
$C$DW$60	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$60, DW_AT_low_pc(0x00)
	.dwattr $C$DW$60, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |249| 
           ; BRANCH OCCURS {B3}              ; |249| 

$C$DW$61	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$61, DW_AT_name("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp/task.asm:$C$L6:1:1497092706")
	.dwattr $C$DW$61, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$61, DW_AT_TI_begin_line(0xf0)
	.dwattr $C$DW$61, DW_AT_TI_end_line(0xf8)
$C$DW$62	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$62, DW_AT_low_pc($C$DW$L$_pdf_representation_part_opt$8$B)
	.dwattr $C$DW$62, DW_AT_high_pc($C$DW$L$_pdf_representation_part_opt$8$E)
	.dwendtag $C$DW$61


$C$DW$63	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$63, DW_AT_name("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp/task.asm:$C$L2:1:1497092706")
	.dwattr $C$DW$63, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$63, DW_AT_TI_begin_line(0xeb)
	.dwattr $C$DW$63, DW_AT_TI_end_line(0xee)
$C$DW$64	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$64, DW_AT_low_pc($C$DW$L$_pdf_representation_part_opt$3$B)
	.dwattr $C$DW$64, DW_AT_high_pc($C$DW$L$_pdf_representation_part_opt$3$E)
	.dwendtag $C$DW$63

	.dwattr $C$DW$59, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$59, DW_AT_TI_end_line(0xf9)
	.dwattr $C$DW$59, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$59

	.sect	".text"
	.clink
	.global	_assignPdfModelFullToBuffer

$C$DW$65	.dwtag  DW_TAG_subprogram, DW_AT_name("assignPdfModelFullToBuffer")
	.dwattr $C$DW$65, DW_AT_low_pc(_assignPdfModelFullToBuffer)
	.dwattr $C$DW$65, DW_AT_high_pc(0x00)
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("_assignPdfModelFullToBuffer")
	.dwattr $C$DW$65, DW_AT_external
	.dwattr $C$DW$65, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$65, DW_AT_TI_begin_line(0xbe)
	.dwattr $C$DW$65, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$65, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$65, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 191,column 1,is_stmt,address _assignPdfModelFullToBuffer

;******************************************************************************
;* FUNCTION NAME: assignPdfModelFullToBuffer                                  *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,A5,A6,A7,A8,B0,B4,B5,B6,B7,B8,B9,B16,B17    *
;*   Regs Used         : A0,A3,A4,A5,A6,A7,A8,B0,B3,B4,B5,B6,B7,B8,B9,DP,B16, *
;*                           B17                                              *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_assignPdfModelFullToBuffer:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+DP(_size_pdf),B5 ; |196| 
           ZERO    .L1     A6                ; |192| 
           ZERO    .L1     A5                ; |192| 
           LDW     .D2T2   *+DP(_pdf_model_full),B4
           NOP             1

           CMPGT   .L2     B5,0,B0           ; |196| 
||         LDW     .D2T2   *+DP(_buf),B5

   [!B0]   BNOP    .S1     $C$L12,5          ; |196| 
           ; BRANCHCC OCCURS {$C$L12}        ; |196| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           MV      .L2X    A5,B9
||         MV      .L1X    B4,A3
||         MV      .S1     A5,A7
||         DINT                              ; interrupts off

           MV      .L2X    A6,B16
||         MV      .L1X    B5,A4

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 196
;*      Loop opening brace source line   : 197
;*      Loop closing brace source line   : 204
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 27
;*      Unpartitioned Resource Bound     : 6
;*      Partitioned Resource Bound(*)    : 7
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1        0     
;*      .S units                     3        2     
;*      .D units                     4        7*    
;*      .M units                     0        0     
;*      .X cross paths               2        1     
;*      .T address paths             6        5     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          4        7     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2        1     
;*      Bound(.L .S .D .LS .LSD)     4        6     
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
;*       0: |   *****                        |         *    * *               |
;*       1: |    ****                        |      *  *    * *               |
;*       2: |    ****                        |      *  *    * *               |
;*       3: |    ****                        |      *  *    * *               |
;*       4: |    ****                        |      *  *    * *               |
;*       5: |   *****                        |      *  *    * *               |
;*       6: |   *****                        |     **  *    * *               |
;*       7: |   * ***                        |     **  *    * **              |
;*       8: |   * **                         |     **  *    * **              |
;*       9: |   * **                         |     **  *    * **              |
;*      10: |   * **                         |    ***  *    * **              |
;*      11: |   ****                         |     *****    * **              |
;*      12: |   *****                        |    ******    * **              |
;*      13: |   ******                       |    *** **    * **              |
;*      14: |   ****                         |    *** **    * **              |
;*      15: |   ****                         |    * * **    * **              |
;*      16: |   ****                         |    * * **    * **              |
;*      17: |   ****                         |    * * **    * **              |
;*      18: |   ****                         |    * * **    * **              |
;*      19: |   ****                         |    *** **    * **              |
;*      20: |   *****                        |    *** **    * **              |
;*      21: |*  *****                        |      * **    * **              |
;*      22: |   *****                        |        **    * *               |
;*      23: |   *****                        |        **    * *               |
;*      24: |   *****                        |        **    * *               |
;*      25: |   *****                        |        **    * *               |
;*      26: |   *****                        |    *   **    * *               |
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
;*      Total cycles (est.)         : 0 + trip_cnt * 27        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MV              A6,B16
;*                  MV              A5,B9
;*                  MV              A5,A7
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C102:
;*   0              LDW     .D1T1   *+A3[A5],A3       ; |196|  ^ 
;*     ||           SHL     .S2     B9,2,B6           ; |201| 
;*   1              LDW     .D2T2   *+DP(_pdf_model_full),B5 ; |199| 
;*   2              NOP             3
;*   5              SHRU    .S1     A3,24,A3          ; |196|  ^ 
;*     ||           LDW     .D2T2   *+DP(_buf),B4     ; |199| 
;*   6              STB     .D1T1   A3,*+A6[A4]       ; |196|  ^ 
;*     ||           MV      .L1X    B5,A3             ; |199| Define a twin register
;*     ||           MV      .L2     B5,B17            ; |201| 
;*   7              LDW     .D1T1   *+A3[A7],A7       ; |199|  ^ 
;*   8              NOP             2
;*  10              ADD     .S2     B16,B4,B7         ; |199| 
;*     ||           MV      .L1X    B4,A4             ; |201| 
;*     ||           ADD     .L2     B4,B16,B8         ; |201| 
;*  11              MV      .L2     B7,B4             ; |199| Split a long life
;*  12              MV      .L1X    B7,A7             ; |199| Define a twin register
;*     ||           SHRU    .S1     A7,16,A8          ; |199|  ^ 
;*  13              STB     .D1T1   A8,*+A7(1)        ; |199|  ^ 
;*  14              LDW     .D2T2   *+B5[B9],B5       ; |200|  ^ 
;*  15              LDW     .D2T1   *+DP(_size_pdf),A7 ; |196| 
;*  16              NOP             3
;*  19              SHRU    .S2     B5,8,B5           ; |200|  ^ 
;*     ||           ADD     .L1     1,A5,A5           ; |196| 
;*  20              STB     .D2T2   B5,*+B4(2)        ; |200|  ^ 
;*     ||           MV      .S1     A5,A7             ; |196| Split a long life
;*     ||           CMPGT   .L1     A7,A5,A0          ; |196| 
;*  21              LDBU    .D2T2   *+B6[B17],B4      ; |201|  ^ 
;*     ||   [ A0]   B       .S1     $C$C102           ; |196| 
;*  22              NOP             4
;*  26              STB     .D2T2   B4,*+B8(3)        ; |201|  ^ 
;*     ||           ADD     .L2     4,B16,B16         ; |202| 
;*     ||           ADD     .L1     4,A6,A6           ; |202| Define a twin register
;*     ||           ADD     .S2     1,B9,B9           ; |196| Define a twin register
;*  27              ; BRANCHCC OCCURS {$C$C102}       ; |196| 
;*----------------------------------------------------------------------------*
$C$L9:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L10:    ; PIPED LOOP KERNEL
$C$DW$L$_assignPdfModelFullToBuffer$4$B:
	.dwpsn	file "task.c",line 197,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 27

           SHL     .S2     B9,2,B6           ; |201| <0,0> 
||         LDW     .D1T1   *+A3[A5],A3       ; |196| <0,0>  ^ 

           LDW     .D2T2   *+DP(_pdf_model_full),B5 ; |199| <0,1> 
           NOP             3

           LDW     .D2T2   *+DP(_buf),B4     ; |199| <0,5> 
||         SHRU    .S1     A3,24,A3          ; |196| <0,5>  ^ 

           MV      .L2     B5,B17            ; |201| <0,6> 
||         MV      .L1X    B5,A3             ; |199| <0,6> Define a twin register
||         STB     .D1T1   A3,*+A6[A4]       ; |196| <0,6>  ^ 

           LDW     .D1T1   *+A3[A7],A7       ; |199| <0,7>  ^ 
           NOP             2

           MV      .L1X    B4,A4             ; |201| <0,10> 
||         ADD     .L2     B4,B16,B8         ; |201| <0,10> 
||         ADD     .S2     B16,B4,B7         ; |199| <0,10> 

           MV      .L2     B7,B4             ; |199| <0,11> Split a long life

           MV      .L1X    B7,A7             ; |199| <0,12> Define a twin register
||         SHRU    .S1     A7,16,A8          ; |199| <0,12>  ^ 

           STB     .D1T1   A8,*+A7(1)        ; |199| <0,13>  ^ 
           LDW     .D2T2   *+B5[B9],B5       ; |200| <0,14>  ^ 
           LDW     .D2T1   *+DP(_size_pdf),A7 ; |196| <0,15> 
           NOP             3

           ADD     .L1     1,A5,A5           ; |196| <0,19> 
||         SHRU    .S2     B5,8,B5           ; |200| <0,19>  ^ 

           MV      .S1     A5,A7             ; |196| <0,20> Split a long life
||         CMPGT   .L1     A7,A5,A0          ; |196| <0,20> 
||         STB     .D2T2   B5,*+B4(2)        ; |200| <0,20>  ^ 

   [ A0]   BNOP    .S1     $C$L10,4          ; |196| <0,21> 
||         LDBU    .D2T2   *+B6[B17],B4      ; |201| <0,21>  ^ 

	.dwpsn	file "task.c",line 204,column 0,is_stmt

           ADD     .L1     4,A6,A6           ; |202| <0,26> Define a twin register
||         ADD     .L2     4,B16,B16         ; |202| <0,26> 
||         ADD     .S2     1,B9,B9           ; |196| <0,26> Define a twin register
||         STB     .D2T2   B4,*+B8(3)        ; |201| <0,26>  ^ 

$C$DW$L$_assignPdfModelFullToBuffer$4$E:
;** --------------------------------------------------------------------------*
$C$L11:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           RINT                              ; interrupts on
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 6
	.dwpsn	file "task.c",line 205,column 1,is_stmt
$C$DW$66	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$66, DW_AT_low_pc(0x00)
	.dwattr $C$DW$66, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |205| 
           ; BRANCH OCCURS {B3}              ; |205| 

$C$DW$67	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$67, DW_AT_name("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp/task.asm:$C$L10:1:1497092706")
	.dwattr $C$DW$67, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$67, DW_AT_TI_begin_line(0xc4)
	.dwattr $C$DW$67, DW_AT_TI_end_line(0xcc)
$C$DW$68	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$68, DW_AT_low_pc($C$DW$L$_assignPdfModelFullToBuffer$4$B)
	.dwattr $C$DW$68, DW_AT_high_pc($C$DW$L$_assignPdfModelFullToBuffer$4$E)
	.dwendtag $C$DW$67

	.dwattr $C$DW$65, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$65, DW_AT_TI_end_line(0xcd)
	.dwattr $C$DW$65, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$65

	.sect	".text"
	.clink
	.global	_assignBufferToTargetRegion

$C$DW$69	.dwtag  DW_TAG_subprogram, DW_AT_name("assignBufferToTargetRegion")
	.dwattr $C$DW$69, DW_AT_low_pc(_assignBufferToTargetRegion)
	.dwattr $C$DW$69, DW_AT_high_pc(0x00)
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("_assignBufferToTargetRegion")
	.dwattr $C$DW$69, DW_AT_external
	.dwattr $C$DW$69, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$69, DW_AT_TI_begin_line(0x9b)
	.dwattr $C$DW$69, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$69, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$69, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 155,column 34,is_stmt,address _assignBufferToTargetRegion

;******************************************************************************
;* FUNCTION NAME: assignBufferToTargetRegion                                  *
;*                                                                            *
;*   Regs Modified     : A3,A4,B4,B5,B6                                       *
;*   Regs Used         : A3,A4,B3,B4,B5,B6,DP                                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_assignBufferToTargetRegion:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 39
           LDW     .D2T2   *+DP(_buf),B5     ; |156| 
           LDW     .D2T2   *+DP(_sizeToCount),B4 ; |156| 
           MVKL    .S1     _target_Region,A4
           MVKH    .S1     _target_Region,A4
           NOP             2
           LDBU    .D2T2   *+B4[B5],B6       ; |156| 
           ADD     .L2     B4,B5,B4          ; |156| 
           LDBU    .D2T1   *+B4(1),A3        ; |156| 
           NOP             2
           SHL     .S2     B6,8,B5           ; |156| 
           NOP             1
           OR      .L1X    A3,B5,A3          ; |156| 
           STH     .D1T1   A3,*A4            ; |156| 
           LDBU    .D2T2   *+B4(2),B5        ; |157| 
           LDBU    .D2T2   *+B4(3),B6        ; |157| 
           ADD     .L1     2,A4,A3
           NOP             2
           SHL     .S2     B5,8,B5           ; |157| 
           OR      .L2     B6,B5,B5          ; |157| 
           STH     .D1T2   B5,*A3            ; |157| 
           LDBU    .D2T2   *+B4(4),B5        ; |158| 
           LDBU    .D2T2   *+B4(5),B6        ; |158| 
           ADD     .L1     4,A4,A3
           NOP             2
           SHL     .S2     B5,8,B5           ; |158| 
           OR      .L2     B6,B5,B5          ; |158| 
           STH     .D1T2   B5,*A3            ; |158| 
           LDBU    .D2T2   *+B4(6),B5        ; |159| 
           LDBU    .D2T2   *+B4(7),B6        ; |159| 
$C$DW$70	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$70, DW_AT_low_pc(0x00)
	.dwattr $C$DW$70, DW_AT_TI_return
           RETNOP  .S2     B3,2              ; |160| 
           SHL     .S2     B5,8,B4           ; |159| 

           OR      .L2     B6,B4,B4          ; |159| 
||         ADD     .L1     6,A4,A3

	.dwpsn	file "task.c",line 160,column 1,is_stmt
           STH     .D1T2   B4,*A3            ; |159| 
           ; BRANCH OCCURS {B3}              ; |160| 
	.dwattr $C$DW$69, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$69, DW_AT_TI_end_line(0xa0)
	.dwattr $C$DW$69, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$69

	.sect	".text"
	.clink
	.global	_assignBufferToKernel

$C$DW$71	.dwtag  DW_TAG_subprogram, DW_AT_name("assignBufferToKernel")
	.dwattr $C$DW$71, DW_AT_low_pc(_assignBufferToKernel)
	.dwattr $C$DW$71, DW_AT_high_pc(0x00)
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("_assignBufferToKernel")
	.dwattr $C$DW$71, DW_AT_external
	.dwattr $C$DW$71, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$71, DW_AT_TI_begin_line(0xa2)
	.dwattr $C$DW$71, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$71, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$71, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 162,column 28,is_stmt,address _assignBufferToKernel

;******************************************************************************
;* FUNCTION NAME: assignBufferToKernel                                        *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,A5,A6,A7,A8,B0,B1,B4,B5,B6,B7,B8            *
;*   Regs Used         : A0,A3,A4,A5,A6,A7,A8,B0,B1,B3,B4,B5,B6,B7,B8,DP      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_assignBufferToKernel:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+DP(_kernel_size),B0 ; |166| 
||         MVK     .S2     64,B8

           LDW     .D2T2   *+DP(_kernel),B6
           LDW     .D2T2   *+DP(_buf),B5
           MV      .L1X    B8,A3
           NOP             1
           CMPGT   .L2     B0,0,B1           ; |166| 
   [!B1]   B       .S1     $C$L22            ; |166| 

           SUB     .L2     B6,B5,B4
||         SUB     .S2     B5,B6,B7

           CMPLT   .L2     B7,B8,B7
           CMPLT   .L1X    B4,A3,A3
           AND     .L1X    A3,B7,A3
           XOR     .L1     1,A3,A0
           ; BRANCHCC OCCURS {$C$L22}        ; |166| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

   [ A0]   BNOP    .S1     $C$L16,4
||         MV      .S2     B6,B4
||         MV      .L1X    B6,A5
||         MV      .D2     B0,B6
||         CMPGT   .L2     B0,3,B1

           MV      .L1X    B5,A3
           ; BRANCHCC OCCURS {$C$L16}  
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           SUB     .L1X    B6,1,A0
||         DINT                              ; interrupts off

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 166
;*      Loop opening brace source line   : 166
;*      Loop closing brace source line   : 169
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 12
;*      Unpartitioned Resource Bound     : 3
;*      Partitioned Resource Bound(*)    : 5
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     1        3     
;*      .D units                     0        5*    
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        5*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        3     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        2     
;*      Bound(.L .S .D .LS .LSD)     1        4     
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
;*       0: |*                               |    **                          |
;*       1: |*                               |    **                          |
;*       2: |*                               |    **                          |
;*       3: |*                               |    **                          |
;*       4: |*                               |    **                          |
;*       5: |*                               |    ***                         |
;*       6: |*                               |    ****                        |
;*       7: |*                               |    ****                        |
;*       8: |*                               |    *****                       |
;*       9: |*                               |    ****                        |
;*      10: |*                               |    ****                        |
;*      11: |*                               |    ***                         |
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
;*       SETUP CODE
;*
;*                  SUB             A0,1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C176:
;*   0              LDBU    .D2T2   *B5++(4),B6       ; |166|  ^ 
;*   1              LDBU    .D2T2   *-B5(3),B6        ; |166|  ^ 
;*   2              LDBU    .D2T2   *-B5(2),B6        ; |166| 
;*   3              LDBU    .D2T2   *-B5(1),B7        ; |166| 
;*   4              NOP             1
;*   5              SHL     .S2     B6,8,B7           ; |166|  ^ 
;*   6              OR      .L2     B6,B7,B7          ; |166|  ^ 
;*     ||   [ A0]   BDEC    .S1     $C$C176,A0        ; |166| 
;*   7              SHL     .S2     B7,8,B8           ; |166|  ^ 
;*   8              OR      .L2     B6,B8,B6          ; |166|  ^ 
;*   9              SHL     .S2     B6,8,B6           ; |166|  ^ 
;*  10              OR      .L2     B7,B6,B6          ; |166|  ^ 
;*  11              STW     .D2T2   B6,*B4++          ; |166|  ^ 
;*  12              ; BRANCHCC OCCURS {$C$C176}       ; |166| 
;*----------------------------------------------------------------------------*
$C$L13:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L14:    ; PIPED LOOP KERNEL
$C$DW$L$_assignBufferToKernel$5$B:
	.dwpsn	file "task.c",line 166,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 12
           LDBU    .D2T2   *B5++(4),B6       ; |166| <0,0>  ^ 
           LDBU    .D2T2   *-B5(3),B6        ; |166| <0,1>  ^ 
           LDBU    .D2T2   *-B5(2),B6        ; |166| <0,2> 
           LDBU    .D2T2   *-B5(1),B7        ; |166| <0,3> 
           NOP             1
           SHL     .S2     B6,8,B7           ; |166| <0,5>  ^ 

   [ A0]   BDEC    .S1     $C$L14,A0         ; |166| <0,6> 
||         OR      .L2     B6,B7,B7          ; |166| <0,6>  ^ 

           SHL     .S2     B7,8,B8           ; |166| <0,7>  ^ 
           OR      .L2     B6,B8,B6          ; |166| <0,8>  ^ 
           SHL     .S2     B6,8,B6           ; |166| <0,9>  ^ 
           OR      .L2     B7,B6,B6          ; |166| <0,10>  ^ 
	.dwpsn	file "task.c",line 169,column 0,is_stmt
           STW     .D2T2   B6,*B4++          ; |166| <0,11>  ^ 
$C$DW$L$_assignBufferToKernel$5$E:
;** --------------------------------------------------------------------------*
$C$L15:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
$C$DW$72	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$72, DW_AT_low_pc(0x00)
	.dwattr $C$DW$72, DW_AT_TI_return
           RETNOP  .S2     B3,4              ; |170| 
           RINT                              ; interrupts on
           ; BRANCH OCCURS {B3}              ; |170| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 6
   [ B1]   BNOP    .S1     $C$L18,5
           ; BRANCHCC OCCURS {$C$L18} {0} 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L17
;** --------------------------------------------------------------------------*
$C$L17:    
$C$DW$L$_assignBufferToKernel$9$B:
	.dwpsn	file "task.c",line 166,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 5
           LDBU    .D1T1   *A3,A4            ; |166| 
           LDBU    .D1T1   *+A3(1),A8        ; |166| 
           LDBU    .D1T1   *+A3(2),A7        ; |166| 
           NOP             2
$C$DW$L$_assignBufferToKernel$9$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_assignBufferToKernel$10$B:
;          EXCLUSIVE CPU CYCLES: 7

           LDBU    .D1T1   *+A3(3),A6        ; |166| 
||         SUB     .L2     B0,1,B0           ; |166| 
||         SHL     .S1     A4,8,A4           ; |166| 
||         ADD     .L1     4,A3,A3           ; |168| 

           OR      .L1     A8,A4,A4          ; |166| 
|| [ B0]   B       .S1     $C$L17            ; |166| 

$C$DW$73	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$73, DW_AT_low_pc(0x04)
	.dwattr $C$DW$73, DW_AT_TI_return

           SHL     .S1     A4,8,A4           ; |166| 
|| [!B0]   RET     .S2     B3                ; |170| 

           OR      .L1     A7,A4,A4          ; |166| 
           SHL     .S1     A4,8,A4           ; |166| 
           OR      .L1     A6,A4,A4          ; |166| 
	.dwpsn	file "task.c",line 169,column 0,is_stmt
           STW     .D1T1   A4,*A5++          ; |166| 
           ; BRANCHCC OCCURS {$C$L17}        ; |166| 
$C$DW$L$_assignBufferToKernel$10$E:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           NOP             1
           ; BRANCH OCCURS {B3}              ; |170| 
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 1

           SUB     .L2X    A3,1,B4
||         LDBU    .D1T1   *A3++(4),A6       ; |166| (P) <0,0> 
||         SUB     .D2     B0,3,B0
||         DINT                              ; interrupts off

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 166
;*      Loop opening brace source line   : 166
;*      Loop closing brace source line   : 169
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 0
;*      Unpartitioned Resource Bound     : 3
;*      Partitioned Resource Bound(*)    : 3
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     3*       1     
;*      .D units                     3*       2     
;*      .M units                     0        0     
;*      .X cross paths               0        1     
;*      .T address paths             3*       2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          2        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2        1     
;*      Bound(.L .S .D .LS .LSD)     3*       2     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 3  Schedule found with 5 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*  *** *                        |*   ***                         |
;*       1: |*  *****                        |*   ***                         |
;*       2: |*  ****                         |*   ***                         |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Redundant loop generated
;*      Epilog not removed
;*      Collapsed epilog stages       : 0
;*
;*      Prolog not entirely removed
;*      Collapsed prolog stages       : 2
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh16
;*
;*      Minimum safe trip count       : 4
;*
;*
;*      Mem bank conflicts/iter(est.) : { min 1.000, est 1.125, max 2.000 }
;*      Mem bank perf. penalty (est.) : 27.3%
;*
;*      Effective ii                : { min 4.00, est 4.12, max 5.00 }
;*
;*
;*      Total cycles (est.)         : 10 + trip_cnt * 3        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             B0,1,B0
;*                  MV              A3,B4
;*                  SUB             B4,1,B4
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C194:
;*   0              LDBU    .D1T1   *A3++(4),A6       ; |166| 
;*   1              LDBU    .D1T1   *-A3(3),A6        ; |166| 
;*   2              LDBU    .D1T1   *-A3(2),A7        ; |166| 
;*   3              NOP             2
;*   5              SHL     .S1     A6,8,A5           ; |166| 
;*     ||           LDBU    .D2T2   *++B4(4),B5       ; |166| 
;*   6              OR      .L1     A6,A5,A5          ; |166| 
;*   7              SHL     .S1     A5,8,A5           ; |166| 
;*     ||   [ B0]   BDEC    .S2     $C$C194,B0        ; |166| 
;*   8              OR      .L1     A7,A5,A4          ; |166| 
;*   9              SHL     .S1     A4,8,A4           ; |166| 
;*  10              NOP             1
;*  11              OR      .L2X    B5,A4,B5          ; |166| 
;*  12              STW     .D2T2   B5,*B6++          ; |166| 
;*  13              ; BRANCHCC OCCURS {$C$C194}       ; |166| 
;*----------------------------------------------------------------------------*
$C$L19:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 3

           LDBU    .D1T1   *-A3(3),A6        ; |166| (P) <0,1> 
|| [ B0]   BDEC    .S2     $C$L20,B0         ; |166| (P) <0,7> 

           ZERO    .L1     A4
||         LDBU    .D1T1   *-A3(2),A7        ; |166| (P) <0,2> 

	.dwpsn	file "task.c",line 166,column 0,is_stmt

           MV      .L2X    A5,B6
||         SET     .S1     A4,0xf,0xf,A0     ; init prolog collapse predicate
||         LDBU    .D1T1   *A3++(4),A6       ; |166| (P) <1,0> 

;** --------------------------------------------------------------------------*
$C$L20:    ; PIPED LOOP KERNEL
$C$DW$L$_assignBufferToKernel$14$B:
;          EXCLUSIVE CPU CYCLES: 3

   [ B0]   BDEC    .S2     $C$L20,B0         ; |166| <1,7> 
||         SHL     .S1     A5,8,A5           ; |166| <1,7> 
||         LDBU    .D1T1   *-A3(3),A6        ; |166| <3,1> 

           OR      .L2X    B5,A4,B5          ; |166| <0,11> 
||         OR      .L1     A7,A5,A4          ; |166| <1,8> 
||         LDBU    .D2T2   *++B4(4),B5       ; |166| <2,5> 
||         SHL     .S1     A6,8,A5           ; |166| <2,5> 
||         LDBU    .D1T1   *-A3(2),A7        ; |166| <3,2> 

	.dwpsn	file "task.c",line 169,column 0,is_stmt

   [ A0]   MPYSU   .M1     2,A0,A0           ; <0,12> 
|| [!A0]   STW     .D2T2   B5,*B6++          ; |166| <0,12> 
||         SHL     .S1     A4,8,A4           ; |166| <1,9> 
||         OR      .L1     A6,A5,A5          ; |166| <2,6> 
||         LDBU    .D1T1   *A3++(4),A6       ; |166| <4,0> 

$C$DW$L$_assignBufferToKernel$14$E:
;** --------------------------------------------------------------------------*
$C$L21:    ; PIPED LOOP EPILOG
;          EXCLUSIVE CPU CYCLES: 9

           SHL     .S1     A5,8,A5           ; |166| (E) <2,7> 
||         LDBU    .D1T1   *-A3(3),A3        ; |166| (E) <4,1> 

           OR      .L2X    B5,A4,B5          ; |166| (E) <1,11> 
||         OR      .L1     A7,A5,A4          ; |166| (E) <2,8> 
||         LDBU    .D2T2   *++B4(4),B4       ; |166| (E) <3,5> 
||         SHL     .S1     A6,8,A3           ; |166| (E) <3,5> 
||         LDBU    .D1T1   *-A3(2),A3        ; |166| (E) <4,2> 

           STW     .D2T2   B5,*B6++          ; |166| (E) <1,12> 
||         SHL     .S1     A4,8,A3           ; |166| (E) <2,9> 
||         OR      .L1     A6,A3,A4          ; |166| (E) <3,6> 

           SHL     .S1     A4,8,A4           ; |166| (E) <3,7> 

           OR      .L2X    B5,A3,B5          ; |166| (E) <2,11> 
||         OR      .L1     A7,A4,A5          ; |166| (E) <3,8> 
||         LDBU    .D2T2   *++B4(4),B4       ; |166| (E) <4,5> 
||         SHL     .S1     A6,8,A4           ; |166| (E) <4,5> 

           STW     .D2T2   B5,*B6++          ; |166| (E) <2,12> 
||         SHL     .S1     A5,8,A5           ; |166| (E) <3,9> 
||         OR      .L1     A3,A4,A4          ; |166| (E) <4,6> 

           SHL     .S1     A4,8,A4           ; |166| (E) <4,7> 

           OR      .L2X    B4,A5,B4          ; |166| (E) <3,11> 
||         OR      .L1     A3,A4,A3          ; |166| (E) <4,8> 

           RINT                              ; interrupts on
||         STW     .D2T2   B4,*B6++          ; |166| (E) <3,12> 
||         SHL     .S1     A3,8,A3           ; |166| (E) <4,9> 

;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           NOP             1
           OR      .L2X    B4,A3,B4          ; |166| (E) <4,11> 
           STW     .D2T2   B4,*B6++          ; |166| (E) <4,12> 
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 6
	.dwpsn	file "task.c",line 170,column 1,is_stmt
$C$DW$74	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$74, DW_AT_low_pc(0x00)
	.dwattr $C$DW$74, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |170| 
           ; BRANCH OCCURS {B3}              ; |170| 

$C$DW$75	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$75, DW_AT_name("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp/task.asm:$C$L20:1:1497092706")
	.dwattr $C$DW$75, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$75, DW_AT_TI_begin_line(0xa6)
	.dwattr $C$DW$75, DW_AT_TI_end_line(0xa9)
$C$DW$76	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$76, DW_AT_low_pc($C$DW$L$_assignBufferToKernel$14$B)
	.dwattr $C$DW$76, DW_AT_high_pc($C$DW$L$_assignBufferToKernel$14$E)
	.dwendtag $C$DW$75


$C$DW$77	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$77, DW_AT_name("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp/task.asm:$C$L17:1:1497092706")
	.dwattr $C$DW$77, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$77, DW_AT_TI_begin_line(0xa6)
	.dwattr $C$DW$77, DW_AT_TI_end_line(0xa9)
$C$DW$78	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$78, DW_AT_low_pc($C$DW$L$_assignBufferToKernel$9$B)
	.dwattr $C$DW$78, DW_AT_high_pc($C$DW$L$_assignBufferToKernel$9$E)
$C$DW$79	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$79, DW_AT_low_pc($C$DW$L$_assignBufferToKernel$10$B)
	.dwattr $C$DW$79, DW_AT_high_pc($C$DW$L$_assignBufferToKernel$10$E)
	.dwendtag $C$DW$77


$C$DW$80	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$80, DW_AT_name("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp/task.asm:$C$L14:1:1497092706")
	.dwattr $C$DW$80, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$80, DW_AT_TI_begin_line(0xa6)
	.dwattr $C$DW$80, DW_AT_TI_end_line(0xa9)
$C$DW$81	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$81, DW_AT_low_pc($C$DW$L$_assignBufferToKernel$5$B)
	.dwattr $C$DW$81, DW_AT_high_pc($C$DW$L$_assignBufferToKernel$5$E)
	.dwendtag $C$DW$80

	.dwattr $C$DW$71, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$71, DW_AT_TI_end_line(0xaa)
	.dwattr $C$DW$71, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$71

	.sect	".text"
	.clink
	.global	_allocateMemory

$C$DW$82	.dwtag  DW_TAG_subprogram, DW_AT_name("allocateMemory")
	.dwattr $C$DW$82, DW_AT_low_pc(_allocateMemory)
	.dwattr $C$DW$82, DW_AT_high_pc(0x00)
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("_allocateMemory")
	.dwattr $C$DW$82, DW_AT_external
	.dwattr $C$DW$82, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$82, DW_AT_TI_begin_line(0xac)
	.dwattr $C$DW$82, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$82, DW_AT_frame_base[DW_OP_breg31 8]
	.dwattr $C$DW$82, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 172,column 22,is_stmt,address _allocateMemory

;******************************************************************************
;* FUNCTION NAME: allocateMemory                                              *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24, *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,DP,SP,A16,A17,A18,A19,A20,A21,A22,A23,  *
;*                           A24,A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19, *
;*                           B20,B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31  *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************
_allocateMemory:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T2   B3,*SP--(8)       ; |172| 
           LDW     .D2T2   *+DP(_kernel_size),B4 ; |176| 
           NOP             4
$C$DW$83	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$83, DW_AT_low_pc(0x00)
	.dwattr $C$DW$83, DW_AT_name("_malloc")
	.dwattr $C$DW$83, DW_AT_TI_call

           CALLP   .S2     _malloc,B3
||         SHL     .S1X    B4,2,A4           ; |176| 

$C$RL0:    ; CALL OCCURS {_malloc} {0}       ; |176| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVK     .L1     0x5,A6            ; |179| 
||         MVK     .S2     0x2711,B6         ; |179| 
||         MV      .S1     A4,A0             ; |176| 

   [ A0]   B       .S1     $C$L23            ; |176| 
$C$DW$84	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$84, DW_AT_low_pc(0x00)
	.dwattr $C$DW$84, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$84, DW_AT_TI_call
   [!A0]   CALL    .S1     _NOTIFY_notify    ; |179| 
$C$DW$85	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$85, DW_AT_low_pc(0x00)
	.dwattr $C$DW$85, DW_AT_name("_malloc")
	.dwattr $C$DW$85, DW_AT_TI_call
   [ A0]   CALL    .S1     _malloc           ; |183| 
           ZERO    .L2     B4                ; |179| 
           MVK     .L1     0x1,A4            ; |179| 
           STW     .D2T1   A0,*+DP(_kernel)  ; |176| 
           ; BRANCHCC OCCURS {$C$L23}        ; |176| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           ADDKPC  .S2     $C$RL1,B3,0       ; |179| 
$C$RL1:    ; CALL OCCURS {_NOTIFY_notify} {0}  ; |179| 
$C$DW$86	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$86, DW_AT_low_pc(0x00)
	.dwattr $C$DW$86, DW_AT_name("_malloc")
	.dwattr $C$DW$86, DW_AT_TI_call
           CALL    .S1     _malloc           ; |183| 
           NOP             3
;** --------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 2
           MVK     .S1     0x40,A4           ; |183| 
           ADDKPC  .S2     $C$RL2,B3,0       ; |183| 
$C$RL2:    ; CALL OCCURS {_malloc} {0}       ; |183| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVK     .S2     0x2712,B6         ; |186| 
||         MV      .L1     A4,A0             ; |183| 

   [ A0]   B       .S1     $C$L24            ; |183| 
||         STW     .D2T1   A0,*+DP(_pdf_model_full) ; |183| 

$C$DW$87	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$87, DW_AT_low_pc(0x00)
	.dwattr $C$DW$87, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$87, DW_AT_TI_call
	.dwattr $C$DW$87, DW_AT_TI_return

   [!A0]   CALLRET .S1     _NOTIFY_notify    ; |186| 
|| [!A0]   LDW     .D2T2   *++SP(8),B3       ; |188| 

   [ A0]   LDW     .D2T2   *++SP(8),B3       ; |188| 
           ZERO    .L2     B4                ; |186| 
           MVK     .L1     0x5,A6            ; |186| 
           MVK     .L1     0x1,A4            ; |186| 
           ; BRANCHCC OCCURS {$C$L24}        ; |183| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           NOP             1
$C$RL3:    ; CALL-RETURN OCCURS {_NOTIFY_notify} {0}  ; |186| 
;** --------------------------------------------------------------------------*
$C$L24:    
;          EXCLUSIVE CPU CYCLES: 7
           NOP             1
	.dwpsn	file "task.c",line 188,column 1,is_stmt
$C$DW$88	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$88, DW_AT_low_pc(0x00)
	.dwattr $C$DW$88, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |188| 
           ; BRANCH OCCURS {B3}              ; |188| 
	.dwattr $C$DW$82, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$82, DW_AT_TI_end_line(0xbc)
	.dwattr $C$DW$82, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$82

	.sect	".text"
	.clink

$C$DW$89	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_notify")
	.dwattr $C$DW$89, DW_AT_low_pc(_Task_notify)
	.dwattr $C$DW$89, DW_AT_high_pc(0x00)
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("_Task_notify")
	.dwattr $C$DW$89, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$89, DW_AT_TI_begin_line(0xfb)
	.dwattr $C$DW$89, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$89, DW_AT_frame_base[DW_OP_breg31 8]
	.dwattr $C$DW$89, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 252,column 1,is_stmt,address _Task_notify
$C$DW$90	.dwtag  DW_TAG_formal_parameter, DW_AT_name("eventNo")
	.dwattr $C$DW$90, DW_AT_TI_symbol_name("_eventNo")
	.dwattr $C$DW$90, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$90, DW_AT_location[DW_OP_reg4]
$C$DW$91	.dwtag  DW_TAG_formal_parameter, DW_AT_name("arg")
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("_arg")
	.dwattr $C$DW$91, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$91, DW_AT_location[DW_OP_reg20]
$C$DW$92	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$92, DW_AT_location[DW_OP_reg6]

;******************************************************************************
;* FUNCTION NAME: Task_notify                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,*
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,DP,SP,A16,A17,A18,A19,A20,A21,A22,A23,  *
;*                           A24,A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19, *
;*                           B20,B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31  *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************
_Task_notify:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           LDW     .D2T2   *+DP(_count$1),B5 ; |259| 
           MV      .L1X    B4,A5             ; |252| 
           NOP             3
           ADD     .L2     1,B5,B5           ; |259| 

           CMPEQ   .L2     B5,2,B0           ; |262| 
||         STW     .D2T2   B5,*+DP(_count$1) ; |259| 

           CMPEQ   .L1X    B5,1,A0           ; |260| 
|| [!B0]   EXTU    .S1     A6,24,24,A4       ; |268| 

   [!B0]   EXTU    .S1     A6,16,24,A3       ; |267| 
|| [ A0]   B       .S2     $C$L25            ; |260| 

$C$DW$93	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$93, DW_AT_low_pc(0x00)
	.dwattr $C$DW$93, DW_AT_name("_SEM_post")
	.dwattr $C$DW$93, DW_AT_TI_call
	.dwattr $C$DW$93, DW_AT_TI_return
   [ A0]   CALLRET .S1     _SEM_post         ; |274| 
   [ A0]   STW     .D2T1   A6,*+DP(_buf)     ; |261| 
   [ A0]   ADD     .L1     4,A5,A4           ; |274| 
   [!A0]   CMPEQ   .L2     B5,3,B1           ; |264| 
   [ B0]   MVK     .L2     0x1,B1            ; |269| 
           ; BRANCHCC OCCURS {$C$L25}        ; |260| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

   [!B1]   STW     .D2T1   A6,*+DP(_runningCode) ; |271| 
|| [!B0]   SHR     .S1     A6,16,A7          ; |266| 
|| [!B0]   MPY     .M1     A4,A3,A6          ; |269| 
||         MV      .L2     B1,B2             ; |271| 

   [ B0]   ZERO    .L2     B2                ; |271| 
|| [ B0]   STW     .D2T1   A6,*+DP(_bufferSize) ; |263| 

   [ B2]   STB     .D2T1   A7,*+DP(_kernelRows) ; |266| 
   [ B2]   STW     .D2T1   A6,*+DP(_kernel_size) ; |269| 
   [ B2]   STB     .D2T1   A3,*+DP(_kernelCols) ; |267| 
   [ B2]   STB     .D2T1   A4,*+DP(_lengthToCount) ; |268| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
$C$DW$94	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$94, DW_AT_low_pc(0x00)
	.dwattr $C$DW$94, DW_AT_name("_SEM_post")
	.dwattr $C$DW$94, DW_AT_TI_call
	.dwattr $C$DW$94, DW_AT_TI_return
           CALLRET .S1     _SEM_post         ; |274| 
           ADD     .L1     4,A5,A4           ; |274| 
           NOP             3
;** --------------------------------------------------------------------------*
$C$L25:    
;          EXCLUSIVE CPU CYCLES: 1
	.dwpsn	file "task.c",line 275,column 1,is_stmt
           NOP             1
$C$RL4:    ; CALL-RETURN OCCURS {_SEM_post} {0}  ; |274| 
	.dwattr $C$DW$89, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$89, DW_AT_TI_end_line(0x113)
	.dwattr $C$DW$89, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$89

	.sect	".text"
	.clink
	.global	_Task_execute

$C$DW$95	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_execute")
	.dwattr $C$DW$95, DW_AT_low_pc(_Task_execute)
	.dwattr $C$DW$95, DW_AT_high_pc(0x00)
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("_Task_execute")
	.dwattr $C$DW$95, DW_AT_external
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$95, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$95, DW_AT_TI_begin_line(0x77)
	.dwattr $C$DW$95, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$95, DW_AT_frame_base[DW_OP_breg31 24]
	.dwattr $C$DW$95, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 120,column 1,is_stmt,address _Task_execute
$C$DW$96	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$96, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$96, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_execute                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,B12,SP,A16,A17,A18,A19,   *
;*                           A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31, *
;*                           B16,B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27, *
;*                           B28,B29,B30,B31                                  *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,B12,DP,SP,A16,A17,A18,A19,*
;*                           A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31, *
;*                           B16,B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27, *
;*                           B28,B29,B30,B31                                  *
;*   Local Frame Size  : 0 Args + 0 Auto + 24 Save = 24 byte                  *
;******************************************************************************
_Task_execute:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           STW     .D2T2   B12,*SP--(8)      ; |120| 
           STDW    .D2T2   B11:B10,*SP--     ; |120| 
$C$DW$97	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$97, DW_AT_low_pc(0x08)
	.dwattr $C$DW$97, DW_AT_name("_allocateMemory")
	.dwattr $C$DW$97, DW_AT_TI_call

           STDW    .D2T1   A11:A10,*SP--     ; |120| 
||         MV      .L1X    B3,A11            ; |120| 
||         CALLP   .S2     _allocateMemory,B3
||         MV      .S1     A4,A10            ; |120| 

$C$RL5:    ; CALL OCCURS {_allocateMemory} {0}  ; |123| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 27
           MVK     .L2     0xffffffff,B11    ; |125| 
$C$DW$98	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$98, DW_AT_low_pc(0x00)
	.dwattr $C$DW$98, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$98, DW_AT_TI_call

           CALLP   .S2     _SEM_pend,B3
||         MV      .L2     B11,B4            ; |125| 
||         ADD     .L1     4,A10,A4          ; |125| 
||         ADD     .S1     4,A10,A10         ; |125| 

$C$RL6:    ; CALL OCCURS {_SEM_pend} {0}     ; |125| 
           LDW     .D2T1   *+DP(_buf),A4     ; |127| 
$C$DW$99	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$99, DW_AT_low_pc(0x00)
	.dwattr $C$DW$99, DW_AT_name("_BCACHE_inv")
	.dwattr $C$DW$99, DW_AT_TI_call

           CALLP   .S2     _BCACHE_inv,B3
||         LDW     .D2T2   *+DP(_bufferSize),B4 ; |127| 
||         MVK     .L1     0x1,A6            ; |127| 

$C$RL7:    ; CALL OCCURS {_BCACHE_inv} {0}   ; |127| 
$C$DW$100	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$100, DW_AT_low_pc(0x00)
	.dwattr $C$DW$100, DW_AT_name("_assignBufferToKernel")
	.dwattr $C$DW$100, DW_AT_TI_call
           CALLP   .S2     _assignBufferToKernel,B3
$C$RL8:    ; CALL OCCURS {_assignBufferToKernel} {0}  ; |128| 
           MVK     .S2     0x65,B10          ; |130| 
$C$DW$101	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$101, DW_AT_low_pc(0x00)
	.dwattr $C$DW$101, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$101, DW_AT_TI_call

           CALLP   .S2     _NOTIFY_notify,B3
||         MV      .L2     B10,B6            ; |130| 
||         MVK     .L1     0x1,A4            ; |130| 
||         ZERO    .D2     B4                ; |130| 
||         MVK     .S1     0x5,A6            ; |130| 

$C$RL9:    ; CALL OCCURS {_NOTIFY_notify} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           LDBU    .D2T2   *+DP(_lengthToCount),B5 ; |132| 
           LDBU    .D2T2   *+DP(_kernelCols),B4 ; |132| 
           LDW     .D2T2   *+DP(_runningCode),B6 ; |134| 
           MVK     .S2     0x270f,B12        ; |134| 
           NOP             2
           MPYU    .M2     B5,B4,B4          ; |132| 
           MVK     .L2     3,B5              ; |132| 
           MPYLI   .M2     B5,B4,B5:B4       ; |132| 
           NOP             3

           MVK     .S2     9999,B5           ; |134| 
||         STW     .D2T2   B4,*+DP(_sizeToCount) ; |132| 

           CMPEQ   .L2     B6,B5,B0          ; |134| 
   [ B0]   BNOP    .S1     $C$L31,5          ; |134| 
           ; BRANCHCC OCCURS {$C$L31}        ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
$C$DW$102	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$102, DW_AT_low_pc(0x00)
	.dwattr $C$DW$102, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$102, DW_AT_TI_call
           CALL    .S1     _SEM_pend         ; |135| 
           MV      .L1     A10,A4            ; |135| 
           MV      .L2     B11,B4            ; |135| 
	.dwpsn	file "task.c",line 134,column 0,is_stmt
           NOP             2
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L26
;** --------------------------------------------------------------------------*
$C$L26:    
$C$DW$L$_Task_execute$5$B:
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL10,B3,0      ; |135| 
$C$RL10:   ; CALL OCCURS {_SEM_pend} {0}     ; |135| 
$C$DW$L$_Task_execute$5$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$6$B:
;          EXCLUSIVE CPU CYCLES: 51
           LDW     .D2T1   *+DP(_buf),A4     ; |137| 
$C$DW$103	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$103, DW_AT_low_pc(0x00)
	.dwattr $C$DW$103, DW_AT_name("_BCACHE_inv")
	.dwattr $C$DW$103, DW_AT_TI_call

           CALLP   .S2     _BCACHE_inv,B3
||         LDW     .D2T2   *+DP(_bufferSize),B4 ; |137| 
||         MVK     .L1     0x1,A6            ; |137| 

$C$RL11:   ; CALL OCCURS {_BCACHE_inv} {0}   ; |137| 
           LDW     .D2T2   *+DP(_buf),B5     ; |156| 
           LDW     .D2T2   *+DP(_sizeToCount),B4 ; |156| 
           MVKL    .S1     _target_Region,A4
           MVKH    .S1     _target_Region,A4
           ADD     .L1     2,A4,A31
           ADD     .L1     4,A4,A30
           LDBU    .D2T2   *+B4[B5],B7       ; |156| 
           ADD     .L2     B4,B5,B6          ; |156| 
           LDBU    .D2T1   *+B6(1),A3        ; |156| 
           NOP             2
           SHL     .S2     B7,8,B4           ; |156| 
           NOP             1
           OR      .L1X    A3,B4,A3          ; |156| 
           STH     .D1T1   A3,*A4            ; |156| 
           LDBU    .D2T2   *+B6(2),B4        ; |157| 
           LDBU    .D2T2   *+B6(3),B5        ; |157| 
           ADD     .L1     6,A4,A3
           NOP             2
           SHL     .S2     B4,8,B4           ; |157| 
           OR      .L2     B5,B4,B4          ; |157| 
           STH     .D1T2   B4,*A31           ; |157| 
           LDBU    .D2T2   *+B6(4),B4        ; |158| 
           LDBU    .D2T2   *+B6(5),B5        ; |158| 
           NOP             3
           SHL     .S2     B4,8,B4           ; |158| 
           OR      .L2     B5,B4,B4          ; |158| 
           STH     .D1T2   B4,*A30           ; |158| 
           LDBU    .D2T2   *+B6(6),B4        ; |159| 
           LDBU    .D2T2   *+B6(7),B5        ; |159| 
           NOP             3
           SHL     .S2     B4,8,B4           ; |159| 
           OR      .L2     B5,B4,B4          ; |159| 
$C$DW$104	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$104, DW_AT_low_pc(0x00)
	.dwattr $C$DW$104, DW_AT_name("_pdf_representation_part_opt")
	.dwattr $C$DW$104, DW_AT_TI_call

           CALLP   .S2     _pdf_representation_part_opt,B3
||         STH     .D1T2   B4,*A3            ; |159| 

$C$RL12:   ; CALL OCCURS {_pdf_representation_part_opt} {0}  ; |141| 
$C$DW$L$_Task_execute$6$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$7$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+DP(_size_pdf),B4 ; |196| 
           NOP             4
           CMPGT   .L2     B4,0,B0           ; |196| 

   [!B0]   BNOP    .S1     $C$L30,5          ; |196| 
|| [ B0]   LDW     .D2T1   *+DP(_pdf_model_full),A3

           ; BRANCHCC OCCURS {$C$L30}        ; |196| 
$C$DW$L$_Task_execute$7$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$8$B:
;          EXCLUSIVE CPU CYCLES: 2

           LDW     .D2T1   *+DP(_buf),A4
||         ZERO    .L1     A7                ; |196| 
||         ZERO    .S1     A6                ; |196| 
||         ZERO    .D1     A5                ; |196| 
||         ZERO    .L2     B9                ; |196| 
||         ZERO    .S2     B16               ; |196| 

           DINT                              ; interrupts off
$C$DW$L$_Task_execute$8$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 196
;*      Loop opening brace source line   : 197
;*      Loop closing brace source line   : 204
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 27
;*      Unpartitioned Resource Bound     : 6
;*      Partitioned Resource Bound(*)    : 7
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1        0     
;*      .S units                     3        2     
;*      .D units                     4        7*    
;*      .M units                     0        0     
;*      .X cross paths               2        1     
;*      .T address paths             6        5     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          4        7     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2        1     
;*      Bound(.L .S .D .LS .LSD)     4        6     
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
;*       0: |   *****                        |         *    * *               |
;*       1: |    ****                        |      *  *    * *               |
;*       2: |    ****                        |      *  *    * *               |
;*       3: |    ****                        |      *  *    * *               |
;*       4: |    ****                        |      *  *    * *               |
;*       5: |   *****                        |      *  *    * *               |
;*       6: |   *****                        |     **  *    * *               |
;*       7: |   * ***                        |     **  *    * **              |
;*       8: |   * **                         |     **  *    * **              |
;*       9: |   * **                         |     **  *    * **              |
;*      10: |   * **                         |    ***  *    * **              |
;*      11: |   ****                         |     *****    * **              |
;*      12: |   *****                        |    ******    * **              |
;*      13: |   ******                       |    *** **    * **              |
;*      14: |   ****                         |    *** **    * **              |
;*      15: |   ****                         |    * * **    * **              |
;*      16: |   ****                         |    * * **    * **              |
;*      17: |   ****                         |    * * **    * **              |
;*      18: |   ****                         |    * * **    * **              |
;*      19: |   ****                         |    *** **    * **              |
;*      20: |   *****                        |    *** **    * **              |
;*      21: |*  *****                        |      * **    * **              |
;*      22: |   *****                        |        **    * *               |
;*      23: |   *****                        |        **    * *               |
;*      24: |   *****                        |        **    * *               |
;*      25: |   *****                        |        **    * *               |
;*      26: |   *****                        |    *   **    * *               |
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
;*      Total cycles (est.)         : 0 + trip_cnt * 27        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MV              A6,B16
;*                  MV              A5,B9
;*                  MV              A6,A7
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C274:
;*   0              LDW     .D1T1   *+A3[A6],A3       ; |196|  ^ 
;*     ||           SHL     .S2     B16,2,B6          ; |201| 
;*   1              LDW     .D2T2   *+DP(_pdf_model_full),B5 ; |199| 
;*   2              NOP             3
;*   5              SHRU    .S1     A3,24,A3          ; |196|  ^ 
;*     ||           LDW     .D2T2   *+DP(_buf),B4     ; |199| 
;*   6              STB     .D1T1   A3,*+A5[A4]       ; |196|  ^ 
;*     ||           MV      .L1X    B5,A3             ; |199| Define a twin register
;*     ||           MV      .L2     B5,B17            ; |201| 
;*   7              LDW     .D1T1   *+A3[A7],A7       ; |199|  ^ 
;*   8              NOP             2
;*  10              ADD     .S2     B9,B4,B7          ; |199| 
;*     ||           MV      .L1X    B4,A4             ; |201| 
;*     ||           ADD     .L2     B4,B9,B8          ; |201| 
;*  11              MV      .L2     B7,B4             ; |199| Split a long life
;*  12              MV      .L1X    B7,A7             ; |199| Define a twin register
;*     ||           SHRU    .S1     A7,16,A8          ; |199|  ^ 
;*  13              STB     .D1T1   A8,*+A7(1)        ; |199|  ^ 
;*  14              LDW     .D2T2   *+B5[B16],B5      ; |200|  ^ 
;*  15              LDW     .D2T1   *+DP(_size_pdf),A7 ; |196| 
;*  16              NOP             3
;*  19              SHRU    .S2     B5,8,B5           ; |200|  ^ 
;*     ||           ADD     .L1     1,A6,A6           ; |196| 
;*  20              STB     .D2T2   B5,*+B4(2)        ; |200|  ^ 
;*     ||           MV      .S1     A6,A7             ; |196| Split a long life
;*     ||           CMPGT   .L1     A7,A6,A0          ; |196| 
;*  21              LDBU    .D2T2   *+B6[B17],B4      ; |201|  ^ 
;*     ||   [ A0]   B       .S1     $C$C274           ; |196| 
;*  22              NOP             4
;*  26              STB     .D2T2   B4,*+B8(3)        ; |201|  ^ 
;*     ||           ADD     .L2     4,B9,B9           ; |202| 
;*     ||           ADD     .L1     4,A5,A5           ; |202| Define a twin register
;*     ||           ADD     .S2     1,B16,B16         ; |196| Define a twin register
;*  27              ; BRANCHCC OCCURS {$C$C274}       ; |196| 
;*----------------------------------------------------------------------------*
$C$L27:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L28:    ; PIPED LOOP KERNEL
$C$DW$L$_Task_execute$10$B:
	.dwpsn	file "task.c",line 197,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 27

           SHL     .S2     B16,2,B6          ; |201| <0,0> 
||         LDW     .D1T1   *+A3[A6],A3       ; |196| <0,0>  ^ 

           LDW     .D2T2   *+DP(_pdf_model_full),B5 ; |199| <0,1> 
           NOP             3

           LDW     .D2T2   *+DP(_buf),B4     ; |199| <0,5> 
||         SHRU    .S1     A3,24,A3          ; |196| <0,5>  ^ 

           MV      .L2     B5,B17            ; |201| <0,6> 
||         MV      .L1X    B5,A3             ; |199| <0,6> Define a twin register
||         STB     .D1T1   A3,*+A5[A4]       ; |196| <0,6>  ^ 

           LDW     .D1T1   *+A3[A7],A7       ; |199| <0,7>  ^ 
           NOP             2

           MV      .L1X    B4,A4             ; |201| <0,10> 
||         ADD     .L2     B4,B9,B8          ; |201| <0,10> 
||         ADD     .S2     B9,B4,B7          ; |199| <0,10> 

           MV      .L2     B7,B4             ; |199| <0,11> Split a long life

           MV      .L1X    B7,A7             ; |199| <0,12> Define a twin register
||         SHRU    .S1     A7,16,A8          ; |199| <0,12>  ^ 

           STB     .D1T1   A8,*+A7(1)        ; |199| <0,13>  ^ 
           LDW     .D2T2   *+B5[B16],B5      ; |200| <0,14>  ^ 
           LDW     .D2T1   *+DP(_size_pdf),A7 ; |196| <0,15> 
           NOP             3

           ADD     .L1     1,A6,A6           ; |196| <0,19> 
||         SHRU    .S2     B5,8,B5           ; |200| <0,19>  ^ 

           MV      .S1     A6,A7             ; |196| <0,20> Split a long life
||         CMPGT   .L1     A7,A6,A0          ; |196| <0,20> 
||         STB     .D2T2   B5,*+B4(2)        ; |200| <0,20>  ^ 

   [ A0]   BNOP    .S1     $C$L28,4          ; |196| <0,21> 
||         LDBU    .D2T2   *+B6[B17],B4      ; |201| <0,21>  ^ 

	.dwpsn	file "task.c",line 204,column 0,is_stmt

           ADD     .L1     4,A5,A5           ; |202| <0,26> Define a twin register
||         ADD     .L2     4,B9,B9           ; |202| <0,26> 
||         ADD     .S2     1,B16,B16         ; |196| <0,26> Define a twin register
||         STB     .D2T2   B4,*+B8(3)        ; |201| <0,26>  ^ 

$C$DW$L$_Task_execute$10$E:
;** --------------------------------------------------------------------------*
$C$L29:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$12$B:
;          EXCLUSIVE CPU CYCLES: 1
           RINT                              ; interrupts on
$C$DW$L$_Task_execute$12$E:
;** --------------------------------------------------------------------------*
$C$L30:    
$C$DW$L$_Task_execute$13$B:
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T1   *+DP(_buf),A4     ; |134| 
$C$DW$105	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$105, DW_AT_low_pc(0x00)
	.dwattr $C$DW$105, DW_AT_name("_BCACHE_wb")
	.dwattr $C$DW$105, DW_AT_TI_call

           CALLP   .S2     _BCACHE_wb,B3
||         LDW     .D2T2   *+DP(_bufferSize),B4 ; |134| 
||         MVK     .L1     0x1,A6            ; |134| 

$C$RL13:   ; CALL OCCURS {_BCACHE_wb} {0}    ; |134| 
$C$DW$L$_Task_execute$13$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$14$B:
;          EXCLUSIVE CPU CYCLES: 6
$C$DW$106	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$106, DW_AT_low_pc(0x00)
	.dwattr $C$DW$106, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$106, DW_AT_TI_call

           CALLP   .S2     _NOTIFY_notify,B3
||         MVK     .L1     0x1,A4            ; |147| 
||         ZERO    .L2     B4                ; |147| 
||         MVK     .S1     0x5,A6            ; |147| 
||         MV      .D2     B10,B6            ; |147| 

$C$RL14:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |147| 
$C$DW$L$_Task_execute$14$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$15$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+DP(_runningCode),B4 ; |134| 
           NOP             4
           CMPEQ   .L2     B4,B12,B0         ; |134| 
   [!B0]   B       .S1     $C$L26            ; |134| 
$C$DW$107	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$107, DW_AT_low_pc(0x00)
	.dwattr $C$DW$107, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$107, DW_AT_TI_call
   [!B0]   CALL    .S1     _SEM_pend         ; |135| 
   [!B0]   MV      .L2     B11,B4            ; |135| 
   [!B0]   MV      .L1     A10,A4            ; |135| 
	.dwpsn	file "task.c",line 150,column 0,is_stmt
           NOP             2
           ; BRANCHCC OCCURS {$C$L26}        ; |134| 
$C$DW$L$_Task_execute$15$E:
;** --------------------------------------------------------------------------*
$C$L31:    
;          EXCLUSIVE CPU CYCLES: 7

           MV      .L2X    A11,B3            ; |153| 
||         LDDW    .D2T1   *++SP,A11:A10     ; |153| 

$C$DW$108	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$108, DW_AT_low_pc(0x00)
	.dwattr $C$DW$108, DW_AT_TI_return

           RET     .S2     B3                ; |153| 
||         LDDW    .D2T2   *++SP,B11:B10     ; |153| 

           LDW     .D2T2   *++SP(8),B12      ; |153| 
           ZERO    .L1     A4                ; |152| 
	.dwpsn	file "task.c",line 153,column 1,is_stmt
           NOP             3
           ; BRANCH OCCURS {B3}              ; |153| 

$C$DW$109	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$109, DW_AT_name("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp/task.asm:$C$L26:1:1497092706")
	.dwattr $C$DW$109, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$109, DW_AT_TI_begin_line(0x86)
	.dwattr $C$DW$109, DW_AT_TI_end_line(0x96)
$C$DW$110	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$110, DW_AT_low_pc($C$DW$L$_Task_execute$5$B)
	.dwattr $C$DW$110, DW_AT_high_pc($C$DW$L$_Task_execute$5$E)
$C$DW$111	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$111, DW_AT_low_pc($C$DW$L$_Task_execute$8$B)
	.dwattr $C$DW$111, DW_AT_high_pc($C$DW$L$_Task_execute$8$E)
$C$DW$112	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$112, DW_AT_low_pc($C$DW$L$_Task_execute$6$B)
	.dwattr $C$DW$112, DW_AT_high_pc($C$DW$L$_Task_execute$6$E)
$C$DW$113	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$113, DW_AT_low_pc($C$DW$L$_Task_execute$7$B)
	.dwattr $C$DW$113, DW_AT_high_pc($C$DW$L$_Task_execute$7$E)
$C$DW$114	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$114, DW_AT_low_pc($C$DW$L$_Task_execute$12$B)
	.dwattr $C$DW$114, DW_AT_high_pc($C$DW$L$_Task_execute$12$E)
$C$DW$115	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$115, DW_AT_low_pc($C$DW$L$_Task_execute$13$B)
	.dwattr $C$DW$115, DW_AT_high_pc($C$DW$L$_Task_execute$13$E)
$C$DW$116	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$116, DW_AT_low_pc($C$DW$L$_Task_execute$14$B)
	.dwattr $C$DW$116, DW_AT_high_pc($C$DW$L$_Task_execute$14$E)
$C$DW$117	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$117, DW_AT_low_pc($C$DW$L$_Task_execute$15$B)
	.dwattr $C$DW$117, DW_AT_high_pc($C$DW$L$_Task_execute$15$E)

$C$DW$118	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$118, DW_AT_name("/data/home/in4342-05/ade/assignment2/track-binvalue/dsp/task.asm:$C$L28:2:1497092706")
	.dwattr $C$DW$118, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$118, DW_AT_TI_begin_line(0xc4)
	.dwattr $C$DW$118, DW_AT_TI_end_line(0xcc)
$C$DW$119	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$119, DW_AT_low_pc($C$DW$L$_Task_execute$10$B)
	.dwattr $C$DW$119, DW_AT_high_pc($C$DW$L$_Task_execute$10$E)
	.dwendtag $C$DW$118

	.dwendtag $C$DW$109

	.dwattr $C$DW$95, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$95, DW_AT_TI_end_line(0x99)
	.dwattr $C$DW$95, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$95

	.sect	".text"
	.clink
	.global	_Task_delete

$C$DW$120	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_delete")
	.dwattr $C$DW$120, DW_AT_low_pc(_Task_delete)
	.dwattr $C$DW$120, DW_AT_high_pc(0x00)
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("_Task_delete")
	.dwattr $C$DW$120, DW_AT_external
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$120, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$120, DW_AT_TI_begin_line(0xcf)
	.dwattr $C$DW$120, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$120, DW_AT_frame_base[DW_OP_breg31 8]
	.dwattr $C$DW$120, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 208,column 1,is_stmt,address _Task_delete
$C$DW$121	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$121, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_delete                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,   *
;*                           A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17,B18, *
;*                           B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29,B30, *
;*                           B31                                              *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,DP,SP,A16,A17,A18,A19,A20,A21,A22,*
;*                           A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17,B18, *
;*                           B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29,B30, *
;*                           B31                                              *
;*   Local Frame Size  : 0 Args + 0 Auto + 8 Save = 8 byte                    *
;******************************************************************************
_Task_delete:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _Task_notify,B6   ; |214| 

           STW     .D2T1   A11,*SP--(8)      ; |208| 
||         MVKH    .S2     _Task_notify,B6   ; |214| 
||         MV      .L1     A4,A8             ; |208| 
||         MVK     .S1     0x5,A6            ; |214| 

$C$DW$122	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$122, DW_AT_low_pc(0x04)
	.dwattr $C$DW$122, DW_AT_name("_NOTIFY_unregister")
	.dwattr $C$DW$122, DW_AT_TI_call

           MV      .L1X    B3,A11            ; |208| 
||         CALLP   .S2     _NOTIFY_unregister,B3
||         STW     .D2T1   A10,*+SP(4)       ; |208| 
||         MV      .S1     A4,A10            ; |208| 
||         ZERO    .L2     B4                ; |214| 
||         MVK     .D1     0x1,A4            ; |214| 

$C$RL15:   ; CALL OCCURS {_NOTIFY_unregister} {0}  ; |214| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
$C$DW$123	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$123, DW_AT_low_pc(0x00)
	.dwattr $C$DW$123, DW_AT_name("_MEM_free")
	.dwattr $C$DW$123, DW_AT_TI_call

           CALLP   .S2     _MEM_free,B3
||         MV      .L2X    A10,B4            ; |221| 
||         MV      .L1     A4,A10            ; |214| 
||         LDW     .D2T1   *+DP(_DDR2),A4    ; |221| 
||         MVK     .S1     0x28,A6           ; |221| 

$C$RL16:   ; CALL OCCURS {_MEM_free} {0}     ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L2X    A11,B3            ; |227| 
$C$DW$124	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$124, DW_AT_low_pc(0x00)
	.dwattr $C$DW$124, DW_AT_TI_return

           RET     .S2     B3                ; |227| 
||         MV      .L1     A10,A4            ; |226| 
||         LDW     .D2T1   *+SP(4),A10       ; |227| 

           LDW     .D2T1   *++SP(8),A11      ; |227| 
	.dwpsn	file "task.c",line 227,column 1,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |227| 
	.dwattr $C$DW$120, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$120, DW_AT_TI_end_line(0xe3)
	.dwattr $C$DW$120, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$120

	.sect	".text"
	.clink
	.global	_Task_create

$C$DW$125	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_create")
	.dwattr $C$DW$125, DW_AT_low_pc(_Task_create)
	.dwattr $C$DW$125, DW_AT_high_pc(0x00)
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("_Task_create")
	.dwattr $C$DW$125, DW_AT_external
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$125, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$125, DW_AT_TI_begin_line(0x31)
	.dwattr $C$DW$125, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$125, DW_AT_frame_base[DW_OP_breg31 16]
	.dwattr $C$DW$125, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 50,column 1,is_stmt,address _Task_create
$C$DW$126	.dwtag  DW_TAG_formal_parameter, DW_AT_name("infoPtr")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("_infoPtr")
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$84)
	.dwattr $C$DW$126, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_create                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B13,SP,A16,A17,A18,A19,A20,A21,   *
;*                           A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17, *
;*                           B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29, *
;*                           B30,B31                                          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B13,DP,SP,A16,A17,A18,A19,A20,A21,*
;*                           A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17, *
;*                           B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29, *
;*                           B30,B31                                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 16 Save = 16 byte                  *
;******************************************************************************
_Task_create:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           STW     .D2T2   B13,*SP--(8)      ; |50| 

           STDW    .D2T1   A11:A10,*SP--     ; |50| 
||         ZERO    .L2     B6                ; |58| 
||         MVK     .S2     0x28,B4           ; |58| 

$C$DW$127	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$127, DW_AT_low_pc(0x04)
	.dwattr $C$DW$127, DW_AT_name("_MEM_valloc")
	.dwattr $C$DW$127, DW_AT_TI_call

           MV      .L2     B3,B13            ; |50| 
||         CALLP   .S2     _MEM_valloc,B3
||         MV      .L1     A4,A11            ; |50| 
||         LDW     .D2T1   *+DP(_DDR2),A4    ; |58| 
||         ZERO    .S1     A6                ; |58| 

$C$RL17:   ; CALL OCCURS {_MEM_valloc} {0}   ; |58| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MV      .L1     A4,A0             ; |61| 
||         STW     .D1T1   A4,*A11           ; |58| 
||         MVK     .S1     0x1,A11           ; |63| 
||         LDHU    .D2T2   *+DP(_MPCSXFER_BufferSize),B5 ; |72| 
||         MVKL    .S2     _Task_notify,B6   ; |85| 
||         ZERO    .L2     B4                ; |74| 

   [ A0]   ZERO    .L1     A11               ; |51| 
||         ZERO    .D1     A10               ; |52| 
||         MVKH    .S2     _Task_notify,B6   ; |85| 
||         ZERO    .L2     B8                ; |74| 
||         MVKL    .S1     __SEM_dopost,A5
||         ZERO    .D2     B7                ; |74| 

   [ A0]   MV      .L1     A0,A10            ; |67| 
||         MV      .S1     A11,A0            ; |85| 
||         MVK     .D1     0x5,A6            ; |85| 

           MVK     .L1     0x1,A4            ; |85| 
|| [ A0]   ZERO    .L2     B4                ; |102| 
|| [ A0]   ZERO    .S2     B6                ; |102| 
||         ADD     .D1     A10,24,A3         ; |87| 
||         MVKH    .S1     __SEM_dopost,A5

   [ A0]   B       .S2     $C$L32            ; |72| 
|| [ A0]   MVK     .L1     0x5,A6            ; |102| 
|| [ A0]   MVK     .S1     0x1,A4            ; |102| 
||         MV      .D1     A10,A8            ; |85| 

   [ A0]   BNOP    .S1     $C$L34,3          ; |100| 
|| [!A0]   STW     .D1T2   B8,*+A10(20)      ; |86| 

$C$DW$128	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$128, DW_AT_low_pc(0x00)
	.dwattr $C$DW$128, DW_AT_name("_NOTIFY_register")
	.dwattr $C$DW$128, DW_AT_TI_call

   [!A0]   CALL    .S1     _NOTIFY_register  ; |85| 
|| [!A0]   STW     .D1T2   B5,*+A10(36)      ; |75| 

           ; BRANCHCC OCCURS {$C$L32}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           STW     .D1T2   B7,*A10           ; |74| 
           STW     .D1T1   A5,*+A10(16)      ; |89| 
           STW     .D1T2   B8,*+A10(12)      ; |88| 
           STW     .D1T1   A3,*+A10(24)      ; |87| 

           STW     .D1T1   A3,*+A10(28)      ; |87| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |85| 

$C$RL18:   ; CALL OCCURS {_NOTIFY_register} {0}  ; |85| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MV      .L1     A4,A0             ; |85| 
||         MV      .S1     A4,A11            ; |85| 

   [ A0]   BNOP    .S1     $C$L33,5          ; |85| 
|| [!A0]   MVK     .L1     0x1,A4            ; |102| 
|| [!A0]   ZERO    .L2     B6                ; |102| 
|| [!A0]   ZERO    .S2     B4                ; |102| 
|| [!A0]   MVK     .D1     0x5,A6            ; |102| 

           ; BRANCHCC OCCURS {$C$L33}        ; |85| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
   [ A0]   BNOP    .S1     $C$L34,4          ; |100| 
;** --------------------------------------------------------------------------*
$C$L32:    
;          EXCLUSIVE CPU CYCLES: 1
$C$DW$129	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$129, DW_AT_low_pc(0x00)
	.dwattr $C$DW$129, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$129, DW_AT_TI_call
   [!A0]   CALL    .S1     _NOTIFY_notify    ; |102| 
           ; BRANCHCC OCCURS {$C$L34}        ; |100| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           ADDKPC  .S2     $C$RL19,B3,4      ; |102| 
$C$RL19:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |102| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L1     A4,A0             ; |102| 
   [!A0]   B       .S1     $C$L35            ; |102| 
$C$DW$130	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$130, DW_AT_low_pc(0x00)
	.dwattr $C$DW$130, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$130, DW_AT_TI_call
   [!A0]   CALL    .S1     _SEM_pend         ; |110| 
           MV      .L1     A4,A11            ; |102| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L35}        ; |102| 
;** --------------------------------------------------------------------------*
$C$L33:    
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L2     B13,B3            ; |117| 
$C$DW$131	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$131, DW_AT_low_pc(0x00)
	.dwattr $C$DW$131, DW_AT_TI_return

           RET     .S2     B3                ; |117| 
||         LDDW    .D2T1   *++SP,A11:A10     ; |117| 

           LDW     .D2T2   *++SP(8),B13      ; |117| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |117| 
;** --------------------------------------------------------------------------*
$C$L34:    
;          EXCLUSIVE CPU CYCLES: 5
$C$DW$132	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$132, DW_AT_low_pc(0x00)
	.dwattr $C$DW$132, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$132, DW_AT_TI_call
           CALL    .S1     _SEM_pend         ; |110| 
           NOP             4
;** --------------------------------------------------------------------------*
$C$L35:    
;          EXCLUSIVE CPU CYCLES: 1

           ADD     .L1     4,A10,A4          ; |110| 
||         ADD     .S1     4,A10,A10         ; |110| 
||         MVK     .L2     0xffffffff,B4     ; |110| 
||         ADDKPC  .S2     $C$RL20,B3,0      ; |110| 

$C$RL20:   ; CALL OCCURS {_SEM_pend} {0}     ; |110| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
$C$DW$133	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$133, DW_AT_low_pc(0x00)
	.dwattr $C$DW$133, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$133, DW_AT_TI_call

           CALLP   .S2     _SEM_pend,B3
||         MV      .L1     A10,A4            ; |112| 
||         MVK     .L2     0xffffffff,B4     ; |112| 

$C$RL21:   ; CALL OCCURS {_SEM_pend} {0}     ; |112| 
$C$DW$134	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$134, DW_AT_low_pc(0x00)
	.dwattr $C$DW$134, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$134, DW_AT_TI_call

           CALLP   .S2     _SEM_pend,B3
||         MV      .L1     A10,A4            ; |114| 
||         MVK     .L2     0xffffffff,B4     ; |114| 

$C$RL22:   ; CALL OCCURS {_SEM_pend} {0}     ; |114| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L2     B13,B3            ; |117| 
$C$DW$135	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$135, DW_AT_low_pc(0x00)
	.dwattr $C$DW$135, DW_AT_TI_return

           RET     .S2     B3                ; |117| 
||         MV      .L1     A11,A4            ; |114| 
||         LDDW    .D2T1   *++SP,A11:A10     ; |117| 

           LDW     .D2T2   *++SP(8),B13      ; |117| 
	.dwpsn	file "task.c",line 117,column 1,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |117| 
	.dwattr $C$DW$125, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$125, DW_AT_TI_end_line(0x75)
	.dwattr $C$DW$125, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$125

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
	.global	_malloc
	.global	_DDR2
	.global	_MPCSXFER_BufferSize

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
$C$DW$136	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$24)
	.dwendtag $C$DW$T$25

$C$DW$T$26	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$26, DW_AT_address_class(0x20)
$C$DW$T$27	.dwtag  DW_TAG_typedef, DW_AT_name("KNL_Fxn")
	.dwattr $C$DW$T$27, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$27, DW_AT_language(DW_LANG_C)

$C$DW$T$58	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$58, DW_AT_language(DW_LANG_C)
$C$DW$137	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$37)
$C$DW$138	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$41)
$C$DW$139	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$41)
	.dwendtag $C$DW$T$58

$C$DW$T$59	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$59, DW_AT_address_class(0x20)
$C$DW$T$60	.dwtag  DW_TAG_typedef, DW_AT_name("FnNotifyCbck")
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$T$60, DW_AT_language(DW_LANG_C)
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
$C$DW$T$66	.dwtag  DW_TAG_typedef, DW_AT_name("Uint8")
	.dwattr $C$DW$T$66, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$66, DW_AT_language(DW_LANG_C)
$C$DW$T$67	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$67, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$T$67, DW_AT_address_class(0x20)
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
$C$DW$T$61	.dwtag  DW_TAG_typedef, DW_AT_name("Bool")
	.dwattr $C$DW$T$61, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$61, DW_AT_language(DW_LANG_C)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$22	.dwtag  DW_TAG_typedef, DW_AT_name("Int")
	.dwattr $C$DW$T$22, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$37	.dwtag  DW_TAG_typedef, DW_AT_name("Uint32")
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
$C$DW$T$97	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$97, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$T$97, DW_AT_address_class(0x20)
$C$DW$T$42	.dwtag  DW_TAG_typedef, DW_AT_name("size_t")
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$42, DW_AT_language(DW_LANG_C)
$C$DW$T$73	.dwtag  DW_TAG_typedef, DW_AT_name("Uns")
	.dwattr $C$DW$T$73, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$73, DW_AT_language(DW_LANG_C)
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
$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$140, DW_AT_name("next")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("_next")
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$141, DW_AT_name("prev")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("_prev")
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
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
$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$142, DW_AT_name("wListElem")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("_wListElem")
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$143, DW_AT_name("wCount")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("_wCount")
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$144, DW_AT_name("fxn")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("_fxn")
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
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

$C$DW$T$33	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$33, DW_AT_name("SEM_Obj")
	.dwattr $C$DW$T$33, DW_AT_byte_size(0x20)
$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$145, DW_AT_name("job")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("_job")
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$146, DW_AT_name("count")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("_count")
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$147, DW_AT_name("pendQ")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("_pendQ")
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$148, DW_AT_name("name")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("_name")
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$33

$C$DW$T$36	.dwtag  DW_TAG_typedef, DW_AT_name("SEM_Obj")
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$36, DW_AT_language(DW_LANG_C)
$C$DW$T$53	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$53, DW_AT_address_class(0x20)
$C$DW$T$54	.dwtag  DW_TAG_typedef, DW_AT_name("SEM_Handle")
	.dwattr $C$DW$T$54, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$54, DW_AT_language(DW_LANG_C)

$C$DW$T$38	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$38, DW_AT_name("Task_TransferInfo_tag")
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x28)
$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$149, DW_AT_name("dataBuf")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("_dataBuf")
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$150, DW_AT_name("notifySemObj")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("_notifySemObj")
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$151, DW_AT_name("bufferSize")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("_bufferSize")
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$38

$C$DW$T$82	.dwtag  DW_TAG_typedef, DW_AT_name("Task_TransferInfo")
	.dwattr $C$DW$T$82, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$82, DW_AT_language(DW_LANG_C)
$C$DW$T$83	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$83, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$83, DW_AT_address_class(0x20)
$C$DW$T$84	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$84, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$T$84, DW_AT_address_class(0x20)

$C$DW$T$40	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$40, DW_AT_name("Rect_tag")
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x08)
$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$152, DW_AT_name("x")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("_x")
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$153, DW_AT_name("y")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("_y")
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$154, DW_AT_name("width")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("_width")
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$155, DW_AT_name("height")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("_height")
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x6]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$40

$C$DW$T$105	.dwtag  DW_TAG_typedef, DW_AT_name("Rect")
	.dwattr $C$DW$T$105, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$T$105, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$156	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A0")
	.dwattr $C$DW$156, DW_AT_location[DW_OP_reg0]
$C$DW$157	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A1")
	.dwattr $C$DW$157, DW_AT_location[DW_OP_reg1]
$C$DW$158	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A2")
	.dwattr $C$DW$158, DW_AT_location[DW_OP_reg2]
$C$DW$159	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A3")
	.dwattr $C$DW$159, DW_AT_location[DW_OP_reg3]
$C$DW$160	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A4")
	.dwattr $C$DW$160, DW_AT_location[DW_OP_reg4]
$C$DW$161	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A5")
	.dwattr $C$DW$161, DW_AT_location[DW_OP_reg5]
$C$DW$162	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A6")
	.dwattr $C$DW$162, DW_AT_location[DW_OP_reg6]
$C$DW$163	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A7")
	.dwattr $C$DW$163, DW_AT_location[DW_OP_reg7]
$C$DW$164	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A8")
	.dwattr $C$DW$164, DW_AT_location[DW_OP_reg8]
$C$DW$165	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A9")
	.dwattr $C$DW$165, DW_AT_location[DW_OP_reg9]
$C$DW$166	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A10")
	.dwattr $C$DW$166, DW_AT_location[DW_OP_reg10]
$C$DW$167	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A11")
	.dwattr $C$DW$167, DW_AT_location[DW_OP_reg11]
$C$DW$168	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A12")
	.dwattr $C$DW$168, DW_AT_location[DW_OP_reg12]
$C$DW$169	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A13")
	.dwattr $C$DW$169, DW_AT_location[DW_OP_reg13]
$C$DW$170	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A14")
	.dwattr $C$DW$170, DW_AT_location[DW_OP_reg14]
$C$DW$171	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A15")
	.dwattr $C$DW$171, DW_AT_location[DW_OP_reg15]
$C$DW$172	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B0")
	.dwattr $C$DW$172, DW_AT_location[DW_OP_reg16]
$C$DW$173	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B1")
	.dwattr $C$DW$173, DW_AT_location[DW_OP_reg17]
$C$DW$174	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B2")
	.dwattr $C$DW$174, DW_AT_location[DW_OP_reg18]
$C$DW$175	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B3")
	.dwattr $C$DW$175, DW_AT_location[DW_OP_reg19]
$C$DW$176	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B4")
	.dwattr $C$DW$176, DW_AT_location[DW_OP_reg20]
$C$DW$177	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B5")
	.dwattr $C$DW$177, DW_AT_location[DW_OP_reg21]
$C$DW$178	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B6")
	.dwattr $C$DW$178, DW_AT_location[DW_OP_reg22]
$C$DW$179	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B7")
	.dwattr $C$DW$179, DW_AT_location[DW_OP_reg23]
$C$DW$180	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B8")
	.dwattr $C$DW$180, DW_AT_location[DW_OP_reg24]
$C$DW$181	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B9")
	.dwattr $C$DW$181, DW_AT_location[DW_OP_reg25]
$C$DW$182	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B10")
	.dwattr $C$DW$182, DW_AT_location[DW_OP_reg26]
$C$DW$183	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B11")
	.dwattr $C$DW$183, DW_AT_location[DW_OP_reg27]
$C$DW$184	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B12")
	.dwattr $C$DW$184, DW_AT_location[DW_OP_reg28]
$C$DW$185	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B13")
	.dwattr $C$DW$185, DW_AT_location[DW_OP_reg29]
$C$DW$186	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DP")
	.dwattr $C$DW$186, DW_AT_location[DW_OP_reg30]
$C$DW$187	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SP")
	.dwattr $C$DW$187, DW_AT_location[DW_OP_reg31]
$C$DW$188	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FP")
	.dwattr $C$DW$188, DW_AT_location[DW_OP_regx 0x20]
$C$DW$189	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC")
	.dwattr $C$DW$189, DW_AT_location[DW_OP_regx 0x21]
$C$DW$190	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IRP")
	.dwattr $C$DW$190, DW_AT_location[DW_OP_regx 0x22]
$C$DW$191	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IFR")
	.dwattr $C$DW$191, DW_AT_location[DW_OP_regx 0x23]
$C$DW$192	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NRP")
	.dwattr $C$DW$192, DW_AT_location[DW_OP_regx 0x24]
$C$DW$193	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A16")
	.dwattr $C$DW$193, DW_AT_location[DW_OP_regx 0x25]
$C$DW$194	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A17")
	.dwattr $C$DW$194, DW_AT_location[DW_OP_regx 0x26]
$C$DW$195	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A18")
	.dwattr $C$DW$195, DW_AT_location[DW_OP_regx 0x27]
$C$DW$196	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A19")
	.dwattr $C$DW$196, DW_AT_location[DW_OP_regx 0x28]
$C$DW$197	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A20")
	.dwattr $C$DW$197, DW_AT_location[DW_OP_regx 0x29]
$C$DW$198	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A21")
	.dwattr $C$DW$198, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$199	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A22")
	.dwattr $C$DW$199, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$200	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A23")
	.dwattr $C$DW$200, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$201	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A24")
	.dwattr $C$DW$201, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$202	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A25")
	.dwattr $C$DW$202, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$203	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A26")
	.dwattr $C$DW$203, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$204	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A27")
	.dwattr $C$DW$204, DW_AT_location[DW_OP_regx 0x30]
$C$DW$205	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A28")
	.dwattr $C$DW$205, DW_AT_location[DW_OP_regx 0x31]
$C$DW$206	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A29")
	.dwattr $C$DW$206, DW_AT_location[DW_OP_regx 0x32]
$C$DW$207	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A30")
	.dwattr $C$DW$207, DW_AT_location[DW_OP_regx 0x33]
$C$DW$208	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A31")
	.dwattr $C$DW$208, DW_AT_location[DW_OP_regx 0x34]
$C$DW$209	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B16")
	.dwattr $C$DW$209, DW_AT_location[DW_OP_regx 0x35]
$C$DW$210	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B17")
	.dwattr $C$DW$210, DW_AT_location[DW_OP_regx 0x36]
$C$DW$211	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B18")
	.dwattr $C$DW$211, DW_AT_location[DW_OP_regx 0x37]
$C$DW$212	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B19")
	.dwattr $C$DW$212, DW_AT_location[DW_OP_regx 0x38]
$C$DW$213	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B20")
	.dwattr $C$DW$213, DW_AT_location[DW_OP_regx 0x39]
$C$DW$214	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B21")
	.dwattr $C$DW$214, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$215	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B22")
	.dwattr $C$DW$215, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$216	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B23")
	.dwattr $C$DW$216, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$217	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B24")
	.dwattr $C$DW$217, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$218	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B25")
	.dwattr $C$DW$218, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$219	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B26")
	.dwattr $C$DW$219, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$220	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B27")
	.dwattr $C$DW$220, DW_AT_location[DW_OP_regx 0x40]
$C$DW$221	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B28")
	.dwattr $C$DW$221, DW_AT_location[DW_OP_regx 0x41]
$C$DW$222	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B29")
	.dwattr $C$DW$222, DW_AT_location[DW_OP_regx 0x42]
$C$DW$223	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B30")
	.dwattr $C$DW$223, DW_AT_location[DW_OP_regx 0x43]
$C$DW$224	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B31")
	.dwattr $C$DW$224, DW_AT_location[DW_OP_regx 0x44]
$C$DW$225	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("AMR")
	.dwattr $C$DW$225, DW_AT_location[DW_OP_regx 0x45]
$C$DW$226	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CSR")
	.dwattr $C$DW$226, DW_AT_location[DW_OP_regx 0x46]
$C$DW$227	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISR")
	.dwattr $C$DW$227, DW_AT_location[DW_OP_regx 0x47]
$C$DW$228	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ICR")
	.dwattr $C$DW$228, DW_AT_location[DW_OP_regx 0x48]
$C$DW$229	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IER")
	.dwattr $C$DW$229, DW_AT_location[DW_OP_regx 0x49]
$C$DW$230	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISTP")
	.dwattr $C$DW$230, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$231	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IN")
	.dwattr $C$DW$231, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$232	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OUT")
	.dwattr $C$DW$232, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$233	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ACR")
	.dwattr $C$DW$233, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$234	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ADR")
	.dwattr $C$DW$234, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$235	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FADCR")
	.dwattr $C$DW$235, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$236	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FAUCR")
	.dwattr $C$DW$236, DW_AT_location[DW_OP_regx 0x50]
$C$DW$237	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FMCR")
	.dwattr $C$DW$237, DW_AT_location[DW_OP_regx 0x51]
$C$DW$238	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GFPGFR")
	.dwattr $C$DW$238, DW_AT_location[DW_OP_regx 0x52]
$C$DW$239	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DIER")
	.dwattr $C$DW$239, DW_AT_location[DW_OP_regx 0x53]
$C$DW$240	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("REP")
	.dwattr $C$DW$240, DW_AT_location[DW_OP_regx 0x54]
$C$DW$241	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCL")
	.dwattr $C$DW$241, DW_AT_location[DW_OP_regx 0x55]
$C$DW$242	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCH")
	.dwattr $C$DW$242, DW_AT_location[DW_OP_regx 0x56]
$C$DW$243	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ARP")
	.dwattr $C$DW$243, DW_AT_location[DW_OP_regx 0x57]
$C$DW$244	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ILC")
	.dwattr $C$DW$244, DW_AT_location[DW_OP_regx 0x58]
$C$DW$245	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RILC")
	.dwattr $C$DW$245, DW_AT_location[DW_OP_regx 0x59]
$C$DW$246	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DNUM")
	.dwattr $C$DW$246, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$247	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SSR")
	.dwattr $C$DW$247, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$248	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYA")
	.dwattr $C$DW$248, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$249	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYB")
	.dwattr $C$DW$249, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$250	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSR")
	.dwattr $C$DW$250, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$251	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ITSR")
	.dwattr $C$DW$251, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$252	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NTSR")
	.dwattr $C$DW$252, DW_AT_location[DW_OP_regx 0x60]
$C$DW$253	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("EFR")
	.dwattr $C$DW$253, DW_AT_location[DW_OP_regx 0x61]
$C$DW$254	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ECR")
	.dwattr $C$DW$254, DW_AT_location[DW_OP_regx 0x62]
$C$DW$255	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IERR")
	.dwattr $C$DW$255, DW_AT_location[DW_OP_regx 0x63]
$C$DW$256	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DMSG")
	.dwattr $C$DW$256, DW_AT_location[DW_OP_regx 0x64]
$C$DW$257	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CMSG")
	.dwattr $C$DW$257, DW_AT_location[DW_OP_regx 0x65]
$C$DW$258	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_ADDR")
	.dwattr $C$DW$258, DW_AT_location[DW_OP_regx 0x66]
$C$DW$259	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_DATA")
	.dwattr $C$DW$259, DW_AT_location[DW_OP_regx 0x67]
$C$DW$260	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_CNTL")
	.dwattr $C$DW$260, DW_AT_location[DW_OP_regx 0x68]
$C$DW$261	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCU_CNTL")
	.dwattr $C$DW$261, DW_AT_location[DW_OP_regx 0x69]
$C$DW$262	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_REC_CNTL")
	.dwattr $C$DW$262, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$263	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_XMT_CNTL")
	.dwattr $C$DW$263, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$264	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_CFG")
	.dwattr $C$DW$264, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$265	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RDATA")
	.dwattr $C$DW$265, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$266	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WDATA")
	.dwattr $C$DW$266, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$267	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RADDR")
	.dwattr $C$DW$267, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$268	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WADDR")
	.dwattr $C$DW$268, DW_AT_location[DW_OP_regx 0x70]
$C$DW$269	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("MFREG0")
	.dwattr $C$DW$269, DW_AT_location[DW_OP_regx 0x71]
$C$DW$270	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DBG_STAT")
	.dwattr $C$DW$270, DW_AT_location[DW_OP_regx 0x72]
$C$DW$271	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("BRK_EN")
	.dwattr $C$DW$271, DW_AT_location[DW_OP_regx 0x73]
$C$DW$272	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0_CNT")
	.dwattr $C$DW$272, DW_AT_location[DW_OP_regx 0x74]
$C$DW$273	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0")
	.dwattr $C$DW$273, DW_AT_location[DW_OP_regx 0x75]
$C$DW$274	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP1")
	.dwattr $C$DW$274, DW_AT_location[DW_OP_regx 0x76]
$C$DW$275	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP2")
	.dwattr $C$DW$275, DW_AT_location[DW_OP_regx 0x77]
$C$DW$276	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP3")
	.dwattr $C$DW$276, DW_AT_location[DW_OP_regx 0x78]
$C$DW$277	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OVERLAY")
	.dwattr $C$DW$277, DW_AT_location[DW_OP_regx 0x79]
$C$DW$278	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC_PROF")
	.dwattr $C$DW$278, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$279	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ATSR")
	.dwattr $C$DW$279, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$280	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TRR")
	.dwattr $C$DW$280, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$281	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCRR")
	.dwattr $C$DW$281, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$282	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DESR")
	.dwattr $C$DW$282, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$283	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DETR")
	.dwattr $C$DW$283, DW_AT_location[DW_OP_regx 0x7f]
$C$DW$284	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$284, DW_AT_location[DW_OP_regx 0xe4]
	.dwendtag $C$DW$CU

