/*************  ✨ Codeium Command 🌟  *************/
Assume DS:data CS:code

data segment

; string to be displayed
msg1 db 0ah,"hello$"

; another string to be displayed
msg2 db 0ah,"world$"

data ends

code segment

start : MOV ax,data
        MOV ds,ax

        ; display the first string
        MOV dx,offset msg1
        MOV ah,09h
        int 21h

        ; display the second string
        
        MOV dx, offset msg2
        MOV ah,09h
        int 21h

        ; terminate the program
        
        MOV ah,4ch
        int 21h

        code ends
        end start

; Repeating codes can be avoided by using procedures. Procedures are reusable blocks of code that can be called from different parts of the program. In this case, we can create a procedure to display a string, and then call that procedure from two different parts of the program. This will avoid the repetition of codes.
/******  77ea860b-cb02-48bc-9baa-047bfe218151  *******/ 