.model small

.data
    DATA1 db 10 dup(?)                               
    DATA2 db 10 dup(?)    
                    
.code
.startup     
    ;Nomor 1 dalam hal ini menggunakan BS sebagai base alamat (segmen)
    ;Lalu menggunakan DI sebagai offsetnya 
    mov al,10h         ; menyalin 0010H desimal ke dalam low byte dalam hal ini merupakan akumulator berukuran 16 bit 
    mov bx,offset DATA2 ; menyalin isi word lokasi memory offset segmen VAR1 ke dalam BX yang bertugas menyimpan hasil offset berukuran 16 bit
    mov di,0 		; menyalin 0 desimal ke dalam low byte dalam hal ini merupakan akumulator berukuran 8 bit  
    mov cx,10		; menyalin 10 desimal ke dalam instruksi perhitungan lalu akan memulai loop
    
    ulang:
        mov [bx+di],al ; Base Plus Index tidak langsung menangani data memori register basisnya BX
		               ; dan register indexnya tidak secara langsung mengalamatkan memori yang akan ditempatkan 
		               ; pada stack bukan segmen 
        inc di	       ; menambah nilai offset 
        loop ulang  
               
               
    ;Nomor 2 Register relatif 
    
    mov al,10h 		; menyalin 0010H desimal ke dalam low byte dalam hal ini merupakan akumulator berukuran 16 bit 
    mov bx,0		; menyalin 0 desimal ke dalam bx yang merupakan tempat menyimpan offset dan memori

    mov cx,10 		; menyalin 10 desimal ke dalam instruksi perhitungan lalu akan memulai loop
               
    ulang1:
        mov DATA2[bx],al ; Memindahkan data yang berukuran byte atau word antara register dan lokasi 
			             ; memori yang ditunjuk oleh suatu register index atau basis ditambah displacement
        inc bx		 ; menambah nilai offset 
        loop ulang1

.exit
end
