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
            
    
    mov bx , 100
    mov ax , 0
    
    begin:
        cmp bx , 5
        jl end
        add ax , bx
        sub bx , 5
        jmp begin
        
    end:    
ends

end start ; set entry point and stop the assembler.
