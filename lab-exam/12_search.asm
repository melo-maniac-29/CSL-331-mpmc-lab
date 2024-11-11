; Linear search in an array
; This program searches for a target element in an array starting at memory address 6000h.
; If found, it stores 1 at memory location 7000h; otherwise, it stores 0.

3000 :: MOV SI, 6000h         ; Initialize SI to point to the start of the array (6000h)
3004 :: MOV CL, [SI]          ; Load the size of the array into CL
3006 :: INC SI                ; Increment SI to point to the first element in the array

; Load the target element to be searched into AL (for example, let's assume it's already in AL)
3007 :: MOV AL, [SI]      ; Load the first element in the array into AL
3008 :: INC SI                ; Move SI to the next element 
; Start of the search loop

300A :: MOV BL, [SI]          ; Load the current element in the array into BL
300C :: CMP AL, BL            ; Compare the target element (AL) with the current element (BL)
300E :: JE 301D               ; If they are equal, jump to the "found" label

3010 :: INC SI                ; Move SI to the next element
3011 :: DEC CL                ; Decrement the counter CL
3012 :: JNZ 300A              ; If CL is not zero, repeat the loop

; If the element is not found, store 0 in the result location
3014 :: MOV [7000h], 00h      
3018 :: JMP 3020              ; Jump to the end of the program

; Found label - store 1 in the result location
301D :: MOV [7000h], 01h      

; End of the program
3020 :: HLT                   
