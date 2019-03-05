;Nama Kelompok :
;1.Ahmad Rafiul Mahdi 
;2.Alfian Firmansyah
;3.Fahri Alamsyah
;4.Hilman Maulana 

;NO 3 

.model medium
.stack 100h

.data

data1 dd AA33h

.code
.startup 

mov bx, data1  ; memindahkan isi dari data1 ke bx, dengan data type dd
and bx, 0f0f0h ; menclearkan byte 1 dan byte 3 dengan operasi AND pada BX dengan f0f0h (f untuk mempertahankan angka, 0 untuk mengclearkan)
XOR bx, 0f0f0h ; menginverkan byte 2 dan byte 4 dengan operasi XOR pada BX dengan f0f0h <f untuk menginverskan angka, 0 untuk mempertahankan angka>
OR bx, 0f000h  ; mengeset byte pertama dengan F/1111 (pada biner) dengan menggunakan OR <f untuk mengeset angka, 0 untuk mempertahankankan angka>
SHL bx, 2      ; melakukan operasi shift kekiri sebanyak 2 kali

end
.EXIT

 

