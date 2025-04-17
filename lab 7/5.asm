TITLE "Write a program to generate and store a multiplication table of a number stored as num1"

.MODEL SMALL
.STACK 100H
.DATA
  NUM1         DB    2H
               ALIGN 2           ; Ensure the next variable is aligned to a 2-byte boundary
  RESULT_TABLE DW    0AH DUP(?)
.CODE
MAIN PROC
       MOV AX,@DATA
       MOV DS,AX
       LEA DI,RESULT_TABLE
       MOV CL,01H
  BACK:MOV AL,NUM1
       MUL CL
       MOV [DI],AX
       ADD DI,2
       INC CL
       CMP CL,0BH
       JNZ BACK
       INT 03H
       MOV AH,4CH
       INT 21H
MAIN ENDP
END MAIN    