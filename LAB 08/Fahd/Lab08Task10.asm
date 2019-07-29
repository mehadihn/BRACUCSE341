; multi-segment executable file template.

data segment
    ; add your data here!
    m dw "Eagle Eye$"
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
    
    StringDisp PROC
    lea dx, m
    mov ah, 9
    int 21h
    RET 
    ENDP StringDisp 
    
    
  
    call StringDisp 
    
    
    
    ; exit to operating system.
    
ends

end start ; set entry point and stop the assembler.
