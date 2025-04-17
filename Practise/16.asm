.MODEL SMALL
.STACK 100H
.DATA
  MSG    DB "ENTER A STRING: $"
  BUFFER DB 80H,?,80H DUP(?)
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

              CALL CLEARSCREEN

              LEA  SI,BUFFER+1
              MOV  AL,[SI]
              MOV  DH,0CH
              MOV  DL,80
              SUB  DL,AL
              MOV  BH,00H
              MOV  CX,80
              MOV  CH,0
              SUB  CL,AL
              

  BACK:       
              MOV  AH,02H
              INT  10H
              PUSH DX

              LEA  DX,BUFFER+2
              MOV  AH,09H
              INT  21H

              PUSH BX
              PUSH CX

              CALL CLEARSCREEN  ; AFFECTS AX,BH,CX,DX
              CALL DELAY        ; AFFECTS CX
              POP  CX
              POP  BX
              POP  DX

              DEC  DL

              LOOP BACK

              MOV  AH,4CH
              INT  21H

MAIN ENDP

CLEARSCREEN PROC
              MOV  CX,0000H
              MOV  DX,184FH
              MOV  AX,0600H
              MOV  BH,0FH
              INT  10H
              RET
CLEARSCREEN ENDP

DELAY PROC
              MOV  CX,0FFFFH
  DELAY_LOOP: 
              LOOP DELAY_LOOP
              RET
DELAY ENDP

END MAIN