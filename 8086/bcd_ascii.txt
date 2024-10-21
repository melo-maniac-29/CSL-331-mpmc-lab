; This code takes a BCD (Binary Coded Decimal) number from memory address 2000
; and converts it to an ASCII character.
; The ASCII character is then stored in memory address 3000.

; Load the BCD value from memory address 2000 into AL
MOV AL, [2000]

; Move the value in AL to AH for further manipulation
MOV AH, AL

; Clear the upper 4 bits of the BCD number (mask with 0Fh)
AND AL, 0Fh

; Shift the value in AH right by 4 bits (extract upper BCD digit)
MOV CL, 04
SHR AH, CL

; Combine the two BCD digits into a single ASCII value
; OR the values in AX with 3030h to convert to ASCII
OR AX, 3030h

; Store the ASCII character at memory address 3000
MOV [3000], AX

; Halt the program
HLT
