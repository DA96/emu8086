; PACKED TO UNPACKED BY MASKING

DATA SEGMENT                
    PACKED      DB  12h,91h,34h,56h,78h,24h,35h,61h			
    UNPACKED    DB  16 DUP(?)       					
DATA ENDS
          
          
CODE SEGMENT
    
    ASSUME  DS:DATA  , CS:CODE
    
    START :
            MOV AX, DATA
            MOV DS, AX
            
            MOV CX,8H
            MOV DL,0FH  ;MASK : 00001111
            MOV SI,0 
            MOV DI,0 
            
    NEXT:
            XOR AX,AX 
	        MOV AL,PACKED[SI]
	        MOV AH,PACKED[SI]
            INC SI      
	        ROR AH,4
	        AND AL,DL
	        AND AH,DL
	        MOV UNPACKED[DI],AH
	        INC DI
	        MOV UNPACKED[DI],AL
	        INC DI
            LOOP NEXT  
            
CODE ENDS  
    END START