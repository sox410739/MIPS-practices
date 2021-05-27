.text

main:

input:
	la $a0 input_msg
	li $v0 4
	syscall
	li $v0 5
	syscall
	blez $v0 exit
	addi $s0,$s0,9
	bgt $v0,$s0,exit
	move $s0,$v0
	
	j output
output:
	la $a0 output_msg
	li $v0 4
	syscall
	
	j firstPartReady
firstPartReady:
	move $s1,$zero
	addi $s1,$s1,3
	mul $s1,$s0,$s1
	addi $s2,$s2,1
	
	j firstPart
firstPart:
	move $t0,$zero
	move $t1,$zero
	
	j firstPart1
firstPart1:
	la $a0 space
	li $v0 4
	syscall
	addi $t0,$t0,1
	blt $t0,$s1,firstPart1
	
	j firstPart2
firstPart2:
	la $a0 star
	li $v0 4
	syscall
	la $a0 space
	li $v0 4
	syscall
	addi $t1,$t1,1
	blt $t1,$s2,firstPart2
	
	j firstPartF
firstPartF:
	la $a0 endl
	li $v0 4
	syscall
	addi $s2,$s2,1
	addi $s1,$s1,-1
	ble $s2,$s0,firstPart
	
	j secondPartReady
secondPartReady:
	move $s1,$zero
	move $s2,$zero
	addi $s2,$s2,3
	mul $s2,$s0,$s2
	
	j secondPart
secondPart:
	move $t0,$zero
	move $t1,$zero
	
	j secondPart1
secondPart1:
	addi $t0,$t0,1
	bgt $t0,$s1,secondPart2
	la $a0 space
	li $v0 4
	syscall
	
	j secondPart1
secondPart2:
	la $a0 star
	li $v0 4
	syscall
	la $a0 space
	li $v0 4
	syscall
	addi $t1,$t1,1
	blt $t1,$s2,secondPart2
	
	la $a0 star
	li $v0 4
	syscall
	
	j secondPartF
secondPartF:
	la $a0 endl
	li $v0 4
	syscall
	addi $s1,$s1,1
	addi $s2,$s2,-1
	ble $s1,$s0,secondPart
	
	j thirdPartReady
thirdPartReady:
	addi $s1,$s1,-2
	addi $s2,$s2,2
	
	j thirdPart
thirdPart:
	move $t0,$zero
	move $t1,$zero
	
	j thirdPart1
thirdPart1:
	addi $t0,$t0,1
	bgt $t0,$s1,thirdPart2
	la $a0 space
	li $v0 4
	syscall
	
	j thirdPart1
thirdPart2:
	la $a0 star
	li $v0 4
	syscall
	la $a0 space
	li $v0 4
	syscall
	addi $t1, $t1,1
	blt $t1,$s2,thirdPart2
	
	la $a0 star
	li $v0 4
	syscall
	
	j thirdPartF
thirdPartF:
	la $a0 endl
	li $v0 4
	syscall
	addi $s1,$s1,-1
	addi $s2,$s2,1
	bgez $s1,thirdPart
	
	j forthPartReady
forthPartReady:
	move $s1,$zero
	addi $s1,$s1,2
	mul $s1,$s0,$s1
	move $s2,$s0
	
	j forthPart
forthPart:
	move $t0,$zero
	move $t1,$zero
	
	j forthPart1
forthPart1:
	la $a0 space
	li $v0 4
	syscall
	addi $t0,$t0,1
	blt $t0,$s1,forthPart1
	
	j forthPart2
forthPart2:
	la $a0 space
	li $v0 4
	syscall
	la $a0 star
	li $v0 4
	syscall
	addi $t1,$t1,1
	blt $t1,$s2,forthPart2
	
	j forthPartF
forthPartF:
	la $a0 endl
	li $v0 4
	syscall
	addi $s1,$s1,1
	addi $s2,$s2,-1
	bgtz $s2,forthPart
	
	j exit
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
star:
	.asciiz "*"
space:
	.asciiz " "
endl:
	.asciiz "\n"	
exit_msg:      
	.asciiz "End... "
