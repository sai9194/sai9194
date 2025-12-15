unit SplashUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxProgressBar, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, cxLabel, dxGDIPlusClasses, cxImage, cxGroupBox, System.IniFiles,
  System.IOUtils, ShellApi, IdGlobal, Vcl.ExtCtrls, WinInet, System.Types,
  TlHelp32, IdFTPList, IdFTPListTypes, IdFTPCommon, IdFTPListParseBase,
  IdFTPListParseWindowsNT, PNGImage, JPEG, GIFImg, System.UITypes, dxSkinBasic,
  dxSkinOffice2019Black, dxSkinOffice2019DarkGray, dxSkinOffice2019White;

type
  TSplashForm = class(TForm)
    cxGBoxSplash: TcxGroupBox;
    cxImageLogo: TcxImage;
    cxLabelInfo: TcxLabel;
    IdFTP: TIdFTP;
    cxProgressBar: TcxProgressBar;
    Timer: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure SetPathVariable;  // 경로설정
    function CheckNeedToUpdate: Boolean;   // 업데이트체크
    function ConnectAndCheckIdftp: Boolean;   // FTP 체크
    procedure UpdateProgram;           // UPDATE실행
    procedure ExecuteProgram;          // EXE실행
    procedure Wait(Proc: TProc);       // 스레드
    function isInternetConnected: Boolean;  // 인터넷체크
    function FTPDirExists(DirName: string; IdFTPComp: TIdFTP): Boolean;  // FTP 경로존재유무
    function FTPFileExists(FileName: string; IdFTPComp: TIdFTP): Boolean;  // FTP 파일존재유무
    function GetProcessID(Process: String): Cardinal;  // 실행ProcessID 가져옴.
    function kill_Process(pid: string): string;       // Process강제종료
  public
    { Public declarations }
  end;

const
  ProgramName = 'DongHwaPC'; // <---- 실행파일 이름(프로그램 이름) 대소문자 구분해야함.
  FtpHost     = '211.205.9.2';
  FtpUserName = 'ksh8608';
  FtpPassword = 'k3025875k^^';

var
  SplashForm: TSplashForm;
  ProgramFolderPath, ServerVersionIniPath, ClientEnvIniPath, ProgramPath,
    ServerVersion, ClientVersion: string;

implementation

{$R *.dfm}

// 폼 이벤트 ===================================================================
procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  SplashForm := nil;
end;

procedure TSplashForm.FormShow(Sender: TObject);
begin
  // GIF 이미지 가속화
  TdxGPImage(cxImageLogo.Picture.Graphic).AnimationFrameDelay := 50;
  // 경로설정
  SetPathVariable;
  // 업데이트 및 실행
  Timer.Enabled := True;
end;

// FTP 서버측 폴더 유무 체크 함수
function TSplashForm.FTPDirExists(DirName: string; IdFTPComp: TIdFTP): Boolean;
var
  list: TStringList;
  i: Integer;
begin
  list := TStringList.Create;
  Result := False;
  try
    IdFTPComp.List(nil);
    for i := 0 to IdFTPComp.DirectoryListing.Count - 1 do
    begin
      if IdFTPComp.DirectoryListing.Items[i].ItemType = ditDirectory then
        list.add(IdFTPComp.DirectoryListing.Items[i].FileName);
    end;
    Result := (list.IndexOf(DirName) > -1);
  finally
    list.Free;
  end;
end;

// FTP 서버측 파일 유무 체크 함수
function TSplashForm.FTPFileExists(FileName: string; IdFTPComp: TIdFTP): Boolean;
var
  list: TStringList;
  i: Integer;
begin
  list := TStringList.Create;
  Result := False;
  try
    IdFTPComp.List(list, '', false);
    for i := 0 to list.Count - 1 do
    begin
      if List.Strings[i] = FileName then
      begin
        Result := True;
        Break;
      end;
    end;
  finally
    list.Free;
  end;
end;

// 프로세스의 ID값 체크
function TSplashForm.GetProcessID(Process: String): Cardinal;
const PROCESS_TERMINATE=$0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  result:=0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle,FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(Process))
    or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(Process))) then
    begin
      Result := FProcessEntry32.th32ProcessID;;
      exit;
    end else begin
      Result:=0;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

// 타이머
procedure TSplashForm.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  // 인터넷 연결 체크
  if not isInternetConnected then
  begin
    showmessage('인터넷 연결이 되어있지 않습니다.');
    Application.Terminate;
    Exit;
  end;

  if CheckNeedToUpdate then
  begin
    UpdateProgram;
    ExecuteProgram;
  end
  else
  begin
    ExecuteProgram;
  end;

  SplashForm.Close;
end;

// IdFtp 이벤트 ================================================================
procedure TSplashForm.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  cxProgressBar.Position := AWorkCount;
end;

// 프로그램 실행 & 업데이트 관련 기능 ==========================================
// 위치 변수 Set
procedure TSplashForm.SetPathVariable;
begin
  // 프로그램 폴더 위치 - C:\ProgramData\프로그램 이름
  ProgramFolderPath := TPath.GetPublicPath + '\' + ProgramName;

  // 프로그램 설치 폴더 위치 - C:\ProgramData\프로그램 이름\프로그램 이름.exe
  ProgramPath := ProgramFolderPath + '\' + ProgramName + '.exe';

  // ServerVersion.ini, ClientEnv.ini 위치
  // C:\ProgramData\ServerVersion.ini, C:\ProgramData\clientEnv.ini
  ServerVersionIniPath := ProgramFolderPath + '\ServerVersion.ini';
  ClientEnvIniPath     := ProgramFolderPath + '\ClientEnv.ini';

  ServerVersion := '';
  ClientVersion := '';
end;

// 업데이트 필요 여부 확인
function TSplashForm.CheckNeedToUpdate: Boolean;
var
  ServerVersionFile, ClientEnvFile: TIniFile;
begin
  Result := True;

  // 설치 폴더 가 없으면 종료 (업데이트 필요)
  if not DirectoryExists(ProgramFolderPath) then
  begin
    Result := True;
    Exit;
  end;

  // 실행 파일이 없으면 종료 (설치 필요)
  if not FileExists(ProgramPath) then
  begin
    Result := True;
    Exit;
  end;

  // Ftp 연결 및 연결 확인
  if ConnectAndCheckIdftp then
  begin
    // FTP서버의 파일이 존재하는지 체크
    if FTPFileExists('ServerVersion.ini', IdFTP) then
    begin
      // ServerVersion.ini 가져와서 ClientEnv.ini와 Version 비교
      IdFTP.Get('ServerVersion.ini', ServerVersionIniPath, True);
      ServerVersionFile := TIniFile.Create(ServerVersionIniPath);
      try
        ServerVersion := ServerVersionFile.ReadString('VersionInfo', 'Version', '');
      finally
        ServerVersionFile.DisposeOf;
      end;

      ClientEnvFile := TIniFile.Create(ClientEnvIniPath);
      try
        ClientVersion := ClientEnvFile.ReadString('VersionInfo', 'Version', '');
      finally
        ClientEnvFile.DisposeOf;
      end;

      if ServerVersion = ClientVersion then
      begin
        Result := False;
      end
      else
      begin
        Result := True;
      end;
    end
    // 존재하지 않으면 그냥 실행.
    else
    begin
      ShowMessage('서버에 버전정보가 존재하지 않습니다.'+#13+'관리자에게 문의하세요.');
      Result := False;
      Exit;
    end;
  end
  else
    Result := False;
end;

// Ftp 연결 및 연결 확인
function TSplashForm.ConnectAndCheckIdftp: Boolean;
begin
  Result := False;
  // FTP 디렉토리 이름 상수값 체크
  if (ProgramName <> '') then
  begin
    // FTP 체크
    if IdFTP.Connected then
    begin
      Result := True;
    end
    else
    begin
      // FTP 연결 정보 Set
      IdFTP.Host      := FtpHost;
      IdFTP.Username  := FtpUserName;
      IdFTP.Password  := FtpPassword;

      // FTP 연결 & 폴더 이동
      try
        IdFTP.Connect;
        IdFTP.IOHandler.DefStringEncoding := IndyTextEncoding(949);
        // 경로존재 체크
        if FTPDirExists(ProgramName, IdFTP) then
        begin
          IdFTP.ChangeDir(ProgramName);
          Result := True;
        end
        else
        begin
          ShowMessage('서버에 실행 경로가 존재하지 않습니다.'+#13+'관리자에게 문의하세요.');
          Result := False;
          Exit;
        end;
      except on e:Exception do
        begin
          MessageDlg('업데이트 서버에 접속할 수 없습니다. 관리자에게 문의하세요.',
            mtError, [mbOK], 0);
          Result := False;
          Exit;
        end;
      end;
    end;
  end;
end;

// 프로그램 업데이트
procedure TSplashForm.UpdateProgram;
var
  ServerVersionFile, ClientEnvFile: TIniFile;
  IsDownloadComplete: Boolean;
begin
  if ConnectAndCheckIdftp then
  begin
    // FTP에 INI파일 존재하는지 체크
    if not FTPFileExists('ServerVersion.ini', IdFTP) then
    begin
      ShowMessage('서버에 버전정보가 존재하지 않습니다.'+#13+'관리자에게 문의하세요.');
      Exit;
    end;

    // FTP에 EXE파일 존재하는지 체크
    if FTPFileExists(ProgramName+'.exe', IdFTP) then
    begin

      // 설치시작
      cxLabelInfo.Caption := '프로그램을 설치 중 입니다.';
      cxProgressBar.Properties.Max := IdFTP.Size(ProgramName + '.exe');
      cxProgressBar.Visible := True;
      SplashForm.Update;

      // 설치 폴더 확인 & ServerVersionIni 파일 가져오기
      if not FileExists(ProgramFolderPath) then
      begin
        ForceDirectories(ProgramFolderPath);
        IdFTP.Get('ServerVersion.ini', ServerVersionIniPath, True);
        ServerVersionFile := TIniFile.Create(ServerVersionIniPath);
        try
          ServerVersion := ServerVersionFile.ReadString('VersionInfo', 'Version', '');
        finally
          ServerVersionFile.DisposeOf;
        end;
      end;

      if FileExists(ProgramPath) then
      begin
        DeleteFile(ProgramPath);
      end;
      // exe 설치
      Wait(procedure()
            begin
              try
                IdFTP.Get(ProgramName + '.exe', ProgramPath, True);
                IsDownloadComplete := True;
              except
                IsDownloadComplete := False;
              end;
            end);

      // ClientEnv.ini Version 업데이트
      if IsDownloadComplete then
      begin
        ClientEnvFile := TIniFile.Create(ClientEnvIniPath);
        try
          ClientEnvFile.WriteString('VersionInfo', 'Version', ServerVersion);
        finally
          ClientEnvFile.DisposeOf;
        end;
      end;

    end
    else
    begin
      ShowMessage('서버에 업데이트파일이 존재하지 않습니다.');
      Exit;
    end;
  end;
end;

// 프로그램 실행
procedure TSplashForm.ExecuteProgram;
begin
  // 경로 디렉토리 존재 유무 체크
  if DirectoryExists(ProgramFolderPath) then
  begin
    // 경로에 파일 존재 유무 체크
    if FileExists(ProgramPath) then
    begin
      try
        ShellExecute(Handle, 'OPEN', PChar(ProgramPath), nil, nil, SW_NORMAL);
      except
        on e:exception do
        begin
          ShowMessage('실행오류');
        end;
      end;
      Exit;
    end
    else
    begin
      ShowMessage('실행 파일이 존재하지 않습니다.');
      Exit;
    end;
  end
  else
  begin
    ShowMessage('실행 경로가 존재하지 않습니다.');
    Exit;
  end;
end;

// 스레드
procedure TSplashForm.Wait(Proc: TProc);
var
  Thread: TThread;
begin
  Thread := TThread.CreateAnonymousThread(
    procedure()
    begin
      Proc;
    end);
  Thread.FreeOnTerminate := True;
  Thread.Start;

  while not Thread.Finished do Application.ProcessMessages;
end;

// 인터넷 연결 체크
function TSplashForm.isInternetConnected: Boolean;
var
  dwFlags : DWORD;
begin
  Result := InternetGetConnectedState(@dwFlags, 0);
end;

// 강제 프로세스 종료
function TSplashForm.kill_Process(pid: string): string;
var
  killer: THandle;
  code: string;
begin
  code := '';
  killer := OpenProcess(PROCESS_TERMINATE, FALSE, StrToInt(pid));

  if TerminateProcess(killer, 0) then
  begin
    code := '[+] Kill Process : OK';
  end
  else
  begin
    code := '[-] Kill Process : ERROR';
  end;
end;

end.
