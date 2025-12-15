unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,System.StrUtils, System.JSON,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, IdGlobal, ActiveX,
  UniProvider, SQLServerUniProvider, Data.DB, DBAccess, Uni, MemDS, Vcl.StdCtrls,Xml.Win.msxmldom,
  Vcl.ExtCtrls, System.Net.URLClient, System.Net.HttpClient, Xml.XMLDoc, Xml.XMLIntf, SmartStockService,
  System.Net.HttpClientComponent;

type
  TForm1 = class(TForm)
    UniConnection1: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    UniQuery_API: TUniQuery;
    Memo3: TMemo;
    Timer1: TTimer;
    HttpClient: TNetHTTPClient;
    Button1: TButton;
    UniQuery_InsertAPI: TUniQuery;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    flag : integer;
    procedure WriteLog(const Msg: string);  // 스레드에서 메모 기록용
    procedure LogCreate;
    //procedure StartLogThread;  // 스레드
    function  ItemToXML(Item: smartItem): string;
    procedure SaveItemsToXML(const Items: smartMessage; const FileName: string);
    procedure StartLogThread2;
  public
    { Public declarations }

  end;

//  type
//  TSmartItemRecord = record
//    lsindRegistNo, itemCode, makrId, eqpmnCode, eqpmnEsntlSn,
//    eqpmnNo, stallTyCode, stallNo, roomNo, roomDtlNo,
//    mesureDt, mesureVal01: string;
//  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WriteLog(const Msg: string);
begin
  TThread.Queue(nil,
    procedure
    begin
      if Memo3.Lines.Count > 1000 then
        Memo3.Clear;

      Memo3.Lines.Add('['+VARTOSTR(Now) +' ] '+ ' : ' + Msg);
    end
  );
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := TRUE;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  XML: IXMLDocument;
begin
  XML := TXMLDocument.Create(nil);
  XML.Active := True;
  XML.DocumentElement := XML.CreateElement('test', '');
  ShowMessage('MSXML 동작 확인 완료!');
end;

procedure TForm1.LogCreate;
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := true;
   // Memo3.Lines.Add('타이머 시작');
  StartLogThread2;
  //LogCreate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 // Timer1.Enabled := FALSE;
  StartLogThread2;  //

  // LogCreate;
end;


// xml에 넣기
function TForm1.ItemToXML(Item: smartItem): string;
begin
  Result :=
    '  <smartItem>' + sLineBreak +
    '    <lsindRegistNo>' + Item.lsindRegistNo + '</lsindRegistNo>' + sLineBreak +
    '    <itemCode>'      + Item.itemCode      + '</itemCode>' + sLineBreak +
    '    <makrId>'        + Item.makrId        + '</makrId>' + sLineBreak +
    '    <eqpmnCode>'     + Item.eqpmnCode     + '</eqpmnCode>' + sLineBreak +
    '    <eqpmnEsntlSn>'  + Item.eqpmnEsntlSn  + '</eqpmnEsntlSn>' + sLineBreak +
    '    <eqpmnNo>'       + Item.eqpmnNo       + '</eqpmnNo>' + sLineBreak +
    '    <stallTyCode>'   + Item.stallTyCode   + '</stallTyCode>' + sLineBreak +
    '    <stallNo>'       + Item.stallNo       + '</stallNo>' + sLineBreak +
    '    <roomNo>'        + Item.roomNo        + '</roomNo>' + sLineBreak +
    '    <roomDtlNo>'     + Item.roomDtlNo     + '</roomDtlNo>' + sLineBreak +
    '    <mesureDt>'      + Item.mesureDt      + '</mesureDt>' + sLineBreak +
    '    <mesureVal01>'   + Item.mesureVal01   + '</mesureVal01>' + sLineBreak +
    '    <mesureVal02>'   + Item.mesureVal02   + '</mesureVal02>' + sLineBreak +
   	'    <mesureVal03>'   + Item.mesureVal03   + '</mesureVal03>' + sLineBreak +
   	'    <mesureVal04>'   + Item.mesureVal04   + '</mesureVal04>' + sLineBreak +
   	'    <mesureVal05>'   + Item.mesureVal05   + '</mesureVal05>' + sLineBreak +
   	'    <mesureVal06>'   + Item.mesureVal06   + '</mesureVal06>' + sLineBreak +
   	'    <mesureVal07>'   + Item.mesureVal07   + '</mesureVal07>' + sLineBreak +
   	'    <mesureVal08>'   + Item.mesureVal08   + '</mesureVal08>' + sLineBreak +
   	'    <mesureVal09>'   + Item.mesureVal09   + '</mesureVal09>' + sLineBreak +
   	'    <mesureVal10>'   + Item.mesureVal10   + '</mesureVal10>' + sLineBreak +
   	'    <mesureVal11>'   + Item.mesureVal11   + '</mesureVal11>' + sLineBreak +
   	'    <mesureVal12>'   + Item.mesureVal12   + '</mesureVal12>' + sLineBreak +
   	'    <mesureVal13>'   + Item.mesureVal13   + '</mesureVal13>' + sLineBreak +
   	'    <mesureVal14>'   + Item.mesureVal14   + '</mesureVal14>' + sLineBreak +
   	'    <mesureVal15>'   + Item.mesureVal15   + '</mesureVal15>' + sLineBreak +
    '  </smartItem>' + sLineBreak;
end;

// xml 파일 만들기
procedure TForm1.SaveItemsToXML(const Items: smartMessage; const FileName: string);
var
  i: Integer;
  XmlContent: TStringList;
begin
  XmlContent := TStringList.Create;
  try
    XmlContent.Add('<?xml version="1.0" encoding="UTF-8"?>');
    XmlContent.Add('<SmartItems>');

    for i := 0 to Length(Items) - 1 do
    begin
      XmlContent.Add(ItemToXML(Items[i]));
    end;

    XmlContent.Add('</SmartItems>');
    XmlContent.SaveToFile(FileName, TEncoding.UTF8);
  finally
    XmlContent.Free;
  end;
end;

procedure TForm1.StartLogThread2;
  var
    Items: smartMessage;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      i,j : Integer;
      Service: SmartStockServicePort;
      ResultStr, UserNames: string;
      Item: smartItem;
    begin
      CoInitialize(nil);
      try
        TThread.Synchronize(nil,
          procedure
          begin
            if not UniQuery_API.Active then
              UniQuery_API.Active := True
            else
              UniQuery_API.Refresh;
            UniQuery_API.First;
            // smartItem 배열 생성
            SetLength(Items, UniQuery_API.RecordCount);
            i := 0;
            UserNames := '';
            while not UniQuery_API.Eof do
            begin
              Item := smartItem.Create;
              Item.lsindRegistNo := UniQuery_API.FieldByName('lsindRegistNo').AsString;
              Item.itemCode      := UniQuery_API.FieldByName('itemCode').AsString;
              Item.makrId        := UniQuery_API.FieldByName('makrId').AsString;
              Item.eqpmnCode     := UniQuery_API.FieldByName('eqpmnCode').AsString;
              Item.eqpmnEsntlSn  := UniQuery_API.FieldByName('eqpmnEsntlSn').AsString;
              Item.eqpmnNo       := UniQuery_API.FieldByName('eqpmnNo').AsString;
              Item.stallTyCode   := UniQuery_API.FieldByName('stallTyCode').AsString;
              Item.stallNo       := UniQuery_API.FieldByName('stallNo').AsString;
              Item.roomNo        := UniQuery_API.FieldByName('roomNo').AsString;
              Item.roomDtlNo     := UniQuery_API.FieldByName('roomDtlNo').AsString;
              Item.mesureVal01   := UniQuery_API.FieldByName('Temp').AsString;
              Item.mesureDt      := UniQuery_API.FieldByName('MDate').AsString;

              Item.mesureVal02 := '10';   //전송주기 분단위
              Item.mesureVal03 := '1';    //장비 동작 상태
              // 안쓰는 가변컬럼
              Item.mesureVal04 := '';
              Item.mesureVal05 := '';
              Item.mesureVal06 := '';
              Item.mesureVal07 := '';
              Item.mesureVal08 := '';
              Item.mesureVal09 := '';
              Item.mesureVal10 := '';
              Item.mesureVal11 := '';
              Item.mesureVal12 := '';
              Item.mesureVal13 := '';
              Item.mesureVal14 := '';
              Item.mesureVal15 := '';

              if UniQuery_API.FieldByName('UserName').AsString <> '' then
              begin
                if UserNames = '' then
                begin
                  UserNames :=  UniQuery_API.FieldByName('UserName').AsString;
                end
                else
                begin
                  UserNames := UserNames +', '+UniQuery_API.FieldByName('UserName').AsString;
                end;
              end;

              Items[i] := Item;
              Inc(i);
              UniQuery_API.Next;
            end;
          end
        );

        if i > 0 then  // 조회된 데이터 있으면 전송
        begin
          // SOAP 전송
          try
            Service := GetSmartStockServicePort(TRUE, '', nil); // 웹 서비스 호출
            ResultStr := Service.sendSmartMessage(Items);       // api전송, 결과값 변수로 받기
            TThread.Synchronize(nil,
              procedure
              begin
                WriteLog('SOAP 응답: ' + ResultStr + ' {'+UserNames+'}'); // memo에 추가
              end
            );
            if ResultStr = 'SUCCESS' then
            begin
              UniQuery_API.First;
              for j := 0 to UniQuery_API.RecordCount -1 do     //api 전송 성공 후 Log 저장
              begin
                try
                  with UniQuery_InsertAPI do
                  begin
                    Close;
                    ParamByName('CheckDate').AsString := UniQuery_API.FieldByName('MDate').AsString;
                    ParamByName('SerialNo').AsString  := UniQuery_API.FieldByName('SerialNo').AsString;
                    ParamByName('Temp').AsCurrency    := UniQuery_API.FieldByName('Temp').AsCurrency;
                    ParamByName('UserName').AsString  := UniQuery_API.FieldByName('UserName').AsString;
                    ExecSQL;
                  end;
                except
                  on E: Exception do
                    WriteLog('DB Insert 실패: ' + E.Message);
                end;
              end;
            end;
          except
            on E: Exception do
              TThread.Synchronize(nil,
                procedure
                begin
                  WriteLog('SOAP 전송 에러: ' + E.Message);
                end
              );
          end;

          if Timer1.Enabled = false then
          begin
            SaveItemsToXML(Items, 'C:\Xml_Log\SmartItems.xml');  // 파일저장
          end;

          // 메모리 해제
          for i := 0 to High(Items) do
            Items[i].Free;
        end;
      finally
        CoUninitialize;
      end;
    end
  ).Start;
end;

//end;
//  // 먼저 데이터를 UI 스레드에서 복사
//  TThread.Synchronize(nil,
//    procedure
//    var
//      i: Integer;
//      GetDate: string;
//    begin
//      try
//        if not UniQuery_API.Active then
//          UniQuery_API.Active := True
//        else
//          UniQuery_API.Refresh;
//
//          // Refresh면 처음부터
//        UniQuery_API.First;
//        SetLength(DataList, UniQuery_API.RecordCount);
//        i := 0;
//
//        // 등록된 축산업 정보 있는 디바이스만큼
//        while not UniQuery_API.Eof do
//        begin
//          GetDate := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
//          with DataList[i] do
//          begin
//            lsindRegistNo := UniQuery_API.FieldByName('lsindRegistNo').AsString;
//            itemCode      := UniQuery_API.FieldByName('itemCode').AsString;
//            makrId        := UniQuery_API.FieldByName('makrId').AsString;
//            eqpmnCode     := UniQuery_API.FieldByName('eqpmnCode').AsString;
//            eqpmnEsntlSn  := UniQuery_API.FieldByName('eqpmnEsntlSn').AsString;
//            eqpmnNo       := UniQuery_API.FieldByName('eqpmnNo').AsString;
//            stallTyCode   := UniQuery_API.FieldByName('stallTyCode').AsString;
//            stallNo       := UniQuery_API.FieldByName('stallNo').AsString;
//            roomNo        := UniQuery_API.FieldByName('roomNo').AsString;
//            roomDtlNo     := UniQuery_API.FieldByName('roomDtlNo').AsString;
//            mesureVal01   := UniQuery_API.FieldByName('Temp').AsString;
//            mesureDt      := GetDate;
//          end;
//          Inc(i);
//          UniQuery_API.Next;
//        end;
//      except
//        on E: Exception do
//          WriteLog('쿼리 조회 에러 : ' + E.Message);
//      end;
//    end
//  );
//
//  //  스레드 실행
//  TThread.CreateAnonymousThread(
//    procedure
//    var
//      i: Integer;
//      Items: smartMessage;
//      Item: smartItem;
//      Service: SmartStockServicePort;
//      ResultStr: string;
//    begin
//      CoInitialize(nil);
//      try
//        SetLength(Items, Length(DataList));
//
//        for i := 0 to High(DataList) do
//        begin
//          Item := smartItem.Create;
//          try
//            Item.lsindRegistNo := DataList[i].lsindRegistNo;
//            Item.itemCode      := DataList[i].itemCode;
//            Item.makrId        := DataList[i].makrId;
//            Item.eqpmnCode     := DataList[i].eqpmnCode;
//            Item.eqpmnEsntlSn  := DataList[i].eqpmnEsntlSn;
//            Item.eqpmnNo       := DataList[i].eqpmnNo;
//            Item.stallTyCode   := DataList[i].stallTyCode;
//            Item.stallNo       := DataList[i].stallNo;
//            Item.roomNo        := DataList[i].roomNo;
//            Item.roomDtlNo     := DataList[i].roomDtlNo;
//            Item.mesureDt      := DataList[i].mesureDt;
//            Item.mesureVal01   := DataList[i].mesureVal01;
//
//            Item.mesureVal02 := '10';   //전송주기 분단위
//            Item.mesureVal03 := '1';     //장비 동작 상태 ()
//
//            // 나머지 값 수집안함
//            Item.mesureVal04 := '';
//            Item.mesureVal05 := '';
//            Item.mesureVal06 := '';
//            Item.mesureVal07 := '';
//            Item.mesureVal08 := '';
//            Item.mesureVal09 := '';
//            Item.mesureVal10 := '';
//            Item.mesureVal11 := '';
//            Item.mesureVal12 := '';
//            Item.mesureVal13 := '';
//            Item.mesureVal14 := '';
//            Item.mesureVal15 := '';
//          except
//            on E: Exception do
//            begin
//              TThread.Synchronize(nil,
//                procedure
//                begin
//                  WriteLog('레코드 처리 에러: ' + E.Message);
//                end
//              );
//              Item.Free;
//              Continue;
//            end;
//          end;
//          Items[i] := Item;
//        end;
//
//        // SOAP 호출
//        try
//          Service := GetSmartStockServicePort(TRUE, '', nil);
//          ResultStr := Service.sendSmartMessage(Items);   //  전송
//
//          TThread.Synchronize(nil,
//            procedure
//            var
//              j: Integer;
//            begin
//              WriteLog('SOAP 응답: '+ ResultStr + sLineBreak);
//
//              for j := 0 to High(DataList) do
//              begin
//                try
//                  with UniQuery_InsertAPI do
//                  begin
//                    Close;
//                    ParamByName('CheckDate').AsString := DataList[j].lsindRegistNo;
//                    ParamByName('SerialNo').AsString  := DataList[j].itemCode;
//                    ParamByName('Temp').AsString      := DataList[j].makrId;
//                    ExecSQL;
//                  end;
//                except
//                  on E: Exception do
//                    WriteLog('DB Insert 실패: ' + E.Message);
//                end;
//              end;
//
//            end
//          );
//        except
//          on E: Exception do
//            TThread.Synchronize(nil,
//              procedure
//              begin
//                WriteLog('SOAP 전송 에러: ' + E.Message+ sLineBreak);
//              end
//            );
//        end;
//        // SaveItemsToXML(Items, 'C:\Xml_Log\SmartItems.xml');   파일저장
//
//        // 메모리 해제
//        for i := 0 to High(Items) do
//          Items[i].Free;
//
//      finally
//        CoUninitialize;
//      end;
//    end
//  ).Start;
//end;

end.
