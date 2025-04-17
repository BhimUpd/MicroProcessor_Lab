TITLE "Write a program to read string from the user (use function that reads string) and display the string in another line. (To display the character in new line display characters 0DH and 0AH)"

.MODEL SMALL
.STACK 100H
.DATA
  MSG     DB "ENTER A STRING:$"
  MEWLINE DB 0AH,0DH,'$'
  BUFFER  DB 80H DUP('$')
.CODE
MAIN PROC
       MOV AX, @DATA
       MOV DS, AX

       LEA DX, MSG

       MOV AH, 09H      ; DISPLAY ENTER A STRING
       INT 21H

       LEA DX, BUFFER
       MOV AH,0AH       ; READ STRING AND STORE LOCATION IN DX WHERE FIRST BYTE DENOTES MAXIMUM CAPACITY AND SECOND BYTE DENOTES ACTUAL LENGTH OF STRING ENTERED
       INT 21H

       LEA DX,MEWLINE
       MOV AH,09H
       INT 21H

       LEA DX,BUFFER+2
       MOV AH,09H       ; DISPLAY STRING
       INT 21H
       
       MOV AH, 4CH
       INT 21H
MAIN ENDP
END MAIN  
