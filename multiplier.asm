addi $a0, $zero, 5
addi $a1, $zero, 4

loop: andi $t0, $a1, 1
bne $t0, $zero, adding




adding: add $t1, $a0, $t1
j loop