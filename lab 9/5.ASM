TITLE "Write a program that takes a string from the user and display each word in new line diagonally from upper left towards bottom right in a clear screen. If the string is “Programming in Assembly Language is Fun”, it should be displayed as “Programming lf in lf Assembly lf Language lf is lf Fun"

.MODEL SMALL
.STACK 100H
.DATA
      MSG    DB "ENTER A STRING: $"
      BUFFER DB 80H,?,80H DUP('$')
.CODE
MAIN PROC
            MOV  AX,@DATA
            MOV  DS,AX

            LEA  DX, MSG
            MOV  AH,09H
            INT  21H

            LEA  DX, BUFFER
            MOV  AH,0AH
            INT  21H

      ; Clear screen
            MOV  AX,0002H
            INT  10H

      ;  OR ; Clear screen
      ;         MOV  AH, 06H
      ;         MOV  AL, 0          ; AL, NO OF LINE TO DELETE . 0 MEANS ALL
      ;         MOV  BH, 07H        ;0 BACKGROUND COLOR 7 TEXTCOLOR
      ;         MOV  CX, 0000H      ; DEFINE TOP LEFT CORNER
      ;         MOV  DX, 184FH      ; DEFINE BOTTOM RIGHT CORNER
      ;         INT  10H

            LEA  SI,BUFFER+2
            MOV  CH,00H
            MOV  CL,[BUFFER+1]

      ; Initialize cursor position
            MOV  AH,02H
            MOV  BH,00H
            MOV  DH, 0              ; Start at row 0
            MOV  DL, 0              ; Start at column 0
            INT  10H
            
            MOV  BL,00H

      BACK: MOV  DL,[SI]
            CMP  DL,' '
            JNE  SKIP
      ; CHANGE cursor position
            MOV  AH,02H
            MOV  DL,BL
            INC  DH
            INT  10H
            JMP  SKIP1
      SKIP: INT  21H
            INC  BL
      SKIP1:INC  SI
            LOOP BACK


            MOV  AH,4CH
            INT  21H
MAIN ENDP
END MAIN
