# Expect: 0x0

.text
.globl main
main:
    addiu $t0, $t0, 0x5
    addiu $t1, $t1, 0x5
    mult $t0, $t1
    nop
    nop
    mfhi $v0
    jr $zero
