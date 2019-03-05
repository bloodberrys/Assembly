.MODEL SMALL

.DATA
   CHAR_STRING DB 'AK1as4BNZSdfg?23'   ; there are 16 chars
   CAPITAL DB 16 DUP (?)
   SMALL  DB 16 DUP (?)

.CODE
.STARTUP
    MOV DI, 0 
    MOV SI, 0
    MOV BX, 0
	MOV CX,16         ;there are 16 chars on char_string

AGAIN:
    MOV AL, CHAR_STRING[BX]
    CMP AL, 41H       ;ASCII upper letter A = 41H
    JB CONTINUE       ;not a letter
    CMP AL,'z'        ;can also write the character instead of its ASCII code
    JA CONTINUE       ;not a letter
    CMP AL,5AH        ;ASCII 'Z'
    JBE LETTERCAPITAL ;capital letter
    CMP AL, 61H       ;ASCII 'a'
    JB CONTINUE       ;not a letter
    MOV SMALL[SI], AL      ;small letter 
    INC SI 
    JMP CONTINUE

LETTERCAPITAL:
    MOV CAPITAL[DI], AL
    INC DI

CONTINUE:
    INC BX
    LOOP AGAIN    
.EXIT
END

