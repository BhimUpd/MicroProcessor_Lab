.MODEL SMALL
.STACK 100H
.DATA
      MSG         DB "ENTER A STRING: $"
      BUFFER      DB 100 DUP('$')
      VOWEL_COUNT DB 0
      NEWLINE     DB 0DH,0AH,'$'
      VOWEL       DB 'AEIOUaeiou$'
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

                 MOV  CL,[BUFFER+1]
                 MOV  CH,00H
                 LEA  SI,BUFFER+2

      BACK:      MOV  DL,[SI]
                 PUSH CX
                 MOV  DI,0
                 MOV  CX,10
      BACK1:     CMP  DL,VOWEL[DI]
                 JE   VOWELFOUND
                 INC  DI
                 LOOP BACK1
                 JMP  SKIP
      VOWELFOUND:INC  VOWEL_COUNT
      SKIP:      INC  SI
                 POP  CX
                 LOOP BACK

                 LEA  DX,NEWLINE
                 MOV  AH,09H
                 INT  21H

                 MOV  AH,02H
                 MOV  DL,VOWEL_COUNT
                 ADD  DL,30H
                 INT  21H

                 MOV  AH,4CH
                 INT  21H
MAIN ENDP
END MAIN
