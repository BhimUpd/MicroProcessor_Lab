TITLE "Write a program to display a string "Programming is Fun" in the screen using string displaying function"

.MODEL SMALL
.STACK 100H
.DATA
  MSG  DB "PROGRAMMING IS FUN$"
.CODE
MAIN PROC
       MOV AX, @DATA
       MOV DS, AX
       LEA DX, MSG
       MOV AH, 09H
       INT 21H
       MOV AH, 4CH
       INT 21H
MAIN ENDP
END MAIN  
