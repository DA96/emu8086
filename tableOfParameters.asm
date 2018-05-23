; SUM OF ARRAY USING TABLE OF PARAMETERS

DATA SEGMENT
  
    ARR DW 1H,2H,5H,4H
    SUM DW ?
    TABLE DW 2DUP(0)
    
DATA ENDS

CODE SEGMENT
    
    ASSUME CS:CODE DS:DATA
    START:
             
          MOV AX,DATA
          MOV DS,AX
          
          MOV AX,0
          MOV TABLE,OFFSET ARR        ;STORING ADDRESS OF ARR
          MOV TABLE+2,OFFSET SUM      ;STORING ADDRESS OF SUM
          MOV BX,OFFSET TABLE         ;STORING ADDRESS OF TABLE IN BX
          
          CALL SUMARR
          
          SUMARR PROC NEAR
            
            MOV SI,[BX]
            MOV CX,4H    ;CX IS INITIALIZED WITH NO. OF ELEMENTS IN ARRAY
            MOV DI,[BX+2]
            
            NEXT:
            
                  ADD AX,[SI]
                  INC SI
                  INC SI
                  LOOP NEXT
                  
                  MOV [DI],AX
            
            SUMARR ENDP
          
CODE ENDS
END START
 
    
            
          

; BY- DIVYA AGARWAL
; ROLL NO. 12

                 
                     
          
         
          




