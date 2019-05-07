addi $s7, $zero, 8192
addi $s0, $zero, 3
sw $s0, 0($s7)
addi $s0, $zero, 7
sw $s0, 4($s7)
addi $s0, $zero, 5
sw $s0, 8($s7)


addi $a0, $zero, 2
add $a1, $zero, $s7

jal max
j exitMain

max:
addi $sp, $sp, -24
sw $a0, 0($sp)
sw $a1, 4($sp)
sw $t0, 8($sp)
sw $t1, 12($sp)
sw $t2, 16($sp)
sw $t3, 20($sp)

lw $t1, 0($a1)
addi $a1, $a1, 4

throughVector:
addi $a0, $a0, -1
beq $zero, $a0, lastElement
lw $t2, 0($a1)
addi $a1, $a1, 4
sgt $t3, $t2, $t1
beq $t3, $zero, throughVector
add $t1, $zero, $t2
j throughVector

lastElement:
add $v0, $t1, $zero

lw $a0, 0($sp)
lw $a1, 4($sp)
lw $t0, 8($sp)
lw $t1, 12($sp)
lw $t2, 16($sp)
lw $t3, 20($sp)
addi $sp, $sp, 24

jr $ra

exitMain:
