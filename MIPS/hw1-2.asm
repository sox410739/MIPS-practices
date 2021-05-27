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
	move $s1,$v0
	li $v0 5
	syscall
	move $s2,$v0
	beqz $v0 case0
	j case1
case0:
	move $s3,$zero
	addi $s3,$s3,1
	sllv $s3,$s3,$s1
	sub $s0,$s0,$s3
	j output
case1:
	move $s3,$zero
	addi $s3,$s3,1
	sllv $s3,$s3,$s1
	add $s0,$s0,$s3
	j output
output:
	la $a0 output_msg
	li $v0 4
	syscall
	move $a0,$s0
	li $v0 1
	syscall
	la $a0 endOfLine
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
endOfLine:
	.asciiz "\n\n"	
exit_msg:      
	.asciiz "End... "
