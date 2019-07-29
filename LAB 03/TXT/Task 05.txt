; multi-segment executable file template.

data segment
    ; add your data here!
    s1 db "THE SUM OF $"
    s2 db " AND $"
    s3 db " IS $"
    
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
    
    ;Printing '?'
    MOV DL, 03FH  ;character is '?'     
    mov ah , 2
    INT 21h  ;display character 
    
    ;Input 1
    mov ah,1
    int 21h
    mov cl , al
    mov bl, cl 
    
    ;Input 2
    mov ah,1
    int 21h
    mov ch , al
    
    ;Sum and Sub to convert
    mov dl , cl
    add cl, ch
    sub cl, 030h
    
    ;New Line
    mov dl, 0AH
    mov ah , 2
    int 21h 
    
    
    mov dL,0DH ;carriage return
    int 21h ;execute carriage return
    mov dL,0AH ;line feed
    int 21h ;execute line feed
    
    
    ;PRINTING
    lea dx, s1
    mov ah, 9
    int 21h
    
    mov dl,bl
    mov ah,2
    int 21h
    
    lea dx, s2
    mov ah, 9
    int 21h
    
    mov dl,ch
    mov ah,2
    int 21h 
    
    lea dx, s3
    mov ah, 9
    int 21h
    
    
    ;Print of Summation
    mov dl,cl
    mov ah,2
    int 21h   
    
    
    
            
    
     
ends

end start ; set entry point and stop the assembler.
