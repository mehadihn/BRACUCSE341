; multi-segment executable file template.

data segment
    ; add your data here!
    myarr db 1,2,3,4,5
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
    mov cx,5
    mov ah,2
    mov si,0
    
    start1:
    mov ax,myarr[si]
    push ax
    add si,1
    loop start1
    
    mov cx, 5
    print:
    pop bx
    add bx , 48
    mov dl , bx
    mov ah,2
    int 21h
    loop print
    
            
       
ends

end start ; set entry point and stop the assembler.
