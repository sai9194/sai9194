unit uStall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCurrencyEdit, cxGroupBox, cxRadioGroup, cxLabel,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Data.DB, MemDS, DBAccess, Uni,
  cxDBData, cxGridDBTableView;

type
  TfStall = class(TForm)
    cxGBox_Stall: TcxGroupBox;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxBtn_StallClose: TcxButton;
    cxLabel1: TcxLabel;
    cxRGroup_Type: TcxRadioGroup;
    cxCEdit_Time: TcxCurrencyEdit;
    cxCEdit_TimeSum: TcxCurrencyEdit;
    cxGrid_St: TcxGrid;
    cxGridTv_St: TcxGridTableView;
    cxGridTv_St_Serial: TcxGridColumn;
    cxGridTv_St_lsindRegistNo: TcxGridColumn;
    cxGridTv_St_itemCode: TcxGridColumn;
    cxGridTv_St_makrId: TcxGridColumn;
    cxGridTv_St_eqpmnCode: TcxGridColumn;
    cxGridTv_St_eqpmnEsntlSn: TcxGridColumn;
    cxGridTv_St_eqpmnNo: TcxGridColumn;
    cxGridTv_St_stallTyCode: TcxGridColumn;
    cxGridTv_St_stallNo: TcxGridColumn;
    cxGridTv_St_roomNo: TcxGridColumn;
    cxGridTv_St_roomDtlNo: TcxGridColumn;
    cxGridLv_St: TcxGridLevel;
    UniQuery_Stall_S: TUniQuery;
    UniSP_Save: TUniStoredProc;
    cxBtn_Stall_Del: TcxButton;
    UniQuery_Stall_D: TUniQuery;
    UniQuery_all: TUniQuery;
    cxGroupBox1: TcxGroupBox;
    cxGrid_D: TcxGrid;
    cxGridLv_D: TcxGridLevel;
    DataSource1: TDataSource;
    cxGridDBTv_D: TcxGridDBTableView;
    cxGridDBTv_DSerial: TcxGridDBColumn;
    cxGridDBTv_DlsindRegistNo: TcxGridDBColumn;
    cxGridDBTv_DitemCode: TcxGridDBColumn;
    cxGridDBTv_DmakrId: TcxGridDBColumn;
    cxGridDBTv_DeqpmnCode: TcxGridDBColumn;
    cxGridDBTv_DeqpmnEsntlSn: TcxGridDBColumn;
    cxGridDBTv_DeqpmnNo: TcxGridDBColumn;
    cxGridDBTv_DstallTyCode: TcxGridDBColumn;
    cxGridDBTv_DstallNo: TcxGridDBColumn;
    cxGridDBTv_DroomNo: TcxGridDBColumn;
    cxGridDBTv_DroomDtlNo: TcxGridDBColumn;
    cxGridDBTv_DLinkcycle: TcxGridDBColumn;
    cxGridDBTv_DLinkcycleType: TcxGridDBColumn;
    cxGridDBTv_DWDT: TcxGridDBColumn;
    cxButton2: TcxButton;
    cxGridDBTv_DLoginID: TcxGridDBColumn;
    cxGridDBTv_DName: TcxGridDBColumn;
    cxGridDBTv_DControllerName: TcxGridDBColumn;
    cxGridTv_St_LoginID: TcxGridColumn;
    cxGridTv_St_Name: TcxGridColumn;
    cxGridTv_St_ControllerName: TcxGridColumn;
    cxStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGridTv_St_SerialNo: TcxGridColumn;
    cxGridDBTv_DSerialNo: TcxGridDBColumn;
    procedure cxCEdit_TimePropertiesEditValueChanged(Sender: TObject);
    procedure cxBtn_StallCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxBtn_Stall_DelClick(Sender: TObject);
    procedure cxGridDBTv_DCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    function SaveStall: Boolean;
    function DelStall: Boolean;
  public
    { Public declarations }
    LoginID, CName, ControllerName, Serial, SerialNo : string;
  end;

var
  fStall: TfStall;

implementation

{$R *.dfm}

uses uDongHwa;
// 250414 김동휘 추가(축산)
procedure TfStall.cxBtn_StallCloseClick(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure TfStall.cxBtn_Stall_DelClick(Sender: TObject);
begin
  if cxGridTv_St.DataController.RecordCount = 0         then exit;
  if trim(vartostr(cxGridTv_St_Serial.EditValue)) ='' then exit;

  if (MessageDlg('삭제 하시겠습니까?', mtWarning, [mbYes, mbNo], 0) = mrYes)  then
  begin
    if DelStall then
    begin
      try
        cxGridTv_St.DataController.BeginUpdate;
        cxGridTv_St.DataController.RecordCount := 0;
        cxGridTv_St.DataController.AppendRecord;
      finally
        cxGridTv_St.DataController.endupdate;
      end;
      showMessage('삭제했습니다.');
      cxButton2Click(SELF);
    end;
  end;
end;

procedure TfStall.cxButton1Click(Sender: TObject);
begin
  cxButton2Click(self);
  if cxGridTv_St.DataController.RecordCount = 0         then exit;
  if trim(vartostr(cxGridTv_St_Serial.EditValue)) ='' then exit;
  if (MessageDlg('저장 하시겠습니까?', mtWarning, [mbYes, mbNo], 0) = mrYes)  then
  begin
    if SaveStall then
    begin
      ShowMessage('저장했습니다.');
      cxButton2Click(SELF);
    end;
  end;
end;

procedure TfStall.cxButton2Click(Sender: TObject);
begin
  if UniQuery_all.Active = TRUE then
  BEGIN
    UniQuery_all.Refresh;
  END
  else
  begin
    UniQuery_all.Close;
    UniQuery_all.Open;
  end;
end;

procedure TfStall.cxCEdit_TimePropertiesEditValueChanged(Sender: TObject);
var
  InputValue: Currency;
  ConvertedSeconds: Integer;
begin
 // TcxCurrencyEdit(sender).PostEditValue;
  InputValue := cxCEdit_Time.Value;
  case cxRGroup_Type.ItemIndex of
    0: ConvertedSeconds := Round(InputValue * 3600);
    1: ConvertedSeconds := Round(InputValue * 60);
    2: ConvertedSeconds := Round(InputValue);
  else
    ConvertedSeconds := Round(InputValue);
  end;

  cxCEdit_TimeSum.Value := ConvertedSeconds;
end;

procedure TfStall.cxGridDBTv_DCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin

  cxGridTv_St_LoginID.EditValue         := cxGridDBTv_DLoginID.EditValue;
  cxGridTv_St_Name.EditValue            := cxGridDBTv_DName.EditValue;
  cxGridTv_St_ControllerName.EditValue  := cxGridDBTv_DControllerName.EditValue;
  cxGridTv_St_eqpmnCode.EditValue		   := cxGridDBTv_DeqpmnCode.EditValue;
  cxGridTv_St_eqpmnEsntlSn.EditValue	 := cxGridDBTv_DeqpmnEsntlSn.EditValue;
  cxGridTv_St_eqpmnNo.EditValue			   := cxGridDBTv_DeqpmnNo.EditValue;
  cxGridTv_St_itemCode.EditValue		   := cxGridDBTv_DitemCode.EditValue;
  cxGridTv_St_lsindRegistNo.EditValue	 := cxGridDBTv_DlsindRegistNo.EditValue;
  cxGridTv_St_makrId.EditValue			   := cxGridDBTv_DmakrId.EditValue;
  cxGridTv_St_roomDtlNo.EditValue		   := cxGridDBTv_DroomDtlNo.EditValue;
  cxGridTv_St_roomNo.EditValue			   := cxGridDBTv_DroomNo.EditValue;
  cxGridTv_St_Serial.EditValue		     := cxGridDBTv_DSerial.EditValue;
  cxGridTv_St_SerialNo.EditValue		   := cxGridDBTv_DSerialNo.EditValue;
  cxGridTv_St_stallNo.EditValue			   := cxGridDBTv_DstallNo.EditValue;
  cxGridTv_St_stallTyCode.EditValue		 := cxGridDBTv_DstallTyCode.EditValue;
  cxRGroup_Type.ItemIndex              := cxGridDBTv_DLinkcycleType.EditValue;
  cxCEdit_TimeSum.Value                := cxGridDBTv_DLinkcycle.EditValue;
  case cxRGroup_Type.ItemIndex of
    0:BEGIN
      cxCEdit_Time.Value      := cxGridDBTv_DLinkcycle.EditValue div 3600;
    END;

    1:BEGIN
      cxCEdit_Time.Value      := cxGridDBTv_DLinkcycle.EditValue div 60;
    END;

    2:BEGIN
      cxCEdit_Time.Value      := cxGridDBTv_DLinkcycle.EditValue;
    END;
  end;
end;

procedure TfStall.FormShow(Sender: TObject);
begin
  UniQuery_all.Active := TRUE;
  With UniQuery_Stall_S do
  Begin
    close;
    ParamByName('Serial').AsString := Serial;
    open;

    try
      cxGridTv_St.DataController.BeginUpdate;
      cxGridTv_St.DataController.RecordCount := 0;
      cxGridTv_St.DataController.AppendRecord;
      cxGridTv_St.DataController.Values[0 ,cxGridTv_St_LoginID.Index]         := LoginID;
      cxGridTv_St.DataController.Values[0 ,cxGridTv_St_Name.Index]            := CName;
      cxGridTv_St.DataController.Values[0 ,cxGridTv_St_ControllerName.Index]  := ControllerName;
      cxGridTv_St.DataController.Values[0 ,cxGridTv_St_Serial.Index]      := Serial;
      cxGridTv_St.DataController.Values[0 ,cxGridTv_St_SerialNo.Index]    := SerialNo;

      if RecordCount > 0 then
      begin
        //cxGridTv_St.DataController.Values[0 ,cxGridTv_St_SerialNo.Index]      := SerialNo;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_eqpmnCode.Index]     := FieldByName('eqpmnCode').AsString;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_eqpmnEsntlSn.Index]  := FieldByName('eqpmnEsntlSn').AsString;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_eqpmnNo.Index]       := FieldByName('eqpmnNo').AsString;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_itemCode.Index]      := FieldByName('itemCode').AsString;
        cxRGroup_Type.ItemIndex := FieldByName('LinkcycleType').AsInteger;
        case cxRGroup_Type.ItemIndex of
          0: cxCEdit_Time.Value      := Round(FieldByName('Linkcycle').AsInteger div 3600);
          1: cxCEdit_Time.Value      := Round(FieldByName('Linkcycle').AsInteger div 60);
          2: cxCEdit_Time.Value      := Round(FieldByName('Linkcycle').AsInteger);
        end;
        cxCEdit_TimeSum.Value        := Round(FieldByName('Linkcycle').AsInteger);
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_lsindRegistNo.Index]  := FieldByName('lsindRegistNo').AsString;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_makrId.Index]         := FieldByName('makrId').AsString;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_roomDtlNo.Index]      := FieldByName('roomDtlNo').AsString;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_roomNo.Index]         := FieldByName('roomNo').AsString;
//        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_Serial.Index]         := FieldByName('Serial').AsString;
//        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_SerialNo.Index]       := FieldByName('SerialNo').AsString;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_stallNo.Index]        := FieldByName('stallNo').AsString;
        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_stallTyCode.Index]    := FieldByName('stallTyCode').AsString;
      end;
    finally
      cxGridTv_St.DataController.endupdate;
      cxGridTv_St.DataController.FocusedRecordIndex := 0;
    end;
  End;
end;

function TfStall.SaveStall: Boolean;
begin
  result := false;
  try
    with UniSP_Save do
    begin
      close;
      StoredProcName := '';
      StoredProcName := 'usp_Stall';
      Prepare;
      ParamByName('@Option').AsString        := 'A';
      ParamByName('@eqpmnCode').AsString     := trim(Vartostr(cxGridTv_St_eqpmnCode.EditValue));
      ParamByName('@eqpmnEsntlSn').AsString  := trim(Vartostr(cxGridTv_St_eqpmnEsntlSn.EditValue));
      ParamByName('@eqpmnNo').AsString       := trim(Vartostr(cxGridTv_St_eqpmnNo.EditValue));
      ParamByName('@itemCode').AsString      := trim(Vartostr(cxGridTv_St_itemCode.EditValue));
      ParamByName('@lsindRegistNo').AsString := trim(Vartostr(cxGridTv_St_lsindRegistNo.EditValue));
      ParamByName('@makrId').AsString        := trim(Vartostr(cxGridTv_St_makrId.EditValue));
      ParamByName('@roomDtlNo').AsString     := trim(Vartostr(cxGridTv_St_roomDtlNo.EditValue));
      ParamByName('@roomNo').AsString        := trim(Vartostr(cxGridTv_St_roomNo.EditValue));
      ParamByName('@Serial').AsString        := trim(Vartostr(cxGridTv_St_Serial.EditValue));
      ParamByName('@SerialNo').AsString      := trim(Vartostr(cxGridTv_St_SerialNo.EditValue));
      ParamByName('@stallNo').AsString       := trim(Vartostr(cxGridTv_St_stallNo.EditValue));
      ParamByName('@stallTyCode').AsString   := trim(Vartostr(cxGridTv_St_stallTyCode.EditValue));
      ParamByName('@Linkcycle').AsInteger     := ROUND(cxCEdit_TimeSum.Value);
      ParamByName('@LinkcycleType').AsInteger := cxRGroup_Type.ItemIndex;
      ExecProc;
    end;

    result := true;
  except
    on E: Exception  do
    begin
      MessageDlg('에러코드 : '+ e.Message  , mtError, [mbOK], 0);
      exit;
    end;
  end;
end;

function TfStall.DelStall: Boolean;
begin
  result := false;
  try
    with UniQuery_Stall_D do
    begin
      close;
      ParamByName('Serial').AsString      := Vartostr(cxGridTv_St_Serial.EditValue);
      Execsql;
    end;
    result := true;
  except
    on E: Exception  do
    begin
      MessageDlg('에러코드 : '+ e.Message  , mtError, [mbOK], 0);
      exit;
    end;
  end;
end;

end.
