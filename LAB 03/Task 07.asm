; multi-segment executable file template.

data segment
    ; add your data here!
    s1 db "ENTER A HEX DIGIT: $" 
    s2 db "IN DECIMAL IT IS: $"
   
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
    ;Printing Prompt & Input
    lea dx, s1
    mov ah, 9
    int 21h
    
    mov ah,1 
    int 21h
    mov bh , al
    
    ;Second Line and Prompt
    mov dl, 0AH
    mov ah , 2
    int 21h
    mov dL,0DH 
    int 21h 
    mov dL,0AH 
    int 21h
    
    lea dx, s2
    mov ah, 9
    int 21h
    
    ; Printing 1 as first number will always be 1
    mov ah , 2
    mov dl , 31h 
    int 21h
    
    
    ;Printing Second Number by subtracting 11
    mov ah , 2
    sub bh , 11h
    mov dl , bh
    int 21h        
    
ends

end start ; set entry point and stop the assembler.
