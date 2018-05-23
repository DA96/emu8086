;PROGRAM TO ADD ELEMENTS OF SIZE DOUBLEWORD OF AN ARRAY OF SIZE 10 

DATA SEGMENT                         
    
    ARRAY   DD 12345678H , 90123H , 456789H , 12345H , 34206H , 560123H , 5432H , 102H , 211H , 2H  
    SUM     DD 0H     ;SUM OF ALL ARRAY ELEMENTS

DATA ENDS                           

CODE SEGMENT                        
    
    ASSUME DS:DATA,CS:CODE        

    START:                          
    
            MOV AX,DATA
            MOV DS,AX               
            
            XOR AX,AX                ;CLEARS ALL FLAGS
            MOV SI,0H
            LEA BX,ARRAY             ;LOADS EFFECTIVE ADDRESS OF ARRAY TO BX 
            MOV CX,10                ;CX IS INTIALIZED WITH 10 TO EXECUTE LOOP 10 TIMES
            
    NEXT:  
            MOV AX , WORD PTR SUM      ;MOVE LOWER 16 BITS OF SUM TO AX   
            ADC AX , WORD PTR BX[SI]   ;ADD LOWER 16 BITS OF ARRAY ELEMENTS WITH AX
            MOV WORD PTR SUM , AX      ;MOVE AX TO LOWER 16 BITS OF SUM 
            
            MOV AX , WORD PTR SUM+2    ;MOVE HIGHER 16 BITS OF SUM TO AX
            ADC AX , WORD PTR BX[SI+2] ;ADD HIGHER 16 BITS OF ARRAY ELEMENTS WITH AX
            MOV WORD PTR SUM+2 , AX    ;MOVE AX TO LOWER 16 BITS OF SUM 
            INC SI
            INC SI
            INC SI                   ;INCREMENT SI BY 4 TO ACCESS NEXT ELEMENT OF ARRAY
            INC SI
            LOOP NEXT               
 
CODE ENDS                           T
   
    END START