3000 :: MOV SI, 6000                ; SI points to the array (starting memory address)
3004 :: MOV CL, [SI]                ; Load array size into CL
3006 :: DEC CL                       ; Decrement size by 1

3008 :: MOV SI, [6000]               ; Reset SI to point to the array
300C :: MOV CH, [SI]                 ; Load array size again into CH
300E :: DEC CH                       ; Decrement by 1 for comparison

3010 :: INC SI                        ; Move to the next element
3011 :: MOV AL, [SI]                 ; Load current element into AL
3013 :: INC SI                        ; Move to next element
3014 :: CMP AL, [SI]                 ; Compare current with next element

3016 :: JC 301D                       ; If AL < next element, jump (no swap)
3018 :: XCHG AL, [SI]                ; Swap elements if AL > next element
301A :: XCHG AL, [SI-1]              ; Complete the swap

301D :: DEC CH                        ; Decrement inner loop counter
301F :: JNZ 3011                      ; Repeat if CH > 0

3021 :: DEC CL                        ; Decrement outer loop counter
3023 :: JNZ 3008                      ; Repeat outer loop if CL > 0

3025 :: HLT                           ; Halt the program
