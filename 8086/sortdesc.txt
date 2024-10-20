/*************  ✨ Codeium Command 🌟  *************/
; Sortingin descending order
sorting by descending order

; Initialize SI to point to the array
3000 :: MOV SI,6000

; Load the size of the array into CL
3004 :: MOV CL,[SI]

; Decrement the size of the array by 1
3006 :: DEC CL

; Initialize SI to point to the array
3008 :: MOV SI,[6000]

; Load the size of the array into CH
300C :: MOV CH,[SI]

; Decrement the size of the array by 1
300E :: DEC CH

; Increment SI to point to the next element in the array
3010 :: INC SI

; Load the current element in the array into AL
3011 :: MOV AL,[SI]

; Increment SI to point to the next element in the array
3013 :: INC SI

; Compare the current element with the next element in the array
3014 :: CMP AL,[SI]

; If the current element is not less than the next element, jump to 301D
3016 :: JNC 301D

; Otherwise, exchange the current element with the next element
3018 :: XCHG AL,[SI]

301A :: XCHG AL,[SI-1]

; Decrement CH until it is zero
301D :: DEC CH

301F :: JNZ 3011

; Decrement CL until it is zero
3021 :: DEC CL

3023 :: JNZ 3008

; Halt the program
3025 :: HLT
/******  450ffef0-11c4-4435-853d-4f01d798c8c4  *******/ 