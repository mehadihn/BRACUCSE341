; multi-segment executable file template.

data segment
    ; add your data here!
    input db "Input: $"
    output db "Output: $"
    28days db "28 days$"
    30days db "30 days$"
    31days db "31 days$"
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
    lea dx, input
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    cmp al , 31h
    je print31
    
    cmp al , 32h
    je print28
    
    cmp al , 33h
    je print31
    
    cmp al ,  34h
    je print30
    
    cmp al , 35h
    je print31
    
    cmp al , 36h
    je print30
    
    cmp al , 37h
    je print31
    
    cmp al ,  38h
    je print31
    
    cmp al ,  39h
    je print30
    
    cmp al ,  40h
    je print31
    
    
    print28:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, 28days
        mov ah, 9
        int 21h
        jmp exit
        
    print30:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, 30days
        mov ah, 9
        int 21h
        jmp exit
        
    print31:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, 31days
        mov ah, 9
        int 21h
        jmp exit
        
    exit:       
       
ends

end start ; set entry point and stop the assembler.
