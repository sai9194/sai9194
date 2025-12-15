unit uDongHwaPGCheck;

interface

uses
  TlHelp32, shellApi, System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, UniProvider,
  SQLServerUniProvider, DBAccess, Uni, MemDS, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxGroupBox, cxRadioGroup, PsAPI;

type
  TfDongHwaPGCheck = class(TForm)
    Timer1: TTimer;
    FDConnection_1: TFDConnection;
    Memo1: TMemo;
    TrayIcon1: TTrayIcon;
    TimerHide: TTimer;
    Button1: TButton;
    FDConnection_22: TFDConnection;
    TimerStateCheck: TTimer;
    Button2: TButton;
    UniConnection: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    UniConnection22: TUniConnection;
    FDQueryStateCheck: TUniQuery;
    cxRGroup_Division: TcxRadioGroup;
    uq1_Send: TUniQuery;
    uq1_State: TUniQuery;
    uq_StateCheck_send: TUniQuery;
    procedure Timer1Timer(Sender: TObject);
    function processExists(exeFileName: string): Boolean;
    procedure TimerHideTimer(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TimerStateCheckTimer(Sender: TObject);
    procedure KillProcess(hWindowHandle: HWND);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cxRGroup_DivisionPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FAppStartTime: TDateTime;  // 프로그램 시작 시간 저장
  public
    { Public declarations }
    procedure HandleException(Sender: TObject; E: Exception);
  end;

var
  fDongHwaPGCheck: TfDongHwaPGCheck;
  AlarmCount : Integer;
  KillCheckCount : Integer;
  NowTime: TTime; //현재시간  새벽3시~ 20분 백업하면 db업뎃중지

implementation

{$R *.dfm}

procedure TfDongHwaPGCheck.Button1Click(Sender: TObject);
begin
 // TimerHide.Enabled := True;
   Hide();
   WindowState := wsMinimized;
   TrayIcon1.Visible := True;
end;

procedure TfDongHwaPGCheck.Button2Click(Sender: TObject);
begin
//  cxRGroup_Division.Properties.Items[cxRGroup_Division.ItemIndex].Caption;
  if cxRGroup_Division.ItemIndex = 0 then
  begin
    KillProcess(FindWindow('TfDongHwaServer',nil));
    KillCheckCount := 1;
    uq_StateCheck_send.Close;
    uq_StateCheck_send.SQL.Clear;
    uq_StateCheck_send.SQL.Add('Insert Into Send(Number, Message)');
    uq_StateCheck_send.SQL.Add('Values(1,'+#39+'동화서버 강제 Kill TEST'+#39+')');
    uq_StateCheck_send.ExecSQL;
    Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + '동화서버 강제 Kill');
    FAppStartTime := Now;
  end
  ELSE
  BEGIN
    KillProcess(FindWindow('TfDongHwa_Alarm',nil));
    KillCheckCount := 1;
    uq_StateCheck_send.Close;
    uq_StateCheck_send.SQL.Clear;
    uq_StateCheck_send.SQL.Add('Insert Into Send(Number, Message)');
    uq_StateCheck_send.SQL.Add('Values(1,'+#39+'동화알람 강제 Kill TEST'+#39+')');
    uq_StateCheck_send.ExecSQL;
    Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + '동화알람 강제 Kill');
  end;
end;

procedure TfDongHwaPGCheck.cxRGroup_DivisionPropertiesEditValueChanged(
  Sender: TObject);
begin
//  if cxRGroup_Division.ItemIndex = 0 then
//  begin
//    TimerStateCheck.Enabled := true;
//    Button2.Enabled := true;
//  end
//  else
//  begin
//    TimerStateCheck.Enabled := false;
//    Button2.Enabled := false;
//  end;
end;

procedure TfDongHwaPGCheck.FormCreate(Sender: TObject);
begin
  Application.OnException := HandleException;
  FAppStartTime := Now;       // 현재 시간을 시작 시간으로 저장
end;

procedure TfDongHwaPGCheck.FormShow(Sender: TObject);
begin
  AlarmCount := 1;
  KillCheckCount := 1;
end;

procedure TfDongHwaPGCheck.KillProcess(hWindowHandle: HWND);
var
  hprocessID: INTEGER;
  processHandle: THandle;
  DWResult: DWORD;
begin
//  SendMessageTimeout(hWindowHandle, WM_CLOSE, 0, 0, SMTO_ABORTIFHUNG or SMTO_NORMAL, 5000, DWResult);
  if isWindow(hWindowHandle) then
  begin
    GetWindowThreadProcessID(hWindowHandle, @hprocessID);
    if hprocessID <> 0 then
    begin
      processHandle := OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, False, hprocessID);
      if processHandle <> 0 then
      begin
        TerminateProcess(processHandle, 0);
        CloseHandle(ProcessHandle);
      end;
    end;
  end;
end;

function TfDongHwaPGCheck.processExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TfDongHwaPGCheck.Timer1Timer(Sender: TObject);
var
  sPath : String;
begin
  Timer1.Enabled := False;
  NowTime := Time;

  // 7일 이상 지났고(&&), 아직 실행하지 않았다면 실행
  if (Now - FAppStartTime) >= 7 then
  begin
    Memo1.Lines.Add('--------------------------------------------------');
    Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' : 7일 경과하여 강제 종료 실행');

    // Button2Click 이벤트를 강제로 호출 (Sender는 Button2로 지정)
    Button2Click(self);

  end;


  try
    if Memo1.Lines.Count > 10 then
    begin
      Memo1.Clear;
    end;

    if not ((NowTime >= EncodeTime(3, 0, 0, 0)) and(NowTime <= EncodeTime(3, 20, 0, 0))) then
    begin
      if cxRGroup_Division.ItemIndex = 0 then
      begin
        uq1_State.Close;
        uq1_State.SQL.Clear;
        uq1_State.SQL.Add('Update ServerState  set CheckDate = GETDATE()');
        uq1_State.SQL.Add('Where Num = 1');
        uq1_State.SQL.Add('And Machine = ''CheckPG''');

        if processExists('pDongHwaServer.exe') then
        begin
          uq1_State.SQL.Add('Update ServerState  set CheckDate = GETDATE()');
          uq1_State.SQL.Add('Where Num = 1');
          uq1_State.SQL.Add('And Machine = ''ServerPG''');
        end
        else
        begin
          Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + ' ServerPG 재실행!');
          sPath := TPath.GetDocumentsPath + '\pDongHwaServer.exe';
          ShellExecute(self.Handle,PChar('OPEN'),PChar(sPath),nil,nil,SW_SHOWMAXIMIZED);
          Application.ProcessMessages;
          uq1_Send.Close;
          uq1_Send.SQL.Clear;
          uq1_Send.SQL.Add('Insert Into Send(Number, Message)');
          uq1_Send.SQL.Add('Values(1,'+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)+'=동화 ServerPG 재실행됨!'+#39+')');
          uq1_Send.ExecSQL;
        end;
      end
      else
      begin
        if processExists('pDongHwa_Alarm.exe') then
        begin
          uq1_State.Close;
          uq1_State.SQL.Clear;
          uq1_State.SQL.Add('Update ServerState set CheckDate = GETDATE()');
          uq1_State.SQL.Add('Where Num = 1');
          uq1_State.SQL.Add('And Machine = ''AlarmPG''');
        end
        else
        begin
          Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + ' AlarmPG 재실행!');
          sPath := TPath.GetDocumentsPath + '\pDongHwa_Alarm.exe';
          ShellExecute(self.Handle,PChar('OPEN'),PChar(sPath),nil,nil,SW_SHOWMAXIMIZED);
          Application.ProcessMessages;
          uq1_Send.Close;
          uq1_Send.SQL.Clear;
          uq1_Send.SQL.Add('Insert Into Send(Number, Message)');
          uq1_Send.SQL.Add('Values(1,'+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)+'=동화 AlarmPG 재실행됨!'+#39+')');
          uq1_Send.ExecSQL;
        end;
      end;
      uq1_State.ExecSQL;
    end;
  finally
    Timer1.Enabled := true;
  end;
end;

procedure TfDongHwaPGCheck.TimerHideTimer(Sender: TObject);
begin
//  TimerHide.Enabled := False;
//  Hide();
//  WindowState := wsMinimized;
//  TrayIcon1.Visible := True;
end;

procedure TfDongHwaPGCheck.TimerStateCheckTimer(Sender: TObject);
begin
  NowTime := Time;
  if not ((NowTime >= EncodeTime(3, 0, 0, 0)) and(NowTime <= EncodeTime(3, 20, 0, 0))) then
  begin
    if cxRGroup_Division.ItemIndex = 0 then
    begin
      with FDQueryStateCheck do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select CheckDate from ServerState');
        SQL.Add('Where Num = 1 And Machine = ''State''');
        Open;
                                                   // 0.1초     // 3초
        if FieldByName('CheckDate').AsDateTime + (0.0000011574 * 30 * AlarmCount) < Now then
        begin
          uq_StateCheck_send.Close;
          uq_StateCheck_send.SQL.Clear;
          uq_StateCheck_send.SQL.Add('Insert Into Send(Number, Message)');
          uq_StateCheck_send.SQL.Add('Values(1,'+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('CheckDate').AsDateTime)+'=동화서버 동작 중지??'+#39+')');
          uq_StateCheck_send.ExecSQL;
          AlarmCount := AlarmCount + 10;

          KillCheckCount := KillCheckCount + 1;
          if KillCheckCount > 5 then
          begin
            KillProcess(FindWindow('TfDongHwaServer',nil));
            KillCheckCount := 1;
            uq_StateCheck_send.Close;
            uq_StateCheck_send.SQL.Clear;
            uq_StateCheck_send.SQL.Add('Insert Into Send(Number, Message)');
            uq_StateCheck_send.SQL.Add('Values(1,'+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('CheckDate').AsDateTime)+'동화서버 강제 Kill'+#39+')');
            uq_StateCheck_send.ExecSQL;
            Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + '동화서버 강제 Kill');
          end;
        end
        else
        begin
          AlarmCount := 1;
          KillCheckCount := 1;
        end;
      end;
    end;
  end;
end;

procedure TfDongHwaPGCheck.HandleException(Sender: TObject; E: Exception);
begin
  Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss ',Now) + ' HE : '+e.Message);
end;

procedure TfDongHwaPGCheck.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show;
end;



end.
