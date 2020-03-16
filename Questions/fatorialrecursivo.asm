%include "io.inc"

section .text
global CMAIN
CMAIN:
    push 5
    call Fat
    PRINT_UDEC 4, eax
    xor eax, eax
    ret
    
Fat:
    enter 0, 0
    mov ebx, [ebp+8]
    cmp ebx, 1
    ja next
    mov eax, 1
    jmp endFat
    next:
    dec ebx
    push ebx
    call Fat
    mul DWORD[ebp+8] 
    
endFat:
    leave
    ret 4