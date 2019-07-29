; multi-segment executable file template.

data segment
    ; add your data here!
    s db "hello"
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
            
    rev MACRO a1
        mov si , offset a1
        
        mov cx , 5
        loop1:
            mov bx , [si]
            push bx
            inc si
            loop loop1
            
        mov cx , 5
        print: 
            pop dx
            mov ah , 2
            int 21h
            loop print
    ENDM
    
    rev s
ends

end start ; set entry point and stop the assembler.
