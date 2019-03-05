;Nama Kelompok :
;1.Ahmad Rafiul Mahdi 
;2.Alfian Firmansyah
;3.Fahri Alamsyah
;4.Hilman Maulana 

;NO 6

.model small
.stack 100h

.data

GENAP db 0h
SISA db 0h
GANJIL db 0h

.code
.startup 

MOV AL, 04h
MOV BL, 07h
MOV CX, 0000h
MOV CL, 17h

ADD AL, BL
MUL CL 

MOV CL, 02H
DIV CL

CMP AH, 00h
JE KEY1
JNE KEY2

KEY1:
MOV GENAP, AL

KEY2:
MOV SISA, AH
MOV GANJIL, AL
                
end
.exit




 

