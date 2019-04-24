;Ahmad Rafiul Mahdi
;Alfian Firmansyah
;Fahri Alamsyah
;Hilman Maulana

;3bit input seven segment display

org 00H

AWAL:
       		MOV DPTR,#S7_HEX ;mengcopy address seven segment hexadecimal ke pointer DPTR
       		CLR A			;memastikan A tidak memiliki nilai
SEQUENCE:  	MOV A,P1	; menggunakan Port 1 dan memory A (8-bit) sebagai input
      		CPL A		; input dari keypad dicomplement kan, karena reverse logic 
       				;sehingga lebih mudah untuk menggunakan pointer
		MOVC A,@A+DPTR	; pointer akan mengarahkan input ke address lalu
		CPL A		; complement kembali sesuai jenis seven segment yang digunakan
		MOV P2,A	; Port 2 sebagai output, 
				;isi dari memory A di copy ke Port untuk display
		SJMP SEQUENCE

S7_HEX: 	DB 0BFH,006h,05Bh,04FH,066H,06DH,0FDh,007H,07FH,06FH ;seven segmen dalam hexa

