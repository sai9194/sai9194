program pDongHwa_Alarm;

uses
  Vcl.Forms,
  uDongHwa_Alarm in 'uDongHwa_Alarm.pas' {fDongHwa_Alarm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfDongHwa_Alarm, fDongHwa_Alarm);
  Application.Run;
end.
