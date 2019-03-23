
 ;KELOMPOK 32 A - Alfian Firmansyah | Alzy Maulana
 
;REFERENCE : Examaple list of tone, playing on input from Praktikum Computer Based System Course on scele.ui.ac.id 

;-------------------------------------------------------------------------------------------------------        
;deskripsi program piano sederhana
;-------------------------------------------------------------------------------------------------------        
        
;Ketika pertama kali program dijalankan, program akan bertanya ingin menginput tipe nada rendah, normal, atau tinggi
;Jika user ingin nada rendah tekan 1,  1234567
;Jika user ingin nada normal tekan 2, atau langsung mengetik  QWERTYU atau qwertyu
;Jika user ingin nada tinggi tekan 3, atau langsung mengetik  ASDFGHJK atau asdfghjk



;Lalu ketika sudah dipilih tipe nadanya, maka user langung dapat bermain dengan menekan keyboard sesuai dengan yang tertera.
;untuk mengganti tipe nada, bisa tekan "/", 
;untuk keluar bisa tekan "0"

;------------------------------------------------------------------------------------------------------
;analisis program: 
;------------------------------------------------------------------------------------------------------

;label pada program assembly memiliki keterbatasan JUMP, maka dari itu untuk menanggulangi error relative jump, 
;kami menggunakan label tambahan yang jump ke label yang dituju. contohnya pada program ini adalah label exit5, exit4, exit3, exit2, exit 

;Berbeda dengan procedure yang mampu dipanggil sejauh apapun jumpingnya
;procedure curs_on dan curs_off mampu dipanggil pada jumping yang relatif jauh



        

.MODEL tiny

.STACK 100H

ORG     100H

.DATA

    RENDAH   DB '.1 = DO; .2 = RE; .3 = MI; .4 = FA; .5 = SOL; .6 = LA; .7 = SI; >> 0 UNTUK KELUAR >> / untuk memilih nada ' ,13,10, '$'
	NORMAL	DB 13,10,'Q = DO; W = RE; E = MI; R = FA; T = SOL; Y = LA; U = SI; >> 0 UNTUK KELUAR >> / untuk memilih nada ',13,10,'$'
    TINGGI	DB 13,10,'A. = DO; S. = RE; D. = MI; F. = FA; G. = SOL; H. = LA; 7. = SI; >> / untuk memilih nada ',13,10,'$'
	prom DB 13,10,'1 untuk nada rendah, 2 untuk nada normal, 3 untuk nada tinggi, 0 untuk exit',13,10,'$'
	STOR    DW 0        ;MEMORY
        
.CODE
                         
.STARTUP

    MAIN:
       
       
        CALL CURS_ON 
        MOV AX, @DATA
        MOV DS, AX     
            
        
		MOV DX, OFFSET prom						;nanya tipe nada, rendah, normal atau tinggi
        MOV AH, 09H
        int 21h     
         
         MOV DX, OFFSET RENDAH 					; nampilin key-key untuk piano
		 MOV AH, 09h
		 int 21h           
                    
         MOV DX, OFFSET NORMAL
		  MOV AH, 09h
		 int 21h
                       
         MOV DX, OFFSET TINGGI
		   MOV AH, 09h
		 int 21h              
                       
        MOV AH, 01H        ;SCAN INPUT USER
        INT 21H
		
		CMP AL,"0"         ;JIKA USER MASUKAN 0 maka EXIT
        JE EXIT5
		JNE jj
		
		jj:
		CMP AL, "1"
		
		JE GET_INPUT_C
		JNE bawah
		
		bawah:
		CMP AL, "2"
		JE GET_INPUT_Nj
		JNE bottom
		
		bottom:
		CMP AL, "3"
		JE GET_INPUT_Tjj
		JNE EXIT5
		      
		GET_INPUT_C:
		CALL CURS_OFF   
		 
		 JMP GET_INPUT
		 
		GET_INPUT: 
		     
       
            CALL CURS_OFF
            MOV AH, 01H        ;SCAN IMPUT USER
            INT 21H
            
            CMP AL,"0"         ;JIKA USER MASUKAN 0 > EXIT
            JE EXIT5
               
            CMP AL,"/"
            JE MAIN
               
		    CMP AL,"1"         
            JE RDO
			
			CMP AL,"2"         
            JE RRE
			
			CMP AL,"3"         
            JE RMI
			
			CMP AL,"4"         
			JE RFA
			
			CMP AL,"5"         
			JE RSO
		
			CMP AL,"6"         
			JE RLA
			
			CMP AL,"7"         
			JE RSAI
        
			JNE GET_INPUT_Nj
		
		JMP GET_INPUT      ;LOOPING AMBIL INPUT SELANJUTNYA	
		           
		GET_INPUT_Nj:
		CALL CURS_OFF   
		jmp GET_INPUT_N
		
		GET_INPUT_Tjj:
		jmp GET_INPUT_Tj           
		          
		EXIT5:
          jmp EXIT4           
		           
		MAIN1:
		jmp main
		           
		RDO:
            MOV     AX, 9121        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT

        RRE:
            MOV     AX, 8126        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT

        RMI:
            MOV     AX, 7239        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT

        RFA:
            MOV     AX, 6833        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT

        RSO:
            MOV     AX, 6087        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT

        RLA:
            MOV     AX, 5423        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT

        RSAI:
            MOV     AX, 4831        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT	
            
            
            
            
	GET_INPUT_N:
	         
		    CALL CURS_OFF 
		    MOV AH, 01H        ;SCAN IMPUT USER
            INT 21H
            CALL CURS_OFF
            CMP AL,"0"         ;JIKA USER MASUKAN 0 > EXIT
            JE EXIT4 
            
            CMP AL,"/"
            je main1
		          
            CMP AL,"Q"
			JE NDO
			CMP AL,"W"
			JE NRE
			CMP AL,"E"
			JE NMI
			CMP AL,"R"
			JE NFA
			CMP AL,"T"
			JE NSO	
			CMP AL,"Y" 
			JE NLA
			CMP AL,"U"
			JE NSI
			CMP AL,"q"         
            JE NDO
			CMP AL,"w"         
            JE NRE			
			CMP AL,"e"         
            JE NMI
			CMP AL,"r"         
            JE NFA
			CMP AL,"t"         
            JE NSO
			CMP AL,"y"         
            JE NLA
			CMP AL,"u"         
            JE NSI  
            
            JNE GET_INPUT_Tj
            
			JMP GET_INPUT_N	
		                     
		    get_inputu:
		    jmp get_input
		                     
		  GET_INPUT_Tj:      
		  CALL CURS_OFF   
		 
		  jmp GET_INPUT_T  
		  
		  EXIT4:
		  jmp EXIT3   
		  
		  main2:
		  jmp main1
		      
		NDO:
            MOV     AX, 4560        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_N

        NRE:
            MOV     AX, 4063        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_N

        NMI:
            MOV     AX, 3619        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_N

        NFA:
            MOV     AX, 3416        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_N

        NSO:
            MOV     AX, 3043        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_N

        NLA:
            MOV     AX, 2711        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_N

        NSI:
            MOV     AX, 2415        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_N
                
                EXIT3:
                jmp EXIT2
		               
		            GET_INPUTT:
		            jmp get_INPUTu   
		               
	GET_INPUT_T:
	       
           CALL CURS_OFF
			MOV AH, 01H        ;SCAN IMPUT USER
            INT 21H
            CALL CURS_OFF
            CMP AL,"0"         ;JIKA USER MASUKAN 0 > EXIT
            JE EXIT2 
			         
			CMP AL,"/"
			je main2
			         
			CMP AL,"A"
			JE TDO
			CMP AL,"S"
			JE TRE
			CMP AL,"D"
			JE TMI 
			CMP AL,"F"
			JE TFA 
			CMP AL,"G"
			JE TSO 
			CMP AL,"H"
			JE TLA 
			CMP AL,"J"
			JE TSI
			CMP AL,"K"
			JE TTDO   
			CMP AL,"a"         
            JE TDO 
			CMP AL,"s"         
            JE TRE
			CMP AL,"d"         
            JE TMI
			CMP AL,"f"         
            JE TFA
			CMP AL,"g"         
            JE TSO
			CMP AL,"h"         
            JE TLA
			CMP AL,"j"         
            JE TSI
			CMP AL,"k"         
            JE TTDO  
            
            JNE GET_INPUTT
            
          JMP GET_INPUT_T  
               TDO:
            MOV     AX, 2280        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_T

        TRE:
            MOV     AX, 2031       
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_T

        TMI:
            MOV     AX, 1809        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_T
             
             EXIT2:
	        JMP EXIT1
        TFA:
            MOV     AX, 1715        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_T

        TSO:
            MOV     AX, 1521        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_T

        TLA:
            MOV     AX, 1355        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_T

        TSI:
            MOV     AX, 1207        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_T

        TTDO:
            MOV     AX, 1140        
            MOV     STOR, AX
            CALL    SOUNDER         
            JMP     GET_INPUT_T
         
	        
        	

        
     

			

        ;FUNGSI MATIKAN CURSOR
        CURS_OFF:
            MOV     CH, 10h         ;SET BIT UNTUK MATIKAN CURSOR
            MOV     AH, 01H         ;MASUKAN FUNGSI KURSOR
            INT     10h             ;PANGGIL ROM BIOS VIDEO SERVICE
        RET                         ;RETURN

        ;FUNGSI NYALAKAN CURSOR
        CURS_ON:
            MOV     CX, 0506h       ;SET BIT UNTUK NYALAKAN CURSOR
            MOV     AH, 01H         ;MASUKAN FUNGSI KURSOR
            INT     10H             ;PANGGIL ROM BIOS VIDEO SERVICE
        RET                         ;RETURN
        
        EXIT1:
        JMP EXIT
        
        ;GENERATE SOUND
        SOUNDER:
            MOV     AL, 0B6H        ;LOAD CONTROL
            OUT     43H, Al         ;SEND
            MOV     AX, STOR        ;MASUKAN FREKUENSI KE AX
            OUT     42H, AL         ;SEND LSB
            MOV     AL, AH          ;MOVE MSB KE AL
            OUT     42H, AL         ;SEND MSB
            IN      AL, 061H        ;DAPATKAN STATE PORT 61H
            OR      AL, 03H         ;NYALAKAN SPEAKER
            OUT     61H, AL         ;SPEAKER MENYALA
            CALL    DELAY           ;DELAY
            AND     AL, 0FCH        ;MATIKAN SPEAKER
            OUT     61H, AL         ;SPEAKER MATI
            CALL    CLR_KEYB        ;PANGGIL FUNGSI CLEAR KEYBOARD
        RET                         ;RETURN

        ;DELAY NADA
        DELAY:
            MOV     AH, 00H         ;FUNGSI 0H - DAPATKAN SYSTEM TIMER
            INT     01AH            ;PANGIL ROM BIOS TIME-OF-DAY SERVICES
            ADD     DX, 4           ;MASUKAN NILAI DELAY
            MOV     BX, DX          ;STORE HASILNYA KE BX

        PZ:
            INT     01AH            ;PANGGIL ROM BIOS TIME-OF-DAY SERVICES
            CMP     DX, BX          ;COMPARE DENGAN BX, APAKAH SUDAH SELESAI DELAY ?
            JL      PZ              ;JIKA BELUM LOOPING
        RET                         ;RETURN

        ;CLEAR KEYBOARD BUFFER
        CLR_KEYB:
            PUSH    ES                      ;SIMPAN ES
            PUSH    DI                      ;SIMPAN DI
            MOV     AX, 40H                 ;BIOS SEGMEN DIDALAM AX
            MOV     ES, AX                  ;TRANSFER KE ES
            MOV     AX, 1AH                 ;KEYBOARD POINTER DIDALAM AX
            MOV     DI, AX                  ;MASUKAN KE DI
            MOV     AX, 1EH                 ;KEYBOARD BUFFER MULAI DARI AX
            MOV     ES: WORD PTR [DI], AX   ;PINDAHKAN KE HEAD POINTER
            INC     DI                      ;PINDAHKAN POINTER KE KEYBOARD TAIL POINTER
            INC     DI                      
            MOV     ES: WORD PTR [DI], AX   ;PINDAHKAN KE TAIL POINTER
            POP     DI                      ;RESTORE DI
            POP     ES                      ;RESTORE ES
        RET                                 ;RETURN
       
        ;PROGRAM TERMINATE
        EXIT:
        
        CALL    CURS_ON         ;NYALAKAN KURSOR
        ;INT     20h             ;KELUAR KE DOS 
        
    .EXIT                
END
