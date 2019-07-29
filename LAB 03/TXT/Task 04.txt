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
    ; TASK 04
    
    ;Taking input
    mov ah,1
    int 21h
    mov cl , al
    
    ;New Line 
    mov dl, 0AH
    mov ah , 2
    int 21h  
    
    ;Converting
    mov bl, cl
    add bl, 32
    
    ;Output    
    mov dl,bl 
    mov ah,2  
    int 21h 

    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
