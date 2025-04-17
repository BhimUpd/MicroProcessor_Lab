;10. Write an assembly language program to display graphical ASCII characters from  32 to 127 on a defined window (5,10 and 20,70) with white on blue attribute.

.MODEL SMALL
.STACK 100H
.CODE
.DATA
    CURRENT_ROW DB 5
    CURRENT_COL DB 15
    CHAR_START DB 32
    CHAR_END   DB 127
.CODE
MAIN PROC

        MOV AX,@DATA
        MOV DS,AX
       MOV CX,0000H
       MOV DX,184FH
       MOV AX,0600H
       MOV BH, 0FH
       INT 10H

       MOV CX,050AH
       MOV DX,1446H
       MOV BH,1FH
       MOV AX,0600H
       INT 10H

       MOV BH,00H
       MOV CL,CHAR_END
       SUB CL,CHAR_START
       MOV CH,00H
       MOV AH,02H
       MOV BL,00H

       BACK:
       MOV DH, CURRENT_ROW
       MOV DL, CURRENT_COL
       INT 10H
       MOV DL,CHAR_START
       MOV AH,02H
       INT 21H
       INC CHAR_START
       INC CURRENT_ROW
       CMP BL,15
       JNZ SKIP
       ADD CURRENT_COL,10
       MOV BL,00H
       MOV CURRENT_ROW,05
       JMP SKIP1
       SKIP:
       INC BL
       SKIP1:
       LOOP BACK

       MOV AH,4CH
       INT 21H

MAIN ENDP
END MAIN