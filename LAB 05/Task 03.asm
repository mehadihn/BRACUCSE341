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
    
    mov bx , 1
    
    begin:
    cmp bx , 5
    jg end

    MOV AH, 1  ;read character function 
    INT 21h ;character in AL
    add bx , 1     
    jmp begin
    
    end:
    
    mov ah , 2
    mov dL,0DH 
    int 21h 
 
    mov cx , 1
    
    print:
    cmp cx , 5
    jg pend
    mov ah , 2
    mov dl , 'X'
    int 21h
    add cx , 1
    
    jmp print
    
    pend:
    
      
ends

end start ; set entry point and stop the assembler.
