Assume DS:data CS:code

data segment

msg1 db 0ah,"hello$"
msg2 db 0ah,"world$"

data ends

code segment

start : MOV ax,data
        MOV ds,ax
        MOV dx,offset msg1
        MOV ah,09h
        int 21h
        
        MOV dx, offset msg2
        MOV ah,09h
        int 21h
        
        MOV ah,4ch
        int 21h

        code ends
        end start