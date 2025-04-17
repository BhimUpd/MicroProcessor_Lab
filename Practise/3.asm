.MODEL SMALL
.STACK 100H
.DATA
  MSG    DB "ENTER A STRING: $"
  BUFFER DB 80H,?,80H DUP('$')
.CODE
MAIN PROC
       MOV AX,@DATA
       MOV DS,AX

       LEA DX,MSG
       MOV AH,09H
       INT 21H

       MOV AH,0AH
       LEA DX,BUFFER
       INT 21H

       MOV AX,0600H
       MOV CX,0000H
       MOV DX,184FH
       MOV BH,0FH
       INT 10H

       MOV AL,[BUFFER+1]
       SHR AL,1

       MOV DH,0CH
       MOV DL,28H
       SUB DL,AL
       MOV BH,00H
       MOV AH,02H
       INT 10H

       LEA DX,BUFFER+2
       MOV AH,09H
       INT 21H

       MOV AH,4CH
       INT 21H
MAIN ENDP
END MAIN
