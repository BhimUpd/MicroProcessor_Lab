TITLE "Write a program to display the same string using character displaying function (use current address operator $ to count the no of characters "

.MODEL SMALL
.STACK 100H
.DATA
  MSG  DB  "PROGRAMMING IS FUN$"
  LEN  EQU ($-MSG)-1
.CODE
MAIN PROC
       MOV  AX, @DATA
       MOV  DS, AX
       LEA  SI, MSG
       MOV  CX,LEN
  BACK:
       MOV  DL,[SI]
       MOV  AH, 02H
       INT  21H
       INC  SI
       LOOP BACK
       MOV  AH, 4CH
       INT  21H
MAIN ENDP
END MAIN  
