;Nama Kelompok :
;1.Ahmad Rafiul Mahdi 
;2.Alfian Firmansyah
;3.Fahri Alamsyah
;4.Hilman Maulana 

;NO 4

.model small
.stack 100h

.data

Hasil db 1 dup <?>  
Sisa db 1 dup <?>

.code
.startup  

mov ax, 03E8h
mov bl, 0Ah
div bl   
mov hasil, al
mov sisa, ah

.exit


 

