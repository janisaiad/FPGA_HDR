//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Easyd12.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}

//---ADD---------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
unsigned char buff[8];

buff[0]=0xaa;buff[1]=0xab;buff[2]=0xac;buff[3]=0xad;
buff[4]=0xae;buff[5]=0xaf;buff[6]=0xa0;buff[7]=0xa1;

WritePort1(buff,8);

buff[0]=0x00; //claer buffer [0]

ReadPort2(buff,8);

Form1->Memo1->Lines->Add("ADD Result         0x"+IntToHex((__int64)buff[0],2));
if (buff[0]==0xcc) Form1->Memo1->Lines->Add("Error ");
}

//---CLEAR-------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
unsigned char buff[8];

buff[0]=0x55;buff[1]=0x55;buff[2]=0x5c;buff[3]=0x5d;
buff[4]=0x5e;buff[5]=0x5f;buff[6]=0x50;buff[7]=0x51;

WritePort1(buff,8);

buff[0]=0x00;            //claer buffer [0]
ReadPort2(buff,8);
Form1->Memo1->Lines->Add("CLEAR Result     0x"+IntToHex((__int64)buff[0], 2));
if (buff[0]==0xcc) Form1->Memo1->Lines->Add("Error ");

}

//--reserve------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
unsigned char buff[8];

buff[0]=0x99;buff[1]=0x55;buff[2]=0x5c;buff[3]=0x5d;
buff[4]=0x5e;buff[5]=0x5f;buff[6]=0x50;buff[7]=0x51;

WritePort1(buff,8);

buff[0]=0x00;            //claer buffer [0]
ReadPort2(buff,8);
Form1->Memo1->Lines->Add("Reconnect USB");
if (buff[0]==0xcc) Form1->Memo1->Lines->Add("Error ");
}
//---END---------------------------------------------------------------------


