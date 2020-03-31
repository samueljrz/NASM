;rise salary in the your range

%include "io.inc"

section .data
    TabDeCasos DD 300d 
    DD Caso1 ; Caso até 300
    Tam EQU ($ - TabDeCasos)
    DD 500d 
    DD Caso2 ; Caso > 300 até 500
    DD  700d 
    DD Caso3 ; Caso > 500 até 700
    DD  800d 
    DD Caso4 ; Caso > 700 até 800
    DD  1000d 
    DD Caso5 ; Caso > 800 até 1000
    DD  1001d 
    DD Caso6 ; Caso > 1000
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
        NEWLINE
        PRINT_STRING "O valor do salário é: "
        PRINT_UDEC 4, eax
        NEWLINE
        NEWLINE
        PRINT_STRING "O valor com o aumento de salário é: "
        PRINT_UDEC 4, edx
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
    PRINT_STRING "Aumento de 50%"
    NEWLINE
    push eax
    push ebx
    push ecx
    mov ebx, 100d
    mov ecx, eax
    xor eax, eax
    .LOOP1:
        INC eax
        SUB ecx, ebx
        jz .CONT
        jns .LOOP1
    
    dec eax
    .CONT:
    mov ecx, eax
    mov ebx, 50d
    mov edx, 0d
        .LOOP2:
            add edx, ebx
            LOOP .LOOP2

pop ecx
pop ebx
pop eax
add edx, eax
ret
Caso2:
    PRINT_STRING "Aumento de 40%"
    NEWLINE
    push eax
    push ebx
    push ecx
    mov ebx, 100d
    mov ecx, eax
    xor eax, eax
    .LOOP1:
        INC eax
        SUB ecx, ebx
        jz .CONT
        jns .LOOP1
    
    dec eax
    .CONT:
    mov ecx, eax
    mov ebx, 40d
    mov edx, 0d
        .LOOP2:
            add edx, ebx
            LOOP .LOOP2

pop ecx
pop ebx
pop eax
add edx, eax
ret
Caso3:
    PRINT_STRING "Aumento de 30%"
    NEWLINE
    push eax
    push ebx
    push ecx
    mov ebx, 100d
    mov ecx, eax
    xor eax, eax
    .LOOP1:
        INC eax
        SUB ecx, ebx
        jz .CONT
        jns .LOOP1
    
    dec eax
    .CONT:
    mov ecx, eax
    mov ebx, 30d
    mov edx, 0d
        .LOOP2:
            add edx, ebx
            LOOP .LOOP2

pop ecx
pop ebx
pop eax
add edx, eax
ret
Caso4:
    PRINT_STRING "Aumento de 20%"
    NEWLINE
    push eax
    push ebx
    push ecx
    mov ebx, 100d
    mov ecx, eax
    xor eax, eax
    .LOOP1:
        INC eax
        SUB ecx, ebx
        jz .CONT
        jns .LOOP1
    
    dec eax
    .CONT:
    mov ecx, eax
    mov ebx, 20d
    mov edx, 0d
        .LOOP2:
            add edx, ebx
            LOOP .LOOP2

pop ecx
pop ebx
pop eax
add edx, eax
ret
Caso5:
    PRINT_STRING "Aumento de 10%"
    NEWLINE
    push eax
    push ebx
    push ecx
    mov ebx, 100d
    mov ecx, eax
    xor eax, eax
    .LOOP1:
        INC eax
        SUB ecx, ebx
        jz .CONT
        jns .LOOP1
    
    dec eax
    .CONT:
    mov ecx, eax
    mov ebx, 10d
    mov edx, 0d
        .LOOP2:
            add edx, ebx
            LOOP .LOOP2

pop ecx
pop ebx
pop eax
add edx, eax
ret
Caso6:
    PRINT_STRING "Aumento de 5%"
    NEWLINE
    push eax
    push ebx
    push ecx
    mov ebx, 100d
    mov ecx, eax
    xor eax, eax
    .LOOP1:
        INC eax
        SUB ecx, ebx
        jz .CONT
        jns .LOOP1
    
    dec eax
    .CONT:
    mov ecx, eax
    mov ebx, 5d
    mov edx, 0d
        .LOOP2:
            add edx, ebx
            LOOP .LOOP2

pop ecx
pop ebx
pop eax
add edx, eax
ret