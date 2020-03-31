;test triangle ret

%include "io.inc"

section .bss   
    ladoA RESD 4
    ladoB RESD 4
    ladoC RESD 4

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, eax
    GET_UDEC 4, ebx
    GET_UDEC 4, ecx
    
    mov [ladoA], eax
    mov [ladoB], ebx
    mov [ladoC], ecx
    
;Teste lado A
    add ebx, ecx
    cmp ebx, eax
    js ERROR
    mov eax, [ladoA]
    mov ebx, [ladoB]
    mov ecx, [ladoC]

;Teste lado B
    add eax, ecx
    cmp eax, ebx
    js ERROR
    mov eax, [ladoA]
    mov ebx, [ladoB]
    mov ecx, [ladoC]

;Teste lado A
    add eax, ebx
    cmp eax, ecx
    js ERROR
    mov eax, [ladoA]
    mov ebx, [ladoB]
    mov ecx, [ladoC]
    
    cmp eax, ebx
    jz eq
    cmp ebx, ecx
    jz iso
    cmp eax, ecx
    jz iso
    jnz escl
            
eq:
    cmp eax, ecx
    jz printeq
    jmp iso
    
printeq:
    PRINT_STRING "Equilatero"
    ret

iso:
    PRINT_STRING "Isoceles" 
    ret
 
escl:
    PRINT_STRING "Escaleno"
        ret
    
ERROR:
    PRINT_STRING "Não é um triângulo"
    
    xor eax, eax
    ret