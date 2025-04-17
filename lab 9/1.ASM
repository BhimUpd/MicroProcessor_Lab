TITLE "Write an assembly language program to scroll a window from row 5, column 20 to row 20, column 60 with a reverse video attribute. Then locate the cursor at row 12, column 30. And display a string as “Programming in Assembly Language is Fun”."

.MODEL SMALL
.STACK 100H
.DATA
  ROW1 DB 5
  COL1 DB 20
  ROW2 DB 20
  COL2 DB 60
  ROW3 DB 12
  COL3 DB 30
  MSG  DB "Programming in Assembly Language is Fun$"
.CODE
MAIN PROC
       MOV AX,@DATA
       MOV DS,AX

       MOV AH,06H
       MOV AL,0
       MOV BH,0F0H
       MOV CH,ROW1
       MOV CL,COL1
       MOV DH,ROW2
       MOV DL,COL2
       INT 10H

       MOV AH,02H
       MOV DH,ROW3
       MOV DL,COL3
       MOV BH,00H
       INT 10H

       LEA DX,MSG
       MOV AH,09H
       INT 21H

       MOV AH,4CH
       INT 21H
MAIN ENDP
  END MAIN
