TITLE "There are two tables having ten 16-bit data in each. Write an assembly language program to generate the third table which contains the sum of corresponding element of first and second table.."

.MODEL SMALL
.STACK 100H
.DATA
  TABLE_1      DW 1001H,1002H,1003H,1004H,1005H,2001H,2002H,2003H,2004H,2005H
  TABLE_2      DW 3001H,3002H,3003H,3004H,3005H,4001H,4002H,4003H,4004H,4005H
  RESULT_TABLE DW 0AH DUP(?)
.CODE
MAIN PROC
       MOV  AX,@DATA
       MOV  DS,AX
       LEA  SI,TABLE_1
       LEA  BX,TABLE_2
       LEA  DI,RESULT_TABLE
       MOV  CX,0AH
  BACK:MOV  DX,[SI]
       ADD  DX,[BX]
       MOV  [DI],DX
       ADD  SI,2
       ADD  DI,2
       ADD  BX,2
       LOOP BACK
       INT  03H
       MOV  AH,4CH
       INT  21H
MAIN ENDP
END MAIN    