
_main:

;1.c,20 :: 		void main() {
;1.c,22 :: 		lcd_init();
	CALL       _Lcd_Init+0
;1.c,23 :: 		lcd_out(1,1,"hello");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;1.c,24 :: 		portd=0;
	CLRF       PORTD+0
;1.c,25 :: 		trisd=0;
	CLRF       TRISD+0
;1.c,26 :: 		for(;;)
L_main0:
;1.c,28 :: 		for(i=0;i<200;i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main3:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      200
	SUBWF      main_i_L0+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;1.c,30 :: 		s1=1;s2=1;s3=1;br1=1;
	BSF        RD5_bit+0, 5
	BSF        RD6_bit+0, 6
	BSF        RD7_bit+0, 7
	BSF        RD0_bit+0, 0
;1.c,31 :: 		delay_us(1500);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;1.c,32 :: 		s1=0;s2=0;s3=0;br1=0;
	BCF        RD5_bit+0, 5
	BCF        RD6_bit+0, 6
	BCF        RD7_bit+0, 7
	BCF        RD0_bit+0, 0
;1.c,33 :: 		delay_us(18500);
	MOVLW      49
	MOVWF      R12+0
	MOVLW      11
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;1.c,28 :: 		for(i=0;i<200;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;1.c,34 :: 		}
	GOTO       L_main3
L_main4:
;1.c,35 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;1.c,36 :: 		for(i=0;i<200;i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main9:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      200
	SUBWF      main_i_L0+0, 0
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;1.c,38 :: 		s1=1;s2=1;s3=1;br1=1;
	BSF        RD5_bit+0, 5
	BSF        RD6_bit+0, 6
	BSF        RD7_bit+0, 7
	BSF        RD0_bit+0, 0
;1.c,39 :: 		delay_us(2000);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
;1.c,40 :: 		s1=0;s2=0;s3=0;br1=0;
	BCF        RD5_bit+0, 5
	BCF        RD6_bit+0, 6
	BCF        RD7_bit+0, 7
	BCF        RD0_bit+0, 0
;1.c,41 :: 		delay_us(18000);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      191
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
	NOP
;1.c,36 :: 		for(i=0;i<200;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;1.c,42 :: 		}
	GOTO       L_main9
L_main10:
;1.c,43 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;1.c,44 :: 		for(i=0;i<200;i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main15:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      200
	SUBWF      main_i_L0+0, 0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
;1.c,46 :: 		s1=1;s2=1;s3=1;br1=1;
	BSF        RD5_bit+0, 5
	BSF        RD6_bit+0, 6
	BSF        RD7_bit+0, 7
	BSF        RD0_bit+0, 0
;1.c,47 :: 		delay_us(1000);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
	NOP
;1.c,48 :: 		s1=0;s2=0;s3=0;br1=0;
	BCF        RD5_bit+0, 5
	BCF        RD6_bit+0, 6
	BCF        RD7_bit+0, 7
	BCF        RD0_bit+0, 0
;1.c,49 :: 		delay_us(19000);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      88
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	NOP
;1.c,44 :: 		for(i=0;i<200;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;1.c,50 :: 		}
	GOTO       L_main15
L_main16:
;1.c,51 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;1.c,53 :: 		}
	GOTO       L_main0
;1.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
