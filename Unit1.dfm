object Form1: TForm1
  Left = 216
  Top = 113
  Width = 664
  Height = 566
  Caption = 'uten navn - Notisblokk'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Courier'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = Memo1KeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 535
    Height = 493
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyDown = Memo1KeyDown
  end
  object Memo4: TMemo
    Left = 0
    Top = 0
    Width = 535
    Height = 493
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 5
    Visible = False
    OnKeyDown = Memo1KeyDown
  end
  object Memo3: TMemo
    Left = 0
    Top = 0
    Width = 535
    Height = 493
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 4
    Visible = False
    OnKeyDown = Memo1KeyDown
  end
  object Memo2: TMemo
    Left = 0
    Top = 0
    Width = 535
    Height = 493
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
    OnKeyDown = Memo1KeyDown
  end
  object Panel2: TPanel
    Left = 46
    Top = 65
    Width = 297
    Height = 321
    BevelWidth = 3
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    OnMouseMove = Panel2MouseMove
    object Label1: TLabel
      Left = 32
      Top = 48
      Width = 40
      Height = 13
      Caption = 'Nick:'
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 56
      Height = 13
      Caption = 'Server:'
    end
    object Label3: TLabel
      Left = 24
      Top = 8
      Width = 145
      Height = 13
      Caption = 'ChatPad Settings'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 112
      Width = 48
      Height = 13
      Caption = 'Kanal:'
    end
    object Label5: TLabel
      Left = 32
      Top = 144
      Width = 40
      Height = 13
      Caption = 'Port:'
    end
    object Label6: TLabel
      Left = 32
      Top = 176
      Width = 40
      Height = 13
      Caption = 'User:'
    end
    object Label7: TLabel
      Left = 24
      Top = 208
      Width = 48
      Height = 13
      Caption = 'Ident:'
    end
    object Edit2: TEdit
      Left = 80
      Top = 40
      Width = 137
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 80
      Top = 72
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 80
      Top = 104
      Width = 137
      Height = 21
      TabOrder = 2
      OnChange = Edit4Change
    end
    object Edit5: TEdit
      Left = 80
      Top = 136
      Width = 137
      Height = 21
      TabOrder = 3
    end
    object Edit6: TEdit
      Left = 80
      Top = 168
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object Edit7: TEdit
      Left = 80
      Top = 200
      Width = 137
      Height = 21
      TabOrder = 5
    end
    object Button1: TButton
      Left = 256
      Top = 8
      Width = 25
      Height = 25
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
    object BitBtn1: TBitBtn
      Left = 48
      Top = 248
      Width = 75
      Height = 25
      Caption = 'Save'
      ModalResult = 6
      TabOrder = 7
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 136
      Top = 248
      Width = 75
      Height = 25
      TabOrder = 8
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
    object Button2: TButton
      Left = 48
      Top = 280
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 9
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 136
      Top = 280
      Width = 81
      Height = 25
      Caption = 'Disconnect'
      TabOrder = 10
      OnClick = Button3Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 493
    Width = 656
    Height = 23
    Align = alBottom
    BorderStyle = bsSingle
    Color = clWhite
    TabOrder = 1
    Visible = False
    object Label8: TLabel
      Left = 541
      Top = 6
      Width = 8
      Height = 13
      Anchors = [akRight, akBottom]
    end
    object Edit1: TEdit
      Left = 2
      Top = 1
      Width = 643
      Height = 17
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
      OnKeyPress = Edit1KeyPress
    end
  end
  object ListBox1: TListBox
    Left = 535
    Top = 0
    Width = 121
    Height = 493
    Align = alRight
    BorderStyle = bsNone
    ItemHeight = 13
    PopupMenu = PopupMenu1
    Sorted = True
    TabOrder = 6
    Visible = False
    OnKeyDown = Memo1KeyDown
  end
  object ListBox2: TListBox
    Left = 352
    Top = 144
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 32
    object Fil1: TMenuItem
      Caption = 'Fil'
      object Connect1: TMenuItem
        Caption = 'Connect'
        OnClick = Connect1Click
      end
      object Disconnect1: TMenuItem
        Caption = 'Disconnect'
        Visible = False
        OnClick = Disconnect1Click
      end
      object Settings1: TMenuItem
        Caption = 'Settings'
        OnClick = Settings1Click
      end
      object Stats1: TMenuItem
        Caption = 'Show stats'
        OnClick = Stats1Click
      end
      object Userlist1: TMenuItem
        Caption = 'Show userlist'
        OnClick = Userlist1Click
      end
    end
    object Rediger1: TMenuItem
      Caption = 'Rediger'
    end
    object Format1: TMenuItem
      Caption = 'Format'
      object Skrift1: TMenuItem
        Caption = 'Skrift'
        OnClick = Skrift1Click
      end
      object Farge1: TMenuItem
        Caption = 'Farge'
        OnClick = Farge1Click
      end
    end
    object Hejlp1: TMenuItem
      Caption = 'Hjelp'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 424
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 32
    object lol1: TMenuItem
      Caption = 'msg'
      OnClick = lol1Click
    end
    object whois1: TMenuItem
      Caption = 'whois'
      OnClick = whois1Click
    end
    object Version1: TMenuItem
      Caption = 'Version'
      OnClick = Version1Click
    end
    object Ping1: TMenuItem
      Caption = 'Time'
      OnClick = Ping1Click
    end
    object Finger1: TMenuItem
      Caption = 'Finger'
      OnClick = Finger1Click
    end
    object Refreshlist1: TMenuItem
      Caption = 'Refresh list'
      OnClick = Refreshlist1Click
    end
  end
  object NMHTTP1: TNMHTTP
    Port = 0
    ReportLevel = 0
    Body = 'Default.htm'
    Header = 'Head.txt'
    InputFileMode = False
    OutputFileMode = False
    ProxyPort = 0
    Left = 360
    Top = 32
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 328
    Top = 32
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 296
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 48
    Top = 8
  end
end
