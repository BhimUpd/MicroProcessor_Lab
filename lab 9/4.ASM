TITLE "Write an assembly language program that takes a string (having 14 characters at max.) input from user and Scroll a window of size 20×20 at the center of screen. Then display the string at the center of scrolled window. (You Can choose the color attribute yourself). "

.MODEL SMALL
.STACK 100H
.DATA
  MSG    DB "Enter a string: $"
  BUFFER DB 14,?,14 DUP('$')
.CODE
MAIN PROC
       MOV AX,@DATA
       MOV DS,AX

       LEA DX,MSG
       MOV AH,09H
       INT 21H

       LEA DX,BUFFER
       MOV AH,0AH
       INT 21H

       MOV AX,0600H
       MOV BH,0FH
       MOV CX,0000H
       MOV DX,184FH
       INT 10H

       MOV CX,0215H
       MOV DX,163BH
       MOV AH,06H
       MOV BH,0C0H
       INT 10H

       LEA SI,BUFFER+1
       MOV DH,0CH
       MOV DL,28H
       MOV AL,[SI]
       SHR AL,1
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
