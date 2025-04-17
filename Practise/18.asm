.MODEL SMALL
.STACK 100H
.DATA
      MSG     DB "ENTER A NUMBER : $"
      NEWLINE DB 0DH,0AH,'$'
      NUM     DB 0
      SUM     DW 0
      OUPUT   DB 'THE SUM OF THE SERIES IS : $'
.CODE
MAIN PROC
            MOV  AX,@DATA
            MOV  DS,AX

            LEA  DX,MSG
            MOV  AH,09H
            INT  21H

            MOV  AH,01H
            INT  21H
            SUB  AL,30H
            MOV  NUM,AL

            MOV  AH,01H
            INT  21H
            CMP  AL,0DH
            JZ   SKIP2
            SUB  AL,30H
            MOV  BH,AL

            MOV  AL,0AH
            MUL  NUM
            MOV  NUM,AL
            ADD  NUM,BH

      SKIP2:
            MOV  AL,01H
            MOV  BL,02H

            MOV  CH,00H
            MOV  CL,NUM

      BACK1:
            MUL  BL
            ADD  SUM,AX
            INC  AL
            INC  BL
            LOOP BACK1


            LEA  DX,NEWLINE
            MOV  AH,09H
            INT  21H

       
            MOV  AX,SUM
            MOV  BX,10
            MOV  CX,00H
        
      BACK: MOV  DX,0000H
            DIV  BX
            PUSH DX
            INC  CX
            CMP  AL,00H
            JZ   SKIP
            JMP  BACK
      SKIP: 

            LEA  DX,OUPUT
            MOV  AH,09H
            INT  21H

      BACK2:
            POP  DX
            ADD  DL,30H
            MOV  AH,02H
            INT  21H
            LOOP BACK2

        
        

            MOV  AH,4CH
            INT  21H

MAIN ENDP
END MAIN
