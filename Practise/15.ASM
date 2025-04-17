.MODEL SMALL
.STACK 100H
.DATA
     MSG    DB "ENTER A STRING: $"
     BUFFER DB 100 DUP('$')
.CODE
MAIN PROC
          MOV  AX,@DATA
          MOV  DS,AX

          LEA  DX,MSG
          MOV  AH,09H
          INT  21H

          MOV  AH,0AH
          LEA  DX,BUFFER
          INT  21H

          LEA  SI,BUFFER+1
          MOV  CL,[SI]
          MOV  CH,00H
          INC  SI

     BACK:MOV  DL,[SI]
          CMP  DL,'A'
          JL   SKIP
          CMP  DL,'Z'
          JG   SKIP
          ADD  DL,20H
          MOV  [SI],DL
     SKIP:
          INC  SI
          LOOP BACK

          MOV  CX,0000H
          MOV  DX,184FH
          MOV  AX,0600H
          MOV  BH,0FH
          INT  10H

          MOV  CX,030AH
          MOV  DX, 1546H
          MOV  BH,0B0H
          MOV  AH,06H
          INT  10H

          MOV  DH,0CH
          MOV  DL,28H
          LEA  SI,BUFFER+1
          MOV  AL,[SI]
          SHR  AL,1
          SUB  DL,AL
          MOV  BH,00H
          MOV  AH,02H
          INT  10H

          LEA  DX,BUFFER+2
          MOV  AH,09H
          INT  21H

          MOV  AH,4CH
          INT  21H

MAIN ENDP
END MAIN