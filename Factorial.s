
		AREA FIRST_START, CODE, READONLY, ALIGN=2
		THUMB
		ENTRY
		EXPORT __main
		
__main

		
		LDR R0, =0x40023830
		LDR R1, [R0]
		ORR R1, 0x4
		STR R1, [R0]
		
		MOV R3,#0 ;odd numbers counter
		MOV R8,#0x0fffffff ;smallest number on stack
		MOV R10,#1 ;factoriel of smallest number
		
		

store_odds
		
		LDR R0,=0x40020814 ;reads value from ODR register on GPIOC peripheral
		LDR R1,[R0]
		MOV R2,R1
		LSR R2,#1
		LSL R2,#1
		
		CMP R1,R2
		BNE is_odd ;if not equal then number is odd
		
		B store_odds
		
		
is_odd
		PUSH {R1} ; push odd number on the stack
		ADD R3,R3,#1
		CMP R3,#3 
		BEQ find_smallest ;if three odd numbers are stored in the stack
		B store_odds
		
		
			
find_smallest
		
		LDMFD SP!, {R7} ;load number from to of the stack
		CMP R7,#0
		BEQ factorial ;all values are checked
		CMP R7,R8
		BLT change_smallest ;if number is smaller than the current smallest number
		B find_smallest
		
change_smallest

		MOV R8,R7
		B find_smallest
		
factorial

		
		MUL R10,R10,R8
		SUB R8,R8,#1
		CMP R8,#0
		BEQ exit
		B factorial

exit 

		ALIGN
		END
		



		



		
