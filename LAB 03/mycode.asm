; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$" 
    myStr db "Mehadi Hassan$"
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
    
    
    MOV DL, 03FH  ;character is '?'     
    mov ah , 2
    INT 21h  ;display character  
    
    ;input
    mov ah , 1
    int 21h
    mov bx , al
    
    ;New Line
    mov dl, 0AH
    mov ah , 2
    int 21h
    
    ;Carage Print New Line goes to the margin
    mov dl, 13
    int 21h
    
    ;Final Print
    mov dl, bx
    mov ah ,2
    int 21h
    
    mov dl , 36
    mov ah , 2
    int 21h
    
    mov dl , 32
    mov ah , 2
    int 21h 
             
    lea dx, myStr
    mov ah, 9
    int 21h        ; output string at ds:dx   
    
    mov dl , 32
    mov ah , 2
    int 21h
    
    mov dl , 36
    mov ah , 2
    int 21h 
    
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
