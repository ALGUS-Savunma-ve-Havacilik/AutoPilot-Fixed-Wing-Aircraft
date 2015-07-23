unsigned short student[17]={0};unsigned short trans[9]={0};unsigned short flag[17]={0};   unsigned char count=0;
char  keypadPort at PORTD;
//unsigned short M[9]={1, 2, 3, 4, 5, 1, 2, 3, 4};
sbit LCD_RS at RB5_bit;
sbit LCD_EN at RB6_bit;
sbit LCD_D4 at RB1_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D7 at RB4_bit;

sbit LCD_RS_Direction at TRISB5_bit;
sbit LCD_EN_Direction at TRISB6_bit;
sbit LCD_D4_Direction at TRISB1_bit;
sbit LCD_D5_Direction at TRISB2_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB4_bit;
void interrupt()

{
count =count+1;
intcon=0b10010000;
}

void main()
{ unsigned short old=0;
  unsigned short n=0;
  unsigned short q=0;
  int i=0;
  int w=0;
  int t=0;
  int z=0;
  int k=0;
  int f=0;
    trisc0_bit=1;
//  portc=0;
  trisb0_bit=1;
  intcon=0b10010000;
  Keypad_Init();
  Lcd_Init();
  UART1_Init(2400);
  Delay_ms(100);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);

  for(;portc.f0==0;) { Lcd_Out(2,6, " :P ");}
      for(;;)
      {
      for(i=0;i<17&&portc.f0==1;)
      {
        if(i==0)
        {
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(1, 1, "BN.:to");  Lcd_Chr(1, 5, student[i]+47);Lcd_Chr(1, 6, student[i+1]+47);
          Lcd_Out(2, 1, "entr tns&ons");
        }
        for(;(i==0||i==1||i==2)&&portc.f0==1;i++)
        {
          old=student[i];
          for(;(student[i]==0||flag[i]==1)&&portc.f0==1;){student[i] = Keypad_Key_Click();flag[i]=0;}
          if(student[i]==0&&(i==0||i==1)){student[i]=old;}
          if(student[i]==15&&(i==0||i==1)){student[i]=old;}
          if(student[i]!=15&&i==2){student[1]=0;student[0]=student[2];student[2]=0;i=0;}
          if(i==0){Lcd_Chr(1, 5, student[i]+47);}
          if(i==1){Lcd_Chr(1, 6, student[i]+47);}
        }

        if(i==3)
        {
           Lcd_Cmd(_LCD_CLEAR);
           Lcd_Out(1, 1, "sec:o "); Lcd_Chr(1, 5, student[i]+47);
        }
        for(;(i==3||i==4)&&portc.f0==1;i++)
        {
          old=student[i];
          for(;(student[i]==0||flag[i]==1)&&portc.f0==1;)
          {student[i] = Keypad_Key_Click();flag[i]=0;}
          if(student[i]==0&&(i==3)){student[i]=old;}
          if(student[i]==15&&i==3)
          {student[i]=old;}
          if(student[i]!=15&&i==4)
          {student[i-1]=student[i];student[i]=0;i=3;}
          if(i==3)
          {Lcd_Chr(1, 5, student[i]+47);}
        }
        if(i==5)
        {
           Lcd_Cmd(_LCD_CLEAR);
           Lcd_Out(1, 1, "model:");  Lcd_Chr(1, 7, student[i]+47);
        }
        for(;(i==5||i==6)&&portc.f0==1;i++)
        {
          old=student[i];
          for(;(student[i]==0||flag[i]==1)&&portc.f0==1;){student[i] = Keypad_Key_Click();flag[i]=0;}
           if(student[i]==0&&(i==5)){student[i]=old;}
          if(student[i]==15&&i==5){student[i]=old;}
          if(student[i]!=15&&i==6){student[i-1]=student[i];student[i]=0;i=5;}
          if(i==5){Lcd_Chr(1, 7, student[i]+47);}
        }
        for(i=7;i<17&&portc.f0==1;)
        {
          n=i;
          q++;
          if(i==n)
          {
             Lcd_Cmd(_LCD_CLEAR);
             Lcd_Out(1, 1, "Q   :");  Lcd_Chr(1, 3, n-q+43);  Lcd_Chr(1, 6, student[i]+47);
          }
          for(;(i==n||i==n+1)&&portc.f0==1;i++)
          {
            old=student[i];
            for(;(student[i]==0||flag[i]==1)&&portc.f0==1;){student[i] = Keypad_Key_Click();flag[i]=0;}
             if(student[i]==0&&(i==n)){student[i]=old;}
            if(student[i]==15&&i==n){student[i]=old;}
            if(student[i]!=15&&i==n+1){student[i-1]=student[i];student[i]=0;i=n;}
            if(i==n){Lcd_Chr(1, 6, student[i]+47);}
          }
       }
    }
    q=0;
    for(f=0;f<17&&portc.f0==1;f++){flag[f]=1;}
    Lcd_Out(2, 1, "GOOD LUCK"); Lcd_Out(1, 1, "time is up");

    for(k=0;k<17&&portc.f0==0&&w==0;k++){student[k]--;if(k==16){w=1;}}
    if(portc.f0==0){trans[0]=student[0];trans[1]=student[1];trans[2]=student[3];trans[3]=student[5];trans[4]=student[7];trans[5]=student[9];
    trans[6]=student[11];trans[7]=student[13];trans[8]=student[15];}



   if (count==1)
   {
   for(k=0;k<9&&portc.f0==0&&t==0;k++)
   {UART1_Write(trans[k]+48);

   if(k==8){t=1;}

   delay_ms(500);
}}
} }
