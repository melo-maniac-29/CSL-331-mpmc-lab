/*************  ✨ Codeium Command 🌟  *************/
; Linear search in an array
linearc search

; Initialize SI to point to the start of the array
3000 :: MOV SI,6000

; Load the size of the array into CL
3004 :: MOV CL,[SI]

; Increment SI to point to the first element in the array
3006 :: INC SI

; Start of the loop - load the current element into AL
3008 :: MOV AL,[SI]

; Increment SI to point to the next element
3010 :: INC SI

; Compare the current element with the target element
300A :: CMP AL,[SI]

; If equal, jump to found label
300C :: JE 301D

; Otherwise, increment SI to continue search
300E :: INC SI

; Decrement the counter CL
300F :: DEC CL

; If CL is not zero, repeat the loop
3011 :: JNZ 300A

; If not found, store 0 in the result location
3013 :: MOV [7000],00

; Jump to end
3018 :: JMP 3020

; Found label - store 1 in the result location
301D :: MOV [7000],01

; End of program
3020 :: HLT
/******  23cffa75-894b-444a-bf0d-7bdaa666416e  *******/ 