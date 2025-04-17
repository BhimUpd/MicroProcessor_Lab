;MULTIPLICATION TABLE
.MODEL SMALL
.STACK 100H
.DATA
      MSG     DB 'ENTER A NUMBER: $'
      NUM     DB ?
      CROSS   DB ' X $'
      EQUAL   DB ' = $'
      NEWLINE DB 13,10,'$'

.CODE
MAIN PROC
            MOV  AX,@DATA
            MOV  DS,AX

            LEA  DX,MSG           ;ASK THE USER TO ENTER A NUMBER
            MOV  AH,09H
            INT  21H

            MOV  AH,01H           ;READ THE NUMBER
            INT  21H

            MOV  NUM,AL
            SUB  NUM, '0'

            LEA  DX,NEWLINE       ;PRINT A NEW LINE
            MOV  AH,09H
            INT  21H

            MOV  CL,1


      BACK: 
            MOV  DL, NUM
            ADD  DL, '0'          ; Convert to ASCII
            MOV  AH, 02H
            INT  21H

            LEA  DX, CROSS
            MOV  AH, 09H
            INT  21H

            MOV  DL, CL
            PUSH AX               ; Save AL (multiplication result)
            PUSH CX
            CALL PRINT
            POP  CX
            POP  AX               ; Restore AL

            LEA  DX, EQUAL
            MOV  AH, 09H
            INT  21H

            MOV  AL, NUM
            MUL  CL
            MOV  DL, AL
            PUSH AX               ; Save AL
            PUSH CX
            CALL PRINT
            POP  CX
            POP  AX               ; Restore AL

            LEA  DX, NEWLINE
            MOV  AH, 09H
            INT  21H

            INC  CL
            CMP  CL, 11
            JNE  BACK

            MOV  AH,4CH
            INT  21H

MAIN ENDP

PRINT PROC
            MOV  BX,10
            MOV  AL,DL
            MOV  CX,0000H
      BACK1:MOV  AH,00H
            DIV  BX
            PUSH DX
            INC  CX
            CMP  AL,0
            JNE  BACK1

      BACK2:POP  DX
            MOV  DL,DH
            ADD  DL,'0'
            MOV  AH,02H
            INT  21H
            LOOP BACK2

            RET
PRINT ENDP

END MAIN