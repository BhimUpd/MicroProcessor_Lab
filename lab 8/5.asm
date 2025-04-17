TITLE "Write a program to read the string and convert it into upper case if it is in lower case and display the resulting string. Process the string in the memory before displaying"

.MODEL SMALL
.STACK 100H
.DATA
      MSG    DB "ENTER A STRING : $"
      BUFFER DB 80H DUP('$')
.CODE
MAIN PROC
            MOV  AX, @DATA
            MOV  DS, AX
            LEA  DX, MSG
            MOV  AH, 09H
            INT  21H
            LEA  SI, BUFFER
            MOV  CX, 0000H
       
      BACK: 
            MOV  AH,01H
            INT  21H
            CMP  AL, 0DH
            JE   EXIT
            MOV  [SI],AL
            INC  SI
            INC  CX
            JMP  BACK

      EXIT: LEA  SI, BUFFER

            MOV  BX,CX

      BACK1:
            MOV  DL,[SI]
            CMP  DL, 'a'
            JC   SKIP
            SUB  DL,32
      SKIP: MOV  [SI],DL
            INC  SI
            LOOP BACK1

            LEA  SI, BUFFER

            MOV  CX,BX

      BACK2:
            MOV  DL,[SI]
            MOV  AH,02H
            INT  21H
            INC  SI
            LOOP BACK2

            MOV  AH, 4CH
            INT  21H


MAIN ENDP
END MAIN  
