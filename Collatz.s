
		AREA FIRST_START, CODE, READONLY, ALIGN=2
		THUMB
		ENTRY
		EXPORT __main
		
__main

		
		LDR R0, =0x40023830
		LDR R1, [R0]
		ORR R1, 0x4
		STR R1, [R0]
		
		MOV R3,#0 ;counter
		MOV R8,#0 ; biggest number
		MOV R10,#0 ; number of iterations
		MOV R11,#3
		
		

store_numbers
		
		LDR R0,=0x40020814 
		LDR R1,[R0]
		
		CMP R1,#1
		BGT greater_than_one 
		
		B store_numbers
		
		
greater_than_one

		PUSH {R1} 
		ADD R3,R3,#1
		CMP R3,#4 
		BEQ find_biggest 
		B store_numbers
		
		
			
find_biggest 
		
		LDMFD SP!, {R7} 
		CMP R7,#0
		BEQ collatz
		CMP R7,R8
		BGT change_biggest 
		B find_biggest
		
change_biggest

		MOV R8,R7
		B find_biggest
		
collatz

		CMP R8,#1
		BEQ exit 		;if it is 1 end
		MOV R9,R8
		LSR R9,#1
		LSL R9,#1
		CMP R8,R9
		BEQ even 		;if number is even
		MUL R8,R8,R11 	;multiply by 3
		ADD R8,R8,#1	;add 1
		ADD R10,R10,#1 	;increase counter
		B collatz
		
even
		LSR R8,#1
		ADD R10,R10,#1
		B collatz

exit 

		ALIGN
		END
		
