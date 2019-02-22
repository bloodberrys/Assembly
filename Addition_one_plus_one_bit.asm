.MODEL SMALL  ; model program dalam size code <= 64K bytes dan size data <= 64K bytes

.DATA

    tulisan db 'Masukkan Angka pertama:',13,10,'$'  
    tulisan1 db 13,10,'Masukkan Angka kedua:',13,10,'$'                   
    tulisan2 db 13,10,'Hasilnya adalah:',13,10,'$'
    tulisan3 db 13,10,'Tekan angka 0 untuk mulai lagi :)',13,10,'$'   
        
        ; define bytes dengan isi memory berupa string, 
        ; disimpan dalam alamat variable tulisan, tulisan1, tulisan2, tulisan3
        
        
    angka1 db 2 dup (?)  
    angka2 db 2 dup (?)
    angka3 db 2 dup (?)  
    
        ; inisialisasi space memory 16 bit dan disimpan dalam alamat variable angka1, angka2, angka3                
                                  
.CODE    
.STARTUP
    		MAIN:
    
    MOV DX,OFFSET tulisan  ; menyalin offset yang alamatnya dari variable string tulisan ke dalam isi register dx         
    MOV AH,09H             ; interrupt service 09 yaitu menampilkan string ke display
    INT 21H                ; displaying
        
    MOV AH,01H             ; interrupt service 01 yaitu meminta suatu input berupa angka
    INT 21H                ; meminta input ASCII
    MOV angka1[0],AL       ; menyalin input tersebut ke dalam isi memory angka1[0]
        
    MOV DX,offset tulisan1 ; menyalin offset yang alamatnya daru variable string tulisan1 ke dalam isi register dx
    MOV AH,09H             ; interrupt service 09 yaitu menampilkan string ke display
    INT 21H                ; displaying
       
    MOV AH,01H             ; interrupt offset 01 yaitu meminta suatu input berupa angka
    INT 21H                ; meminta input  ASCII
    MOV angka2[0],AL       ; menyalin input tersebut ke dalam isi memory angka2[0]
        
    MOV CL,angka1[0]       ; memindahkan input angka1[0] ke CL
    MOV DH,angka2[0]       ; memindahkan input angka2[0] ke DH
    MOV AX,0000H           ; reset ax atau clearing
    ADD CL,DH              ; isi register dh ditambahkan dengan isi register cl, lalu hasilnya diletakkan pada register cl
    MOV AL,CL              ; isi register cl disalin ke dalam isi register al
         
    AAA                    ; Adjustment After Addition
        
    OR AX, 3030H           ; Menkonversi dari angka ASCII hexadecimal ke angka sebenarnya dan disalin ke register AX
    MOV angka3[1],AL       ; memindahkan hasil AL tadi ke memory angka3 (LSB)
    MOV angka3[0],AH       ; memindahkan hasil AH tadi ke memory angka3 (MSB)
    
    MOV DX, OFFSET tulisan2     ; menyalin offset yang alamatnya dari variable string tulisan ke dalam isi register dx 
    mov AH, 09H                 ; interrupt service 09 yaitu menampilkan string ke display
    INT 21H                     ; displaying
       
    MOV AX,0000H                ; reset ax
    MOV DL,angka3[0]            ; menyimpan hasil (MSB) ke register DL
    MOV AH,02H                  ; interrupt service 02 yaitu untuk menampilkan ke display monitor
    INT 21H                     ; displaying
        
    MOV AX,0000H                ; reset ax atau clearing
    MOV DL,angka3[1]            ; menyalin hasil (LSB) ke dalam register DL
    MOV AH,02H                  ; interrupt service 02 yaitu untuk menampilkan ke display monitor
    INT 21H                     ; displaying
        
    MOV DX, OFFSET tulisan3     ; menyalin alamat offset tulisan3 ke register dx
    MOV ah, 09H                 ; interrupt service 09 yaitu untuk menampilkan string ke display
    INT 21H                     ; displaying
    
    MOV AH,01H                  ; interrupt service 01 yaitu untuk meminta input dari user
    INT 21H                     ; meminta input
    CMP AL,30h                  ; compare 30h dengan input user,
    JE MAIN:                    ; jump if equal, jika inputnya sama dengan 30h maka kembali ke label main.
    
    ENDING:     
.EXIT 
END
