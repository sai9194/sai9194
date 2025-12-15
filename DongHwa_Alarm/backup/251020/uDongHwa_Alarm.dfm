object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #46041#54868#51204#51088' '#54392#49884' '#50508#46988' '#49884#49828#53596
  ClientHeight = 238
  ClientWidth = 547
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
    Top = 0
    Width = 547
    Height = 238
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 104
    Top = 168
  end
  object RESTResponse1: TRESTResponse
    Left = 301
    Top = 16
  end
  object RESTClient1: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 389
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 469
    Top = 16
  end
  object UniConnection1: TUniConnection
    ProviderName = 'SQL Server'
    Port = 18068
    Database = 'DONGHWA'
    Username = 'DONGHWA'
    Server = '211.205.9.2'
    Connected = True
    Left = 264
    Top = 128
    EncryptedPassword = '9BFF90FF91FF98FF97FF88FF9EFF9CFF90FF9CFF90FF8CFFA1FFA1FF'
  end
  object FDQuery1: TUniQuery
    Connection = UniConnection1
    ObjectView = True
    Left = 96
    Top = 56
  end
  object FDQuery2: TUniQuery
    Connection = UniConnection1
    ObjectView = True
    Left = 368
    Top = 96
  end
  object FDQuery3: TUniQuery
    Connection = UniConnection1
    ObjectView = True
    Left = 368
    Top = 176
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 456
    Top = 152
  end
  object FDQuery4: TUniQuery
    Connection = UniConnection1
    ObjectView = True
    Left = 456
    Top = 104
  end
end
