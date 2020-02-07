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
    
    ;TASK 01 Take input in the register AX, and then move it to BX using the MOV instruction
   mov ax , 5
   mov bx, ax
   
   ;TASK 02 Swap two numbers, using a maximum of 3 registers. 
   mov ax , 2
   mov bx , 3
   mov cx, ax
   mov ax, bx
   mov bx, cx
   
   ;TASK 03 Add two numbers using two registers. 
   mov ax, 5
   mov bx, 5
   add ax , bx
   
   ;TASK 04 Subtract two numbers using two registers. 
   mov ax, 7
   mov bx, 2
   sub ax , bx  

   ;TASK 05 Swap two numbers using ADD/SUB instructions only. 
   mov ax , 2
   mov bx , 3
   add ax, bx 
   neg bx
   add bx, ax
   sub ax , bx   
   
   ;TASK 06 Perform the following arithmetic instructions. A, B, C are three variables to be declared beforehand 
   
   ; 1. A = B - A 
   mov ax , 5
   mov bx , 4                                      
   mov cx , 3
   sub bx, ax
   mov ax, bx
   
   ;2. A = -(A + 1) 
   add ax , 1
   neg ax
   
   ;3. C = A + (B + 1)    
   mov ax , 5
   mov bx , 4
   mov cx , 3
   inc bx
   add ax , bx
   mov cx, ax  
   
   ;4. A = B - (A - 1); use dec 
   mov ax , 5
   mov bx , 4
   mov cx , 3
   dec ax
   sub bx , ax
   mov ax , bx
   
   
   ;TASK 07 
   
   ;1. X * Y 
   mov al , 5
   mov bl , 2
   mul bl
          
   ;2. X / Y 
   mov al , 15
   mov bl , 5 
   div bl

   ;3. X * Y / Z 
    mov al , 5
    mov bl , 2
    
    mul bl
    mov ax , al
    mov bl , 5
    div bl 




    
    
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
