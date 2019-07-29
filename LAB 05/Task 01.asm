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
    mov bh , 0 
    mov ah , 2
    mov dl , '*'
    
    begin:
        cmp bh , 80
        jge end
        int 21h
        inc bh
        jmp begin
        
    end:       
        
ends

end start ; set entry point and stop the assembler.
