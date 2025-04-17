TITLE "Write an assembly language program that takes a string (having 24 characters at max.) from the user and display each character at the center of each line."

.MODEL SMALL
.STACK 100H
.DATA
  MSG    DB "Enter a string: $"
  BUFFER DB 24,?,24 DUP('$')
.CODE
MAIN PROC
       MOV  AX,@DATA
       MOV  DS,AX

       LEA  DX,MSG
       MOV  AH,09H
       INT  21H

       LEA  DX,BUFFER
       MOV  AH,0AH
       INT  21H

       MOV  AX,0006H
       MOV  BH,0FH
       MOV  CX,0000H
       MOV  DX,184FH
       INT  10H

       LEA  SI,BUFFER+2
       MOV  BH,00H
       MOV  DH,00H
       MOV  AH,02H
       MOV  CH,00H
       MOV  CL,[SI-1]

  BACK:MOV  DL,27H
       INT  10H
       MOV  DL,[SI]
       INT  21H
       INC  DH
       INC  SI
       LOOP BACK

       MOV  AH,4CH
       INT  21H

MAIN ENDP
END MAIN