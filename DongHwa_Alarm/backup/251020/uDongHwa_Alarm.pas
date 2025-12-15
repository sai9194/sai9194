unit uDongHwa_Alarm;

interface

uses       System.JSON,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Forms,
  Data.Bind.Components, Data.Bind.ObjectScope, DBAccess, Uni, MemDS, DateUtils,
  UniProvider, SQLServerUniProvider, REST.Types, Data.DB, REST.Client,
  Vcl.ExtCtrls, Vcl.Controls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Timer1: TTimer;
    RESTResponse1: TRESTResponse;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    UniConnection1: TUniConnection;
    FDQuery1: TUniQuery;
    FDQuery2: TUniQuery;
    FDQuery3: TUniQuery;
    SQLServerUniProvider1: TSQLServerUniProvider;
    FDQuery4: TUniQuery;
    procedure Timer1Timer(Sender: TObject);
    procedure PushMessageSend(Title, Msg, MasterID : String);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    HighCheck : Array[0..1000] Of Integer;
    LowCheck : Array[0..1000] Of Integer;
  end;

var
  Form1: TForm1;

implementation

Const
  SERVER_KEY = 'AAAAxOKiZos:APA91bHgcq7czl68y5Gv9wRmxQ3EOHTXcwhw0Pk0h-yD_yN2j49RtkNty4FKKW7zNofZR7PC-MNE9eqyYIVilLH8QGIZnTFwZ0ysFccqqfCBX0qmAENhh-cUoBiZ-9qs2xn1IM4uOIvQ';

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to 1000 do
  begin
    HighCheck[i] := 0;
    LowCheck[i] := 0;
  end;
end;

procedure TForm1.PushMessageSend(Title, Msg, MasterID: String);
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
      Memo1.Lines.Add( FDQuery3.SQL.Text );
    end;
  except on e:exception do
    begin
      Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + '=' + e.Message);
    end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i : Integer;
  ErrMessage,ErrTitle : String;
  UpdateNo : String;
  ControllerName : String;
  DeviceNum : Integer;
  PreMasterID : String;
  IgnoreER4: Boolean;

  procedure TouchOccurTime;
  var D: Integer;
  begin
    D := FDQuery1.FieldByName('Delay_sec').AsInteger;
    if (D > 0) and FDQuery1.FieldByName('occur_time').IsNull then
    begin
      FDQuery4.Close;
      FDQuery4.SQL.Text :=
        'Update TempState Set occur_time = GETDATE() Where ControllerID = :CID';
      FDQuery4.ParamByName('CID').AsInteger := FDQuery1.FieldByName('ControllerID').AsInteger;
      FDQuery4.ExecSQL;
    end;
  end;

  procedure ClearOccurTime;
  begin
    FDQuery4.Close;
    FDQuery4.SQL.Text :=
      'Update TempState Set occur_time = NULL '+
      'Where ControllerID = :CID';
    FDQuery4.ParamByName('CID').AsInteger := FDQuery1.FieldByName('ControllerID').AsInteger;
    FDQuery4.ExecSQL;
  end;

  function DelayPassed: Boolean;
  var D: Integer;
  begin
    D := FDQuery1.FieldByName('Delay_sec').AsInteger;
    if D = 0 then Exit(True);                       // 지연 없음 → 즉시
    if FDQuery1.FieldByName('occur_time').IsNull then Exit(False);
    Result := Now >= (FDQuery1.FieldByName('occur_time').AsDateTime + (D / 86400));
  end;

begin
  Timer1.Enabled := False;
  try
    with FDQuery1 do
    begin
      Close;
      SQL.Clear;
      sql.add(' Select   MU.LOGINID');
      sql.add(' 	,C.MasterID');
      sql.add(' 	,C.ControllerName');
      sql.add(' 	,C.ControllerID');
      sql.add(' 	,C.Alarm');
      sql.add(' 	,ISNULL(C.AlarmX,0) as AlarmX');
      sql.add(' 	,Temp');
      sql.add(' 	,PowerState');
      sql.add(' 	,C.ModifiedDateTime');
      sql.add(' 	,ISNULL(HighTemp,''50'') as HighTemp');
      sql.add(' 	,ISNULL(LowTemp,''-50'') as LowTemp');
      sql.add(' 	,Err');
      sql.add(' 	,CheckDate');
      sql.add('  ,TS.occur_time');   // ★
      sql.add('  ,MU.Delay_sec');    // ★
      sql.add(' 	from(select Temp ,PowerState, Err');
      sql.add(' 			,CheckDate, occur_time, ControllerID from TempState');
      sql.add(' 			Where CheckDate is not null)as TS');
      sql.add(' 	Inner Join ControllerInfo as C On TS.ControllerID = C.ControllerID');
      sql.add(' 	inner join  (SELECT LOGINID,UserID, MasterID, Delay_sec FROM MasterUser)  as MU');
      sql.add(' 	on  MU.MasterID = C.MasterID and MU.UserID =C.MasterID');
      sql.add(' 	Where C.MasterID > 0');
      //sql.add(' 	Where C.MasterID = 59'); // TEST용
      sql.add(' 	Order By C.ModifiedDateTime');
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
          ControllerName := '단말기' + DeviceNum.ToString;

        if FieldByName('Alarm').AsBoolean
         and not FieldByName('AlarmX').AsBoolean then
        begin
          if FieldByName('PowerState').AsBoolean  then
          begin
            // ========= ER1 =========
            IgnoreER4 := False;
            ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
            ErrMessage := 'ER1 : SENSOR ERROR';

            FDQuery2.Close; FDQuery2.SQL.Clear;
            FDQuery2.SQL.Add('Select * from Alarm');
            FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
            FDQuery2.SQL.Add('And EndTime Is Null');
            FDQuery2.SQL.Add('And ErrCode in (:E1, :E1b)');
            FDQuery2.SQL.Add('Order by StartTime desc');
            FDQuery2.ParamByName('E1').AsString  := ErrMessage;
            FDQuery2.ParamByName('E1b').AsString := 'ER1 - SENSOR ERROR';
            FDQuery2.Open;

            if FieldByName('Err').AsString = '001' then
            begin
              if FDQuery2.RecordCount = 0 then
              begin
                FDQuery2.Close; FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+','+#39+ErrMessage+#39+',GETDATE(),GETDATE())');
                FDQuery2.ExecSQL;
                PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
              end
              else if FDQuery2.FieldByName('CheckTime').AsDateTime + (1/86400)*60*30 < Now then
              begin
                FDQuery2.Close; FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                FDQuery2.SQL.Add('And EndTime Is Null');
                FDQuery2.SQL.Add('And ErrCode in (:E1, :E1b)');
                FDQuery2.ParamByName('E1').AsString  := ErrMessage;
                FDQuery2.ParamByName('E1b').AsString := 'ER1 - SENSOR ERROR';
                FDQuery2.ExecSQL;
                PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
              end;
              IgnoreER4 := True; // ER1시 ER4 무시
            end
            else if FDQuery2.RecordCount > 0 then
            begin
              UpdateNo := FDQuery2.FieldByName('No').AsString;
              FDQuery2.Close; FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE() Where No = '+UpdateNo);
              FDQuery2.ExecSQL;
              Memo1.Lines.Add('Update : '+UpdateNo);
            end;

            // ========= ER2 =========
            ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
            ErrMessage := 'ER2 : ERROR';

            FDQuery2.Close; FDQuery2.SQL.Clear;
            FDQuery2.SQL.Add('Select * from Alarm');
            FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
            FDQuery2.SQL.Add('And EndTime Is Null');
            FDQuery2.SQL.Add('And ErrCode in (:E2, :E2b)');
            FDQuery2.SQL.Add('Order by StartTime desc');
            FDQuery2.ParamByName('E2').AsString  := ErrMessage;
            FDQuery2.ParamByName('E2b').AsString := 'ER2 - ERROR';
            FDQuery2.Open;

            if FieldByName('Err').AsString = '010' then
            begin
              if FDQuery2.RecordCount = 0 then
              begin
                FDQuery2.Close; FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+','+#39+ErrMessage+#39+',GETDATE(),GETDATE())');
                FDQuery2.ExecSQL;
                PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
              end
              else if FDQuery2.FieldByName('CheckTime').AsDateTime + (1/86400)*60*30 < Now then
              begin
                FDQuery2.Close; FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                FDQuery2.SQL.Add('And EndTime Is Null');
                FDQuery2.SQL.Add('And ErrCode in (:E2, :E2b)');
                FDQuery2.ParamByName('E2').AsString  := ErrMessage;
                FDQuery2.ParamByName('E2b').AsString := 'ER2 - ERROR';
                FDQuery2.ExecSQL;
                PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
              end;
            end
            else if FDQuery2.RecordCount > 0 then
            begin
              UpdateNo := FDQuery2.FieldByName('No').AsString;
              FDQuery2.Close; FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE() Where No = '+UpdateNo);
              FDQuery2.ExecSQL;
              Memo1.Lines.Add('Update : '+UpdateNo);
            end;

            // ========= ER3/ER4 (지연 적용) =========
            if FieldByName('CheckDate').AsDateTime + (1/86400)*60*30 > Now then
            begin
              // ER3 상한
              if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) ) then
              begin
                TouchOccurTime;
                if DelayPassed then
                begin
                  ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
                  ErrMessage := 'ER3 : 온도상한 발생';

                  FDQuery2.Close; FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Select * from Alarm');
                  FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                  FDQuery2.SQL.Add('And EndTime Is Null');
                  FDQuery2.SQL.Add('And ErrCode in (:E3, :E3b)');
                  FDQuery2.SQL.Add('Order by StartTime desc');
                  FDQuery2.ParamByName('E3').AsString  := ErrMessage;
                  FDQuery2.ParamByName('E3b').AsString := 'ER3 - 온도상한 발생';
                  FDQuery2.Open;

                  if FDQuery2.RecordCount = 0 then
                  begin
                    FDQuery2.Close; FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                    FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+','+#39+ErrMessage+#39+',GETDATE(),GETDATE())');
                    FDQuery2.ExecSQL;
                    PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                  end
                  else if FDQuery2.FieldByName('CheckTime').AsDateTime + (1/86400)*60*30 < Now then
                  begin
                    FDQuery2.Close; FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                    FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                    FDQuery2.SQL.Add('And EndTime Is Null');
                    FDQuery2.SQL.Add('And ErrCode in (:E3, :E3b)');
                    FDQuery2.ParamByName('E3').AsString  := ErrMessage;
                    FDQuery2.ParamByName('E3b').AsString := 'ER3 - 온도상한 발생';
                    FDQuery2.ExecSQL;
                    PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                  end;
                end;
              end
              // ER4 하한 (ER1이면 무시)
              else if (not IgnoreER4) and ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                TouchOccurTime;
                if DelayPassed then
                begin
                  ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
                  ErrMessage := 'ER4 : 온도하한 발생';

                  FDQuery2.Close; FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Select * from Alarm');
                  FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                  FDQuery2.SQL.Add('And EndTime Is Null');
                  FDQuery2.SQL.Add('And ErrCode in (:E4, :E4b)');
                  FDQuery2.SQL.Add('Order by StartTime desc');
                  FDQuery2.ParamByName('E4').AsString  := ErrMessage;
                  FDQuery2.ParamByName('E4b').AsString := 'ER4 - 온도하한 발생';
                  FDQuery2.Open;

                  if FDQuery2.RecordCount = 0 then
                  begin
                    FDQuery2.Close; FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                    FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+','+#39+ErrMessage+#39+',GETDATE(),GETDATE())');
                    FDQuery2.ExecSQL;
                    PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
                  end
                  else if FDQuery2.FieldByName('CheckTime').AsDateTime + (1/86400)*60*30 < Now then
                  begin
                    FDQuery2.Close; FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                    FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                    FDQuery2.SQL.Add('And EndTime Is Null');
                    FDQuery2.SQL.Add('And ErrCode in (:E4, :E4b)');
                    FDQuery2.ParamByName('E4').AsString  := ErrMessage;
                    FDQuery2.ParamByName('E4b').AsString := 'ER4 - 온도하한 발생';
                    FDQuery2.ExecSQL;
                    PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
                  end;
                end;
              end
              else
              begin
                // 정상 복귀 → 발생시각 초기화 + 열린 ER3/ER4 닫기
                ClearOccurTime;

                FDQuery2.Close; FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('SELECT * FROM Alarm');
                FDQuery2.SQL.Add('WHERE ControllerID = '+FieldByName('ControllerID').AsString);
                FDQuery2.SQL.Add('  AND EndTime IS NULL');
                FDQuery2.SQL.Add('  AND (ErrCode IN (''ER3 - 온도상한 발생'', ''ER4 - 온도하한 발생'',');
                FDQuery2.SQL.Add('                   ''ER3 : 온도상한 발생'', ''ER4 : 온도하한 발생''))');
                FDQuery2.SQL.Add('ORDER BY StartTime DESC;');
                FDQuery2.Open;

                if FDQuery2.RecordCount > 0 then
                begin
                  UpdateNo := FDQuery2.FieldByName('No').AsString;
                  FDQuery2.Close; FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE() Where No = '+UpdateNo);
                  FDQuery2.ExecSQL;
                  Memo1.Lines.Add('Update : '+UpdateNo);
                end;
              end;
            end;

            // ========= ER10 =========
            if not FieldByName('AlarmX').AsBoolean then
            begin
              ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
              ErrMessage := 'ER10 : 통신연결 끊김';

              FDQuery2.Close; FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add(' Select A.*, C.AlarmX ');
              FDQuery2.SQL.Add(' from(Select * from Alarm ');
              FDQuery2.SQL.Add(' Where ControllerID = :ControllerID ');
              FDQuery2.SQL.Add(' And EndTime Is Null ');
              FDQuery2.SQL.Add(' And ErrCode in (:E10, :E10b)) as A ');
              FDQuery2.SQL.Add(' inner join (select ControllerID,AlarmX from ControllerInfo) as C ');
              FDQuery2.SQL.Add(' On A.ControllerID = C.ControllerID ');
              FDQuery2.SQL.Add(' Order by StartTime desc ');
              FDQuery2.ParamByName('ControllerID').AsInteger := FieldByName('ControllerID').AsInteger;
              FDQuery2.ParamByName('E10').AsString  := ErrMessage;
              FDQuery2.ParamByName('E10b').AsString := 'ER10 - 통신연결 끊김';
              FDQuery2.Open;

              if not FDQuery2.FieldByName('AlarmX').AsBoolean then
              begin
                if FieldByName('CheckDate').AsDateTime + (1/86400)*60*30 < Now then
                begin
                  if FDQuery2.RecordCount = 0 then
                  begin
                    FDQuery2.Close; FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, CheckTime)');
                    FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+','+#39+ErrMessage+#39+',GETDATE(),GETDATE())');
                    FDQuery2.ExecSQL;
                    PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
                  end
                  else if FDQuery2.FieldByName('CheckTime').AsDateTime + (1/86400)*60*30 < Now then
                  begin
                    FDQuery2.Close; FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
                    FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
                    FDQuery2.SQL.Add('And EndTime Is Null');
                    FDQuery2.SQL.Add('And ErrCode in (:E10, :E10b)');
                    FDQuery2.ParamByName('E10').AsString  := ErrMessage;
                    FDQuery2.ParamByName('E10b').AsString := 'ER10 - 통신연결 끊김';
                    FDQuery2.ExecSQL;
                    PushMessageSend(ErrTitle, ErrMessage , FieldByName('MasterID').AsString);
                  end;
                end
                else
                begin
                  if FDQuery2.RecordCount > 0 then
                  begin
                    UpdateNo := FDQuery2.FieldByName('No').AsString;
                    FDQuery2.Close; FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE() Where No = '+UpdateNo);
                    FDQuery2.ExecSQL;
                    Memo1.Lines.Add('Update : '+UpdateNo);
                  end;
                end;
              end;
            end;

            // ========= 단말 OFF 알람 종료 =========
            ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
            ErrMessage := '단말기의 전원이 OFF 되었습니다.';

            FDQuery2.Close; FDQuery2.SQL.Clear;
            FDQuery2.SQL.Add('Select * from Alarm');
            FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
            FDQuery2.SQL.Add('And EndTime Is Null');
            FDQuery2.SQL.Add('And ErrCode = :Msg');
            FDQuery2.SQL.Add('Order by StartTime desc');
            FDQuery2.ParamByName('Msg').AsString := ErrTitle+' '+ErrMessage;
            FDQuery2.Open;

            if FDQuery2.RecordCount > 0 then
            begin
              FDQuery2.Close; FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add('Update Alarm Set EndTime = GETDATE()');
              FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
              FDQuery2.SQL.Add('And EndTime Is Null');
              FDQuery2.SQL.Add('And ErrCode = :Msg');
              FDQuery2.ParamByName('Msg').AsString := ErrTitle+' '+ErrMessage;
              FDQuery2.ExecSQL;
            end;

          end
          else
          begin
            // ========= 단말 OFF 알람 생성/갱신 =========
            ErrTitle   := '['+FieldByName('LOGINID').AsString+'] : '+ControllerName;
            ErrMessage := '단말기의 전원이 OFF 되었습니다.';

            FDQuery2.Close; FDQuery2.SQL.Clear;
            FDQuery2.SQL.Add('Select * from Alarm');
            FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
            FDQuery2.SQL.Add('And EndTime Is Null');
            FDQuery2.SQL.Add('And ErrCode = :Msg');
            FDQuery2.SQL.Add('Order by StartTime desc');
            FDQuery2.ParamByName('Msg').AsString := ErrTitle+' '+ErrMessage;
            FDQuery2.Open;

            if FDQuery2.RecordCount = 0 then
            begin
              FDQuery2.Close; FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime,  CheckTime)');
              FDQuery2.SQL.Add('Values('+FieldByName('ControllerID').AsString+','+#39+ErrTitle+' '+ErrMessage+#39+',GETDATE(),GETDATE())');
              FDQuery2.ExecSQL;
              PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
            end
            else if FDQuery2.FieldByName('CheckTime').AsDateTime + (1/86400)*60*30 < Now then
            begin
              FDQuery2.Close; FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add('Update Alarm Set CheckTime = GETDATE()');
              FDQuery2.SQL.Add('Where ControllerID = '+FieldByName('ControllerID').AsString);
              FDQuery2.SQL.Add('And EndTime Is Null');
              FDQuery2.SQL.Add('And ErrCode = :Msg');
              FDQuery2.ParamByName('Msg').AsString := ErrTitle+' '+ErrMessage;
              FDQuery2.ExecSQL;
              PushMessageSend(ErrTitle ,ErrMessage , FieldByName('MasterID').AsString);
            end;
          end;
        end;

        Next;
      end;
    end;
  finally
    Timer1.Enabled := True;
  end;






end;

end.
