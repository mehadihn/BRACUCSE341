; multi-segment executable file template.

data segment
    ; add your data here!
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov bx , 1
    mov ax , 0
    
    begin:
        cmp bx , 7
        jg end
        add ax , bx
        add bx , 3
        jmp begin
        
    end:
    
   
    
    
    
    
    
ends

end start ; set entry point and stop the assembler.
