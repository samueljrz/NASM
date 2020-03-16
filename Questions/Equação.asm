%include "io.inc"

section .data
    Xval DW 15d
    Yval DW 3d
    Zval Dw 5d 
   
section .bss  
    Rval RESW 1
    
section .text
global CMAIN
CMAIN:
    ;Rval = Xval - (-Yval + Zval)
    mov ax, [Yval]; ax = 3
    neg ax; ax = -3
    add ax, [Zval]; ax = -3 + 5
    neg ax; ax = -2
    add ax, [Xval]; ax = 15 + (-2) --> ax = 13
    mov [Rval], ax; Rval = 13
    
    PRINT_DEC 2, [Rval]
    
    xor eax, eax
    ret