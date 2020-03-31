;test if the bits 1, 4, 7 being sets

%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 2, ax
    bt ax, 1
    jnc FAIL
    bt ax, 4
    jnc FAIL
    bt ax, 7
    jnc FAIL
    PRINT_STRING "os bits 1, 4 e 7 estão setados!!!"
    xor eax, eax
    ret

FAIL:
    PRINT_STRING "os bits não estão completos"
    ret