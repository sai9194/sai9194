program pDongHwaServer;

uses
  Vcl.Forms,
  uDongHwaServer in 'uDongHwaServer.pas' {fDongHwaServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfDongHwaServer, fDongHwaServer);
  Application.Run;
end.
