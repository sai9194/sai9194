object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #46041#54868#51204#51088' '#52629#49328'ICT '#51221#48372' '#50672#44228' '#48120#46308#50920#50612
  ClientHeight = 454
  ClientWidth = 1165
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Memo3: TMemo
    Left = 0
    Top = 0
    Width = 1049
    Height = 454
    Align = alLeft
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 1055
    Top = 8
    Width = 104
    Height = 25
    Caption = 'test'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 1055
    Top = 56
    Width = 104
    Height = 25
    Caption = #53440#51060#47672' '#49892#54665
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 1055
    Top = 360
    Width = 104
    Height = 25
    Caption = 'xml_test'
    TabOrder = 3
    OnClick = Button3Click
  end
  object UniConnection1: TUniConnection
    ProviderName = 'sQL Server'
    Port = 18068
    Database = 'DONGHWA'
    Username = 'DONGHWA'
    Server = '211.205.9.2'
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 13
    EncryptedPassword = '9BFF90FF91FF98FF97FF88FF9EFF9CFF90FF9CFF90FF8CFFA1FFA1FF'
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 184
    Top = 13
  end
  object UniQuery_API: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT A.[SerialNo]'
      '      ,A.[lsindRegistNo]'
      '      ,A.[itemCode]'
      '      ,A.[makrId]'
      '      ,A.[eqpmnCode]'
      '      ,A.[eqpmnEsntlSn]'
      '      ,A.[eqpmnNo]'
      '      ,A.[stallTyCode]'
      '      ,A.[stallNo]'
      '      ,A.[roomNo]'
      '      ,A.[roomDtlNo]'
      #9'  ,T.Temp'
      #9'  ,CONVERT(CHAR(19), t.CheckDate , 20) AS MDATE'
      #9'  ,m.Name as UserName'
      '  FROM  [dbo].[stall_Info] AS A '
      '  left JOIN [dbo].TempState  AS T'
      '  ON A.[SerialNo] = T.[SerialNo]'
      '  left join ControllerInfo as C'
      '  on c.Serial = a.Serial'
      '  left join MasterUser as M'
      '  on m.MasterID = c.MasterID'
      'WHERE T.CheckDate >= DATEADD(MINUTE, -10, GETDATE())')
    Left = 64
    Top = 80
  end
  object Timer1: TTimer
    Interval = 600000
    OnTimer = Timer1Timer
    Left = 176
    Top = 144
  end
  object HttpClient: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 168
    Top = 80
  end
  object UniQuery_InsertAPI: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'INSERT INTO [dbo].[stall_Log]'
      '           ([CheckDate]'
      '           ,[SerialNo]'
      '           ,[Temp]'
      #9#9'   ,UserName)'
      '     VALUES'
      '           (:CheckDate'
      '           ,:SerialNo'
      '           ,:Temp'
      #9#9'   ,:UserName)'
      'update [dbo].[stall_Info] set'
      '[CheckDate] = :CheckDate'
      'where SerialNo = :SerialNo')
    Left = 56
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CheckDate'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'SerialNo'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'Temp'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'UserName'
        Value = nil
      end>
  end
end
