assume CS:code, DS:data

data segment
    list db 30h, 04h, 01h, 05h, 37h  ; List of 5 values (in hexadecimal)
    count db 04h                     ; The number of iterations (4 passes)
data ends

code segment

start:
    mov ax, data    ; Load the starting address of the data segment into AX
    mov ds, ax      ; Initialize DS with the address of the data segment
    mov ch, 04h     ; Outer loop counter (the number of passes is 4)

up2:
    mov cl, 04h     ; Inner loop counter (4 comparisons per pass)
    lea si, list    ; Load the address of the start of the list into SI

again:
    mov al, [si]    ; Load the current element from the list into AL
    mov bl, [si+1]  ; Load the next element into BL
    cmp al, bl      ; Compare AL and BL (current element vs next element)
    jc done         ; If AL < BL, skip the swap (carry flag set if AL < BL)

    ; Swap elements if AL >= BL
    mov al, [si+1]  ; Move the next element to AL
    xchg [si], dl   ; Exchange the current element in memory with DL
    mov [si+1], dl  ; Store the previous element in DL into the next position

done:
    inc si          ; Move to the next pair of elements in the list
    dec cl          ; Decrease the inner loop counter
    jnz again       ; Repeat if CL (inner loop counter) is not zero

    dec ch          ; Decrease the outer loop counter
    jnz up2         ; Repeat outer loop if CH (outer loop counter) is not zero

    int 3           ; Breakpoint interrupt (used for debugging)

    ; Terminate program (if it were to continue)
    mov ah, 04h     ; DOS interrupt function (unspecified in this context)
    int 21h         ; Call DOS interrupt

code ends
end start
