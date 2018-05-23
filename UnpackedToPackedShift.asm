; UNPACKED TO PACKED BY SHIFTING

DATA SEGMENT   
    
    UNPACKED    DB  01h,02h,03h,04h,05h,06h,07h,08h,09h,01h,03h,05h,07h,09h
    PACKED      DB  7 DUP(?)
    
DATA ENDS
    
    
CODE SEGMENT
    
    ASSUME  DS:DATA , CS:CODE
    
    START:
           MOV AX,DATA
           MOV DS,AX
            
           MOV CX,7
           MOV SI,0 
           MOV DI,0 
           
           
    NEXT:   
           XOR AX,AX 
           MOV AH,UNPACKED[SI]
           INC SI                           
           MOV AL,UNPACKED[SI]
           INC SI
           SHL AL,4
           SHR AX,4
           MOV PACKED[DI],AL   
           INC DI
           LOOP NEXT 
           
CODE ENDS  
    END START


