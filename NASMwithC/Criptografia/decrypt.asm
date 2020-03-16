    global decrypt

    section .data
      BUF_SIZE equ 256

    section .bss
      fd_in resd 1
      fd_out resd 1
      in_buf resd BUF_SIZE
      in_file_name resb 100 
      out_file_name resb 100
      key resb 1
    
    section .text
    
    decrypt:
        mov ebp, esp; for correct debugging                           
    
        mov eax, [esp + 4]             ; Name
        mov ebx, [esp + 8]             ; Key
        mov [in_file_name], eax
        mov [key], ebx
          
    ; Name out file
         
        mov eax, in_file_name 
        mov ebx, out_file_name
        
    comp:
        cmp eax, 5Fh                  ; Exception 1 -> EAX = '_'
        je exception_1 
        cmp eax, 2Eh                  ; Exception 2 -> EAX = '.'
        je exception_2
        
        mov ebx, eax
        inc eax
        inc ebx
        jmp comp
        
      exception_1:
     
        mov ebx, 2Eh
        jmp comp              
    
      exception_2:
    
        mov ebx, 0
        jmp open    

    ; Open in file 
    open:

        mov EAX,5            
        mov EBX,in_file_name 
        mov ECX,0            
        mov EDX, 700         
        int 0x80
        mov [fd_in],EAX      
    
        cmp EAX,0
        jge create_file
        jmp done
    
    ; Create out file        
    create_file:
    
        mov EAX,8                   
        mov EBX,out_file_name    
        mov ECX,777             
        int 0x80
        mov [fd_out],EAX 
                
        cmp EAX,0
        jge read
        jmp close_exit
    
    ; Read in file
    read:
    
        mov EAX,3             
        mov EBX, [fd_in]      
        mov ECX, in_buf
        mov EDX, BUF_SIZE     
        int 0x80
    
    decript:
        
       push EAX
       dec EAX
       mov ECX, EAX    
       mov ebx, in_buf 
        
     action_decrip:
        
        mov eax, [ebx]
        xor eax, [key]
        mov [ebx], eax
        add ebx, 1
        LOOP action_decrip            
        pop EAX 
    
    ; Write out file
    write:

        mov EDX,EAX           
        mov EAX,4             
        mov EBX,[fd_out]      
        mov ECX, in_buf 
        int 0x80
        
        cmp EDX, BUF_SIZE  
        jl  copy_done          
        jmp read
        
    ; Close out file    
    copy_done:

        mov EAX,6             
        mov EBX,[fd_out]
        int 0x80
        
    ; Close in file    
    close_exit: 

        mov EAX,6             
        mov EBX,[fd_in]
        int 0x80
        
    ; To clear EAX    
    done:
  
        xor eax, eax
        ret     
