unit uDongHwa_Alarm;

interface

uses       System.JSON,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Forms,
  Data.Bind.Components, Data.Bind.ObjectScope, DBAccess, Uni, MemDS,
  UniProvider, SQLServerUniProvider, REST.Types, Data.DB, REST.Client,
  Vcl.ExtCtrls, Vcl.Controls, Vcl.StdCtrls;

type
  TfDongHwa_Alarm = class(TForm)
    Memo1: TMemo;
    Timer1: TTimer;
    UniConnection1: TUniConnection;
    FDQuery1: TUniQuery;
    FDQuery2: TUniQuery;
    FDQuery3: TUniQuery;
    SQLServerUniProvider1: TSQLServerUniProvider;
    TimerCheck: TTimer;
    Memo2: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure PushMessageSend(Title, Msg, MasterID : String);
    procedure FormShow(Sender: TObject);
    procedure TimerCheckTimer(Sender: TObject);
  private
    { Private declarations }
    procedure LogMsg(Msg : string);
  public
    { Public declarations }
//    HighCheck : Array[0..1000] Of Integer;
//    LowCheck : Array[0..1000] Of Integer;
  end;

var
  fDongHwa_Alarm: TfDongHwa_Alarm;

implementation

{$R *.dfm}

procedure TfDongHwa_Alarm.FormShow(Sender: TObject);
//var
//  i : integer;
begin
//  for i := 0 to 1000 do
//  begin
//    HighCheck[i] := 0;
//    LowCheck[i] := 0;
//  end;
//  FillChar(HighCheck, SizeOf(HighCheck), 0);
//  FillChar(LowCheck,  SizeOf(LowCheck),  0);
end;

procedure TfDongHwa_Alarm.LogMsg(Msg : string);
begin
  Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) +' : '+  Msg);
end;

procedure TfDongHwa_Alarm.PushMessageSend(Title, Msg, MasterID: String);
var
  I: Integer;
begin
  try
    FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('select push_token from tb_user_info as TUI');
    FDQuery2.SQL.Add('Inner Join MasterUser as M');
    FDQuery2.SQL.Add('On TUI.user_id = M.LoginID');
    FDQuery2.SQL.Add('where M.MasterID = '+MasterID);
    FDQuery2.SQL.Add('and TUI.reg_date >= GETDATE() - 30');
    FDQuery2.SQL.Add('Group by push_token');
    FDQuery2.Open;

    FDQuery3.SQL.Clear;
    if FDQuery2.RecordCount > 0 then
    begin
      for I := 1 to FDQuery2.RecordCount do
      begin
        if FDQuery2.FieldByName('push_token').AsString <> '' then
        begin
          FDQuery3.SQL.Add('Insert Into PushData(Token, Title, Msg, InsertTime)');
          FDQuery3.SQL.Add('Values('+#39+FDQuery2.FieldByName('push_token').AsString+#39);
          FDQuery3.SQL.Add(','+#39+Title+#39+','+#39+Msg+#39+', GETDATE())');
        end;
        FDQuery2.Next;
      end;
      FDQuery3.ExecSQL;
      Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) +' : '+FDQuery2.FieldByName('push_token').AsString+#13#10 + FDQuery3.SQL.Text );
    end;
  except on e:exception do
    begin
      Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + ' : '+FDQuery2.FieldByName('push_token').AsString+#13#10 + e.Message);
    end;
  end;
end;

//procedure TForm1.PushMessageSend(Title, Msg, MasterID: String);
//begin
//  try
//    FDQuery2.Close;
//    FDQuery2.SQL.Text :=
//      'select push_token '+
//      'from tb_user_info TUI '+
//      'join MasterUser M on TUI.user_id = M.LoginID '+
//      'where M.MasterID = :mid '+
//      '  and TUI.reg_date >= DATEADD(day,-30, GETDATE()) '+
//      'group by push_token';
//    FDQuery2.ParamByName('mid').AsString := MasterID;
//    FDQuery2.Open;
//
//    if FDQuery2.IsEmpty then Exit;
//
//    // 같은 Token+Msg+tit가 최근 30분 내 이미 전송된 적 있으면 INSERT 안 함
//    FDQuery3.SQL.Clear;
//    FDQuery3.SQL.Add(
//      'INSERT INTO PushData(Token, Title, Msg, InsertTime) '+
//      'SELECT :tok, :tit, :msg, GETDATE() '+
//      'WHERE NOT EXISTS ( '+
//      '  SELECT 1 FROM PushData_Log '+
//      '  WHERE Token = :tok AND Msg = :msg and Title = :tit '+
//      '    AND LogTime > DATEADD(minute,-'+IntToStr(COOLDOWN_MIN)+', GETDATE()) '+
//      ')'
//    );
//
//    FDQuery2.First;
//    while not FDQuery2.Eof do
//    begin
//      if FDQuery2.FieldByName('push_token').AsString <> '' then
//      begin
//        FDQuery3.ParamByName('tok').AsString := FDQuery2.FieldByName('push_token').AsString;
//        FDQuery3.ParamByName('tit').AsString := Title;
//        FDQuery3.ParamByName('msg').AsString := Msg;
//        FDQuery3.ExecSQL;
//        Memo1.Lines.Add( FDQuery3.SQL.Text );
//      end;
//      FDQuery2.Next;
//    end;
//  except
//    on E: Exception do
//      Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + '=' + E.Message);
//  end;
//end;

procedure TfDongHwa_Alarm.Timer1Timer(Sender: TObject);
var
  i : Integer;
  ErrMessage,ErrTitle : String;
  UpdateNo, MName : String;
  ControllerName : String;
  DeviceNum : Integer;
  PreMasterID : String;
  IgnoreER4: Boolean;
  NowTime: TTime; //현재시간  새벽3시 백업하면 db업뎃중지
begin
  NowTime := Time;
  Timer1.Enabled := False;
  try
    if not ((NowTime >= EncodeTime(3, 0, 0, 0)) and(NowTime <= EncodeTime(3, 20, 0, 0))) then
    begin
      with FDQuery1 do
      begin
        Close;
        Open;

        for i := 0 to RecordCount - 1 do
        begin
          if PreMasterID <> FieldByName('MasterID').AsString then
          begin
            PreMasterID := FieldByName('MasterID').AsString;
            DeviceNum := 0;
          end;
          DeviceNum := DeviceNum + 1;
          ControllerName := FieldByName('ControllerName').AsString;
          if ControllerName = '' then
          begin
            ControllerName := '단말기' + DeviceNum.ToString;
          end;

          MName := FieldByName('Name').AsString;

          if FieldByName('Alarm').AsBoolean
           and not FieldByName('AlarmX').AsBoolean then
          begin
            if FieldByName('PowerState').AsBoolean  then
            begin
              // 추가 변수
              IgnoreER4 := False;
              // ER1 발생 시 ER4 무시를 위해 ER1을 먼저 체크
              ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+FieldByName('ControllerName').AsString;
              ErrMessage := 'ER1 : SENSOR ERROR';


              FDQuery2.Close;
              FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add('Select top 1 CheckTime, No from Alarm');
              FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
              FDQuery2.SQL.Add('And EndTime Is Null');
              FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
              FDQuery2.SQL.Add('Order by StartTime desc');
              FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
              FDQuery2.ParamByName('ErrMessage2').AsString := 'ER1 - SENSOR ERROR';
              FDQuery2.Open;

              if FieldByName('Err').AsString = '001' then  // ER1 - SENSOR ERROR
              begin
                if FDQuery2.RecordCount = 0 then
                begin
                  FDQuery2.Close;
                  FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                  FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+',');
                  FDQuery2.SQL.Add(#39+ErrMessage+#39+',GETDATE() ,GETDATE())');
                  FDQuery2.ExecSQL;
                  PushMessageSend( ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                end
                else
                begin
                  if FDQuery2.FieldByName('CheckTime').AsDateTime + (0.0000011574 * 600 * 30) < Now then
                  begin                                              //250829 김동휘 10분 -> 30분으로 수정
                    FDQuery2.Close;
                    FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                    FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                    FDQuery2.SQL.Add('And EndTime Is Null');
                    FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
                    FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
                    FDQuery2.ParamByName('ErrMessage2').AsString := 'ER1 - SENSOR ERROR';

                    FDQuery2.ExecSQL;
                    PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
                  end;
                end;

                // ER1 발생 시 ER4는 무시
                IgnoreER4 := True;
              end
              else
              begin
                if FDQuery2.RecordCount > 0 then
                begin
                  UpdateNo := FDQuery2.FieldByName('No').AsString;
                  FDQuery2.Close;
                  FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE()');
                  FDQuery2.SQL.Add('Where No = '+UpdateNo);
                  FDQuery2.ExecSQL;
                  LogMsg(MName+  ' Update : '+UpdateNo);
                end;
              end;

              // ER2 체크
              ErrMessage := 'ER2 - ERROR';

              ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+FieldByName('ControllerName').AsString;
              ErrMessage := 'ER2 : ERROR';

              FDQuery2.Close;
              FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add('Select top 1 CheckTime, No from Alarm');
              FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
              FDQuery2.SQL.Add('And EndTime Is Null');
              //FDQuery2.SQL.Add('And ErrCode = '+#39+ErrMessage+#39);
              FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
              FDQuery2.SQL.Add('Order by StartTime desc');
              FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
              FDQuery2.ParamByName('ErrMessage2').AsString := 'ER2 - ERROR';
              FDQuery2.Open;

              if FieldByName('Err').AsString = '010' then  // ER2 - MEMORY ERROR
              begin
                if FDQuery2.RecordCount = 0 then
                begin
                  FDQuery2.Close;
                  FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                  FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+',');
                  FDQuery2.SQL.Add(#39+ErrMessage+#39+',GETDATE() ,GETDATE())');
                  FDQuery2.ExecSQL;
                  PushMessageSend( ErrTitle,ErrMessage , FieldByName('MasterID').AsString);
                end
                else
                begin
                  if FDQuery2.FieldByName('CheckTime').AsDateTime + (0.0000011574 * 600 * 30) < Now then
                  begin
                    FDQuery2.Close;
                    FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                    FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                    FDQuery2.SQL.Add('And EndTime Is Null');
                    FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
                    FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
                    FDQuery2.ParamByName('ErrMessage2').AsString := 'ER2 - ERROR';
                    FDQuery2.ExecSQL;
                    PushMessageSend( ErrTitle,ErrMessage , FieldByName('MasterID').AsString);
                  end;
                end;
              end else
              begin
                if FDQuery2.RecordCount > 0 then
                begin
                  UpdateNo := FDQuery2.FieldByName('No').AsString;
                  FDQuery2.Close;
                  FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE()');
                  FDQuery2.SQL.Add('Where No = '+UpdateNo);
                  FDQuery2.ExecSQL;
                  LogMsg(MName+  ' Update : '+UpdateNo);
                end;
              end;

              if FieldByName('CheckDate').AsDateTime + (0.0000011574 * 600 * 30) > Now then
              begin
                // ER3 체크
                if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) ) then
                begin
//                  if HighCheck[i] > 2 then
                  begin
                    ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+FieldByName('ControllerName').AsString;
                    ErrMessage := 'ER3 : 온도상한 발생';

                    FDQuery2.Close;
                    FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Select top 1 CheckTime, No from Alarm');
                    FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                    FDQuery2.SQL.Add('And EndTime Is Null');
                    FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
                    FDQuery2.SQL.Add('Order by StartTime desc');
                    FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
                    FDQuery2.ParamByName('ErrMessage2').AsString := 'ER3 - 온도상한 발생';
                    FDQuery2.Open;

                    if FDQuery2.RecordCount = 0 then
                    begin
                      FDQuery2.Close;
                      FDQuery2.SQL.Clear;
                      FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                      FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+',');
                      FDQuery2.SQL.Add(#39+ErrMessage+#39+',GETDATE() ,GETDATE())');
                      FDQuery2.ExecSQL;
                      PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                    end
                    else
                    begin
                      if FDQuery2.FieldByName('CheckTime').AsDateTime + (0.0000011574 * 600 * 30) < Now then
                      begin
                        FDQuery2.Close;
                        FDQuery2.SQL.Clear;
                        FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                        FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                        FDQuery2.SQL.Add('And EndTime Is Null');
                        FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
                        FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
                        FDQuery2.ParamByName('ErrMessage2').AsString := 'ER3 - 온도상한 발생';
                        FDQuery2.ExecSQL;
                        PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                      end;
                    end;
                  end;
//                  else
//                  begin
//                    HighCheck[i] := HighCheck[i] + 1;
//                    Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) +' : '+MName+ ' ER3 - 온도상한 발생 ' + HighCheck[i].ToString + ' ' + ControllerName);
//                  end;
                  // IgnoreER4가 True면 스킵
                end
                else
                begin
                  // ER3 불발 시 ER4 체크 IgnoreER4가 False일 때만
                  if (not IgnoreER4) and ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then // ER4 - 온도하한 발생
                  begin
//                    if LowCheck[i] > 2 then
                    begin
                      ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+FieldByName('ControllerName').AsString;
                      ErrMessage := 'ER4 : 온도하한 발생';

                      FDQuery2.Close;
                      FDQuery2.SQL.Clear;
                      FDQuery2.SQL.Add('Select top 1 CheckTime, No from Alarm');
                      FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                      FDQuery2.SQL.Add('And EndTime Is Null');
                      FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
                      FDQuery2.SQL.Add('Order by StartTime desc');
                      FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
                      FDQuery2.ParamByName('ErrMessage2').AsString := 'ER4 - 온도하한 발생';
                      FDQuery2.Open;

                      if FDQuery2.RecordCount = 0 then
                      begin
                        FDQuery2.Close;
                        FDQuery2.SQL.Clear;
                        FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                        FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+',');
                        FDQuery2.SQL.Add(#39+ErrMessage+#39+',GETDATE() ,GETDATE())');
                        FDQuery2.ExecSQL;
                        PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
                      end
                      else
                      begin
                        if FDQuery2.FieldByName('CheckTime').AsDateTime + (0.0000011574 * 600 * 30) < Now then
                        begin
                          FDQuery2.Close;
                          FDQuery2.SQL.Clear;
                          FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                          FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                          FDQuery2.SQL.Add('And EndTime Is Null');
                          FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
                          FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
                          FDQuery2.ParamByName('ErrMessage2').AsString := 'ER4 - 온도하한 발생';
                          FDQuery2.ExecSQL;
                          PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                        end;
                      end;
                    end
//                    else
//                    begin
//                      LowCheck[i] := LowCheck[i] + 1;
//                      Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) +' : '+MName+ ' ER4 - 온도하한 발생' + LowCheck[i].ToString + ' ' + ControllerName);
//                    end;
                  end
                  else
                  begin
//                    HighCheck[i] := 0;
//                    LowCheck[i] := 0;

                    FDQuery2.Close;
                    FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('SELECT top 1 CheckTime, No FROM Alarm');
                    FDQuery2.SQL.Add('WHERE ControllerID = '+FieldByName('ControllerID').AsString);
                    FDQuery2.SQL.Add('  AND EndTime IS NULL');
                    FDQuery2.SQL.Add('  AND (');
                    FDQuery2.SQL.Add('       ErrCode IN (''ER3 - 온도상한 발생'', ''ER4 - 온도하한 발생'',');
                    FDQuery2.SQL.Add('                   ''ER3 : 온도상한 발생'', ''ER4 : 온도하한 발생'')');
                    FDQuery2.SQL.Add('      )');
                    FDQuery2.SQL.Add('ORDER BY StartTime DESC;');
                    FDQuery2.Open;

                    if FDQuery2.RecordCount > 0 then
                    begin
                      UpdateNo := FDQuery2.FieldByName('No').AsString;
                      FDQuery2.Close;
                      FDQuery2.SQL.Clear;
                      FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE()');
                      FDQuery2.SQL.Add('Where No = '+UpdateNo);
                      FDQuery2.ExecSQL;
                      LogMsg(MName+  ' Update : '+UpdateNo);
                    end;
                  end;
                end;
              end;

              // ER10 체크
              if not FieldByName('AlarmX').AsBoolean then
              begin
                ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+FieldByName('ControllerName').AsString;
                ErrMessage := 'ER10 : 통신연결 끊김';

                FDQuery2.Close;
                FDQuery2.SQL.Clear;

                //250313 김동휘 수정
                FDQuery2.SQL.Add(' Select A.*, C.AlarmX						     ');
                FDQuery2.SQL.Add(' from(Select * from Alarm 		       ');
                FDQuery2.SQL.Add(' Where ControllerID = :ControllerID   ');
                FDQuery2.SQL.Add(' And EndTime Is Null						             	');
                FDQuery2.SQL.Add(' And ErrCode in (:ErrMessage1, :ErrMessage2)   ');
                FDQuery2.SQL.Add(' )as A                                         ');
                FDQuery2.SQL.Add(' inner join (select ControllerID,AlarmX from ControllerInfo) as C ');
                FDQuery2.SQL.Add(' On A.ControllerID = C.ControllerID	   ');
                FDQuery2.SQL.Add(' Order by StartTime desc				   ');
                FDQuery2.ParamByName('ControllerID').AsInteger := FieldByName('ControllerID').AsInteger;
                FDQuery2.ParamByName('ErrMessage1').AsString   := ErrMessage;
                FDQuery2.ParamByName('ErrMessage2').AsString   := 'ER10 - 통신연결 끊김';
                FDQuery2.Open;
                if not FDQuery2.FieldByName('AlarmX').AsBoolean then
                begin
                  if FieldByName('CheckDate').AsDateTime + (0.0000011574 * 600 * 30) < Now then  // ER10 - 통신연결 끊김
                  begin
                    if FDQuery2.RecordCount = 0 then
                    begin
                      FDQuery2.Close;
                      FDQuery2.SQL.Clear;
                      FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                      FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+',');
                      FDQuery2.SQL.Add(#39+ErrMessage+#39+',GETDATE() ,GETDATE())');
                      FDQuery2.ExecSQL;
                      PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
                    end else
                    begin
                      if FDQuery2.FieldByName('CheckTime').AsDateTime + (0.0000011574 * 600 * 30) < Now then
                      begin
                        FDQuery2.Close;
                        FDQuery2.SQL.Clear;
                        FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                        FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                        FDQuery2.SQL.Add('And EndTime Is Null');
                        FDQuery2.SQL.Add('And ErrCode in (:ErrMessage1, :ErrMessage2)');
                        FDQuery2.ParamByName('ErrMessage1').AsString := ErrMessage;
                        FDQuery2.ParamByName('ErrMessage2').AsString := 'ER10 - 통신연결 끊김';
                        FDQuery2.ExecSQL;
                        PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
                      end;
                    end;
                  end else
                  begin
                    if FDQuery2.RecordCount > 0 then
                    begin
                      UpdateNo := FDQuery2.FieldByName('No').AsString;
                      FDQuery2.Close;
                      FDQuery2.SQL.Clear;
                      FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE()');
                      FDQuery2.SQL.Add('Where No = '+UpdateNo);
                      FDQuery2.ExecSQL;
                      LogMsg(MName+  ' Update : '+UpdateNo);
                    end;
                  end;
                end;
              end;

              // 단말기 on되면 off알람 체크
              ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+FieldByName('ControllerName').AsString;
              ErrMessage := '단말기의 전원이 OFF 되었습니다.';

              FDQuery2.Close;
              FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add('Select * from Alarm');
              FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
              FDQuery2.SQL.Add('And EndTime Is Null');
              FDQuery2.SQL.Add('And ErrCode = :ErrMessage1');
              FDQuery2.SQL.Add('Order by StartTime desc');
              FDQuery2.ParamByName('ErrMessage1').AsString := ErrTitle+' '+ErrMessage;
              FDQuery2.Open;

              if FDQuery2.RecordCount > 0 then
              begin
               // if FDQuery2.FieldByName('CheckTime').AsDateTime + (0.0000011574 * 600 * 30) < Now then
                begin
                  FDQuery2.Close;
                  FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE()');
                  FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                  FDQuery2.SQL.Add('And EndTime Is Null');
                  FDQuery2.SQL.Add('And ErrCode = :ErrMessage1');
                  FDQuery2.ParamByName('ErrMessage1').AsString := ErrTitle+' '+ErrMessage;
                  FDQuery2.ExecSQL;
                end;
              end;

            end
            else
            begin
             // if FieldByName('CheckDate').AsDateTime + (0.0000011574 * 600 * 30) > Now then
              begin
                // off 체크
                ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+FieldByName('ControllerName').AsString;
                ErrMessage := '단말기의 전원이 OFF 되었습니다.';

                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('Select top 1 CheckTime, No from Alarm');
                FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                FDQuery2.SQL.Add('And EndTime Is Null');
                FDQuery2.SQL.Add('And ErrCode = :ErrMessage1');
                FDQuery2.SQL.Add('Order by StartTime desc');
                FDQuery2.ParamByName('ErrMessage1').AsString := ErrTitle+' '+ErrMessage;
                FDQuery2.Open;

                if FDQuery2.RecordCount = 0 then
                begin
                  FDQuery2.Close;
                  FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime,  CheckTime)');
                  FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+',');
                  FDQuery2.SQL.Add(#39+ErrTitle+' '+ErrMessage+#39+',GETDATE() ,GETDATE())');
                  FDQuery2.ExecSQL;
                  PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                end
                else
                begin
                  if FDQuery2.FieldByName('CheckTime').AsDateTime + (0.0000011574 * 600 * 30) < Now then
                  begin                                              //하루 1초(1/86400) * 10분
                                                                      //250829 김동휘 10분 -> 30분으로 수정
                    FDQuery2.Close;
                    FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                    FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                    FDQuery2.SQL.Add('And EndTime Is Null');
                    FDQuery2.SQL.Add('And ErrCode = :ErrMessage1');
                    FDQuery2.ParamByName('ErrMessage1').AsString := ErrTitle+' '+ErrMessage;
                    FDQuery2.ExecSQL;
                    PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                  end;
                end;
              end;
            end;
          end;
          Next;
        end;
      end;
    end;
  finally
    Timer1.Enabled := True;
  end;

end;

procedure TfDongHwa_Alarm.TimerCheckTimer(Sender: TObject);
begin
  if Memo1.Lines.Count > 300 then
  begin
    Memo1.Lines.Clear;
  end;

  if Memo2.Lines.Count > 300 then
  begin
    Memo2.Lines.Clear;
  end;

  if not UniConnection1.Connected then
  begin
    try
      UniConnection1.Connect;
      LogMsg('Reconnected');
    except
      on E: Exception do
        LogMsg('Reconnect failed: ' + E.Message);
    end;
  end;

  if  UniConnection1.Connected then
  begin
    if not Timer1.Enabled then
    begin
      Timer1.Enabled := True;
      LogMsg('Main timer re-enabled');
    end;
  end;
end;

//procedure TForm1.Timer1Timer(Sender: TObject);
//var
//  i: Integer;
//  ErrMessage, ErrTitle, UpdateNo, ControllerName, PreMasterID: String;
//  DeviceNum: Integer;
//  IgnoreER4: Boolean;
//begin
//  Timer1.Enabled := False;
//  try
//    with FDQuery1 do
//    begin
//      Close; SQL.Clear;
//      SQL.Add('SELECT MU.LOGINID, C.MasterID, C.ControllerName, C.ControllerID, C.Alarm,');
//      SQL.Add('ISNULL(C.AlarmX,0) AS AlarmX, Temp, PowerState, C.ModifiedDateTime,');
//      SQL.Add('ISNULL(HighTemp,''50'') AS HighTemp, ISNULL(LowTemp,''-50'') AS LowTemp, Err, CheckDate');
//      SQL.Add('FROM (SELECT Temp, PowerState, Err, CheckDate, ControllerID FROM TempState WHERE CheckDate IS NOT NULL) TS');
//      SQL.Add('JOIN ControllerInfo C ON TS.ControllerID = C.ControllerID');
//      SQL.Add('JOIN (SELECT LOGINID, UserID, MasterID FROM MasterUser) MU ON MU.MasterID = C.MasterID AND MU.UserID = C.MasterID');
//      SQL.Add('WHERE C.MasterID > 0');
//      SQL.Add('ORDER BY C.ModifiedDateTime');
//      Open;
//
//      for i := 0 to RecordCount - 1 do
//      begin
//        if PreMasterID <> FieldByName('MasterID').AsString then
//        begin
//          PreMasterID := FieldByName('MasterID').AsString;
//          DeviceNum := 0;
//        end;
//        Inc(DeviceNum);
//        ControllerName := FieldByName('ControllerName').AsString;
//        if ControllerName = '' then
//          ControllerName := '단말기' + DeviceNum.ToString;
//
//        if FieldByName('Alarm').AsBoolean and not FieldByName('AlarmX').AsBoolean then
//        begin
//          if FieldByName('PowerState').AsBoolean then
//          begin
//            IgnoreER4 := False;
//
//            // ER1
//            ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
//            ErrMessage := 'ER1 : SENSOR ERROR';
//
//            FDQuery2.Close; FDQuery2.SQL.Text :=
//              'SELECT * FROM Alarm '+
//              'WHERE ControllerID = '+FieldByName('ControllerID').AsString+' AND EndTime IS NULL '+
//              'AND ErrCode IN (:m1,:m2) ORDER BY StartTime DESC';
//            FDQuery2.ParamByName('m1').AsString := ErrMessage;
//            FDQuery2.ParamByName('m2').AsString := 'ER1 - SENSOR ERROR';
//            FDQuery2.Open;
//
//            if FieldByName('Err').AsString = '001' then
//            begin
//              if FDQuery2.IsEmpty then
//              begin
//                FDQuery2.Close; FDQuery2.SQL.Text :=
//                  'INSERT INTO Alarm(ControllerID, ErrCode, StartTime, CheckTime) '+
//                  'VALUES('+FieldByName('ControllerID').AsString+', :msg, GETDATE(), GETDATE())';
//                FDQuery2.ParamByName('msg').AsString := ErrMessage;
//                FDQuery2.ExecSQL;
//                PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//              end
//              else if FDQuery2.FieldByName('CheckTime').AsDateTime + Cooldown < Now then
//              begin
//                FDQuery2.Close; FDQuery2.SQL.Text :=
//                  'UPDATE Alarm SET CheckTime = GETDATE() '+
//                  'WHERE ControllerID = '+FieldByName('ControllerID').AsString+' AND EndTime IS NULL '+
//                  'AND ErrCode IN (:m1,:m2)';
//                FDQuery2.ParamByName('m1').AsString := ErrMessage;
//                FDQuery2.ParamByName('m2').AsString := 'ER1 - SENSOR ERROR';
//                FDQuery2.ExecSQL;
//                PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//              end;
//              IgnoreER4 := True;
//            end
//            else if not FDQuery2.IsEmpty then
//            begin
//              UpdateNo := FDQuery2.FieldByName('No').AsString;
//              FDQuery2.Close; FDQuery2.SQL.Text := 'UPDATE Alarm SET EndTime = GETDATE() WHERE No = '+UpdateNo;
//              FDQuery2.ExecSQL;
//            end;
//
//            // ER2
//            ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
//            ErrMessage := 'ER2 : MEMORY ERROR';
//
//            FDQuery2.Close; FDQuery2.SQL.Text :=
//              'SELECT * FROM Alarm WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//              ' AND EndTime IS NULL AND ErrCode IN (:m1,:m2) ORDER BY StartTime DESC';
//            FDQuery2.ParamByName('m1').AsString := ErrMessage;
//            FDQuery2.ParamByName('m2').AsString := 'ER2 - MEMORY ERROR';
//            FDQuery2.Open;
//
//            if FieldByName('Err').AsString = '010' then
//            begin
//              if FDQuery2.IsEmpty then
//              begin
//                FDQuery2.Close; FDQuery2.SQL.Text :=
//                  'INSERT INTO Alarm(ControllerID, ErrCode, StartTime, CheckTime) '+
//                  'VALUES('+FieldByName('ControllerID').AsString+', :msg, GETDATE(), GETDATE())';
//                FDQuery2.ParamByName('msg').AsString := ErrMessage;
//                FDQuery2.ExecSQL;
//                PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//              end
//              else if FDQuery2.FieldByName('CheckTime').AsDateTime + Cooldown < Now then
//              begin
//                FDQuery2.Close; FDQuery2.SQL.Text :=
//                  'UPDATE Alarm SET CheckTime = GETDATE() WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//                  ' AND EndTime IS NULL AND ErrCode IN (:m1,:m2)';
//                FDQuery2.ParamByName('m1').AsString := ErrMessage;
//                FDQuery2.ParamByName('m2').AsString := 'ER2 - MEMORY ERROR';
//                FDQuery2.ExecSQL;
//                PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//              end;
//            end
//            else if not FDQuery2.IsEmpty then
//            begin
//              UpdateNo := FDQuery2.FieldByName('No').AsString;
//              FDQuery2.Close; FDQuery2.SQL.Text := 'UPDATE Alarm SET EndTime = GETDATE() WHERE No = '+UpdateNo;
//              FDQuery2.ExecSQL;
//            end;
//
//            // 최근수신 30분 이내만 ER3/ER4 판정
//            if FieldByName('CheckDate').AsDateTime + Cooldown > Now then
//            begin
//              // ER3
//              if FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat then
//              begin
//                if HighCheck[i] > 2 then
//                begin
//                  ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
//                  ErrMessage := 'ER3 : 온도상한 발생';
//
//                  FDQuery2.Close; FDQuery2.SQL.Text :=
//                    'SELECT * FROM Alarm WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//                    ' AND EndTime IS NULL AND ErrCode IN (:m1,:m2) ORDER BY StartTime DESC';
//                  FDQuery2.ParamByName('m1').AsString := ErrMessage;
//                  FDQuery2.ParamByName('m2').AsString := 'ER3 - 온도상한 발생';
//                  FDQuery2.Open;
//
//                  if FDQuery2.IsEmpty then
//                  begin
//                    FDQuery2.Close; FDQuery2.SQL.Text :=
//                      'INSERT INTO Alarm(ControllerID, ErrCode, StartTime, CheckTime) '+
//                      'VALUES('+FieldByName('ControllerID').AsString+', :msg, GETDATE(), GETDATE())';
//                    FDQuery2.ParamByName('msg').AsString := ErrMessage;
//                    FDQuery2.ExecSQL;
//                    PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//                  end
//                  else if FDQuery2.FieldByName('CheckTime').AsDateTime + Cooldown < Now then
//                  begin
//                    FDQuery2.Close; FDQuery2.SQL.Text :=
//                      'UPDATE Alarm SET CheckTime = GETDATE() WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//                      ' AND EndTime IS NULL AND ErrCode IN (:m1,:m2)';
//                    FDQuery2.ParamByName('m1').AsString := ErrMessage;
//                    FDQuery2.ParamByName('m2').AsString := 'ER3 - 온도상한 발생';
//                    FDQuery2.ExecSQL;
//                    PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//                  end;
//                end
//                else
//                  HighCheck[i] := HighCheck[i] + 1;
//              end
//              else
//              begin
//                // ER4 (ER1 살아있으면 무시)
//                if (not IgnoreER4) and (FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat) then
//                begin
//                  if LowCheck[i] > 2 then
//                  begin
//                    ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
//                    ErrMessage := 'ER4 : 온도하한 발생';
//
//                    FDQuery2.Close; FDQuery2.SQL.Text :=
//                      'SELECT * FROM Alarm WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//                      ' AND EndTime IS NULL AND ErrCode IN (:m1,:m2) ORDER BY StartTime DESC';
//                    FDQuery2.ParamByName('m1').AsString := ErrMessage;
//                    FDQuery2.ParamByName('m2').AsString := 'ER4 - 온도하한 발생';
//                    FDQuery2.Open;
//
//                    if FDQuery2.IsEmpty then
//                    begin
//                      FDQuery2.Close; FDQuery2.SQL.Text :=
//                        'INSERT INTO Alarm(ControllerID, ErrCode, StartTime, CheckTime) '+
//                        'VALUES('+FieldByName('ControllerID').AsString+', :msg, GETDATE(), GETDATE())';
//                      FDQuery2.ParamByName('msg').AsString := ErrMessage;
//                      FDQuery2.ExecSQL;
//                      PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//                    end
//                    else if FDQuery2.FieldByName('CheckTime').AsDateTime + Cooldown < Now then
//                    begin
//                      FDQuery2.Close; FDQuery2.SQL.Text :=
//                        'UPDATE Alarm SET CheckTime = GETDATE() WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//                        ' AND EndTime IS NULL AND ErrCode IN (:m1,:m2)';
//                      FDQuery2.ParamByName('m1').AsString := ErrMessage;
//                      FDQuery2.ParamByName('m2').AsString := 'ER4 - 온도하한 발생';
//                      FDQuery2.ExecSQL;
//                      PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//                    end;
//                  end
//                  else
//                    LowCheck[i] := LowCheck[i] + 1;
//                end
//                else
//                begin
//                  HighCheck[i] := 0; LowCheck[i] := 0;
//                  FDQuery2.Close; FDQuery2.SQL.Text :=
//                    'SELECT * FROM Alarm WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//                    ' AND EndTime IS NULL '+
//                    ' AND ErrCode IN (''ER3 - 온도상한 발생'',''ER4 - 온도하한 발생'',''ER3 : 온도상한 발생'',''ER4 : 온도하한 발생'') '+
//                    'ORDER BY StartTime DESC';
//                  FDQuery2.Open;
//                  if not FDQuery2.IsEmpty then
//                  begin
//                    UpdateNo := FDQuery2.FieldByName('No').AsString;
//                    FDQuery2.Close; FDQuery2.SQL.Text := 'UPDATE Alarm SET EndTime = GETDATE() WHERE No = '+UpdateNo;
//                    FDQuery2.ExecSQL;
//                  end;
//                end;
//              end;
//            end;
//
//            // ER10(통신 끊김) : 최근 수신이 30분 이상 없을 때
//            if not FieldByName('AlarmX').AsBoolean then
//            begin
//              ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
//              ErrMessage := 'ER10 : 통신연결 끊김';
//
//              FDQuery2.Close; FDQuery2.SQL.Text :=
//                'SELECT A.*, C.AlarmX FROM ( '+
//                '  SELECT * FROM Alarm WHERE ControllerID = :cid AND EndTime IS NULL '+
//                '    AND ErrCode IN (:m1,:m2) '+
//                ') A JOIN (SELECT ControllerID, AlarmX FROM ControllerInfo) C ON A.ControllerID = C.ControllerID '+
//                'ORDER BY StartTime DESC';
//              FDQuery2.ParamByName('cid').AsInteger := FieldByName('ControllerID').AsInteger;
//              FDQuery2.ParamByName('m1').AsString := ErrMessage;
//              FDQuery2.ParamByName('m2').AsString := 'ER10 - 통신연결 끊김';
//              FDQuery2.Open;
//
//              if not FDQuery2.FieldByName('AlarmX').AsBoolean then
//              begin
//                if FieldByName('CheckDate').AsDateTime + Cooldown < Now then
//                begin
//                  if FDQuery2.IsEmpty then
//                  begin
//                    FDQuery2.Close; FDQuery2.SQL.Text :=
//                      'INSERT INTO Alarm(ControllerID, ErrCode, StartTime, CheckTime) '+
//                      'VALUES('+FieldByName('ControllerID').AsString+', :msg, GETDATE(), GETDATE())';
//                    FDQuery2.ParamByName('msg').AsString := ErrMessage;
//                    FDQuery2.ExecSQL;
//                    PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//                  end
//                  else if FDQuery2.FieldByName('CheckTime').AsDateTime + Cooldown < Now then
//                  begin
//                    FDQuery2.Close; FDQuery2.SQL.Text :=
//                      'UPDATE Alarm SET CheckTime = GETDATE() WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//                      ' AND EndTime IS NULL AND ErrCode IN (:m1,:m2)';
//                    FDQuery2.ParamByName('m1').AsString := ErrMessage;
//                    FDQuery2.ParamByName('m2').AsString := 'ER10 - 통신연결 끊김';
//                    FDQuery2.ExecSQL;
//                    PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//                  end;
//                end
//                else if not FDQuery2.IsEmpty then
//                begin
//                  UpdateNo := FDQuery2.FieldByName('No').AsString;
//                  FDQuery2.Close; FDQuery2.SQL.Text := 'UPDATE Alarm SET EndTime = GETDATE() WHERE No = '+UpdateNo;
//                  FDQuery2.ExecSQL;
//                end;
//              end;
//            end;
//
//            // 전원 꺼짐 알림 종료 처리
//            ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
//            ErrMessage := '단말기의 전원이 OFF 되었습니다.';
//
//            FDQuery2.Close; FDQuery2.SQL.Text :=
//              'SELECT * FROM Alarm WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//              ' AND EndTime IS NULL AND ErrCode = :m1 ORDER BY StartTime DESC';
//            FDQuery2.ParamByName('m1').AsString := ErrTitle+' '+ErrMessage;
//            FDQuery2.Open;
//
//            if not FDQuery2.IsEmpty then
//            begin
//              UpdateNo := FDQuery2.FieldByName('No').AsString;
//              FDQuery2.Close; FDQuery2.SQL.Text := 'UPDATE Alarm SET EndTime = GETDATE() WHERE No = '+UpdateNo;
//              FDQuery2.ExecSQL;
//            end;
//
//          end
//          else
//          begin
//            // Power OFF 시 OFF 알림 생성/쿨다운
//            ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
//            ErrMessage := '단말기의 전원이 OFF 되었습니다.';
//
//            FDQuery2.Close; FDQuery2.SQL.Text :=
//              'SELECT * FROM Alarm WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//              ' AND EndTime IS NULL AND ErrCode = :m1 ORDER BY StartTime DESC';
//            FDQuery2.ParamByName('m1').AsString := ErrTitle+' '+ErrMessage;
//            FDQuery2.Open;
//
//            if FDQuery2.IsEmpty then
//            begin
//              FDQuery2.Close; FDQuery2.SQL.Text :=
//                'INSERT INTO Alarm(ControllerID, ErrCode, StartTime, CheckTime) '+
//                'VALUES('+FieldByName('ControllerID').AsString+', :msg, GETDATE(), GETDATE())';
//              FDQuery2.ParamByName('msg').AsString := ErrTitle+' '+ErrMessage;
//              FDQuery2.ExecSQL;
//              PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//            end
//            else if FDQuery2.FieldByName('CheckTime').AsDateTime + Cooldown < Now then
//            begin
//              FDQuery2.Close; FDQuery2.SQL.Text :=
//                'UPDATE Alarm SET CheckTime = GETDATE() WHERE ControllerID = '+FieldByName('ControllerID').AsString+
//                ' AND EndTime IS NULL AND ErrCode = :m1';
//              FDQuery2.ParamByName('m1').AsString := ErrTitle+' '+ErrMessage;
//              FDQuery2.ExecSQL;
//              PushMessageSend(ErrTitle, ErrMessage, FieldByName('MasterID').AsString);
//            end;
//          end;
//        end;
//
//        Next;
//      end;
//    end;
//  finally
//    Timer1.Enabled := True;
//  end;
//end;

end.
