
_main:

;nono_pic.c,15 :: 		void main() {
;nono_pic.c,17 :: 		int t=0;
	CLRF       main_t_L0+0
	CLRF       main_t_L0+1
;nono_pic.c,18 :: 		int count=0;
	CLRF       main_count_L0+0
	CLRF       main_count_L0+1
;nono_pic.c,20 :: 		char D[9]={0};
	CLRF       main_D_L0+0
	CLRF       main_D_L0+1
	CLRF       main_D_L0+2
	CLRF       main_D_L0+3
	CLRF       main_D_L0+4
	CLRF       main_D_L0+5
	CLRF       main_D_L0+6
	CLRF       main_D_L0+7
	CLRF       main_D_L0+8
;nono_pic.c,21 :: 		trisd=0;
	CLRF       TRISD+0
;nono_pic.c,22 :: 		portd=0;
	CLRF       PORTD+0
;nono_pic.c,23 :: 		trisb4_bit=0;
	BCF        TRISB4_bit+0, 4
;nono_pic.c,24 :: 		trisb5_bit=0;
	BCF        TRISB5_bit+0, 5
;nono_pic.c,25 :: 		trisb7_bit=1;
	BSF        TRISB7_bit+0, 7
;nono_pic.c,26 :: 		portb=0;
	CLRF       PORTB+0
;nono_pic.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;nono_pic.c,28 :: 		UART1_Init(2400);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;nono_pic.c,29 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;nono_pic.c,30 :: 		for(;portb.f7==0;)
L_main1:
	BTFSC      PORTB+0, 7
	GOTO       L_main2
;nono_pic.c,31 :: 		{Lcd_Out(1, 3, "Hello!");}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_nono_pic+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main1
L_main2:
;nono_pic.c,33 :: 		{for(;portb.f7==1;)
L_main4:
	BTFSS      PORTB+0, 7
	GOTO       L_main5
;nono_pic.c,36 :: 		{ portb.f4=1;
	BSF        PORTB+0, 4
;nono_pic.c,37 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;nono_pic.c,39 :: 		for(j=0;j<9&&UART1_Data_Ready() == 1;j++)
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main7:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      9
	SUBWF      main_j_L0+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main8
L__main12:
;nono_pic.c,40 :: 		{portb.f5=1;
	BSF        PORTB+0, 5
;nono_pic.c,41 :: 		portd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;nono_pic.c,42 :: 		Lcd_Chr(2, 3, portd);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       PORTD+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;nono_pic.c,39 :: 		for(j=0;j<9&&UART1_Data_Ready() == 1;j++)
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;nono_pic.c,45 :: 		}
	GOTO       L_main7
L_main8:
;nono_pic.c,46 :: 		portb.f5=0;
	BCF        PORTB+0, 5
;nono_pic.c,47 :: 		}
	GOTO       L_main4
L_main5:
;nono_pic.c,48 :: 		}      }
	GOTO       $+0
; end of _main
