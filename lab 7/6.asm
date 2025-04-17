TITLE "Write a program to find the sum of the following series up to 20 terms and store the result 2 x 3 + 4 x 5 + ... to 20 terms"

.MODEL SMALL
.STACK 100H
.DATA
          ORG 100H
     SUM  DW  0
.CODE
MAIN PROC
          MOV  AX,@DATA
          MOV  DS,AX
          MOV  AX,0000H
          MOV  DX,0000H
          MOV  CX, 0014H

     BACK:MOV  AL,CL
          ADD  AL,AL
          MOV  BL,AL
          INC  BL
          MUL  BL
          ADD  DX,AX
          LOOP BACK

          MOV  SUM,DX

          INT  03H
          MOV  AH,4CH
          INT  21H
MAIN ENDP
END MAIN    