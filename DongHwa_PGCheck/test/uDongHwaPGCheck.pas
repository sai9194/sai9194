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
  dxSkinXmas2008Blue, cxGroupBox, cxRadioGroup;

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
    FDQuery1: TUniQuery;
    FDQuery22: TUniQuery;
    FDQueryStateCheck: TUniQuery;
    cxRGroup_Division: TcxRadioGroup;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDongHwaPGCheck: TfDongHwaPGCheck;
  AlarmCount : Integer;
  KillCheckCount : Integer;

implementation

{$R *.dfm}

procedure TfDongHwaPGCheck.Button1Click(Sender: TObject);
begin
  TimerHide.Enabled := True;
end;

procedure TfDongHwaPGCheck.Button2Click(Sender: TObject);
begin
//  cxRGroup_Division.Properties.Items[cxRGroup_Division.ItemIndex].Caption;
  KillProcess(FindWindow('TfDongHwaServer',nil));
  KillCheckCount := 1;
  FDQuery22.Close;
  FDQuery22.SQL.Clear;
  FDQuery22.SQL.Add('Insert Into Send(Number, Message)');
  FDQuery22.SQL.Add('Values(1,'+#39+'동화서버 강제 Kill TEST'+#39+')');
  FDQuery22.ExecSQL;
  Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + '동화서버 강제 Kill');
end;

procedure TfDongHwaPGCheck.cxRGroup_DivisionPropertiesEditValueChanged(
  Sender: TObject);
begin
  if cxRGroup_Division.ItemIndex = 0 then
  begin
    TimerStateCheck.Enabled := true;
    Button2.Enabled := true;
  end
  else
  begin
    TimerStateCheck.Enabled := false;
    Button2.Enabled := false;
  end;
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
  if Memo1.Lines.Count > 100 then
  begin
    Memo1.Clear;
  end;  

  if cxRGroup_Division.ItemIndex = 0 then
  begin
    FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('Update ServerState set CheckDate = GETDATE()');
    FDQuery1.SQL.Add('Where Num = 1');
    FDQuery1.SQL.Add('And Machine = ''CheckPG''');

    if processExists('pDongHwaServer.exe') then
    begin
      FDQuery1.SQL.Add('Update ServerState set CheckDate = GETDATE()');
      FDQuery1.SQL.Add('Where Num = 1');
      FDQuery1.SQL.Add('And Machine = ''ServerPG''');
    end else
    begin
      Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + ' ServerPG 재실행!');
      sPath := TPath.GetDocumentsPath + '\pDongHwaServer.exe';
      ShellExecute(self.Handle,PChar('OPEN'),PChar(sPath),nil,nil,SW_SHOWMAXIMIZED);
      Application.ProcessMessages;
      FDQuery22.Close;
      FDQuery22.SQL.Clear;
      FDQuery22.SQL.Add('Insert Into Send(Number, Message)');
      FDQuery22.SQL.Add('Values(1,'+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)+'=동화 ServerPG 재실행됨!'+#39+')');
      FDQuery22.ExecSQL;
    end;

  end
  else
  begin

    if processExists('pDongHwa_Alarm.exe') then
    begin
      FDQuery1.SQL.Add('Update ServerState set CheckDate = GETDATE()');
      FDQuery1.SQL.Add('Where Num = 1');
      FDQuery1.SQL.Add('And Machine = ''AlarmPG''');
    end else
    begin
      Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + ' AlarmPG 재실행!');
      sPath := TPath.GetDocumentsPath + '\pDongHwa_Alarm.exe';
      ShellExecute(self.Handle,PChar('OPEN'),PChar(sPath),nil,nil,SW_SHOWMAXIMIZED);
      Application.ProcessMessages;
      FDQuery22.Close;
      FDQuery22.SQL.Clear;
      FDQuery22.SQL.Add('Insert Into Send(Number, Message)');
      FDQuery22.SQL.Add('Values(1,'+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)+'=동화 AlarmPG 재실행됨!'+#39+')');
      FDQuery22.ExecSQL;
    end;
  end;

  FDQuery1.ExecSQL;
end;

procedure TfDongHwaPGCheck.TimerHideTimer(Sender: TObject);
begin
  TimerHide.Enabled := False;
  Hide();
  WindowState := wsMinimized;
  TrayIcon1.Visible := True;
end;

procedure TfDongHwaPGCheck.TimerStateCheckTimer(Sender: TObject);
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
      FDQuery22.Close;
      FDQuery22.SQL.Clear;
      FDQuery22.SQL.Add('Insert Into Send(Number, Message)');
      FDQuery22.SQL.Add('Values(1,'+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('CheckDate').AsDateTime)+'=동화서버 동작 중지??'+#39+')');
      FDQuery22.ExecSQL;
      AlarmCount := AlarmCount + 10;

      KillCheckCount := KillCheckCount + 1;
      if KillCheckCount > 5 then
      begin
        KillProcess(FindWindow('TfDongHwaServer',nil));
        KillCheckCount := 1;
        FDQuery22.Close;
        FDQuery22.SQL.Clear;
        FDQuery22.SQL.Add('Insert Into Send(Number, Message)');
        FDQuery22.SQL.Add('Values(1,'+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('CheckDate').AsDateTime)+'동화서버 강제 Kill'+#39+')');
        FDQuery22.ExecSQL;
        Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) + '동화서버 강제 Kill');
      end;
    end else
    begin
      AlarmCount := 1;
      KillCheckCount := 1;
    end;
  end;
end;

procedure TfDongHwaPGCheck.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show;
end;



end.
