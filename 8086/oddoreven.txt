/*************  ✨ Codeium Command 🌟  *************/
; This program checks whether a number is odd or even
whether a numbr is odd or even

; Load the number from memory address 3000 into AX
MOV AX,[3000]

; Load the number 2 into BX
MOV BX,02H

; Divide AX by BX, quotient in AX and remainder in DX
DIV BX

; Load 0 into BX
MOV BX,00H

; Compare DX with BX
; if DX is not equal to 0, then it is odd
CMP BX,DX

; if DX is not equal to 0, jump to 501A
JNC 501A

; if odd, store 1 in memory address 4000
MOV [4000],01H

; jump to 501F
JMP 501F

; if even, store 0 in memory address 4000
501A ::  MOV [4000],00H

; halt the program
501F ::HLT

/******  ec24c649-663f-420d-a5f0-943e8494d813  *******/ 