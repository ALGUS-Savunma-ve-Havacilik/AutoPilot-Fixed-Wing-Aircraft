
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;first_stage_in_MCQ_parallel_finish.c,17 :: 		void interrupt()
;first_stage_in_MCQ_parallel_finish.c,20 :: 		count =count+1;
	INCF       _count+0, 1
;first_stage_in_MCQ_parallel_finish.c,21 :: 		intcon=0b10010000;
	MOVLW      144
	MOVWF      INTCON+0
;first_stage_in_MCQ_parallel_finish.c,22 :: 		}
L__interrupt177:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;first_stage_in_MCQ_parallel_finish.c,24 :: 		void main()
;first_stage_in_MCQ_parallel_finish.c,25 :: 		{ unsigned short old=0;
	CLRF       main_old_L0+0
;first_stage_in_MCQ_parallel_finish.c,26 :: 		unsigned short n=0;
	CLRF       main_n_L0+0
;first_stage_in_MCQ_parallel_finish.c,27 :: 		unsigned short q=0;
	CLRF       main_q_L0+0
;first_stage_in_MCQ_parallel_finish.c,28 :: 		int i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;first_stage_in_MCQ_parallel_finish.c,29 :: 		int w=0;
	CLRF       main_w_L0+0
	CLRF       main_w_L0+1
;first_stage_in_MCQ_parallel_finish.c,30 :: 		int t=0;
	CLRF       main_t_L0+0
	CLRF       main_t_L0+1
;first_stage_in_MCQ_parallel_finish.c,31 :: 		int z=0;
	CLRF       main_z_L0+0
	CLRF       main_z_L0+1
;first_stage_in_MCQ_parallel_finish.c,32 :: 		int k=0;
	CLRF       main_k_L0+0
	CLRF       main_k_L0+1
;first_stage_in_MCQ_parallel_finish.c,33 :: 		int f=0;
	CLRF       main_f_L0+0
	CLRF       main_f_L0+1
;first_stage_in_MCQ_parallel_finish.c,34 :: 		trisc0_bit=1;
	BSF        TRISC0_bit+0, 0
;first_stage_in_MCQ_parallel_finish.c,36 :: 		trisb0_bit=1;
	BSF        TRISB0_bit+0, 0
;first_stage_in_MCQ_parallel_finish.c,37 :: 		intcon=0b10010000;
	MOVLW      144
	MOVWF      INTCON+0
;first_stage_in_MCQ_parallel_finish.c,38 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;first_stage_in_MCQ_parallel_finish.c,39 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;first_stage_in_MCQ_parallel_finish.c,40 :: 		UART1_Init(2400);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;first_stage_in_MCQ_parallel_finish.c,41 :: 		Delay_ms(100);
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
;first_stage_in_MCQ_parallel_finish.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;first_stage_in_MCQ_parallel_finish.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;first_stage_in_MCQ_parallel_finish.c,45 :: 		for(;portc.f0==0;) { Lcd_Out(2,6, " :P ");}
L_main1:
	BTFSC      PORTC+0, 0
	GOTO       L_main2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_first_stage_in_MCQ_parallel_finish+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main1
L_main2:
;first_stage_in_MCQ_parallel_finish.c,46 :: 		for(;;)
L_main4:
;first_stage_in_MCQ_parallel_finish.c,48 :: 		for(i=0;i<17&&portc.f0==1;)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main7:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main178
	MOVLW      17
	SUBWF      main_i_L0+0, 0
L__main178:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
	BTFSS      PORTC+0, 0
	GOTO       L_main8
L__main176:
;first_stage_in_MCQ_parallel_finish.c,50 :: 		if(i==0)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main179
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main179:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;first_stage_in_MCQ_parallel_finish.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;first_stage_in_MCQ_parallel_finish.c,53 :: 		Lcd_Out(1, 1, "BN.:to");  Lcd_Chr(1, 5, student[i]+47);Lcd_Chr(1, 6, student[i+1]+47);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_first_stage_in_MCQ_parallel_finish+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;first_stage_in_MCQ_parallel_finish.c,54 :: 		Lcd_Out(2, 1, "entr tns&ons");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_first_stage_in_MCQ_parallel_finish+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;first_stage_in_MCQ_parallel_finish.c,55 :: 		}
L_main12:
;first_stage_in_MCQ_parallel_finish.c,56 :: 		for(;(i==0||i==1||i==2)&&portc.f0==1;i++)
L_main13:
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main180
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main180:
	BTFSC      STATUS+0, 2
	GOTO       L__main175
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main181
	MOVLW      1
	XORWF      main_i_L0+0, 0
L__main181:
	BTFSC      STATUS+0, 2
	GOTO       L__main175
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main182
	MOVLW      2
	XORWF      main_i_L0+0, 0
L__main182:
	BTFSC      STATUS+0, 2
	GOTO       L__main175
	GOTO       L_main14
L__main175:
	BTFSS      PORTC+0, 0
	GOTO       L_main14
L__main174:
;first_stage_in_MCQ_parallel_finish.c,58 :: 		old=student[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      main_old_L0+0
;first_stage_in_MCQ_parallel_finish.c,59 :: 		for(;(student[i]==0||flag[i]==1)&&portc.f0==1;){student[i] = Keypad_Key_Click();flag[i]=0;}
L_main20:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main173
	MOVF       main_i_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main173
	GOTO       L_main21
L__main173:
	BTFSS      PORTC+0, 0
	GOTO       L_main21
L__main172:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FLOC__main+0
	CALL       _Keypad_Key_Click+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       main_i_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	CLRF       INDF+0
	GOTO       L_main20
L_main21:
;first_stage_in_MCQ_parallel_finish.c,60 :: 		if(student[i]==0&&(i==0||i==1)){student[i]=old;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main31
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main183
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main183:
	BTFSC      STATUS+0, 2
	GOTO       L__main171
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main184
	MOVLW      1
	XORWF      main_i_L0+0, 0
L__main184:
	BTFSC      STATUS+0, 2
	GOTO       L__main171
	GOTO       L_main31
L__main171:
L__main170:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       main_old_L0+0, 0
	MOVWF      INDF+0
L_main31:
;first_stage_in_MCQ_parallel_finish.c,61 :: 		if(student[i]==15&&(i==0||i==1)){student[i]=old;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_main36
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main185
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main185:
	BTFSC      STATUS+0, 2
	GOTO       L__main169
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main186
	MOVLW      1
	XORWF      main_i_L0+0, 0
L__main186:
	BTFSC      STATUS+0, 2
	GOTO       L__main169
	GOTO       L_main36
L__main169:
L__main168:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       main_old_L0+0, 0
	MOVWF      INDF+0
L_main36:
;first_stage_in_MCQ_parallel_finish.c,62 :: 		if(student[i]!=15&&i==2){student[1]=0;student[0]=student[2];student[2]=0;i=0;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main39
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main187
	MOVLW      2
	XORWF      main_i_L0+0, 0
L__main187:
	BTFSS      STATUS+0, 2
	GOTO       L_main39
L__main167:
	CLRF       _student+1
	MOVF       _student+2, 0
	MOVWF      _student+0
	CLRF       _student+2
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main39:
;first_stage_in_MCQ_parallel_finish.c,63 :: 		if(i==0){Lcd_Chr(1, 5, student[i]+47);}
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main188
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main188:
	BTFSS      STATUS+0, 2
	GOTO       L_main40
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_main40:
;first_stage_in_MCQ_parallel_finish.c,64 :: 		if(i==1){Lcd_Chr(1, 6, student[i]+47);}
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main189
	MOVLW      1
	XORWF      main_i_L0+0, 0
L__main189:
	BTFSS      STATUS+0, 2
	GOTO       L_main41
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_main41:
;first_stage_in_MCQ_parallel_finish.c,56 :: 		for(;(i==0||i==1||i==2)&&portc.f0==1;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;first_stage_in_MCQ_parallel_finish.c,65 :: 		}
	GOTO       L_main13
L_main14:
;first_stage_in_MCQ_parallel_finish.c,67 :: 		if(i==3)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main190
	MOVLW      3
	XORWF      main_i_L0+0, 0
L__main190:
	BTFSS      STATUS+0, 2
	GOTO       L_main42
;first_stage_in_MCQ_parallel_finish.c,69 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;first_stage_in_MCQ_parallel_finish.c,70 :: 		Lcd_Out(1, 1, "sec:o "); Lcd_Chr(1, 5, student[i]+47);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_first_stage_in_MCQ_parallel_finish+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;first_stage_in_MCQ_parallel_finish.c,71 :: 		}
L_main42:
;first_stage_in_MCQ_parallel_finish.c,72 :: 		for(;(i==3||i==4)&&portc.f0==1;i++)
L_main43:
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main191
	MOVLW      3
	XORWF      main_i_L0+0, 0
L__main191:
	BTFSC      STATUS+0, 2
	GOTO       L__main166
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main192
	MOVLW      4
	XORWF      main_i_L0+0, 0
L__main192:
	BTFSC      STATUS+0, 2
	GOTO       L__main166
	GOTO       L_main44
L__main166:
	BTFSS      PORTC+0, 0
	GOTO       L_main44
L__main165:
;first_stage_in_MCQ_parallel_finish.c,74 :: 		old=student[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      main_old_L0+0
;first_stage_in_MCQ_parallel_finish.c,75 :: 		for(;(student[i]==0||flag[i]==1)&&portc.f0==1;)
L_main50:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main164
	MOVF       main_i_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main164
	GOTO       L_main51
L__main164:
	BTFSS      PORTC+0, 0
	GOTO       L_main51
L__main163:
;first_stage_in_MCQ_parallel_finish.c,76 :: 		{student[i] = Keypad_Key_Click();flag[i]=0;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FLOC__main+0
	CALL       _Keypad_Key_Click+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       main_i_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	CLRF       INDF+0
	GOTO       L_main50
L_main51:
;first_stage_in_MCQ_parallel_finish.c,77 :: 		if(student[i]==0&&(i==3)){student[i]=old;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main59
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main193
	MOVLW      3
	XORWF      main_i_L0+0, 0
L__main193:
	BTFSS      STATUS+0, 2
	GOTO       L_main59
L__main162:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       main_old_L0+0, 0
	MOVWF      INDF+0
L_main59:
;first_stage_in_MCQ_parallel_finish.c,78 :: 		if(student[i]==15&&i==3)
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_main62
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main194
	MOVLW      3
	XORWF      main_i_L0+0, 0
L__main194:
	BTFSS      STATUS+0, 2
	GOTO       L_main62
L__main161:
;first_stage_in_MCQ_parallel_finish.c,79 :: 		{student[i]=old;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       main_old_L0+0, 0
	MOVWF      INDF+0
L_main62:
;first_stage_in_MCQ_parallel_finish.c,80 :: 		if(student[i]!=15&&i==4)
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main65
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main195
	MOVLW      4
	XORWF      main_i_L0+0, 0
L__main195:
	BTFSS      STATUS+0, 2
	GOTO       L_main65
L__main160:
;first_stage_in_MCQ_parallel_finish.c,81 :: 		{student[i-1]=student[i];student[i]=0;i=3;}
	MOVLW      1
	SUBWF      main_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _student+0
	MOVWF      R1+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	CLRF       INDF+0
	MOVLW      3
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main65:
;first_stage_in_MCQ_parallel_finish.c,82 :: 		if(i==3)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main196
	MOVLW      3
	XORWF      main_i_L0+0, 0
L__main196:
	BTFSS      STATUS+0, 2
	GOTO       L_main66
;first_stage_in_MCQ_parallel_finish.c,83 :: 		{Lcd_Chr(1, 5, student[i]+47);}
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_main66:
;first_stage_in_MCQ_parallel_finish.c,72 :: 		for(;(i==3||i==4)&&portc.f0==1;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;first_stage_in_MCQ_parallel_finish.c,84 :: 		}
	GOTO       L_main43
L_main44:
;first_stage_in_MCQ_parallel_finish.c,85 :: 		if(i==5)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main197
	MOVLW      5
	XORWF      main_i_L0+0, 0
L__main197:
	BTFSS      STATUS+0, 2
	GOTO       L_main67
;first_stage_in_MCQ_parallel_finish.c,87 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;first_stage_in_MCQ_parallel_finish.c,88 :: 		Lcd_Out(1, 1, "model:");  Lcd_Chr(1, 7, student[i]+47);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_first_stage_in_MCQ_parallel_finish+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;first_stage_in_MCQ_parallel_finish.c,89 :: 		}
L_main67:
;first_stage_in_MCQ_parallel_finish.c,90 :: 		for(;(i==5||i==6)&&portc.f0==1;i++)
L_main68:
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main198
	MOVLW      5
	XORWF      main_i_L0+0, 0
L__main198:
	BTFSC      STATUS+0, 2
	GOTO       L__main159
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main199
	MOVLW      6
	XORWF      main_i_L0+0, 0
L__main199:
	BTFSC      STATUS+0, 2
	GOTO       L__main159
	GOTO       L_main69
L__main159:
	BTFSS      PORTC+0, 0
	GOTO       L_main69
L__main158:
;first_stage_in_MCQ_parallel_finish.c,92 :: 		old=student[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      main_old_L0+0
;first_stage_in_MCQ_parallel_finish.c,93 :: 		for(;(student[i]==0||flag[i]==1)&&portc.f0==1;){student[i] = Keypad_Key_Click();flag[i]=0;}
L_main75:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main157
	MOVF       main_i_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main157
	GOTO       L_main76
L__main157:
	BTFSS      PORTC+0, 0
	GOTO       L_main76
L__main156:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FLOC__main+0
	CALL       _Keypad_Key_Click+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       main_i_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	CLRF       INDF+0
	GOTO       L_main75
L_main76:
;first_stage_in_MCQ_parallel_finish.c,94 :: 		if(student[i]==0&&(i==5)){student[i]=old;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main84
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main200
	MOVLW      5
	XORWF      main_i_L0+0, 0
L__main200:
	BTFSS      STATUS+0, 2
	GOTO       L_main84
L__main155:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       main_old_L0+0, 0
	MOVWF      INDF+0
L_main84:
;first_stage_in_MCQ_parallel_finish.c,95 :: 		if(student[i]==15&&i==5){student[i]=old;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_main87
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main201
	MOVLW      5
	XORWF      main_i_L0+0, 0
L__main201:
	BTFSS      STATUS+0, 2
	GOTO       L_main87
L__main154:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       main_old_L0+0, 0
	MOVWF      INDF+0
L_main87:
;first_stage_in_MCQ_parallel_finish.c,96 :: 		if(student[i]!=15&&i==6){student[i-1]=student[i];student[i]=0;i=5;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main90
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main202
	MOVLW      6
	XORWF      main_i_L0+0, 0
L__main202:
	BTFSS      STATUS+0, 2
	GOTO       L_main90
L__main153:
	MOVLW      1
	SUBWF      main_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _student+0
	MOVWF      R1+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	CLRF       INDF+0
	MOVLW      5
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main90:
;first_stage_in_MCQ_parallel_finish.c,97 :: 		if(i==5){Lcd_Chr(1, 7, student[i]+47);}
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main203
	MOVLW      5
	XORWF      main_i_L0+0, 0
L__main203:
	BTFSS      STATUS+0, 2
	GOTO       L_main91
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_main91:
;first_stage_in_MCQ_parallel_finish.c,90 :: 		for(;(i==5||i==6)&&portc.f0==1;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;first_stage_in_MCQ_parallel_finish.c,98 :: 		}
	GOTO       L_main68
L_main69:
;first_stage_in_MCQ_parallel_finish.c,99 :: 		for(i=7;i<17&&portc.f0==1;)
	MOVLW      7
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main92:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main204
	MOVLW      17
	SUBWF      main_i_L0+0, 0
L__main204:
	BTFSC      STATUS+0, 0
	GOTO       L_main93
	BTFSS      PORTC+0, 0
	GOTO       L_main93
L__main152:
;first_stage_in_MCQ_parallel_finish.c,101 :: 		n=i;
	MOVF       main_i_L0+0, 0
	MOVWF      main_n_L0+0
;first_stage_in_MCQ_parallel_finish.c,102 :: 		q++;
	INCF       main_q_L0+0, 1
;first_stage_in_MCQ_parallel_finish.c,105 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;first_stage_in_MCQ_parallel_finish.c,106 :: 		Lcd_Out(1, 1, "Q   :");  Lcd_Chr(1, 3, n-q+43);  Lcd_Chr(1, 6, student[i]+47);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_first_stage_in_MCQ_parallel_finish+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_q_L0+0, 0
	SUBWF      main_n_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      43
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;first_stage_in_MCQ_parallel_finish.c,108 :: 		for(;(i==n||i==n+1)&&portc.f0==1;i++)
L_main98:
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main205
	MOVF       main_n_L0+0, 0
	XORWF      main_i_L0+0, 0
L__main205:
	BTFSC      STATUS+0, 2
	GOTO       L__main151
	MOVF       main_n_L0+0, 0
	ADDLW      1
	MOVWF      R1+0
	CLRF       R1+1
	BTFSC      STATUS+0, 0
	INCF       R1+1, 1
	MOVF       main_i_L0+1, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main206
	MOVF       R1+0, 0
	XORWF      main_i_L0+0, 0
L__main206:
	BTFSC      STATUS+0, 2
	GOTO       L__main151
	GOTO       L_main99
L__main151:
	BTFSS      PORTC+0, 0
	GOTO       L_main99
L__main150:
;first_stage_in_MCQ_parallel_finish.c,110 :: 		old=student[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      main_old_L0+0
;first_stage_in_MCQ_parallel_finish.c,111 :: 		for(;(student[i]==0||flag[i]==1)&&portc.f0==1;){student[i] = Keypad_Key_Click();flag[i]=0;}
L_main105:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main149
	MOVF       main_i_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main149
	GOTO       L_main106
L__main149:
	BTFSS      PORTC+0, 0
	GOTO       L_main106
L__main148:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FLOC__main+0
	CALL       _Keypad_Key_Click+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       main_i_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	CLRF       INDF+0
	GOTO       L_main105
L_main106:
;first_stage_in_MCQ_parallel_finish.c,112 :: 		if(student[i]==0&&(i==n)){student[i]=old;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main114
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main207
	MOVF       main_n_L0+0, 0
	XORWF      main_i_L0+0, 0
L__main207:
	BTFSS      STATUS+0, 2
	GOTO       L_main114
L__main147:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       main_old_L0+0, 0
	MOVWF      INDF+0
L_main114:
;first_stage_in_MCQ_parallel_finish.c,113 :: 		if(student[i]==15&&i==n){student[i]=old;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_main117
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main208
	MOVF       main_n_L0+0, 0
	XORWF      main_i_L0+0, 0
L__main208:
	BTFSS      STATUS+0, 2
	GOTO       L_main117
L__main146:
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       main_old_L0+0, 0
	MOVWF      INDF+0
L_main117:
;first_stage_in_MCQ_parallel_finish.c,114 :: 		if(student[i]!=15&&i==n+1){student[i-1]=student[i];student[i]=0;i=n;}
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main120
	MOVF       main_n_L0+0, 0
	ADDLW      1
	MOVWF      R1+0
	CLRF       R1+1
	BTFSC      STATUS+0, 0
	INCF       R1+1, 1
	MOVF       main_i_L0+1, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main209
	MOVF       R1+0, 0
	XORWF      main_i_L0+0, 0
L__main209:
	BTFSS      STATUS+0, 2
	GOTO       L_main120
L__main145:
	MOVLW      1
	SUBWF      main_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _student+0
	MOVWF      R1+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	CLRF       INDF+0
	MOVF       main_n_L0+0, 0
	MOVWF      main_i_L0+0
	CLRF       main_i_L0+1
L_main120:
;first_stage_in_MCQ_parallel_finish.c,115 :: 		if(i==n){Lcd_Chr(1, 6, student[i]+47);}
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main210
	MOVF       main_n_L0+0, 0
	XORWF      main_i_L0+0, 0
L__main210:
	BTFSS      STATUS+0, 2
	GOTO       L_main121
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_i_L0+0, 0
	ADDLW      _student+0
	MOVWF      FSR
	MOVLW      47
	ADDWF      INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_main121:
;first_stage_in_MCQ_parallel_finish.c,108 :: 		for(;(i==n||i==n+1)&&portc.f0==1;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;first_stage_in_MCQ_parallel_finish.c,116 :: 		}
	GOTO       L_main98
L_main99:
;first_stage_in_MCQ_parallel_finish.c,117 :: 		}
	GOTO       L_main92
L_main93:
;first_stage_in_MCQ_parallel_finish.c,118 :: 		}
	GOTO       L_main7
L_main8:
;first_stage_in_MCQ_parallel_finish.c,119 :: 		q=0;
	CLRF       main_q_L0+0
;first_stage_in_MCQ_parallel_finish.c,120 :: 		for(f=0;f<17&&portc.f0==1;f++){flag[f]=1;}
	CLRF       main_f_L0+0
	CLRF       main_f_L0+1
L_main122:
	MOVLW      128
	XORWF      main_f_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main211
	MOVLW      17
	SUBWF      main_f_L0+0, 0
L__main211:
	BTFSC      STATUS+0, 0
	GOTO       L_main123
	BTFSS      PORTC+0, 0
	GOTO       L_main123
L__main144:
	MOVF       main_f_L0+0, 0
	ADDLW      _flag+0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
	INCF       main_f_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_f_L0+1, 1
	GOTO       L_main122
L_main123:
;first_stage_in_MCQ_parallel_finish.c,121 :: 		Lcd_Out(2, 1, "GOOD LUCK"); Lcd_Out(1, 1, "time is up");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_first_stage_in_MCQ_parallel_finish+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_first_stage_in_MCQ_parallel_finish+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;first_stage_in_MCQ_parallel_finish.c,123 :: 		for(k=0;k<17&&portc.f0==0&&w==0;k++){student[k]--;if(k==16){w=1;}}
	CLRF       main_k_L0+0
	CLRF       main_k_L0+1
L_main127:
	MOVLW      128
	XORWF      main_k_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main212
	MOVLW      17
	SUBWF      main_k_L0+0, 0
L__main212:
	BTFSC      STATUS+0, 0
	GOTO       L_main128
	BTFSC      PORTC+0, 0
	GOTO       L_main128
	MOVLW      0
	XORWF      main_w_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main213
	MOVLW      0
	XORWF      main_w_L0+0, 0
L__main213:
	BTFSS      STATUS+0, 2
	GOTO       L_main128
L__main143:
	MOVF       main_k_L0+0, 0
	ADDLW      _student+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	DECF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVLW      0
	XORWF      main_k_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main214
	MOVLW      16
	XORWF      main_k_L0+0, 0
L__main214:
	BTFSS      STATUS+0, 2
	GOTO       L_main132
	MOVLW      1
	MOVWF      main_w_L0+0
	MOVLW      0
	MOVWF      main_w_L0+1
L_main132:
	INCF       main_k_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_k_L0+1, 1
	GOTO       L_main127
L_main128:
;first_stage_in_MCQ_parallel_finish.c,124 :: 		if(portc.f0==0){trans[0]=student[0];trans[1]=student[1];trans[2]=student[3];trans[3]=student[5];trans[4]=student[7];trans[5]=student[9];
	BTFSC      PORTC+0, 0
	GOTO       L_main133
	MOVF       _student+0, 0
	MOVWF      _trans+0
	MOVF       _student+1, 0
	MOVWF      _trans+1
	MOVF       _student+3, 0
	MOVWF      _trans+2
	MOVF       _student+5, 0
	MOVWF      _trans+3
	MOVF       _student+7, 0
	MOVWF      _trans+4
	MOVF       _student+9, 0
	MOVWF      _trans+5
;first_stage_in_MCQ_parallel_finish.c,125 :: 		trans[6]=student[11];trans[7]=student[13];trans[8]=student[15];}
	MOVF       _student+11, 0
	MOVWF      _trans+6
	MOVF       _student+13, 0
	MOVWF      _trans+7
	MOVF       _student+15, 0
	MOVWF      _trans+8
L_main133:
;first_stage_in_MCQ_parallel_finish.c,129 :: 		if (count==1)
	MOVF       _count+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main134
;first_stage_in_MCQ_parallel_finish.c,131 :: 		for(k=0;k<9&&portc.f0==0&&t==0;k++)
	CLRF       main_k_L0+0
	CLRF       main_k_L0+1
L_main135:
	MOVLW      128
	XORWF      main_k_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main215
	MOVLW      9
	SUBWF      main_k_L0+0, 0
L__main215:
	BTFSC      STATUS+0, 0
	GOTO       L_main136
	BTFSC      PORTC+0, 0
	GOTO       L_main136
	MOVLW      0
	XORWF      main_t_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main216
	MOVLW      0
	XORWF      main_t_L0+0, 0
L__main216:
	BTFSS      STATUS+0, 2
	GOTO       L_main136
L__main142:
;first_stage_in_MCQ_parallel_finish.c,132 :: 		{UART1_Write(trans[k]+48);
	MOVF       main_k_L0+0, 0
	ADDLW      _trans+0
	MOVWF      FSR
	MOVLW      48
	ADDWF      INDF+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;first_stage_in_MCQ_parallel_finish.c,134 :: 		if(k==8){t=1;}
	MOVLW      0
	XORWF      main_k_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main217
	MOVLW      8
	XORWF      main_k_L0+0, 0
L__main217:
	BTFSS      STATUS+0, 2
	GOTO       L_main140
	MOVLW      1
	MOVWF      main_t_L0+0
	MOVLW      0
	MOVWF      main_t_L0+1
L_main140:
;first_stage_in_MCQ_parallel_finish.c,136 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main141:
	DECFSZ     R13+0, 1
	GOTO       L_main141
	DECFSZ     R12+0, 1
	GOTO       L_main141
	DECFSZ     R11+0, 1
	GOTO       L_main141
	NOP
	NOP
;first_stage_in_MCQ_parallel_finish.c,131 :: 		for(k=0;k<9&&portc.f0==0&&t==0;k++)
	INCF       main_k_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_k_L0+1, 1
;first_stage_in_MCQ_parallel_finish.c,137 :: 		}}
	GOTO       L_main135
L_main136:
L_main134:
;first_stage_in_MCQ_parallel_finish.c,138 :: 		} }
	GOTO       L_main4
	GOTO       $+0
; end of _main
