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


void main() {
int i;
lcd_init();
lcd_out(1,1,"hello");
portd=0;
trisd=0;
for(;;)
{
for(i=0;i<200;i++)
{
s1=1;s2=1;s3=1;br1=1;
delay_us(1500);
s1=0;s2=0;s3=0;br1=0;
delay_us(18500);
}
delay_ms(1000);
for(i=0;i<200;i++)
{
s1=1;s2=1;s3=1;br1=1;
delay_us(2000);
s1=0;s2=0;s3=0;br1=0;
delay_us(18000);
}
delay_ms(1000);
for(i=0;i<200;i++)
{
s1=1;s2=1;s3=1;br1=1;
delay_us(1000);
s1=0;s2=0;s3=0;br1=0;
delay_us(19000);
}
delay_ms(1000);

}
}