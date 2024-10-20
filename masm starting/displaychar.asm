/*************  ✨ Codeium Command 🌟  *************/
Assume CS:code DS:data
datasegment
    ; string to prompt user to enter a number
    str1 db 0ah,"enter 1st no : $"
    ; string to display the number entered by user
    str2 db 0ah,"the number is : $"

data ends

code segment

start:
    ; initialize data segment
    mov ax, data
    mov ds, ax

    ; display the string to prompt user to enter a number
    lea dx,str1
    mov ah,09h
    int 21h

    ; read a character from user
    mov ah,01h
    int 21h

    ; store the character in bl
    mov bl,al

    ; display the string to display the number entered by user
    lea dx,str2
    mov ah,09h
    int 21h

    ; display the character entered by user
    mov dl,bl
    mov ah,02h
    int 21h

    ; exit the program
    mov ah,4ch
    int 21h

    code ends
    end start
/******  23bebcb4-e934-4ad4-ac7e-fd55d6b9b272  *******/ 