unit uDetail;

interface

uses    cxGridExportLink, ShellAPI, System.IOUtils, PROGRESSBAR,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, MemDS, DBAccess, Uni, cxCurrencyEdit, cxCalendar,
  Vcl.ExtCtrls, Vcl.Menus, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls, cxButtons, cxSpinEdit,
  cxTimeEdit, dxBarBuiltInMenu, cxPC, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart;

type
  TfDetail = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SerialNo: TcxGridDBColumn;
    cxGrid1DBTableView1WritingDateTime: TcxGridDBColumn;
    cxGrid1DBTableView1LoginID: TcxGridDBColumn;
    cxGrid1DBTableView1Name: TcxGridDBColumn;
    cxGrid1DBTableView1ControllerName: TcxGridDBColumn;
    cxGrid1DBTableView1ModifiedDateTime: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    UniQueryDetail: TUniQuery;
    DataSourceDetail: TDataSource;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumnTempName: TcxGridDBColumn;
    cxGridDBColumnSetName: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    Panel1: TPanel;
    cxBtnDatePre: TcxButton;
    cxLbl1: TcxLabel;
    cxDEditSearchStart: TcxDateEdit;
    cxDEditSearchEnd: TcxDateEdit;
    cxBtnDateNext: TcxButton;
    cxBtnSearchList: TcxButton;
    Panel2: TPanel;
    cxBtn_Excel: TcxButton;
    cxButton1: TcxButton;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3TableView1: TcxGridTableView;
    cxGrid3TableView1Column1: TcxGridColumn;
    cxGrid3TableView1Column2: TcxGridColumn;
    cxGrid3TableView1Column3: TcxGridColumn;
    cxGrid3TableView1Column4: TcxGridColumn;
    cxGrid3TableView1Column5: TcxGridColumn;
    cxGrid3TableView1Column6: TcxGridColumn;
    cxGrid3TableView1Column7: TcxGridColumn;
    cxGrid3TableView1Column8: TcxGridColumn;
    UniQuerySearch: TUniQuery;
    cxTimeEditStart: TcxTimeEdit;
    cxTimeEditEnd: TcxTimeEdit;
    UniQuerySearch2: TUniQuery;
    DataSourceSearch: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxButton2: TcxButton;
    Chart1: TChart;
    SeriesG1: TFastLineSeries;
    SeriesG2: TFastLineSeries;
    cxGrid3TableView1Column9: TcxGridColumn;
    UniQueryGraphGetMark: TUniQuery;
    cxGrid1DBTableView1SerialNo2: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBtnDatePreClick(Sender: TObject);
    procedure cxBtnDateNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxBtnSearchListClick(Sender: TObject);
    procedure cxBtn_ExcelClick(Sender: TObject);
    procedure cxGrid3TableView1Column1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SeriesG1GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDetail: TfDetail;
  Current: Integer;
  Searching : Boolean;

implementation

{$R *.dfm}

uses uDongHwa, uStall;

procedure TfDetail.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  tmp: Integer;
  i: Integer;
begin
  try
    if SeriesG1.Count > 0 then
    begin
      for i := SeriesG1.FirstValueIndex to SeriesG1.LastValueIndex do
      begin
        if SeriesG1.CalcXPos(i) > Round(X) then
        begin
          tmp := i;
          Break;
        end;
      end;

      if tmp <> Current then
      begin
        Current := tmp;
        SeriesG1.Repaint;
      end;
    end;
  except on e:exception do
    begin
//      Memo1.Lines.Add(e.Message);
    end;
  end;
end;

procedure TfDetail.cxBtnDateNextClick(Sender: TObject);
begin
  cxDEditSearchStart.Date := cxDEditSearchStart.Date + 1;
  cxDEditSearchEnd.Date := cxDEditSearchEnd.Date + 1;
end;

procedure TfDetail.cxBtnDatePreClick(Sender: TObject);
begin
  cxDEditSearchStart.Date := cxDEditSearchStart.Date - 1;
  cxDEditSearchEnd.Date := cxDEditSearchEnd.Date - 1;
end;

procedure TfDetail.cxBtnSearchListClick(Sender: TObject);
var
  AppendIndex, i, j : Integer;
  SaveTimeK : Array[0..5] of Currency;
  PreTimeK1, PreTimeK2, PreTimeK3, PreTimeK4, PreTimeK5 : TDateTime;
  FirstK1, FirstK2, FirstK3, FirstK4, FirstK5 : Boolean;
  SeriesNumber : Integer;
  ErrCheck : Boolean;
  PreTemp : Currency;
  PreDateTime : TDateTime;
begin
  if Searching then Exit;

  Searching := True;
  try
    cxGrid3TableView1.DataController.RecordCount := 0;
    SeriesNumber := 1;
    with UniQuerySearch do
    begin
      cxGrid3TableView1.BeginUpdate;
      Close;
      SQL.Clear;
      SQL.Add('select * from TempCheck');
      SQL.Add('where SerialNo = '+#39+UniQueryDetail.FieldByName('SerialNo').AsString+#39);
      SQL.Add('and CheckDate >= '+#39+FormatDateTime('yyyy-mm-dd',cxDEditSearchStart.Date)
                                 +FormatDateTime(' hh:nn:ss',cxTimeEditStart.Time)+#39);
      SQL.Add('and CheckDate <= '+#39+FormatDateTime('yyyy-mm-dd',cxDEditSearchEnd.Date)
                                 +FormatDateTime(' hh:nn:ss',cxTimeEditEnd.Time)+#39);
      SQL.Add('Order by CheckDate');
      Open;

      for i := 0 to 5 do
      begin
        SaveTimeK[i] := 0;
      end;

      for i := 0 to Chart1.SeriesCount - 1 do
      begin
        Chart1.Series[i].Clear;
      end;

      i := 0;
      ErrCheck := False;
      while not Eof do
      begin
        AppendIndex := cxGrid3TableView1.DataController.AppendRecord;
        cxGrid3TableView1.DataController.Values[AppendIndex,0] :=
                  FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('CheckDate').AsDateTime);
        cxGrid3TableView1.DataController.Values[AppendIndex,1] :=
                              FormatFloat('#,0.##',FieldByName('Temp').AsCurrency);
        cxGrid3TableView1.DataController.Values[AppendIndex,2] :=
                              FormatFloat('#,0.##',FieldByName('SetTemp').AsCurrency);

        cxGrid3TableView1.DataController.Values[AppendIndex,8] := FieldByName('CheckDate').AsDateTime;
        if FieldByName('Err').AsString = '001' then
        begin
          if not ErrCheck then
          begin
            ErrCheck := True;
            if SeriesNumber >= Chart1.SeriesCount then
            begin
              Chart1.AddSeries(TFastLineSeries.Create(Self));
              (Chart1.Series[SeriesNumber] as TFastLineSeries).SeriesColor := clRed;
              (Chart1.Series[SeriesNumber] as TFastLineSeries).LinePen.Width := 3;
            end;
            Chart1.Series[SeriesNumber].AddXY(
                     PreDateTime,//i,
                     PreTemp,
                     '',
                     clRed);
          end;
        end else
        begin
          Chart1.Series[0].AddXY(
                   FieldByName('CheckDate').AsDateTime,//i,
                   FieldByName('TEMP').AsFloat,
                   FormatDateTime('dd일 hh:nn', FieldByName('CheckDate').AsDateTime),
                   Chart1.Series[0].Color);
          PreTemp := FieldByName('TEMP').AsFloat;
          PreDateTime := FieldByName('CheckDate').AsDateTime;
          if ErrCheck then
          begin
            ErrCheck := False;
            Chart1.Series[SeriesNumber].AddXY(
                     FieldByName('CheckDate').AsDateTime,//i,
                     FieldByName('TEMP').AsFloat,
                     '',
                     clRed);
            SeriesNumber := SeriesNumber + 1;
          end;
        end;
        i := i + 1;

        if FieldByName('DOut1').AsBoolean then
        begin
          if FormatDateTime('yyyy-mm-dd',FieldByName('CheckDate').AsDateTime) = FormatDateTime('yyyy-mm-dd',PreTimeK1) then
          begin
            if FirstK1 then
            begin
              SaveTimeK[1] := SaveTimeK[1] + FieldByName('CheckDate').AsDateTime - PreTimeK1;
            end else
            begin
              FirstK1 := True;
            end;
          end;
          PreTimeK1 := FieldByName('CheckDate').AsDateTime;
        end else
        begin
          FirstK1 := False;
          SaveTimeK[1] := 0;
        end;
        if FieldByName('DOut2').AsBoolean then
        begin
          if FormatDateTime('yyyy-mm-dd',FieldByName('CheckDate').AsDateTime) = FormatDateTime('yyyy-mm-dd',PreTimeK2) then
          begin
            if FirstK2 then
            begin
              SaveTimeK[2] := SaveTimeK[2] + FieldByName('CheckDate').AsDateTime - PreTimeK2;
            end else
            begin
              FirstK2 := True;
            end;
          end;
          PreTimeK2 := FieldByName('CheckDate').AsDateTime;
        end else
        begin
          FirstK2 := False;
          SaveTimeK[2] := 0;
        end;
        if FieldByName('DOut3').AsBoolean then
        begin
          if FormatDateTime('yyyy-mm-dd',FieldByName('CheckDate').AsDateTime) = FormatDateTime('yyyy-mm-dd',PreTimeK3) then
          begin
            if FirstK3 then
            begin
              SaveTimeK[3] := SaveTimeK[3] + FieldByName('CheckDate').AsDateTime - PreTimeK3;
            end else
            begin
              FirstK3 := True;
            end;
          end;
          PreTimeK3 := FieldByName('CheckDate').AsDateTime;
        end else
        begin
          FirstK3 := False;
          SaveTimeK[3] := 0;
        end;
        if FieldByName('DOut4').AsBoolean then
        begin
          if FormatDateTime('yyyy-mm-dd',FieldByName('CheckDate').AsDateTime) = FormatDateTime('yyyy-mm-dd',PreTimeK4) then
          begin
            if FirstK4 then
            begin
              SaveTimeK[4] := SaveTimeK[4] + FieldByName('CheckDate').AsDateTime - PreTimeK4;
            end else
            begin
              FirstK4 := True;
            end;
          end;
          PreTimeK4 := FieldByName('CheckDate').AsDateTime;
        end else
        begin
          FirstK4 := False;
          SaveTimeK[4] := 0;
        end;
        if FieldByName('DOut5').AsBoolean then
        begin
          if FormatDateTime('yyyy-mm-dd',FieldByName('CheckDate').AsDateTime) = FormatDateTime('yyyy-mm-dd',PreTimeK5) then
          begin
            if FirstK5 then
            begin
              SaveTimeK[5] := SaveTimeK[5] + FieldByName('CheckDate').AsDateTime - PreTimeK5;
            end else
            begin
              FirstK5 := True;
            end;
          end;
          PreTimeK5 := FieldByName('CheckDate').AsDateTime;
        end else
        begin
          FirstK5 := False;
          SaveTimeK[5] := 0;
        end;

        cxGrid3TableView1.DataController.Values[AppendIndex,3] := '';
        if FieldByName('DOut1').AsBoolean then
        begin
          cxGrid3TableView1.DataController.Values[AppendIndex,3] := cxGrid3TableView1.DataController.Values[AppendIndex,3] + 'k1 ';
          if SaveTimeK[1] > 0 then
          begin
            cxGrid3TableView1.DataController.Values[AppendIndex,7] := ' [k1 : '+Round(SaveTimeK[1] / 0.00069444).ToString+'m]';  // 0.0000011574 * 600 = 1분
          end;
        end;
        if FieldByName('DOut2').AsBoolean then
        begin
          cxGrid3TableView1.DataController.Values[AppendIndex,3] := cxGrid3TableView1.DataController.Values[AppendIndex,3] + 'k2 ';
          if SaveTimeK[2] > 0 then
          begin
            cxGrid3TableView1.DataController.Values[AppendIndex,7] := VarToStr(cxGrid3TableView1.DataController.Values[AppendIndex,7]) +
                                                                      ' [k2 : '+Round(SaveTimeK[2] / 0.00069444).ToString+'m]';
          end;
        end;
        if FieldByName('DOut3').AsBoolean then
        begin
          cxGrid3TableView1.DataController.Values[AppendIndex,3] := cxGrid3TableView1.DataController.Values[AppendIndex,3] + 'k3 ';
          if SaveTimeK[3] > 0 then
          begin
            cxGrid3TableView1.DataController.Values[AppendIndex,7] := VarToStr(cxGrid3TableView1.DataController.Values[AppendIndex,7]) +
                                                                      ' [k3 : '+Round(SaveTimeK[3] / 0.00069444).ToString+'m]';
          end;
        end;
        if FieldByName('DOut4').AsBoolean then
        begin
          cxGrid3TableView1.DataController.Values[AppendIndex,3] := cxGrid3TableView1.DataController.Values[AppendIndex,3] + 'k4 ';
          if SaveTimeK[4] > 0 then
          begin
            cxGrid3TableView1.DataController.Values[AppendIndex,7] := VarToStr(cxGrid3TableView1.DataController.Values[AppendIndex,7]) +
                                                                      ' [k4 : '+Round(SaveTimeK[4] / 0.00069444).ToString+'m]';
          end;
        end;
        if FieldByName('DOut5').AsBoolean then
        begin
          cxGrid3TableView1.DataController.Values[AppendIndex,3] := cxGrid3TableView1.DataController.Values[AppendIndex,3] + 'k5 ';
          if SaveTimeK[5] > 0 then
          begin
            cxGrid3TableView1.DataController.Values[AppendIndex,7] := VarToStr(cxGrid3TableView1.DataController.Values[AppendIndex,7]) +
                                                                      ' [k5 : '+Round(SaveTimeK[5] / 0.00069444).ToString+'m]';
          end;
        end;

        if FieldByName('Err').AsString = '010' then
        begin
          cxGrid3TableView1.DataController.Values[AppendIndex,4] := 'Er2';
        end else if FieldByName('Err').AsString = '001' then
        begin
          cxGrid3TableView1.DataController.Values[AppendIndex,4] := 'Er1';
        end;

        Next;
      end;
    end;


    with UniQuerySearch2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from Alarm');
      SQL.Add('where ControllerID = '+#39+UniQueryDetail.FieldByName('ControllerID').AsString+#39);
      SQL.Add('and ( (StartTime >= '+#39+FormatDateTime('yyyy-mm-dd',cxDEditSearchStart.Date)
                                 +FormatDateTime(' hh:nn:ss',cxTimeEditStart.Time)+#39);
      SQL.Add('    and StartTime <= '+#39+FormatDateTime('yyyy-mm-dd',cxDEditSearchEnd.Date)
                                 +FormatDateTime(' hh:nn:ss',cxTimeEditEnd.Time)+#39 + ')');
      SQL.Add(' or (EndTime >= '+#39+FormatDateTime('yyyy-mm-dd',cxDEditSearchStart.Date)
                                 +FormatDateTime(' hh:nn:ss',cxTimeEditStart.Time)+#39);
      SQL.Add('    and EndTime <= '+#39+FormatDateTime('yyyy-mm-dd',cxDEditSearchEnd.Date)
                                 +FormatDateTime(' hh:nn:ss',cxTimeEditEnd.Time)+#39 + ') )');
      Open;
      fPROGRESSBAR := TfPROGRESSBAR.Create(Application);
      fPROGRESSBAR.Show;
      fPROGRESSBAR.cxProgressBar1.Properties.Max := RecordCount;
      fPROGRESSBAR.cxProgressBar1.Position := 0;
      Application.ProcessMessages;

      while not Eof do
      begin
        fPROGRESSBAR.cxProgressBar1.Position := fPROGRESSBAR.cxProgressBar1.Position + 1;
        Application.ProcessMessages;
        for i := cxGrid3TableView1.DataController.RecordCount - 1 downto 0 do
        begin
          if (cxGrid3TableView1.DataController.Values[i,0] >= FieldByName('StartTime').AsDateTime)
            and (cxGrid3TableView1.DataController.Values[i,0] <= FieldByName('StartTime').AsDateTime) then
          begin
            cxGrid3TableView1.DataController.Values[i,4] := Copy(FieldByName('ErrCode').AsString,1,4);
            cxGrid3TableView1.DataController.Values[i,5] :=
                      FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('StartTime').AsDateTime);

            if VarToStr(cxGrid3TableView1.DataController.Values[i,8]) <> '' then
            begin
              Chart1.Series[1].AddXY(
                       cxGrid3TableView1.DataController.Values[i,8],
                       cxGrid3TableView1.DataController.Values[i,1],
                       FormatDateTime('dd일 hh:nn', cxGrid3TableView1.DataController.Values[i,0]),
                       Chart1.Series[1].Color);
            end;

            for j := cxGrid3TableView1.DataController.RecordCount - 1 downto 0 do
            begin
              if (cxGrid3TableView1.DataController.Values[j,0] >= FieldByName('EndTime').AsDateTime)
                and (cxGrid3TableView1.DataController.Values[j,0] <= FieldByName('EndTime').AsDateTime) then
              begin
                cxGrid3TableView1.DataController.Values[j,6] :=
                          FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('EndTime').AsDateTime);
                break;
              end;
            end;
            break;
          end else if (cxGrid3TableView1.DataController.Values[i,0] <= FieldByName('StartTime').AsDateTime)
            and (cxGrid3TableView1.DataController.Values[i,0] <= FieldByName('EndTime').AsDateTime)
            and (VarToStr(cxGrid3TableView1.DataController.Values[i,0]) <> '')
            and (Copy(FieldByName('ErrCode').AsString,1,4) = 'ER10') then
          begin

            if SeriesNumber >= Chart1.SeriesCount then
            begin
              Chart1.AddSeries(TFastLineSeries.Create(Self));
              (Chart1.Series[SeriesNumber] as TFastLineSeries).SeriesColor := clRed;
              (Chart1.Series[SeriesNumber] as TFastLineSeries).LinePen.Width := 3;
            end;
            if VarToStr(cxGrid3TableView1.DataController.Values[i,8]) <> '' then
            begin
              Chart1.Series[SeriesNumber].AddXY(
                       cxGrid3TableView1.DataController.Values[i,8],
                       StrToCurrDef(VarToStr(cxGrid3TableView1.DataController.Values[i,1]),0),
                       '',
                       clRed);
            end;

            // 250110 김동휘 수정
            if (i+1 < cxGrid3TableView1.DataController.RecordCount) and
               (VarToStr(cxGrid3TableView1.DataController.Values[i+1, 8]) <> '') then
            // VarToStr(cxGrid3TableView1.DataController.Values[i+1,8]) <> '' then
            begin
              Chart1.Series[SeriesNumber].AddXY(
                       cxGrid3TableView1.DataController.Values[i+1,8],
                       StrToCurrDef(VarToStr(cxGrid3TableView1.DataController.Values[i+1,1]),0),
                       '',
                       clRed);
            end;
            SeriesNumber := SeriesNumber + 1;

            AppendIndex := cxGrid3TableView1.DataController.InsertRecord(i + 1);
            cxGrid3TableView1.DataController.Values[AppendIndex,4] := Copy(FieldByName('ErrCode').AsString,1,4);
            cxGrid3TableView1.DataController.Values[AppendIndex,5] :=
                      FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('StartTime').AsDateTime);
            cxGrid3TableView1.DataController.Values[AppendIndex,6] :=
                      FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('EndTime').AsDateTime);

            break;
          end;
        end;
        Next;
      end;
      fPROGRESSBAR.Close;
      cxGrid3TableView1.EndUpdate;
    end;
  except on e: exception do
    begin
      showmessage(e.Message);
    end;
  end;
  Searching := False;
end;

procedure TfDetail.cxBtn_ExcelClick(Sender: TObject);
var
  sPath : String;
begin
  if MessageDlg('엑셀파일을 생성하시겠습니까?', mtConfirmation,
    [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    sPath := TPath.Combine(TPath.GetDocumentsPath, '');
    sPath := sPath + '\' + FormatDateTime('yyyymmddhhnnss', Now) + '.xls';
    ExportGridToExcel(sPath, cxGrid3, True, True, False, 'xls');
    Application.ProcessMessages;
    ShellExecute(Self.Handle, PChar('OPEN'), PChar(sPath), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;


procedure TfDetail.cxButton1Click(Sender: TObject);
begin
  cxPageControl1.ActivePage := cxTabSheet2;
end;

procedure TfDetail.cxButton2Click(Sender: TObject);
begin
  cxPageControl1.ActivePage := cxTabSheet1;
end;

procedure TfDetail.cxGrid3TableView1Column1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if VarToStr(ARecord.Values[cxGrid3TableView1Column5.Index]) <> '' then
  begin
    AStyle := TcxStyle.Create(nil);
//      AStyle.Color := $006060E1;
    AStyle.TextColor  := clRed;
  end else if VarToStr(ARecord.Values[cxGrid3TableView1Column7.Index]) <> '' then
  begin
    AStyle := TcxStyle.Create(nil);
//      AStyle.Color := $006060E1;
    AStyle.TextColor  := clBlue;
  end;
end;

procedure TfDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfDetail.FormCreate(Sender: TObject);
begin
  cxDEditSearchStart.Date := Now - 1;
  cxDEditSearchEnd.Date := Now;
end;

procedure TfDetail.FormShow(Sender: TObject);
begin
  Searching := False;
  cxPageControl1.Properties.HideTabs := True;
  cxPageControl1.Properties.ActivePage := cxTabSheet1;
end;

procedure TfDetail.SeriesG1GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: string);
begin
  try
    if ValueIndex <> Current then
    begin
      MarkText := '';
    end else
    begin
      MarkText := FormatDateTime('yy.m.dd hh:nn  ',Chart1.Series[0].XValue[ValueIndex])
                + FormatFloat('0.#',Chart1.Series[0].YValue[ValueIndex])+'℃';

      with UniQueryGraphGetMark do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select top(1) T.DOut1, T.DOut2, T.DOut3, T.DOut4, T.DOut5, M.OutCount, T.DefrostMode, T.DefrostState,');
        SQL.Add('( CASE WHEN ISNULL(C.Out1,'''') = '''' THEN M.K1Name ELSE C.Out1 END ) as K1,');
        SQL.Add('( CASE WHEN ISNULL(C.Out2,'''') = '''' THEN M.K2Name ELSE C.Out2 END ) as K2,');
        SQL.Add('( CASE WHEN ISNULL(C.Out3,'''') = '''' THEN M.K3Name ELSE C.Out3 END ) as K3,');
        SQL.Add('( CASE WHEN ISNULL(C.Out4,'''') = '''' THEN M.K4Name ELSE C.Out4 END ) as K4,');
        SQL.Add('( CASE WHEN ISNULL(C.Out5,'''') = '''' THEN M.K5Name ELSE C.Out5 END ) as K5  from TempCheck as T');
        SQL.Add('Left Outer Join ControllerInfo as C');
        SQL.Add('On T.SerialNo = C.SerialNo');
        SQL.Add('Left Outer Join Model as M');
        SQL.Add('On C.ModelCODE = M.Code');
        SQL.Add('Where CheckDate = '+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',Chart1.Series[0].XValue[ValueIndex])+#39);
        Open;
                      {
        if ( (TextDetailModel.Text = 'WT2023C')
          or (TextDetailModel.Text = 'W1120DC2S')
          or (TextDetailModel.Text = 'WK2023C')  )
          And (FieldByName('DefrostState').AsBoolean) then
        begin
          if FieldByName('DefrostMode').AsBoolean then
          begin
            MarkText := MarkText+ '  수동제상';
          end else
          begin
            MarkText := MarkText+ '  제상';
          end;
        end else      }
        begin
          if (FieldByName('DOut1').AsBoolean) and (FieldByName('OutCount').AsInteger > 0) then
          begin
            MarkText := MarkText+ '  '+FieldByName('K1').AsString;
          end;
          if (FieldByName('DOut2').AsBoolean) and (FieldByName('OutCount').AsInteger > 1) then
          begin
            MarkText := MarkText+ ' '+FieldByName('K2').AsString;
          end;
          if (FieldByName('DOut3').AsBoolean) and (FieldByName('OutCount').AsInteger > 2) then
          begin
            MarkText := MarkText+ ' '+FieldByName('K3').AsString;
          end;
          if (FieldByName('DOut4').AsBoolean) and (FieldByName('OutCount').AsInteger > 3) then
          begin
            MarkText := MarkText+ ' '+FieldByName('K4').AsString;
          end;
          if (FieldByName('DOut5').AsBoolean) and (FieldByName('OutCount').AsInteger > 4) then
          begin
            MarkText := MarkText+ ' '+FieldByName('K5').AsString;
          end;
        end;
      end;

    end;
  except on e:exception do
    begin
//      Memo1.Lines.Add(e.Message);
    end;
  end;
end;

end.
