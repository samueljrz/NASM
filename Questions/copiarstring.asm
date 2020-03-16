%include "io.inc"

section .data
    source DB "Sou mais Xavante",0
    sizeOfSource EQU $-source

section .bss
    target RESB sizeOfSource

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ESI, 0
    mov ECX, sizeOfSource
L1:
    mov AH, [source+ESI]
    mov [target+ESI], AH
    inc ESI
    dec ecx
    jnz L1
    PRINT_STRING target
    xor eax, eax
    ret