

implicit

MOV AL, [3000h]   ; Load the value from memory address 3000h into AL
MOV BL, [4000h]   ; Load the value from memory address 4000h into BL
DIV BL            ; Divide AL by BL, quotient in AL, remainder in AH
MOV [6000h], AL   ; Store the quotient from AL into memory address 6000h
MOV [7000h], AH   ; Store the remainder from AH into memory address 7000h
HLT               ; Halt the program



explicit


MOV AL, 10h       ; Load the immediate value 10h into AL
MOV BL, 03h       ; Load the immediate value 03h into BL
DIV BL            ; Divide AL by BL, quotient in AL, remainder in AH
MOV [6000h], AL   ; Store the quotient from AL into memory address 6000h
MOV [7000h], AH   ; Store the remainder from AH into memory address 7000h
HLT               ; Halt the program
