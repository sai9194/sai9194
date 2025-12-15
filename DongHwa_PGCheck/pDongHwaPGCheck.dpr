program pDongHwaPGCheck;

uses
  Vcl.Forms,
  uDongHwaPGCheck in 'uDongHwaPGCheck.pas' {fDongHwaPGCheck};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfDongHwaPGCheck, fDongHwaPGCheck);
  Application.Run;
end.
