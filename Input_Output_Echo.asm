
  .model small  ; model small, dimana code memiliki size <=64K bytes dan data size <=64K bytes
    
  .data 
  
    tanya db 13,10,'Input angka 1 atau 2 atau 3 untuk menampilkan kata rahasia:',13,10,'$'  ; data string untuk statement1
    tanya1 db 13,10,'Tekan 0 untuk jalankan ulang program.',13,10,'$'                       ; data string untuk statement return main
                                        
    kata1 db 13,10,'Kata Rahasia: Aku$',13,10,'$'         ; kata pertama: Aku 
    kata2 db 13,10,'Kata Rahasia: Cinta$',13,10,'$'       ; kata kedua  : Cinta
    kata3 db 13,10,'Kata Rahasia: Assembly$',13,10,'$'    ; kata ketiga : Assembly
    kata4 db 13,10,'Kata Rahasia: Error$',13,10,'$'       ; kata keempat: Error
                
.code 
    .startup
        main:
    
            mov dx, offset tanya    ; menyalin string dari offset statement1
            mov ah, 09h             ; interrupt service 09 yaitu untuk mencetak output string
            int 21h                 ; displaying
            
            mov ah, 01h             ; interrupt service 01 untuk meminta input / reading
            int 21h                 ; meminta input
            
            
            cmp al, 31h             ; comparing input jika sama dengan '1' dalam ASCII hexa
            jne skip:               ; jika bukan sama dengan '1', maka jump ke label skip
            je satu:                ; jump ke label satu jika sama dengan '1' 
        
        satu:   ;label satu
            mov dx, offset kata1    ; menyalin string dari offset dari kata1 yaitu 'Aku'
            mov ah, 09h             ; interrupt service 09 yaitu untuk mencetak output string 
            int 21h                 ; displaying
            jmp break:              ; jump to break
                    
        skip:   ;label skip
            cmp al, 32h             ; comparing input jika sama dengan '2' dalam ASCII hexa 
            jne skip2:              ; jika bukan sama dengan '2', maka jump ke label skip2
            je dua:                 ; jump ke label dua jika sama dengan '2' 
                    
        dua:    ;label dua
            mov dx, offset kata2    ; menyalin string dari offset dari kata2 yaitu 'Cinta'
            mov ah, 09h             ; interrupt service 09 yaitu untuk mencetak output string
            int 21h                 ; displaying
            jmp break:              ; jump to break
        
        skip2:  ;label skip2
            cmp al, 33h             ; comparing input jika sama dengan '3' dalam ASCII hexa
            jne skip3:              ; jika bukan sama dengan '3', maka jump ke label skip3
            je tiga:                ; jump ke label tiga jika sama dengan '3'
        
        tiga:    ;label tiga
            mov dx, offset kata3    ; menyalin string dari offset dari kata3 yaitu 'Assembly'
            mov ah, 09h             ; interrupt service 09 yaitu untuk mencetak output string
            int 21h                 ; displaying
            jmp break:              ; jump to break
            
        skip3:   ;label skip3
            mov dx, offset kata4    ; menyalin string dari offset dari kata3 yaitu 'Assembly'
            mov ah, 09h             ; interrupt service 09 yaitu untuk mencetak output string
            int 21h                 ; displaying
            jmp break:              ; jump to break
            
        break:   ;label break
            mov dx, offset tanya1   ; menyalin string dari offset statement2
            mov ah, 09h             ; interrupt service 09 yaitu untuk mencetak output string
            int 21h                 ; displaying
            
            mov ah, 01H             ; interrupt service 01 untuk meminta input / read input     
            int 21h                 ; meminta input   
            cmp al,30h              ; comparing input jika sama dengan '0' dalam ASCII hexa
            jne end:                ; jika tidak sama dengan '0' maka jump ke label end
            je main:                ; jika sama dengan '0' maka kembali ke label main di awal program untuk mengulang kembali program
        end:
   .exit
            
end
