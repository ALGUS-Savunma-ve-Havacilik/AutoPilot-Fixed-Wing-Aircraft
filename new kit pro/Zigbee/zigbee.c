int x=0;
char rr;
int i;
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
case 'k':
   {
    for(i=0;i<20;i++)
   {
s1=1;s2=1;s3=1;br1=1;
delay_us(1500);
s1=0;s2=0;s3=0;br1=0;
delay_us(18500);
   }
    break;
    }

  case 'x':
   {
    for(i=0;i<20;i++)
   {
s1=1;s2=1;s3=1;br1=1;
delay_us(2350);
s1=0;s2=0;s3=0;br1=0;
delay_us(17650);
   }

    break;
   }
   case 'o':
   {
    for(i=0;i<20;i++)
     {
s1=1;s2=1;s3=1;br1=1;
delay_us(650);
s1=0;s2=0;s3=0;br1=0;
delay_us(19350);
    }

    break;
   }  }
x=1;
  }
void main() {
Lcd_Init();
INTCON=0b11000000;
PIE1=0b00100000;
UART1_Init(9600);               // Initialize UART module at 9600 bps
Delay_ms(300);                  // Wait for UART module to stabilize
trisc=0b10000000;
portc=255;
portc.f1=0;
portc.f2=0;
trisd=0;

uart1_write_text("ready");
  for(;;){

  if(x==1)
{
  Lcd_Chr_Cp(rr);
  x=0;
}


}}
