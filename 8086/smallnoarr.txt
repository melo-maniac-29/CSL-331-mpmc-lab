/*************  ✨ Codeium Command ⭐  *************/
; find the smallest number in an array
;
; initialize BX to point to the array
find the smallest number in an array

5000 :: MOV BX,2000
;
; load the size of the array into CX
5004 :: MOV CX,[BX]
;
; initialize AX to hold the smallest number
5006 :: MOV AX,FFFFH
;
; increment BX to point to the first element in the array
        INC BX
500A :: INC BX
;
; compare the current element in AX with the next element in the array
500B :: CMP AX,[BX]
;
; if the current element is smaller than the next element, jump to 5012
500E :: JNC 5012
;
; otherwise, move the next element in the array to AX
5010 :: MOV AX,[BX]
;
; decrement CX until it is zero
5012 :: DEC CX
;
; if CX is not zero, jump to 500A
        JNZ 500A
;
; increment BX to point to the last element in the array
        INC BX
;
; increment BX again to point to the last element in the array
        INC BX
;
; store the smallest number in AX to the last element in the array
        MOV [BX],AX
;
; halt the program
        HLT
/******  e0308329-db44-4a73-bdfc-1937f4e3c6dd  *******/ 