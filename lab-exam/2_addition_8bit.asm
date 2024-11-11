
implicit

MOV AL, [3000h]   ; Move the value at memory address 3000h into register AL
MOV BL, [4000h]   ; Move the value at memory address 4000h into register BL
ADD AL, BL        ; Add the values in AL and BL, result in AL
MOV [6000h], AL   ; Store the result from AL into memory address 6000h
HLT               ; Halt the program




explicit

MOV AL, 03h       ; Load immediate value 03h into register AL
MOV BL, 02h       ; Load immediate value 02h into register BL
ADD AL, BL        ; Add the values in AL and BL, result in AL
MOV [6000h], AL   ; Store the result from AL into memory address 6000h
HLT               ; Halt the program


