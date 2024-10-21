
subtraction of two 8 bit numbers in 8086

 implicit addressing mode

MOV AL, [3000h]   ; Load the value from memory address 3000h into AL
MOV BL, [4000h]   ; Load the value from memory address 4000h into BL
SUB AL, BL        ; Subtract the value in BL from AL, result stored in AL
MOV [6000h], AL   ; Store the result from AL into memory address 6000h
HLT               ; Halt the program


------------------------------------------------------------------------------------------------

explicit 

MOV AL, 05h       ; Load immediate value 05h into AL
MOV BL, 02h       ; Load immediate value 02h into BL
SUB AL, BL        ; Subtract the value in BL from AL, result stored in AL
MOV [6000h], AL   ; Store the result from AL into memory address 6000h
HLT               ; Halt the program
