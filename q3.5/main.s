; r5 -> ASCII char
; r6 -> counter
       THUMB
       AREA    DATA, ALIGN=4 
       EXPORT  M [DATA,SIZE=4]
M      SPACE   4
                 
       AREA    |.text|, CODE, READONLY, ALIGN=2
       EXPORT  Start
Start  
;                  0   A      F     Z     ]    a     b     z     |
a		DCB		0x31, 0x41, 0x46, 0x5A, 0x5D, 0x61, 0x62, 0x5A, 0x7C,  0

		ADR		r0, a
loop
		LDRB	r5, [r0], #1
		CMP		r5, #0
		BEQ		stop
		CMP		r5, #0x41	; x < 0x41
		BLT		loop
		CMP		r5, #0x5B
		BLT		increment
		CMP		r5, #0x61
		BLT		loop
		CMP		r5, #0x7B
		BLT		increment
		B		loop
		
increment
		ADD		r6, r6, #1
		B		loop
					
					; 0x5B <= x < 0x61

					
stop
		B		.
       ALIGN      
       END  
           