unit uDongHwa;

interface

uses           System.UITypes,  system.IniFiles, System.IOUtils,
  System.Threading,  IdSync, IdThreadComponent,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, System.Win.ScktComp,
  Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, cxGroupBox, UniProvider,
  SQLServerUniProvider, Data.DB, DBAccess, Uni, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, MemDS,
  cxSplitter, cxCurrencyEdit, cxColorComboBox, cxCheckBox, cxRadioGroup,
  cxExtEditRepositoryItems;

type
  TfDongHwa = class(TForm)
    Memo1: TMemo;
    TimerConnectionClose: TTimer;
    cxGBoxOrderSearch: TcxGroupBox;
    cxBtnSearchList: TcxButton;
    cxLabel1: TcxLabel;
    cxLabelSerialNo: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    Panel1: TPanel;
    cxGroupBox2: TcxGroupBox;
    TimerSerial: TTimer;
    TimerSerialCheck: TTimer;
    TimerLoadingOut: TTimer;
    cxBtn_ProductAdds: TcxButton;
    cxLabel2: TcxLabel;
    UniConnection1: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabelModel: TcxLabel;
    cxLabel6: TcxLabel;
    cxBtn_Command: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    UniQuery1: TUniQuery;
    DataSource1: TDataSource;
    cxGrid1DBTableView1SerialNo: TcxGridDBColumn;
    cxGrid1DBTableView1WritingDateTime: TcxGridDBColumn;
    cxGrid1DBTableView1LoginID: TcxGridDBColumn;
    cxGrid1DBTableView1Name: TcxGridDBColumn;
    cxGrid1DBTableView1ControllerName: TcxGridDBColumn;
    cxGrid1DBTableView1ModifiedDateTime: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    cxGroupBoxModel: TcxGroupBox;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    UniQueryModel: TUniQuery;
    UniQueryModelSearch: TUniQuery;
    cxLookupComboBoxModel: TcxLookupComboBox;
    DataSourceModel: TDataSource;
    DataSourceModelSearch: TDataSource;
    cxGrid2DBTableView1Code: TcxGridDBColumn;
    cxGrid2DBTableView1Division: TcxGridDBColumn;
    cxGrid2DBTableView1Name: TcxGridDBColumn;
    PanelHelpAccountPanel: TPanel;
    cxBtn_New: TcxButton;
    cxBtn_Save: TcxButton;
    cxBtn_Delete: TcxButton;
    cxButton2: TcxButton;
    cxBtn_Refresh: TcxButton;
    TimerSend: TTimer;
    TimerInsert: TTimer;
    UniQueryInsert: TUniQuery;
    cxButton1: TcxButton;
    cxGrid2DBTableView1InCount: TcxGridDBColumn;
    cxGrid2DBTableView1OutCount: TcxGridDBColumn;
    cxGrid2DBTableView1SetCount: TcxGridDBColumn;
    cxGroupBoxDetail: TcxGroupBox;
    Panel2: TPanel;
    cxBtn_Save2: TcxButton;
    cxGrid2DBTableView1K1Name: TcxGridDBColumn;
    cxGrid2DBTableView1K2Name: TcxGridDBColumn;
    cxGrid2DBTableView1K3Name: TcxGridDBColumn;
    cxGrid2DBTableView1K4Name: TcxGridDBColumn;
    cxGrid2DBTableView1K5Name: TcxGridDBColumn;
    cxGrid2DBTableView1K1Index: TcxGridDBColumn;
    cxGrid2DBTableView1K2Index: TcxGridDBColumn;
    cxGrid2DBTableView1K3Index: TcxGridDBColumn;
    cxGrid2DBTableView1K4Index: TcxGridDBColumn;
    cxGrid2DBTableView1K5Index: TcxGridDBColumn;
    cxGrid2DBTableView1K1Color: TcxGridDBColumn;
    cxGrid2DBTableView1K2Color: TcxGridDBColumn;
    cxGrid2DBTableView1K3Color: TcxGridDBColumn;
    cxGrid2DBTableView1K4Color: TcxGridDBColumn;
    cxGrid2DBTableView1K5Color: TcxGridDBColumn;
    cxGrid2DBTableView1K1Color2: TcxGridDBColumn;
    cxGrid2DBTableView1K2Color2: TcxGridDBColumn;
    cxGrid2DBTableView1K3Color2: TcxGridDBColumn;
    cxGrid2DBTableView1K4Color2: TcxGridDBColumn;
    cxGrid2DBTableView1K5Color2: TcxGridDBColumn;
    cxGrid2DBTableView1DetailCount: TcxGridDBColumn;
    UniQuery2: TUniQuery;
    DataSource2: TDataSource;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3DBTableView1K1: TcxGridDBColumn;
    cxGrid3DBTableView1K2: TcxGridDBColumn;
    cxGrid3DBTableView1K3: TcxGridDBColumn;
    cxGrid3DBTableView1K4: TcxGridDBColumn;
    cxGrid3DBTableView1K5: TcxGridDBColumn;
    cxGrid3DBTableView1Name: TcxGridDBColumn;
    UniQueryTemp: TUniQuery;
    Panel3: TPanel;
    Panel4: TPanel;
    cxLabel5: TcxLabel;
    cxCEditX: TcxCurrencyEdit;
    cxCEditY: TcxCurrencyEdit;
    cxGrid2DBTableView1SetCountHigh: TcxGridDBColumn;
    cxGrid2DBTableView1SetCountLow: TcxGridDBColumn;
    cxBtn_Stall: TcxButton;
    cxGrid1DBTableView1SerialNo1: TcxGridDBColumn;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1ColorComboBox1: TcxEditRepositoryColorComboBox;
    procedure TimerConnectionCloseTimer(Sender: TObject);
    procedure cxBtnSearchListClick(Sender: TObject);
    procedure TimerSerialTimer(Sender: TObject);
    procedure TimerSerialCheckTimer(Sender: TObject);
    procedure cxBtn_CommandClick(Sender: TObject);
    procedure cxBtn_ProductAddsClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxBtn_NewClick(Sender: TObject);
    procedure cxBtn_SaveClick(Sender: TObject);
    procedure cxBtn_DeleteClick(Sender: TObject);
    procedure cxBtn_RefreshClick(Sender: TObject);
    procedure cxLookupComboBoxModelPropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid2DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid2DBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure TimerLoadingOutTimer(Sender: TObject);
    procedure TimerSendTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerInsertTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGrid2DBTableView1K1IndexPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid2DBTableView1K1ColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGrid2DBTableView1K2ColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGrid2DBTableView1K3ColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGrid2DBTableView1K4ColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGrid2DBTableView1K5ColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxBtn_Save2Click(Sender: TObject);
    procedure cxGrid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid2DBTableView1DetailCountPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxCEdit_TimePropertiesEditValueChanged(Sender: TObject);
    procedure cxBtn_StallClick(Sender: TObject);
    procedure cxBtn_Stall_SaveClick(Sender: TObject);
    procedure cxBtn_Stall_DelClick(Sender: TObject);
    procedure cxEditRepository1ColorComboBox1PropertiesEditValueChanged(
      Sender: TObject);
  private
    { Private declarations }
    function SaveStall: Boolean;
    function DelStall: Boolean;
  public
    { Public declarations }

    // 랜덤 한문자 추출
    function GetRandomChar: Char;

    // 지정된 길이만큼 랜덤 문자열 추출
    function GetRandomString(Count: Integer): String;

    function BccCalculator(HexString: String; BCCNum: Integer):Integer;
    procedure IdTCPClientConnected(Sender: TObject);
    procedure IdTCPClientDisconnected(Sender: TObject);
    procedure IdThreadComponentRun(Sender: TIdThreadComponent);

    procedure HandleException(Sender: TObject; E: Exception);
    function HexToInt(sHex:String):Integer;

    procedure ModelDetailSearch;
  end;

const
  CHAR_SET: array [0..35] of Char =
    (
      '0','1','2','3','4','5','6','7','8','9',
      'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
    );

var
  fDongHwa: TfDongHwa;
  // ... TIdTCPClient
  IdTCPClient         : TIdTCPClient;
  // ... TIdThreadComponent
  idThreadComponent   : TIdThreadComponent;
  ReadData : String;
  SendMod : integer;
  SerialCheck : Boolean;
  SerialNo : String;
  SendSerial : String;
  PlusStr : String;

implementation

{$R *.dfm}

uses uDetail, uStall;

function TfDongHwa.BccCalculator(HexString: String; BCCNum: Integer): Integer;
var
  loopcnt, BCC: Integer;
begin
  // XOR BCC 알고리즘
  if BCCNum = 1 then
  begin
    BCC := Ord(HexString[1]);
    for loopcnt := 2 to Length(HexString) do
    begin
      BCC := BCC xor Ord(HexString[loopcnt]);
    end;

//    Result := chr(BCC);
    Result := BCC;
  end
  // CRC16 BCC 알고리즘
  else
  begin
    BCC := Ord(HexString[2]);
    for loopcnt := 3 to Length(HexString) do
    begin
      BCC := BCC xor Ord(HexString[loopcnt]);
    end;
//    Result := chr(BCC);
    Result := BCC;
  end;
end;

procedure TfDongHwa.cxBtnSearchListClick(Sender: TObject);
begin
  try
    // ... create TIdTCPClient
    idTCPClient                 := TIdTCPClient.Create();
    // ... set properties
    idTCPClient.Host            := '192.168.4.1';
    idTCPClient.Port            := 1480;
    idTCPClient.ConnectTimeout  := 3000;
    // ... etc..

    // ... callback functions
    idTCPClient.OnConnected     := IdTCPClientConnected;
    idTCPClient.OnDisconnected  := IdTCPClientDisconnected;
    // ... etc..

    // ... create TIdThreadComponent
    idThreadComponent           := TIdThreadComponent.Create();

    // ... callback functions
    idThreadComponent.OnRun     := IdThreadComponentRun;
    // ... etc..

  except on e : exception do
    begin
      Memo1.Lines.Add(e.Message);
    end;
  end;

  // ... try to connect to Server
  try
    IdTCPClient.Connect;
    TimerSerial.Enabled := True;
    Memo1.Lines.Add('디바이스 연결중입니다');
    TimerLoadingOut.Enabled := True;
  except on E: Exception do
    begin
      Memo1.Lines.Add('CONNECTION ERROR! ' + E.Message);
      TimerConnectionClose.Enabled := True;
      showmessagePos('디바이스 AP모드 해제 후, 다시 진행해 주세요', Round(cxCEditX.Value), Round(cxCEditY.Value));
    end;
  end;
end;

procedure TfDongHwa.cxBtn_ProductAddsClick(Sender: TObject);
begin
  cxGroupBoxModel.Visible := not cxGroupBoxModel.Visible;
  cxGroupBoxDetail.Visible := cxGroupBoxModel.Visible;
  UniQueryModel.Active := cxGroupBoxModel.Visible;
  if UniQueryModel.Active then UniQueryModel.Refresh;
end;

procedure TfDongHwa.cxBtn_RefreshClick(Sender: TObject);
begin
  UniQueryModel.Refresh;
end;

procedure TfDongHwa.cxBtn_Save2Click(Sender: TObject);
begin
  try
    UniQuery2.ApplyUpdates;
    UniQuery2.CommitUpdates;
    UniQueryModel.ApplyUpdates;
    UniQueryModel.CommitUpdates;
    ShowmessagePos('저장되었습니다.', Round(cxCEditX.Value), Round(cxCEditY.Value));
  except on e:exception do
    begin
      ShowmessagePos('Save Error! : 개발자에게 문의하세요', Round(cxCEditX.Value), Round(cxCEditY.Value));
    end;
  end;
end;

procedure TfDongHwa.cxBtn_SaveClick(Sender: TObject);
var
  SaveCode : String;
  i, iErr : integer;
begin
  UniQueryModel.First;
  while not UniQueryModel.Eof do
  begin
    if UniQueryModel.FieldByName('Code').AsString = '' then UniQueryModel.Delete;
    UniQueryModel.Next;
  end;

  try
    UniQueryModel.ApplyUpdates;
    UniQueryModel.CommitUpdates;
    ShowmessagePos('저장되었습니다.', Round(cxCEditX.Value), Round(cxCEditY.Value));
    cxGroupBoxModel.Visible := False;
    cxGroupBoxDetail.Visible := False;
//    UniQueryModelSearch.Refresh;
  except on e:exception do
    begin
      ShowmessagePos('Save Error! : 개발자에게 문의하세요', Round(cxCEditX.Value), Round(cxCEditY.Value));
    end;
  end;
end;

// 250414 김동휘 추가(축산)
procedure TfDongHwa.cxBtn_StallClick(Sender: TObject);
begin
  fStall := TfStall.Create(self);
  fStall.Serial         := vartostr(cxGrid1DBTableView1SerialNo.EditValue);
  fStall.SerialNo       := vartostr(cxGrid1DBTableView1SerialNo1.EditValue);
  fStall.LoginID        := vartostr(cxGrid1DBTableView1LoginID.EditValue);
  fStall.CName           := vartostr(cxGrid1DBTableView1Name.EditValue);
  fStall.ControllerName := vartostr(cxGrid1DBTableView1ControllerName.EditValue);
  fStall.Showmodal;

//  if  cxGBox_Stall.Visible = true then exit;
//
//  cxGBox_Stall.Visible := true;
//  if cxLabelSerialNo.Caption= '' then
//  begin
//    try
//      cxGridTv_St.DataController.BeginUpdate;
//      cxGridTv_St.DataController.RecordCount := 0;
//      cxGridTv_St.DataController.AppendRecord;
//    finally
//      cxGridTv_St.DataController.endupdate;
//    end;
//  end
//  else
//  begin
//    With UniQuery_Stall_S do
//    Begin
//      close;
//      ParamByName('SerialNo').AsString := cxLabelSerialNo.Caption;
//      open;
//
//      try
//        cxGridTv_St.DataController.BeginUpdate;
//        cxGridTv_St.DataController.RecordCount := 0;
//        cxGridTv_St.DataController.AppendRecord;
//        cxGridTv_St.DataController.Values[0 ,cxGridTv_St_SerialNo.Index]      := cxLabelSerialNo.Caption;
//        if RecordCount > 0 then
//        begin
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_eqpmnCode.Index]     := FieldByName('eqpmnCode').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_eqpmnEsntlSn.Index]  := FieldByName('eqpmnEsntlSn').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_eqpmnNo.Index]       := FieldByName('eqpmnNo').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_itemCode.Index]      := FieldByName('itemCode').AsString;
//          cxRGroup_Type.ItemIndex := FieldByName('LinkcycleType').AsInteger;
//          case cxRGroup_Type.ItemIndex of
//            0: cxCEdit_Time.Value      := Round(FieldByName('Linkcycle').AsInteger div 3600);
//            1: cxCEdit_Time.Value      := Round(FieldByName('Linkcycle').AsInteger div 60);
//            2: cxCEdit_Time.Value      := Round(FieldByName('Linkcycle').AsInteger);
//          end;
//
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_lsindRegistNo.Index]  := FieldByName('lsindRegistNo').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_makrId.Index]         := FieldByName('makrId').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_roomDtlNo.Index]      := FieldByName('roomDtlNo').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_roomNo.Index]         := FieldByName('roomNo').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_SerialNo.Index]       := FieldByName('SerialNo').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_stallNo.Index]        := FieldByName('stallNo').AsString;
//          cxGridTv_St.DataController.Values[0 ,cxGridTv_St_stallTyCode.Index]    := FieldByName('stallTyCode').AsString;
//        end;
//      finally
//        cxGridTv_St.DataController.endupdate;
//        cxGridTv_St.DataController.FocusedRecordIndex := 0;
//      end;
//    End;
//  end;
end;

procedure TfDongHwa.cxBtn_CommandClick(Sender: TObject);
begin
  if cxLabelSerialNo.Caption = '' then
  begin
    ShowmessagePos('연결된 디바이스를 조회 해 주세요', Round(cxCEditX.Value), Round(cxCEditY.Value));
    Exit;
  end;

  if cxLookupComboBoxModel.ItemIndex < 0 then
  begin
    ShowmessagePos('모델을 선택해 주세요', Round(cxCEditX.Value), Round(cxCEditY.Value));
    Exit;
  end;

  SendSerial := '0000' + cxLabelModel.Caption + GetRandomString(5);
  // 시리얼 중복체크
//  SendSerial := 'TEST00000002';
  if MessageDlgPos(SendSerial+#13+'시리얼 번호를 부여하시겠습니까?'
      , mtConfirmation, [mbYes, mbNo], 0, Round(cxCEditX.Value), Round(cxCEditY.Value), mbYes) = mrYes then
  begin

      try
        // ... create TIdTCPClient
        idTCPClient                 := TIdTCPClient.Create();
        // ... set properties
        idTCPClient.Host            := '192.168.4.1';
        idTCPClient.Port            := 1480;
        idTCPClient.ConnectTimeout  := 3000;
        // ... etc..

        // ... callback functions
        idTCPClient.OnConnected     := IdTCPClientConnected;
        idTCPClient.OnDisconnected  := IdTCPClientDisconnected;
        // ... etc..

        // ... create TIdThreadComponent
        idThreadComponent           := TIdThreadComponent.Create();

        // ... callback functions
        idThreadComponent.OnRun     := IdThreadComponentRun;
        // ... etc..

      except on e : exception do
        begin
          Memo1.Lines.Add(e.Message);
        end;
      end;

      // ... try to connect to Server
      try
        IdTCPClient.Connect;
        TimerSend.Enabled := True;
        Memo1.Lines.Add('시리얼 번호 부여 중입니다');
        TimerLoadingOut.Enabled := True;
      except on E: Exception do
        begin
          Memo1.Lines.Add('CONNECTION ERROR! ' + E.Message);
          TimerConnectionClose.Enabled := True;
          showmessagePos('디바이스 AP모드 해제 후, 다시 진행해 주세요', Round(cxCEditX.Value), Round(cxCEditY.Value));
        end;
      end;
  end;
end;

procedure TfDongHwa.cxBtn_DeleteClick(Sender: TObject);
begin
  if UniQueryModel.RecordCount > 0 then UniQueryModel.Delete;
end;

procedure TfDongHwa.cxButton1Click(Sender: TObject);
begin
  UniQuery1.Refresh;
end;

procedure TfDongHwa.cxButton2Click(Sender: TObject);
begin
  cxGroupBoxModel.Visible := False;
  cxGroupBoxDetail.Visible := False;
  UniQueryModel.Active := False;
end;

// 250414 김동휘 추가(축산)
procedure TfDongHwa.cxBtn_Stall_DelClick(Sender: TObject);
begin
//  if cxGridTv_St.DataController.RecordCount = 0         then exit;
//  if trim(vartostr(cxGridTv_St_SerialNo.EditValue)) ='' then exit;
//
//  if (MessageDlg('삭제 하시겠습니까?', mtWarning, [mbYes, mbNo], 0) = mrYes)  then
//  begin
//    if DelStall then
//    begin
//      try
//        cxGridTv_St.DataController.BeginUpdate;
//        cxGridTv_St.DataController.RecordCount := 0;
//        cxGridTv_St.DataController.AppendRecord;
//      finally
//        cxGridTv_St.DataController.endupdate;
//        ShowMessage('삭제했습니다.');
//      end;
//    end;
//  end;
end;

procedure TfDongHwa.cxBtn_Stall_SaveClick(Sender: TObject);
begin
//  if cxGridTv_St.DataController.RecordCount = 0         then exit;
//  if trim(vartostr(cxGridTv_St_SerialNo.EditValue)) ='' then exit;
//
//  if (MessageDlg('저장 하시겠습니까?', mtWarning, [mbYes, mbNo], 0) = mrYes)  then
//  begin
//    if SaveStall then
//    begin
//      ShowMessage('저장했습니다.');
//    end;
//  end;
end;


procedure TfDongHwa.cxCEdit_TimePropertiesEditValueChanged(Sender: TObject);
var
  InputValue: Currency;
  ConvertedSeconds: Integer;
begin
 // TcxCurrencyEdit(sender).PostEditValue;
//  InputValue := cxCEdit_Time.Value;
//  case cxRGroup_Type.ItemIndex of
//    0: ConvertedSeconds := Round(InputValue * 3600);
//    1: ConvertedSeconds := Round(InputValue * 60);
//    2: ConvertedSeconds := Round(InputValue);
//  else
//    ConvertedSeconds := Round(InputValue);
//  end;
//
//  cxCEdit_TimeSum.Value := ConvertedSeconds;

end;

procedure TfDongHwa.cxEditRepository1ColorComboBox1PropertiesEditValueChanged(
  Sender: TObject);
var
  V   : TcxGridDBTableView;
  Col : TcxGridDBColumn;
  R   : Integer;
  Hex : string;
  FieldName: string;
begin
  V   := cxGrid2DBTableView1;
  Col := V.Controller.EditingItem as TcxGridDBColumn;

  // 현재 편집 중인 값 반영
  V.DataController.PostEditingData;
  R := V.DataController.FocusedRecordIndex;

  // VCL BGR → RGB HEX 변환
  Hex := IntToHex(V.DataController.Values[R, Col.Index], 6);
  Hex := Copy(Hex,5,2) + Copy(Hex,3,2) + Copy(Hex,1,2);

  // 원래 컬럼명 + '2' → DB 필드명
  FieldName := Col.DataBinding.FieldName + '2';

  UniQueryModel.Edit;
  UniQueryModel.FieldByName(FieldName).AsInteger := StrToInt('$' + Hex);
  // UniQueryModel.Post;  // 필요할 때만
end;

procedure TfDongHwa.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  with fDetail.UniQueryDetail do
  begin
    Close;
    SQL.Clear;
    SQL.Add('				Select T.CheckDate');
    SQL.Add('					  ,T.Temp');
    SQL.Add('					  ,T.SetTemp');
    SQL.Add('					  ,C.SerialNo');
    SQL.Add('				    ,C.Serial');
    SQL.Add('				    ,C.WritingDateTime');
    SQL.Add('				    ,Ma.LoginID');
    SQL.Add('				    ,Ma.Name');
    SQL.Add('				    ,C.ControllerName');
    SQL.Add('				    ,C.ControllerID');
    SQL.Add('				    ,C.ModifiedDateTime');
    SQL.Add('					  ,Mo.Name as ControllerModel');
    SQL.Add('					  ,Mo.InCount');
    SQL.Add('					  ,Mo.OutCount');
    SQL.Add('					  ,T.PowerState');
    SQL.Add('					  ,T.Err');
    SQL.Add('					,(CASE WHEN C.TempName is NULL THEN ''현재온도'' ELSE C.TempName END) as TempName');
    SQL.Add('					,(CASE WHEN C.SetTempName is NULL THEN ''설정온도'' ELSE C.SetTempName END) as SetTempName');
    SQL.Add('					,(CASE WHEN C.Out1 is NULL THEN Mo.K1Name ELSE C.Out1 END) as Out1');
    SQL.Add('					,(CASE WHEN C.Out2 is NULL THEN Mo.K2Name ELSE C.Out2 END) as Out2');
    SQL.Add('					,(CASE WHEN C.Out3 is NULL THEN Mo.K3Name ELSE C.Out3 END) as Out3');
    SQL.Add('					,(CASE WHEN C.Out4 is NULL THEN Mo.K4Name ELSE C.Out4 END) as Out4');
    SQL.Add('					,(CASE WHEN C.Out5 is NULL THEN Mo.K5Name ELSE C.Out5 END) as Out5');
    SQL.Add('					,(CASE WHEN C.HighTemp is NULL THEN 50 ELSE C.HighTemp END) as HighTemp');
    SQL.Add('					,(CASE WHEN C.LowTemp is NULL THEN -10 ELSE C.LowTemp END) as LowTemp');
    SQL.Add('					,(CASE WHEN ISNULL(T.DOut1,0) = 0 THEN ''OFF'' ELSE ''ON'' END) as DOut1');
    SQL.Add('					,(CASE WHEN ISNULL(T.DOut2,0) = 0 THEN ''OFF'' ELSE ''ON'' END) as DOut2');
    SQL.Add('					,(CASE WHEN ISNULL(T.DOut3,0) = 0 THEN ''OFF'' ELSE ''ON'' END) as DOut3');
    SQL.Add('					,(CASE WHEN ISNULL(T.DOut4,0) = 0 THEN ''OFF'' ELSE ''ON'' END) as DOut4');
    SQL.Add('					,(CASE WHEN ISNULL(T.DOut5,0) = 0 THEN ''OFF'' ELSE ''ON'' END) as DOut5');
    SQL.Add('					,Mo.K1Index');
    SQL.Add('					,Mo.K2Index');
    SQL.Add('					,Mo.K3Index');
    SQL.Add('					,Mo.K4Index');
    SQL.Add('					,Mo.K5Index');
    SQL.Add('					,T.DefrostMode');
    SQL.Add('					,T.DefrostState');
    SQL.Add('				FROM TempState as T');
    SQL.Add('				Left OUTER Join ControllerInfo as C');
    SQL.Add('				On C.SerialNo = T.SerialNo');
    SQL.Add('				LEFT OUTER Join Model as Mo');
    SQL.Add('				On Mo.Code = C.ModelCode');
    SQL.Add('				Left Outer Join MasterUser as Ma');
    SQL.Add('				On C.MasterID = Ma.UserID');
    SQL.Add(' Where C.Serial = '+#39+VarToStr(cxGrid1DBTableView1.DataController.Values[
                                      cxGrid1DBTableView1.DataController.FocusedRecordIndex,
                                      cxGrid1DBTableView1SerialNo.Index])+#39);
    Open;
    if RecordCount > 0 then
    begin
      fDetail.cxGridDBColumnTempName.Caption := FieldByName('TempName').AsString;
      fDetail.cxGridDBColumnSetName.Caption := FieldByName('SetTempName').AsString;
      fDetail.cxGridDBTableView1Column1.Caption := FieldByName('Out1').AsString;
      fDetail.cxGridDBTableView1Column2.Caption := FieldByName('Out2').AsString;
      fDetail.cxGridDBTableView1Column3.Caption := FieldByName('Out3').AsString;
      fDetail.cxGridDBTableView1Column4.Caption := FieldByName('Out4').AsString;
      fDetail.cxGridDBTableView1Column5.Caption := FieldByName('Out5').AsString;
      if FieldByName('OutCount').AsCurrency = 1 then
      begin
        fDetail.cxGridDBTableView1Column1.Visible := True;
        fDetail.cxGridDBTableView1Column2.Visible := False;
        fDetail.cxGridDBTableView1Column3.Visible := False;
        fDetail.cxGridDBTableView1Column4.Visible := False;
        fDetail.cxGridDBTableView1Column5.Visible := False;
      end else if FieldByName('OutCount').AsCurrency = 2 then
      begin
        fDetail.cxGridDBTableView1Column1.Visible := True;
        fDetail.cxGridDBTableView1Column2.Visible := True;
        fDetail.cxGridDBTableView1Column3.Visible := False;
        fDetail.cxGridDBTableView1Column4.Visible := False;
        fDetail.cxGridDBTableView1Column5.Visible := False;
      end else if FieldByName('OutCount').AsCurrency = 3 then
      begin
        fDetail.cxGridDBTableView1Column1.Visible := True;
        fDetail.cxGridDBTableView1Column2.Visible := True;
        fDetail.cxGridDBTableView1Column3.Visible := True;
        fDetail.cxGridDBTableView1Column4.Visible := False;
        fDetail.cxGridDBTableView1Column5.Visible := False;
      end else if FieldByName('OutCount').AsCurrency = 4 then
      begin
        fDetail.cxGridDBTableView1Column1.Visible := True;
        fDetail.cxGridDBTableView1Column2.Visible := True;
        fDetail.cxGridDBTableView1Column3.Visible := True;
        fDetail.cxGridDBTableView1Column4.Visible := True;
        fDetail.cxGridDBTableView1Column5.Visible := False;
      end else
      begin
        fDetail.cxGridDBTableView1Column1.Visible := True;
        fDetail.cxGridDBTableView1Column2.Visible := True;
        fDetail.cxGridDBTableView1Column3.Visible := True;
        fDetail.cxGridDBTableView1Column4.Visible := True;
        fDetail.cxGridDBTableView1Column5.Visible := True;
      end;
    end else
    begin
      fDetail.cxGridDBColumnTempName.Caption := '현재온도';
      fDetail.cxGridDBColumnSetName.Caption := '설정온도';
      fDetail.cxGridDBTableView1Column1.Caption := '1';
      fDetail.cxGridDBTableView1Column2.Caption := '2';
      fDetail.cxGridDBTableView1Column3.Caption := '3';
      fDetail.cxGridDBTableView1Column4.Caption := '4';
      fDetail.cxGridDBTableView1Column5.Caption := '5';
    end;
  end;
  fDetail.cxDEditSearchStart.Date := Now;
  fDetail.cxTimeEditStart.Time := Now - (0.0000011574 * 600 * 5);
  fDetail.cxDEditSearchEnd.Date := Now;
  fDetail.cxTimeEditEnd.Time := Now;
  fDetail.cxBtnSearchList.Click;
  fDetail.ShowModal;
end;

procedure TfDongHwa.cxGrid2DBTableView1DetailCountPropertiesEditValueChanged(
  Sender: TObject);
begin
  cxGrid2DBTableView1.DataController.PostEditingData;
  ModelDetailSearch;
end;

procedure TfDongHwa.cxGrid2DBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = vkReturn) then
  begin
    with cxGrid2DBTableView1.DataController do
    begin
      if FocusedRecordIndex = (RecordCount - 1) then
      begin
        cxBtn_New.Click;
      end else
      begin
        FocusedRecordIndex := FocusedRecordIndex + 1;
      end;
    end;
  end;
end;

procedure TfDongHwa.cxGrid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  ModelDetailSearch;
end;

procedure TfDongHwa.cxGrid2DBTableView1K1ColorPropertiesEditValueChanged(
  Sender: TObject);
var
  HexStr : String;
  i : Integer;
begin
  cxGrid2DBTableView1.DataController.PostEditingData;
  HexStr := IntToHex(cxGrid2DBTableView1.DataController.Values[
                        cxGrid2DBTableView1.DataController.FocusedRecordIndex,
                        cxGrid2DBTableView1K1Color.Index],6);
  for i := Length(HexStr) + 1 to 6 do
  begin
    HexStr := '0'+HexStr;
  end;

  HexStr := Copy(HexStr,5,2) + Copy(HexStr,3,2) + Copy(HexStr,1,2);

  UniQueryModel.Edit;
  UniQueryModel.FieldByName('K1Color2').AsInteger := HexToInt(HexStr);
end;

procedure TfDongHwa.cxGrid2DBTableView1K1IndexPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  Value: Currency;
begin
  // 입력된 값을 정수로 변환하려 시도합니다.
  if TryStrToCurr(DisplayValue, Value) = false then
  begin
    // 정수로 변환할 수 없는 경우 에러 텍스트를 설정합니다.
    Error := True;
    ErrorText := '유효한 숫자를 입력하세요.';
  end;
  if Error then
  begin
    DisplayValue := 0;
  end;
end;

procedure TfDongHwa.cxGrid2DBTableView1K2ColorPropertiesEditValueChanged(
  Sender: TObject);

var
  HexStr : String;
  i : Integer;
begin
  cxGrid2DBTableView1.DataController.PostEditingData;
  HexStr := IntToHex(cxGrid2DBTableView1.DataController.Values[
                        cxGrid2DBTableView1.DataController.FocusedRecordIndex,
                        cxGrid2DBTableView1K2Color.Index],6);
  for i := Length(HexStr) + 1 to 6 do
  begin
    HexStr := '0'+HexStr;
  end;

  HexStr := Copy(HexStr,5,2) + Copy(HexStr,3,2) + Copy(HexStr,1,2);

  UniQueryModel.Edit;
  UniQueryModel.FieldByName('K2Color2').AsInteger := HexToInt(HexStr);
end;

procedure TfDongHwa.cxGrid2DBTableView1K3ColorPropertiesEditValueChanged(
  Sender: TObject);

var
  HexStr : String;
  i : Integer;
begin
  cxGrid2DBTableView1.DataController.PostEditingData;
  HexStr := IntToHex(cxGrid2DBTableView1.DataController.Values[
                        cxGrid2DBTableView1.DataController.FocusedRecordIndex,
                        cxGrid2DBTableView1K3Color.Index],6);
  for i := Length(HexStr) + 1 to 6 do
  begin
    HexStr := '0'+HexStr;
  end;

  HexStr := Copy(HexStr,5,2) + Copy(HexStr,3,2) + Copy(HexStr,1,2);

  UniQueryModel.Edit;
  UniQueryModel.FieldByName('K3Color2').AsInteger := HexToInt(HexStr);
end;

procedure TfDongHwa.cxGrid2DBTableView1K4ColorPropertiesEditValueChanged(
  Sender: TObject);

var
  HexStr : String;
  i : Integer;
begin
  cxGrid2DBTableView1.DataController.PostEditingData;
  HexStr := IntToHex(cxGrid2DBTableView1.DataController.Values[
                        cxGrid2DBTableView1.DataController.FocusedRecordIndex,
                        cxGrid2DBTableView1K4Color.Index],6);
  for i := Length(HexStr) + 1 to 6 do
  begin
    HexStr := '0'+HexStr;
  end;

  HexStr := Copy(HexStr,5,2) + Copy(HexStr,3,2) + Copy(HexStr,1,2);

  UniQueryModel.Edit;
  UniQueryModel.FieldByName('K4Color2').AsInteger := HexToInt(HexStr);
end;

procedure TfDongHwa.cxGrid2DBTableView1K5ColorPropertiesEditValueChanged(
  Sender: TObject);

var
  HexStr : String;
  i : Integer;
begin
  cxGrid2DBTableView1.DataController.PostEditingData;
  HexStr := IntToHex(cxGrid2DBTableView1.DataController.Values[
                        cxGrid2DBTableView1.DataController.FocusedRecordIndex,
                        cxGrid2DBTableView1K5Color.Index],6);
  for i := Length(HexStr) + 1 to 6 do
  begin
    HexStr := '0'+HexStr;
  end;

  HexStr := Copy(HexStr,5,2) + Copy(HexStr,3,2) + Copy(HexStr,1,2);

  UniQueryModel.Edit;
  UniQueryModel.FieldByName('K5Color2').AsInteger := HexToInt(HexStr);
end;

procedure TfDongHwa.cxGrid2DBTableView1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    with cxGrid2DBTableView1.DataController do
    begin
      if FocusedRecordIndex = (RecordCount - 1) then
      begin
        cxBtn_New.Click;
      end else
      begin
        FocusedRecordIndex := FocusedRecordIndex + 1;
      end;
    end;
  end;
end;

procedure TfDongHwa.cxBtn_NewClick(Sender: TObject);
begin
  UniQueryModel.Append;
end;

procedure TfDongHwa.cxLookupComboBoxModelPropertiesEditValueChanged(
  Sender: TObject);
begin
  cxLabelModel.Caption := VarToStr(cxLookupComboBoxModel.EditValue);
end;

procedure TfDongHwa.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ClientEnvIniPath: string;
  ClientEnvFile: TIniFile;
begin
  // 경로 디렉토리 존재 유무 체크
  if DirectoryExists(TPath.GetPublicPath) then
  begin
    ClientEnvIniPath := TPath.GetPublicPath + '\ClientEnv.ini';
    ClientEnvFile := TIniFile.Create(ClientEnvIniPath);
    try
      ClientEnvFile.WriteString('Info', 'X', IntToStr(Round(cxCEditX.Value)));
      ClientEnvFile.WriteString('Info', 'Y', IntToStr(Round(cxCEditY.Value)));
    finally
      ClientEnvFile.DisposeOf;
    end;
  end;
end;

procedure TfDongHwa.FormCreate(Sender: TObject);
begin
  Application.OnException := HandleException;
end;

procedure TfDongHwa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // 신규
  if ((ssCtrl in Shift) and (Key = ord('N'))) then cxBtn_New.Click;
  // 저장
  if ((ssCtrl in Shift) and (Key = ord('S'))) then cxBtn_Save.Click;
  // 새로고침
  if (Key = VK_F5) then cxBtn_Refresh.Click;
end;

procedure TfDongHwa.FormShow(Sender: TObject);
var
  ClientEnvIniPath : string;
  ClientEnvFile: TIniFile;
begin
  cxGroupBoxModel.Left := 100;
  cxGroupBoxModel.Top := 80;

  cxGroupBoxDetail.Left := cxGroupBoxModel.Left;
  cxGroupBoxDetail.Top := cxGroupBoxModel.Top + cxGroupBoxModel.Height;

  // 경로 디렉토리 존재 유무 체크
  if DirectoryExists(TPath.GetPublicPath) then
  begin
    // 경로에 파일 존재 유무 체크
    if FileExists(TPath.GetPublicPath+'\ClientEnv.ini') then
    begin
      // INI 파일에서 로그인 정보 확인
      ClientEnvIniPath := TPath.GetPublicPath + '\ClientEnv.ini';
      ClientEnvFile := TIniFile.Create(ClientEnvIniPath);
      try
        cxCEditX.Value := StrToIntDef(ClientEnvFile.ReadString('Info', 'X', ''),100);
        cxCEditY.Value := StrToIntDef(ClientEnvFile.ReadString('Info', 'Y', ''),100);
      finally
        ClientEnvFile.DisposeOf;
      end;
    end;
  end;


end;

function TfDongHwa.GetRandomChar: Char;
begin
  Randomize;
  Result:=CHAR_SET[Random(High(CHAR_SET))];
end;

function TfDongHwa.GetRandomString(Count: Integer): String;
var
  i: Integer;
begin
  Result:='';
  Randomize;
  for i:=1 to Count do Result:=Result+GetRandomChar;
//  for i:=0 to Random(Range-Start) do Result:=Result+GetRandomChar;
end;

procedure TfDongHwa.HandleException(Sender: TObject; E: Exception);
begin
  Memo1.Lines.Add('HE : ' + E.Message);
end;

function TfDongHwa.HexToInt(sHex: String): Integer;
var
  i:Integer;
  sWork:String;
begin
  Result := 0;
  sWork := UpperCase(sHex);
  for i := 1 to Length(sWork) do
  begin
    // 16진수의 문자열인가 체크
     if (Ord(sWork[i]) in [0..47, 58..64, 71..255]) then
      begin
          Result := -1;
          Break;
      end;
  end;
  // 16진수 문자열을 정수형으로 변환
  if (Result = 0) then Result := StrToInt('$' + sHex);
end;

procedure TfDongHwa.IdTCPClientConnected(Sender: TObject);
begin
  try
    Memo1.Lines.Add('Connect!');
    idThreadComponent.Active := True;
  except
    On e : exception do
    begin
      Memo1.Lines.Add('E0 ' + e.Message);
    end;
  end;
end;

procedure TfDongHwa.IdTCPClientDisconnected(Sender: TObject);
begin
  try
    idThreadComponent.Active := False;
    Memo1.Lines.Add('DisConnect!');
  except
    On e : exception do
    begin
      Memo1.Lines.Add('ED ' + e.Message);
    end;
  end;

end;

procedure TfDongHwa.IdThreadComponentRun(Sender: TIdThreadComponent);
var
  msgFromServer : string;
begin
  try
    // ... read message from server
    msgFromServer := IdTCPClient.IOHandler.ReadChar();
    // ... messages log
    Memo1.Lines.Add('Read : '+msgFromServer);
    ReadData := ReadData + msgFromServer;

    if msgFromServer = #03 then SerialCheck := False;

    if SerialCheck then
    begin
      SerialNo := SerialNo + msgFromServer;
      ReadData := '';
    end else
    begin
      if Pos('OKE',ReadData) > 0 then
      begin
        ReadData := '';
        if SendMod = 1 then
        begin
//          TimerC.Enabled := True;
        end else
        begin
          TimerInsert.Enabled := True;
          TimerConnectionClose.Enabled := True;
        end;
      end;
    end;
  except
    on e : exception do
    begin
      if Pos('Connection Closed Grace',e.Message) <= 0 then
      begin
        Memo1.Lines.Add('ETh : '+e.Message);
      end;
    end;
  end;
end;

procedure TfDongHwa.ModelDetailSearch;
var
  i : integer;
begin
  if UniQueryModel.FieldByName('DetailCount').AsInteger > 0 then
  begin
    with UniQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select top('+UniQueryModel.FieldByName('DetailCount').AsString+') * from ModelDetail');
      SQL.Add('Where ModelID = '+UniQueryModel.FieldByName('ModelID').AsString);
      Open;

      if UniQueryModel.FieldByName('OutCount').AsInteger = 5 then
      begin
        cxGrid3DBTableView1K1.Visible := True;
        cxGrid3DBTableView1K2.Visible := True;
        cxGrid3DBTableView1K3.Visible := True;
        cxGrid3DBTableView1K4.Visible := True;
        cxGrid3DBTableView1K5.Visible := True;
      end else if UniQueryModel.FieldByName('OutCount').AsInteger = 4 then
      begin
        cxGrid3DBTableView1K1.Visible := True;
        cxGrid3DBTableView1K2.Visible := True;
        cxGrid3DBTableView1K3.Visible := True;
        cxGrid3DBTableView1K4.Visible := True;
        cxGrid3DBTableView1K5.Visible := False;
      end else if UniQueryModel.FieldByName('OutCount').AsInteger = 3 then
      begin
        cxGrid3DBTableView1K1.Visible := True;
        cxGrid3DBTableView1K2.Visible := True;
        cxGrid3DBTableView1K3.Visible := True;
        cxGrid3DBTableView1K4.Visible := False;
        cxGrid3DBTableView1K5.Visible := False;
      end else if UniQueryModel.FieldByName('OutCount').AsInteger = 2 then
      begin
        cxGrid3DBTableView1K1.Visible := True;
        cxGrid3DBTableView1K2.Visible := True;
        cxGrid3DBTableView1K3.Visible := False;
        cxGrid3DBTableView1K4.Visible := False;
        cxGrid3DBTableView1K5.Visible := False;
      end else if UniQueryModel.FieldByName('OutCount').AsInteger = 1 then
      begin
        cxGrid3DBTableView1K1.Visible := True;
        cxGrid3DBTableView1K2.Visible := False;
        cxGrid3DBTableView1K3.Visible := False;
        cxGrid3DBTableView1K4.Visible := False;
        cxGrid3DBTableView1K5.Visible := False;
      end;

      if UniQueryModel.FieldByName('DetailCount').AsInteger > RecordCount then
      begin
        UniQueryTemp.Close;
        UniQueryTemp.SQL.Clear;
        for i := 1 to UniQueryModel.FieldByName('DetailCount').AsInteger - RecordCount do
        begin
          UniQueryTemp.SQL.Add('Insert Into ModelDetail(ModelID)');
          UniQueryTemp.SQL.Add('Values('+UniQueryModel.FieldByName('ModelID').AsString+')');
        end;
        if UniQueryTemp.SQL.Text <> '' then UniQueryTemp.Execute;

        Close;
        SQL.Clear;
        SQL.Add('Select top('+UniQueryModel.FieldByName('DetailCount').AsString+') * from ModelDetail');
        SQL.Add('Where ModelID = '+UniQueryModel.FieldByName('ModelID').AsString);
        Open;
      end;
    end;
  end else
  begin
    with UniQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ModelDetail');
      SQL.Add('Where 1 = 0');
      Open;
    end;
  end;
end;

procedure TfDongHwa.TimerConnectionCloseTimer(Sender: TObject);
begin
  TimerConnectionClose.Enabled := False;
  Memo1.Lines.Add('연결을 해제중입니다.');
  try
    if idThreadComponent.Active then idThreadComponent.Active := False;
    if IdTCPClient.Connected then IdTCPClient.Disconnect;
    FreeAndNil(IdThreadComponent);
    FreeAndNil(IdTCPClient);
    Memo1.Lines.Add('연결을 해제하였습니다.');
    TimerLoadingOut.Enabled := False;
  except
    on E: Exception do begin
      Memo1.Lines.Add('Close ERROR! ' + E.Message);
      TimerLoadingOut.Enabled := False;
    end;
  end;
end;

procedure TfDongHwa.TimerInsertTimer(Sender: TObject);
begin
  TimerInsert.Enabled := False;
  PlusStr := StringReplace(PlusStr, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  with UniQueryInsert do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DECLARE @ControllerID int');
    SQL.Add('Insert Into ControllerInfo(WritingDateTime, SerialNo, Serial, ModelCode)');
    SQL.Add('Values(GETDATE(), '+#39+Trim(PlusStr)+#39+','+#39+SendSerial+#39+','+#39+cxLabelModel.Caption+#39+')');
    SQL.Add('Set @ControllerID = @@IDENTITY');

    SQL.Add('Insert Into TempState(CheckDate, SerialNo, Temp, SetTemp, ControllerID)');
    SQL.Add('Values(GETDATE(), '+#39+Trim(PlusStr)+#39+',0,0, @ControllerID)');
    Execute;
  end;
  UniQuery1.Refresh;
  Memo1.Lines.Add('등록을 완료하였습니다.');
end;

procedure TfDongHwa.TimerLoadingOutTimer(Sender: TObject);
begin
  if not TimerConnectionClose.Enabled then TimerConnectionClose.Enabled := True;
end;

procedure TfDongHwa.TimerSendTimer(Sender: TObject);
var
  sCommand: AnsiString;
  i : Integer;
begin
  TimerSend.Enabled := False;
  if not IdTCPClient.Connected then Exit;
  SerialCheck := False;
  SerialNo := '';

//  sCommand :=  AnsiChar(#$0D) + AnsiChar(#$0A) + AnsiChar(#$31) + AnsiChar(#$30)
//             + AnsiChar(#$30) + AnsiChar(#$31) + AnsiChar(#$35) + AnsiChar(#$34)
//             + AnsiChar(#$30) + AnsiChar(#$37) + AnsiChar(#$30) + AnsiChar(#$30)
//             + AnsiChar(#$30) + AnsiChar(#$31) + AnsiChar(#$03);// + AnsiChar(#$03);  // 시리얼 번호 등록
  PlusStr := '';
  for i := 1 to Length(SendSerial) do
  begin
    PlusStr := PlusStr + IntToHex(Ord(SendSerial[i]),2) + ' ' ;
    sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+IntToHex(Ord(SendSerial[i]),2))));
  end;

  sCommand := AnsiChar(Chr(StrToInt('0x'+IntToHex(Length(SendSerial)+1,2))))+ AnsiChar(#$0A)
              + sCommand + AnsiChar(#$03) ;
  sCommand := AnsiChar(#$02) + sCommand + Chr(BccCalculator(sCommand,1));
  Memo1.Lines.Add('02 '+IntToHex(Length(SendSerial)+1,2)+ ' 0A '+ PlusStr + '03 ' + IntToHex(BccCalculator(sCommand,1),2));
  IdTCPClient.IOHandler.WriteLn(sCommand);
  Memo1.Lines.Add('Send : '+sCommand);
end;

procedure TfDongHwa.TimerSerialCheckTimer(Sender: TObject);
begin
  TimerSerialCheck.Enabled := False;
  Memo1.Lines.Add('Serial : '+Trim(SerialNo));
  if Length(Trim(SerialNo)) > 0 then
  begin
    cxLabelSerialNo.Caption := Trim(SerialNo);
  end else
  begin
    cxLabelSerialNo.Caption := '';
  end;
  SerialCheck := False;
  TimerConnectionClose.Enabled := True;
end;

procedure TfDongHwa.TimerSerialTimer(Sender: TObject);
var
  sCommand: AnsiString;
begin
  TimerSerial.Enabled := False;
  if not IdTCPClient.Connected then Exit;
  Memo1.Lines.Add('Search Serial...');
  SerialCheck := True;
  SerialNo := '';
  sCommand := (AnsiChar(#$01)+AnsiChar(#$1A)+AnsiChar(#$03)+AnsiChar(#$1A));
  sCommand := AnsiChar(#$02) + sCommand + Chr(BccCalculator(sCommand,1));
  IdTCPClient.IOHandler.WriteLn(sCommand);
  TimerSerialCheck.Enabled := True;
end;

// 250414 김동휘 추가(축산)
function TfDongHwa.SaveStall: Boolean;
begin
//  result := false;
//  try
//    with UniSP_Save do
//    begin
//      close;
//      StoredProcName := '';
//      StoredProcName := 'usp_Stall';
//      Prepare;
//      ParamByName('@Option').AsString        := 'A';
//      ParamByName('@eqpmnCode').AsString     := trim(Vartostr(cxGridTv_St_eqpmnCode.EditValue));
//      ParamByName('@eqpmnEsntlSn').AsString  := trim(Vartostr(cxGridTv_St_eqpmnEsntlSn.EditValue));
//      ParamByName('@eqpmnNo').AsString       := trim(Vartostr(cxGridTv_St_eqpmnNo.EditValue));
//      ParamByName('@itemCode').AsString      := trim(Vartostr(cxGridTv_St_itemCode.EditValue));
//      ParamByName('@lsindRegistNo').AsString := trim(Vartostr(cxGridTv_St_lsindRegistNo.EditValue));
//      ParamByName('@makrId').AsString        := trim(Vartostr(cxGridTv_St_makrId.EditValue));
//      ParamByName('@roomDtlNo').AsString     := trim(Vartostr(cxGridTv_St_roomDtlNo.EditValue));
//      ParamByName('@roomNo').AsString        := trim(Vartostr(cxGridTv_St_roomNo.EditValue));
//      ParamByName('@SerialNo').AsString      := trim(Vartostr(cxGridTv_St_SerialNo.EditValue));
//      ParamByName('@stallNo').AsString       := trim(Vartostr(cxGridTv_St_stallNo.EditValue));
//      ParamByName('@stallTyCode').AsString   := trim(Vartostr(cxGridTv_St_stallTyCode.EditValue));
//      ParamByName('@Linkcycle').AsInteger     := ROUND(cxCEdit_TimeSum.Value);
//      ParamByName('@LinkcycleType').AsInteger := cxRGroup_Type.ItemIndex;
//      ExecProc;
//    end;
//
//    result := true;
//  except
//    on E: Exception  do
//    begin
//      MessageDlg('에러코드 : '+ e.Message  , mtError, [mbOK], 0);
//      exit;
//    end;
//  end;
end;


function TfDongHwa.DelStall: Boolean;
begin
//  result := false;
//  try
//    with UniQuery_Stall_D do
//    begin
//      close;
//      ParamByName('SerialNo').AsString      := Vartostr(cxGridTv_St_SerialNo.EditValue);
//      Execsql;
//    end;
//    result := true;
//  except
//    on E: Exception  do
//    begin
//      MessageDlg('에러코드 : '+ e.Message  , mtError, [mbOK], 0);
//      exit;
//    end;
//  end;
end;


end.
