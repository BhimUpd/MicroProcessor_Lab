TITLE "7. Write an assembly language program to convert the text stored in the memory to  lower case if the characters are in upper case. Display the result text in the screen."

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

     BACK:
          MOV  DL,[SI]
          CMP  DL, 'A'
          JL   SKIP
          CMP  DL, 'Z'
          JG   SKIP

          ADD  DL,32
          MOV  [SI],DL
     SKIP:INC  SI
          LOOP BACK

          LEA  DX,BUFFER
          MOV  AH,09H
          INT  21H

          MOV  AH, 4CH
          INT  21H


MAIN ENDP
END MAIN  
