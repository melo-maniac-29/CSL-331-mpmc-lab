; Program to convert an ASCII digit from memory address 2050 to BCD format
; and store the BCD result at memory address 3050.

        MOV     AL, [2050]        ; Load ASCII character ('0'-'9') from memory address 2050 into AL
        AND     AL, 0Fh           ; Mask upper 4 bits to get BCD value (0-9) in AL
        MOV     [3050], AL        ; Store BCD result at memory address 3050
        HLT                       ; Halt the program
