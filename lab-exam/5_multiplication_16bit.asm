; Implicit Addressing Mode
MOV AX, [3000h]    ; Load the 16-bit value from memory address 3000h into AX
MOV BX, [4000h]    ; Load the 16-bit value from memory address 4000h into BX
IMUL BX            ; Multiply AX by BX, result stored in DX:AX
MOV [6000h], AX    ; Store the lower 16 bits of the result (in AX) at memory address 6000h
MOV [6002h], DX    ; Store the upper 16 bits of the result (in DX) at memory address 6002h
HLT                ; Halt the program


; Explicit Addressing Mode
MOV AX, 0600h      ; Load the immediate value 0600h into AX
MOV BX, 0300h      ; Load the immediate value 0300h into BX
IMUL BX            ; Multiply AX by BX, result stored in DX:AX
MOV [6000h], AX    ; Store the lower 16 bits of the result (in AX) at memory address 6000h
MOV [6002h], DX    ; Store the upper 16 bits of the result (in DX) at memory address 6002h
HLT                ; Halt the program
