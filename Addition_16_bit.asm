.model small
.stack 100h
.data
    teks1 db 0ah,0dh, "Angka Pertama:$"    ; variable memory angka pertama
    teks2 db 0ah,0dh, "Angka Kedua:$"      ; variable memory angka kedua
    teks3 db 0ah,0dh, "Hasilnya adalah $"  ; variable memory hasil
    
.code
    main:
        mov ax,@data  ; menyalin isi memory secara indirect di alamat data     
        mov ds,ax     ; menyalin ax ke register ds
        
        lea dx,teks1  ; menyalin teks1 ke register dx dengan powerful 
        mov ah,09h    ; interruot service 09 yaitu menampilkan string ke display monitor
        int 21h       ; displaying
        
        mov ah,01h    ; interrupt service 01 sebagai read input.
        int 21h       ; meminta input
        
        sub al,30h    ; mengurangi isi register AL dengan 30h sebagai konversi ke 
        mov bh,al     ; menyalin register aL high base
        
        mov ah,01h    ; interrupt service 01 yaitu sebagai read input.
        int 21h       ; meminta input
        
        sub al,30h    ; mengurangi offset register AL dengan 30h untuk konversi ke ASCII angka
        mov bl,al     ; menyalin offset dari register AL ke isi memory BL
        
        lea dx,teks2  ; memasukkan teks2 ke dalam register dx dengan powerful
        mov ah,09h    ; interrupt service 09 yaitu sebagai penampil string ke layar monitor
        int 21h       ; displaying
        
        mov ah,01h    ; interrupt service 01 yaitu sebagai read input 
        int 21h       ; meminta input
        
        sub al,30h    ; mengurangi isi register AL dengan 30h mengkonversi ASCII angka asli
        mov ch,al     ; menyalin register AL ke dalam register ch 
        
        mov ah,01h    ; interrupt service 01 read input
        int 21h       ; displaying
        
        sub al,30h    ; mengkonversi ASCII hexadecimal ke angka asli
        mov cl,al     ; menyalin register AL ke register cl
        
        add bl,cl     ; menambahkan offset dari register CL dan register bl ke dalam register BL
        
        mov al,bl     ; menyalin register BL ke dalam register AL
        mov ah,00h    ; reset register AH
        aaa           ; Adjustment After Addition, dimana mengkonversi
                      ; dari ASCII hexa decimal ke angka sebenarnya per 8 bit
                      
        
        mov cl,al     ; menyalin register AL ke register AL
        mov bl,ah     ; menyalin register AH ke register BL
        
        add bl,bh     ; menambahkan register bh dengan register BL dan disimpan ke register BL
        add bl,ch     ; lalu ditambahkan juga dengan register CH
        
        mov al,bl     ; register bl disalin ke register AL.
        mov ah,00h    ; reset register AH 
        aaa           ; Adjustment After Addition, dimana mengkonversi
                      ; dari ASCII hexa decimal ke angka sebenarnya per 8 bit 
        
        mov bx,ax     ; register ax di copy ke bx
        
        mov dx,offset teks3 ; menyalin offset teks3 ke dx
        mov ah,09h          ; interrupt service 09 menampilkan string
        int 21h             ; displaying
        
        mov dl,bh           ; menyalin BH ke dalam offset register DL
        add dl,30h          ; menambahkan isiregister dl dengan value 30h
        mov ah,02h          ; interrupt service 02 untuk meminta input dari user
        int 21h             ; meminta input
        
        mov dl,bl           ; menyalin bl ke dl
        add dl,30h          ; menambahkan register dl dengan 30h
        mov ah,02h          ; interrupt service 02 yaitu meminta input 
        int 21h             ; meminta input
        
        mov dl,cl           ; menyalin register CL ke register DL
        add dl,30h          ; menambahkan register dl dengan 30h konversi
        mov ah,02h          ; interrupt service 02 yaitu untuk menginput angka
        int 21h             ; meminta input
        
        .exit
        end
