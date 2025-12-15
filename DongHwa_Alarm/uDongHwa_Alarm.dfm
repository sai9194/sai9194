object fDongHwa_Alarm: TfDongHwa_Alarm
  Left = 0
  Top = 0
  Caption = #46041#54868#51204#51088' '#54392#49884' '#50508#46988' '#49884#49828#53596
  ClientHeight = 284
  ClientWidth = 747
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
    Width = 297
    Height = 284
    Align = alClient
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 297
    Top = 0
    Width = 450
    Height = 284
    Align = alRight
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 104
    Top = 168
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
    SQL.Strings = (
      
        'Select   MU.LOGINID'#9#9#9#9#9#9#9#9#9#9'                                   ' +
        '   '
      #9',C.MasterID'#9#9#9#9#9#9#9#9#9#9#9#9#9'                                      '
      
        #9',C.ControllerName'#9#9#9#9#9#9#9#9#9#9'                                    ' +
        '  '
      
        #9',C.ControllerID'#9#9#9#9#9#9#9#9#9#9#9'                                     ' +
        ' '
      #9',C.Alarm'#9#9#9#9#9#9#9#9#9#9#9#9#9#9'                                      '
      
        #9',ISNULL(C.AlarmX,0) as AlarmX'#9#9#9#9'                              ' +
        '        '
      #9',Temp'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'                                       '
      #9',PowerState'#9#9#9#9#9#9#9#9#9#9#9#9#9'                                      '
      
        #9',C.ModifiedDateTime'#9#9#9#9#9#9#9#9#9'                                   ' +
        '   '
      
        #9',ISNULL(HighTemp,'#39'50'#39') as HighTemp                             ' +
        '                                         '
      
        #9',ISNULL(LowTemp, '#39'-50'#39') as LowTemp'#9'                            ' +
        '          '
      #9',Err'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'                                      '
      
        #9',CheckDate '#9', MU.Name'#9#9#9#9#9#9#9#9#9#9#9#9'                              ' +
        ' '
      
        #9'from(select Temp ,PowerState, Err                              ' +
        '            '
      
        #9#9#9',CheckDate, ControllerID from TempState                      ' +
        '          '
      
        #9#9#9'Where CheckDate is not null)as TS'#9#9#9#9'                        ' +
        '       '
      
        #9'Inner Join(select MasterID, ControllerID, ControllerName, Alarm' +
        'X, HighTemp, LowTemp, ModifiedDateTime, Alarm'
      
        #9'from ControllerInfo where MasterID > 0 )as C'#9#9#9#9#9#9#9'            ' +
        '                   '
      
        #9'On TS.ControllerID = C.ControllerID'#9#9#9#9#9'                       ' +
        '        '
      
        #9'inner join  (SELECT LOGINID,UserID, MasterID, Name FROM MasterU' +
        'ser)  as MU'
      
        #9'on  MU.MasterID = C.MasterID and MU.UserID =C.MasterID '#9#9#9#9'    ' +
        '        '
      
        #9'--Where'#9' CheckDate >= GETDATE() - 30'#9#9#9#9#9#9#9#9#9#9#9#9'               ' +
        '      '#9#9#9#9#9#9#9#9#9'                             '
      #9'Order By C.MasterID ,  C.ControllerID '#9#9#9)
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
  object TimerCheck: TTimer
    Interval = 300000
    OnTimer = TimerCheckTimer
    Left = 176
    Top = 16
  end
end
