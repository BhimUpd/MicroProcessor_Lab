.MODEL SMALL
.STACK 100H
.DATA
      NUMS  DB 10,20,50,70,100,140,200
      COUNT DB 7
      SUM   DW 0
.CODE
MAIN PROC
            MOV  AX,@DATA
            MOV  DS,AX
            LEA  SI,NUMS
            MOV  CH,00H
            MOV  CL,COUNT
            MOV  AH,00H

      BACK: MOV  AL,[SI]
            CMP  AL,50
            JL   SKIP1
            CMP  AL,150
            JG   SKIP1
            ADD  SUM,AX
            INC  SI
      SKIP1:LOOP BACK

            MOV  AX,SUM
            MOV  BX,10
            MOV  CX,0

      BACK1:MOV  DX,0
            DIV  BX
            ADD  DL,'0'
            PUSH DX
            INC  CX
            TEST AX,AX
            JNZ  BACK1

      BACK2:
            POP  DX
            MOV  AH,02H
            INT  21H
            LOOP BACK2
        

MAIN ENDP
END MAIN
