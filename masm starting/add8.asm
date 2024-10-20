/*************  ✨ Codeium Command 🌟  *************/
Assume CS:code,DS:data

data segment

; strings to prompt user to enter two numbers
str1 db 0ah,"enter 1st no : $"
str2 db 0ah,"enter 2nd no : $"
; string to display the sum of two numbers
str3 db 0ah,"the sum is:$"

data ends

code segment

start : MOV ax,data
        mov ds,ax

        ; display the string to prompt user to enter first number
        lea dx,str1
        mov ah,09h
        int 21h

        ; read the first number from user
        mov ah,01h
        int 21h

        ; store the first number in bh
        mov bh,al
        int 21h

        ; read the second number from user
        mov bh,al
        int 21h

        ; store the second number in bl
        mov bl,al

        ; convert the numbers from ASCII to decimal
        ; bh = first number, bl = second number
        sub bx,3030

        ; display the string to prompt user to enter second number
        lea dx,str2
        mov ah,09h
        int 21h

        ; read the second number from user
        mov ah,01h
        int 21h

       ; store the second number in ch
       mov ch,al 
       int 21h

       ; store the second number in cl
       mov cl,al

       ; convert the numbers from ASCII to decimal
       ; ch = first number, cl = second number
       sub cx,3030h

       ; display the string to display the sum of two numbers
       lea dx,str3
       mov ah,09h
       int 21h

       ; add the two numbers
       ; ax = sum of two numbers
       mov ax,bx
       add ax,cx

       ; convert the sum from decimal to ASCII
       ; bh = hundreds, al = tens, ah = units
       mov bl,al
       mov al,ah
       mov ah,00h
       aaa

       ; display the sum of two numbers
       ; bh = hundreds, al = tens, ah = units
       mov bh,al
       mov dl,ah

       ; display the hundreds place
       add dl,3030h
       mov ah,02h
       int 21h

       ; display the tens place
       mov dl,bh
       add dl,3030h
       mov ah,02h
       int 21h

       ; display the units place
       mov dl,bl
       add dl,3030h
       mov ah,02h
       int 21h

       ; exit the program
       mov ah,4ch
       int 21h

code ends
end start
        
/******  57475d8c-0ddc-4f6c-b268-a1c46b416080  *******/ 