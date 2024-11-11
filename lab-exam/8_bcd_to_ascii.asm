; Program to convert a BCD number from memory address 2000 to its ASCII representation
; and store the result at memory address 3000.

        MOV     AL, [2000]        ; Load BCD value (two BCD digits) from memory address 2000 into AL

        ; Extract upper BCD digit and prepare for ASCII conversion
        MOV     AH, AL            ; Copy AL to AH
        AND     AL, 0Fh           ; Mask upper 4 bits of AL, leaving lower BCD digit
        SHR     AH, 4             ; Shift AH right by 4 bits, isolating upper BCD digit

        ; Convert both BCD digits to ASCII by adding ASCII offset (30h)
        OR      AX, 3030h         ; Add 30h to both digits in AL and AH for ASCII conversion

        ; Store the ASCII result at memory address 3000
        MOV     [3000], AX        ; Store AX (combined ASCII characters) at memory address 3000

        ; Halt the program
        HLT                       ; End of program, stop CPU execution
