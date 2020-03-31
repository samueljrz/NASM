;recursive sum

%include "io.inc"

section .data
    array DD 10, 20, 30, 40
    size EQU ($ - array) / 4
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, array
    mov ecx, size
    mov edx, 0
    call CALCSUM
    PRINT_DEC 4, ebx
    xor eax, eax
    ret
    
CALCSUM:
    cmp ecx, 0
    jz L2
    add ebx, [eax+(edx*4)]
    inc edx     
    dec ecx
    call CALCSUM
L2: ret