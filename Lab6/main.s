     .data
     .balign 4
var1: .word 1
     .text
     .global main
main:
     MOV R1, #2
     LDR R2, var1addr
     STR R1, [R2]
     LDR R0, [R2]
     BX LR
var1addr: .word var1

