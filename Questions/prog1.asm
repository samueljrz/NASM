%include "io.inc"

section .data
    var1 DD 21h
    var2 DD 10h
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 564525AFh
    inc al    
    inc ah
    PRINT_HEX 4, eax
    
    xor eax, eax
    ret
    