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

       MOV DH,10
       MOV DL,20
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
