object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 636
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 287
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 439
    Height = 249
    Align = alTop
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object StaticText1: TStaticText
    Left = 135
    Top = 255
    Width = 59
    Height = 17
    Caption = 'StaticText1'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 282
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 255
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 264
    Top = 264
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 4
    Text = 'TEF_DIAL'
    Items.Strings = (
      'TEF_DIAL'
      'TEF_CSHP'
      'HIPERTEF'
      'TEF_DISC')
  end
  object Timer1: TTimer
    Left = 96
    Top = 352
  end
end
