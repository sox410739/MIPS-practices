.text

main:

input:
	la $a0 input_msg
	li $v0 4
	syscall
	li $v0 5
	syscall
	beq $v0,$zero,exit
	move $s0,$v0
	li $v0 5
	syscall
	beq $v0,$zero,exit
	move $s1,$v0
output:
	la $a0 output_msg
	li $v0 4
	syscall
	srl $s0,$s0,31
	srl $s1,$s1,31
	beq $s0,$s1,false
	
	j true
false:
	la $a0 outFalse
	li $v0 4
	syscall
	j input
true:
	la $a0 outTrue
	li $v0 4
	syscall
	j input
	
exit:
	la $a0 exit_msg
	li $v0 4
	syscall
	li $v0 10
	syscall
.data
input_msg:	
	.asciiz "Input:\n"
output_msg:
	.asciiz "Output:\n"
outTrue:
	.asciiz "True\n"
outFalse:
	.asciiz "False\n"	
exit_msg:      
	.asciiz "End... "
