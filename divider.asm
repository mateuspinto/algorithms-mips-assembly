addi $a0, $zero, 20
addi $a1, $zero, 6

jal divide
j exitMain

divide:
	addi $sp, $sp, -12
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $t7, 8($sp)
	divideLoop: 
		slt $t7, $a0, $zero
		bne $t7, $zero, calcRemain
		sub $a0,$a0, $a1
		addi $v0, $v0, 1
		j divideLoop

calcRemain: 
	add $a0, $a0, $a1
	addi $v0, $v0, -1
	add $v1, $zero, $a0
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	lw $t7, 8($sp)
	addi $sp, $sp, 12
	jr $ra

exitMain: