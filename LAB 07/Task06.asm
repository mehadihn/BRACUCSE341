; multi-segment executable file template.

data segment
    ; add your data here!
    myarr db 'h' , 'a' , 'n' , 'n' , 'a' , 'h' 
    m1 db "No$"
    m2 db "Yes$"
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
    mov cx , 3
    mov si , 0
    xor ax,ax
    stackPush:
    mov al , myarr[si]
    push ax
    inc si
    loop stackPush
    
    xor cx,cx
    check:
    cmp si, 5
    je finish
    pop bx 
    
    mov cl, myarr[si] 
    inc si
    cmp bx , cx  
    jne print 
    je check
    
    
    
    print:
    LEA DX,m1
    mov AH,9
    int 21h
    
    
    
    finish:        
        
ends

end start ; set entry point and stop the assembler.
