ASSUME DS:data, CS:code

data segment
    ; string to be displayed
    msg1 db 0Ah, "hello$"   

    ; another string to be displayed
    msg2 db 0Ah, "world$"   
data ends

code segment
start:
        MOV AX, data           ; Load the address of the data segment into AX
        MOV DS, AX             ; Move AX to DS to set up the data segment

        ; Display the first string (msg1)
        MOV DX, offset msg1    ; Load the offset of msg1 into DX
        MOV AH, 09h            ; DOS interrupt to display a string
        INT 21h                ; Call interrupt

        ; Display the second string (msg2)
        MOV DX, offset msg2    ; Load the offset of msg2 into DX
        MOV AH, 09h            ; DOS interrupt to display a string
        INT 21h                ; Call interrupt

        ; Terminate the program
        MOV AH, 4Ch            ; DOS function to terminate program
        INT 21h                ; Call interrupt

code ends
end start
