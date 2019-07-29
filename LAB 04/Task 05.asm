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
    
    mov ah , 1
    int 21h
    
    cmp al , 61h
    jl print
    jmp exit
    
    print:
    mov ah , 2
    mov dl , al
    int 21h
    
    exit:
            
    
ends

end start ; set entry point and stop the assembler.
