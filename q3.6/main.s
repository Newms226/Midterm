; r12 -> count
       THUMB
       AREA    DATA, ALIGN=4 
       EXPORT  M [DATA,SIZE=4]
M      SPACE   4
                 
       AREA    |.text|, CODE, READONLY, ALIGN=2
       EXPORT  Start
Start  
test_1	DCD		0xEFFFFFFF
test_2	DCD		0xCFFFFFFF
test_3	DCD		0xFFFFFFFE
test_4  DCD		0xFFFFFFFC
	
begin
		ADR		r0, test_1
		LDR		r0, [r0]
		BL		count_zeros
		CMP		r12, #1
		MOV		r12, #0
		ADR		r0, test_2
		LDR		r0, [r0]
		BL		count_zeros
		CMP		r12, #2
		MOV		r12, #0
		ADR		r0, test_3
		LDR		r0, [r0]
		BL		count_zeros
		CMP		r12, #1
		MOV		r12, #0
		ADR		r0, test_4
		LDR		r0, [r0]
		BL		count_zeros
		CMP		r12, #2
		B		.	

count_zeros
		MVN		r0, r0
loop
		CMP		r0, #0
		BXEQ	lr
		
		SUB		r1, r0, #1
		AND		r0, r1, r0
		ADD		r12, r12, #1
		B 		loop
		

       ALIGN      
       END  
           