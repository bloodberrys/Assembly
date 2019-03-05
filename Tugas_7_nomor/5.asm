;Nama Kelompok :
;1.Ahmad Rafiul Mahdi 
;2.Alfian Firmansyah
;3.Fahri Alamsyah
;4.Hilman Maulana 

;NO 5

.model small
.stack 100h

.data 
NUMB db 89
TEMP1 dw 1 dup <?>
TEMP2 dw 2 dup <?>

.code
.startup

MOV al, NUMB
AAM
MOV TEMP1, AX
OR AX, 3030h 
MOV BL, AH  
MOV BH, AL
MOV TEMP2, BX

.exit

 

