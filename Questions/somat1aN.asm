%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    GET_UDEC 4, eax
    
    CALL FUNC
    
    PRINT_UDEC 4, eax
    xor eax, eax
    ret 
;-----------------------------------
FUNC:
;Recieves: eax
;Returns: Somatorio de 1 a eax = N === eax
;-----------------------------------
mov ebx, 1
mov ecx, eax
dec ecx
    L1:
        add ebx, eax
        dec eax
    LOOP L1
mov eax, ebx
ret