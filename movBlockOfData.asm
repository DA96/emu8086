;TO MOVE A BLOCK OF DATA FROM ONE MEMORY LOCATION TO ANOTHER

DATA SEGMENT      
                   
    ARRAY1 DB 05H,41H,16H,01H,02H   
    ARRAY2 DB 5DUP(0)               
    
DATA ENDS                          


CODE SEGMENT                      

    ASSUME DS:DATA , CS:CODE  
    
    START:                         
            MOV AX,DATA
            MOV DS,AX            
            
            LEA BX,ARRAY1         ; LOADS EFFECTIVE ADDRESS OF ARRAY1 TO BX 
            LEA BP,ARRAY2         ; LOADS EFFECTIVE ADDRESS OF ARRAY2 TO BP 
            MOV CX,5            
            MOV DI,0   
                         
    NEXT: 
            MOV AL,BX[SI]         ; MOVE THE CONTENT AVAILABLE AT LOCATION [BX + SI ] TO AL 
            MOV BP[DI],AL         ; MOVE THE CONTENT OF AL TO LOCATION [ BP + DI ] 
            INC SI                  
            INC DI                 
            LOOP NEXT              
          
CODE ENDS                          
    END START     
