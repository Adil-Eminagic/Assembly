
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
		MOV R6,#2 ;to multipy by 2
		MOV R7,#0 ;temp
		MOV R8,#0 ;result
		
		

store_odds
		
		LDR R0,=0x40020814
		LDR R1,[R0]
		MOV R2,R1
		LSR R2,#1
		LSL R2,#1
		
		CMP R1,R2
		BNE is_odd
		
		B store_odds
		
		
is_odd
		PUSH {R1}
		ADD R3,R3,#1
		CMP R3,#2
		BEQ binomial_square
		B store_odds
		
		
			
binomial_square
		
		LDMFD SP!, {R4,R5}
		
		
		MUL R7,R4,R4
		ADD R8,R8,R7; a2
	
		MOV R7,#0 
		MUL R7,R5,R5
		ADD R8,R8,R7; b2
	
		MOV R7,#0
		MUL R7,R4,R6
		MUL R7,R7,R5
		ADD R8,R8,R7; 2ab

exit 

		ALIGN
		END
		
