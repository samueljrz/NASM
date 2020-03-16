%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, eax 
    cmp eax, 0
    jz exception
    xor esi, esi
    mov ecx, 2
    push eax
    call Log2
    PRINT_UDEC 4, esi
    exit:
    xor eax, eax
    ret
    
Log2:
    enter 0, 0
    mov ebx, [ebp+8]
    cmp ebx, 1
    ja prox
    mov ecx, 1
    jmp endLog2
    prox:
    mov eax, ebx
    xor edx, edx
    div ecx
    mov ebx, eax
    push ebx
    call Log2
    inc esi

endLog2:
    leave
    ret 4
    
exception:
    PRINT_STRING "- Infinito"
    jmp exit