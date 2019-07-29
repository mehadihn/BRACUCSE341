; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$" 
    str db "Please insert a character:$" 
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
    
    
    ;TASK 01 : Take a character input and display it. 
    ;Display the message "Please insert a character: " when taking an input
    
    
            
    lea dx, str
    mov ah, 9
    int 21h        ; output string at ds:dx
            
    ;Input
    mov ah,1 
    int 21h 
    
    ;Output
    mov dl,al ;Input Goes to al
    mov ah,2  
    int 21h
    
    
    
    
    
            
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
