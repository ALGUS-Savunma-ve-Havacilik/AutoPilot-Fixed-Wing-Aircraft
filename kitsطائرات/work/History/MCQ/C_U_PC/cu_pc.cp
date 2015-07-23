#line 1 "C:/Users/Noor/Desktop/BIG_PIC_2/C_prog/tests/serial_tests/C_U_PC/cu_pc.c"
sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;

void main() {unsigned char D[9];
 int j,x;
 int receive_data=0;
 int sure= 0;
 int start= 0;
 int time_m= 1;
 int time_s= 0;
 int f=1;
 char m[2], s[2];
 trisd=0;
 portd=0;
 trisc0_bit=1;
 trisc1_bit=1;
 trisb=255;


 UART1_Init(2400);
 Delay_ms(100);
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
for(;portc.f0==0;)
 {Lcd_Out(2,3,"Be ReadY :P ");}
 Lcd_Cmd(_LCD_CLEAR);
 if(portc.f0 ==1)
 {
 portd.f6=1;start=1;
 }
 if (start==1)
 {
 for( ; time_m!=0||time_s!=0;)
 {
 if(time_s==0)
 {

 sure=1;
 time_m--;time_s=60;
 }
 time_s--;
 m[0]=(time_m/10)+48; m[1]=(time_m%10)+48;
 s[0]=(time_s/10)+48; s[1]=(time_s%10)+48;
 delay_ms(1000);
 Lcd_Chr(1,1, m[0]); Lcd_Chr(1,2, m[1]);Lcd_Out(1,3,":");Lcd_Chr(1,4, s[0]); Lcd_Chr(1,5, s[1]);
 }
 }
 start=0;
 portd.f6=0;
 portd.f7=1;

for (;;)
 {
 for(j=0;portc.f1==1;j++)
 {
 if(j!=0)
 { UART1_Write(portb+48);
 Lcd_Chr(2,j+1,portb+48); }

 }
 }
 }
