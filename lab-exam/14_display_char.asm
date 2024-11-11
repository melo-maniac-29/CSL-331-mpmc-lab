ASSUME CS:code, DS:data

data segment
    ; String to prompt user to enter a number
    str1 db 0Ah, "enter 1st no : $"

    ; String to display the number entered by the user
    str2 db 0Ah, "the number is : $"
data ends

code segment
start:
    ; Initialize data segment
    MOV AX, data
    MOV DS, AX

    ; Display prompt string to enter a number
    LEA DX, str1            ; Load address of str1 into DX
    MOV AH, 09h             ; DOS function to display a string
    INT 21h                 ; Call interrupt

    ; Read a character from user input
    MOV AH, 01h             ; DOS function to read a character
    INT 21h                 ; Call interrupt
    MOV BL, AL              ; Store the character entered by user in BL

    ; Display string indicating the number entered by user
    LEA DX, str2            ; Load address of str2 into DX
    MOV AH, 09h             ; DOS function to display a string
    INT 21h                 ; Call interrupt

    ; Display the character entered by user
    MOV DL, BL              ; Move user-entered character to DL
    MOV AH, 02h             ; DOS function to display a character
    INT 21h                 ; Call interrupt

    ; Exit the program
    MOV AH, 4Ch             ; DOS function to terminate program
    INT 21h                 ; Call interrupt

code ends
end start
