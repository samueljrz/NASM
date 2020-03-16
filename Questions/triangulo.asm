%include "io.inc"

section .data
    auxa DD 0 
    auxb DD 0
    auxd DD 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4, eax
    GET_DEC 4, ebx
    GET_DEC 4, edx
    
    mov [auxa], eax 
    mov [auxb], ebx
    mov [auxd], edx
    
;teste lado A
    mov ecx, ebx
    sub ecx, edx
    add edx, ebx
    mov ebx, ecx
    cmp eax, ebx
    js ERROR
    cmp edx, eax
    js ERROR

    mov eax, [auxa] 
    mov ebx, [auxb]
    mov edx, [auxd]

;teste lado B
    mov ecx, eax
    sub ecx, edx
    add edx, eax
    mov eax, ecx
    cmp ebx, eax
    js ERROR
    cmp edx, ebx
    js ERROR

    mov eax, [auxa] 
    mov ebx, [auxb]
    mov edx, [auxd]

;teste lado D
    mov ecx, eax
    sub ecx, ebx
    add eax, ebx
    mov eax, ecx
    cmp edx, eax
    js ERROR
    cmp edx, eax
    js ERROR

    mov eax, [auxa] 
    mov ebx, [auxb]
    mov edx, [auxd]
    
    cmp eax, ebx
    jz eq1
    cmp ebx, edx
    jz iso1
    cmp eax, edx
    jz iso1
    jnz escl
            
eq1:
    cmp eax, edx
    jz printeq
    jmp iso1
    
printeq:
    PRINT_STRING "Equilatero"
    ret

iso1:
    PRINT_STRING "Isoceles" 
    ret

ERROR:
    PRINT_STRING "Não é tringulo"
    ret
    
escl:
    PRINT_STRING "Escaleno"
    ret
    
    xor eax, eax
    ret