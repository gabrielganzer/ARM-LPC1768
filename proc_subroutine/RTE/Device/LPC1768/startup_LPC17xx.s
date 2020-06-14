;/**************************************************************************//**
; * @file     startup_LPC17xx.s
; * @brief    CMSIS Cortex-M3 Core Device Startup File for
; *           NXP LPC17xx Device Series
; * @version  V1.10
; * @date     06. April 2011
; *
; * @note
; * Copyright (C) 2009-2011 ARM Limited. All rights reserved.
; *
; * @par
; * ARM Limited (ARM) is supplying this software for use with Cortex-M
; * processor based microcontrollers.  This file can be freely distributed
; * within development tools that are supporting such ARM based processors.
; *
; * @par
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; ******************************************************************************/

; *------- <<< Use Configuration Wizard in Context Menu >>> ------------------

; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000200

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000000

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts
                DCD     WDT_IRQHandler            ; 16: Watchdog Timer
                DCD     TIMER0_IRQHandler         ; 17: Timer0
                DCD     TIMER1_IRQHandler         ; 18: Timer1
                DCD     TIMER2_IRQHandler         ; 19: Timer2
                DCD     TIMER3_IRQHandler         ; 20: Timer3
                DCD     UART0_IRQHandler          ; 21: UART0
                DCD     UART1_IRQHandler          ; 22: UART1
                DCD     UART2_IRQHandler          ; 23: UART2
                DCD     UART3_IRQHandler          ; 24: UART3
                DCD     PWM1_IRQHandler           ; 25: PWM1
                DCD     I2C0_IRQHandler           ; 26: I2C0
                DCD     I2C1_IRQHandler           ; 27: I2C1
                DCD     I2C2_IRQHandler           ; 28: I2C2
                DCD     SPI_IRQHandler            ; 29: SPI
                DCD     SSP0_IRQHandler           ; 30: SSP0
                DCD     SSP1_IRQHandler           ; 31: SSP1
                DCD     PLL0_IRQHandler           ; 32: PLL0 Lock (Main PLL)
                DCD     RTC_IRQHandler            ; 33: Real Time Clock
                DCD     EINT0_IRQHandler          ; 34: External Interrupt 0
                DCD     EINT1_IRQHandler          ; 35: External Interrupt 1
                DCD     EINT2_IRQHandler          ; 36: External Interrupt 2
                DCD     EINT3_IRQHandler          ; 37: External Interrupt 3
                DCD     ADC_IRQHandler            ; 38: A/D Converter
                DCD     BOD_IRQHandler            ; 39: Brown-Out Detect
                DCD     USB_IRQHandler            ; 40: USB
                DCD     CAN_IRQHandler            ; 41: CAN
                DCD     DMA_IRQHandler            ; 42: General Purpose DMA
                DCD     I2S_IRQHandler            ; 43: I2S
                DCD     ENET_IRQHandler           ; 44: Ethernet
                DCD     RIT_IRQHandler            ; 45: Repetitive Interrupt Timer
                DCD     MCPWM_IRQHandler          ; 46: Motor Control PWM
                DCD     QEI_IRQHandler            ; 47: Quadrature Encoder Interface
                DCD     PLL1_IRQHandler           ; 48: PLL1 Lock (USB PLL)
                DCD     USBActivity_IRQHandler    ; 49: USB Activity interrupt to wakeup
                DCD     CANActivity_IRQHandler    ; 50: CAN Activity interrupt to wakeup


                IF      :LNOT::DEF:NO_CRP
                AREA    |.ARM.__at_0x02FC|, CODE, READONLY
CRP_Key         DCD     0xFFFFFFFF
                ENDIF
; ************************************ DATA AREA *************************************
; --------------------------------------- EX 2 ---------------------------------------
				AREA	myData, DATA, READWRITE
mySpace			SPACE	12
				
                AREA    |.text|, CODE, READONLY


; ********************************** RESET HANDLER ***********************************
Reset_Handler   PROC
                EXPORT  Reset_Handler					[WEAK]
; --------------------------------------- EX 1 ---------------------------------------
;				MOV r0, #0x458D
;				MOVT r0, #0x7A30
;				MOV r1, #0x9EAA
;				MOVT r1, #0xC315
;				BL myUADD8
;stop B stop
;				ENDP
; --------------------------------------- EX 2 ---------------------------------------
;				MOV r0, #0x458D
;				MOVT r0, #0x7A30
;				MOV r1, #0x9EAA
;				MOVT r1, #0xC315
;				LDR r6, =mySpace
;				STMIA r6, {r0, r1}
;				BL myUSAD8
;				LDR r2, [r6]
;stop B stop
;				ENDP
; --------------------------------------- EX 3 ---------------------------------------
;				MOV r0, #0x458D
;				MOVT r0, #0x7A30
;				MOV r1, #0x9EAA
;				MOVT r1, #0xC315
;				PUSH {r0, r1, r2}
;				BL mySMUSD
;				POP {r0, r1, r2}
;				PUSH {r0, r1, r2}
;				BL mySMUSD
;				POP {r0, r1, r2}
;stop B stop
;				ENDP
; --------------------------------------- EX 4 ---------------------------------------
;				MOV r0, #0x458D
;				MOVT r0, #0x7A30
;				MOV r1, #0x9EAA
;				MOVT r1, #0xC315
;supervisorCall
;				PUSH {r0, r1, r2}
;				SVC #3
;				POP {r0, r1, r2}
;				PUSH {r0, r1, r2}
;				SVC #8
;				POP {r0, r1, r2}
;stop B stop
;				ENDP
; --------------------------------------- EX 5 ---------------------------------------
;				EXTERN  __main         
;                LDR     R0, =__main
;                BX      R0
;				
;                ENDP
; --------------------------------------- EX 6 ---------------------------------------  				
;				EXTERN hypotenuse
;				MOV r0, #5 ; first parameter
;				MOV r1, #5 ; first parameter
;				BL hypotenuse
;               ENDP

; *********************************** SUBROUTINES ************************************
; --------------------------------------- EX 1 ---------------------------------------
myUADD8			PROC
				EXPORT  myUADD8
				PUSH {LR}
				;1st byte
				ADD r2, r0, r1
				LSL r2, r2, #24
				LSR r2, r2, #24
				;2nd byte
				ROR r0, r0, #8
				ROR r1, r1, #8
				ADD r3, r0, r1
				LSL r3, r3, #24
				LSR r3, r3, #16
				;3rd byte
				ROR r0, r0, #8
				ROR r1, r1, #8
				ADD r4, r0, r1
				LSL r4, r4, #24
				LSR r4, r4, #8
				;4th byte
				ROR r0, r0, #8
				ROR r1, r1, #8
				ADD r5, r0, r1
				LSL r5, r5, #24
				;Result
				ORR r0, r2, r3
				ORR r1, r4, r5
				ORR r0, r0, r1
				POP{PC}
				ENDP
; --------------------------------------- EX 2 ---------------------------------------
myUSAD8			PROC
				EXPORT  myUSAD8
				PUSH {r0, r1, r2, r3, r12, LR}
subtracLoop
				ADD r12, r12, #1
				LDRSB r0, [r6], #4
				LDRSB r1, [r6], #-3
				CMP r0, r1
				ITE HS
				SUBHS r2, r0, r1
				SUBLO r2, r1, r0
				ADD r3, r2, r3
				CMP r12, #4
				BNE subtracLoop
				MOV r12, #0x000000FF
				AND r3, r12, r3
				STRB r3, [r6, #4]!
				POP {r0, r1, r2, r3, r12, PC}
				ENDP
; --------------------------------------- EX 3 ---------------------------------------
mySMUAD			PROC
				EXPORT  mySMUAD
				PUSH {r4, r5, r6, LR}
				LDRSH r4, [sp, #16]
				LDRSH r5, [sp, #20]
				MUL r6, r4, r5
				LDRSH r4, [sp, #18]
				LDRSH r5, [sp, #22]
				MUL r5, r4, r5
				ADD r4, r5, r6
				STR r4, [sp, #24]
				POP {r4, r5, r6, PC}
				ENDP

mySMUSD			PROC
				EXPORT  mySMUSD
				PUSH {r4, r5, r6, LR}
				LDRSH r4, [sp, #16]
				LDRSH r5, [sp, #20]
				MUL r6, r4, r5
				LDRSH r4, [sp, #18]
				LDRSH r5, [sp, #22]
				MUL r5, r4, r5
				CMP r6, r5
				ITE HS
				SUBHS r4, r6, r5
				SUBLO r4, r5, r6
				STR r4, [sp, #24]
				POP {r4, r5, r6, PC}
				ENDP

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                
				TST LR, #0x4 		; Test EXC_RETURN number in LR bit 2
				ITE EQ 				; if zero (equal) then
				MRSEQ r0, MSP 		; Main Stack was used, put MSP in R0
				MRSNE r0, PSP 		; else, Process Stack was used, put PSP in R0
				LDR r1, [r0, #24]	; Get stacked PC from stack
				LDRB r0, [r1, #-2]	; Get the immediate data from the instruction
				
				CMP r0, #3
				BEQ	smuadSVC_Handler
				CMP r0, #8
				BEQ	smusdSVC_Handler
				B endSVC_Handler
smuadSVC_Handler
				PUSH {r4, r5, r6}
				LDRSH r4, [sp, #48]
				LDRSH r5, [sp, #52]
				MUL r6, r4, r5
				LDRSH r4, [sp, #50]
				LDRSH r5, [sp, #54]
				MUL r5, r4, r5
				ADD r4, r5, r6
				STR r4, [sp, #56]
				POP {r4, r5, r6}
				B endSVC_Handler
smusdSVC_Handler
				PUSH {r4, r5, r6}
				LDRSH r4, [sp, #48]
				LDRSH r5, [sp, #52]
				MUL r6, r4, r5
				LDRSH r4, [sp, #50]
				LDRSH r5, [sp, #54]
				MUL r5, r4, r5
				CMP r6, r5
				ITE HS
				SUBHS r4, r6, r5
				SUBLO r4, r5, r6
				STR r4, [sp, #56]
				POP {r4, r5, r6}
				B endSVC_Handler
endSVC_Handler	BX LR ; Return to calling function
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

Default_Handler PROC

                EXPORT  WDT_IRQHandler            [WEAK]
                EXPORT  TIMER0_IRQHandler         [WEAK]
                EXPORT  TIMER1_IRQHandler         [WEAK]
                EXPORT  TIMER2_IRQHandler         [WEAK]
                EXPORT  TIMER3_IRQHandler         [WEAK]
                EXPORT  UART0_IRQHandler          [WEAK]
                EXPORT  UART1_IRQHandler          [WEAK]
                EXPORT  UART2_IRQHandler          [WEAK]
                EXPORT  UART3_IRQHandler          [WEAK]
                EXPORT  PWM1_IRQHandler           [WEAK]
                EXPORT  I2C0_IRQHandler           [WEAK]
                EXPORT  I2C1_IRQHandler           [WEAK]
                EXPORT  I2C2_IRQHandler           [WEAK]
                EXPORT  SPI_IRQHandler            [WEAK]
                EXPORT  SSP0_IRQHandler           [WEAK]
                EXPORT  SSP1_IRQHandler           [WEAK]
                EXPORT  PLL0_IRQHandler           [WEAK]
                EXPORT  RTC_IRQHandler            [WEAK]
                EXPORT  EINT0_IRQHandler          [WEAK]
                EXPORT  EINT1_IRQHandler          [WEAK]
                EXPORT  EINT2_IRQHandler          [WEAK]
                EXPORT  EINT3_IRQHandler          [WEAK]
                EXPORT  ADC_IRQHandler            [WEAK]
                EXPORT  BOD_IRQHandler            [WEAK]
                EXPORT  USB_IRQHandler            [WEAK]
                EXPORT  CAN_IRQHandler            [WEAK]
                EXPORT  DMA_IRQHandler            [WEAK]
                EXPORT  I2S_IRQHandler            [WEAK]
                EXPORT  ENET_IRQHandler           [WEAK]
                EXPORT  RIT_IRQHandler            [WEAK]
                EXPORT  MCPWM_IRQHandler          [WEAK]
                EXPORT  QEI_IRQHandler            [WEAK]
                EXPORT  PLL1_IRQHandler           [WEAK]
                EXPORT  USBActivity_IRQHandler    [WEAK]
                EXPORT  CANActivity_IRQHandler    [WEAK]

WDT_IRQHandler
TIMER0_IRQHandler
TIMER1_IRQHandler
TIMER2_IRQHandler
TIMER3_IRQHandler
UART0_IRQHandler
UART1_IRQHandler
UART2_IRQHandler
UART3_IRQHandler
PWM1_IRQHandler
I2C0_IRQHandler
I2C1_IRQHandler
I2C2_IRQHandler
SPI_IRQHandler
SSP0_IRQHandler
SSP1_IRQHandler
PLL0_IRQHandler
RTC_IRQHandler
EINT0_IRQHandler
EINT1_IRQHandler
EINT2_IRQHandler
EINT3_IRQHandler
ADC_IRQHandler
BOD_IRQHandler
USB_IRQHandler
CAN_IRQHandler
DMA_IRQHandler
I2S_IRQHandler
ENET_IRQHandler
RIT_IRQHandler
MCPWM_IRQHandler
QEI_IRQHandler
PLL1_IRQHandler
USBActivity_IRQHandler
CANActivity_IRQHandler

                B       .

                ENDP


                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap
__user_initial_stackheap

                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR

                ALIGN

                ENDIF


                END
