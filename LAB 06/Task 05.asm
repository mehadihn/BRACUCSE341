; multi-segment executable file template.

data segment
    ; add your data here!
    x db 5 dup<?>
    
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
    mov cx, 5
    mov ah, 1
    mov si, 0
    
    begin:
    int 21h
    mov x[si], al
    add si, 1
    loop begin
    
    
    mov si, 0
    
    mov ah, 1
    int 21h
    sub al, 30h
    
    mov ah, 0

    mov si, ax  
 
    mov ah, 1
    int 21h
    sub al, 30h
    mov bl, al

    add x[si], bl

    ;printing newLine
    mov dl, 0AH
    mov ah, 2
    int 21h
    
    ;printing creg return
    mov dl, 13
    mov ah, 2
    int 21h
    
    mov dl, 0
    mov cx, 5
    mov ah, 2
    mov si, 0
    
    begin2:
    mov dl, x[si]
    
    int 21h
    add si, 1
    loop begin2  
    
        
    ; exit to operating system.
    
ends

end start ; set entry point and stop the assembler.
