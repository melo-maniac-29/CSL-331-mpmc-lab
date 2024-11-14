assume CS:code, DS:data

data segment
a dw 0601H       ; Define a word (16-bit) variable 'a' with the value 0601H (hexadecimal)
b dw 0102H       ; Define a word (16-bit) variable 'b' with the value 0102H (hexadecimal)
v dw ?           ; Define a word variable 'v' without an initial value (uninitialized)
data ends

code segment
start:
    mov ax, data ; Load the address of the data segment into AX
    mov ds, ax   ; Initialize the DS (data segment) register with the address of the data segment

    mov ax, a    ; Load the value of variable 'a' (0601H) into AX
    mov bx, b    ; Load the value of variable 'b' (0102H) into BX

    add ax, bx   ; Add the value in BX (0102H) to AX (0601H), result is 0703H

    mov v, ax    ; Store the result (0703H) in variable 'v'

    int 3        ; Trigger a software interrupt (used for debugging, here it acts as a program end)

code ends
end start
