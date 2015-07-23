//GSM
char text_mode[10]={'a','t','+','c','m','g','f','=','1',13};
char phone_number[22]={'a','t','+','c','m','g','s','=','"','0','1','1','4','7','7','1','2','1','5','2','"',13} ;
 char rec[80];                                 // nemory to save the location
int i=0;                                       // the element pointer of array
int x=0,rr;
int m=0;                                      // flag of interrupt
char GP=0;
// counter of coma
unsigned short  int  v=0;

// Pin direction
sbit LCD_RS at RB5_bit;
sbit LCD_EN at RB4_bit;
sbit LCD_D7 at RB0_bit;
sbit LCD_D6 at RB1_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D4 at RB3_bit;

// Pin direction
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
  // if(v==0)
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
UART1_Init(9600);               // Initialize UART module at 9600 bps
Delay_ms(300);
lcd_cmd(_LCD_CURSOR_OFF);
trisc=0b10000000;
portc=255;
portc.f0=0;
portc.f2=0;
adcon1=2;
trise=1;
for(;;){
     lcd_chr(1,1,rec[14]);
    for (r=15;r<23;r++){
    lcd_chr_cp(rec[r]);
    }

    lcd_chr(2,1,rec[26]);
    for (r=27;r<36;r++){
    lcd_chr_cp(rec[r]);
    }
      if(porte.f0==0)
        {
        for(m=0;m<=9;m++)
     {
      UART1_write(text_mode[m]) ;
      delay_ms(200) ;
     }
     for(m=0;m<=21;m++)
     {
     UART1_write(phone_number[m]) ;
      delay_ms(200) ;
      }
        for (r=14;r<23;r++){
    UART1_WRITE(rec[r]);
    delay_ms(200);}
     for (r=26;r<36;r++){
    UART1_WRITE(rec[r]);
        delay_ms(200);}
  delay_ms(300);
    UART1_WRITE(26);
        
       }          }      }

