TITLE "Write a program to read the string using the character reading function and display the string using character displaying function."

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

      BACK1:
            MOV  DL,[SI]
            MOV  AH,02H
            INT  21H
            INC  SI
            LOOP BACK1

            MOV  AH, 4CH
            INT  21H
MAIN ENDP
END MAIN  
