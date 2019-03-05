;Nama Kelompok :
;1.Ahmad Rafiul Mahdi 
;2.Alfian Firmansyah
;3.Fahri Alamsyah
;4.Hilman Maulana 

;NO 1 DAN 2 


.model small
.stack 100h

.data
data1 db 10 dup (?) 
JUMLAHAWAL1 db 1 dup <?>


.code 
.startup

mov bx, offset data1
mov di, offset 1020h
mov cx, 0Ah 
mov dl, 02h

AGAIN:

mov [bx], dl
mov al, [bx]
mov [di], al
inc bx 
inc di
add dl, 02h
loop again

MOV DI, offset 1020h
mov al, [di]
mov cx, 09h
              
AGAIN2:

inc di
mov bl, [di]
adc al, bl
mov bl, 0000h
loop again2 

mov JUMLAHAWAL1, al


end

