; This code finds the smallest number in an array starting at memory address 2000h.
; The first memory location (2000h) contains the size of the array.

5000 :: MOV BX, 2000h         ; Set BX to point to the start of the array (2000h)
5004 :: MOV CX, [BX]          ; Load the size of the array into CX

5006 :: MOV AX, FFFFh         ; Initialize AX to hold the smallest number (start with the max possible)

500A :: INC BX                ; Move BX to point to the first element in the array
500B :: INC BX

; Loop through each element in the array to find the smallest number
500C :: CMP AX, [BX]          ; Compare current smallest (AX) with the element at [BX]
500E :: JC 5012              ; If AX <= [BX], skip updating AX

5010 :: MOV AX, [BX]          ; Otherwise, update AX with the new smaller element

5012 :: DEC CX                ; Decrement counter (CX) to move to the next element
       JNZ 500A               ; If CX > 0, continue to the next element in the array

; Store the smallest number at the last accessed location
       MOV [BX], AX           ; Store the smallest number found in AX to the last location

       HLT                    ; Halt the program
