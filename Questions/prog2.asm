%include "io.inc"

section .data
    var1 DD 21h
    var2 DD 10h
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, [var1]
    sub eax, [var2] 
    mov dword[var1], 20    
    PRINT_HEX 4, eax
    
    xor eax, eax
    ret
    