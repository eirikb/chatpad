object Form3: TForm3
  Left = 327
  Top = 205
  Width = 410
  Height = 257
  Caption = 'Stats'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 208
    Width = 121
    Height = 16
    Caption = 'Tid i kanal:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 144
    Top = 78
    Width = 71
    Height = 16
    Caption = 'Poster:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object poster: TLabel
    Left = 240
    Top = 78
    Width = 11
    Height = 16
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 144
    Top = 102
    Width = 71
    Height = 16
    Caption = 'Av deg:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object postavdeg: TLabel
    Left = 240
    Top = 102
    Width = 11
    Height = 16
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 144
    Top = 126
    Width = 81
    Height = 16
    Caption = 'Til deg:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tildeg: TLabel
    Left = 240
    Top = 126
    Width = 11
    Height = 16
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 129
    Height = 193
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 144
    Top = 8
    Width = 249
    Height = 57
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 24
    Top = 24
  end
end
