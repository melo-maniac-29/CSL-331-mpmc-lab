/*************  ✨ Codeium Command 🌟  *************/
sorting by ascending order

; initialize SI to point to the array
3000 :: MOV SI,6000

; load the size of the array into CL
3004 :: MOV CL,[SI]

; decrement the size of the array by 1
3006 :: DEC CL

; initialize SI to point to the array
3008 :: MOV SI,[6000]

; load the size of the array into CH
300C :: MOV CH,[SI]

; decrement the size of the array by 1
300E :: DEC CH

; increment SI to point to the next element in the array
3010 :: INC SI

; load the current element in the array into AL
3011 :: MOV AL,[SI]

; increment SI to point to the next element in the array
3013 :: INC SI

; compare the current element with the next element in the array
3014 :: CMP AL,[SI]

; if the current element is less than the next element, jump to 301D
3016 :: JC 301D

; otherwise, exchange the current element with the next element
3018 :: XCHG AL,[SI]
301A :: XCHG AL,[SI-1]

; decrement CH until it is zero
301D :: DEC CH
301F :: JNZ 3011

; decrement CL until it is zero
3021 :: DEC CL
3023 :: JNZ 3008

; halt the program
3025 :: HLT
/******  f28b26f4-f1a3-4019-84dd-d46941422f6b  *******/ 