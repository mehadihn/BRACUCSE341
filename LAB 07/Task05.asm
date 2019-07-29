; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
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
            
   mov ax , 124
   mov bl , 100
   div bl
   mov bx , ah
   mov ah , 0
   push ax
   
   mov ax , bx
   mov bl , 10
   div bl
   mov bx , ah
   mov ah , 0
   push ax 
   
   mov ax , bx
   push ax
   
   
    mov cx, 3
    print:
    pop bx
    add bx , 48
    mov dl , bx
    mov ah,2
    int 21h
    loop print
   
   
ends

end start ; set entry point and stop the assembler.
