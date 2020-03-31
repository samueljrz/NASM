;sum array with stack

%include "io.inc"

section .data
lista DD 12, 1, 53,24
size EQU ($-lista)/4

section .text
global CMAIN
CMAIN:
    push lista
    push size
    call somaArray
    add ESP, 8
    PRINT_UDEC 4, EAX
    xor eax, eax
    ret
    
    
somaArray:
    push EBP
    mov EBP, ESP
    mov ECX, [EBP+8]
    mov ESI, [EBP+12]
    mov EAX, 0
L:  
    add EAX, [ESI]
    add ESI, 4
    loop L
    mov ESP, EBP
    pop EBP
    ret