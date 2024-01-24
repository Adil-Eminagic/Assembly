.global _start
_start:
	MOV R0,#5//a
	MOV R1,#7//b
	MOV R6,#3// to multiply by 3
	MOV R7,#0 //temp
	MOV R8,#0//result
	
bin_cube:
  	MUL R7,R0,R0
	MUL R7,R7,R0
	ADD R8,R8,R7//a3
	
	MOV R7,#0 
  	MUL R7,R1,R1
	MUL R7,R7,R1
	ADD R8,R8,R7//b3
	
	MOV R7,#0
  	MUL R7,R0,R0
	MUL R7,R7,R6
	MUL R7,R7,R1
	ADD R8,R8,R7//3 * a * a * b
	
	MOV R7,#0
  	MUL R7,R1,R1
	MUL R7,R7,R6
	MUL R7,R7,R0
	ADD R8,R8,R7//3 * a * b * b
	
	
