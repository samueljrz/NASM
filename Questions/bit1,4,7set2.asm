;test if the bits 1, 4, 7 being sets

%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 2, ax
    mov bx, 0000000010010010b
    and ax, bx
    cmp ax, bx
    je OK
    PRINT_STRING "não foi sal!"
    xor eax, eax
    ret
    
OK:
    PRINT_STRING "foi sal!"
    ret