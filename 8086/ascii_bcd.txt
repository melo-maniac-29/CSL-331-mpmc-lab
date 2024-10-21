; This code takes an ASCII character from memory address 2050,
; converts it to a BCD (Binary Coded Decimal) number,
; and stores the result in memory address 3050.

; Load the ASCII character from memory address 2050 into AL (lower byte of AX)
MOV AL, [2050]

; Use AND to clear the upper 4 bits of the ASCII character,
; leaving only the lower 4 bits, which represent the BCD number.
; Mask: 0Fh (binary: 00001111b)
AND AL, 0Fh

; Store the result (BCD number) at memory address 3050
MOV [3050], AL

; Halt the program
HLT
