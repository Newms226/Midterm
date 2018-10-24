; r0 - r7 := General Purpose
; r6 -> calculated LSW
; r7 -> calculated MSW
; r8 -> carry from word one -> 2
; r9 := address of first
; r10:= address of second word

       THUMB
       AREA    DATA, ALIGN=4 
       EXPORT  M [DATA,SIZE=4]
M      SPACE   4
                 
       AREA    |.text|, CODE, READONLY, ALIGN=2
       EXPORT  Start
Start  

first	DCD		0x00F234E1
		DCD		0xF9265EAC
second	DCD		0x5729D472
		DCD		0xA5296101
			
begin
		ADR		r9, first
		ADR		r10, second
		
add_LSW
		ADD		r0, r9, #4
		LDR		r1, [r0]
		ADD		r0, r10, #4
		LDR		r2, [r0]
		ADDS	r6, r1, r2
		LDR		r1, [r9]
		LDR		r2, [r10]
		ADD		r7, r1, r2
		ADDCSS	r7, r7, #1
		B		.
       ALIGN      
       END  
           