TITLE "Write an assembly language program to sum numbers from 0 to 255.."

.MODEL SMALL
.STACK 100H
.DATA
     SUM  DW 0
.CODE
MAIN PROC
            MOV AX,@DATA
            MOV DS,AX
            XOR AX,AX
            XOR CX,CX
     MOVEUP:
            ADD AX,CX
            INC CX
            CMP CX,100H
            JNE MOVEUP
            MOV SUM,AX
            INT 03H
            MOV AH,4CH
            INT 21H
MAIN ENDP
          END MAIN
