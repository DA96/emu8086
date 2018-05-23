DATA SEGMENT 
      N DB 06H
       FACT DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX
        MOV AX, 1
        MOV BL, N
        MOV BH, 0
        CALL FACTORIAL
        MOV FACT, AX    
        HLT

        FACTORIAL PROC
        CMP BX, 1
        JE L1
        PUSH BX
        DEC BX
        CALL FACTORIAL
        POP BX
        MUL BX
L1:   RET
        FACTORIAL ENDP    
        
CODE ENDS
END START

    
            
          

; BY- DIVYA AGARWAL
; ROLL NO. 12

