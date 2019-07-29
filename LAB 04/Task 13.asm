; multi-segment executable file template.

data segment
    ; add your data here!
    input db "Input: $"
    output db "Output: $"
    sat db "Saturday$"
    sun db "Sunday$"
    mon db "Monday$"
    tue db "Tuesday$"
    wed db "Wednesday$"
    thu db "Thursday$"
    fri db "Friday$"
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
    je printSat
    cmp al , 32h
    je printSun
    cmp al , 33h
    je printMon
    cmp al , 34h
    je printTue
    cmp al , 35h
    je printWed
    cmp al , 36h
    je printThu
    cmp al , 37h
    je printFri
    
    
    printSat:
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
        
        lea dx, sat
        mov ah, 9
        int 21h
        jmp exit
        
        
    printSun:
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
        
        lea dx, sun
        mov ah, 9
        int 21h
        jmp exit
        
    printMon:
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
        
        lea dx, mon
        mov ah, 9
        int 21h
        jmp exit
        
    printTue:
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
        
        lea dx, tue
        mov ah, 9
        int 21h
        jmp exit
        
    printWed:
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
        
        lea dx, wed
        mov ah, 9
        int 21h
        jmp exit
        
    printThu:
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
        
        lea dx, thu
        mov ah, 9
        int 21h
        jmp exit
        
    printFri:
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
        
        lea dx, fri
        mov ah, 9
        int 21h
        jmp exit
        
    exit:        
        
ends

end start ; set entry point and stop the assembler.
