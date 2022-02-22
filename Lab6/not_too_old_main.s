     .global main
 main:
     MOV R5, #1
loop:
     CMP R4, #0
     BLE end
else:
     MOV R5, #2
end:
     MOV R0,R5
     BX LR

