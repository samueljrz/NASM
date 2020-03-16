%include "io.inc"

section .data
    CaseTable DB 'A'        ; lookup value
    DD Process_A           ; address of procedure
    EntrySize EQU ($ - CaseTable)
    DB 'B'
    DD Process_B
    DB 'C'
    DD Process_C
    DB 'D'
    DD Process_D
    NumberOfEntries EQU ($ - CaseTable) / EntrySize
    msgA DB "Process_A",0
    msgB DB "Process_B",0
    msgC DB "Process_C",0
    msgD DB "Process_D",0
section .text
global CMAIN
CMAIN:
    mov al, 'D'                   ; Inserindo valor para comparar
    mov ebx, CaseTable            ; Move endereço de CaseTabe para o EBX
    mov ecx, NumberOfEntries      ; Move a quantidade de casos para ECX
L1: cmp al,[ebx]                  ; match Compara o primeiro caso com o valor inserido
    jne L2                        ; Compara se é igual
    call [ebx + 1]                ; Chama o processo dentro do caso 
    PRINT_STRING [EDX]            ; Mostra a mensagem carregada dentro de EDX
    NEWLINE
    jmp L3                        ; Termina a execução
L2: add ebx,EntrySize             ; Adiciona mais uma posição no endereço
    dec ecx                       ; Decrementa uma unidade na quantidade de casos
    JNZ L1                        ; Pula para L1 até que seja igual a zero
L3:
    xor eax, eax
    ret
    
Process_A:
mov edx, msgA
ret
Process_B:
mov edx, msgB
ret
Process_C:
mov edx, msgC
ret
Process_D:
mov edx, msgD
ret