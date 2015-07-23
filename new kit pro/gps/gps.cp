#line 1 "C:/Users/bassam/Desktop/new kit pro/gps/gps.c"
int x=0;
char rr;
int i;
char rec[80];
int co;

char GP=0;

unsigned short int v=0;
sbit LCD_RS at RB7_bit;
sbit LCD_EN at RB6_bit;
sbit LCD_D4 at RB5_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D7 at RB2_bit;

sbit LCD_RS_Direction at TRISB7_bit;
sbit LCD_EN_Direction at TRISB6_bit;
sbit LCD_D4_Direction at TRISB5_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB2_bit;
sbit s1 at rd5_bit;
sbit s2 at rd6_bit;
sbit br1 at rd0_bit;
sbit s3 at rd7_bit;

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
}
if (v==6){
 i++;
rec[i] = rr;
}

 }
void main() {
Lcd_Init();
INTCON=0b11000000;
PIE1=0b00100000;
UART1_Init(9600);
Delay_ms(300);
trisc=0b10000000;
trisd=0;
portc=255;
portc.f0=0;
uart1_write_text("ready");
 for(;;){
 lcd_chr(1,1,rec[14]);
 for (co=15;co<23;co++){
 lcd_chr_cp(rec[co]);
 }

 lcd_chr(2,1,rec[26]);
 for (co=27;co<36;co++){
 lcd_chr_cp(rec[co]);
 }


}}
