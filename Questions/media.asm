%include "io.inc"

section .data
    nota1 DD 0h
    nota2 DD 0h

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4, [nota1]
    GET_DEC 4, [nota2]
    
    mov eax, [nota1]
    add eax, [nota2]
    mov edx, 0
    mov ecx, 2
    div ecx
    
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret