.global _start
_start:
		MOV R1,#16
		
		MOV R4,#0 //RESULT
		
		ADD R2,R1,#1
		MUL R4,R2,R1
		LSR R4,#1
