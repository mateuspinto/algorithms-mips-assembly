li $s0,0x10010000

addi $t1, $t1, 5
addi $t2, $t2, 5
addi $t3, $t3, 3
addi $t4, $t4, 2
addi $t5, $t5, 10
addi $t6, $t6, 1

sw $t1, 0($s0)
sw $t2, 4($s0)
sw $t3, 8($s0)
sw $t4, 12($s0)
sw $t5, 16($s0)
sw $t6, 20($s0)

move $a0, $s0

jal bubble_sort

lw $t1, 0($s0)
lw $t2, 4($s0)
lw $t3, 8($s0)
lw $t4, 12($s0)
lw $t5, 16($s0)
lw $t6, 20($s0)

j sair


bubble_sort:

	addi $sp,$sp,-8
	sw $s0,4($sp)
	sw $ra,0($sp)
	move $s0,$a0
	lw $s1,0($s0)
	addi $s1, $s1,-1
	move $s3, $zero
	
for1:
	
	move $s2, $zero
	addi $s2,$s2,-1
	lw $s0, 4($sp)
	slt $t0, $s3, $s1
	beq $t0, $zero, exit1
	
for2:
	addi $s2, $s2, 1
	slt $t0, $s2, $s1
	beq $t0, $zero, exit2
	addi $s0, $s0, 4
	lw $t1, 0($s0)
	lw $t2, 4($s0)	
	slt $t0,$t2,$t1
	beq $t0, $zero, for2
	sw $t2,0($s0)
	sw $t1,4($s0)	
	j for2
		
	exit2:
	addi $s3,$s3,1
	j for1	


exit1:	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 4
	jr $ra
	
		

	
sair:	
	
