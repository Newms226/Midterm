; r0 - r7 -> General Purpose Registers
; r8 -> current max value
; r9 -> address of next byte
       THUMB
       AREA    DATA, ALIGN=4 
       EXPORT  M [DATA,SIZE=4]
M      SPACE   4
                 
       AREA    |.text|, CODE, READONLY, ALIGN=2
       EXPORT  Start


Start

a		DCB		5, 2, -100, 100, -101, 0
max		DCB		0

		ADR		r9, a
		LDRSB	r8, [r9]
		B		maximum
stop
		ADR		r0, max
		STRB	r8, [r0]
		B		.

maximum
		LDRSB	r0, [r9], #1
		CMP		r0, #0
		BEQ		stop

		CMP		r8, r0
		MOVMI	r8, r0
		B		maximum
		
	
       ALIGN      
       END  
           