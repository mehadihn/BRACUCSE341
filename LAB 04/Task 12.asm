; multi-segment executable file template.

data segment
    ; add your data here!
    input db "Input: $"
    output db "Output: $"
    i db "i$"
    k db "k$"
    l db "l$"
    m db "m&"
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
    
    cmp al , 30h
    je printI
    cmp al , 31h
    je printI
    cmp al , 32h
    je printI
    cmp al , 33h
    je printI
    
    
    cmp al , 34h
    je printK
    cmp al , 35h
    je printK
    cmp al , 36h
    je printK
    
    cmp al , 37h
    je printL
    cmp al , 38h
    je printL
    cmp al , 39h
    je printL
    
    cmp al , 40h
    je printM
    
    
  
    printI:
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
        
        lea dx, i
        mov ah, 9
        int 21h
        jmp exit
        
    printK:
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
        
        lea dx, k
        mov ah, 9
        int 21h
        jmp exit
        
    printL:
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
        
        lea dx, l
        mov ah, 9
        int 21h
        jmp exit
        
    printM:
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
        
        lea dx, m
        mov ah, 9
        int 21h
        jmp exit
        
        
    exit:
    
    
    
            
        
ends

end start ; set entry point and stop the assembler.
