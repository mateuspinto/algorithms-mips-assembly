# A simple implementation of a swap in MIPS assembly

li $s0, 0x10010000
addi $s1, $zero, 50
addi $s2, $zero, 30

sw $s1, 0($s0)
sw $s2, 4($s0)

add $a0, $zero, $s0

jal swap

lw $s1, 0($s0)
lw $s2, 4($s0)

j exit

swap: addi $sp,$sp,-8 #Adjusting stack

# Stacking all registers that will be used
sw $t0, 0($sp)
sw $t1, 4($sp)

# Doing the swap using memory
lw $t0, 0($a0)
lw $t1, 4($a0)
sw $t0, 4($a0)
sw $t1, 0($a0)

# Rebuilding stack
lw $t0, 0($sp)
lw $t1, 4($sp)
addi $sp, $sp, 8

# Going back to main
jr $ra

exit:

