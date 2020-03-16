%include "io.inc"

section .text
global CMAIN
CMAIN:
    
    GET_DEC 4, eax
    GET_DEC 4, ebx
    GET_DEC 4, ecx    
    mov edx, 3600d
    CALL MULT
    mov edx, 60d
    xchg eax, ebx
    CALL MULT
    add eax, ebx
    PRINT_DEC 4, eax
    xor eax, eax
    ret
    
;---------------------------------
MULT:
;Recieves: eax, edx
;Returns: eax = eax * edx
;---------------------------------
mov ecx, eax
dec ecx
    L1:
        add edx, edx
    LOOP L1
mov eax, edx
ret