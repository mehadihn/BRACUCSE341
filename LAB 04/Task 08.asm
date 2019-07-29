; multi-segment executable file template.

data segment
    ; add your data here!
    e db "Vioel$"
    o db "Constant$"
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
            
    mov ah , 1
    int 21h
    
    cmp al , 'A'
    je printEven
    cmp al , 'E'
    je printEven
    cmp al , 'I'
    je printEven
    cmp al , 'O'
    je printEven
    cmp al , 'U'
    je printEven
    
    cmp al , 'a'
    je printEven
    cmp al , 'e'
    je printEven
    cmp al , 'i'
    je printEven
    cmp al , 'o'
    je printEven
    cmp al , 'u'
    je printEven
    
    LEA DX,o 
    mov AH,9 
    int 21h 
    jmp exit
   
   
    printEven:  
    LEA DX,e 
    mov AH,9 
    int 21h 
    
    exit:
    
     
ends

end start ; set entry point and stop the assembler.
