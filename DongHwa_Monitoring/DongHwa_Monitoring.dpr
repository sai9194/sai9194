program DongHwa_Monitoring;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDongHwa in 'uDongHwa.pas' {fDongHwa},
  FMX.WaitDialog in 'FMX.WaitDialog.pas' {WaitDialog: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfDongHwa, fDongHwa);
  Application.Run;
end.

