; multi-segment executable file template.

data segment
    ; add your data here!
    
    lrg db ?
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    
    maxn MACRO a1 , a2 , a3
        
       mov al , a1
       mov lrg , al
       cmp al , a2
       jge check1
       mov al , a2
       mov lrg , al
       
       check1:
             mov al , lrg
             cmp al , a3
             jge check2
             mov al , a3
             mov lrg , al
       
       check2:
             LEA DX , lrg
             mov ah , 9
             
             int 21h
    ENDM
    
    
    maxn 4 , 5 , 7
             
       
ends

end start ; set entry point and stop the assembler.
