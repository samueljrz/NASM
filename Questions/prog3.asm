;test print

%include "io.inc"

section .data
    var1 DD 21h
    var2 DD 10h
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_HEX 4, var1
    GET_HEX 4, var2
    
    PRINT_HEX 1, [var1]
   
    xor eax, eax
    ret
    