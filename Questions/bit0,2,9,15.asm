%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    GET_UDEC 2, ax
    mov bx, 1000001000000101b
    and ax,bx
    jnz L1
    PRINT_STRING "error" 
    xor eax, eax
    ret
    
L1:
    PRINT_STRING "foi sal"
    ret