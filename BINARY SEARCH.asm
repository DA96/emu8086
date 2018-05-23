;BINARY SEARCH

DATA SEGMENT 
    
    ARR DB 3H,4H,7H,8H,12H,15H          ;SORTED ARRAY
    ELE DB 8H                       ;ELEMENT TO BE SEARCHED
    IND DW ?                        ;STORES INDEX OF ARRAY WHERE ELEMENT IS FOUND
    LOW DB 0H                       ;LOWER INDEX OF ARRAY
    HIGH DB 5H                      ;HIGHER INDEX OF ARRAY
    MID DB ?                        ;MIDDLE INDEX OF ARRAY 
    
DATA ENDS
   
   
CODE SEGMENT   
    
    ASSUME: CS:CODE DS:DATA  
    
    START: 
    
          MOV AX,DATA
          MOV DS,AX
          
          MOV AX,0 
          MOV SI,0

          MOV AL,HIGH
          ADD AL,LOW
          SHR AL,1          ;DIVIDE BY 2
          MOV MID,AL   

    NEXT:   
      
        MOV BL,HIGH
        CMP BL,LOW          ;COMPARE HIGH AND LOW 
        JL NOTFOUND         ;JUMP TO NOTFOUND LABEL IF ELEMENT NOT FOUND IN ARRAY
        
        MOV BL,0
        XOR DX,DX
        MOV DL,MID
        MOV SI,DX
        MOV BH,ARR[SI]
        MOV BL,ELE
        CMP BH,BL           ;COMPARE ELEMENT OF ARRAY OF MID INDEX TO ELEMENT
      
        JE FOUND            ;IF BOTH EQUAL, JUMP TO FOUND LABEL
        JL UPPER            ;IF ELEMENT IS GREATER THEN CHECK UPPER HALF PART OF ARRAY
        JG LOWER            ;IF ELEMENT IS SMALLER THEN CHECK LOWER HALF PART OF ARRAY
        
    
        UPPER: 
        
        INC DL
        MOV LOW,DL          ;CHANGNG LOW TO MID+1
        MOV AL,LOW
        ADD AL,HIGH
        SHR AL,1            ;DIVIDE BY 2
        MOV MID,AL  
        JMP NEXT

        LOWER:   
            
        DEC DL
        MOV HIGH,DL         ;CHANGING HIGH TO MID-1
        MOV AL,HIGH
        ADD AL,LOW
        SHR AL,1            ;DIVIDE BY 2
        MOV MID,AL
        JMP NEXT    
        
    
   ;IF IT REACHES HERE THEN THE ELEMENT WASN'T FOUND
   NOTFOUND:
         MOV IND,-1         ; MOVE -1 TO INDEX IF ELEMENT NOT FOUND IN ARRAY
         HLT
          
         
       FOUND: 
         MOV IND,SI         ;IF ELEMENT IS FOUND, STORES INDEX OF ELEMENT IN ARRAY IN IND
             
        
                         
           
CODE ENDS                             
    END START   

