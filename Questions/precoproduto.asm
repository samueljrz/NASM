;example product in the your determination price range

%include "io.inc"

section .data
    TabDeCasos DD 80d 
    DD Caso1 ; Caso até 80
    Tam EQU ($ - TabDeCasos)
    DD 120d 
    DD Caso2 ; Caso > 80 até 120
    DD  200d 
    DD Caso3 ; Caso > 120 até 200
    DD  201d 
    DD Caso4 ; Caso > 200
    Num EQU ($ - TabDeCasos) / Tam
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, eax
    mov ebx, TabDeCasos
    mov ecx, Num

LOOP1:
    cmp eax, [ebx]
    jz CONT
    jns LOOP2
    CONT:
        call [ebx + 4]
        jmp LOOP3
    
LOOP2:
    add ebx, Tam    
    dec ecx
    jnz LOOP1
    sub ebx, 8
    jmp CONT
    
     
LOOP3:     
    xor eax, eax
    ret

Caso1:
    PRINT_STRING "Barato" 
    ret

Caso2:
    PRINT_STRING "Normal"
    ret
    
Caso3:
    PRINT_STRING "Caro"
    ret
    
Caso4:
    PRINT_STRING "Muito Caro"
    ret   