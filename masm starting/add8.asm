    /*************  ✨ Codeium Command 🌟  *************/
Assume CS:code,DS:data

data segment
    str1 db 0ah, "enter 1st no : $"   ; Prompt for the 1st number
    str2 db 0ah, "enter 2nd no : $"   ; Prompt for the 2nd number
    str3 db 0ah, "the sum is:$"       ; Message to show the sum
data ends

code segment
start: 
    MOV ax, data                     ; Initialize the data segment
    mov ds, ax                       

    lea dx, str1                     ; Load address of str1 into DX
    mov ah, 09h                      ; DOS function 09h to display the string
    int 21h                          ; Interrupt 21h to print the message

    mov ah, 01h                      ; DOS function 01h to read a character from the keyboard
    int 21h                          ; Interrupt 21h to get the first input (stored in AL)

    mov bl, al                       ; Store the first number (ASCII) in BL
    sub bl, 30h                      ; Convert ASCII to numeric value (subtract '0')

    lea dx, str2                     ; Load address of str2 into DX
    mov ah, 09h                      ; DOS function 09h to display the string
    int 21h                          ; Interrupt 21h to print the message

    mov ah, 01h                      ; DOS function 01h to read another character
    int 21h                          ; Interrupt 21h to get the second input (stored in AL)

    mov cl, al                       ; Store the second number (ASCII) in CL
    sub cl, 30h                      ; Convert ASCII to numeric value (subtract '0')

    lea dx, str3                     ; Load address of str3 into DX
    mov ah, 09h                      ; DOS function 09h to display the result message
    int 21h                          ; Interrupt 21h to print the message

    mov al, bl                       ; Move the first number (from BL) to AL
    add al, cl                       ; Add the second number (CL) to the first (AL)

    ;aaa                              ; ASCII adjust AL after addition (corrects BCD values)
    aaa                              ; ASCII adjust AL after addition (corrects BCD values)
    
    add al, 30h                      ; Convert result (lower nibble) back to ASCII
    mov dl, al                       ; Move the lower byte to DL for printing
    mov ah, 02h                      ; DOS function 02h to print the character
    int 21h                          ; Print the result lower byte

    mov ah, 4ch                      ; DOS function 4Ch to terminate the program
    int 21h                          ; Interrupt 21h to terminate the program
code ends
end start

/******  8ea3f600-9222-4274-bc3e-316efe5dbc12  *******/