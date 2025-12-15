object fDongHwaPGCheck: TfDongHwaPGCheck
  Left = 0
  Top = 0
  Caption = #46041#54868#51204#51088' '#54532#47196#44536#47016' '#54869#51064
  ClientHeight = 216
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 78
    Width = 316
    Height = 138
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 0
    Top = 28
    Width = 316
    Height = 25
    Align = alTop
    Caption = 'TrayICon'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 0
    Top = 53
    Width = 316
    Height = 25
    Align = alTop
    Caption = 'KillProcess TEST'
    TabOrder = 2
    OnClick = Button2Click
  end
  object cxRGroup_Division: TcxRadioGroup
    AlignWithMargins = True
    Left = 1
    Top = 1
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alTop
    Alignment = alCenterCenter
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #49436#48260
      end
      item
        Caption = #50508#46988
      end>
    Properties.ReadOnly = False
    Properties.OnEditValueChanged = cxRGroup_DivisionPropertiesEditValueChanged
    ItemIndex = 0
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Office2019Colorful'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
    TabOrder = 3
    Height = 26
    Width = 314
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 128
    Top = 32
  end
  object FDConnection_1: TFDConnection
    Params.Strings = (
      'Server=coderun.co.kr,18068'
      'Database=DONGHWA'
      'User_Name=DONGHWA'
      'Password=donghwacocos^^'
      'LoginTimeout=100'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object TrayIcon1: TTrayIcon
    OnDblClick = TrayIcon1DblClick
    Left = 21
    Top = 136
  end
  object TimerHide: TTimer
    Interval = 300
    OnTimer = TimerHideTimer
    Left = 88
    Top = 136
  end
  object FDConnection_22: TFDConnection
    Params.Strings = (
      'Database=ALARM'
      'User_Name=COCOS_Ma'
      'Password=k93208604k??'
      'Server=coderun.co.kr,18068'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 214
    Top = 32
  end
  object TimerStateCheck: TTimer
    Interval = 3000
    OnTimer = TimerStateCheckTimer
    Left = 176
    Top = 144
  end
  object UniConnection: TUniConnection
    ProviderName = 'SQL Server'
    Database = 'DONGHWA'
    Options.DisconnectedMode = True
    Username = 'DONGHWA'
    Server = 'coderun.co.kr,18068'
    Left = 76
    EncryptedPassword = '9BFF90FF91FF98FF97FF88FF9EFF9CFF90FF9CFF90FF8CFFA1FFA1FF'
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 256
    Top = 168
  end
  object UniConnection22: TUniConnection
    ProviderName = 'SQL Server'
    Database = 'ALARM'
    Options.DisconnectedMode = True
    Username = 'COCOS_Ma'
    Server = 'coderun.co.kr,18068'
    Left = 276
    Top = 24
    EncryptedPassword = '94FFC6FFCCFFCDFFCFFFC7FFC9FFCFFFCBFF94FFC0FFC0FF'
  end
  object FDQuery1: TUniQuery
    Connection = UniConnection
    ObjectView = True
    Left = 16
    Top = 72
  end
  object FDQuery22: TUniQuery
    Connection = UniConnection22
    ObjectView = True
    Left = 214
    Top = 88
  end
  object FDQueryStateCheck: TUniQuery
    Connection = UniConnection
    ObjectView = True
    Left = 96
    Top = 96
  end
end
