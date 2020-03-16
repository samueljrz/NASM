%include "io.inc"

section .data  
    array DW 10d, 20d, 30d, 40d
    sizeOfarray DW($ - array)/2

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov ecx, [sizeOfarray]
    dec ecx
    mov edx, ecx
    
    L1:
        mov ax, [array+(edx*2)]
        xchg [array+(ebx*2)], ax
        mov [array+(edx*2)], ax
        inc ebx
        loop L1
    
    xor eax, eax
    ret