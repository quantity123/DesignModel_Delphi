object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #21830#22330#25910#38134
  ClientHeight = 342
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 26
    Top = 25
    Width = 36
    Height = 13
    Caption = #21333#20215#65306
  end
  object Label2: TLabel
    Left = 26
    Top = 65
    Width = 36
    Height = 13
    Caption = #25968#37327#65306
  end
  object Label3: TLabel
    Left = 26
    Top = 261
    Width = 36
    Height = 13
    Caption = #24635#35745#65306
  end
  object Label4: TLabel
    Left = 68
    Top = 261
    Width = 218
    Height = 52
  end
  object Label5: TLabel
    Left = 26
    Top = 105
    Width = 60
    Height = 13
    Caption = #35745#31639#26041#24335#65306
  end
  object Edit1: TEdit
    Left = 91
    Top = 22
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 91
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 238
    Top = 20
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 26
    Top = 138
    Width = 287
    Height = 105
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 91
    Top = 102
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      #27491#24120#25910#36153
      #28385'300'#36820'100'
      #25171'8'#25240)
  end
end
