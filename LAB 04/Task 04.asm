; multi-segment executable file template.

data segment
    ; add your data here!
   
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
    
    ;mov al , 1
    ;mov al , 3
    ;mov al , 2
    mov al , 4
    
    cmp al , 1
    je DisO
    cmp al , 3
    je DisO
    cmp al , 2
    je DisE
    cmp al , 4
    je DisE
    
    DisO:
        mov ah , 2
        mov dl , 'o'
        int 21h
        jmp exit
        
    DisE:
        mov ah , 2
        mov dl , 'e'
        int 21h
        jmp exit
        
    exit:
            
   
ends

end start ; set entry point and stop the assembler.
