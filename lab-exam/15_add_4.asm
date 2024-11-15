assume CS:code, DS:data

data segment
str1 db 0ah, "enter 1st number$" ; Prompt for the first number with a newline
str2 db 0ah, "enter 2nd number$" ; Prompt for the second number with a newline
str3 db 0ah, "the sum is : $"    ; Message to display before showing the sum
data ends

code segment
start: 
    mov ax, data          ; Load the address of the data segment into AX
    mov ds, ax            ; Initialize the DS register with the address of the data segment

    lea dx, str1          ; Load the address of str1 (prompt for the first number) into DX
    mov ah, 09h           ; Set function 09h (display string) in AH
    int 21h               ; Call DOS interrupt to display the string

    mov ah, 01h           ; Set function 01h (read character) in AH
    int 21h               ; Call DOS interrupt to read a character from the keyboard
    sub al, 30h           ; Convert ASCII to integer by subtracting ASCII value of '0'
    mov bl, al            ; Store the first number in BL

    lea dx, str2          ; Load the address of str2 (prompt for the second number) into DX
    mov ah, 09h           ; Set function 09h to display the string
    int 21h               ; Call DOS interrupt to display the string

    mov ah, 01h           ; Set function 01h to read a character from the keyboard
    int 21h               ; Call DOS interrupt to read a character
    sub al, 30h           ; Convert ASCII to integer

    lea dx, str3          ; Load the address of str3 (display the sum message) into DX
    mov ah, 09h           ; Set function 09h to display the string
    int 21h               ; Call DOS interrupt to display the string
    add al,bl             ; Add the first number (in BL) to the second number (in AL)

    mov ah, 00h           ; Clear AH to prepare for BCD adjustment
    aaa                   ; Adjust the sum in AL to Binary Coded Decimal (BCD)

    mov bl, al            ; Move the adjusted sum into BL
    mov dl, ah            ; Move the tens digit (if any) into DL
    add dl, 30h           ; Convert the tens digit from binary to ASCII
    mov ah, 02h           ; Set function 02h (display character) in AH
    int 21h               ; Call DOS interrupt to display the tens digit

    mov dl, bl            ; Move the ones digit into DL
    add dl, 30h           ; Convert the ones digit from binary to ASCII
    mov ah, 02h           ; Set function 02h to display the character
    int 21h               ; Call DOS interrupt to display the ones digit

    mov ah, 4ch           ; Terminate the program
    int 21h               ; Call DOS interrupt to exit

code ends
end start
