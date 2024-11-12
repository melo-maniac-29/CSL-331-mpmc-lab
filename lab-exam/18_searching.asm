assume cs:code, ds:data

data segment
    msg1 db 0ah, 0dh, "element found $"    ; Message to display when the element is found (with newline and carriage return)
    msg2 db 0ah, 0dh, "element not found $" ; Message to display when the element is not found
    list db 03h, 01h, 04h, 05h             ; List of elements to search through (4 elements in this case)
    count db 04h                           ; Number of elements in the list
    str1 db 03h                            ; Element to search for (in this case, 03h)
data ends

code segment

start:
    mov ax, data       ; Load the address of the data segment into AX
    mov ds, ax         ; Initialize DS register with the data segment address

    mov al, str1       ; Move the search element (03h) into AL
    lea si, list       ; Load the address of the list into SI register (used for iterating through the list)
    mov cl, 04h        ; Set the loop counter to 4 (number of elements in the list)

again:
    mov bl, [si]       ; Load the current element of the list (pointed by SI) into BL
    cmp bl, al         ; Compare the list element (BL) with the search element (AL)
    jz found           ; If equal (zero flag set), jump to 'found' (element is found)

    inc si             ; Increment SI to point to the next element in the list
    dec cl             ; Decrement the loop counter (CL)
    jnz again          ; If CL is not zero, jump to 'again' and continue searching

    lea dx, msg2       ; Load the address of the "element not found" message into DX
    mov ah, 09h        ; DOS interrupt to display the string (function 09h)
    int 21h            ; Call DOS interrupt to display the message
    jmp labelsp        ; Jump to program termination

found:
    lea dx, msg1       ; Load the address of the "element found" message into DX
    mov ah, 09h        ; DOS interrupt to display the string (function 09h)
    int 21h            ; Call DOS interrupt to display the message

labelsp:
    mov ah, 4ch        ; DOS function to terminate the program (function 4Ch)
    int 21h            ; Call DOS interrupt to terminate

code ends
end start
