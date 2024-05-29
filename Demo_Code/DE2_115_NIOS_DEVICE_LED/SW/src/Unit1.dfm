object Form1: TForm1
  Left = 358
  Top = 129
  Width = 345
  Height = 681
  AutoSize = True
  Caption = 'ISP1362 DeviceTest '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 649
    TabOrder = 0
    object Memo1: TMemo
      Left = 10
      Top = 98
      Width = 316
      Height = 543
      TabOrder = 0
    end
    object Button1: TButton
      Left = 10
      Top = 10
      Width = 92
      Height = 80
      Caption = 'ADD'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 236
      Top = 10
      Width = 93
      Height = 80
      Caption = 'CLEAR'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
