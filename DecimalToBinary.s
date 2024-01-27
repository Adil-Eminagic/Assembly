
		AREA FIRST_START, CODE, READONLY, ALIGN=2
		THUMB
		ENTRY
		EXPORT __main
		
__main

		
		LDR R0, =0x40023830
		LDR R1, [R0]
		ORR R1, 0x4
		STR R1, [R0]
		
		LDR R0,=0x40020814 
		LDR R1,[R0]
		
		MOV R10,#10; to multipy with 10
		MOV R11,#1 ; if remider is 0
		MOV R12,#2 ; if remider is 1
		
push_binary
		CMP R1,#0
		BEQ pop_binary
		MOV R2,R1
		LSR R2,#1
		LSL R2,#1
		CMP R1,R2 ;if remider is zero push 1
		BEQ store_one
		PUSH {R12} ; if not push two
		LSR R1,#1 ;devide by 2
		B push_binary
		
store_one
		PUSH {R11} ; push one
		LSR R1,#1 ;devide by 2
		B push_binary
		
pop_binary
		LDMFD SP!, {R4} 
		CMP R4,#0 ;if stack is empty
		BEQ exit
		SUB R4,R4,#1 
		MUL R5,R5,R10
		ADD R5,R5,R4
		B pop_binary

exit 

		ALIGN
		END
		



	
