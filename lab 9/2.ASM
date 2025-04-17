TITLE "Write an assembly language program that takes a string (having 60 characters at max.) as input from user, and display the string at the center of the clear screen. "

.MODEL SMALL
.STACK 100H
.DATA
  MSG    DB "Enter a string: $"
  BUFFER DB 60,?,60 DUP('$')
.CODE
MAIN PROC
       MOV AX,@DATA
       MOV DS,AX
       MOV AH,09H
       LEA DX,MSG
       INT 21H

       MOV AH,0AH
       LEA DX, BUFFER
       INT 21H

       MOV AX,0006H
       MOV BH,0FH
       MOV CX,0000H
       MOV DX,184FH
       INT 10H

       LEA SI,BUFFER+1
       MOV DH,0CH
       MOV BH,00H       ; page number
       MOV AL, [SI]
       SHR AL,1
       MOV DL,28H
       SUB DL,AL
       MOV AH,02H
       INT 10H

       LEA DX,BUFFER+2
       MOV AH,09H
       INT 21H

       MOV AH,4CH
       INT 21H
MAIN ENDP
END MAIN