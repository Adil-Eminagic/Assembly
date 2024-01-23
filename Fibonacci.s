.global _start
_start:
	MOV R0,#0//first
	MOV R1,#1//second
	MOV R6,#2//counter
	PUSH {R0,R1}
	
fibonacci:
	CMP R6,#10
	BEQ load
	ADD R2,R0,R1
	MOV R0,R1
	MOV R1,R2
	PUSH {R2}
	MOV R2,#0
	ADD R6,R6,#1
	B fibonacci
	
	
load:
	CMP R6,#0
	BEQ exit
	POP {R7}
	SUB R6,R6,#1
	B load


exit:
