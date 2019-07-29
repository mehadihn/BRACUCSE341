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
            
    fact MACRO a1
        mov al , a1
        mov bl , a1
        
        calc:
            cmp a1 , 1h
            jle exit
            
            dec bl
            mul bl
            dec a1
            jmp calc
            
        exit:
            add ax , 48
            mov dx , ax
            mov ah , 2
            int 21h
        
    ENDM
    
    mov ch , 3h
    fact ch
ends

end start ; set entry point and stop the assembler.
