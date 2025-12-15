program DongHwaPC;

uses
  Vcl.Forms,
  uDetail in 'uDetail.pas' {fDetail},
  uDongHwa in 'uDongHwa.pas' {fDongHwa},
  PROGRESSBAR in 'PROGRESSBAR.pas' {fPROGRESSBAR},
  uStall in 'uStall.pas' {fStall};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfDongHwa, fDongHwa);
  Application.CreateForm(TfDetail, fDetail);
  Application.CreateForm(TfDongHwa, fDongHwa);
  Application.CreateForm(TfPROGRESSBAR, fPROGRESSBAR);
  Application.CreateForm(TfStall, fStall);
  Application.Run;
end.
