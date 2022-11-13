object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Convert CSV File.'
  ClientHeight = 516
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 64
    Width = 345
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'CSV Filename.'
    TabOrder = 0
    OnChange = LabeledEdit1Change
  end
  object Memo1: TMemo
    Left = 8
    Top = 104
    Width = 433
    Height = 385
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 366
    Top = 62
    Width = 75
    Height = 25
    Caption = 'CSV File'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Memo2: TMemo
    Left = 447
    Top = 136
    Width = 185
    Height = 353
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object btnHeader: TBitBtn
    Left = 447
    Top = 105
    Width = 185
    Height = 25
    Caption = 'Header'
    TabOrder = 4
    OnClick = btnHeaderClick
  end
  object btnData: TBitBtn
    Left = 647
    Top = 105
    Width = 185
    Height = 25
    Caption = 'Data'
    TabOrder = 5
    OnClick = btnDataClick
  end
  object Memo3: TMemo
    Left = 647
    Top = 136
    Width = 185
    Height = 353
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object Memo4: TMemo
    Left = 838
    Top = 136
    Width = 185
    Height = 353
    ScrollBars = ssBoth
    TabOrder = 7
  end
  object btnJson: TBitBtn
    Left = 838
    Top = 105
    Width = 185
    Height = 25
    Caption = 'JSON'
    TabOrder = 8
    OnClick = btnJsonClick
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileName = 'C:\Delphi Application\Delphi example\CSV Convert'
    FileTypes = <>
    Options = []
    Left = 348
    Top = 16
  end
end
