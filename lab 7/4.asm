TITLE "Two tables of data are stored having ten 16-bit data each. Write an assembly language program to generate the third table which contains 1FFFH if the corresponding data in first table is less then that of second table, else store 0000."

.MODEL SMALL
.STACK 100H
.DATA
      TABLE_1      DW 1001H,1002H,1003H,1004H,1005H,2001H,2002H,2003H,2004H,2005H
      TABLE_2      DW 3001H,3002H,3003H,3004H,3005H,1001H,1002H,1003H,1004H,1005H
      RESULT_TABLE DW 0AH DUP(?)
.CODE
MAIN PROC
            MOV  AX,@DATA
            MOV  DS,AX
            LEA  SI,TABLE_1
            LEA  BX,TABLE_2
            LEA  DI,RESULT_TABLE
            MOV  CX,0AH
      BACK: MOV  DX,[SI]
            CMP  DX,[BX]
            JNC  SKIP
            MOV  DX,1FFFH
            JMP  SKIP1
      SKIP: MOV  DX,0000H
      SKIP1:MOV  [DI],DX
            ADD  SI,2
            ADD  DI,2
            ADD  BX,2
            LOOP BACK
            INT  03H
            MOV  AH,4CH
            INT  21H
MAIN ENDP
END MAIN    