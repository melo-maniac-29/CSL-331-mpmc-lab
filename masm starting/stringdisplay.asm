/*************  ✨ Codeium Command 🌟  *************/
Assume CS:code DS:data
data segment
;
; string to be displayed
;
msg1 db "hello world$"
data ends

code segment

;
; start of the program
;
start : MOV AX,data
        MOV DS,AX
;
; load the address of the string to be displayed
;
        MOV dx,offset msg1
;
; display the string
;
        MOV ah,09h
        int 21h
;
; terminate the program
;
        MOV ah,4ch
        INT 21h

code ends

end start
/******  6e5d4b15-a135-4cbd-9913-3219adf9bb31  *******/ 