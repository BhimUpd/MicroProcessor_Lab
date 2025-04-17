; 6. Write an assembly language program to convert the text stored in memory to  upper case only if the characters are found in lower case. Display the converted  text in the screen.

.MODEL SMALL
.STACK 100H
.DATA
      BUFFER       DB  "HEllo aliENs$"
      STRINGLENGTH EQU $-BUFFER
.CODE
MAIN PROC
            MOV  AX, @DATA
            MOV  DS, AX
        
            MOV  CX, STRINGLENGTH

            LEA  SI, BUFFER

      BACK1:
            MOV  DL,[SI]
            CMP  DL, 'a'
            JL   SKIP
            CMP  DL, 'z'
            JG   SKIP
            SUB  DL,32
      SKIP: MOV  [SI],DL
            INC  SI
            LOOP BACK1

            LEA  DX,BUFFER
            MOV  AH,09H
            INT  21H

            MOV  AH, 4CH
            INT  21H


MAIN ENDP
END MAIN  
