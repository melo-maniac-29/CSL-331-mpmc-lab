; This code finds the largest number in an array starting at memory address 2000.
; The size of the array is stored in the first memory location (2000h).

; Initialize BX to point to the start of the array (2000h)
5000 :: MOV BX, 2000h

; Load the size of the array into CX (from memory at [BX])
5004 :: MOV CX, [BX]

; Initialize AX to hold the largest number, starting with 0
5006 :: MOV AX, 0000h

; Increment BX to point to the first element in the array
500A :: INC BX
500B :: INC BX

; Loop through the array to find the largest number
500C :: CMP AX, [BX]    ; Compare AX (current largest) with the element at [BX]
500E :: JNC 5012        ; If AX is greater or equal, skip the update

; Otherwise, update AX with the current element (new largest)
5010 :: MOV AX, [BX]

; Decrement the counter CX and repeat the process for remaining elements
5012 :: DEC CX
       JNZ 500A         ; If CX is not zero, go back to process the next element

; Store the largest number in the array (in the last element position)
       MOV [BX], AX

; Halt the program
       HLT
