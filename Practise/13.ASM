.MODEL SMALL
.STACK 100H
.DATA
      MSG     DB "ENTER A STRING: $"
      BUFFER  DB 100 DUP('$')
      NEWLINE DB 0DH,0AH,'$'
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

      BACK: MOV  DL,[SI]
            CMP  DL,'a'
            JE   VOWEL
            CMP  DL,'e'
            JE   VOWEL
            CMP  DL,'i'
            JE   VOWEL
            CMP  DL,'o'
            JE   VOWEL
            CMP  DL,'u'
            JE   VOWEL
            JMP  SKIP
      VOWEL:SUB  DL,32
            MOV  [SI],DL
      SKIP: INC  SI
            LOOP BACK

            LEA  DX,NEWLINE
            MOV  AH,09H
            INT  21H

            LEA  DX, BUFFER+2
            MOV  AH,09H
            INT  21H

            MOV  AH,4CH
            INT  21H
MAIN ENDP
END MAIN
