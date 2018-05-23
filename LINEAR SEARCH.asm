;LINEAR SEARCH

DATA SEGMENT
    ARR DB 4H,8H,12H,3H,7H
    ELE DB 12H               ;ELEMENT TO BE SEARCHED
    IND DW ?                ;TO STORE INDEX OF ARRAY WHERE ELEMENT IS FOUND
DATA ENDS

CODE SEGMENT      
    
    ASSUME: CS:CODE DS:DATA
   
    START:
          MOV AX,DATA
          MOV DS,AX
          
          MOV AX,0
          LEA BX,ARR
          
          MOV CX,5                        ;5 IS SIZE OF ARRAY
          MOV SI,0
          XOR AX,AX                       ;CLEARS ALL FLAGS
          MOV AL,ELE
          
          
          NEXT:
               CMP AL,BYTE PTR BX[SI]      ; COMPARE ELEMENT TO ELEMENT OF ARRAY
               JE FOUND                    ; IF EQUAL, JUMP TO FOUND LABEL
               INC SI                      
               LOOP NEXT                   
              
              
              ;IF ELEMENT NOT FOUND IN ARRAY
               MOV IND,-1              ; MOVE -1 TO INDEX IF ELEMENT NOT FOUND IN ARRAY
               HLT
          
          
          FOUND:   
                MOV IND,SI              ;IF FOUND, STORE INDEX OF ELEMENT IN ARRAY IN IND 
                                                   
CODE ENDS                             
   END START   
