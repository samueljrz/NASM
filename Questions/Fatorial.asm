;fatorial example complete

%include "io.inc"

section .data
    Aux DD 1d
    Count DW 0d 
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4, eax
    
    mov ecx, eax
    add ecx, 0
    jle FIM
   
    FAT1:
    mov [Count], ecx
    mov ecx, eax
    mov edx, [Aux]
    xor ebx, ebx
    
    FAT2:
    add ebx, edx
    loop FAT2
    
    mov [Aux], ebx     
    dec eax
    mov ecx, [Count]
    loop FAT1
        
    FIM:
    PRINT_DEC 4, [Aux]
    
    xor eax, eax
    ret