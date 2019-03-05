; Nama Kelompok 
;1. Ahmad Rafiul Mahdi 
;2. Alfian Firmansyah
;3. Fahri Alamsyah   
;4. Hilman Maulana 

; NO 7 

.model small

.data
    HURUF db 20 dup(?)
    abesar db 30h
    akecil db 30h
    text1 db 'Masukkan 20 huruf:',13,10,'$'
    text2 db 13,10,'jumlah "A":',13,10,'$' 
    text3 db 13,10,'jumlah "a":',13,10,'$'
    text4 db 13,10,'jumlah keduanya:',13,10,'$' 
.code
.startup
    
    mov cx,20 ;counter di set untuk loop 20x
    
        MOV DX,OFFSET text1 ;menyalin offset textA 
        MOV AH,09H            ;menentukan jenis INT 21H untuk cetak textA
        INT 21H               ;cetak textA diakhiri $
        MOV BX,OFFSET HURUF

    lagi:
        MOV AH,01H          ;menentukan jenis INT 21H untuk menerima input
        INT 21H             ;meminta input
        MOV [BX],AL         ; memasukan input
        CMP [BX],41H        ;compare bx dengan ascii A
        JE abesarplus       ;kalau sama, jump ke abesarplus
        CMP [BX],61H        ;compare bx dengan ascii a
        JE akecilplus       ;kalau sama, jump ke akecilplus
        JMP next:    ;untuk karakter yang bukan a atau A
         
    abesarplus:
        INC abesar  ;abesar + 1
        JMP next:   ;agar tidak ke akecilplus
    akecilplus:
        INC akecil  ;akecil + 1
    next:    
        
        INC BX      ;menaikan index huruf
        LOOP lagi   
        
    
    MOV DX,OFFSET text2 ;menyalin offset text1 
    MOV AH,09H            ;menentukan jenis INT 21H untuk cetak text1
    INT 21H               ;cetak text1 diakhiri $  
    
    MOV AX,0000H     ;menyalin 0000H ke AX
    MOV DL,abesar ;menyalin abesar ke DL
    MOV AH,02H       ;menentukan jenis INT 21H untuk mencetak angka di DL
    INT 21H          ;mencetak angka di DL    

    MOV DX,OFFSET text3 
    MOV AH,09H            
    INT 21H               
    
    MOV AX,0000H     
    MOV DL,akecil 
    MOV AH,02H       
    INT 21H                 
 
    MOV DX,OFFSET text4 
    MOV AH,09H            
    INT 21H                 
    
    MOV CL,abesar    ;menyalin abesar ke CL
    MOV DH,akecil     ;menyalin akecil ke DH
    MOV AX,0000H      ;menyalin 0000H ke AX
    ADD CL,DH         ;CL ditambah DH, dimasukan di CL
    MOV AL,CL         ;hasil penjumlahan disimpan ke AL
         
    AAA  
    OR AL,30H      ;Mengubah bit-bit AX(hasil) dengan di OR kan dengan 3030H(00 dalam ascii)
    MOV DL,AL
    MOV AH,02H       ;menentukan jenis INT 21H untuk mencetak angka di DL
    INT 21H          ;mencetak angka di DL  
    
    .EXIT

END 
   