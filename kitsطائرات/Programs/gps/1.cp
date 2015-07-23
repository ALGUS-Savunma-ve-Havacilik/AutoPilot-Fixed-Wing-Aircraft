#line 1 "D:/ismail/gps/1.c"
 char rec[80];
int i=0;
int x=0,rr;
char GP=0;

unsigned short int v=0;


sbit LCD_RS at RB5_bit;
sbit LCD_EN at RB4_bit;
sbit LCD_D7 at RB0_bit;
sbit LCD_D6 at RB1_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D4 at RB3_bit;


sbit LCD_RS_Direction at TRISB5_bit;
sbit LCD_EN_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB0_bit;
sbit LCD_D6_Direction at TRISB1_bit;
sbit LCD_D5_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB3_bit;
interrupt()
{
rr = UART1_Read();
switch(rr)
{
case '$':
 {

 v=1;
 i=0;
 break;
 }

 case 'G':
 {
 if(v<6)
 {
 v++;
 break;
 }
 }
case 'P':
 {
 if(v==2)
 v=3;
 break;
 }

case 'A':
 {
 if(v==5)
 v=6;
 break;
 }
case ',':
 {
 if(v==6&&GP<8)
 GP++;
 break;
 }
}
if (v==6){
 i++;
rec[i] = rr;
}
}

void main() {
char r;
Lcd_Init();
INTCON=0b11000000;
PIE1=0b00100100;
UART1_Init(9600);
Delay_ms(300);
lcd_cmd(_LCD_CURSOR_OFF);
trisc=0b10000000;
portc=255;


portc.f2=0;
for(;;){
 lcd_chr(1,1,rec[14]);
 for (r=15;r<23;r++){
 lcd_chr_cp(rec[r]);
 }

 lcd_chr(2,1,rec[26]);
 for (r=27;r<36;r++){
 lcd_chr_cp(rec[r]);
 }
 }
 }
