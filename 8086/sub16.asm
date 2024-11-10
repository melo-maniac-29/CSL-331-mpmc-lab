; Implicit Addressing Mode
MOV AX, [3000h]   ; Load the 16-bit value from memory address 3000h into AX
MOV BX, [4000h]   ; Load the 16-bit value from memory address 4000h into BX
SUB AX, BX        ; Subtract the value in BX from AX
MOV [6000h], AX   ; Store the result from AX to memory address 6000h
HLT               ; Halt the program


; Explicit Addressing Mode
MOV AX, 0100h     ; Load the immediate value 0100h into AX
MOV BX, 0050h     ; Load the immediate value 0050h into BX
SUB AX, BX        ; Subtract the value in BX from AX
MOV [6000h], AX   ; Store the result from AX to memory address 6000h
HLT               ; Halt the program
