
 implicit addressing mode

MOV AX, [3000h]   ; Load the 16-bit value from memory address 3000h into AX
MOV BX, [4000h]   ; Load the 16-bit value from memory address 4000h into BX
ADD AX, BX        ; Add the value in BX to AX
MOV [6000h], AX   ; Store the result from AX to memory address 6000h
HLT               ; Halt the program



 explicit addressing mode


MOV AX, 0300h     ; Load the immediate value 0300h into AX
MOV BX, 0200h     ; Load the immediate value 0200h into BX
ADD AX, BX        ; Add the value in BX to AX
MOV [6000h], AX   ; Store the result from AX to memory address 6000h
HLT               ; Halt the program
