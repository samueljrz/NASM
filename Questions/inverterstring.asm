%include "io.inc"

section .data
    string DB "Ainda sou Xavante",0
	    size EQU $-string
section .text
global CMAIN
CMAIN:
    mov ecx, size-1
    mov ESI,0
L1:
    mov AL, [string+ESI]
    push EAX
    INC ESI
    loop L1

    mov ECX, size-1
    mov ESI,0
L2: 
    pop EAX
    
    INCmov [string+ESI], AL ESI
    loop L2
    
    PRINT_STRING string
    xor eax, eax
    ret .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    ret
