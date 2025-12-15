program DongHwa;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDongHwa in 'uDongHwa.pas' {fDongHwa},
  FMX.WaitDialog in 'FMX.WaitDialog.pas' {WaitDialog: TFrame},
  uSPLASH in 'uSPLASH.pas' {fSPLASH};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfSPLASH, fSPLASH);
  Application.Run;
end.

