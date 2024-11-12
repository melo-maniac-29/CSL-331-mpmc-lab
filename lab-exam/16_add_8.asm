assume CS:code, DS:data

data segment
    str1 db 0ah, "enter 1st number :$"   ; Message prompting user for the 1st number
    str2 db 0ah, "enter 2nd number :$"   ; Message prompting user for the 2nd number
    str3 db 0ah, "the sum is:$"          ; Message to display the sum
data ends

code segment
start:
    mov ax, data    ; Load the starting address of the data segment into AX
    mov ds, ax      ; Initialize DS with the address of the data segment

    ; Prompt for 1st number
    lea dx, str1    ; Load address of str1 (prompt message) into DX
    mov ah, 09h     ; DOS interrupt to display the string (function 09h)
    int 21h         ; Call DOS interrupt

    ; Input the 1st number
    mov ah, 01h     ; DOS interrupt to take a single character input (function 01h)
    int 21h         ; Call DOS interrupt
    mov bh, al      ; Save the ASCII of the 1st number in BH
    int 21h         ; Call DOS interrupt
    mov bl, al      ; Also save the same number in BL for future use
    sub bx, 3030h   ; Convert ASCII to integer (subtract ASCII of '0')

    ; Prompt for 2nd number
    lea dx, str2    ; Load address of str2 (prompt message) into DX
    mov ah, 09h     ; DOS interrupt to display the string (function 09h)
    int 21h         ; Call DOS interrupt

    ; Input the 2nd number
    mov ah, 01h     ; DOS interrupt to take a single character input (function 01h)
    int 21h         ; Call DOS interrupt
    mov ch, al      ; Save the ASCII of the 2nd number in CH
    int 21h         ; Call DOS interrupt
    mov cl, al      ; Also save the same number in CL for future use
    sub cx, 3030h   ; Convert ASCII to integer (subtract ASCII of '0')

    ; Display "the sum is" message
    lea dx, str3    ; Load address of str3 (prompt message) into DX
    mov ah, 09h     ; DOS interrupt to display the string (function 09h)
    int 21h         ; Call DOS interrupt

    ; Add the two numbers
    mov ax, bx      ; Move the value of the 1st number (BX) into AX
    add ax, cx      ; Add the value of the 2nd number (CX) to AX

    ; Adjust the result for ASCII display
    mov bl, al      ; Move the result (lower byte) into BL
    mov al, ah      ; Move the higher byte into AL for further adjustment
    aaa             ; ASCII Adjust After Addition (corrects AX for BCD)

    ; Output the result in ASCII
    mov bh, al      ; Move the adjusted higher byte (tens digit) into BH
    mov dl, ah      ; Move the ASCII-adjusted tens digit into DL
    add dl, 3030h   ; Convert the adjusted value back to ASCII
    mov ah, 02h     ; DOS interrupt to print a single character (function 02h)
    int 21h         ; Call DOS interrupt to display the tens digit

    mov dl, bh      ; Move the tens digit into DL
    add dl, 3030h   ; Convert the tens digit to ASCII
    mov ah, 02h     ; DOS interrupt to print a single character (function 02h)
    int 21h         ; Call DOS interrupt to display the tens digit

    mov dl, bl      ; Move the ones digit into DL
    add dl, 3030h   ; Convert the ones digit to ASCII
    mov ah, 02h     ; DOS interrupt to print a single character (function 02h)
    int 21h         ; Call DOS interrupt to display the ones digit

    ; Terminate the program
    mov ah, 4Ch     ; DOS interrupt to terminate the program (function 4Ch)
    int 21h         ; Call DOS interrupt

code ends
end start
