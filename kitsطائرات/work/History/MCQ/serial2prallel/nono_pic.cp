#line 1 "C:/Users/Noor/Desktop/BIG_PIC_2/C_prog/serial_prallel/nono_pic.c"
sbit LCD_RS at RC4_bit;
sbit LCD_EN at RC5_bit;
sbit LCD_D4 at RC0_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D7 at RC3_bit;

sbit LCD_RS_Direction at TRISC4_bit;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC0_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D7_Direction at TRISC3_bit;

void main() {
 int i,j,k;
 int t=0;
 int count=0;

 char D[9]={0};
 trisd=0;
 portd=0;
trisb4_bit=0;
trisb5_bit=0;
 trisb7_bit=1;
 portb=0;
Lcd_Init();
UART1_Init(2400);
Delay_ms(100);
for(;portb.f7==0;)
{Lcd_Out(1, 3, "Hello!");}

{for(;portb.f7==1;)


 { portb.f4=1;
 portb.f4=0;

 for(j=0;j<9&&UART1_Data_Ready() == 1;j++)
 {portb.f5=1;
 portd = UART1_Read();
 Lcd_Chr(2, 3, portd);


 }
 portb.f5=0;
 }
} }
