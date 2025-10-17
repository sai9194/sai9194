// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://smart.ekape.or.kr/stockWs/webservices/SmartStockService?wsdl
//  >Import : https://smart.ekape.or.kr/stockWs/webservices/SmartStockService?wsdl>0
// Encoding : UTF-8
// Version  : 1.0
// (2025-04-15 ¿ÀÈÄ 5:30:03 - - $Rev: 108085 $)
// ************************************************************************ //

unit SmartStockService;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_UNQL = $0008;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  smartItem            = class;                 { "http://smart.webservice.itis.epis.org/"[GblCplx] }

  smartMessage = array of smartItem;            { "http://smart.webservice.itis.epis.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : smartItem, global, <complexType>
  // Namespace : http://smart.webservice.itis.epis.org/
  // ************************************************************************ //
  smartItem = class(TRemotable)
  private
    FeqpmnCode: string;
    FeqpmnCode_Specified: boolean;
    FeqpmnEsntlSn: string;
    FeqpmnEsntlSn_Specified: boolean;
    FeqpmnNo: string;
    FeqpmnNo_Specified: boolean;
    FitemCode: string;
    FitemCode_Specified: boolean;
    FlsindRegistNo: string;
    FlsindRegistNo_Specified: boolean;
    FmakrId: string;
    FmakrId_Specified: boolean;
    FmesureDt: string;
    FmesureDt_Specified: boolean;
    FmesureVal01: string;
    FmesureVal01_Specified: boolean;
    FmesureVal02: string;
    FmesureVal02_Specified: boolean;
    FmesureVal03: string;
    FmesureVal03_Specified: boolean;
    FmesureVal04: string;
    FmesureVal04_Specified: boolean;
    FmesureVal05: string;
    FmesureVal05_Specified: boolean;
    FmesureVal06: string;
    FmesureVal06_Specified: boolean;
    FmesureVal07: string;
    FmesureVal07_Specified: boolean;
    FmesureVal08: string;
    FmesureVal08_Specified: boolean;
    FmesureVal09: string;
    FmesureVal09_Specified: boolean;
    FmesureVal10: string;
    FmesureVal10_Specified: boolean;
    FmesureVal11: string;
    FmesureVal11_Specified: boolean;
    FmesureVal12: string;
    FmesureVal12_Specified: boolean;
    FmesureVal13: string;
    FmesureVal13_Specified: boolean;
    FmesureVal14: string;
    FmesureVal14_Specified: boolean;
    FmesureVal15: string;
    FmesureVal15_Specified: boolean;
    FroomDtlNo: string;
    FroomDtlNo_Specified: boolean;
    FroomNo: string;
    FroomNo_Specified: boolean;
    FstallNo: string;
    FstallNo_Specified: boolean;
    FstallTyCode: string;
    FstallTyCode_Specified: boolean;
    procedure SeteqpmnCode(Index: Integer; const Astring: string);
    function  eqpmnCode_Specified(Index: Integer): boolean;
    procedure SeteqpmnEsntlSn(Index: Integer; const Astring: string);
    function  eqpmnEsntlSn_Specified(Index: Integer): boolean;
    procedure SeteqpmnNo(Index: Integer; const Astring: string);
    function  eqpmnNo_Specified(Index: Integer): boolean;
    procedure SetitemCode(Index: Integer; const Astring: string);
    function  itemCode_Specified(Index: Integer): boolean;
    procedure SetlsindRegistNo(Index: Integer; const Astring: string);
    function  lsindRegistNo_Specified(Index: Integer): boolean;
    procedure SetmakrId(Index: Integer; const Astring: string);
    function  makrId_Specified(Index: Integer): boolean;
    procedure SetmesureDt(Index: Integer; const Astring: string);
    function  mesureDt_Specified(Index: Integer): boolean;
    procedure SetmesureVal01(Index: Integer; const Astring: string);
    function  mesureVal01_Specified(Index: Integer): boolean;
    procedure SetmesureVal02(Index: Integer; const Astring: string);
    function  mesureVal02_Specified(Index: Integer): boolean;
    procedure SetmesureVal03(Index: Integer; const Astring: string);
    function  mesureVal03_Specified(Index: Integer): boolean;
    procedure SetmesureVal04(Index: Integer; const Astring: string);
    function  mesureVal04_Specified(Index: Integer): boolean;
    procedure SetmesureVal05(Index: Integer; const Astring: string);
    function  mesureVal05_Specified(Index: Integer): boolean;
    procedure SetmesureVal06(Index: Integer; const Astring: string);
    function  mesureVal06_Specified(Index: Integer): boolean;
    procedure SetmesureVal07(Index: Integer; const Astring: string);
    function  mesureVal07_Specified(Index: Integer): boolean;
    procedure SetmesureVal08(Index: Integer; const Astring: string);
    function  mesureVal08_Specified(Index: Integer): boolean;
    procedure SetmesureVal09(Index: Integer; const Astring: string);
    function  mesureVal09_Specified(Index: Integer): boolean;
    procedure SetmesureVal10(Index: Integer; const Astring: string);
    function  mesureVal10_Specified(Index: Integer): boolean;
    procedure SetmesureVal11(Index: Integer; const Astring: string);
    function  mesureVal11_Specified(Index: Integer): boolean;
    procedure SetmesureVal12(Index: Integer; const Astring: string);
    function  mesureVal12_Specified(Index: Integer): boolean;
    procedure SetmesureVal13(Index: Integer; const Astring: string);
    function  mesureVal13_Specified(Index: Integer): boolean;
    procedure SetmesureVal14(Index: Integer; const Astring: string);
    function  mesureVal14_Specified(Index: Integer): boolean;
    procedure SetmesureVal15(Index: Integer; const Astring: string);
    function  mesureVal15_Specified(Index: Integer): boolean;
    procedure SetroomDtlNo(Index: Integer; const Astring: string);
    function  roomDtlNo_Specified(Index: Integer): boolean;
    procedure SetroomNo(Index: Integer; const Astring: string);
    function  roomNo_Specified(Index: Integer): boolean;
    procedure SetstallNo(Index: Integer; const Astring: string);
    function  stallNo_Specified(Index: Integer): boolean;
    procedure SetstallTyCode(Index: Integer; const Astring: string);
    function  stallTyCode_Specified(Index: Integer): boolean;
  published
    property eqpmnCode:     string  Index (IS_OPTN or IS_UNQL) read FeqpmnCode write SeteqpmnCode stored eqpmnCode_Specified;
    property eqpmnEsntlSn:  string  Index (IS_OPTN or IS_UNQL) read FeqpmnEsntlSn write SeteqpmnEsntlSn stored eqpmnEsntlSn_Specified;
    property eqpmnNo:       string  Index (IS_OPTN or IS_UNQL) read FeqpmnNo write SeteqpmnNo stored eqpmnNo_Specified;
    property itemCode:      string  Index (IS_OPTN or IS_UNQL) read FitemCode write SetitemCode stored itemCode_Specified;
    property lsindRegistNo: string  Index (IS_OPTN or IS_UNQL) read FlsindRegistNo write SetlsindRegistNo stored lsindRegistNo_Specified;
    property makrId:        string  Index (IS_OPTN or IS_UNQL) read FmakrId write SetmakrId stored makrId_Specified;
    property mesureDt:      string  Index (IS_OPTN or IS_UNQL) read FmesureDt write SetmesureDt stored mesureDt_Specified;
    property mesureVal01:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal01 write SetmesureVal01 stored mesureVal01_Specified;
    property mesureVal02:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal02 write SetmesureVal02 stored mesureVal02_Specified;
    property mesureVal03:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal03 write SetmesureVal03 stored mesureVal03_Specified;
    property mesureVal04:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal04 write SetmesureVal04 stored mesureVal04_Specified;
    property mesureVal05:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal05 write SetmesureVal05 stored mesureVal05_Specified;
    property mesureVal06:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal06 write SetmesureVal06 stored mesureVal06_Specified;
    property mesureVal07:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal07 write SetmesureVal07 stored mesureVal07_Specified;
    property mesureVal08:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal08 write SetmesureVal08 stored mesureVal08_Specified;
    property mesureVal09:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal09 write SetmesureVal09 stored mesureVal09_Specified;
    property mesureVal10:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal10 write SetmesureVal10 stored mesureVal10_Specified;
    property mesureVal11:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal11 write SetmesureVal11 stored mesureVal11_Specified;
    property mesureVal12:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal12 write SetmesureVal12 stored mesureVal12_Specified;
    property mesureVal13:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal13 write SetmesureVal13 stored mesureVal13_Specified;
    property mesureVal14:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal14 write SetmesureVal14 stored mesureVal14_Specified;
    property mesureVal15:   string  Index (IS_OPTN or IS_UNQL) read FmesureVal15 write SetmesureVal15 stored mesureVal15_Specified;
    property roomDtlNo:     string  Index (IS_OPTN or IS_UNQL) read FroomDtlNo write SetroomDtlNo stored roomDtlNo_Specified;
    property roomNo:        string  Index (IS_OPTN or IS_UNQL) read FroomNo write SetroomNo stored roomNo_Specified;
    property stallNo:       string  Index (IS_OPTN or IS_UNQL) read FstallNo write SetstallNo stored stallNo_Specified;
    property stallTyCode:   string  Index (IS_OPTN or IS_UNQL) read FstallTyCode write SetstallTyCode stored stallTyCode_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://smart.webservice.itis.epis.org/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : SmartStockServiceSoapBinding
  // service   : SmartStockService
  // port      : SmartStockServicePort
  // URL       : https://smart.ekape.or.kr/stockWs/webservices/SmartStockService
  // ************************************************************************ //
  SmartStockServicePort = interface(IInvokable)
  ['{DDEE4101-5E74-3D69-857A-824CC78A8B77}']
    function  sendSmartMessage(const arg0: smartMessage): string; stdcall;
  end;

function GetSmartStockServicePort(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SmartStockServicePort;


implementation
  uses System.SysUtils;

function GetSmartStockServicePort(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SmartStockServicePort;
const
  defWSDL = 'https://smart.ekape.or.kr/stockWs/webservices/SmartStockService?wsdl';
  defURL  = 'https://smart.ekape.or.kr/stockWs/webservices/SmartStockService';
  defSvc  = 'SmartStockService';
  defPrt  = 'SmartStockServicePort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as SmartStockServicePort);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure smartItem.SeteqpmnCode(Index: Integer; const Astring: string);
begin
  FeqpmnCode := Astring;
  FeqpmnCode_Specified := True;
end;

function smartItem.eqpmnCode_Specified(Index: Integer): boolean;
begin
  Result := FeqpmnCode_Specified;
end;

procedure smartItem.SeteqpmnEsntlSn(Index: Integer; const Astring: string);
begin
  FeqpmnEsntlSn := Astring;
  FeqpmnEsntlSn_Specified := True;
end;

function smartItem.eqpmnEsntlSn_Specified(Index: Integer): boolean;
begin
  Result := FeqpmnEsntlSn_Specified;
end;

procedure smartItem.SeteqpmnNo(Index: Integer; const Astring: string);
begin
  FeqpmnNo := Astring;
  FeqpmnNo_Specified := True;
end;

function smartItem.eqpmnNo_Specified(Index: Integer): boolean;
begin
  Result := FeqpmnNo_Specified;
end;

procedure smartItem.SetitemCode(Index: Integer; const Astring: string);
begin
  FitemCode := Astring;
  FitemCode_Specified := True;
end;

function smartItem.itemCode_Specified(Index: Integer): boolean;
begin
  Result := FitemCode_Specified;
end;

procedure smartItem.SetlsindRegistNo(Index: Integer; const Astring: string);
begin
  FlsindRegistNo := Astring;
  FlsindRegistNo_Specified := True;
end;

function smartItem.lsindRegistNo_Specified(Index: Integer): boolean;
begin
  Result := FlsindRegistNo_Specified;
end;

procedure smartItem.SetmakrId(Index: Integer; const Astring: string);
begin
  FmakrId := Astring;
  FmakrId_Specified := True;
end;

function smartItem.makrId_Specified(Index: Integer): boolean;
begin
  Result := FmakrId_Specified;
end;

procedure smartItem.SetmesureDt(Index: Integer; const Astring: string);
begin
  FmesureDt := Astring;
  FmesureDt_Specified := True;
end;

function smartItem.mesureDt_Specified(Index: Integer): boolean;
begin
  Result := FmesureDt_Specified;
end;

procedure smartItem.SetmesureVal01(Index: Integer; const Astring: string);
begin
  FmesureVal01 := Astring;
  FmesureVal01_Specified := True;
end;

function smartItem.mesureVal01_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal01_Specified;
end;

procedure smartItem.SetmesureVal02(Index: Integer; const Astring: string);
begin
  FmesureVal02 := Astring;
  FmesureVal02_Specified := True;
end;

function smartItem.mesureVal02_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal02_Specified;
end;

procedure smartItem.SetmesureVal03(Index: Integer; const Astring: string);
begin
  FmesureVal03 := Astring;
  FmesureVal03_Specified := True;
end;

function smartItem.mesureVal03_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal03_Specified;
end;

procedure smartItem.SetmesureVal04(Index: Integer; const Astring: string);
begin
  FmesureVal04 := Astring;
  FmesureVal04_Specified := True;
end;

function smartItem.mesureVal04_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal04_Specified;
end;

procedure smartItem.SetmesureVal05(Index: Integer; const Astring: string);
begin
  FmesureVal05 := Astring;
  FmesureVal05_Specified := True;
end;

function smartItem.mesureVal05_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal05_Specified;
end;

procedure smartItem.SetmesureVal06(Index: Integer; const Astring: string);
begin
  FmesureVal06 := Astring;
  FmesureVal06_Specified := True;
end;

function smartItem.mesureVal06_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal06_Specified;
end;

procedure smartItem.SetmesureVal07(Index: Integer; const Astring: string);
begin
  FmesureVal07 := Astring;
  FmesureVal07_Specified := True;
end;

function smartItem.mesureVal07_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal07_Specified;
end;

procedure smartItem.SetmesureVal08(Index: Integer; const Astring: string);
begin
  FmesureVal08 := Astring;
  FmesureVal08_Specified := True;
end;

function smartItem.mesureVal08_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal08_Specified;
end;

procedure smartItem.SetmesureVal09(Index: Integer; const Astring: string);
begin
  FmesureVal09 := Astring;
  FmesureVal09_Specified := True;
end;

function smartItem.mesureVal09_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal09_Specified;
end;

procedure smartItem.SetmesureVal10(Index: Integer; const Astring: string);
begin
  FmesureVal10 := Astring;
  FmesureVal10_Specified := True;
end;

function smartItem.mesureVal10_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal10_Specified;
end;

procedure smartItem.SetmesureVal11(Index: Integer; const Astring: string);
begin
  FmesureVal11 := Astring;
  FmesureVal11_Specified := True;
end;

function smartItem.mesureVal11_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal11_Specified;
end;

procedure smartItem.SetmesureVal12(Index: Integer; const Astring: string);
begin
  FmesureVal12 := Astring;
  FmesureVal12_Specified := True;
end;

function smartItem.mesureVal12_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal12_Specified;
end;

procedure smartItem.SetmesureVal13(Index: Integer; const Astring: string);
begin
  FmesureVal13 := Astring;
  FmesureVal13_Specified := True;
end;

function smartItem.mesureVal13_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal13_Specified;
end;

procedure smartItem.SetmesureVal14(Index: Integer; const Astring: string);
begin
  FmesureVal14 := Astring;
  FmesureVal14_Specified := True;
end;

function smartItem.mesureVal14_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal14_Specified;
end;

procedure smartItem.SetmesureVal15(Index: Integer; const Astring: string);
begin
  FmesureVal15 := Astring;
  FmesureVal15_Specified := True;
end;

function smartItem.mesureVal15_Specified(Index: Integer): boolean;
begin
  Result := FmesureVal15_Specified;
end;

procedure smartItem.SetroomDtlNo(Index: Integer; const Astring: string);
begin
  FroomDtlNo := Astring;
  FroomDtlNo_Specified := True;
end;

function smartItem.roomDtlNo_Specified(Index: Integer): boolean;
begin
  Result := FroomDtlNo_Specified;
end;

procedure smartItem.SetroomNo(Index: Integer; const Astring: string);
begin
  FroomNo := Astring;
  FroomNo_Specified := True;
end;

function smartItem.roomNo_Specified(Index: Integer): boolean;
begin
  Result := FroomNo_Specified;
end;

procedure smartItem.SetstallNo(Index: Integer; const Astring: string);
begin
  FstallNo := Astring;
  FstallNo_Specified := True;
end;

function smartItem.stallNo_Specified(Index: Integer): boolean;
begin
  Result := FstallNo_Specified;
end;

procedure smartItem.SetstallTyCode(Index: Integer; const Astring: string);
begin
  FstallTyCode := Astring;
  FstallTyCode_Specified := True;
end;

function smartItem.stallTyCode_Specified(Index: Integer): boolean;
begin
  Result := FstallTyCode_Specified;
end;

initialization
  { SmartStockServicePort }
  InvRegistry.RegisterInterface(TypeInfo(SmartStockServicePort), 'http://smart.webservice.itis.epis.org/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SmartStockServicePort), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(SmartStockServicePort), ioDocument);
  { SmartStockServicePort.sendSmartMessage }
  InvRegistry.RegisterMethodInfo(TypeInfo(SmartStockServicePort), 'sendSmartMessage', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SmartStockServicePort), 'sendSmartMessage', 'arg0', '',
                                '[ArrayItemName="smartItemList"]', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SmartStockServicePort), 'sendSmartMessage', 'return', '',
                                '', IS_UNQL);
  RemClassRegistry.RegisterXSInfo(TypeInfo(smartMessage), 'http://smart.webservice.itis.epis.org/', 'smartMessage');
  RemClassRegistry.RegisterXSClass(smartItem, 'http://smart.webservice.itis.epis.org/', 'smartItem');

end.