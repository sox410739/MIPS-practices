.text

main:

input:
	la $a0 input_msg
	li $v0 4
	syscall
	li $v0 5
	syscall
	beq $v0,$zero,exit
	move $s0, $v0
output:
	la $a0 output_msg
	li $v0 4
	syscall
	addi $sp,$sp,-4
	sw $s1,0($sp)
	jal iceBird1
	lw $s1,0($sp)
	addi $sp,$sp,4
	jal iceBird2
	move $a0,$t0
	li $v0 1
	syscall
	la $a0 endl
	li $v0 4
	syscall
	
	move $t0,$zero
	move $s1,$zero
	j input
	
iceBird1:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	addi $s1,$s1,1
	bge $s1,$s0,increase
	addi $sp,$sp,-4
	sw $s1,0($sp)
	jal iceBird1
	lw $s1,0($sp)
	addi $sp,$sp,4
	jal iceBird2
	
	j return
iceBird2:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	addi $s1,$s1,2
	bge $s1,$s0,increase
	addi $sp,$sp,-4
	sw $s1,0($sp)
	jal iceBird1
	lw $s1,0($sp)
	addi $sp,$sp,4
	jal iceBird2
	
	j return
increase:
	bgt $s1,$s0,return
	addi $t0,$t0,1
return:
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra

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
endl:
	.asciiz "\n"	
exit_msg:      
	.asciiz "End... "
