
_interrupt:

;gps.c,28 :: 		interrupt()
;gps.c,30 :: 		rr = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _rr+0 
;gps.c,31 :: 		switch(rr)
	GOTO        L_interrupt0
;gps.c,33 :: 		case '$':
L_interrupt2:
;gps.c,35 :: 		v=1;
	MOVLW       1
	MOVWF       _v+0 
;gps.c,36 :: 		i=0;
	CLRF        _i+0 
	CLRF        _i+1 
;gps.c,37 :: 		break;
	GOTO        L_interrupt1
;gps.c,40 :: 		case 'G':
L_interrupt3:
;gps.c,42 :: 		if(v<6)
	MOVLW       6
	SUBWF       _v+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt4
;gps.c,44 :: 		v++;
	INCF        _v+0, 1 
;gps.c,45 :: 		break;
	GOTO        L_interrupt1
;gps.c,46 :: 		}
L_interrupt4:
;gps.c,48 :: 		case 'P':
L_interrupt5:
;gps.c,50 :: 		if(v==2)
	MOVF        _v+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt6
;gps.c,51 :: 		v=3;
	MOVLW       3
	MOVWF       _v+0 
L_interrupt6:
;gps.c,52 :: 		break;
	GOTO        L_interrupt1
;gps.c,55 :: 		case 'A':
L_interrupt7:
;gps.c,57 :: 		if(v==5)
	MOVF        _v+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt8
;gps.c,58 :: 		v=6;
	MOVLW       6
	MOVWF       _v+0 
L_interrupt8:
;gps.c,59 :: 		break;
	GOTO        L_interrupt1
;gps.c,61 :: 		}
L_interrupt0:
	MOVF        _rr+0, 0 
	XORLW       36
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt2
	MOVF        _rr+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt3
	MOVF        _rr+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt5
	MOVF        _rr+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt7
L_interrupt1:
;gps.c,62 :: 		if (v==6){
	MOVF        _v+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt9
;gps.c,63 :: 		i++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;gps.c,64 :: 		rec[i] = rr;
	MOVLW       _rec+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_rec+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	MOVF        _rr+0, 0 
	MOVWF       POSTINC1+0 
;gps.c,65 :: 		}
L_interrupt9:
;gps.c,67 :: 		}
L__interrupt20:
	RETFIE      1
; end of _interrupt

_main:

;gps.c,68 :: 		void main() {
;gps.c,69 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;gps.c,70 :: 		INTCON=0b11000000;
	MOVLW       192
	MOVWF       INTCON+0 
;gps.c,71 :: 		PIE1=0b00100000;
	MOVLW       32
	MOVWF       PIE1+0 
;gps.c,72 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;gps.c,73 :: 		Delay_ms(300);                  // Wait for UART module to stabilize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 0
	BRA         L_main10
	DECFSZ      R12, 1, 0
	BRA         L_main10
	DECFSZ      R11, 1, 0
	BRA         L_main10
;gps.c,74 :: 		trisc=0b10000000;
	MOVLW       128
	MOVWF       TRISC+0 
;gps.c,75 :: 		trisd=0;
	CLRF        TRISD+0 
;gps.c,76 :: 		portc=255;
	MOVLW       255
	MOVWF       PORTC+0 
;gps.c,77 :: 		portc.f0=0;
	BCF         PORTC+0, 0 
;gps.c,78 :: 		uart1_write_text("ready");
	MOVLW       ?lstr1_gps+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_gps+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gps.c,79 :: 		for(;;){
L_main11:
;gps.c,80 :: 		lcd_chr(1,1,rec[14]);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _rec+14, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;gps.c,81 :: 		for (co=15;co<23;co++){
	MOVLW       15
	MOVWF       _co+0 
	MOVLW       0
	MOVWF       _co+1 
L_main14:
	MOVLW       128
	XORWF       _co+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       23
	SUBWF       _co+0, 0 
L__main21:
	BTFSC       STATUS+0, 0 
	GOTO        L_main15
;gps.c,82 :: 		lcd_chr_cp(rec[co]);
	MOVLW       _rec+0
	ADDWF       _co+0, 0 
	MOVWF       FSR0L 
	MOVLW       hi_addr(_rec+0)
	ADDWFC      _co+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;gps.c,81 :: 		for (co=15;co<23;co++){
	INFSNZ      _co+0, 1 
	INCF        _co+1, 1 
;gps.c,83 :: 		}
	GOTO        L_main14
L_main15:
;gps.c,85 :: 		lcd_chr(2,1,rec[26]);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _rec+26, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;gps.c,86 :: 		for (co=27;co<36;co++){
	MOVLW       27
	MOVWF       _co+0 
	MOVLW       0
	MOVWF       _co+1 
L_main17:
	MOVLW       128
	XORWF       _co+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVLW       36
	SUBWF       _co+0, 0 
L__main22:
	BTFSC       STATUS+0, 0 
	GOTO        L_main18
;gps.c,87 :: 		lcd_chr_cp(rec[co]);
	MOVLW       _rec+0
	ADDWF       _co+0, 0 
	MOVWF       FSR0L 
	MOVLW       hi_addr(_rec+0)
	ADDWFC      _co+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;gps.c,86 :: 		for (co=27;co<36;co++){
	INFSNZ      _co+0, 1 
	INCF        _co+1, 1 
;gps.c,88 :: 		}
	GOTO        L_main17
L_main18:
;gps.c,91 :: 		}}
	GOTO        L_main11
	GOTO        $+0
; end of _main
