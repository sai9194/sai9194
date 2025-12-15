program 동화전자;

uses
  Vcl.Forms,
  Windows,
  SplashUnit in 'SplashUnit.pas' {SplashForm};

{$R *.res}
const
  MutexName = 'Alpo_Splash';

var
  Mutex: THandle;

begin
  Mutex := OpenMutex(MUTEX_ALL_ACCESS, False, MutexName);

  if Mutex <> 0 then Exit;

  try
    Mutex := CreateMutex(Nil, True, MutexName);

    if (GetLastError = ERROR_ALREADY_EXISTS)
      or (WaitForSingleObject(Mutex,100) = WAIT_TIMEOUT)
      or (Mutex = 0) then
    begin
      Application.Terminate;
      Exit;
    end;

    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TSplashForm, SplashForm);
    Application.Run;
  finally
    CloseHandle(Mutex);
  end;
end.
