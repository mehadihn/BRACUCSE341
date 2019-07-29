; multi-segment executable file template.

data segment
    ; add your data here!
    e db "Even$"
    o db "Odd$" 
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
    mov ah , 0
    mov ax , al
    mov bl ,2
    
    cmp al , 0 
    je printEven
    
    div bl
    cmp ah , 0
    je printEven
    
    LEA DX,o 
    mov AH,9 
    int 21h
    jmp exit 
    
    
    
    printEven:  
    LEA DX,e 
    mov AH,9 
    int 21h 
    
    exit: 
    
ends

end start ; set entry point and stop the assembler.
