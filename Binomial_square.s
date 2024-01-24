.global _start
_start:
	MOV R0,#5//a
	MOV R1,#7//b
	MOV R6,#2// to multiply by 2
	MOV R7,#0 //temp
	MOV R8,#0//result
	
bin_square:
  	MUL R7,R0,R0
	ADD R8,R8,R7//a2
	
	MOV R7,#0 
  	MUL R7,R1,R1
	ADD R8,R8,R7//b2
	
	MOV R7,#0
  	MUL R7,R0,R6
	MUL R7,R7,R1
	ADD R8,R8,R7//2ab
