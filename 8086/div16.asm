; Implicit Addressing Mode
MOV AX, [3000h]    ; Load the 16-bit value from memory address 3000h into AX
MOV BX, [4000h]    ; Load the 16-bit value from memory address 4000h into BX
DIV BX             ; Divide AX by BX, quotient in AX, remainder in DX
MOV [6000h], AX    ; Store the quotient from AX to memory address 6000h
MOV [7000h], DX    ; Store the remainder from DX to memory address 7000h
HLT                ; Halt the program


; Explicit Addressing Mode
MOV AX, 1000h      ; Load the immediate value 1000h into AX
MOV BX, 0200h      ; Load the immediate value 0200h into BX
DIV BX             ; Divide AX by BX, quotient in AX, remainder in DX
MOV [6000h], AX    ; Store the quotient from AX to memory address 6000h
MOV [7000h], DX    ; Store the remainder from DX to memory address 7000h
HLT                ; Halt the program
