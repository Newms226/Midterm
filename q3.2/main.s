; main.s
; Runs on any Cortex M processor
; A very simple first project implementing a random number generator
; Daniel Valvano
; May 12, 2015

;  This example accompanies the book
;  "Embedded Systems: Introduction to Arm Cortex M Microcontrollers",
;  ISBN: 978-1469998749, Jonathan Valvano, copyright (c) 2015
;  Section 3.3.10, Program 3.12
;
;Copyright 2015 by Jonathan W. Valvano, valvano@mail.utexas.edu
;   You may use, edit, run or distribute this file
;   as long as the above copyright notice remains
;THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
;OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
;MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
;VALVANO SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL,
;OR CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
;For more information about my classes, my research, and my books, see
;http://users.ece.utexas.edu/~valvano/


; we align 32 bit variables to 32-bits
; we align op codes to 16 bits
       THUMB
       AREA    DATA, ALIGN=4 
       EXPORT  M [DATA,SIZE=4]
M      SPACE   4
                 
       AREA    |.text|, CODE, READONLY, ALIGN=2
       EXPORT  Start
Start  
		LDR		r1, =N256
		LDR		r0, [r1]
		MOVS	r0, r0, ASR #12
		MOV		r2, #0x2
		AND		r2, r0, r2
		BL		printLetter
		B		.
		
printLetter					
	CMP		r2, #4			
	BHI		Letter1	    
	;ADR		r3, JumpTable	
	;LDR		pc,[r3,r2,LSL #2] 
	B		Letter4
	
JumpTable
	DCD		Letter1
	DCD		Letter2
	DCD		Letter3
	DCD		Letter4
	DCD		Letter2
Letter1
	MOV		r0, #'a'			
	BX         lr
Letter2
	MOV		r0, #&46			
	BX         lr
Letter3
	MOV		r0, #&44		
	BX         lr
Letter4
	MOV		r0, #&48		
	BX         lr
Letter5
	MOV		r0, #&42		
	BX         lr
N256          DCD -256


       ALIGN      
       END  
           