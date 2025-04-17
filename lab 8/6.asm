TITLE "Write a program to read a string and display each word in separate lines."

.MODEL SMALL
.STACK 100H
.DATA
     MSG     DB "ENTER A STRING:$"
     MEWLINE DB 0AH,0DH,'$'
     BUFFER  DB 80H DUP('$')
.CODE
MAIN PROC
          MOV  AX, @DATA
          MOV  DS, AX

          LEA  DX, MSG

          MOV  AH, 09H          ; DISPLAY ENTER A STRING
          INT  21H

          LEA  DX, BUFFER
          MOV  AH,0AH           ; READ STRING AND STORE LOCATION IN DX WHERE FIRST BYTE DENOTES MAXIMUM CAPACITY AND SECOND BYTE DENOTES ACTUAL LENGTH OF STRING ENTERED
          INT  21H

          LEA  DX,MEWLINE
          MOV  AH,09H
          INT  21H

          LEA  SI, BUFFER+1
          MOV  CL,[SI]
          MOV  CH,00H
      
          LEA  DI,BUFFER+2
       
     BACK:
          MOV  DL,[DI]
          CMP  DL, ' '
          JNE  SKIP
          LEA  DX,MEWLINE
          MOV  AH,09H
          INT  21H
          JMP  EXIT
     SKIP:MOV  AH,02H
          INT  21H
     EXIT:INC  DI
          LOOP BACK
       
          MOV  AH, 4CH
          INT  21H
MAIN ENDP
END MAIN  
