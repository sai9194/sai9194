unit uDongHwaServer;

interface

uses                         TlHelp32,      System.IOUtils,    ClipBrd, SmartStockService,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp, ActiveX,Xml.Win.msxmldom,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,  Xml.XMLDoc, Xml.XMLIntf,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, MemDS,  System.Generics.Collections, System.SyncObjs,
  DBAccess, Uni, UniProvider, SQLServerUniProvider;

type
  TfDongHwaServer = class(TForm)
    ServerSocket1: TServerSocket;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    TimerError: TTimer;
    TimerError2: TTimer;
    ButtonInfo: TButton;
    EditNumber: TEdit;
    TimerIOT: TTimer;
    Button2: TButton;
    Button3: TButton;
    Edit2: TEdit;
    Panel1: TPanel;
    ButtonSet: TButton;
    Button5: TButton;
    Button6: TButton;
    EditFloat2: TEdit;
    EditOnOff2: TEdit;
    EditHex2: TEdit;
    Button4: TButton;
    Button7: TButton;
    ButtonClose: TButton;
    Memo2: TMemo;
    TimerKillProgram: TTimer;
    TimerLogSave: TTimer;
    LabelIOT: TLabel;
    LabelSocket: TLabel;
    LabelSocketNum: TLabel;
    FDQueryLog: TUniQuery;
    FDQueryIOT: TUniQuery;
    FDQuery1: TUniQuery;
    FDQueryIOTDelete: TUniQuery;
    UniConnection1: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    FDConnection1: TFDConnection;
    Timer_check: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure TimerErrorTimer(Sender: TObject);
    procedure TimerError2Timer(Sender: TObject);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ButtonInfoClick(Sender: TObject);
    procedure LogAdd(Data : String);
    procedure TimerIOTTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonSetClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure TimerKillProgramTimer(Sender: TObject);
    procedure TimerLogSaveTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_checkTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function HexToInt(sHex:String):Integer;
    function BccCalculator(HexString: String; BCCNum: Integer):Integer;
    function Dec2Bin(Value : LongInt) : string;

    function KillProcess(const ProcName: String): Boolean;
    procedure HandleException(Sender: TObject; E: Exception);
//    function AllowEvery10s(const SN: string): Boolean;
//    procedure PurgeLastTs(const MaxIdleMs: UInt64 = 60*60*1000);
  end;

var
  fDongHwaServer: TfDongHwaServer;
  SerialNo, PreTemp, PreSet : Array[0..5000] of String;
  SerialCount : Array[0..10000] of Integer;
  ConnectCount : Integer;
  IOTCommand : Array[0..10000] of Boolean;
  IOTSerialNo : String;
  IOTNo, EditFloat, EditOnOff, EditHex : Array[0..10000] of String;
  PGCloseFlag : Boolean;

  IOTTimerNumber : Integer;
  SocketReadNumber : Integer;
  HitCS: TCriticalSection;
  LastTs: TDictionary<string, UInt64>;

implementation

{$R *.dfm}

function TfDongHwaServer.BccCalculator(HexString: String; BCCNum: Integer): Integer;
var
  loopcnt, BCC: Integer;
  CheckInte : Integer;
begin
  // XOR BCC 알고리즘
  if BCCNum = 1 then
  begin
    BCC := Ord(HexString[1]);
    for loopcnt := 2 to Length(HexString) do
    begin
      CheckInte := Ord(HexString[loopcnt]);
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

procedure TfDongHwaServer.Button1Click(Sender: TObject);
begin
  if ServerSocket1.Active then begin
    ServerSocket1.Active := False;
    Button1.Caption := 'Active';
  end else begin
    ServerSocket1.Port := StrToInt(Edit1.Text);
    ServerSocket1.Active := True;
    Button1.Caption := 'Passive';
  end;
end;

procedure TfDongHwaServer.Button2Click(Sender: TObject);
var
  Index : Integer;
begin
  Index := StrToIntDef(EditNumber.Text,0);
  //Memo1.Lines.Add(Index.ToString + '  =  ' + ServerSocket1.Socket.Connections[Index].RemoteAddress);
  ServerSocket1.Socket.Connections[Index].SendText(AnsiChar(#$02)+AnsiChar(#$01)+AnsiChar(#$10)+AnsiChar(#$03)+AnsiChar(#$12));
  LogAdd('Send : 0x02 0x01 0x10 0x03 0x12');
end;

procedure TfDongHwaServer.Button3Click(Sender: TObject);
var
  i : Integer;
  sCommand : AnsiString;
  TempStr : String;
  PlusStr : String;
  BCC : Integer;
begin

  sCommand := '';
  PlusStr := '';
  TempStr := Edit2.Text;
  BCC := StrToInt('0x'+Copy(TempStr,1,2));
  for i := 1 to (Length(TempStr) div 2) do
  begin
    sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+Copy(TempStr,(i*2)-1,2))));
    PlusStr := PlusStr + Chr(StrToInt('0x'+Copy(TempStr,(i*2)-1,2))) + ' ' ;
    //Memo1.Lines.Add(Copy(TempStr,(i*2)-1,2) + ' : ' + StrToInt('0x'+Copy(TempStr,(i*2)-1,2)).ToString );
    if i <> 1 then  BCC := BCC xor StrToInt('0x'+Copy(TempStr,(i*2)-1,2));
  end;


//  sCommand := AnsiChar(#$04)+AnsiChar(#$20)+AnsiChar(#$01)+AnsiChar(#$00)+AnsiChar(#$C8)+AnsiChar(#$03);
  //Memo1.Lines.Add('BCC Calc :'+IntToHex(BccCalculator(sCommand,1),2));
  //Memo1.Lines.Add('BCC Calc :'+IntToHex(BCC,2));
  //Memo1.Lines.Add(PlusStr);
                                           {

  //Memo1.Lines.Add('BCC Calc :'+IntToHex(BccCalculator(Edit2.Text,1),2));
  //Memo1.Lines.Add(PlusStr);

  sCommand := AnsiChar(#$04)+AnsiChar(#$20)+AnsiChar(#$01)+AnsiChar(#$00)+AnsiChar(#$C8)+AnsiChar(#$03);
//              //Memo1.Lines.Add('TEST1 : 0x02 0x04 0x20 0x0'+EditOnOff.Text+' 0x'+Copy(EditHex.Text,1,2)+' 0x'+Copy(EditHex.Text,3,2)+' 0x03 0x'+IntToHex(BccCalculator(sCommand,1),2));
//              sCommand := AnsiChar(#$02) + sCommand + AnsiChar(#$EE);//Chr(BccCalculator(sCommand,1));

              //Memo1.Lines.Add( IntToHex(Ord(#$EE)) );
              //Memo1.Lines.Add( IntToHex(BccCalculator(sCommand,1),2)); }
end;

procedure TfDongHwaServer.Button4Click(Sender: TObject);
begin
  EditHex2.Text := IntToHex(StrToIntDef(EditFloat2.Text,0),4);
end;

procedure TfDongHwaServer.ButtonSetClick(Sender: TObject);
var
  Index : Integer;
begin
//  IOTCommand := True;
end;

procedure TfDongHwaServer.Button5Click(Sender: TObject);
var
  Index : Integer;
begin
//  TEST2 := True;
  {
  try
    Index := StrToIntDef(EditNumber.Text,0);
    //Memo1.Lines.Add(Index.ToString + '  =  ' + ServerSocket1.Socket.Connections[Index].RemoteAddress);
    ServerSocket1.Socket.Connections[Index].SendText(AnsiChar(#$02)+AnsiChar(#$04)+AnsiChar(#$20)+AnsiChar(#$00)+AnsiChar(#$00)+AnsiChar(#$C8)+AnsiChar(#$03)+AnsiChar(#$EF));
    LogAdd('Send : 0x02 0x04 0x20 0x01 0x00 0x64 0x03 0x42');
  except on e:exception do
    begin
      //Memo1.Lines.Add(e.Message);
    end;
  end;
  }
end;

procedure TfDongHwaServer.Button6Click(Sender: TObject);
var
  Index : Integer;
begin
//  TEST3 := True;
  {
  try
    Index := StrToIntDef(EditNumber.Text,0);
    //Memo1.Lines.Add(Index.ToString + '  =  ' + ServerSocket1.Socket.Connections[Index].RemoteAddress);
    ServerSocket1.Socket.Connections[Index].SendText(AnsiChar(#$02)+AnsiChar(#$04)+AnsiChar(#$20)+AnsiChar(#$00)+AnsiChar(#$00)+AnsiChar(#$C8)+AnsiChar(#$03)+AnsiChar(#$EF));
    LogAdd('Send : 0x02 0x04 0x20 0x00 0x00 0x64 0x03 0x43');
  except on e:exception do
    begin
      //Memo1.Lines.Add(e.Message);
    end;
  end;
  }
end;

procedure TfDongHwaServer.Button7Click(Sender: TObject);
begin
//  Showmessage(FormatFloat('#,0.##',HexToInt('FF38') / 10));
  Showmessage(IntToHex(StrToIntDef('11',0),4))
end;

procedure TfDongHwaServer.ButtonCloseClick(Sender: TObject);
begin
  ButtonClose.Caption := '종료중..';
  PGCloseFlag := True;
end;

procedure TfDongHwaServer.ButtonInfoClick(Sender: TObject);
var
  Index : Integer;
begin
  try
    Index := StrToIntDef(EditNumber.Text,0);
    //Memo1.Lines.Add(Index.ToString + '  =  ' + ServerSocket1.Socket.Connections[Index].RemoteAddress);
    ServerSocket1.Socket.Connections[Index].SendText(AnsiChar(#$02)+AnsiChar(#$01)+AnsiChar(#$1A)+AnsiChar(#$03)+AnsiChar(#$1A));
    LogAdd('Send : 0x02 0x01 0x1A 0x03 0x1A');
  except on e:exception do
    begin
      Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss ',Now) + e.Message);
    end;
  end;
end;

function TfDongHwaServer.Dec2Bin(Value: LongInt): string;
var
  i : integer;
  s : string;
begin
  s := '';

  for i := 7 downto 0 do
    if (Value and (1 shl i)) <> 0 then s := s + '1'
                                  else s := s + '0';

  Result := s;
end;

procedure TfDongHwaServer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  LastTs.Free;
//  HitCS.Free;
end;

procedure TfDongHwaServer.FormCreate(Sender: TObject);
begin
  Application.OnException := HandleException;
end;

procedure TfDongHwaServer.FormShow(Sender: TObject);
var
  i : integer;
begin
  Memo2.Lines.Text := Clipboard.AsText;
  PGCloseFlag := False;
  Button1.Click;
  ConnectCount := 0;
  IOTTimerNumber := 0;
  for i := 0 to 500 do
  begin
    SerialCount[i] := 77;
    SerialNo[i] := '';
  end;
  for i := 0 to 1000 do
  begin
    IOTCommand[i] := False;
  end;

end;

procedure TfDongHwaServer.HandleException(Sender: TObject; E: Exception);
begin
  Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss ',Now) + ' HE : '+e.Message);
end;

function TfDongHwaServer.HexToInt(sHex: String): Integer;
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

function TfDongHwaServer.KillProcess(const ProcName: String): Boolean;
var
  Process32: TProcessEntry32;
  SHandle:   THandle;
  Next:      Boolean;
  hProcess: THandle;
  i: Integer;

begin
  Result:=True;

  Process32.dwSize       :=SizeOf(TProcessEntry32);
  Process32.th32ProcessID:=0;
  SHandle                :=CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  // 종료하고자 하는 프로세스가 실행중인지 확인하는 의미와 함께...
  if Process32First(SHandle, Process32) then begin
    repeat
      Next:=Process32Next(SHandle, Process32);
      if AnsiCompareText(Process32.szExeFile, Trim(ProcName))=0 then break;
    until not Next;
  end;
  CloseHandle(SHandle);

  // 프로세스가 실행중이라면 Open & Terminate
  if Process32.th32ProcessID<>0 then begin
    hProcess:=OpenProcess(PROCESS_TERMINATE, True, Process32.th32ProcessID);
    if hProcess<>0 then begin
      if not TerminateProcess(hProcess, 0) then Result:=False;
    end
    // 프로세스 열기 실패
    else Result:=False;

    CloseHandle(hProcess);
  end // if Process32.th32ProcessID<>0
  else Result:=False;
end;

procedure TfDongHwaServer.LogAdd(Data: String);
begin
  //Memo1.Lines.Add(Data);

  try
    FDQueryLog.Close;
    FDQueryLog.SQL.Clear;
    FDQueryLog.SQL.Add('Insert into ServerLog(DataTime, Note)');
    FDQueryLog.SQL.Add('Values(GetDate(), '+#39+Data+#39+')');
    FDQueryLog.ExecSQL;
  except on e : exception do
    Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss ',Now) + ' E : '+e.Message);
  end;

end;

procedure TfDongHwaServer.Memo1Change(Sender: TObject);
begin
  if Memo1.Lines.Count > 1000 then
  begin
    Memo1.Lines.Clear;
  end;
end;

procedure TfDongHwaServer.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  S : string;
begin
  S := '['+FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)+'] Connected : ' + Socket.RemoteAddress;
  LogAdd(S);            {
  Sleep(1000);
  Socket.SendText(AnsiChar(#$02)+AnsiChar(#$01)+AnsiChar(#$1A)+AnsiChar(#$03));
  LogAdd('Send : 0x02 0x01 0x1A 0x03');       }

  Socket.SendText(AnsiChar(#$02)+AnsiChar(#$01)+AnsiChar(#$10)+AnsiChar(#$03)+AnsiChar(#$12));

  //Memo1.Lines.Add(Socket.RemoteAddress + ' = Send : 0x02 0x01 0x10 0x03 0x12' + Socket.RemoteAddress);
end;

procedure TfDongHwaServer.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  S : string;
begin
  S := Socket.RemoteHost + ':' + Socket.RemoteAddress + 'DisConnected'
       +FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
  LogAdd(S);
end;

procedure TfDongHwaServer.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ServerSocket1.Active := False;
  TimerError.Enabled := True;
end;

procedure TfDongHwaServer.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  BCC : Integer;
  StateStr : String;
  i : Integer;
  Receive_data     : string;
  receive_count    : integer;
  ReceiveBuffer	   : array[0..1000] of Char;
  MyThread00 : TThread;
  TempData : String;
  ConnectSerialNo : Integer;
  sCommand: AnsiString;
  TempStr : String;
  PowerState, DefrostMode, DefrostState,
  DIn1, DIn2, DIn3, DIn4, DIn5, DOut1, DOut2, DOut3, DOut4, DOut5 : Boolean;
  Err : String;
  procedure Wait(Number: Integer; Proc: TProc);
  var
    Thread: array[0..100] of TThread;
  begin
    if PGCloseFlag then Exit;

    Thread[Number] := TThread.CreateAnonymousThread(
      procedure()
      begin
        Proc;
      end);
    Thread[Number].FreeOnTerminate := True;
    Thread[Number].Start;

    while not Thread[Number].Finished do Application.ProcessMessages;
  end;
begin
  try
    FillChar(ReceiveBuffer,1000,#0);
    receive_count := Socket.ReceiveBuf(ReceiveBuffer,1000);
    Receive_data := '';

    if(receive_count > 0)then
    begin
      for i := 0 to 14 do begin
        TempData := inttohex(integer(ReceiveBuffer[i]),4);
        Receive_data := Receive_data + Copy(TempData,3,2) + Copy(TempData,1,2);
      end;

       //if not AllowEvery10s(Copy(Receive_data,7,24)) then Exit; // 타이머 251014 김동휘 추가

      if Copy(Receive_data,1,6) = '021A10' then
      begin
          //Memo1.Lines.Add('ID : '+Copy(Receive_data,7,24));
          StateStr := Dec2Bin(HexToInt(Copy(Receive_data,31,2)));

          Err := Copy(StateStr,2,3);
//          //Memo1.Lines.Add('예비321 : '+Copy(StateStr,5,3));

          if Copy(StateStr,6,1) = '0' then DefrostMode := False else DefrostMode := True;    // 제상모드
          if Copy(StateStr,7,1) = '0' then DefrostState := False else DefrostState := True;  // 제상동작
//          //Memo1.Lines.Add('전원OnOff : '+Copy(StateStr,8,1));
          if Copy(StateStr,8,1) = '0' then PowerState := False else PowerState := True;


          StateStr := Dec2Bin(HexToInt(Copy(Receive_data,53,2)));
//          //Memo1.Lines.Add('DI : '+Copy(StateStr,1,8));
          if Copy(StateStr,8,1) = '1' then DIn1 := True else DIn1 := False;
          if Copy(StateStr,7,1) = '1' then DIn2 := True else DIn2 := False;
          if Copy(StateStr,6,1) = '1' then DIn3 := True else DIn3 := False;
          if Copy(StateStr,5,1) = '1' then DIn4 := True else DIn4 := False;
          if Copy(StateStr,4,1) = '1' then DIn5 := True else DIn5 := False;

          StateStr := Dec2Bin(HexToInt(Copy(Receive_data,55,2)));
//          //Memo1.Lines.Add('DO : '+Copy(StateStr,1,8));
          if Copy(StateStr,8,1) = '1' then DOut1 := True else DOut1 := False;
          if Copy(StateStr,7,1) = '1' then DOut2 := True else DOut2 := False;
          if Copy(StateStr,6,1) = '1' then DOut3 := True else DOut3 := False;
          if Copy(StateStr,5,1) = '1' then DOut4 := True else DOut4 := False;
          if Copy(StateStr,4,1) = '1' then DOut5 := True else DOut5 := False;

          sCommand := '';
          TempStr := Copy(Receive_data,3,56);
          BCC := StrToInt('0x'+Copy(TempStr,1,2));
          for i := 1 to (Length(TempStr) div 2) do
          begin
            sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+Copy(TempStr,(i*2)-1,2))));
            if i <> 1 then  BCC := BCC xor StrToInt('0x'+Copy(TempStr,(i*2)-1,2));
          end;


          if Copy(Receive_data,59,2) = IntToHex(BCC,2) then
          begin

            ConnectSerialNo := -1;
            for i := 0 to ConnectCount + 1 do
            begin
              if SerialNo[i] = Copy(Receive_data,7,24) then
              begin
                ConnectSerialNo := i;
                break;
              end;
            end;

            if ConnectSerialNo < 0 then
            begin
              ConnectSerialNo := ConnectCount;
              SerialNo[ConnectCount] := Copy(Receive_data,7,24);
              ConnectCount := ConnectCount + 1;
            end;


            if (SocketReadNumber < 0) or (SocketReadNumber > 100)  then
            begin
              SocketReadNumber := 1;
            end;
            SocketReadNumber := SocketReadNumber + 1;
            SocketReadNumber := SocketReadNumber mod 100;


            var th : TThread;
            th := TThread.CreateAnonymousThread(
            procedure
            begin
              try
                TThread.Synchronize(TThread.CurrentThread,
                  procedure
                  var
                    Temp, SetTemp : Currency;
                    ErrCheck : Integer;
                    DynFDQuery : TUniQuery;
                  begin
                    DynFDQuery := TUniQuery.Create(nil);
                    DynFDQuery.Connection := UniConnection1;
                    try
                      try
                        ErrCheck := 0;
                        if SerialCount[ConnectSerialNo] > 3 then //
                        begin
                          DynFDQuery.Close;
                          DynFDQuery.SQL.Clear;

                          DynFDQuery.SQL.Add('Exec usp_Temp @Option = ''D'', ');
                          DynFDQuery.SQL.Add('@Temp = :Temp, @SetTemp = :SetTemp ');
                          DynFDQuery.SQL.Add(', @PowerState = :PowerState');
                          DynFDQuery.SQL.Add(', @DefrostMode = :DefrostMode');
                          DynFDQuery.SQL.Add(', @DefrostState = :DefrostState');
                          DynFDQuery.SQL.Add(', @Err = :Err');
                          DynFDQuery.SQL.Add(', @DIn1 = :DIn1');
                          DynFDQuery.SQL.Add(', @DIn2 = :DIn2');
                          DynFDQuery.SQL.Add(', @DIn3 = :DIn3');
                          DynFDQuery.SQL.Add(', @DIn4 = :DIn4');
                          DynFDQuery.SQL.Add(', @DIn5 = :DIn5');
                          DynFDQuery.SQL.Add(', @DOut1 = :DOut1');
                          DynFDQuery.SQL.Add(', @DOut2 = :DOut2');
                          DynFDQuery.SQL.Add(', @DOut3 = :DOut3');
                          DynFDQuery.SQL.Add(', @DOut4 = :DOut4');
                          DynFDQuery.SQL.Add(', @DOut5 = :DOut5');
                          DynFDQuery.SQL.Add(', @SerialNo = :SerialNo');
                          if 32768 < HexToInt(Copy(Receive_data,33,4)) then
                          begin
                            Temp := HexToInt(Copy(Receive_data,33,4)) - 65536;
                          end else
                          begin
                            Temp := HexToInt(Copy(Receive_data,33,4));
                          end;

                          if 32768 < HexToInt(Copy(Receive_data,37,4)) then
                          begin
                            SetTemp := HexToInt(Copy(Receive_data,37,4)) - 65536;
                          end else
                          begin
                            SetTemp := HexToInt(Copy(Receive_data,37,4));
                          end;

                          Temp := Temp / 10;
                          SetTemp := SetTemp / 10;
                          ErrCheck := 1;
                          DynFDQuery.ParamByName('Temp').AsCurrency := Temp; //HexToInt(Copy(Receive_data,33,4)) / 10;
                          DynFDQuery.ParamByName('SetTemp').AsCurrency := SetTemp; //HexToInt(Copy(Receive_data,37,4)) / 10;
                          DynFDQuery.ParamByName('PowerState').AsBoolean := PowerState;
                          DynFDQuery.ParamByName('DefrostMode').AsBoolean := DefrostMode;
                          DynFDQuery.ParamByName('DefrostState').AsBoolean := DefrostState;
                          DynFDQuery.ParamByName('Err').AsString := Err;
                          DynFDQuery.ParamByName('DIn1').AsBoolean := DIn1;
                          DynFDQuery.ParamByName('DIn2').AsBoolean := DIn2;
                          DynFDQuery.ParamByName('DIn3').AsBoolean := DIn3;
                          DynFDQuery.ParamByName('DIn4').AsBoolean := DIn4;
                          DynFDQuery.ParamByName('DIn5').AsBoolean := DIn5;
                          DynFDQuery.ParamByName('DOut1').AsBoolean := DOut1;
                          DynFDQuery.ParamByName('DOut2').AsBoolean := DOut2;
                          DynFDQuery.ParamByName('DOut3').AsBoolean := DOut3;
                          DynFDQuery.ParamByName('DOut4').AsBoolean := DOut4;
                          DynFDQuery.ParamByName('DOut5').AsBoolean := DOut5;
                          DynFDQuery.ParamByName('SerialNo').AsString := Copy(Receive_data,7,24);
                        end;


                        ErrCheck := 2;
                        if SerialCount[ConnectSerialNo] > 100 then // 20(1분) 에서 5분으로 변경
                        begin
  //                        if ( PreTemp[ConnectSerialNo] <> FormatFloat('0.##',HexToInt(Copy(Receive_data,33,4)) / 10) )
  //                          or ( PreSet[ConnectSerialNo] <> FormatFloat('0.##',HexToInt(Copy(Receive_data,37,4)) / 10) ) then
                          begin
                            PreTemp[ConnectSerialNo] := FormatFloat('0.##',HexToInt(Copy(Receive_data,33,4)) / 10);
                            PreSet[ConnectSerialNo] := FormatFloat('0.##',HexToInt(Copy(Receive_data,37,4)) / 10);
                            ErrCheck := 3;
                                DynFDQuery.SQL.Add('Exec usp_Temp @Option = ''E'', ');
                                DynFDQuery.SQL.Add('@Temp = :Temp, @SetTemp = :SetTemp ');
                                DynFDQuery.SQL.Add(', @PowerState = :PowerState');
                                DynFDQuery.SQL.Add(', @DefrostMode = :DefrostMode');
                                DynFDQuery.SQL.Add(', @DefrostState = :DefrostState');
                                DynFDQuery.SQL.Add(', @Err = :Err');
                                DynFDQuery.SQL.Add(', @DIn1 = :DIn1');
                                DynFDQuery.SQL.Add(', @DIn2 = :DIn2');
                                DynFDQuery.SQL.Add(', @DIn3 = :DIn3');
                                DynFDQuery.SQL.Add(', @DIn4 = :DIn4');
                                DynFDQuery.SQL.Add(', @DIn5 = :DIn5');
                                DynFDQuery.SQL.Add(', @DOut1 = :DOut1');
                                DynFDQuery.SQL.Add(', @DOut2 = :DOut2');
                                DynFDQuery.SQL.Add(', @DOut3 = :DOut3');
                                DynFDQuery.SQL.Add(', @DOut4 = :DOut4');
                                DynFDQuery.SQL.Add(', @DOut5 = :DOut5');
                                DynFDQuery.SQL.Add(', @SerialNo = :SerialNo');
                                DynFDQuery.ParamByName('Temp').AsCurrency := Temp;// HexToInt(Copy(Receive_data,33,4)) / 10;
                                DynFDQuery.ParamByName('SetTemp').AsCurrency := SetTemp; //HexToInt(Copy(Receive_data,37,4)) / 10;
                                DynFDQuery.ParamByName('PowerState').AsBoolean := PowerState;
                                DynFDQuery.ParamByName('DefrostMode').AsBoolean := DefrostMode;
                                DynFDQuery.ParamByName('DefrostState').AsBoolean := DefrostState;
                                DynFDQuery.ParamByName('Err').AsString := Err;
                                DynFDQuery.ParamByName('DIn1').AsBoolean := DIn1;
                                DynFDQuery.ParamByName('DIn2').AsBoolean := DIn2;
                                DynFDQuery.ParamByName('DIn3').AsBoolean := DIn3;
                                DynFDQuery.ParamByName('DIn4').AsBoolean := DIn4;
                                DynFDQuery.ParamByName('DIn5').AsBoolean := DIn5;
                                DynFDQuery.ParamByName('DOut1').AsBoolean := DOut1;
                                DynFDQuery.ParamByName('DOut2').AsBoolean := DOut2;
                                DynFDQuery.ParamByName('DOut3').AsBoolean := DOut3;
                                DynFDQuery.ParamByName('DOut4').AsBoolean := DOut4;
                                DynFDQuery.ParamByName('DOut5').AsBoolean := DOut5;
                                DynFDQuery.ParamByName('SerialNo').AsString := Copy(Receive_data,7,24);


                            SerialCount[ConnectSerialNo] := 0;
                          end;
                        end else
                        begin
                          SerialCount[ConnectSerialNo] := SerialCount[ConnectSerialNo] + 1;
                        end;

                        if DynFDQuery.SQL.Text <> '' then DynFDQuery.ExecSQL;

                        LabelSocket.Caption := 'Socket : '+ConnectSerialNo.ToString;
                      except on e:exception do
                        begin
                          Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss ',Now) +
                                    ConnectSerialNo.ToString + ' Thread Error : '+e.Message + ' Check : '+ErrCheck.ToString);
                          if Pos(e.Message,'Out') > 0 then
                          begin
                            TimerLogSave.Enabled := True;
                          end;
                        end;
                      end;
                    finally
                      DynFDQuery.Free;
                    end;
                  end);
              finally
                LabelSocketNum.Caption := 'SocketNum : '+SocketReadNumber.ToString;
              end;
            end);
            th.FreeOnTerminate := True;     //251014_김동휘 스레드 보완
            th.Start;

            Socket.SendText(AnsiChar(#$02)+AnsiChar(#$01)+AnsiChar(#$10)+AnsiChar(#$03)+AnsiChar(#$12));

            if IOTCommand[ConnectSerialNo] then
            begin
//              Memo1.Lines.Add(Trim(IOTSerialNo));
              if Copy(Receive_data,7,24) = Trim(IOTSerialNo) then
              begin
                if (Copy(EditHex[ConnectSerialNo],1,4) = 'FFFF') and (Length(EditHex[ConnectSerialNo]) >= 8)  then
                begin
                  EditHex[ConnectSerialNo] := Copy(EditHex[ConnectSerialNo],5,4);
                end;

                IOTCommand[ConnectSerialNo] := False;
                sCommand :=  AnsiChar(#$04) + AnsiChar(#$20)
                            + AnsiChar(Chr(StrToInt('0x0'+EditOnOff[ConnectSerialNo])))  // OnOff
                            + AnsiChar(Chr(StrToInt('0x'+Copy(EditHex[ConnectSerialNo],1,2))))  // 설정온도 앞2
                            + AnsiChar(Chr(StrToInt('0x'+Copy(EditHex[ConnectSerialNo],3,2))))  // 설정온도 뒤2
                            + AnsiChar(#$03);

                BCC := StrToInt('0x04');
                BCC := BCC xor StrToInt('0x20');
                BCC := BCC xor StrToInt('0x0'+EditOnOff[ConnectSerialNo]);
                BCC := BCC xor StrToInt('0x'+Copy(EditHex[ConnectSerialNo],1,2));
                BCC := BCC xor StrToInt('0x'+Copy(EditHex[ConnectSerialNo],3,2));
                BCC := BCC xor StrToInt('0x03');
                                                                  {
                Memo1.Lines.Add('IOTCommand : 0x02 0x04 0x20 0x0'+EditOnOff[ConnectSerialNo]
                      +' 0x'+Copy(EditHex[ConnectSerialNo],1,2)+' 0x'+Copy(EditHex[ConnectSerialNo],3,2)
                      +' 0x03 0x'+IntToHex(BCC,2));               }

                sCommand := AnsiChar(#$02) + sCommand + AnsiChar(Chr(StrToInt('0x'+IntToHex(BCC,2)))); // Chr(BccCalculator(sCommand,1));
                Socket.SendText(sCommand);

                FDQueryIOT.Close;
                FDQueryIOT.SQL.Clear;
                FDQueryIOT.SQL.Add('Delete from IOT Where No = '+IOTNo[ConnectSerialNo]);
                FDQueryIOT.ExecSQL;
                IOTNo[ConnectSerialNo] := '0';
              end;
            end;
         end else
         begin
           //Memo1.Lines.Add('BCC Not Equal');
         end;
      end else
      begin
        Memo1.Lines.Add(Socket.RemoteAddress + FormatDateTime('[]yyyy-mm-dd hh:nn:ss ',Now) + Receive_data);
      end;
      //Memo1.Lines.Add(Socket.RemoteAddress + ' = Send : 0x02 0x01 0x10 0x03 0x12'
//          + '  '+SerialCount[ConnectSerialNo].ToString + '  ' + SerialNo[ConnectSerialNo]);
    end;
  except on e:Exception do
    Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss ',Now) + e.Message);
  end;
end;

procedure TfDongHwaServer.TimerError2Timer(Sender: TObject);
var
  Wnd : THandle;
  s : string;
begin
  TimerError2.Enabled := False;
  s := 'pDongHwaServer';
  Wnd := FindWindow(nil,pChar(s));
  if IsWindow(Wnd) then begin
    PostMessage(Wnd, WM_CLOSE, 0, 0);
  end;
  ServerSocket1.Active := True;
end;

procedure TfDongHwaServer.TimerErrorTimer(Sender: TObject);
var
  Wnd : THandle;
  s : string;
begin
  TimerError.Enabled := False;
  s := 'pDongHwaServer';
  Wnd := FindWindow(nil,pChar(s));
  if IsWindow(Wnd) then begin
    PostMessage(Wnd, WM_CLOSE, 0, 0);
  end;
  TimerError2.Enabled := True;
end;

procedure TfDongHwaServer.TimerIOTTimer(Sender: TObject);
var
  IOTTemp : Double;
  // 스레드 사용
  procedure Wait(Number: Integer; Proc: TProc);
  var
    Thread: array[0..100] of TThread;
  begin
    if PGCloseFlag then Exit;

    Thread[Number] := TThread.CreateAnonymousThread(
      procedure()
      begin
        Proc;
      end);
    Thread[Number].FreeOnTerminate := True;
    Thread[Number].Start;

    while not Thread[Number].Finished do Application.ProcessMessages;
  end;
begin                {
  // 스레드로 전송
  IOTTimerNumber := IOTTimerNumber + 1;
  IOTTimerNumber := (IOTTimerNumber mod 100);
  Wait(IOTTimerNumber,procedure()
        var
          i : Integer;
          IOTNoStr : String;
        begin
          try
            FDQueryIOT.Close;
            FDQueryIOT.SQL.Clear;

            FDQueryIOT.SQL.Add('Exec usp_Temp @Option = ''F''');
            FDQueryIOT.Open;

            //Memo1.Lines.Add('IOT Thread OK ');

            if FDQueryIOT.RecordCount > 0 then
            begin
                                        // 1분
              IOTNoStr := FDQueryIOT.FieldByName('No').AsString;
              if (Now - (0.0000011574 * 600)) > FDQueryIOT.FieldByName('InTime').AsDateTime  then
              begin
                //Memo1.Lines.Add('Time Out IOT Delete ' + FDQueryIOT.FieldByName('SerialNo').AsString);
                FDQueryIOT.Close;
                FDQueryIOT.SQL.Clear;
                FDQueryIOT.SQL.Add('Delete from IOT Where No = '+IOTNoStr);
                FDQueryIOT.ExecSQL;
              end else
              begin
                IOTSerialNo := FDQueryIOT.FieldByName('SerialNo').AsString;
                for i := 0 to ConnectCount + 1 do
                begin
                  if SerialNo[i] = IOTSerialNo then
                  begin
                    IOTCommand[i] := True;
                    IOTNo[i] := FDQueryIOT.FieldByName('No').AsString;
                    IOTTemp := FDQueryIOT.FieldByName('SetTemp').AsFloat;
                    EditFloat[i] := FormatFloat('0',Round(IOTTemp * 10));
                    EditHex[i] := IntToHex(StrToIntDef(EditFloat[i],0),4);
  //                  //Memo1.Lines.Add('EditFloat : '+EditFloat[i]+' EditHex : '+EditHex[i] );
                    if FDQueryIOT.FieldByName('PowerState').AsBoolean then
                    begin
                      EditOnOff[i] := '1';
                    end else
                    begin
                      EditOnOff[i] := '0';
                    end;
                    break;
                  end;
                end;
              end;
            end;
            LabelIOT.Caption := 'IOT : '+IOTTimerNumber.ToString;
          except on e:exception do
            begin
              Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss ',Now) + ' IOT Thread Error : '+e.Message);
            end;
          end;
        end);
}
  TThread.CreateAnonymousThread(
    procedure
    begin
      try
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          var
            i : Integer;
            IOTNoStr : String;
          begin
            try
              FDQueryIOT.Close;
              FDQueryIOT.SQL.Clear;

              FDQueryIOT.SQL.Add('Exec usp_Temp @Option = ''F''');
              FDQueryIOT.Open;

              //Memo1.Lines.Add('IOT Thread OK ');

              if FDQueryIOT.RecordCount > 0 then
              begin
                                          // 1분
                IOTNoStr := FDQueryIOT.FieldByName('No').AsString;
                if (Now - (0.0000011574 * 600)) > FDQueryIOT.FieldByName('InTime').AsDateTime  then
                begin
                  //Memo1.Lines.Add('Time Out IOT Delete ' + FDQueryIOT.FieldByName('SerialNo').AsString);
                  FDQueryIOT.Close;
                  FDQueryIOT.SQL.Clear;
                  FDQueryIOT.SQL.Add('Delete from IOT Where No = '+IOTNoStr);
                  FDQueryIOT.ExecSQL;
                end else
                begin
                  IOTSerialNo := FDQueryIOT.FieldByName('SerialNo').AsString;
                  for i := 0 to ConnectCount + 1 do
                  begin
                    if SerialNo[i] = IOTSerialNo then
                    begin
                      IOTCommand[i] := True;
                      IOTNo[i] := FDQueryIOT.FieldByName('No').AsString;
                      IOTTemp := FDQueryIOT.FieldByName('SetTemp').AsFloat;
                      EditFloat[i] := FormatFloat('0',Round(IOTTemp * 10));
                      EditHex[i] := IntToHex(StrToIntDef(EditFloat[i],0),4);
    //                  //Memo1.Lines.Add('EditFloat : '+EditFloat[i]+' EditHex : '+EditHex[i] );
                      if FDQueryIOT.FieldByName('PowerState').AsBoolean then
                      begin
                        EditOnOff[i] := '1';
                      end else
                      begin
                        EditOnOff[i] := '0';
                      end;
                      if FDQueryIOT.FieldByName('Defrost').AsBoolean then
                      begin
                        EditOnOff[i] := '3';
                      end;
                      break;
                    end;
                  end;
                end;
              end;
              LabelIOT.Caption := 'IOT : '+IOTTimerNumber.ToString;
            except on e:exception do
              begin
                Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss ',Now) + ' IOT Thread Error : '+e.Message);
              end;
            end;


          end);
      finally
        IOTTimerNumber := IOTTimerNumber + 1;
        IOTTimerNumber := (IOTTimerNumber mod 100);
      end;
    end).Start();
end;

procedure TfDongHwaServer.TimerKillProgramTimer(Sender: TObject);
begin
  TimerKillProgram.Enabled := False;
  KillProcess('pDongHwaServer.exe');
end;

procedure TfDongHwaServer.TimerLogSaveTimer(Sender: TObject);
var
  sPath : String;
begin
  TimerLogSave.Enabled := False;
  sPath := TPath.Combine(TPath.GetDocumentsPath
                              ,'DonghwaErr_'+FormatDateTime('yymmddhhnnss',Now)+'.txt');
  Clipboard.AsText := Memo2.Lines.Text;
  Memo2.Lines.SaveToFile(sPath);
  TimerKillProgram.Enabled := True;
end;

procedure TfDongHwaServer.Timer_checkTimer(Sender: TObject);
begin

end;

//function TfDongHwaServer.AllowEvery10s(const SN: string): Boolean;
//var nowms, prev: UInt64;
//begin
//  nowms := GetTickCount64;
//  HitCS.Acquire;
//  try
//    if LastTs.TryGetValue(SN, prev) and (nowms - prev < 5000) then //5초로 수정
//      Exit(False);  // 5초 안 지났으면 거부
//    LastTs.AddOrSetValue(SN, nowms);
//    Result := True; // 5초 지났으면 통과
//  finally
//    HitCS.Release;
//  end;
//end;
//
//procedure TfDongHwaServer.PurgeLastTs(const MaxIdleMs: UInt64 = 60*60*1000);
//var
//  nowms, cutoff, v: UInt64;
//  k: string;
//  keys: TArray<string>;
//  i: Integer;
//begin
//  nowms  := GetTickCount64;
//  cutoff := nowms - MaxIdleMs;
//
//  HitCS.Acquire;
//  try
//    if LastTs.Count = 0 then Exit;
//    keys := LastTs.Keys.ToArray;  // 스냅샷
//    for i := 0 to High(keys) do
//    begin
//      k := keys[i];
//      if LastTs.TryGetValue(k, v) and (v < cutoff) then
//        LastTs.Remove(k); //
//    end;
//  finally
//    HitCS.Release;
//  end;
//end;




end.
