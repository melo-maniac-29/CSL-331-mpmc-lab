
implicit 

MOV AL, [3000h]   ; Load the value from memory address 3000h into AL
MOV BL, [4000h]   ; Load the value from memory address 4000h into BL
MUL BL            ; Multiply the value in BL by the value in AL, result in AX (AL * BL)
MOV [6000h], AL   ; Store the lower byte of the result from AL into memory address 6000h
HLT               ; Halt the program



explicit

MOV AL, 03h       ; Load immediate value 03h into AL
MOV BL, 02h       ; Load immediate value 02h into BL
MUL BL            ; Multiply the value in BL by the value in AL, result in AX (AL * BL)
MOV [6000h], AL   ; Store the lower byte of the result from AL into memory address 6000h
HLT               ; Halt the program
