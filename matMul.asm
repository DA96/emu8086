; MATRIX MULTIPLICATION

DATA SEGMENT
    
    MAT1 DB 01H,02H,03H,
         DB 04H,05H,06H,
         DB 07H,08H,09H
            
    MAT2 DB 02H,03H,05H
         DB 01H,01H,03H
         DB 05H,02H,06H
            
    MAT3 DB 9 DUP(?)
    
DATA ENDS

CODE SEGMENT
    
    ASSUME: DS:DATA CS:CODE
    
    START:
          MOV AX,DATA
          MOV DS,AX
          
          XOR AX,AX 
          MOV DX,0
          MOV CX,3
          MOV BX,0      ;row no. in matrix 1
          MOV DI,0      ;postion of element in matrix 2
          MOV BP,0      ;to maintain DI
          
          LOOP1:
                  PUSH CX
                  MOV CX,3
                  MOV SI,0        ;column no. in matrix 2
                  MOV DI,BP
                  
                  LOOP2:
                         MOV AL,MAT1[BX][SI]
                         MOV DL,MAT2[DI]
                      
                         IMUL DL 
                         
                         INC DI
                         INC DI
                         INC DI
                     
                         MOV MAT3[BX][SI],AL
                     
                         INC SI
                         LOOP LOOP2
                  
                  INC BX
                  INC BX
                  INC BX
                  
                  INC BP
                  
                  POP CX
                  LOOP LOOP1
                         
CODE ENDS
END START
    
            
          

; BY- DIVYA AGARWAL
; ROLL NO. 12



