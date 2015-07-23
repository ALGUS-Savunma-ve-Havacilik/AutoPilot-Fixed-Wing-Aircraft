
_main:

;cu_pc.c,15 :: 		void main() {unsigned char D[9];
;cu_pc.c,17 :: 		int receive_data=0;
	CLRF       main_receive_data_L0+0
	CLRF       main_receive_data_L0+1
;cu_pc.c,18 :: 		int sure= 0;
;cu_pc.c,19 :: 		int start= 0;
	CLRF       main_start_L0+0
	CLRF       main_start_L0+1
;cu_pc.c,20 :: 		int time_m= 1;
	MOVLW      1
	MOVWF      main_time_m_L0+0
	MOVLW      0
	MOVWF      main_time_m_L0+1
;cu_pc.c,21 :: 		int time_s= 0;
	CLRF       main_time_s_L0+0
	CLRF       main_time_s_L0+1
;cu_pc.c,22 :: 		int f=1;
	MOVLW      1
	MOVWF      main_f_L0+0
	MOVLW      0
	MOVWF      main_f_L0+1
;cu_pc.c,24 :: 		trisd=0;
	CLRF       TRISD+0
;cu_pc.c,25 :: 		portd=0;
	CLRF       PORTD+0
;cu_pc.c,26 :: 		trisc0_bit=1;
	BSF        TRISC0_bit+0, 0
;cu_pc.c,27 :: 		trisc1_bit=1;
	BSF        TRISC1_bit+0, 1
;cu_pc.c,28 :: 		trisb=255;
	MOVLW      255
	MOVWF      TRISB+0
;cu_pc.c,31 :: 		UART1_Init(2400);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;cu_pc.c,32 :: 		Delay_ms(100);
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
;cu_pc.c,33 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;cu_pc.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;cu_pc.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;cu_pc.c,36 :: 		for(;portc.f0==0;)
L_main1:
	BTFSC      PORTC+0, 0
	GOTO       L_main2
;cu_pc.c,37 :: 		{Lcd_Out(2,3,"Be ReadY :P ");}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_cu_pc+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main1
L_main2:
;cu_pc.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;cu_pc.c,39 :: 		if(portc.f0 ==1)
	BTFSS      PORTC+0, 0
	GOTO       L_main4
;cu_pc.c,41 :: 		portd.f6=1;start=1;
	BSF        PORTD+0, 6
	MOVLW      1
	MOVWF      main_start_L0+0
	MOVLW      0
	MOVWF      main_start_L0+1
;cu_pc.c,42 :: 		}
L_main4:
;cu_pc.c,43 :: 		if (start==1)
	MOVLW      0
	XORWF      main_start_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      1
	XORWF      main_start_L0+0, 0
L__main21:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;cu_pc.c,45 :: 		for( ; time_m!=0||time_s!=0;)
L_main6:
	MOVLW      0
	XORWF      main_time_m_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      0
	XORWF      main_time_m_L0+0, 0
L__main22:
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      0
	XORWF      main_time_s_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      0
	XORWF      main_time_s_L0+0, 0
L__main23:
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	GOTO       L_main7
L__main20:
;cu_pc.c,47 :: 		if(time_s==0)
	MOVLW      0
	XORWF      main_time_s_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      0
	XORWF      main_time_s_L0+0, 0
L__main24:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;cu_pc.c,51 :: 		time_m--;time_s=60;
	MOVLW      1
	SUBWF      main_time_m_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_time_m_L0+1, 1
	MOVLW      60
	MOVWF      main_time_s_L0+0
	MOVLW      0
	MOVWF      main_time_s_L0+1
;cu_pc.c,52 :: 		}
L_main11:
;cu_pc.c,53 :: 		time_s--;
	MOVLW      1
	SUBWF      main_time_s_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_time_s_L0+1, 1
;cu_pc.c,54 :: 		m[0]=(time_m/10)+48; m[1]=(time_m%10)+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_time_m_L0+0, 0
	MOVWF      R0+0
	MOVF       main_time_m_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      main_m_L0+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_time_m_L0+0, 0
	MOVWF      R0+0
	MOVF       main_time_m_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      main_m_L0+1
;cu_pc.c,55 :: 		s[0]=(time_s/10)+48; s[1]=(time_s%10)+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_time_s_L0+0, 0
	MOVWF      R0+0
	MOVF       main_time_s_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      main_s_L0+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_time_s_L0+0, 0
	MOVWF      R0+0
	MOVF       main_time_s_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      main_s_L0+1
;cu_pc.c,56 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;cu_pc.c,57 :: 		Lcd_Chr(1,1, m[0]); Lcd_Chr(1,2, m[1]);Lcd_Out(1,3,":");Lcd_Chr(1,4, s[0]);  Lcd_Chr(1,5, s[1]);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_m_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_m_L0+1, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_cu_pc+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_s_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_s_L0+1, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;cu_pc.c,58 :: 		}
	GOTO       L_main6
L_main7:
;cu_pc.c,59 :: 		}
L_main5:
;cu_pc.c,60 :: 		start=0;
	CLRF       main_start_L0+0
	CLRF       main_start_L0+1
;cu_pc.c,61 :: 		portd.f6=0;
	BCF        PORTD+0, 6
;cu_pc.c,62 :: 		portd.f7=1;
	BSF        PORTD+0, 7
;cu_pc.c,64 :: 		for (;;)
L_main13:
;cu_pc.c,66 :: 		for(j=0;portc.f1==1;j++)
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main16:
	BTFSS      PORTC+0, 1
	GOTO       L_main17
;cu_pc.c,68 :: 		if(j!=0)
	MOVLW      0
	XORWF      main_j_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      0
	XORWF      main_j_L0+0, 0
L__main25:
	BTFSC      STATUS+0, 2
	GOTO       L_main19
;cu_pc.c,69 :: 		{ UART1_Write(portb+48);
	MOVLW      48
	ADDWF      PORTB+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;cu_pc.c,70 :: 		Lcd_Chr(2,j+1,portb+48); }
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       main_j_L0+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      PORTB+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_main19:
;cu_pc.c,66 :: 		for(j=0;portc.f1==1;j++)
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;cu_pc.c,72 :: 		}
	GOTO       L_main16
L_main17:
;cu_pc.c,73 :: 		}
	GOTO       L_main13
;cu_pc.c,74 :: 		}
	GOTO       $+0
; end of _main
