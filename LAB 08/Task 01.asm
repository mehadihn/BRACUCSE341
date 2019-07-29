; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    text db "Hello World$"
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
            
    print1 MACRO a1
        mov ah , 9
        lea dx , a1
        int 21h
    ENDM
    
    print1 text
ends

end start ; set entry point and stop the assembler.
