object fDongHwaServer: TfDongHwaServer
  Left = 0
  Top = 0
  Caption = #46041#54868' '#49436#48260' _ v2.0.8'
  ClientHeight = 416
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 89
    Width = 457
    Height = 327
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    OnChange = Memo1Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 89
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 23
      Height = 13
      Caption = 'Port '
    end
    object LabelIOT: TLabel
      Left = 8
      Top = 34
      Width = 28
      Height = 13
      Caption = 'IOT : '
    end
    object LabelSocket: TLabel
      Left = 77
      Top = 34
      Width = 42
      Height = 13
      Caption = 'Socket : '
    end
    object LabelSocketNum: TLabel
      Left = 168
      Top = 34
      Width = 63
      Height = 13
      Caption = 'SocketNum : '
    end
    object Button1: TButton
      Left = 164
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Active'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 457
      Top = 6
      Width = 75
      Height = 25
      Caption = 'State'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 111
      Top = 51
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 2
      OnClick = Button3Click
    end
    object ButtonInfo: TButton
      Left = 376
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Info'
      TabOrder = 3
      OnClick = ButtonInfoClick
    end
    object Edit1: TEdit
      Left = 37
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '15337'
    end
    object Edit2: TEdit
      Left = 8
      Top = 53
      Width = 97
      Height = 21
      TabOrder = 5
      Text = 'Edit2'
    end
    object EditNumber: TEdit
      Left = 280
      Top = 8
      Width = 97
      Height = 21
      TabOrder = 6
      Text = '0'
    end
    object ButtonSet: TButton
      Left = 341
      Top = 39
      Width = 59
      Height = 25
      Caption = 'Set'
      TabOrder = 7
      OnClick = ButtonSetClick
    end
    object Button5: TButton
      Left = 480
      Top = 58
      Width = 75
      Height = 25
      Caption = 'SetTemp20'
      TabOrder = 8
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 561
      Top = 58
      Width = 86
      Height = 25
      Caption = 'SetTemp10Off'
      TabOrder = 9
      OnClick = Button6Click
    end
    object EditFloat2: TEdit
      Left = 216
      Top = 53
      Width = 57
      Height = 21
      TabOrder = 10
      Text = '0'
    end
    object EditOnOff2: TEdit
      Left = 279
      Top = 53
      Width = 57
      Height = 21
      TabOrder = 11
      Text = '0'
    end
    object EditHex2: TEdit
      Left = 407
      Top = 53
      Width = 57
      Height = 21
      TabOrder = 12
      Text = '0'
    end
    object Button4: TButton
      Left = 345
      Top = 63
      Width = 51
      Height = 25
      Caption = '>'
      TabOrder = 13
      OnClick = Button4Click
    end
    object ButtonClose: TButton
      Left = 561
      Top = 6
      Width = 75
      Height = 25
      Caption = #51333#47308
      TabOrder = 14
      OnClick = ButtonCloseClick
    end
  end
  object Button7: TButton
    Left = 673
    Top = 8
    Width = 75
    Height = 25
    Caption = 'TEST'
    TabOrder = 2
    OnClick = Button7Click
  end
  object Memo2: TMemo
    Left = 457
    Top = 89
    Width = 315
    Height = 327
    Align = alRight
    Lines.Strings = (
      'Memo2')
    TabOrder = 3
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    OnClientError = ServerSocket1ClientError
    Left = 488
    Top = 32
  end
  object TimerError: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerErrorTimer
    Left = 579
    Top = 152
  end
  object TimerError2: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerError2Timer
    Left = 578
    Top = 88
  end
  object TimerIOT: TTimer
    OnTimer = TimerIOTTimer
    Left = 248
    Top = 160
  end
  object TimerKillProgram: TTimer
    Enabled = False
    OnTimer = TimerKillProgramTimer
    Left = 120
    Top = 160
  end
  object TimerLogSave: TTimer
    Enabled = False
    OnTimer = TimerLogSaveTimer
    Left = 128
    Top = 240
  end
  object FDQueryLog: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from SMARTFARM')
    ObjectView = True
    Left = 480
    Top = 168
  end
  object FDQueryIOT: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from SMARTFARM')
    ObjectView = True
    Left = 360
    Top = 224
  end
  object FDQuery1: TUniQuery
    Connection = UniConnection1
    ObjectView = True
    Left = 352
    Top = 96
  end
  object FDQueryIOTDelete: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from SMARTFARM')
    ObjectView = True
    Left = 480
    Top = 232
  end
  object UniConnection1: TUniConnection
    ProviderName = 'SQL Server'
    Database = 'DONGHWA'
    Options.LocalFailover = True
    PoolingOptions.MaxPoolSize = 50
    PoolingOptions.Validate = True
    Pooling = True
    Username = 'DONGHWA'
    Server = '211.205.9.2,18068'
    Left = 496
    Top = 312
    EncryptedPassword = '9BFF90FF91FF98FF97FF88FF9EFF9CFF90FF9CFF90FF8CFFA1FFA1FF'
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 600
    Top = 296
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=211.205.9.2,18068'
      'User_Name=DONGHWA'
      'Password=donghwacocos^^'
      'Database=DONGHWA'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 480
    Top = 104
  end
  object Timer_check: TTimer
    Enabled = False
    Interval = 600000
    OnTimer = Timer_checkTimer
    Left = 16
    Top = 344
  end
end
