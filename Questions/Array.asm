%include "io.inc"
section .data
    myByte DB 80h, 66h, 0A5h

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    movzx ax, BYTE [myByte]
    movzx bx, BYTE [myByte+1]
    add ax, bx
    movzx bx, BYTE [myByte+2]
    add ax, bx
    PRINT_HEX 2, AX 
    xor eax, eax
    ret