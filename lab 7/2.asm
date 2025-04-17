TITLE "Write an assembly language program to add ten 16-bit numbers stored in memory and store the result."

.MODEL SMALL
.STACK 100H
.DATA
     NUMS DW 1H,2H,3H,4H,5H,6H,7H,8H,9H,AH
.CODE
MAIN PROC
          MOV  AX,@DATA
          MOV  DS,AX
          MOV  CX,10
          MOV  AX,00        ; SUM
          MOV  BL,00        ; CARRY FLAG
          LEA  SI,NUMS
     BACK:
          ADD  AX,[SI]
          JNC  SKIP
          INC  BL
     SKIP:INC  SI
          INC  SI
          LOOP BACK
          MOV  [SI],AX
          INC  SI
          MOV  [SI],BL
          INT  03H
          MOV  AH,4CH
          INT  21H
MAIN ENDP
          END MAIN
