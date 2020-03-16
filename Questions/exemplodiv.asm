%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor edx, edx
    mov ecx, 2
    mov eax, 8
    div ecx
    PRINT_DEC 4, eax
    xor eax, eax
    ret