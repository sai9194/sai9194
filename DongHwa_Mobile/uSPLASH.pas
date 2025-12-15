unit uSPLASH;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TfSPLASH = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSPLASH: TfSPLASH;

implementation

{$R *.fmx}

uses uDongHwa;

procedure TfSPLASH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  fSPLASH := Nil;
end;

procedure TfSPLASH.FormShow(Sender: TObject);
begin
  Timer1.Interval := 1500;
  Timer1.Enabled := True;
//  Image2.Opacity := 0;

//  Image2.AnimateFloat('Opacity',1,0.8);
//  Image2.AnimateFloatDelay('Position.Y',0, 0.3, 0.9, TAnimationType.&In, TInterpolationType.Back);
end;

procedure TfSPLASH.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  if not Assigned(fDongHwa) then
    Application.CreateForm(TfDongHwa, fDongHwa);

  Application.MainForm := fDongHwa;
  fDongHwa.Show;

  fSPLASH.Close;
end;

end.
