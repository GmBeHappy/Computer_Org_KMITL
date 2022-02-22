.data

.balign 4
get_A: .asciz "number A : "

.balign 4
get_B: .asciz "number B : "

.balign 4
pattern: .asciz "%d"

.balign 4
A: .word 0

.balign 4
B: .word 0

.balign 4
output: .asciz "Between %d and %d , %d is greater.\n"

.balign 4
lr_bu: .word 0

.balign 4
lr_bu_2: .word 0

.text

cmp_func:
    cmp   R0, R1  @ if r0 > r1
    movgt R3, R0  @ then r2 = r0
    movle R3, R1  @ else r2 = r1
	BX LR

addr_lr_bu_2: .word lr_bu_2

.global main

main:
	LDR R1, addr_lr_bu
	STR lr, [R1]

	LDR R0, addr_get_A
	BL printf

	LDR R0, addr_pattern
	LDR R1, addr_A
	BL scanf

	LDR R0, addr_get_B
	BL printf

	LDR R0, addr_pattern
	LDR R1, addr_B
	BL scanf

	LDR R0, addr_A
	LDR R0, [R0]
	LDR R1, addr_B
	LDR R1, [R1]
	BL cmp_func

	LDR R0, addr_output
	LDR R1, addr_A
	LDR R1,[R1]
	LDR R2, addr_B
    LDR R2,[R2]
	BL printf

	LDR lr, addr_lr_bu
	LDR lr, [lr]
	BX lr

addr_get_A: .word get_A
addr_get_B: .word get_B
addr_pattern: .word pattern
addr_A: .word A
addr_B: .word B
addr_output: .word output
addr_lr_bu: .word lr_bu

.global printf
.global scanf


