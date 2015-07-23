
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;1.c,23 :: 		interrupt()
;1.c,25 :: 		rr = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _rr+0
	CLRF       _rr+1
;1.c,26 :: 		switch(rr)
	GOTO       L_interrupt0
;1.c,28 :: 		case '$':
L_interrupt2:
;1.c,31 :: 		v=1;
	MOVLW      1
	MOVWF      _v+0
;1.c,32 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;1.c,33 :: 		break;
	GOTO       L_interrupt1
;1.c,36 :: 		case 'G':
L_interrupt3:
;1.c,38 :: 		if(v<6)
	MOVLW      6
	SUBWF      _v+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt4
;1.c,40 :: 		v++;
	INCF       _v+0, 1
;1.c,41 :: 		break;
	GOTO       L_interrupt1
;1.c,42 :: 		}
L_interrupt4:
;1.c,44 :: 		case 'P':
L_interrupt5:
;1.c,46 :: 		if(v==2)
	MOVF       _v+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt6
;1.c,47 :: 		v=3;
	MOVLW      3
	MOVWF      _v+0
L_interrupt6:
;1.c,48 :: 		break;
	GOTO       L_interrupt1
;1.c,51 :: 		case 'A':
L_interrupt7:
;1.c,53 :: 		if(v==5)
	MOVF       _v+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt8
;1.c,54 :: 		v=6;
	MOVLW      6
	MOVWF      _v+0
L_interrupt8:
;1.c,55 :: 		break;
	GOTO       L_interrupt1
;1.c,57 :: 		case ',':
L_interrupt9:
;1.c,59 :: 		if(v==6&&GP<8)
	MOVF       _v+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt12
	MOVLW      8
	SUBWF      _GP+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt12
L__interrupt24:
;1.c,60 :: 		GP++;
	INCF       _GP+0, 1
L_interrupt12:
;1.c,61 :: 		break;
	GOTO       L_interrupt1
;1.c,63 :: 		}
L_interrupt0:
	MOVLW      0
	XORWF      _rr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt26
	MOVLW      36
	XORWF      _rr+0, 0
L__interrupt26:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt2
	MOVLW      0
	XORWF      _rr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt27
	MOVLW      71
	XORWF      _rr+0, 0
L__interrupt27:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt3
	MOVLW      0
	XORWF      _rr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt28
	MOVLW      80
	XORWF      _rr+0, 0
L__interrupt28:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt5
	MOVLW      0
	XORWF      _rr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt29
	MOVLW      65
	XORWF      _rr+0, 0
L__interrupt29:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt7
	MOVLW      0
	XORWF      _rr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt30
	MOVLW      44
	XORWF      _rr+0, 0
L__interrupt30:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt9
L_interrupt1:
;1.c,64 :: 		if (v==6){
	MOVF       _v+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt13
;1.c,65 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;1.c,66 :: 		rec[i] = rr;
	MOVF       _i+0, 0
	ADDLW      _rec+0
	MOVWF      FSR
	MOVF       _rr+0, 0
	MOVWF      INDF+0
;1.c,67 :: 		}
L_interrupt13:
;1.c,68 :: 		}
L__interrupt25:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;1.c,70 :: 		void main() {
;1.c,72 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;1.c,73 :: 		INTCON=0b11000000;
	MOVLW      192
	MOVWF      INTCON+0
;1.c,74 :: 		PIE1=0b00100100;
	MOVLW      36
	MOVWF      PIE1+0
;1.c,75 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;1.c,76 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
;1.c,77 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;1.c,78 :: 		trisc=0b10000000;
	MOVLW      128
	MOVWF      TRISC+0
;1.c,79 :: 		portc=255;
	MOVLW      255
	MOVWF      PORTC+0
;1.c,82 :: 		portc.f2=0;
	BCF        PORTC+0, 2
;1.c,83 :: 		for(;;){
L_main15:
;1.c,84 :: 		lcd_chr(1,1,rec[14]);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _rec+14, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;1.c,85 :: 		for (r=15;r<23;r++){
	MOVLW      15
	MOVWF      main_r_L0+0
L_main18:
	MOVLW      23
	SUBWF      main_r_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main19
;1.c,86 :: 		lcd_chr_cp(rec[r]);
	MOVF       main_r_L0+0, 0
	ADDLW      _rec+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;1.c,85 :: 		for (r=15;r<23;r++){
	INCF       main_r_L0+0, 1
;1.c,87 :: 		}
	GOTO       L_main18
L_main19:
;1.c,89 :: 		lcd_chr(2,1,rec[26]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _rec+26, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;1.c,90 :: 		for (r=27;r<36;r++){
	MOVLW      27
	MOVWF      main_r_L0+0
L_main21:
	MOVLW      36
	SUBWF      main_r_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main22
;1.c,91 :: 		lcd_chr_cp(rec[r]);
	MOVF       main_r_L0+0, 0
	ADDLW      _rec+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;1.c,90 :: 		for (r=27;r<36;r++){
	INCF       main_r_L0+0, 1
;1.c,92 :: 		}
	GOTO       L_main21
L_main22:
;1.c,93 :: 		}
	GOTO       L_main15
;1.c,94 :: 		}
	GOTO       $+0
; end of _main
