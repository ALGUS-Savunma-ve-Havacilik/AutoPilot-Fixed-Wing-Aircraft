
_interrupt:

;zigbee.c,22 :: 		interrupt()
;zigbee.c,24 :: 		rr = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _rr+0 
;zigbee.c,25 :: 		switch(rr)
	GOTO        L_interrupt0
;zigbee.c,27 :: 		case 'k':
L_interrupt2:
;zigbee.c,29 :: 		for(i=0;i<20;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_interrupt3:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt26
	MOVLW       20
	SUBWF       _i+0, 0 
L__interrupt26:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt4
;zigbee.c,31 :: 		s1=1;s2=1;s3=1;br1=1;
	BSF         RD5_bit+0, 5 
	BSF         RD6_bit+0, 6 
	BSF         RD7_bit+0, 7 
	BSF         RD0_bit+0, 0 
;zigbee.c,32 :: 		delay_us(1500);
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt6:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt6
	DECFSZ      R12, 1, 0
	BRA         L_interrupt6
	NOP
	NOP
;zigbee.c,33 :: 		s1=0;s2=0;s3=0;br1=0;
	BCF         RD5_bit+0, 5 
	BCF         RD6_bit+0, 6 
	BCF         RD7_bit+0, 7 
	BCF         RD0_bit+0, 0 
;zigbee.c,34 :: 		delay_us(18500);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_interrupt7:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt7
	DECFSZ      R12, 1, 0
	BRA         L_interrupt7
;zigbee.c,29 :: 		for(i=0;i<20;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;zigbee.c,35 :: 		}
	GOTO        L_interrupt3
L_interrupt4:
;zigbee.c,36 :: 		break;
	GOTO        L_interrupt1
;zigbee.c,39 :: 		case 'x':
L_interrupt8:
;zigbee.c,41 :: 		for(i=0;i<20;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_interrupt9:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt27
	MOVLW       20
	SUBWF       _i+0, 0 
L__interrupt27:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt10
;zigbee.c,43 :: 		s1=1;s2=1;s3=1;br1=1;
	BSF         RD5_bit+0, 5 
	BSF         RD6_bit+0, 6 
	BSF         RD7_bit+0, 7 
	BSF         RD0_bit+0, 0 
;zigbee.c,44 :: 		delay_us(2350);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_interrupt12:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt12
	DECFSZ      R12, 1, 0
	BRA         L_interrupt12
	NOP
	NOP
;zigbee.c,45 :: 		s1=0;s2=0;s3=0;br1=0;
	BCF         RD5_bit+0, 5 
	BCF         RD6_bit+0, 6 
	BCF         RD7_bit+0, 7 
	BCF         RD0_bit+0, 0 
;zigbee.c,46 :: 		delay_us(17650);
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_interrupt13:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt13
	DECFSZ      R12, 1, 0
	BRA         L_interrupt13
;zigbee.c,41 :: 		for(i=0;i<20;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;zigbee.c,47 :: 		}
	GOTO        L_interrupt9
L_interrupt10:
;zigbee.c,49 :: 		break;
	GOTO        L_interrupt1
;zigbee.c,51 :: 		case 'o':
L_interrupt14:
;zigbee.c,53 :: 		for(i=0;i<20;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_interrupt15:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt28
	MOVLW       20
	SUBWF       _i+0, 0 
L__interrupt28:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt16
;zigbee.c,55 :: 		s1=1;s2=1;s3=1;br1=1;
	BSF         RD5_bit+0, 5 
	BSF         RD6_bit+0, 6 
	BSF         RD7_bit+0, 7 
	BSF         RD0_bit+0, 0 
;zigbee.c,56 :: 		delay_us(650);
	MOVLW       216
	MOVWF       R13, 0
L_interrupt18:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt18
	NOP
;zigbee.c,57 :: 		s1=0;s2=0;s3=0;br1=0;
	BCF         RD5_bit+0, 5 
	BCF         RD6_bit+0, 6 
	BCF         RD7_bit+0, 7 
	BCF         RD0_bit+0, 0 
;zigbee.c,58 :: 		delay_us(19350);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       31
	MOVWF       R13, 0
L_interrupt19:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt19
	DECFSZ      R12, 1, 0
	BRA         L_interrupt19
	NOP
	NOP
;zigbee.c,53 :: 		for(i=0;i<20;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;zigbee.c,59 :: 		}
	GOTO        L_interrupt15
L_interrupt16:
;zigbee.c,61 :: 		break;
	GOTO        L_interrupt1
;zigbee.c,62 :: 		}  }
L_interrupt0:
	MOVF        _rr+0, 0 
	XORLW       107
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt2
	MOVF        _rr+0, 0 
	XORLW       120
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt8
	MOVF        _rr+0, 0 
	XORLW       111
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt14
L_interrupt1:
;zigbee.c,63 :: 		x=1;
	MOVLW       1
	MOVWF       _x+0 
	MOVLW       0
	MOVWF       _x+1 
;zigbee.c,64 :: 		}
L__interrupt25:
	RETFIE      1
; end of _interrupt

_main:

;zigbee.c,65 :: 		void main() {
;zigbee.c,66 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;zigbee.c,67 :: 		INTCON=0b11000000;
	MOVLW       192
	MOVWF       INTCON+0 
;zigbee.c,68 :: 		PIE1=0b00100000;
	MOVLW       32
	MOVWF       PIE1+0 
;zigbee.c,69 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;zigbee.c,70 :: 		Delay_ms(300);                  // Wait for UART module to stabilize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 0
	BRA         L_main20
	DECFSZ      R12, 1, 0
	BRA         L_main20
	DECFSZ      R11, 1, 0
	BRA         L_main20
;zigbee.c,71 :: 		trisc=0b10000000;
	MOVLW       128
	MOVWF       TRISC+0 
;zigbee.c,72 :: 		portc=255;
	MOVLW       255
	MOVWF       PORTC+0 
;zigbee.c,73 :: 		portc.f1=0;
	BCF         PORTC+0, 1 
;zigbee.c,74 :: 		portc.f2=0;
	BCF         PORTC+0, 2 
;zigbee.c,75 :: 		trisd=0;
	CLRF        TRISD+0 
;zigbee.c,77 :: 		uart1_write_text("ready");
	MOVLW       ?lstr1_zigbee+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_zigbee+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;zigbee.c,78 :: 		for(;;){
L_main21:
;zigbee.c,80 :: 		if(x==1)
	MOVLW       0
	XORWF       _x+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main29
	MOVLW       1
	XORWF       _x+0, 0 
L__main29:
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;zigbee.c,82 :: 		Lcd_Chr_Cp(rr);
	MOVF        _rr+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;zigbee.c,83 :: 		x=0;
	CLRF        _x+0 
	CLRF        _x+1 
;zigbee.c,84 :: 		}
L_main24:
;zigbee.c,87 :: 		}}
	GOTO        L_main21
	GOTO        $+0
; end of _main
