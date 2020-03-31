;idk

%include "io.inc"

section .text
global CMAIN
CMAIN:
    push 20
    push 10
    call PROC
    
    xor eax, eax
    ret
    
PROC:
    enter 4, 0
    mov eax, 0
    add eax, [ebp+12]
    add eax, [ebp+8]
    mov [ebp-4], eax
    PRINT_UDEC 4, [ebp-4]
    leave
    ret 8