unit uDongHwa;

interface

uses
  {$IFDEF ANDROID}
    FMX.PushNotification.Android, System.PushNotification,  System.JSON,  // for Pus
  {$ENDIF ANDROID}

  FMX.WaitDialog, IdTCPClient,   Math,     System.Notification,  WinInet, System.RegularExpressions,
  System.Threading,  IdSync, IdThreadComponent, ComObj,Winapi.ShellAPI,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, UniProvider,
  SQLServerUniProvider, Data.DB, DBAccess, Uni, MemDS, FMX.Gestures,
  System.Actions, FMX.ActnList, FMX.ListBox, FMX.Media, FMX.Ani, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.StdActns,  Winapi.Windows, Winapi.ShlObj,   Winapi.ActiveX,
  FMX.MediaLibrary.Actions, FMX.DateTimeCtrls, System.Rtti, FMX.Grid.Style,  FMX.Platform.Win,
  FMX.Grid, System.ImageList, FMX.ImgList, IdComponent, IdBaseComponent,
  IdTCPConnection, IdExplicitTLSClientServerBase, IdFTP, IdGlobal;

type
  TfDongHwa = class(TForm)
    TabControl1: TTabControl;
    TabItemLogin: TTabItem;
    ImageLogin: TImage;
    LayoutLogin: TLayout;
    RectangleLogin: TRectangle;
    TextLogin: TText;
    RectangleJoin: TRectangle;
    TextJoin: TText;
    LayoutLoginEdit: TLayout;
    EditID: TEdit;
    EditPW: TEdit;
    CheckBoxLoginAuto: TCheckBox;
    TextVersion: TText;
    TabItemJoin: TTabItem;
    TimerProcedure: TTimer;
    UniConnection1: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    UniQueryVersionCheck: TUniQuery;
    UniQueryLogin: TUniQuery;
    TabItemMain: TTabItem;
    ImageJoin: TImage;
    LayoutJoin: TLayout;
    LayoutJoinPW: TLayout;
    EditJoinPW: TEdit;
    TextJoinPW: TText;
    LayoutJoinID: TLayout;
    EditJoinID: TEdit;
    TextJoinID: TText;
    LayoutJoinCompany: TLayout;
    EditJoinCompany: TEdit;
    TextJoinCompany: TText;
    LayoutJoinPW2: TLayout;
    EditJoinPW2: TEdit;
    TextJoinPW2: TText;
    RectangleJoinAdd: TRectangle;
    TextJoinAdd: TText;
    TextJoinWarning: TText;
    ImageJoinBack: TImage;
    ImageBack1: TImage;
    ImageBack2: TImage;
    RectangleMainBackGround: TRectangle;
    TextMain: TText;
    LayoutMainBottom: TLayout;
    TextMainBottom: TText;
    ImageMainNext: TImage;
    ImageMainPrior: TImage;
    RectangleMain1: TRectangle;
    TextMain1Name: TText;
    TextMain1Model: TText;
    LayoutMain1Client: TLayout;
    RectangleMain1Set: TRectangle;
    TextMain1Set: TText;
    LayoutMain1Temp: TLayout;
    TextMain1TempL: TText;
    TextMain1Temp: TText;
    RectangleMain1SetTemp: TRectangle;
    TextMain1SetTempL: TText;
    TextMain1SetTemp: TText;
    LayoutMain1RTopC: TLayout;
    TextMain1RTop: TText;
    LayoutMain1RTopC1: TLayout;
    CircleMain1RTopC1: TCircle;
    TextMain1RTopC1: TText;
    LayoutMain1RTopC2: TLayout;
    CircleMain1RTopC2: TCircle;
    TextMain1RTopC2: TText;
    LayoutMain1RTopC5: TLayout;
    CircleMain1RTopC5: TCircle;
    TextMain1RTopC5: TText;
    LayoutMain1RTopC4: TLayout;
    CircleMain1RTopC4: TCircle;
    TextMain1RTopC4: TText;
    LayoutMain1RTopC3: TLayout;
    CircleMain1RTopC3: TCircle;
    TextMain1RTopC3: TText;
    LayoutMain1RClientC: TLayout;
    LayoutMain1RClientC1: TLayout;
    CircleMain1RClientC1: TCircle;
    TextMain1RClientC1: TText;
    LayoutMain1RClientC2: TLayout;
    CircleMain1RClientC2: TCircle;
    TextMain1RClientC2: TText;
    LayoutMain1RClientC5: TLayout;
    CircleMain1RClientC5: TCircle;
    TextMain1RClientC5: TText;
    LayoutMain1RClientC4: TLayout;
    CircleMain1RClientC4: TCircle;
    TextMain1RClientC4: TText;
    LayoutMain1RClientC3: TLayout;
    CircleMain1RClientC3: TCircle;
    TextMain1RClientC3: TText;
    TextMain1RClient: TText;
    ImageMain1Plus: TImage;
    TimerTempCheck: TTimer;
    UniQueryTempCheck: TUniQuery;
    UniQueryPlus: TUniQuery;
    LayoutMain1Set: TLayout;
    ImageMain1SetPlus: TImage;
    ImageMain1SetMinus: TImage;
    ImageMain1SetSave: TImage;
    TextMain1SetSave: TText;
    UniQueryDetailSave: TUniQuery;
    UniQueryAllSearch: TUniQuery;
    RectangleMain: TRectangle;
    RectangleMainBottom: TRectangle;
    TimerMouseDown: TTimer;
    ImageMain1: TImage;
    ImageManage: TImage;
    RectangleMain1Alarm: TRectangle;
    MediaPlayer1: TMediaPlayer;
    FloatAnimation1: TFloatAnimation;
    MemoLog: TMemo;
    ImageAlarm: TImage;
    UniQueryIOT: TUniQuery;
    UniQueryDelete: TUniQuery;
    RectangleMain1RTop: TRectangle;
    RectangleMain1RClient: TRectangle;
    Chart1: TChart;
    Series1: TFastLineSeries;
    UniQueryGraph: TUniQuery;
    TextGraphDevice: TText;
    EditGraphModel: TEdit;
    RectangleGraphBackGround: TRectangle;
    UniQueryAlarm: TUniQuery;
    ImageWifi3: TImage;
    ImageWifi2: TImage;
    ImageWifi1: TImage;
    ImageWifi01: TImage;
    ImageGraphSave: TImage;
    RectangleGraphExpand: TRectangle;
    LayoutGraph_Detail_top: TLayout;
    ImageGraphPlus: TImage;
    ImageGraphMinus: TImage;
    TextGraphExpand: TText;
    TextMain1TempR: TText;
    TextMain1SetTempR: TText;
    ImageAlarmO: TImage;
    ImageAlarmX: TImage;
    UniQueryTempCheck2: TUniQuery;
    CheckBoxPassword: TCheckBox;
    UniQueryDetailSearch: TUniQuery;
    UniQueryDetailSearch2: TUniQuery;
    UniQueryGraphGetMark: TUniQuery;
    RectangleGraphSaveTime: TRectangle;
    TextSaveTime: TText;
    RectangleGraphSaveTimeTitle1: TRectangle;
    TextGraphSaveTimeTitle1: TText;
    TextGraphSaveTimeValue1: TText;
    ImageJoinBackGround: TImage;
    TimerFirstCheck: TTimer;
    TextServer: TText;
    TimerControllerAllSearch: TTimer;
    TimerGraphSearch: TTimer;
    RectangleMainG1: TRectangle;
    RectangleMainG2: TRectangle;
    RectangleMainG3: TRectangle;
    LayoutNote: TLayout;
    TextNote: TText;
    TextNote2: TText;
    TextNote3: TText;
    TextNote4: TText;
    TextNote5: TText;
    TabItemDetailPC: TTabItem;
    LayoutDetailPC0: TLayout;
    LayoutDetailPCTop: TLayout;
    LayoutDetailPCClient: TLayout;
    LayoutDetailPC1: TLayout;
    LayoutDetailPC3: TLayout;
    LayoutDetailPC2: TLayout;
    LayoutDetailPC4: TLayout;
    UniQuery_DetailAlarm: TUniQuery;
    RectangleDetail: TRectangle;
    TextDetailTitle: TText;
    ButtonDeviceDelete: TButton;
    EditDetailFlag: TEdit;
    ImageAlarmOff: TImage;
    ImageAlarmOn: TImage;
    ImageDetailAlarm: TImage;
    ImageX: TImage;
    ImageX0: TImage;
    ImageX1: TImage;
    RectangleDetailChange: TRectangle;
    TextDetailChange: TText;
    RectanglePW: TRectangle;
    Rectangle2: TRectangle;
    TextPW1: TText;
    TextPW2: TText;
    EditPW2: TEdit;
    ButtonPW: TButton;
    RectangleDetailBackGround: TRectangle;
    RectangleDetailDevice: TRectangle;
    LayoutDetailTempClient: TLayout;
    RectangleDetailTemp: TRectangle;
    LayoutDetailSetTemp: TLayout;
    ImageDetailPlus: TImage;
    ImageDetailMinus: TImage;
    ImageDetailPower: TImage;
    RectangleDefrost: TRectangle;
    TextDefrost: TText;
    LayoutDetailTemp: TLayout;
    TextDetailTemp: TText;
    EditDetailTemp: TEdit;
    TextEditDetailTemp: TText;
    RectangleDetailSetTemp: TRectangle;
    TextDetailSetTemp: TText;
    EditDetailSetTemp: TEdit;
    TextEditDetailSetTemp: TText;
    TextDetailSetTempEdit: TEdit;
    TextDetailModel: TText;
    EditDetailName: TEdit;
    ImageGraph: TImage;
    TextEditDetailName: TText;
    LayoutDetailHighLow: TLayout;
    RectangleDetailHigh: TRectangle;
    TextDetailHigh: TText;
    EditDetailHigh: TEdit;
    TextEditDetailHigh: TText;
    RectangleDetailLow: TRectangle;
    TextDetailLow: TText;
    EditDetailLow: TEdit;
    TextEditDetailLow: TText;
    LayoutDetailInOut: TLayout;
    RectangleDetailIn: TRectangle;
    LayoutDetailIn: TLayout;
    LayoutDetailInClient: TLayout;
    LayoutDetailIn1: TLayout;
    CircleDetailIn1: TCircle;
    EditDetailIn1: TEdit;
    TextDetailIn1: TText;
    TextEditDetailIn1: TText;
    LayoutDetailIn2: TLayout;
    CircleDetailIn2: TCircle;
    EditDetailIn2: TEdit;
    TextDetailIn2: TText;
    TextEditDetailIn2: TText;
    LayoutDetailIn5: TLayout;
    CircleDetailIn5: TCircle;
    EditDetailIn5: TEdit;
    TextDetailIn5: TText;
    TextEditDetailIn5: TText;
    LayoutDetailIn4: TLayout;
    CircleDetailIn4: TCircle;
    EditDetailIn4: TEdit;
    TextDetailIn4: TText;
    TextEditDetailIn4: TText;
    LayoutDetailIn3: TLayout;
    CircleDetailIn3: TCircle;
    EditDetailIn3: TEdit;
    TextDetailIn3: TText;
    TextEditDetailIn3: TText;
    TextDetailIn: TText;
    Rectangle7: TRectangle;
    RectangleDetailOut: TRectangle;
    LayoutDetailOut: TLayout;
    LayoutDetailOutClient: TLayout;
    LayoutDetailOut1: TLayout;
    CircleDetailOut1: TCircle;
    EditDetailOut1: TEdit;
    TextDetailOut1: TText;
    TextEditDetailOut1: TText;
    LayoutDetailOut2: TLayout;
    CircleDetailOut2: TCircle;
    EditDetailOut2: TEdit;
    TextDetailOut2: TText;
    TextEditDetailOut2: TText;
    LayoutDetailOut5: TLayout;
    CircleDetailOut5: TCircle;
    EditDetailOut5: TEdit;
    TextDetailOut5: TText;
    TextEditDetailOut5: TText;
    LayoutDetailOut4: TLayout;
    CircleDetailOut4: TCircle;
    EditDetailOut4: TEdit;
    TextDetailOut4: TText;
    TextEditDetailOut4: TText;
    LayoutDetailOut3: TLayout;
    CircleDetailOut3: TCircle;
    EditDetailOut3: TEdit;
    TextDetailOut3: TText;
    TextEditDetailOut3: TText;
    TextDetailOut: TText;
    Rectangle8: TRectangle;
    RectangleModelDetail: TRectangle;
    TextModelDetail: TText;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    RectangleDetailSaveButton: TRectangle;
    TextDetailSaveButton: TText;
    LayoutGraph2: TLayout;
    ButtonGraphSave: TButton;
    ButtonGraphCSV: TButton;
    Image1: TImage;
    StringGrid2: TStringGrid;
    UniQuery_AlarmList: TUniQuery;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    StringColumn11: TStringColumn;
    ButtonGraphCSV1: TButton;
    RectangleGraphTitle: TRectangle;
    TextGraphTitle: TText;
    Timer_Check: TTimer;
    RectangleMain1Client: TRectangle;
    RectangleMain1Right: TRectangle;
    RectangleMain4: TRectangle;
    TextMain4Name: TText;
    TextMain4Model: TText;
    ImageMain4: TImage;
    ImageMain4Plus: TImage;
    RectangleMain4Alarm: TRectangle;
    FloatAnimation4: TFloatAnimation;
    RectangleMain4Client: TRectangle;
    LayoutMain4Client: TLayout;
    RectangleMain4Set: TRectangle;
    TextMain4Set: TText;
    LayoutMain4Temp: TLayout;
    TextMain4TempL: TText;
    TextMain4Temp: TText;
    TextMain4TempR: TText;
    RectangleMain4SetTemp: TRectangle;
    TextMain4SetTempL: TText;
    TextMain4SetTemp: TText;
    TextMain4SetTempR: TText;
    LayoutMain4Set: TLayout;
    ImageMain4SetPlus: TImage;
    ImageMain4SetMinus: TImage;
    ImageMain4SetSave: TImage;
    TextMain4SetSave: TText;
    RectangleMain4Right: TRectangle;
    RectangleMain4RTop: TRectangle;
    LayoutMain4RTopC: TLayout;
    LayoutMain4RTopC1: TLayout;
    CircleMain4RTopC1: TCircle;
    TextMain4RTopC1: TText;
    LayoutMain4RTopC2: TLayout;
    CircleMain4RTopC2: TCircle;
    TextMain4RTopC2: TText;
    LayoutMain4RTopC5: TLayout;
    CircleMain4RTopC5: TCircle;
    TextMain4RTopC5: TText;
    LayoutMain4RTopC4: TLayout;
    CircleMain4RTopC4: TCircle;
    TextMain4RTopC4: TText;
    LayoutMain4RTopC3: TLayout;
    CircleMain4RTopC3: TCircle;
    TextMain4RTopC3: TText;
    TextMain4RTop: TText;
    RectangleMain4RClient: TRectangle;
    LayoutMain4RClientC: TLayout;
    LayoutMain4RClientC1: TLayout;
    CircleMain4RClientC1: TCircle;
    TextMain4RClientC1: TText;
    LayoutMain4RClientC2: TLayout;
    CircleMain4RClientC2: TCircle;
    TextMain4RClientC2: TText;
    LayoutMain4RClientC5: TLayout;
    CircleMain4RClientC5: TCircle;
    TextMain4RClientC5: TText;
    LayoutMain4RClientC4: TLayout;
    CircleMain4RClientC4: TCircle;
    TextMain4RClientC4: TText;
    LayoutMain4RClientC3: TLayout;
    CircleMain4RClientC3: TCircle;
    TextMain4RClientC3: TText;
    TextMain4RClient: TText;
    RectangleMain7: TRectangle;
    TextMain7Name: TText;
    TextMain7Model: TText;
    ImageMain7: TImage;
    ImageMain7Plus: TImage;
    RectangleMain7Alarm: TRectangle;
    FloatAnimation7: TFloatAnimation;
    RectangleMain7Client: TRectangle;
    LayoutMain7Client: TLayout;
    RectangleMain7Set: TRectangle;
    TextMain7Set: TText;
    LayoutMain7Temp: TLayout;
    TextMain7TempL: TText;
    TextMain7Temp: TText;
    TextMain7TempR: TText;
    RectangleMain7SetTemp: TRectangle;
    TextMain7SetTempL: TText;
    TextMain7SetTemp: TText;
    TextMain7SetTempR: TText;
    LayoutMain7Set: TLayout;
    ImageMain7SetPlus: TImage;
    ImageMain7SetMinus: TImage;
    ImageMain7SetSave: TImage;
    TextMain7SetSave: TText;
    RectangleMain7Right: TRectangle;
    RectangleMain7RTop: TRectangle;
    LayoutMain7RTopC: TLayout;
    LayoutMain7RTopC1: TLayout;
    CircleMain7RTopC1: TCircle;
    TextMain7RTopC1: TText;
    LayoutMain7RTopC2: TLayout;
    CircleMain7RTopC2: TCircle;
    TextMain7RTopC2: TText;
    LayoutMain7RTopC5: TLayout;
    CircleMain7RTopC5: TCircle;
    TextMain7RTopC5: TText;
    LayoutMain7RTopC4: TLayout;
    CircleMain7RTopC4: TCircle;
    TextMain7RTopC4: TText;
    LayoutMain7RTopC3: TLayout;
    CircleMain7RTopC3: TCircle;
    TextMain7RTopC3: TText;
    TextMain7RTop: TText;
    RectangleMain7RClient: TRectangle;
    LayoutMain7RClientC: TLayout;
    LayoutMain7RClientC1: TLayout;
    CircleMain7RClientC1: TCircle;
    TextMain7RClientC1: TText;
    LayoutMain7RClientC2: TLayout;
    CircleMain7RClientC2: TCircle;
    TextMain7RClientC2: TText;
    LayoutMain7RClientC5: TLayout;
    CircleMain7RClientC5: TCircle;
    TextMain7RClientC5: TText;
    LayoutMain7RClientC4: TLayout;
    CircleMain7RClientC4: TCircle;
    TextMain7RClientC4: TText;
    LayoutMain7RClientC3: TLayout;
    CircleMain7RClientC3: TCircle;
    TextMain7RClientC3: TText;
    TextMain7RClient: TText;
    RectangleMain10: TRectangle;
    TextMain10Name: TText;
    TextMain10Model: TText;
    ImageMain10: TImage;
    ImageMain10Plus: TImage;
    RectangleMain10Alarm: TRectangle;
    FloatAnimation10: TFloatAnimation;
    RectangleMain10Client: TRectangle;
    LayoutMain10Client: TLayout;
    RectangleMain10Set: TRectangle;
    TextMain10Set: TText;
    LayoutMain10Temp: TLayout;
    TextMain10TempL: TText;
    TextMain10Temp: TText;
    TextMain10TempR: TText;
    RectangleMain10SetTemp: TRectangle;
    TextMain10SetTempL: TText;
    TextMain10SetTemp: TText;
    TextMain10SetTempR: TText;
    LayoutMain10Set: TLayout;
    ImageMain10SetPlus: TImage;
    ImageMain10SetMinus: TImage;
    ImageMain10SetSave: TImage;
    TextMain10SetSave: TText;
    RectangleMain10Right: TRectangle;
    RectangleMain10RTop: TRectangle;
    LayoutMain10RTopC: TLayout;
    LayoutMain10RTopC1: TLayout;
    CircleMain10RTopC1: TCircle;
    TextMain10RTopC1: TText;
    LayoutMain10RTopC2: TLayout;
    CircleMain10RTopC2: TCircle;
    TextMain10RTopC2: TText;
    LayoutMain10RTopC5: TLayout;
    CircleMain10RTopC5: TCircle;
    TextMain10RTopC5: TText;
    LayoutMain10RTopC4: TLayout;
    CircleMain10RTopC4: TCircle;
    TextMain10RTopC4: TText;
    LayoutMain10RTopC3: TLayout;
    CircleMain10RTopC3: TCircle;
    TextMain10RTopC3: TText;
    TextMain10RTop: TText;
    RectangleMain10RClient: TRectangle;
    LayoutMain10RClientC: TLayout;
    LayoutMain10RClientC1: TLayout;
    CircleMain10RClientC1: TCircle;
    TextMain10RClientC1: TText;
    LayoutMain10RClientC2: TLayout;
    CircleMain10RClientC2: TCircle;
    TextMain10RClientC2: TText;
    LayoutMain10RClientC5: TLayout;
    CircleMain10RClientC5: TCircle;
    TextMain10RClientC5: TText;
    LayoutMain10RClientC4: TLayout;
    CircleMain10RClientC4: TCircle;
    TextMain10RClientC4: TText;
    LayoutMain10RClientC3: TLayout;
    CircleMain10RClientC3: TCircle;
    TextMain10RClientC3: TText;
    TextMain10RClient: TText;
    RectangleMain11: TRectangle;
    TextMain11Name: TText;
    TextMain11Model: TText;
    ImageMain11: TImage;
    ImageMain11Plus: TImage;
    RectangleMain11Alarm: TRectangle;
    FloatAnimation11: TFloatAnimation;
    RectangleMain11Client: TRectangle;
    LayoutMain11Client: TLayout;
    RectangleMain11Set: TRectangle;
    TextMain11Set: TText;
    LayoutMain11Temp: TLayout;
    TextMain11TempL: TText;
    TextMain11Temp: TText;
    TextMain11TempR: TText;
    RectangleMain11SetTemp: TRectangle;
    TextMain11SetTempL: TText;
    TextMain11SetTemp: TText;
    TextMain11SetTempR: TText;
    LayoutMain11Set: TLayout;
    ImageMain11SetPlus: TImage;
    ImageMain11SetMinus: TImage;
    ImageMain11SetSave: TImage;
    TextMain11SetSave: TText;
    RectangleMain11Right: TRectangle;
    RectangleMain11RTop: TRectangle;
    LayoutMain11RTopC: TLayout;
    LayoutMain11RTopC1: TLayout;
    CircleMain11RTopC1: TCircle;
    TextMain11RTopC1: TText;
    LayoutMain11RTopC2: TLayout;
    CircleMain11RTopC2: TCircle;
    TextMain11RTopC2: TText;
    LayoutMain11RTopC5: TLayout;
    CircleMain11RTopC5: TCircle;
    TextMain11RTopC5: TText;
    LayoutMain11RTopC4: TLayout;
    CircleMain11RTopC4: TCircle;
    TextMain11RTopC4: TText;
    LayoutMain11RTopC3: TLayout;
    CircleMain11RTopC3: TCircle;
    TextMain11RTopC3: TText;
    TextMain11RTop: TText;
    RectangleMain11RClient: TRectangle;
    LayoutMain11RClientC: TLayout;
    LayoutMain11RClientC1: TLayout;
    CircleMain11RClientC1: TCircle;
    TextMain11RClientC1: TText;
    LayoutMain11RClientC2: TLayout;
    CircleMain11RClientC2: TCircle;
    TextMain11RClientC2: TText;
    LayoutMain11RClientC5: TLayout;
    CircleMain11RClientC5: TCircle;
    TextMain11RClientC5: TText;
    LayoutMain11RClientC4: TLayout;
    CircleMain11RClientC4: TCircle;
    TextMain11RClientC4: TText;
    LayoutMain11RClientC3: TLayout;
    CircleMain11RClientC3: TCircle;
    TextMain11RClientC3: TText;
    TextMain11RClient: TText;
    RectangleMain2: TRectangle;
    TextMain2Name: TText;
    TextMain2Model: TText;
    ImageMain2: TImage;
    ImageMain2Plus: TImage;
    RectangleMain2Alarm: TRectangle;
    FloatAnimation2: TFloatAnimation;
    RectangleMain2Client: TRectangle;
    LayoutMain2Client: TLayout;
    RectangleMain2Set: TRectangle;
    TextMain2Set: TText;
    LayoutMain2Temp: TLayout;
    TextMain2TempL: TText;
    TextMain2Temp: TText;
    TextMain2TempR: TText;
    RectangleMain2SetTemp: TRectangle;
    TextMain2SetTempL: TText;
    TextMain2SetTemp: TText;
    TextMain2SetTempR: TText;
    LayoutMain2Set: TLayout;
    ImageMain2SetPlus: TImage;
    ImageMain2SetMinus: TImage;
    ImageMain2SetSave: TImage;
    TextMain2SetSave: TText;
    RectangleMain2Right: TRectangle;
    RectangleMain2RTop: TRectangle;
    LayoutMain2RTopC: TLayout;
    LayoutMain2RTopC1: TLayout;
    CircleMain2RTopC1: TCircle;
    TextMain2RTopC1: TText;
    LayoutMain2RTopC2: TLayout;
    CircleMain2RTopC2: TCircle;
    TextMain2RTopC2: TText;
    LayoutMain2RTopC5: TLayout;
    CircleMain2RTopC5: TCircle;
    TextMain2RTopC5: TText;
    LayoutMain2RTopC4: TLayout;
    CircleMain2RTopC4: TCircle;
    TextMain2RTopC4: TText;
    LayoutMain2RTopC3: TLayout;
    CircleMain2RTopC3: TCircle;
    TextMain2RTopC3: TText;
    TextMain2RTop: TText;
    RectangleMain2RClient: TRectangle;
    LayoutMain2RClientC: TLayout;
    LayoutMain2RClientC1: TLayout;
    CircleMain2RClientC1: TCircle;
    TextMain2RClientC1: TText;
    LayoutMain2RClientC2: TLayout;
    CircleMain2RClientC2: TCircle;
    TextMain2RClientC2: TText;
    LayoutMain2RClientC5: TLayout;
    CircleMain2RClientC5: TCircle;
    TextMain2RClientC5: TText;
    LayoutMain2RClientC4: TLayout;
    CircleMain2RClientC4: TCircle;
    TextMain2RClientC4: TText;
    LayoutMain2RClientC3: TLayout;
    CircleMain2RClientC3: TCircle;
    TextMain2RClientC3: TText;
    TextMain2RClient: TText;
    RectangleMain5: TRectangle;
    TextMain5Name: TText;
    TextMain5Model: TText;
    ImageMain5: TImage;
    ImageMain5Plus: TImage;
    RectangleMain5Alarm: TRectangle;
    FloatAnimation5: TFloatAnimation;
    RectangleMain5Client: TRectangle;
    LayoutMain5Client: TLayout;
    RectangleMain5Set: TRectangle;
    TextMain5Set: TText;
    LayoutMain5Temp: TLayout;
    TextMain5TempL: TText;
    TextMain5Temp: TText;
    TextMain5TempR: TText;
    RectangleMain5SetTemp: TRectangle;
    TextMain5SetTempL: TText;
    TextMain5SetTemp: TText;
    TextMain5SetTempR: TText;
    LayoutMain5Set: TLayout;
    ImageMain5SetPlus: TImage;
    ImageMain5SetMinus: TImage;
    ImageMain5SetSave: TImage;
    TextMain5SetSave: TText;
    RectangleMain5Right: TRectangle;
    RectangleMain5RTop: TRectangle;
    LayoutMain5RTopC: TLayout;
    LayoutMain5RTopC1: TLayout;
    CircleMain5RTopC1: TCircle;
    TextMain5RTopC1: TText;
    LayoutMain5RTopC2: TLayout;
    CircleMain5RTopC2: TCircle;
    TextMain5RTopC2: TText;
    LayoutMain5RTopC5: TLayout;
    CircleMain5RTopC5: TCircle;
    TextMain5RTopC5: TText;
    LayoutMain5RTopC4: TLayout;
    CircleMain5RTopC4: TCircle;
    TextMain5RTopC4: TText;
    LayoutMain5RTopC3: TLayout;
    CircleMain5RTopC3: TCircle;
    TextMain5RTopC3: TText;
    TextMain5RTop: TText;
    RectangleMain5RClient: TRectangle;
    LayoutMain5RClientC: TLayout;
    LayoutMain5RClientC1: TLayout;
    CircleMain5RClientC1: TCircle;
    TextMain5RClientC1: TText;
    LayoutMain5RClientC2: TLayout;
    CircleMain5RClientC2: TCircle;
    TextMain5RClientC2: TText;
    LayoutMain5RClientC5: TLayout;
    CircleMain5RClientC5: TCircle;
    TextMain5RClientC5: TText;
    LayoutMain5RClientC4: TLayout;
    CircleMain5RClientC4: TCircle;
    TextMain5RClientC4: TText;
    LayoutMain5RClientC3: TLayout;
    CircleMain5RClientC3: TCircle;
    TextMain5RClientC3: TText;
    TextMain5RClient: TText;
    RectangleMain8: TRectangle;
    TextMain8Name: TText;
    TextMain8Model: TText;
    ImageMain8: TImage;
    ImageMain8Plus: TImage;
    RectangleMain8Alarm: TRectangle;
    FloatAnimation8: TFloatAnimation;
    RectangleMain8Client: TRectangle;
    LayoutMain8Client: TLayout;
    RectangleMain8Set: TRectangle;
    TextMain8Set: TText;
    LayoutMain8Temp: TLayout;
    TextMain8TempL: TText;
    TextMain8Temp: TText;
    TextMain8TempR: TText;
    RectangleMain8SetTemp: TRectangle;
    TextMain8SetTempL: TText;
    TextMain8SetTemp: TText;
    TextMain8SetTempR: TText;
    LayoutMain8Set: TLayout;
    ImageMain8SetPlus: TImage;
    ImageMain8SetMinus: TImage;
    ImageMain8SetSave: TImage;
    TextMain8SetSave: TText;
    RectangleMain8Right: TRectangle;
    RectangleMain8RTop: TRectangle;
    LayoutMain8RTopC: TLayout;
    LayoutMain8RTopC1: TLayout;
    CircleMain8RTopC1: TCircle;
    TextMain8RTopC1: TText;
    LayoutMain8RTopC2: TLayout;
    CircleMain8RTopC2: TCircle;
    TextMain8RTopC2: TText;
    LayoutMain8RTopC5: TLayout;
    CircleMain8RTopC5: TCircle;
    TextMain8RTopC5: TText;
    LayoutMain8RTopC4: TLayout;
    CircleMain8RTopC4: TCircle;
    TextMain8RTopC4: TText;
    LayoutMain8RTopC3: TLayout;
    CircleMain8RTopC3: TCircle;
    TextMain8RTopC3: TText;
    TextMain8RTop: TText;
    RectangleMain8RClient: TRectangle;
    LayoutMain8RClientC: TLayout;
    LayoutMain8RClientC1: TLayout;
    CircleMain8RClientC1: TCircle;
    TextMain8RClientC1: TText;
    LayoutMain8RClientC2: TLayout;
    CircleMain8RClientC2: TCircle;
    TextMain8RClientC2: TText;
    LayoutMain8RClientC5: TLayout;
    CircleMain8RClientC5: TCircle;
    TextMain8RClientC5: TText;
    LayoutMain8RClientC4: TLayout;
    CircleMain8RClientC4: TCircle;
    TextMain8RClientC4: TText;
    LayoutMain8RClientC3: TLayout;
    CircleMain8RClientC3: TCircle;
    TextMain8RClientC3: TText;
    TextMain8RClient: TText;
    RectangleMain12: TRectangle;
    TextMain12Name: TText;
    TextMain12Model: TText;
    ImageMain12: TImage;
    ImageMain12Plus: TImage;
    RectangleMain12Alarm: TRectangle;
    FloatAnimation12: TFloatAnimation;
    RectangleMain12Client: TRectangle;
    LayoutMain12Client: TLayout;
    RectangleMain12Set: TRectangle;
    TextMain12Set: TText;
    LayoutMain12Temp: TLayout;
    TextMain12TempL: TText;
    TextMain12Temp: TText;
    TextMain12TempR: TText;
    RectangleMain12SetTemp: TRectangle;
    TextMain12SetTempL: TText;
    TextMain12SetTemp: TText;
    TextMain12SetTempR: TText;
    LayoutMain12Set: TLayout;
    ImageMain12SetPlus: TImage;
    ImageMain12SetMinus: TImage;
    ImageMain12SetSave: TImage;
    TextMain12SetSave: TText;
    RectangleMain12Right: TRectangle;
    RectangleMain12RTop: TRectangle;
    LayoutMain12RTopC: TLayout;
    LayoutMain12RTopC1: TLayout;
    CircleMain12RTopC1: TCircle;
    TextMain12RTopC1: TText;
    LayoutMain12RTopC2: TLayout;
    CircleMain12RTopC2: TCircle;
    TextMain12RTopC2: TText;
    LayoutMain12RTopC5: TLayout;
    CircleMain12RTopC5: TCircle;
    TextMain12RTopC5: TText;
    LayoutMain12RTopC4: TLayout;
    CircleMain12RTopC4: TCircle;
    TextMain12RTopC4: TText;
    LayoutMain12RTopC3: TLayout;
    CircleMain12RTopC3: TCircle;
    TextMain12RTopC3: TText;
    TextMain12RTop: TText;
    RectangleMain12RClient: TRectangle;
    LayoutMain12RClientC: TLayout;
    LayoutMain12RClientC1: TLayout;
    CircleMain12RClientC1: TCircle;
    TextMain12RClientC1: TText;
    LayoutMain12RClientC2: TLayout;
    CircleMain12RClientC2: TCircle;
    TextMain12RClientC2: TText;
    LayoutMain12RClientC5: TLayout;
    CircleMain12RClientC5: TCircle;
    TextMain12RClientC5: TText;
    LayoutMain12RClientC4: TLayout;
    CircleMain12RClientC4: TCircle;
    TextMain12RClientC4: TText;
    LayoutMain12RClientC3: TLayout;
    CircleMain12RClientC3: TCircle;
    TextMain12RClientC3: TText;
    TextMain12RClient: TText;
    RectangleMain3: TRectangle;
    TextMain3Name: TText;
    TextMain3Model: TText;
    ImageMain3: TImage;
    ImageMain3Plus: TImage;
    RectangleMain3Alarm: TRectangle;
    FloatAnimation3: TFloatAnimation;
    RectangleMain3Client: TRectangle;
    LayoutMain3Client: TLayout;
    RectangleMain3Set: TRectangle;
    TextMain3Set: TText;
    LayoutMain3Temp: TLayout;
    TextMain3TempL: TText;
    TextMain3Temp: TText;
    TextMain3TempR: TText;
    RectangleMain3SetTemp: TRectangle;
    TextMain3SetTempL: TText;
    TextMain3SetTemp: TText;
    TextMain3SetTempR: TText;
    LayoutMain3Set: TLayout;
    ImageMain3SetPlus: TImage;
    ImageMain3SetMinus: TImage;
    ImageMain3SetSave: TImage;
    TextMain3SetSave: TText;
    RectangleMain3Right: TRectangle;
    RectangleMain3RTop: TRectangle;
    LayoutMain3RTopC: TLayout;
    LayoutMain3RTopC1: TLayout;
    CircleMain3RTopC1: TCircle;
    TextMain3RTopC1: TText;
    LayoutMain3RTopC2: TLayout;
    CircleMain3RTopC2: TCircle;
    TextMain3RTopC2: TText;
    LayoutMain3RTopC5: TLayout;
    CircleMain3RTopC5: TCircle;
    TextMain3RTopC5: TText;
    LayoutMain3RTopC4: TLayout;
    CircleMain3RTopC4: TCircle;
    TextMain3RTopC4: TText;
    LayoutMain3RTopC3: TLayout;
    CircleMain3RTopC3: TCircle;
    TextMain3RTopC3: TText;
    TextMain3RTop: TText;
    RectangleMain3RClient: TRectangle;
    LayoutMain3RClientC: TLayout;
    LayoutMain3RClientC1: TLayout;
    CircleMain3RClientC1: TCircle;
    TextMain3RClientC1: TText;
    LayoutMain3RClientC2: TLayout;
    CircleMain3RClientC2: TCircle;
    TextMain3RClientC2: TText;
    LayoutMain3RClientC5: TLayout;
    CircleMain3RClientC5: TCircle;
    TextMain3RClientC5: TText;
    LayoutMain3RClientC4: TLayout;
    CircleMain3RClientC4: TCircle;
    TextMain3RClientC4: TText;
    LayoutMain3RClientC3: TLayout;
    CircleMain3RClientC3: TCircle;
    TextMain3RClientC3: TText;
    TextMain3RClient: TText;
    RectangleMain6: TRectangle;
    TextMain6Name: TText;
    TextMain6Model: TText;
    ImageMain6: TImage;
    ImageMain6Plus: TImage;
    RectangleMain6Alarm: TRectangle;
    FloatAnimation6: TFloatAnimation;
    RectangleMain6Client: TRectangle;
    LayoutMain6Client: TLayout;
    RectangleMain6Set: TRectangle;
    TextMain6Set: TText;
    LayoutMain6Temp: TLayout;
    TextMain6TempL: TText;
    TextMain6Temp: TText;
    TextMain6TempR: TText;
    RectangleMain6SetTemp: TRectangle;
    TextMain6SetTempL: TText;
    TextMain6SetTemp: TText;
    TextMain6SetTempR: TText;
    LayoutMain6Set: TLayout;
    ImageMain6SetPlus: TImage;
    ImageMain6SetMinus: TImage;
    ImageMain6SetSave: TImage;
    TextMain6SetSave: TText;
    RectangleMain6Right: TRectangle;
    RectangleMain6RTop: TRectangle;
    LayoutMain6RTopC: TLayout;
    LayoutMain6RTopC1: TLayout;
    CircleMain6RTopC1: TCircle;
    TextMain6RTopC1: TText;
    LayoutMain6RTopC2: TLayout;
    CircleMain6RTopC2: TCircle;
    TextMain6RTopC2: TText;
    LayoutMain6RTopC5: TLayout;
    CircleMain6RTopC5: TCircle;
    TextMain6RTopC5: TText;
    LayoutMain6RTopC4: TLayout;
    CircleMain6RTopC4: TCircle;
    TextMain6RTopC4: TText;
    LayoutMain6RTopC3: TLayout;
    CircleMain6RTopC3: TCircle;
    TextMain6RTopC3: TText;
    TextMain6RTop: TText;
    RectangleMain6RClient: TRectangle;
    LayoutMain6RClientC: TLayout;
    LayoutMain6RClientC1: TLayout;
    CircleMain6RClientC1: TCircle;
    TextMain6RClientC1: TText;
    LayoutMain6RClientC2: TLayout;
    CircleMain6RClientC2: TCircle;
    TextMain6RClientC2: TText;
    LayoutMain6RClientC5: TLayout;
    CircleMain6RClientC5: TCircle;
    TextMain6RClientC5: TText;
    LayoutMain6RClientC4: TLayout;
    CircleMain6RClientC4: TCircle;
    TextMain6RClientC4: TText;
    LayoutMain6RClientC3: TLayout;
    CircleMain6RClientC3: TCircle;
    TextMain6RClientC3: TText;
    TextMain6RClient: TText;
    RectangleMain9: TRectangle;
    TextMain9Name: TText;
    TextMain9Model: TText;
    ImageMain9: TImage;
    ImageMain9Plus: TImage;
    RectangleMain9Alarm: TRectangle;
    FloatAnimation9: TFloatAnimation;
    RectangleMain9Client: TRectangle;
    LayoutMain9Client: TLayout;
    RectangleMain9Set: TRectangle;
    TextMain9Set: TText;
    LayoutMain9Temp: TLayout;
    TextMain9TempL: TText;
    TextMain9Temp: TText;
    TextMain9TempR: TText;
    RectangleMain9SetTemp: TRectangle;
    TextMain9SetTempL: TText;
    TextMain9SetTemp: TText;
    TextMain9SetTempR: TText;
    LayoutMain9Set: TLayout;
    ImageMain9SetPlus: TImage;
    ImageMain9SetMinus: TImage;
    ImageMain9SetSave: TImage;
    TextMain9SetSave: TText;
    RectangleMain9Right: TRectangle;
    RectangleMain9RTop: TRectangle;
    LayoutMain9RTopC: TLayout;
    LayoutMain9RTopC1: TLayout;
    CircleMain9RTopC1: TCircle;
    TextMain9RTopC1: TText;
    LayoutMain9RTopC2: TLayout;
    CircleMain9RTopC2: TCircle;
    TextMain9RTopC2: TText;
    LayoutMain9RTopC5: TLayout;
    CircleMain9RTopC5: TCircle;
    TextMain9RTopC5: TText;
    LayoutMain9RTopC4: TLayout;
    CircleMain9RTopC4: TCircle;
    TextMain9RTopC4: TText;
    LayoutMain9RTopC3: TLayout;
    CircleMain9RTopC3: TCircle;
    TextMain9RTopC3: TText;
    TextMain9RTop: TText;
    RectangleMain9RClient: TRectangle;
    LayoutMain9RClientC: TLayout;
    LayoutMain9RClientC1: TLayout;
    CircleMain9RClientC1: TCircle;
    TextMain9RClientC1: TText;
    LayoutMain9RClientC2: TLayout;
    CircleMain9RClientC2: TCircle;
    TextMain9RClientC2: TText;
    LayoutMain9RClientC5: TLayout;
    CircleMain9RClientC5: TCircle;
    TextMain9RClientC5: TText;
    LayoutMain9RClientC4: TLayout;
    CircleMain9RClientC4: TCircle;
    TextMain9RClientC4: TText;
    LayoutMain9RClientC3: TLayout;
    CircleMain9RClientC3: TCircle;
    TextMain9RClientC3: TText;
    TextMain9RClient: TText;
    RectangleDetailInOutLeft: TRectangle;
    Rectangletop: TRectangle;
    Text_Title: TText;
    Image_Home: TImage;
    Text_Timer: TText;
    Text_UserID: TText;
    RectangleDetail2_Right: TRectangle;
    LayoutGraph: TLayout;
    LayoutGraph1DateTime: TLayout;
    LayoutDateEditGraph1: TLayout;
    DateEditGraph1: TDateEdit;
    TimeEditGraph1: TTimeEdit;
    LayoutDateEditGraph2: TLayout;
    DateEditGraph2: TDateEdit;
    TimeEditGraph2: TTimeEdit;
    TextGraphDateTime: TText;
    RectangleGraph_: TRectangle;
    Text_Detail2Top: TText;
    Image4: TImage;
    Image_Left: TImage;
    Image_right: TImage;
    ImageList1: TImageList;
    Image_Search: TImage;
    RectangleInoutRight: TRectangle;
    RectangleDetail11: TRectangle;
    Text_DetailRight1: TText;
    RectangleDetail13: TRectangle;
    Text_DetailRight3: TText;
    RectangleDetail12: TRectangle;
    Text_DetailRight2: TText;
    UniQuery_DetailInfo: TUniQuery;
    Layout6: TLayout;
    Text_Title1: TText;
    Text_Title2: TText;
    OpenDialog1: TOpenDialog;
    RectangleGraphSaveTimeTitle2: TRectangle;
    TextGraphSaveTimeTitle2: TText;
    TextGraphSaveTimeValue2: TText;
    RectangleGraphSaveTimeTitle3: TRectangle;
    TextGraphSaveTimeTitle3: TText;
    TextGraphSaveTimeValue3: TText;
    RectangleDetailInOut: TRectangle;
    RectangleDetail3_Excel: TRectangle;
    Text_Detail3_excel: TText;
    RectangleDetail2_Excel: TRectangle;
    Text_Detail2_excel: TText;
    Image_DetailPC2_xls: TImage;
    RectangleDetail4_Excel: TRectangle;
    Text_Detail4_excel: TText;
    Image_DetailPC4_xls: TImage;
    RectangleDetail4_chart: TRectangle;
    Text_Detail4_chart: TText;
    Image_DetailPC4_chart: TImage;
    SaveDialog1: TSaveDialog;
    ImageAlarm1: TImage;
    ImageAlarm4: TImage;
    ImageAlarm7: TImage;
    ImageAlarm10: TImage;
    ImageAlarm2: TImage;
    ImageAlarm5: TImage;
    ImageAlarm8: TImage;
    ImageAlarm11: TImage;
    ImageAlarm3: TImage;
    ImageAlarm6: TImage;
    ImageAlarm9: TImage;
    ImageAlarm12: TImage;
    IdFTP: TIdFTP;
    ImageWifi0: TImage;
    ImageMain1Logo: TImage;
    ImageMain2Logo: TImage;
    ImageMain10Logo: TImage;
    ImageMain4Logo: TImage;
    ImageMain7Logo: TImage;
    ImageMain11Logo: TImage;
    ImageMain5Logo: TImage;
    ImageMain8Logo: TImage;
    ImageMain12Logo: TImage;
    ImageMain3Logo: TImage;
    ImageMain6Logo: TImage;
    ImageMain9Logo: TImage;
    RectangleDetailPC1: TRectangle;
    RectangleDetailPC2: TRectangle;
    RectangleDetailPC3: TRectangle;
    RectangleDetailPC4: TRectangle;
    UniQuery_LoginA1: TUniQuery;
    UniQuery_LoginA2: TUniQuery;
    RectangleGraphSaveTimeTitle5: TRectangle;
    TextGraphSaveTimeTitle5: TText;
    TextGraphSaveTimeValue5: TText;
    RectangleGraphSaveTimeTitle4: TRectangle;
    TextGraphSaveTimeTitle4: TText;
    TextGraphSaveTimeValue4: TText;
    UniQuery_DetailAlarm2: TUniQuery;
    Text_Update: TText;
    Text3: TText;
    Timer_Update: TTimer;
    UniQuery_Update: TUniQuery;
    RectangleMain1Serial: TRectangle;
    TextMain1Serial: TText;
    TextMain1inDate: TText;
    RectangleMain2Serial: TRectangle;
    TextMain2Serial: TText;
    TextMain2inDate: TText;
    RectangleMain3Serial: TRectangle;
    TextMain3Serial: TText;
    TextMain3inDate: TText;
    RectangleMain10Serial: TRectangle;
    TextMain10Serial: TText;
    TextMain10inDate: TText;
    RectangleMain7Serial: TRectangle;
    TextMain7Serial: TText;
    TextMain7inDate: TText;
    RectangleMain11Serial: TRectangle;
    TextMain11Serial: TText;
    TextMain11inDate: TText;
    RectangleMain4Serial: TRectangle;
    TextMain4Serial: TText;
    TextMain4inDate: TText;
    RectangleMain5Serial: TRectangle;
    TextMain5Serial: TText;
    TextMain5inDate: TText;
    RectangleMain8Serial: TRectangle;
    TextMain8Serial: TText;
    TextMain8inDate: TText;
    RectangleMain12Serial: TRectangle;
    TextMain12Serial: TText;
    TextMain12inDate: TText;
    RectangleMain6Serial: TRectangle;
    TextMain6Serial: TText;
    TextMain6inDate: TText;
    RectangleMain9Serial: TRectangle;
    TextMain9Serial: TText;
    TextMain9inDate: TText;
    UniQuery_SetCheck: TUniQuery;
    Panel_Load: TPanel;
    Text1: TText;
    procedure ButtonWifiNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonWifiSetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    ///////////// 컴포넌트 공통 이벤트 /////////////////
    procedure TextMouseLeave(Sender: TObject);
    procedure TextMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Login(Sender: TObject);
    procedure Join(Sender: TObject);
    procedure MainRefresh;
    procedure MainResize;
    procedure DetailSave(Sender: TObject);
    procedure BackMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure BackMouseLeave(Sender: TObject);
    procedure ImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure ImageMouseLeave(Sender: TObject);
    procedure TextMouseLeaveR(Sender: TObject);
    procedure TextMouseMoveR(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure TextMouseLeaveI(Sender: TObject);
    procedure TextMouseMoveI(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure ImagePlusClick(Sender: TObject);
    procedure SetSaveButton1(Sender: TObject);
    procedure SetSaveButton2(Sender: TObject);
    procedure PlusImageClick(Sender: TObject);
    procedure MinusImageClick(Sender: TObject);
    procedure DetailRectangleClick(Sender: TObject);
    ///////////////////////////////////////////////
    procedure TextLoginClick(Sender: TObject);
    procedure TextJoinClick(Sender: TObject);
    procedure TextJoinAddClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure TimerTempCheckTimer(Sender: TObject);
    procedure ImageMainPriorClick(Sender: TObject);
    procedure ImageMainNextClick(Sender: TObject);
    procedure TextDetailSaveButtonClick(Sender: TObject);
    procedure TextDetailChangeClick(Sender: TObject);
    procedure ImageDetailPlusClick(Sender: TObject);
    procedure ImageDetailMinusClick(Sender: TObject);
    procedure ActionNextExecute(Sender: TObject);
    procedure ActionPriorExecute(Sender: TObject);
    procedure RectangleMainBackGroundMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure RectangleMainBackGroundMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Text1Click(Sender: TObject);
    procedure TextManageBackClick(Sender: TObject);
    procedure TextMainClick(Sender: TObject);
    procedure ImageLoginClick(Sender: TObject);
    procedure EditDetailIn1Exit(Sender: TObject);
    procedure ImageDetailPowerClick(Sender: TObject);
    procedure ButtonDeviceDeleteClick(Sender: TObject);
    procedure ImageGraphClick(Sender: TObject);
    procedure ButtonGraphWeekClick(Sender: TObject);
    procedure ButtonGraphMonthClick(Sender: TObject);
    procedure ButtonGraphCSVClick(Sender: TObject);
    procedure ButtonGraphSaveClick(Sender: TObject);
    procedure Text5Click(Sender: TObject);
    procedure Resize;
    procedure Chart1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure EditDetailHighExit(Sender: TObject);
    procedure TextDetailSetTempEditExit(Sender: TObject);
    procedure TextConnectTitleClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: string);
    procedure ImageGraphPlusClick(Sender: TObject);
    procedure ImageGraphMinusClick(Sender: TObject);
    procedure TextGraphExpandClick(Sender: TObject);
    procedure ButtonGraphSetClick(Sender: TObject);
    procedure ButtonGraphDateTimeClick(Sender: TObject);
    procedure ImageGraph2PlusClick(Sender: TObject);
    procedure ImageGraph2MinusClick(Sender: TObject);
    procedure TextGraph2ExpandClick(Sender: TObject);
    procedure ButtonPWClick(Sender: TObject);
    procedure ImageDetailAlarmClick(Sender: TObject);
    procedure TextDetailSetTempEditEnter(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure CheckBoxPasswordChange(Sender: TObject);
    procedure SaveTimeDisplay;
    procedure RectangleGraphSaveTimeClick(Sender: TObject);
    procedure TextDefrostClick(Sender: TObject);
    procedure ImageXClick(Sender: TObject);
    procedure TimerFirstCheckTimer(Sender: TObject);
    procedure TimerControllerAllSearchTimer(Sender: TObject);
    procedure TimerGraphSearchTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SearchAlarmList;
    procedure ButtonGraphCSV2Click(Sender: TObject);
    procedure ButtonGraphCSV1Click(Sender: TObject);
    procedure Timer_CheckTimer(Sender: TObject);
    procedure Image_HomeClick(Sender: TObject);
    procedure Image_rightClick(Sender: TObject);
    procedure Image_LeftClick(Sender: TObject);
    procedure Image_LeftMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Image_LeftMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Image_rightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Image_rightMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Image_SearchMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Image_SearchMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure StringGrid1DrawColumnCell(Sender: TObject; const Canvas: TCanvas;
      const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates);
    procedure ImageAlarm1Click(Sender: TObject);
    procedure StringGrid2DrawColumnCell(Sender: TObject; const Canvas: TCanvas;
      const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure DateEditGraph2Change(Sender: TObject);
    procedure TimeEditGraph2Change(Sender: TObject);
    procedure DateEditGraph1Change(Sender: TObject);
    procedure TimeEditGraph1Change(Sender: TObject);
    procedure RectangleMain1MouseEnter(Sender: TObject);
    procedure RectangleMain1MouseLeave(Sender: TObject);
    procedure Timer_UpdateTimer(Sender: TObject);
    procedure EditPWKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EditIDKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
    Reflog : boolean;
    FPermissionReadExternalStorage,
    FPermissionWriteExternalStorage: string;
    FDeviceId: string;
    FDeviceToken: string;
    FirstCheck : Boolean;
    FLastDistance : integer;
    FirstDown : Boolean;
    ThreadNumber : Integer;
    MessageShown : boolean;
    MP3Files :String;
    FTPFolderPath : string;
    {$IFDEF ANDROID}
    procedure OnReceiveNotificationEvent(Sender: TObject; const ServiceNotification: TPushServiceNotification);
    procedure OnServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
    procedure SetNotification(const aTitle, aMessage: string);
    {$ENDIF ANDROID}
  public
    GraphSearchCount, ControllerAllSearchCount : Integer;

    { Public declarations }
    // BCC계산 (BCCNum = 1)485BCC / (BCCNum = 2)232BCC
    function BccCalculator(HexString: String; BCCNum: Integer):Integer;
    procedure IdTCPClientConnected(Sender: TObject);
    procedure IdTCPClientDisconnected(Sender: TObject);
    procedure IdThreadComponentRun(Sender: TIdThreadComponent);
    procedure HandleException(Sender: TObject; E: Exception);
    procedure ControllerAllSearch;
    procedure GraphSearch;
    procedure GraphExpand;
    procedure GraphExpand2;
    function  IsInternetConnected: Boolean;

  end;



var
  fDongHwa: TfDongHwa;
///////////////통신관련////////////////
  IdTCPClient         : TIdTCPClient;
  idThreadComponent   : TIdThreadComponent;
  ReadData : String;
  SendMod : integer;
  SerialCheck : Boolean;
  SerialNo : String;
////////////////////////////////////////
    MasterUserID : integer;
    MasterCheck : Boolean;
    Company : String;
    ControllerCount : Integer;
    Page : Integer;
    ModelCount : Integer;
    ModelStr : array[0..1000] of String;
    ControllerID : array[1..12] of Integer;
    ControllerState : array[1..12] of Boolean;
    ControllerHighTemp : array[1..12] of Double;
    ControllerLowTemp : array[1..12] of Double;
    SetTemp : array[1..12] of Double;
    DefrostMode : array[1..12] of Boolean;
    DefrostState : array[1..12] of Boolean;
    DIn, DOut : array[1..12] of array[1..5] of Boolean;
    DetailSetTemp : Double;
    DetailControllerID : Integer;
    MemberCount : Integer;
    MemberID : array[0..1000] of Integer;
    MemberEnterID : String;

    Alarm : Integer;
    DetailAlarm : array[1..12] of Boolean;
    AlarmDelButton : TButton;

    MainRect : array[1..12] of TRectangle;

    TextMainRTop    : array[1..12] of Ttext;
    TextMainRClient : array[1..12] of Ttext;

    DetailSetTempStr : String;

    GraphStart, GraphEnd : String;

    PreIndex11, PreIndex12, PreIndex13, PreIndex14, PreIndex15,
    PreIndex21, PreIndex22, PreIndex23, PreIndex24, PreIndex25,
    PreIndex31, PreIndex32, PreIndex33, PreIndex34, PreIndex35 : Integer;

    PreMain1InCount, PreMain1OutCount : Integer;
    PreMain2InCount, PreMain2OutCount : Integer;
    PreMain3InCount, PreMain3OutCount : Integer;
    PreMain4InCount, PreMain4OutCount : Integer;
    PreMain5InCount, PreMain5OutCount : Integer;
    PreMain6InCount, PreMain6OutCount : Integer;
    PreMain7InCount, PreMain7OutCount : Integer;
    PreMain8InCount, PreMain8OutCount : Integer;
    PreMain9InCount, PreMain9OutCount : Integer;
    PreMain10InCount, PreMain10OutCount : Integer;
    PreMain11InCount, PreMain11OutCount : Integer;
    PreMain12InCount, PreMain12OutCount : Integer;

    MainSetChangeState : Boolean;

  TitleSize, TempSize, TempSetSize, MiddleSize, LowSize, MostLowSize : Integer;
  PCTitleSize, PCTempSize, PCTempSetSize, PCerrSize, PCerrSetSize, PCMiddleSize, PCLowSize, PCMostLowSize,PCrTOPSize : Integer;
  ClientWidthDiv3 : Integer;
  TempSizePercent : Double;

  GraphDetailSerialNo : String;
  GraphDateAvg1, GraphDateAvg2 : Double;
  GraphTempAvg : Double;
  ChartMinDate, ChartMaxDate : TDateTime;
  Current : Integer;
  Expand, Expand2 : Integer;

  FirstK1, FirstK2, FirstK3, FirstK4, FirstK5 : Boolean;
  PreTimeK1, PreTimeK2, PreTimeK3, PreTimeK4, PreTimeK5 : TDateTime;
  SaveTimeK : Array[0..5] of Currency;
  NameK : Array[0..5] of String;
  SelectKNumber : Integer;
  KOutCount : Integer;
////////////////////////////////////////
  KeyBoardFlag : Boolean;
  MouseDownY : Double;
  MouseDownCheck : Boolean;

  CursorHandle: HCURSOR;

  pushToken : string;

  //경보상한하한
  hightemp, Lowtemp : Double;
  // 설정온도 상하한
  hightemp2, Lowtemp2 : Double;
implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

uses
  System.IniFiles,  // Ini File
  System.IOUtils,   // Path
  System.Permissions,

{$IFDEF ANDROID}
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Net,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.Provider,
{$ENDIF}
  FMX.Platform,
  FMX.DialogService;

  type
  TProcArray = array of TProc;

procedure TfDongHwa.ActionNextExecute(Sender: TObject);
begin
  ImageMainNextClick(ImageMainNext);
end;

procedure TfDongHwa.ActionPriorExecute(Sender: TObject);
begin
  ImageMainPriorClick(ImageMainPrior);
end;

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

procedure TfDongHwa.ButtonDeviceDeleteClick(Sender: TObject);
begin
  if RectanglePW.Visible = True then
  begin
    RectanglePW.Visible := false;
    EditPW2.Text := '';
    TextPW1.Text := '단말기 등록 삭제';
    TextPW2.Text := '비밀번호를 입력하세요';
  end
  else
  begin
    EditPW2.Text := '';
    TextPW1.Text := '단말기 등록 삭제';
    TextPW2.Text := '비밀번호를 입력하세요';
    RectanglePW.Height := 150 + EditPW2.Height;  // 240812 김동휘 수정
//    RectanglePW.Margins.Bottom := 0;             // 240812 김동휘 수정
//    RectanglePW.Width :=   EditPW2.Width/2;  // 240812 김동휘 수정
    RectanglePW.Visible := True;
    EditPW2.SetFocus;
  end;
end;

procedure TfDongHwa.ButtonGraphCSV1Click(Sender: TObject);
var
  ExcelApp, Workbook, Worksheet: OleVariant;
  Row, Col: Integer;
  Files: string;
begin
  Panel_Load.Visible := true;
  try
    try
      // Excel 실행
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Visible := False;  // 엑셀 창 숨김

      // 새 워크북 추가
      Workbook := ExcelApp.Workbooks.Add;
      Worksheet := Workbook.Worksheets[1];

      // 컬럼명(헤더) 추가
      for Col := 0 to StringGrid1.ColumnCount - 1 do
        Worksheet.Cells[1, Col + 1] := StringGrid1.Columns[Col].Header;

      // 데이터 추가
      for Row := 0 to StringGrid1.RowCount - 1 do
        for Col := 0 to StringGrid1.ColumnCount - 1 do
          Worksheet.Cells[Row + 2, Col + 1] := StringGrid1.Cells[Col, Row];

      // 열 너비 자동 조정
      Worksheet.Columns.AutoFit;

      // 저장 다이얼로그 설정
      SaveDialog1.Filter := 'Excel 파일 (*.xlsx)|*.xlsx|모든 파일 (*.*)|*.*';
      SaveDialog1.FileName := EditGraphModel.Text + '_' +
                              Copy(GraphStart, 1, 10) + '_' +
                              Copy(GraphEnd, 1, 10) + '_상세1.xlsx';

      if SaveDialog1.Execute then
      begin
        Files := SaveDialog1.FileName;
        Workbook.SaveAs(Files, 51); // 51 = xlOpenXMLWorkbook (XLSX 형식)
      end;



    except
      on E: Exception do
        ShowMessage('Excel 저장 중 오류 발생: ' + E.Message);
    end;
  finally
    Panel_Load.Visible := false;
          // 엑셀 종료
      Workbook.Close(False);
      ExcelApp.Quit;
  end;
end;

procedure TfDongHwa.ButtonGraphCSV2Click(Sender: TObject);
//var
// SL: TStringList;
//  Row, Col, DataCol: Integer;
//  Line: string;
//  Files : string;
//    Excel, Workbook, Worksheet: OleVariant;
//  includeK1, includeK2, includeK3, includeK4, includeK5: Boolean;
//    TemplatePath, SavePath, CellData, ExtractedNumber: string;
begin

  Panel_Load.Visible := true;
 TTask.Run(
    procedure
    begin
      TThread.Synchronize(nil, procedure
      var
        Excel, Workbook, Worksheet: OleVariant;
        Row: Integer;
        TemplatePath, SavePath, CellData, ExtractedNumber: string;
      begin
        try
          // Excel OLE 초기화
          Excel := CreateOleObject('Excel.Application');
          Excel.Visible := False;  // 작업 과정이 보이지 않도록 설정
          // 고정된 템플릿 파일 경로 설정
          TemplatePath := TPath.GetDocumentsPath+'\엑셀파일저장형식.xlsx';  // 실제 템플릿 파일 경로로 수정하세요
          if not FileExists(TemplatePath) then
          begin
            ShowMessage('프로그램을 재 실행하여 시도해주세요.');
            EXIT;
          end;

          // 템플릿 파일 열기
          Workbook := Excel.Workbooks.Open(TemplatePath);
          Worksheet := Workbook.Worksheets[1];  // 첫 번째 워크시트를 사용
          // 데이터를 지정한 위치에 추가
          for Row := 0 to StringGrid2.RowCount - 1 do
          begin
            Worksheet.Cells[Row + 2, 1].Value := StringGrid2.Cells[0, Row];  // 시간
            Worksheet.Cells[Row + 2, 2].Value := StringGrid2.Cells[1, Row];  // 현재값
            Worksheet.Cells[Row + 2, 3].Value := StringGrid2.Cells[2, Row];  // 설정값
            Worksheet.Cells[Row + 2, 4].Value := StringGrid2.Cells[3, Row];  // 출력
            Worksheet.Cells[Row + 2, 5].Value := StringGrid2.Cells[4, Row];  // 경보종류
            Worksheet.Cells[Row + 2, 6].Value := StringGrid2.Cells[5, Row];  // 경보발생시간
            Worksheet.Cells[Row + 2, 7].Value := StringGrid2.Cells[6, Row];  // 경보해제시간
            // k1 ~ k5 데이터 추가 - 숫자만 추출하여 입력
            CellData := StringGrid2.Cells[StringGrid2.ColumnCount - 1, Row];
            if Pos('k1', CellData) > 0 then
            begin
              ExtractedNumber := Copy(CellData, Pos(':', CellData) + 2, Pos('m', CellData) - Pos(':', CellData) - 2);
              Worksheet.Cells[Row + 2, 8].Value := 'k1';
              Worksheet.Cells[Row + 2, 9].Value := ExtractedNumber;  // 숫자만 입력
            end;
            if Pos('k2', CellData) > 0 then
            begin
              ExtractedNumber := Copy(CellData, Pos(':', CellData) + 2, Pos('m', CellData) - Pos(':', CellData) - 2);
              Worksheet.Cells[Row + 2, 10].Value := 'k2';
              Worksheet.Cells[Row + 2, 11].Value := ExtractedNumber;  // 숫자만 입력
            end;
            if Pos('k3', CellData) > 0 then
            begin
              ExtractedNumber := Copy(CellData, Pos(':', CellData) + 2, Pos('m', CellData) - Pos(':', CellData) - 2);
              Worksheet.Cells[Row + 2, 12].Value := 'k3';
              Worksheet.Cells[Row + 2, 13].Value := ExtractedNumber;  // 숫자만 입력
            end;
            if Pos('k4', CellData) > 0 then
            begin
              ExtractedNumber := Copy(CellData, Pos(':', CellData) + 2, Pos('m', CellData) - Pos(':', CellData) - 2);
              Worksheet.Cells[Row + 2, 14].Value := 'k4';
              Worksheet.Cells[Row + 2, 15].Value := ExtractedNumber;  // 숫자만 입력
            end;
            if Pos('k5', CellData) > 0 then
            begin
              ExtractedNumber := Copy(CellData, Pos(':', CellData) + 2, Pos('m', CellData) - Pos(':', CellData) - 2);
              Worksheet.Cells[Row + 2, 16].Value := 'k5';
              Worksheet.Cells[Row + 2, 17].Value := ExtractedNumber;  // 숫자만 입력
            end;
          end;

          // 경보종류 열의 너비를 조정
          Worksheet.Columns[5].ColumnWidth := 30;
          Worksheet.Columns[6].ColumnWidth := 30;
          Worksheet.Columns[7].ColumnWidth := 30;

          // 저장 다이얼로그를 띄워 사용자가 원하는 경로에 저장하도록 설정
          with TSaveDialog.Create(nil) do
          try
            Filter := 'Excel 파일 (*.xlsx)|*.xlsx|모든 파일 (*.*)|*.*';
            Title := '저장할 위치를 선택하세요';
            FileName := EditGraphModel.Text + '_' + Copy(GraphStart, 1, 10)
                            + '_' + Copy(GraphEnd, 1, 10) + '_상세2.xlsx';
            if Execute then
            begin
              SavePath := FileName;
              Workbook.SaveAs(SavePath);
            //  ShowMessage('파일이 저장되었습니다: ' + SavePath);
            end;
          finally
            Free;
          end;
        finally
          // 객체 참조 해제
          Worksheet := Unassigned;
          Workbook.Close(False);
          Workbook := Unassigned;
          Excel.Quit;
          Excel := Unassigned;
          Panel_Load.Visible := false;
        end;
      end);
    end
  );



  {SL := TStringList.Create;
  try
    var includeK1, includeK2, includeK3, includeK4, includeK5: Boolean;
    includeK1 := False;
    includeK2 := False;
    includeK3 := False;
    includeK4 := False;
    includeK5 := False;

    // 데이터에서 k1, k2, k3가 있는지 확인하여 컬럼 추가 여부 결정
    for Row := 0 to StringGrid2.RowCount - 1 do
    begin
      var cellData := Trim(StringGrid2.Cells[StringGrid2.ColumnCount - 1, Row]);  // 셀 데이터 확인 (공백 제거)

      // 셀이 빈칸이 아니면 해당 데이터를 체크
      if cellData <> '' then
      begin
        if Pos('k1', cellData) > 0 then
          includeK1 := True;
        if Pos('k2', cellData) > 0 then
          includeK2 := True;
        if Pos('k3', cellData) > 0 then
          includeK3 := True;
      end;
    end;

    // 컬럼명(헤더) 추가
    Line := '';
    for Col := 0 to StringGrid2.ColumnCount - 2 do  // 마지막 컬럼 제외
    begin
      Line := Line + StringGrid2.Columns[Col].Header + ',';  // 쉼표 추가
    end;

    if includeK1 then
      Line := Line + 'k1,';
    if includeK2 then
      Line := Line + 'k2,';
    if includeK3 then
      Line := Line + 'k3,';
    if includeK4 then
      Line := Line + 'k4,';
    if includeK5 then
      Line := Line + 'k5,';

    // 마지막 콤마 제거
    if (Line <> '') and (Line[Length(Line)] = ',') then
      Delete(Line, Length(Line), 1);

    SL.Add(Line);  // 완성된 헤더 줄을 StringList에 추가

    // 데이터 행 추가
    for Row := 0 to StringGrid2.RowCount - 1 do
    begin
      Line := '';
      for Col := 0 to StringGrid2.ColumnCount - 2 do  // 마지막 컬럼 제외
      begin
        Line := Line + StringGrid2.Cells[Col, Row] + ',';  // 열 사이에 쉼표 추가
      end;

      var cellData := Trim(StringGrid2.Cells[StringGrid2.ColumnCount - 1, Row]);  // 셀 데이터 확인 (공백 제거)

      // 빈칸이면 해당 행을 추가하지 않음
      if cellData = '' then
      begin
        SL.Add(Line);  // 빈칸일 경우 k 값을 추가하지 않고 행을 종료
        Continue;  // 다음 행으로 넘어감
      end;

      // k1, k2, k3가 있는 경우에만 값 추가
      if includeK1 then
      begin
        var k1_pos := Pos('k1', cellData);
        if k1_pos > 0 then
        begin
          var k1_end := Pos('m', cellData, k1_pos);
          if k1_end > 0 then
          begin
            var k1_data := Copy(cellData, k1_pos, k1_end - k1_pos + 1);
            Line := Line + k1_data + ',';  // 괄호까지 포함한 k1 데이터 추가
          end
          else
            Line := Line + ',';
        end
        else
          Line := Line + ',';  // k1이 없는 경우 빈칸
      end;

      if includeK2 then
      begin
        var k2_pos := Pos('k2', cellData);
        if k2_pos > 0 then
        begin
          var k2_end := Pos('m', cellData, k2_pos);
          if k2_end > 0 then
          begin
            var k2_data := Copy(cellData, k2_pos, k2_end - k2_pos + 1);
            Line := Line + k2_data + ',';  // 괄호까지 포함한 k2 데이터 추가
          end
          else
            Line := Line + ',';
        end
        else
          Line := Line + ',';  // k2가 없는 경우 빈칸
      end;

      if includeK3 then
      begin
        var k3_pos := Pos('k3', cellData);
        if k3_pos > 0 then
        begin
          var k3_end := Pos('m', cellData, k3_pos);
          if k3_end > 0 then
          begin
            var k3_data := Copy(cellData, k3_pos, k3_end - k3_pos + 1);
            Line := Line + k3_data + ',';  // 괄호까지 포함한 k3 데이터 추가
          end
          else
            Line := Line + ',';
        end
        else
          Line := Line + ',';  // k3가 없는 경우 빈칸
      end;

      if includeK4 then
      begin
        var k4_pos := Pos('k4', cellData);
        if k4_pos > 0 then
        begin
          var k4_end := Pos('m', cellData, k4_pos);
          if k4_end > 0 then
          begin
            var k4_data := Copy(cellData, k4_pos, k4_end - k4_pos + 1);
            Line := Line + k4_data + ',';  // 괄호까지 포함한 k4 데이터 추가
          end
          else
            Line := Line + ',';
        end
        else
          Line := Line + ',';  // k4가 없는 경우 빈칸
      end;

       if includeK5 then
      begin
        var k5_pos := Pos('k5', cellData);
        if k5_pos > 0 then
        begin
          var k5_end := Pos('m', cellData, k5_pos);
          if k5_end > 0 then
          begin
            var k5_data := Copy(cellData, k5_pos, k5_end - k5_pos + 1);
            Line := Line + k5_data + ',';  // 괄호까지 포함한 k5 데이터 추가
          end
          else
            Line := Line + ',';
        end
        else
          Line := Line + ',';  // k5가 없는 경우 빈칸
      end;
      // 마지막 콤마 제거
      if (Line <> '') and (Line[Length(Line)] = ',') then
        Delete(Line, Length(Line), 1);

      SL.Add(Line);  // 완성된 줄을 StringList에 추가
    end;

    // 파일 이름 및 저장
    SaveDialog1.Filter := 'CSV 파일 (*.csv)|*.csv|모든 파일 (*.*)|*.*';
    SaveDialog1.FileName := EditGraphModel.Text + '_' + Copy(GraphStart, 1, 10)
                            + '_' + Copy(GraphEnd, 1, 10) + '_상세2.csv';
    if SaveDialog1.Execute then
    begin
      Files := SaveDialog1.FileName;
      SL.SaveToFile(Files);
    end;
  finally
    SL.Free;
  end;     }

end;

procedure TfDongHwa.ButtonGraphCSVClick(Sender: TObject);
var
  ExcelApp, Workbook, Worksheet: OleVariant;
  Row: Integer;
  Files, DetailSerialNo, OutLine, OutLine2: string;
begin
  Panel_Load.Visible := true;
  try
    try
      with UniQueryGraph do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ControllerInfo WHERE ControllerID = ' + DetailControllerID.ToString);
        Open;

        if IsEmpty then
        begin
          ShowMessage('결과가 없습니다.');
          Exit;
        end;

        DetailSerialNo := Trim(FieldByName('SerialNo').AsString);

        Close;
        SQL.Clear;
        SQL.Add('SELECT Format(CheckDate, ''yyyy-MM-dd HH:mm:ss'') AS CheckDate, Temp,');
        SQL.Add('T.DOut1, T.DOut2, T.DOut3, T.DOut4, T.DOut5, M.OutCount, T.DefrostMode, T.DefrostState,');
        SQL.Add('(CASE WHEN ISNULL(C.Out1, '''') = '''' THEN M.K1Name ELSE C.Out1 END) AS K1,');
        SQL.Add('(CASE WHEN ISNULL(C.Out2, '''') = '''' THEN M.K2Name ELSE C.Out2 END) AS K2,');
        SQL.Add('(CASE WHEN ISNULL(C.Out3, '''') = '''' THEN M.K3Name ELSE C.Out3 END) AS K3,');
        SQL.Add('(CASE WHEN ISNULL(C.Out4, '''') = '''' THEN M.K4Name ELSE C.Out4 END) AS K4,');
        SQL.Add('(CASE WHEN ISNULL(C.Out5, '''') = '''' THEN M.K5Name ELSE C.Out5 END) AS K5');
        SQL.Add('FROM TempCheck AS T');
        SQL.Add('LEFT JOIN ControllerInfo AS C ON T.SerialNo = C.SerialNo');
        SQL.Add('LEFT JOIN Model AS M ON C.ModelCODE = M.Code');
        SQL.Add('WHERE T.SerialNo = ' + QuotedStr(DetailSerialNo));
        SQL.Add('AND CheckDate >= ' + QuotedStr(GraphStart));
        SQL.Add('AND CheckDate <= ' + QuotedStr(GraphEnd));
        SQL.Add('ORDER BY CheckDate');
        Open;
      end;

      if UniQueryGraph.IsEmpty then
      begin
        ShowMessage('쿼리 데이터가 없습니다.');
        Exit;
      end;

      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Visible := False; // 엑셀 창 숨김

      // 새 워크북 추가
      Workbook := ExcelApp.Workbooks.Add;
      Worksheet := Workbook.Worksheets[1];

      // 헤더 추가
      Worksheet.Cells[1, 1] := EditGraphModel.Text + ', ' + TextGraphDevice.Text;
      Worksheet.Cells[2, 1] := '일시';
      Worksheet.Cells[2, 2] := '현재값';
      Worksheet.Cells[2, 3] := '출력상태';

      // 데이터 추가
      UniQueryGraph.First;
      Row := 3; // 3번째 행부터 데이터 입력

      while not UniQueryGraph.Eof do
      begin
         OutLine := '';
  //      OutLine := UniQueryGraph.FieldByName('CheckDate').AsString + ',';
  //      OutLine := OutLine + UniQueryGraph.FieldByName('Temp').AsString + '°C,';

        OutLine2 := UniQueryGraph.FieldByName('CheckDate').AsString + '    ,';
        OutLine2 := OutLine2 + UniQueryGraph.FieldByName('Temp').AsString + '°C    ,';
        //제상버튼추가
        if ( (TextDetailModel.Text = 'WT2023C')
          or (TextDetailModel.Text = 'W1120DC2S')
          or (TextDetailModel.Text = 'WK2023C')
          or (TextDetailModel.Text = 'WK2023AC')
          or (TextDetailModel.Text = 'WT2023AC')
          or (TextDetailModel.Text = 'W2023AC')
          or (TextDetailModel.Text = 'W2023C')
          or (TextDetailModel.Text = 'BW7023-S') )
          and (UniQueryGraph.FieldByName('DefrostState').AsBoolean) then
        begin
          if UniQueryGraph.FieldByName('DefrostMode').AsBoolean then
            OutLine := ','+OutLine + '수동제상'
          else
            OutLine := ','+OutLine + '제상';
        end
        else
        begin
          if (UniQueryGraph.FieldByName('DOut1').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 0) then
            OutLine := OutLine + UniQueryGraph.FieldByName('K1').AsString + ',';
          if (UniQueryGraph.FieldByName('DOut2').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 1) then
            OutLine := OutLine + UniQueryGraph.FieldByName('K2').AsString + ',';
          if (UniQueryGraph.FieldByName('DOut3').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 2) then
            OutLine := OutLine + UniQueryGraph.FieldByName('K3').AsString + ',';
          if (UniQueryGraph.FieldByName('DOut4').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 3) then
            OutLine := OutLine + UniQueryGraph.FieldByName('K4').AsString + ',';
          if (UniQueryGraph.FieldByName('DOut5').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 4) then
            OutLine := OutLine + UniQueryGraph.FieldByName('K5').AsString + ',';
        end;

        // Excel에 추가
        Worksheet.Cells[Row, 1] := UniQueryGraph.FieldByName('CheckDate').AsString;
        Worksheet.Cells[Row, 2] := UniQueryGraph.FieldByName('Temp').AsString + '°C';
        Worksheet.Cells[Row, 3] := OutLine;

        Inc(Row);
        UniQueryGraph.Next;
      end;

      // 열 너비 자동 조정
      Worksheet.Columns.AutoFit;

      // 저장
      SaveDialog1.Filter := 'Excel 파일 (*.xlsx)|*.xlsx|모든 파일 (*.*)|*.*';
      SaveDialog1.FileName := EditGraphModel.Text + '_' +
                              Copy(GraphStart, 1, 10) + '_' +
                              Copy(GraphEnd, 1, 10) + '_상세3.xlsx';

      if SaveDialog1.Execute then
      begin
        Files := SaveDialog1.FileName;
        Workbook.SaveAs(Files, 51); // 51 = xlOpenXMLWorkbook (XLSX 형식)
      end;

     // ShowMessage('엑셀 파일 저장 완료: ' + Files);

    except
      on E: Exception do
        ShowMessage('Excel 저장 중 오류 발생: ' + E.Message);
    end;
  finally
    Panel_Load.Visible := false;
    Workbook.Close(False);
    ExcelApp.Quit;
  end;
end;


//    {$IFDEF ANDROID}
//    try
//      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
//      Intent.setType(StringToJString('text/pas'));
//  //    Intent.setType(StringToJString('text/csv'));
//      Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(SendText));
//  //    Intent.putExtra(TJIntent.JavaClass.EXTRA_STREAM, StringToJString(SendText));
//      Intent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
//      SharedActivity.startActivity(TJIntent.JavaClass.createChooser(Intent, StrToJCharSequence('')));
//    except on E: Exception do
//      ShowMessage(E.Message);
//    end;

  //      FileName := TPath.GetDocumentsPath+'/'
  //                    +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
  //                                    +'_'+Copy(GraphEnd,1,10)+'.csv';
  //
  //      ListArqs := TJArrayList.Create;
  //      FileUri := TJNet_Uri.JavaClass.fromFile(TJFile.JavaClass.init(StringToJString(FileName)));
  //      ListArqs.Add(0, FileUri);
  //      try
  //         Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  //         Intent.setType(StringToJString('*/*'));
  //         Intent.putParcelableArrayListExtra(TJIntent.JavaClass.EXTRA_STREAM, ListArqs);
  //         Intent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
  //         SharedActivity.startActivity(TJIntent.JavaClass.createChooser(Intent, StrToJCharSequence('')));
  //      except
  //         on E: Exception do
  //            ShowMessage(E.Message);
  //      end;

 //   {$ENDIF ANDROID}

  //  Showmessage(TPath.GetDownloadsPath+'/'
  //                  +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
  //                                    +'_'+Copy(GraphEnd,1,10)+'.csv');

procedure TfDongHwa.ButtonGraphDateTimeClick(Sender: TObject);
begin
//  LayoutGraph1Button.Visible := True;
//  LayoutGraph1DateTime.Visible := False;
//    // 240812 김동휘추가
  //   왼쪽 하단
  SearchAlarmList;
  GraphStart := FormatDateTime('yyyy-mm-dd ',DateEditGraph1.Date) + FormatDateTime('hh:nn:ss',TimeEditGraph1.Time);
  GraphEnd := FormatDateTime('yyyy-mm-dd ',DateEditGraph2.Date) + FormatDateTime('hh:nn:ss',TimeEditGraph2.Time);
  GraphSearch;
end;

procedure TfDongHwa.ButtonGraphMonthClick(Sender: TObject);
begin
  GraphStart := FormatDateTime('yyyy-mm-dd 00:00:00',Now-30);
  GraphEnd := FormatDateTime('yyyy-mm-dd 23:59:59',Now);
  GraphSearch;
end;

procedure TfDongHwa.ButtonGraphSaveClick(Sender: TObject);
var
  {$IFDEF ANDROID}
 Intent: JIntent;
 FileUri: Jnet_Uri;
 ListArqs: JArrayList;
  {$ENDIF ANDROID}
 FileName : String;
  Bitmap: TBitmap;
  sPath: String;
  Files : string;
begin
  {$IFDEF ANDROID}
  try
  //    Image1.Bitmap := Chart1.TeeCreateBitmap;
  //    Image1.Visible := True;

    PermissionsService.RequestPermissions([FPermissionReadExternalStorage],
    procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
    begin
    end);
    PermissionsService.RequestPermissions([FPermissionWriteExternalStorage],
    procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
    begin
    end);

    if (PermissionsService.IsPermissionGranted(FPermissionReadExternalStorage))
     and (PermissionsService.IsPermissionGranted(FPermissionWriteExternalStorage)) then
    begin

      Chart1.SaveToBitmapFile(TPath.GetDownloadsPath+'/'
                    +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
                                      +'_'+Copy(GraphEnd,1,10)+'.jpeg');

      ShowShareSheetAction1.Execute;

      {
      FileName := TPath.GetDownloadsPath+'/'
                     +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
                                      +'_'+Copy(GraphEnd,1,10)+'.jpeg';

      ListArqs := TJArrayList.Create;
      FileUri := TJNet_Uri.JavaClass.fromFile(TJFile.JavaClass.init(StringToJString(FileName)));
      ListArqs.Add(0, FileUri);
      try
         Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
         Intent.setType(StringToJString('image/plain'));
         Intent.putParcelableArrayListExtra(TJIntent.JavaClass.EXTRA_STREAM, ListArqs);
         Intent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
         SharedActivity.startActivity(TJIntent.JavaClass.createChooser(Intent, StrToJCharSequence('')));
      except
         on E: Exception do
            ShowMessage(E.Message);
      end;
                         }
    end;

  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
  {$ENDIF ANDROID}
  try
    try
      Chart1.Title.Text.Add(EditGraphModel.Text+', '+TextGraphDevice.Text);// := EditGraphModel.Text;
      SaveDialog1.Filter := 'JPG 파일 (*.jpg)|*.jpg|모든 파일 (*.*)|*.*';
      SaveDialog1.FileName :=  EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
                                        +'_'+Copy(GraphEnd,1,10)+'.jpg';
      if SaveDialog1.Execute then
      begin
        Files := SaveDialog1.FileName;
        Chart1.SaveToBitmapFile(Files);
      end;
    except on e:exception do
      begin
        Showmessage('에러코드: '+e.Message);
      end;
    end;
  finally
    Chart1.Title.Text.Clear;
  end;
end;

procedure TfDongHwa.ButtonGraphSetClick(Sender: TObject);
begin
//  LayoutGraph1Button.Visible := False;
//  LayoutGraph1DateTime.Visible := True;
end;

procedure TfDongHwa.ButtonGraphWeekClick(Sender: TObject);
begin
  GraphStart := FormatDateTime('yyyy-mm-dd 00:00:00',Now-7);
  GraphEnd := FormatDateTime('yyyy-mm-dd 23:59:59',Now);
  GraphSearch;
end;

procedure TfDongHwa.ButtonPWClick(Sender: TObject);
begin
  try
    if EditPW2.Text = EditPW.Text then
    begin
      if TextPW1.Text = '단말기 등록 삭제' then
      begin
        try
        // 경보알람
          UniQueryDelete.Close;
          UniQueryDelete.SQL.Clear;
          UniQueryDelete.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, EndTime, CheckTime)');
          UniQueryDelete.SQL.Add('Values('+#39+DetailControllerID.ToString+#39);
          UniQueryDelete.SQL.Add(','+#39+'['+EditID.Text +'] : '+TextDetailTitle.text+' 단말기가 삭제되었습니다.'+#39+', GETDATE(), GETDATE(), GETDATE() )');
          UniQueryDelete.Execute;

          // 삭제 푸시알람
          UniQueryDelete.Close;
          UniQueryDelete.SQL.Clear;
          UniQueryDelete.SQL.Add('Insert Into PushData(Token, Title, Msg, InsertTime)');
          UniQueryDelete.SQL.Add('Values('+#39+pushToken+#39);
          UniQueryDelete.SQL.Add(','+#39+'['+EditID.Text +'] : '+TextDetailTitle.text+#39+','+#39+'단말기가 삭제되었습니다.'+#39+', GETDATE())');
          UniQueryDelete.Execute;

          UniQueryDelete.Close;
          UniQueryDelete.SQL.Clear;
          UniQueryDelete.SQL.Add('Update ControllerInfo Set MasterID = -1 , ControllerName = '''' ');
          UniQueryDelete.SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
          UniQueryDelete.Execute;

          ControllerAllSearch;
          MainRefresh;
          TabControl1.ActiveTab := TabItemMain;
        finally

        end;
      end else
      begin

        UniQueryDelete.Close;
        UniQueryDelete.SQL.Clear;
        if ImageX.Tag = 1 then
        begin
          UniQueryDelete.SQL.Add('Update ControllerInfo Set AlarmX = 0');
        end else
        begin
          UniQueryDelete.SQL.Add('Update ControllerInfo Set AlarmX = 1');
        end;
        UniQueryDelete.SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
        UniQueryDelete.Execute;
        ControllerAllSearch;
        MainRefresh;
        TabControl1.ActiveTab := TabItemMain;

      end;
    end else
    begin
      Showmessage('잘못된 비밀번호');
    end;
    RectanglePW.Visible := False;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.ButtonWifiNameClick(Sender: TObject);
const
  PermissionAccessFineLocation = 'android.permission.ACCESS_FINE_LOCATION';
var
{$IFDEF ANDROID}
  WifiManager: JWifiManager;
  WifiInfo: JWifiInfo;
{$ENDIF}
  I: Integer;
  WifiID : String;
begin
{$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissionAccessFineLocation],
  procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
  begin
  end);

  if PermissionsService.IsPermissionGranted(PermissionAccessFineLocation) then
  begin
    WifiManager := TJWifiManager.Wrap(
      (SharedActivity.getSystemService(TJContext.JavaClass.WIFI_SERVICE) as ILocalObject).GetObjectID);
    WifiInfo := WifiManager.getConnectionInfo;
    WifiID := JStringToString(WifiInfo.getSSID);
    Memo1.Lines.Add('Connected to: ' + WifiID);
//    EdtWifiID.Text := StringReplace(WifiID, '"', '', [rfReplaceAll, rfIgnoreCase]);
    EdtWifiID2.Text := StringReplace(WifiID, '"', '', [rfReplaceAll, rfIgnoreCase]);
    EdtWifiPW2.Text := '';
  end;
{$ENDIF}
end;

procedure TfDongHwa.ButtonWifiSetClick(Sender: TObject);
{$IFDEF ANDROID}
var
  Intent: JIntent;
{$ENDIF}
begin
{$IFDEF ANDROID}
  Intent := TJIntent.JavaClass.init(TJSettings.JavaClass.ACTION_WIFI_SETTINGS);
  Intent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
  TAndroidHelper.Context.startActivity(Intent);
{$ENDIF}
end;

procedure TfDongHwa.Chart1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin    Exit;
  if EventInfo.GestureID = igiZoom then
  begin
    Chart1.ScrollMouseButton := TMouseButton.mbRight;
    if not FirstDown then begin
//      Chart1.Axes.Left.Automatic := False;
//      Chart1.Axes.Left.Minimum := Chart1.Axes.Left.Minimum + ((EventInfo.Distance - FLastDistance) / Chart1.Axes.Left.Maximum);
//      Chart1.Axes.Left.Maximum := Chart1.Axes.Left.Maximum - ((EventInfo.Distance - FLastDistance) / Chart1.Axes.Left.Maximum);
      Chart1.Axes.Bottom.Minimum := Chart1.Axes.Bottom.Minimum + ((EventInfo.Distance - FLastDistance) / 500);
      Chart1.Axes.Bottom.Maximum := Chart1.Axes.Bottom.Maximum - ((EventInfo.Distance - FLastDistance) / 500);
    end;
//    EditGraphModel.Text := EventInfo.Distance.ToString + ' ' + FormatFloat('0.##',Chart1.Axes.Bottom.Minimum)
//    + ' ' + FormatFloat('0.##',Chart1.Axes.Bottom.Maximum);
    FLastDistance := EventInfo.Distance;
    FirstDown := False;
  end else if EventInfo.GestureID = igiPan then
  begin
    Chart1.ScrollMouseButton := TMouseButton.mbLeft;
  end;
end;

procedure TfDongHwa.Chart1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  tmp : Integer;

  i: Integer;
  Value: Double;
begin
  for i := Series1.FirstValueIndex to Series1.LastValueIndex do begin
    if Series1.CalcXPos(i) > Round(X) then begin
      tmp := i;
      break;
    end;
  end;

  if tmp <> Current then
  begin
    Current := tmp;
    Series1.Repaint;
  end;

  FirstDown := True;
end;

procedure TfDongHwa.CheckBoxPasswordChange(Sender: TObject);
begin
  EditPW.Password := not CheckBoxPassword.IsChecked;
end;

procedure TfDongHwa.ControllerAllSearch;
begin
  try
    if UniConnection1.Connected then
    begin
      ControllerAllSearchCount := 0;
      with UniQueryAllSearch do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select (Count(T.No)) as C FROM TempState as T Inner Join ControllerInfo as C');
        SQL.Add('On C.SerialNo = T.SerialNo Where C.MasterID = '+MasterUserID.ToString);
        Open;
        ControllerCount := Ceil(FieldByName('C').AsInteger / 12) ; // 240823 김동휘 수정
        if ControllerCount < 1 then ControllerCount := 1;
        Page := 1;
        TextMainBottom.Text := Page.ToString + ' / ' + ControllerCount.ToString;
      end;
    end else
    begin
      UniConnection1.Connected := True;
      TimerControllerAllSearch.Enabled := True;
    end;
  except on e:exception do
    begin
     // Memo1.Lines.Add('ControllerAllSearch : '+e.Message);
      TimerControllerAllSearch.Enabled := True;
    end;
  end;
end;

procedure TfDongHwa.DateEditGraph1Change(Sender: TObject);
begin
      if DateEditGraph1.Date > Now then
       DateEditGraph1.Date := Now; // 현재 날짜로 변경
end;

procedure TfDongHwa.DateEditGraph2Change(Sender: TObject);
begin
    if DateEditGraph2.Date > Now then
       DateEditGraph2.Date := Now; // 현재 날짜로 변경
end;

procedure TfDongHwa.DetailRectangleClick(Sender: TObject);
var
  SenderTag : Integer;
  DetailInCount, DetailOutCount : Integer;
  SaveTimeK : Array[0..5] of Currency;
   FirstK1, FirstK2, FirstK3, FirstK4, FirstK5 : Boolean;
//  TEST,TEST2 : STRING;
begin
  try
//    TEST  := (Sender as TRectangle).Hint;
//    TEST2 := (Sender as TRectangle).Name;
    if (Sender as TRectangle).Hint <> '' then exit;

    if not MasterCheck then Exit;

    if MainSetChangeState  then Exit;

    RectangleModelDetail.Visible := False;

    SenderTag := (Sender as TRectangle).Tag;

    if DetailAlarm[SenderTag] then
    begin
      ImageDetailAlarm.Tag := 1;
      ImageDetailAlarm.MultiResBitmap := ImageAlarmOn.MultiResBitmap;
    end else
    begin
      ImageDetailAlarm.Tag := 0;
      ImageDetailAlarm.MultiResBitmap := ImageAlarmOff.MultiResBitmap;
    end;

    if SenderTag = 1 then
    begin
      TextDetailTitle.Text :=    TextMain1Name.Text;
     // TextEditDetailName.Text := TextMain1Name.Text;
      EditDetailName.Text := TextMain1Name.Text;
      EditDetailName.TextPrompt := TextMain1Name.Text;

      TextEditDetailTemp.Text := TextMain1TempL.Text;
      EditDetailTemp.Text := TextMain1TempL.Text;
      EditDetailTemp.TextPrompt := TextMain1TempL.Text;

      TextEditDetailSetTemp.Text := TextMain1SetTempL.Text;
      EditDetailSetTemp.Text := TextMain1SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain1SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[1]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[1]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[1]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[1]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[1]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[1]);

      TextEditDetailIn1.Text := TextMain1RTopC1.Text;
      EditDetailIn1.Text := TextMain1RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain1RTopC1.Text;

      TextEditDetailIn2.Text := TextMain1RTopC2.Text;
      EditDetailIn2.Text := TextMain1RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain1RTopC2.Text;

      TextEditDetailIn3.Text := TextMain1RTopC3.Text;
      EditDetailIn3.Text := TextMain1RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain1RTopC3.Text;

      TextEditDetailIn4.Text := TextMain1RTopC4.Text;
      EditDetailIn4.Text := TextMain1RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain1RTopC4.Text;

      TextEditDetailIn5.Text := TextMain1RTopC5.Text;
      EditDetailIn5.Text := TextMain1RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain1RTopC5.Text;

      TextEditDetailOut1.Text := TextMain1RClientC1.Text;
      EditDetailOut1.Text := TextMain1RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain1RClientC1.Text;

      TextEditDetailOut2.Text := TextMain1RClientC2.Text;
      EditDetailOut2.Text := TextMain1RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain1RClientC2.Text;

      TextEditDetailOut3.Text := TextMain1RClientC3.Text;
      EditDetailOut3.Text := TextMain1RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain1RClientC3.Text;

      TextEditDetailOut4.Text := TextMain1RClientC4.Text;
      EditDetailOut4.Text := TextMain1RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain1RClientC4.Text;

      TextEditDetailOut5.Text := TextMain1RClientC5.Text;
      EditDetailOut5.Text := TextMain1RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain1RClientC5.Text;

      TextDetailModel.Text := TextMain1Model.Text;

      TextDetailTemp.Text := TextMain1Temp.Text;

      TextDetailSetTemp.Text := TextMain1SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[1];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[1];
      DetailInCount := PreMain1InCount;
      DetailOutCount := PreMain1OutCount;

      LayoutDetailOut1.Align := LayoutMain1RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain1RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain1RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain1RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain1RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain1RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain1RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain1RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain1RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain1RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain1RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain1RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain1RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain1RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain1RClientC5.Fill.Color;

    end else if SenderTag = 2 then
    begin
     TextDetailTitle.Text :=    TextMain2Name.Text;
   //   TextEditDetailName.Text := TextMain2Name.Text;
      EditDetailName.Text := TextMain2Name.Text;
      EditDetailName.TextPrompt := TextMain2Name.Text;

      TextEditDetailTemp.Text := TextMain2TempL.Text;
      EditDetailTemp.Text := TextMain2TempL.Text;
      EditDetailTemp.TextPrompt := TextMain2TempL.Text;

      TextEditDetailSetTemp.Text := TextMain2SetTempL.Text;
      EditDetailSetTemp.Text := TextMain2SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain2SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[2]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[2]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[2]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[2]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[2]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[2]);

      TextEditDetailIn1.Text := TextMain2RTopC1.Text;
      EditDetailIn1.Text := TextMain2RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain2RTopC1.Text;

      TextEditDetailIn2.Text := TextMain2RTopC2.Text;
      EditDetailIn2.Text := TextMain2RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain2RTopC2.Text;

      TextEditDetailIn3.Text := TextMain2RTopC3.Text;
      EditDetailIn3.Text := TextMain2RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain2RTopC3.Text;

      TextEditDetailIn4.Text := TextMain2RTopC4.Text;
      EditDetailIn4.Text := TextMain2RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain2RTopC4.Text;

      TextEditDetailIn5.Text := TextMain2RTopC5.Text;
      EditDetailIn5.Text := TextMain2RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain2RTopC5.Text;

      TextEditDetailOut1.Text := TextMain2RClientC1.Text;
      EditDetailOut1.Text := TextMain2RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain2RClientC1.Text;

      TextEditDetailOut2.Text := TextMain2RClientC2.Text;
      EditDetailOut2.Text := TextMain2RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain2RClientC2.Text;

      TextEditDetailOut3.Text := TextMain2RClientC3.Text;
      EditDetailOut3.Text := TextMain2RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain2RClientC3.Text;

      TextEditDetailOut4.Text := TextMain2RClientC4.Text;
      EditDetailOut4.Text := TextMain2RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain2RClientC4.Text;

      TextEditDetailOut5.Text := TextMain2RClientC5.Text;
      EditDetailOut5.Text := TextMain2RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain2RClientC5.Text;

      TextDetailModel.Text := TextMain2Model.Text;

      TextDetailTemp.Text := TextMain2Temp.Text;

      TextDetailSetTemp.Text := TextMain2SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[2];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[2];
      DetailInCount := PreMain2InCount;
      DetailOutCount := PreMain2OutCount;

      LayoutDetailOut1.Align := LayoutMain2RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain2RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain2RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain2RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain2RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain2RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain2RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain2RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain2RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain2RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain2RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain2RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain2RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain2RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain2RClientC5.Fill.Color;
    end
    else
    if SenderTag = 3 then
    begin
     TextDetailTitle.Text :=    TextMain3Name.Text;
    //  TextEditDetailName.Text := TextMain3Name.Text;
      EditDetailName.Text := TextMain3Name.Text;
      EditDetailName.TextPrompt := TextMain3Name.Text;

      TextEditDetailTemp.Text := TextMain3TempL.Text;
      EditDetailTemp.Text := TextMain3TempL.Text;
      EditDetailTemp.TextPrompt := TextMain3TempL.Text;

      TextEditDetailSetTemp.Text := TextMain3SetTempL.Text;
      EditDetailSetTemp.Text := TextMain3SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain3SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[3]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[3]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[3]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[3]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[3]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[3]);

      TextEditDetailIn1.Text := TextMain3RTopC1.Text;
      EditDetailIn1.Text := TextMain3RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain3RTopC1.Text;

      TextEditDetailIn2.Text := TextMain3RTopC2.Text;
      EditDetailIn2.Text := TextMain3RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain3RTopC2.Text;

      TextEditDetailIn3.Text := TextMain3RTopC3.Text;
      EditDetailIn3.Text := TextMain3RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain3RTopC3.Text;

      TextEditDetailIn4.Text := TextMain3RTopC4.Text;
      EditDetailIn4.Text := TextMain3RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain3RTopC4.Text;

      TextEditDetailIn5.Text := TextMain3RTopC5.Text;
      EditDetailIn5.Text := TextMain3RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain3RTopC5.Text;

      TextEditDetailOut1.Text := TextMain3RClientC1.Text;
      EditDetailOut1.Text := TextMain3RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain3RClientC1.Text;

      TextEditDetailOut2.Text := TextMain3RClientC2.Text;
      EditDetailOut2.Text := TextMain3RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain3RClientC2.Text;

      TextEditDetailOut3.Text := TextMain3RClientC3.Text;
      EditDetailOut3.Text := TextMain3RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain3RClientC3.Text;

      TextEditDetailOut4.Text := TextMain3RClientC4.Text;
      EditDetailOut4.Text := TextMain3RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain3RClientC4.Text;

      TextEditDetailOut5.Text := TextMain3RClientC5.Text;
      EditDetailOut5.Text := TextMain3RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain3RClientC5.Text;

      TextDetailModel.Text := TextMain3Model.Text;

      TextDetailTemp.Text := TextMain3Temp.Text;

      TextDetailSetTemp.Text := TextMain3SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[3];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[3];
      DetailInCount := PreMain3InCount;
      DetailOutCount := PreMain3OutCount;

      LayoutDetailOut1.Align := LayoutMain3RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain3RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain3RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain3RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain3RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain3RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain3RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain3RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain3RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain3RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain3RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain3RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain3RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain3RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain3RClientC5.Fill.Color;
    end
    else
    if SenderTag = 4 then
    begin
     TextDetailTitle.Text :=    TextMain4Name.Text;
   //   TextEditDetailName.Text := TextMain4Name.Text;
      EditDetailName.Text := TextMain4Name.Text;
      EditDetailName.TextPrompt := TextMain4Name.Text;

      TextEditDetailTemp.Text := TextMain4TempL.Text;
      EditDetailTemp.Text := TextMain4TempL.Text;
      EditDetailTemp.TextPrompt := TextMain4TempL.Text;

      TextEditDetailSetTemp.Text := TextMain4SetTempL.Text;
      EditDetailSetTemp.Text := TextMain4SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain4SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[4]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[4]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[4]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[4]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[4]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[4]);

      TextEditDetailIn1.Text := TextMain4RTopC1.Text;
      EditDetailIn1.Text := TextMain4RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain4RTopC1.Text;

      TextEditDetailIn2.Text := TextMain4RTopC2.Text;
      EditDetailIn2.Text := TextMain4RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain4RTopC2.Text;

      TextEditDetailIn3.Text := TextMain4RTopC3.Text;
      EditDetailIn3.Text := TextMain4RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain4RTopC3.Text;

      TextEditDetailIn4.Text := TextMain4RTopC4.Text;
      EditDetailIn4.Text := TextMain4RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain4RTopC4.Text;

      TextEditDetailIn5.Text := TextMain4RTopC5.Text;
      EditDetailIn5.Text := TextMain4RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain4RTopC5.Text;

      TextEditDetailOut1.Text := TextMain4RClientC1.Text;
      EditDetailOut1.Text := TextMain4RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain4RClientC1.Text;

      TextEditDetailOut2.Text := TextMain4RClientC2.Text;
      EditDetailOut2.Text := TextMain4RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain4RClientC2.Text;

      TextEditDetailOut3.Text := TextMain4RClientC3.Text;
      EditDetailOut3.Text := TextMain4RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain4RClientC3.Text;

      TextEditDetailOut4.Text := TextMain4RClientC4.Text;
      EditDetailOut4.Text := TextMain4RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain4RClientC4.Text;

      TextEditDetailOut5.Text := TextMain4RClientC5.Text;
      EditDetailOut5.Text := TextMain4RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain4RClientC5.Text;

      TextDetailModel.Text := TextMain4Model.Text;

      TextDetailTemp.Text := TextMain4Temp.Text;

      TextDetailSetTemp.Text := TextMain4SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[4];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[4];
      DetailInCount := PreMain4InCount;
      DetailOutCount := PreMain4OutCount;

      LayoutDetailOut1.Align := LayoutMain4RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain4RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain4RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain4RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain4RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain4RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain4RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain4RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain4RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain4RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain4RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain4RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain4RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain4RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain4RClientC5.Fill.Color;
    end
     else
    if SenderTag = 5 then
    begin
     TextDetailTitle.Text :=    TextMain5Name.Text;
      //TextEditDetailName.Text := TextMain5Name.Text;
      EditDetailName.Text := TextMain5Name.Text;
      EditDetailName.TextPrompt := TextMain5Name.Text;

      TextEditDetailTemp.Text := TextMain5TempL.Text;
      EditDetailTemp.Text := TextMain5TempL.Text;
      EditDetailTemp.TextPrompt := TextMain5TempL.Text;

      TextEditDetailSetTemp.Text := TextMain5SetTempL.Text;
      EditDetailSetTemp.Text := TextMain5SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain5SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[5]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[5]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[5]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[5]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[5]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[5]);

      TextEditDetailIn1.Text := TextMain5RTopC1.Text;
      EditDetailIn1.Text := TextMain5RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain5RTopC1.Text;

      TextEditDetailIn2.Text := TextMain5RTopC2.Text;
      EditDetailIn2.Text := TextMain5RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain5RTopC2.Text;

      TextEditDetailIn3.Text := TextMain5RTopC3.Text;
      EditDetailIn3.Text := TextMain5RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain5RTopC3.Text;

      TextEditDetailIn4.Text := TextMain5RTopC4.Text;
      EditDetailIn4.Text := TextMain5RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain5RTopC4.Text;

      TextEditDetailIn5.Text := TextMain5RTopC5.Text;
      EditDetailIn5.Text := TextMain5RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain5RTopC5.Text;

      TextEditDetailOut1.Text := TextMain5RClientC1.Text;
      EditDetailOut1.Text := TextMain5RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain5RClientC1.Text;

      TextEditDetailOut2.Text := TextMain5RClientC2.Text;
      EditDetailOut2.Text := TextMain5RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain5RClientC2.Text;

      TextEditDetailOut3.Text := TextMain5RClientC3.Text;
      EditDetailOut3.Text := TextMain5RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain5RClientC3.Text;

      TextEditDetailOut4.Text := TextMain5RClientC4.Text;
      EditDetailOut4.Text := TextMain5RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain5RClientC4.Text;

      TextEditDetailOut5.Text := TextMain5RClientC5.Text;
      EditDetailOut5.Text := TextMain5RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain5RClientC5.Text;

      TextDetailModel.Text := TextMain5Model.Text;

      TextDetailTemp.Text := TextMain5Temp.Text;

      TextDetailSetTemp.Text := TextMain5SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[5];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[5];
      DetailInCount := PreMain5InCount;
      DetailOutCount := PreMain5OutCount;

      LayoutDetailOut1.Align := LayoutMain5RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain5RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain5RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain5RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain5RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain5RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain5RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain5RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain5RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain5RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain5RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain5RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain5RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain5RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain5RClientC5.Fill.Color;
    end
     else
    if SenderTag = 6 then
    begin
     TextDetailTitle.Text :=    TextMain6Name.Text;
   //   TextEditDetailName.Text := TextMain6Name.Text;
      EditDetailName.Text := TextMain6Name.Text;
      EditDetailName.TextPrompt := TextMain6Name.Text;

      TextEditDetailTemp.Text := TextMain6TempL.Text;
      EditDetailTemp.Text := TextMain6TempL.Text;
      EditDetailTemp.TextPrompt := TextMain6TempL.Text;

      TextEditDetailSetTemp.Text := TextMain6SetTempL.Text;
      EditDetailSetTemp.Text := TextMain6SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain6SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[6]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[6]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[6]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[6]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[6]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[6]);

      TextEditDetailIn1.Text := TextMain6RTopC1.Text;
      EditDetailIn1.Text := TextMain6RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain6RTopC1.Text;

      TextEditDetailIn2.Text := TextMain6RTopC2.Text;
      EditDetailIn2.Text := TextMain6RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain6RTopC2.Text;

      TextEditDetailIn3.Text := TextMain6RTopC3.Text;
      EditDetailIn3.Text := TextMain6RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain6RTopC3.Text;

      TextEditDetailIn4.Text := TextMain6RTopC4.Text;
      EditDetailIn4.Text := TextMain6RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain6RTopC4.Text;

      TextEditDetailIn5.Text := TextMain6RTopC5.Text;
      EditDetailIn5.Text := TextMain6RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain6RTopC5.Text;

      TextEditDetailOut1.Text := TextMain6RClientC1.Text;
      EditDetailOut1.Text := TextMain6RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain6RClientC1.Text;

      TextEditDetailOut2.Text := TextMain6RClientC2.Text;
      EditDetailOut2.Text := TextMain6RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain6RClientC2.Text;

      TextEditDetailOut3.Text := TextMain6RClientC3.Text;
      EditDetailOut3.Text := TextMain6RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain6RClientC3.Text;

      TextEditDetailOut4.Text := TextMain6RClientC4.Text;
      EditDetailOut4.Text := TextMain6RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain6RClientC4.Text;

      TextEditDetailOut5.Text := TextMain6RClientC5.Text;
      EditDetailOut5.Text := TextMain6RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain6RClientC5.Text;

      TextDetailModel.Text := TextMain6Model.Text;

      TextDetailTemp.Text := TextMain6Temp.Text;

      TextDetailSetTemp.Text := TextMain6SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[6];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[6];
      DetailInCount := PreMain6InCount;
      DetailOutCount := PreMain6OutCount;

      LayoutDetailOut1.Align := LayoutMain6RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain6RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain6RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain6RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain6RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain6RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain6RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain6RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain6RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain6RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain6RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain6RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain6RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain6RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain6RClientC5.Fill.Color;
    end
     else
    if SenderTag = 7 then
    begin
       TextDetailTitle.Text :=    TextMain7Name.Text;

     // TextEditDetailName.Text := TextMain7Name.Text;
      EditDetailName.Text := TextMain7Name.Text;
      EditDetailName.TextPrompt := TextMain7Name.Text;

      TextEditDetailTemp.Text := TextMain7TempL.Text;
      EditDetailTemp.Text := TextMain7TempL.Text;
      EditDetailTemp.TextPrompt := TextMain7TempL.Text;

      TextEditDetailSetTemp.Text := TextMain7SetTempL.Text;
      EditDetailSetTemp.Text := TextMain7SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain7SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[7]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[7]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[7]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[7]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[7]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[7]);

      TextEditDetailIn1.Text := TextMain7RTopC1.Text;
      EditDetailIn1.Text := TextMain7RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain7RTopC1.Text;

      TextEditDetailIn2.Text := TextMain7RTopC2.Text;
      EditDetailIn2.Text := TextMain7RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain7RTopC2.Text;

      TextEditDetailIn3.Text := TextMain7RTopC3.Text;
      EditDetailIn3.Text := TextMain7RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain7RTopC3.Text;

      TextEditDetailIn4.Text := TextMain7RTopC4.Text;
      EditDetailIn4.Text := TextMain7RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain7RTopC4.Text;

      TextEditDetailIn5.Text := TextMain7RTopC5.Text;
      EditDetailIn5.Text := TextMain7RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain7RTopC5.Text;

      TextEditDetailOut1.Text := TextMain7RClientC1.Text;
      EditDetailOut1.Text := TextMain7RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain7RClientC1.Text;

      TextEditDetailOut2.Text := TextMain7RClientC2.Text;
      EditDetailOut2.Text := TextMain7RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain7RClientC2.Text;

      TextEditDetailOut3.Text := TextMain7RClientC3.Text;
      EditDetailOut3.Text := TextMain7RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain7RClientC3.Text;

      TextEditDetailOut4.Text := TextMain7RClientC4.Text;
      EditDetailOut4.Text := TextMain7RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain7RClientC4.Text;

      TextEditDetailOut5.Text := TextMain7RClientC5.Text;
      EditDetailOut5.Text := TextMain7RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain7RClientC5.Text;

      TextDetailModel.Text := TextMain7Model.Text;

      TextDetailTemp.Text := TextMain7Temp.Text;

      TextDetailSetTemp.Text := TextMain7SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[7];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[7];
      DetailInCount := PreMain7InCount;
      DetailOutCount := PreMain7OutCount;

      LayoutDetailOut1.Align := LayoutMain7RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain7RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain7RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain7RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain7RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain7RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain7RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain7RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain7RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain7RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain7RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain7RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain7RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain7RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain7RClientC5.Fill.Color;
    end
     else
    if SenderTag = 8 then
    begin

     TextDetailTitle.Text :=    TextMain8Name.Text;
    //  TextEditDetailName.Text := TextMain8Name.Text;
      EditDetailName.Text := TextMain8Name.Text;
      EditDetailName.TextPrompt := TextMain8Name.Text;

      TextEditDetailTemp.Text := TextMain8TempL.Text;
      EditDetailTemp.Text := TextMain8TempL.Text;
      EditDetailTemp.TextPrompt := TextMain8TempL.Text;

      TextEditDetailSetTemp.Text := TextMain8SetTempL.Text;
      EditDetailSetTemp.Text := TextMain8SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain8SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[8]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[8]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[8]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[8]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[8]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[8]);

      TextEditDetailIn1.Text := TextMain8RTopC1.Text;
      EditDetailIn1.Text := TextMain8RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain8RTopC1.Text;

      TextEditDetailIn2.Text := TextMain8RTopC2.Text;
      EditDetailIn2.Text := TextMain8RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain8RTopC2.Text;

      TextEditDetailIn3.Text := TextMain8RTopC3.Text;
      EditDetailIn3.Text := TextMain8RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain8RTopC3.Text;

      TextEditDetailIn4.Text := TextMain8RTopC4.Text;
      EditDetailIn4.Text := TextMain8RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain8RTopC4.Text;

      TextEditDetailIn5.Text := TextMain8RTopC5.Text;
      EditDetailIn5.Text := TextMain8RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain8RTopC5.Text;

      TextEditDetailOut1.Text := TextMain8RClientC1.Text;
      EditDetailOut1.Text := TextMain8RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain8RClientC1.Text;

      TextEditDetailOut2.Text := TextMain8RClientC2.Text;
      EditDetailOut2.Text := TextMain8RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain8RClientC2.Text;

      TextEditDetailOut3.Text := TextMain8RClientC3.Text;
      EditDetailOut3.Text := TextMain8RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain8RClientC3.Text;

      TextEditDetailOut4.Text := TextMain8RClientC4.Text;
      EditDetailOut4.Text := TextMain8RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain8RClientC4.Text;

      TextEditDetailOut5.Text := TextMain8RClientC5.Text;
      EditDetailOut5.Text := TextMain8RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain8RClientC5.Text;

      TextDetailModel.Text := TextMain8Model.Text;

      TextDetailTemp.Text := TextMain8Temp.Text;

      TextDetailSetTemp.Text := TextMain8SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[8];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[8];
      DetailInCount := PreMain8InCount;
      DetailOutCount := PreMain8OutCount;

      LayoutDetailOut1.Align := LayoutMain8RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain8RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain8RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain8RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain8RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain8RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain8RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain8RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain8RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain8RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain8RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain8RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain8RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain8RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain8RClientC5.Fill.Color;
    end
     else
    if SenderTag = 9 then
    begin
     TextDetailTitle.Text :=    TextMain9Name.Text;

     // TextEditDetailName.Text := TextMain9Name.Text;
      EditDetailName.Text := TextMain9Name.Text;
      EditDetailName.TextPrompt := TextMain9Name.Text;

      TextEditDetailTemp.Text := TextMain9TempL.Text;
      EditDetailTemp.Text := TextMain9TempL.Text;
      EditDetailTemp.TextPrompt := TextMain9TempL.Text;

      TextEditDetailSetTemp.Text := TextMain9SetTempL.Text;
      EditDetailSetTemp.Text := TextMain9SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain9SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[9]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[9]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[9]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[9]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[9]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[9]);

      TextEditDetailIn1.Text := TextMain9RTopC1.Text;
      EditDetailIn1.Text := TextMain9RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain9RTopC1.Text;

      TextEditDetailIn2.Text := TextMain9RTopC2.Text;
      EditDetailIn2.Text := TextMain9RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain9RTopC2.Text;

      TextEditDetailIn3.Text := TextMain9RTopC3.Text;
      EditDetailIn3.Text := TextMain9RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain9RTopC3.Text;

      TextEditDetailIn4.Text := TextMain9RTopC4.Text;
      EditDetailIn4.Text := TextMain9RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain9RTopC4.Text;

      TextEditDetailIn5.Text := TextMain9RTopC5.Text;
      EditDetailIn5.Text := TextMain9RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain9RTopC5.Text;

      TextEditDetailOut1.Text := TextMain9RClientC1.Text;
      EditDetailOut1.Text := TextMain9RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain9RClientC1.Text;

      TextEditDetailOut2.Text := TextMain9RClientC2.Text;
      EditDetailOut2.Text := TextMain9RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain9RClientC2.Text;

      TextEditDetailOut3.Text := TextMain9RClientC3.Text;
      EditDetailOut3.Text := TextMain9RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain9RClientC3.Text;

      TextEditDetailOut4.Text := TextMain9RClientC4.Text;
      EditDetailOut4.Text := TextMain9RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain9RClientC4.Text;

      TextEditDetailOut5.Text := TextMain9RClientC5.Text;
      EditDetailOut5.Text := TextMain9RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain9RClientC5.Text;

      TextDetailModel.Text := TextMain9Model.Text;

      TextDetailTemp.Text := TextMain9Temp.Text;

      TextDetailSetTemp.Text := TextMain9SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[9];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[9];
      DetailInCount := PreMain9InCount;
      DetailOutCount := PreMain9OutCount;

      LayoutDetailOut1.Align := LayoutMain9RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain9RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain9RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain9RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain9RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain9RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain9RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain9RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain9RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain9RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain9RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain9RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain9RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain9RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain9RClientC5.Fill.Color;
    end
     else
    if SenderTag = 10 then
    begin
       TextDetailTitle.Text :=    TextMain10Name.Text;
   //   TextEditDetailName.Text := TextMain10Name.Text;
      EditDetailName.Text := TextMain10Name.Text;
      EditDetailName.TextPrompt := TextMain10Name.Text;

      TextEditDetailTemp.Text := TextMain10TempL.Text;
      EditDetailTemp.Text := TextMain10TempL.Text;
      EditDetailTemp.TextPrompt := TextMain10TempL.Text;

      TextEditDetailSetTemp.Text := TextMain10SetTempL.Text;
      EditDetailSetTemp.Text := TextMain10SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain10SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[10]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[10]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[10]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[10]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[10]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[10]);

      TextEditDetailIn1.Text := TextMain10RTopC1.Text;
      EditDetailIn1.Text := TextMain10RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain10RTopC1.Text;

      TextEditDetailIn2.Text := TextMain10RTopC2.Text;
      EditDetailIn2.Text := TextMain10RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain10RTopC2.Text;

      TextEditDetailIn3.Text := TextMain10RTopC3.Text;
      EditDetailIn3.Text := TextMain10RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain10RTopC3.Text;

      TextEditDetailIn4.Text := TextMain10RTopC4.Text;
      EditDetailIn4.Text := TextMain10RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain10RTopC4.Text;

      TextEditDetailIn5.Text := TextMain10RTopC5.Text;
      EditDetailIn5.Text := TextMain10RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain10RTopC5.Text;

      TextEditDetailOut1.Text := TextMain10RClientC1.Text;
      EditDetailOut1.Text := TextMain10RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain10RClientC1.Text;

      TextEditDetailOut2.Text := TextMain10RClientC2.Text;
      EditDetailOut2.Text := TextMain10RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain10RClientC2.Text;

      TextEditDetailOut3.Text := TextMain10RClientC3.Text;
      EditDetailOut3.Text := TextMain10RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain10RClientC3.Text;

      TextEditDetailOut4.Text := TextMain10RClientC4.Text;
      EditDetailOut4.Text := TextMain10RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain10RClientC4.Text;

      TextEditDetailOut5.Text := TextMain10RClientC5.Text;
      EditDetailOut5.Text := TextMain10RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain10RClientC5.Text;

      TextDetailModel.Text := TextMain10Model.Text;

      TextDetailTemp.Text := TextMain10Temp.Text;

      TextDetailSetTemp.Text := TextMain10SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[10];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[10];
      DetailInCount := PreMain10InCount;
      DetailOutCount := PreMain10OutCount;

      LayoutDetailOut1.Align := LayoutMain10RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain10RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain10RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain10RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain10RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain10RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain10RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain10RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain10RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain10RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain10RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain10RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain10RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain10RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain10RClientC5.Fill.Color;
    end
     else
    if SenderTag = 11 then
    begin
      TextDetailTitle.Text :=    TextMain11Name.Text;

     // TextEditDetailName.Text := TextMain11Name.Text;
      EditDetailName.Text := TextMain11Name.Text;
      EditDetailName.TextPrompt := TextMain11Name.Text;

      TextEditDetailTemp.Text := TextMain11TempL.Text;
      EditDetailTemp.Text := TextMain11TempL.Text;
      EditDetailTemp.TextPrompt := TextMain11TempL.Text;

      TextEditDetailSetTemp.Text := TextMain11SetTempL.Text;
      EditDetailSetTemp.Text := TextMain11SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain11SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[11]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[11]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[11]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[11]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[11]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[11]);

      TextEditDetailIn1.Text := TextMain11RTopC1.Text;
      EditDetailIn1.Text := TextMain11RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain11RTopC1.Text;

      TextEditDetailIn2.Text := TextMain11RTopC2.Text;
      EditDetailIn2.Text := TextMain11RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain11RTopC2.Text;

      TextEditDetailIn3.Text := TextMain11RTopC3.Text;
      EditDetailIn3.Text := TextMain11RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain11RTopC3.Text;

      TextEditDetailIn4.Text := TextMain11RTopC4.Text;
      EditDetailIn4.Text := TextMain11RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain11RTopC4.Text;

      TextEditDetailIn5.Text := TextMain11RTopC5.Text;
      EditDetailIn5.Text := TextMain11RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain11RTopC5.Text;

      TextEditDetailOut1.Text := TextMain11RClientC1.Text;
      EditDetailOut1.Text := TextMain11RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain11RClientC1.Text;

      TextEditDetailOut2.Text := TextMain11RClientC2.Text;
      EditDetailOut2.Text := TextMain11RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain11RClientC2.Text;

      TextEditDetailOut3.Text := TextMain11RClientC3.Text;
      EditDetailOut3.Text := TextMain11RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain11RClientC3.Text;

      TextEditDetailOut4.Text := TextMain11RClientC4.Text;
      EditDetailOut4.Text := TextMain11RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain11RClientC4.Text;

      TextEditDetailOut5.Text := TextMain11RClientC5.Text;
      EditDetailOut5.Text := TextMain11RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain11RClientC5.Text;

      TextDetailModel.Text := TextMain11Model.Text;

      TextDetailTemp.Text := TextMain11Temp.Text;

      TextDetailSetTemp.Text := TextMain11SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[11];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[11];
      DetailInCount := PreMain11InCount;
      DetailOutCount := PreMain11OutCount;

      LayoutDetailOut1.Align := LayoutMain11RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain11RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain11RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain11RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain11RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain11RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain11RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain11RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain11RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain11RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain11RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain11RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain11RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain11RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain11RClientC5.Fill.Color;
    end
     else
    if SenderTag = 12 then
    begin
   //   TextEditDetailName.Text := TextMain12Name.Text;

      TextDetailTitle.Text :=    TextMain12Name.Text;

      EditDetailName.Text := TextMain12Name.Text;
      EditDetailName.TextPrompt := TextMain12Name.Text;

      TextEditDetailTemp.Text := TextMain12TempL.Text;
      EditDetailTemp.Text := TextMain12TempL.Text;
      EditDetailTemp.TextPrompt := TextMain12TempL.Text;

      TextEditDetailSetTemp.Text := TextMain12SetTempL.Text;
      EditDetailSetTemp.Text := TextMain12SetTempL.Text;
      EditDetailSetTemp.TextPrompt := TextMain12SetTempL.Text;

      TextEditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[12]) + '℃';
      EditDetailHigh.Text := FormatFloat('#,0.0',ControllerHighTemp[12]);
      EditDetailHigh.TextPrompt := FormatFloat('#,0.0',ControllerHighTemp[12]);
      TextEditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[12]) + '℃';
      EditDetailLow.Text := FormatFloat('#,0.0',ControllerLowTemp[12]);
      EditDetailLow.TextPrompt := FormatFloat('#,0.0',ControllerLowTemp[12]);

      TextEditDetailIn1.Text := TextMain12RTopC1.Text;
      EditDetailIn1.Text := TextMain12RTopC1.Text;
      EditDetailIn1.TextPrompt := TextMain12RTopC1.Text;

      TextEditDetailIn2.Text := TextMain12RTopC2.Text;
      EditDetailIn2.Text := TextMain12RTopC2.Text;
      EditDetailIn2.TextPrompt := TextMain12RTopC2.Text;

      TextEditDetailIn3.Text := TextMain12RTopC3.Text;
      EditDetailIn3.Text := TextMain12RTopC3.Text;
      EditDetailIn3.TextPrompt := TextMain12RTopC3.Text;

      TextEditDetailIn4.Text := TextMain12RTopC4.Text;
      EditDetailIn4.Text := TextMain12RTopC4.Text;
      EditDetailIn4.TextPrompt := TextMain12RTopC4.Text;

      TextEditDetailIn5.Text := TextMain12RTopC5.Text;
      EditDetailIn5.Text := TextMain12RTopC5.Text;
      EditDetailIn5.TextPrompt := TextMain12RTopC5.Text;

      TextEditDetailOut1.Text := TextMain12RClientC1.Text;
      EditDetailOut1.Text := TextMain12RClientC1.Text;
      EditDetailOut1.TextPrompt := TextMain12RClientC1.Text;

      TextEditDetailOut2.Text := TextMain12RClientC2.Text;
      EditDetailOut2.Text := TextMain12RClientC2.Text;
      EditDetailOut2.TextPrompt := TextMain12RClientC2.Text;

      TextEditDetailOut3.Text := TextMain12RClientC3.Text;
      EditDetailOut3.Text := TextMain12RClientC3.Text;
      EditDetailOut3.TextPrompt := TextMain12RClientC3.Text;

      TextEditDetailOut4.Text := TextMain12RClientC4.Text;
      EditDetailOut4.Text := TextMain12RClientC4.Text;
      EditDetailOut4.TextPrompt := TextMain12RClientC4.Text;

      TextEditDetailOut5.Text := TextMain12RClientC5.Text;
      EditDetailOut5.Text := TextMain12RClientC5.Text;
      EditDetailOut5.TextPrompt := TextMain12RClientC5.Text;

      TextDetailModel.Text := TextMain12Model.Text;

      TextDetailTemp.Text := TextMain12Temp.Text;

      TextDetailSetTemp.Text := TextMain12SetTemp.Hint;
      DetailSetTempStr := TextDetailSetTemp.Text;
      DetailSetTemp := SetTemp[12];
      TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
      TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
      DetailControllerID := ControllerID[12];
      DetailInCount := PreMain12InCount;
      DetailOutCount := PreMain12OutCount;

      LayoutDetailOut1.Align := LayoutMain12RClientC1.Align;
      LayoutDetailOut2.Align := LayoutMain12RClientC2.Align;
      LayoutDetailOut3.Align := LayoutMain12RClientC3.Align;
      LayoutDetailOut4.Align := LayoutMain12RClientC4.Align;
      LayoutDetailOut5.Align := LayoutMain12RClientC5.Align;

      CircleDetailIn1.Fill.Color := CircleMain12RTopC1.Fill.Color;
      CircleDetailIn2.Fill.Color := CircleMain12RTopC2.Fill.Color;
      CircleDetailIn3.Fill.Color := CircleMain12RTopC3.Fill.Color;
      CircleDetailIn4.Fill.Color := CircleMain12RTopC4.Fill.Color;
      CircleDetailIn5.Fill.Color := CircleMain12RTopC5.Fill.Color;

      CircleDetailOut1.Fill.Color := CircleMain12RClientC1.Fill.Color;
      CircleDetailOut2.Fill.Color := CircleMain12RClientC2.Fill.Color;
      CircleDetailOut3.Fill.Color := CircleMain12RClientC3.Fill.Color;
      CircleDetailOut4.Fill.Color := CircleMain12RClientC4.Fill.Color;
      CircleDetailOut5.Fill.Color := CircleMain12RClientC5.Fill.Color;
    end
    else
    begin
      Exit;
    end;

//    TextDefrost.TextSettings.FontColor := $FFFF0000;
//    RectangleDefrost.Fill.Color := $FFFFFFFF;
    //제상버튼추가
    if (TextDetailModel.Text = 'WT2023C')
     or (TextDetailModel.Text = 'W1120DC2S')
     or (TextDetailModel.Text = 'WK2023C')
      or (TextDetailModel.Text = 'WK2023AC')
      or (TextDetailModel.Text = 'WT2023AC')
      or (TextDetailModel.Text = 'W2023AC')
      or (TextDetailModel.Text = 'W2023C')
      or (TextDetailModel.Text = 'BW7023-S') then
    begin
      RectangleDefrost.Visible := True;
      ImageDetailPlus.Width := LayoutDetailSetTemp.Width / 3;
      ImageDetailPower.Width := LayoutDetailSetTemp.Width / 3;
      ImageDetailMinus.Width := LayoutDetailSetTemp.Width / 3;
    end else
    begin
      ImageDetailPlus.Width := LayoutDetailSetTemp.Width / 3;
      ImageDetailPower.Width := LayoutDetailSetTemp.Width / 3;
      ImageDetailMinus.Width := LayoutDetailSetTemp.Width / 3;
      RectangleDefrost.Visible := False;
    end;

    with UniQueryDetailSearch do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select M.ModelID, M.OutCount, M.DetailCount, C.AlarmX from ControllerInfo as C');
      SQL.Add('Inner Join Model as M');
      SQL.Add('On C.ModelCODE = M.Code');
      SQL.Add('Where C.ControllerID = '+DetailControllerID.ToString);
      Open;

      if FieldByName('AlarmX').AsBoolean then
      begin
        ImageX.MultiResBitmap := ImageX1.MultiResBitmap;
        ImageX.Tag := 1;
       // RectangleDetailChange.Enabled := False;
        ButtonDeviceDelete.Enabled := False;
        ImageDetailAlarm.Enabled := False;
        ImageGraph.Enabled := False;
      end else
      begin
        ImageX.MultiResBitmap := ImageX0.MultiResBitmap;
        ImageX.Tag := 0;
       // RectangleDetailChange.Enabled := True;
        ButtonDeviceDelete.Enabled := True;
        ImageDetailAlarm.Enabled := True;
        ImageGraph.Enabled := True;
      end;

      RectanglePW.Visible := False;


      RectangleModelDetail.Visible := False;
      if FieldByName('DetailCount').AsInteger > 0 then
      begin
        UniQueryDetailSearch2.Close;
        UniQueryDetailSearch2.SQL.Clear;
        UniQueryDetailSearch2.SQL.Add('select top('+FieldByName('DetailCount').AsString+') * from ModelDetail');
        UniQueryDetailSearch2.SQL.Add('Where ModelID = '+FieldByName('ModelID').AsString);

        if FieldByName('OutCount').AsInteger >= 1 then
        begin
          if CircleDetailOut1.Fill.Color <> TAlphaColors.Lightgray then
          begin
            UniQueryDetailSearch2.SQL.Add('And K1 = 1');
          end else
          begin
            UniQueryDetailSearch2.SQL.Add('And K1 = 0');
          end;
        end;

        if FieldByName('OutCount').AsInteger >= 2 then
        begin
          if CircleDetailOut2.Fill.Color <> TAlphaColors.Lightgray then
          begin
            UniQueryDetailSearch2.SQL.Add('And K2 = 1');
          end else
          begin
            UniQueryDetailSearch2.SQL.Add('And K2 = 0');
          end;
        end;


        if FieldByName('OutCount').AsInteger >= 3 then
        begin
          if CircleDetailOut3.Fill.Color <> TAlphaColors.Lightgray then
          begin
            UniQueryDetailSearch2.SQL.Add('And K3 = 1');
          end else
          begin
            UniQueryDetailSearch2.SQL.Add('And K3 = 0');
          end;
        end;


        if FieldByName('OutCount').AsInteger >= 4 then
        begin
          if CircleDetailOut4.Fill.Color <> TAlphaColors.Lightgray then
          begin
            UniQueryDetailSearch2.SQL.Add('And K4 = 1');
          end else
          begin
            UniQueryDetailSearch2.SQL.Add('And K4 = 0');
          end;
        end;


        if FieldByName('OutCount').AsInteger >= 5 then
        begin
          if CircleDetailOut5.Fill.Color <> TAlphaColors.Lightgray then
          begin
            UniQueryDetailSearch2.SQL.Add('And K5 = 1');
          end else
          begin
            UniQueryDetailSearch2.SQL.Add('And K5 = 0');
          end;
        end;

        UniQueryDetailSearch2.Open;

        TextModelDetail.Text := '';

        if UniQueryDetailSearch2.RecordCount > 0 then
        begin
          TextModelDetail.Text := UniQueryDetailSearch2.FieldByName('Name').AsString;
        end;
        //제상버튼추가
        if (TextDetailModel.Text = 'WT2023C')
         or (TextDetailModel.Text = 'W1120DC2S')
         or (TextDetailModel.Text = 'WK2023C')
          or (TextDetailModel.Text = 'WK2023AC')
          or (TextDetailModel.Text = 'WT2023AC')
          or (TextDetailModel.Text = 'W2023AC')
          or (TextDetailModel.Text = 'W2023C')
          or (TextDetailModel.Text = 'BW7023-S') then
        begin
          if DefrostState[SenderTag] then
          begin
            if DefrostMode[SenderTag] then
            begin
              TextModelDetail.Text := '수동제상';
            end else
            begin
              TextModelDetail.Text := '제상';
            end;
          end;
        end;

        if TextModelDetail.Text <> '' then
        begin
          RectangleModelDetail.Visible := True;
        end;
               {
        if DefrostMode[SenderTag] then
        begin
          TextModelDetail.Text := '수동제상';
          RectangleModelDetail.Visible := True;
        end;   }
      end;
    end;


    if DetailInCount <> 0 then
    begin
      LayoutDetailInOut.Height := ( ClientHeight - TextDetailTitle.Height ) / 20 * 8;
      RectangleDetailIn.Visible := True;
    end;

    if DetailInCount = 5 then
    begin
      LayoutDetailIn1.Visible := True;
      LayoutDetailIn2.Visible := True;
      LayoutDetailIn3.Visible := True;
      LayoutDetailIn4.Visible := True;
      LayoutDetailIn5.Visible := True;
      LayoutDetailIn1.Width := LayoutDetailInClient.Width / 5;
      LayoutDetailIn2.Width := LayoutDetailInClient.Width / 5;
      LayoutDetailIn4.Width := LayoutDetailInClient.Width / 5;
      LayoutDetailIn5.Width := LayoutDetailInClient.Width / 5;
    end else if DetailInCount = 4 then
    begin
      LayoutDetailIn1.Visible := True;
      LayoutDetailIn2.Visible := True;
      LayoutDetailIn3.Visible := True;
      LayoutDetailIn4.Visible := True;
      LayoutDetailIn5.Visible := False;
      LayoutDetailIn1.Width := LayoutDetailInClient.Width / 4;
      LayoutDetailIn2.Width := LayoutDetailInClient.Width / 4;
      LayoutDetailIn4.Width := LayoutDetailInClient.Width / 4;
    end else if DetailInCount = 3 then
    begin
      LayoutDetailIn1.Visible := True;
      LayoutDetailIn2.Visible := True;
      LayoutDetailIn3.Visible := True;
      LayoutDetailIn4.Visible := False;
      LayoutDetailIn5.Visible := False;
      LayoutDetailIn1.Width := LayoutDetailInClient.Width / 3;
      LayoutDetailIn2.Width := LayoutDetailInClient.Width / 3;
    end else if DetailInCount = 2 then
    begin
      LayoutDetailIn1.Visible := True;
      LayoutDetailIn2.Visible := True;
      LayoutDetailIn3.Visible := False;
      LayoutDetailIn4.Visible := False;
      LayoutDetailIn5.Visible := False;
      LayoutDetailIn1.Width := LayoutDetailInClient.Width / 2;
      LayoutDetailIn2.Width := LayoutDetailInClient.Width / 2;
    end else if DetailInCount = 1 then
    begin
      LayoutDetailIn1.Visible := True;
      LayoutDetailIn2.Visible := False;
      LayoutDetailIn3.Visible := False;
      LayoutDetailIn4.Visible := False;
      LayoutDetailIn5.Visible := False;
      LayoutDetailIn1.Width := LayoutDetailInClient.Width;
    end else
    begin
      LayoutDetailInOut.Height := ( ClientHeight - TextDetailTitle.Height ) / 16 * 8 / 2;  // 입력수 칸 제거를 위해 나누기 2 추가
      RectangleDetailIn.Visible := False;

      LayoutDetailIn1.Visible := False;
      LayoutDetailIn2.Visible := False;
      LayoutDetailIn3.Visible := False;
      LayoutDetailIn4.Visible := False;
      LayoutDetailIn5.Visible := False;
    end;

    if DetailOutCount = 5 then
    begin
      LayoutDetailOut1.Visible := True;
      LayoutDetailOut2.Visible := True;
      LayoutDetailOut3.Visible := True;
      LayoutDetailOut4.Visible := True;
      LayoutDetailOut5.Visible := True;
      LayoutDetailOut1.Width := LayoutDetailOutClient.Width / 5;
      LayoutDetailOut2.Width := LayoutDetailOutClient.Width / 5;
      LayoutDetailOut4.Width := LayoutDetailOutClient.Width / 5;
      LayoutDetailOut5.Width := LayoutDetailOutClient.Width / 5;
    end else if DetailOutCount = 4 then
    begin
      LayoutDetailOut1.Visible := True;
      LayoutDetailOut2.Visible := True;
      LayoutDetailOut3.Visible := True;
      LayoutDetailOut4.Visible := True;
      LayoutDetailOut5.Visible := False;
      LayoutDetailOut1.Width := LayoutDetailOutClient.Width / 4;
      LayoutDetailOut2.Width := LayoutDetailOutClient.Width / 4;
      LayoutDetailOut4.Width := LayoutDetailOutClient.Width / 4;
    end else if DetailOutCount = 3 then
    begin
      LayoutDetailOut1.Visible := True;
      LayoutDetailOut2.Visible := True;
      LayoutDetailOut3.Visible := True;
      LayoutDetailOut4.Visible := False;
      LayoutDetailOut5.Visible := False;
      LayoutDetailOut1.Width := LayoutDetailOutClient.Width / 3;
      LayoutDetailOut2.Width := LayoutDetailOutClient.Width / 3;
    end else if DetailOutCount = 2 then
    begin
      LayoutDetailOut1.Visible := True;
      LayoutDetailOut2.Visible := True;
      LayoutDetailOut3.Visible := False;
      LayoutDetailOut4.Visible := False;
      LayoutDetailOut5.Visible := False;
      LayoutDetailOut1.Width := LayoutDetailOutClient.Width / 2;
      LayoutDetailOut2.Width := LayoutDetailOutClient.Width / 2;
    end else if DetailOutCount = 1 then
    begin
      LayoutDetailOut1.Visible := True;
      LayoutDetailOut2.Visible := False;
      LayoutDetailOut3.Visible := False;
      LayoutDetailOut4.Visible := False;
      LayoutDetailOut5.Visible := False;
      LayoutDetailOut1.Width := LayoutDetailOutClient.Width;
    end else
    begin
      LayoutDetailOut1.Visible := False;
      LayoutDetailOut2.Visible := False;
      LayoutDetailOut3.Visible := False;
      LayoutDetailOut4.Visible := False;
      LayoutDetailOut5.Visible := False;
    end;


    DateEditGraph1.Date := date;
    DateEditGraph2.Date := date;
    TimeEditGraph1.Time := StrToTime('00:00:00');
    TimeEditGraph2.Time := StrToTime('23:59:59');
    GraphStart := FormatDateTime('yyyy-mm-dd ',DateEditGraph1.Date) + FormatDateTime('hh:nn:ss',TimeEditGraph1.Time);
    GraphEnd := FormatDateTime('yyyy-mm-dd ',DateEditGraph2.Date) + FormatDateTime('hh:nn:ss',TimeEditGraph2.Time);

//    // 240828 김동휘추가
    with UniQuery_DetailInfo do
    begin
      close;
      sql.Clear;
			sql.add(' SELECT top 1	CI.Serial				    ');
			sql.add(' 	   ,CI.WritingDateTime 			    ');
			sql.add(' 	   ,CI.ControllerName			      ');
			sql.add('   FROM	ControllerInfo as CI	    ');
			sql.add(' Left Outer Join MasterUser as M	  ');
			sql.add(' 	On CI.MasterID = M.UserID	    	');
			sql.add(' where ControllerID = '+DetailControllerID.ToString);
     // ParamByName('Name').AsString := TextDetailTitle.Text;
      //ParamByName('ID').AsInteger :=  ControllerID[SenderTag];
      open;

      Text_Title1.Text := '시리얼번호 : ' +FieldByName('Serial').AsString;
      Text_Title2.Text := '등록일 : ' +FieldByName('WritingDateTime').AsString;
    end;


//    // 240808 김동휘추가
//    오른쪽상단
    with UniQuery_DetailAlarm do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT * FROM ALARM ');
      SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
      SQL.Add('order by StartTime  ');
      open;
      StringGrid1.BeginUpdate;
      StringGrid1.RowCount :=0;
      StringGrid1.RowCount := RecordCount;
      for var i := 0 to RecordCount - 1 do
      begin
        StringGrid1.Cells[StringColumn1.Index,i] := FieldByName('ErrCode').AsString;
        StringGrid1.Cells[StringColumn2.Index,i] := FieldByName('StartTime').AsString;
        StringGrid1.Cells[StringColumn3.Index,i] := FieldByName('EndTime').AsString;
  //      AutoColumnSize(UniStoredProc1.FieldByName('ItemName').AsString, StringColumn29);
        Next;
      end;
      StringGrid1.EndUpdate;
    end;


       // 240812 김동휘추가
      //   왼쪽 하단
      SearchAlarmList;

      TextEditDetailName.Visible := false;
      EditDetailName.Visible := False;
      EditDetailName.ReadOnly := True;

      TextEditDetailTemp.Visible := True;
      EditDetailTemp.Visible := False;
      EditDetailTemp.ReadOnly := True;

      TextEditDetailSetTemp.Visible := True;
      EditDetailSetTemp.Visible := False;
      EditDetailSetTemp.ReadOnly := True;

      TextDetailSetTemp.Visible := True;
      TextDetailSetTempEdit.Visible := False;

      TextEditDetailHigh.Visible := True;
      EditDetailHigh.Visible := False;
      TextEditDetailLow.Visible := True;
      EditDetailLow.Visible := False;

      TextEditDetailIn1.Visible := True;
      TextEditDetailIn2.Visible := True;
      TextEditDetailIn3.Visible := True;
      TextEditDetailIn4.Visible := True;
      TextEditDetailIn5.Visible := True;
      TextEditDetailOut1.Visible := True;
      TextEditDetailOut2.Visible := True;
      TextEditDetailOut3.Visible := True;
      TextEditDetailOut4.Visible := True;
      TextEditDetailOut5.Visible := True;
      EditDetailIn1.Visible := False;
      EditDetailIn2.Visible := False;
      EditDetailIn3.Visible := False;
      EditDetailIn4.Visible := False;
      EditDetailIn5.Visible := False;
      EditDetailOut1.Visible := False;
      EditDetailOut2.Visible := False;
      EditDetailOut3.Visible := False;
      EditDetailOut4.Visible := False;
      EditDetailOut5.Visible := False;

      EditDetailIn1.ReadOnly := True;
      EditDetailIn2.ReadOnly := True;
      EditDetailIn3.ReadOnly := True;
      EditDetailIn4.ReadOnly := True;
      EditDetailIn5.ReadOnly := True;
      EditDetailOut1.ReadOnly := True;
      EditDetailOut2.ReadOnly := True;
      EditDetailOut3.ReadOnly := True;
      EditDetailOut4.ReadOnly := True;
      EditDetailOut5.ReadOnly := True;
      TextDetailChange.Text := '설정변경';
      TextDetailSaveButton.Text := '상세정보창 나가기';
      ImageDetailPlus.Enabled := False;
      ImageDetailMinus.Enabled := False;
      ImageDetailPower.Enabled := False;
      RectangleDefrost.Enabled := False;
  //  FDongHwa.WindowState := TWindowState.wsMaximized;


      GraphSearch;
      TextGraphDevice.Text := TextDetailModel.Text;
//      TextGraphDevice.Visible := false;
//      //TextDetailModel.Visible := false;
      EditGraphModel.Text := EditDetailName.Text;
    //  TextDetailTitle.text := EditDetailName.Text;


   // Resize;
    TabControl1.ActiveTab := TabItemDetailPC;
     Resize;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.DetailSave(Sender: TObject);
begin
  try
    TimerProcedure.Enabled := False;

    UniQueryDetailSave.Close;
    UniQueryDetailSave.SQL.Clear;
    UniQueryDetailSave.SQL.Add('Update ControllerInfo');
    UniQueryDetailSave.SQL.Add('Set ControllerName = '+#39+EditDetailName.Text+#39);
    UniQueryDetailSave.SQL.Add(', TempName = '+#39+EditDetailTemp.Text+#39);
    UniQueryDetailSave.SQL.Add(', SetTempName = '+#39+EditDetailSetTemp.Text+#39);
    UniQueryDetailSave.SQL.Add(', In1 = '+#39+EditDetailIn1.Text+#39);
    UniQueryDetailSave.SQL.Add(', In2 = '+#39+EditDetailIn2.Text+#39);
    UniQueryDetailSave.SQL.Add(', In3 = '+#39+EditDetailIn3.Text+#39);
    UniQueryDetailSave.SQL.Add(', In4 = '+#39+EditDetailIn4.Text+#39);
    UniQueryDetailSave.SQL.Add(', In5 = '+#39+EditDetailIn5.Text+#39);
    UniQueryDetailSave.SQL.Add(', Out1 = '+#39+EditDetailOut1.Text+#39);
    UniQueryDetailSave.SQL.Add(', Out2 = '+#39+EditDetailOut2.Text+#39);
    UniQueryDetailSave.SQL.Add(', Out3 = '+#39+EditDetailOut3.Text+#39);
    UniQueryDetailSave.SQL.Add(', Out4 = '+#39+EditDetailOut4.Text+#39);
    UniQueryDetailSave.SQL.Add(', Out5 = '+#39+EditDetailOut5.Text+#39);
    UniQueryDetailSave.SQL.Add(', HighTemp = '+#39+ FloatToStrF(hightemp, ffFixed, 7, 1)+#39);
    UniQueryDetailSave.SQL.Add(', LowTemp = '+#39+FloatToStrF(Lowtemp, ffFixed, 7, 1)+#39);
    UniQueryDetailSave.SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
    UniQueryDetailSave.ExecSQL;

    // 상하한 텍스트 수정
    TextEditDetailHigh.text   :=   FloatToStrF(hightemp, ffFixed, 7, 1)+ '℃';
    EditDetailHigh.TextPrompt :=   FloatToStrF(hightemp, ffFixed, 7, 1);

    // 상하한 텍스트 수정
    TextEditDetailLow.text   :=   FloatToStrF(Lowtemp, ffFixed, 7, 1)+ '℃';
    EditDetailLow.TextPrompt :=   FloatToStrF(Lowtemp, ffFixed, 7, 1);



//    TextEditDetailOut1.Text :=   EditDetailOut1.Text;
//    TextEditDetailOut2.Text :=   EditDetailOut2.Text;
//    TextEditDetailOut3.Text :=   EditDetailOut3.Text;
//    TextEditDetailOut4.Text :=   EditDetailOut4.Text;
//    TextEditDetailOut5.Text :=   EditDetailOut5.Text;




    TWaitDialog.Hide;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.EditDetailHighExit(Sender: TObject);
begin
  try
    if StrToFloatDef((Sender as TEdit).Text,99999) = 99999 then
    begin
      if (Sender as TEdit).Text <> '' then Showmessage('숫자만 입력해 주세요');
      (Sender as TEdit).Text := (Sender as TEdit).TextPrompt;
    end;
  except

  end;
end;

procedure TfDongHwa.EditDetailIn1Exit(Sender: TObject);
begin
  if Length((Sender as TEdit).Text) > 4 then
  begin
    Showmessage('4글자를 넘을 수 없습니다.');
    (Sender as TEdit).Text := (Sender as TEdit).TextPrompt;
  end;
end;

procedure TfDongHwa.EditIDKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    EditPW.SetFocus;
  end;
end;

procedure TfDongHwa.EditPWKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    if TRIM(EditPW.Text) <> '' then
    BEGIN
      TextLoginClick(SELF);
    END;
  end;
end;

procedure TfDongHwa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Check : integer;
begin
  Check := MessageDlg('리웍스 PC모니터링 프로그램을 종료하시겠습니까?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);

  if Check = mrYes then
    CanClose := True
  else
    CanClose := False;
     //  MessageDlg('리웍스 PC모니터링 프로그램  을 종료하시겠습니까?',mt , [mbYes,mbNo], 0)

//  if MessageDlg('리웍스 PC모니터링 프로그램  을 종료하시겠습니까?',mtWarning, [mbYes,mbNo], 0) = mrYes then
//      CanClose := True
//  else
//      CanClose := False;
end;

procedure TfDongHwa.FormCreate(Sender: TObject);

begin

  {$IFDEF MSWINDOWS}
    fDongHwa.Width := 450;
    fDongHwa.Height := 855;
    fDongHwa.Position := TFormPosition.ScreenCenter;

     CursorHandle := LoadCursorFromFile('C:\Users\CODERUN\Desktop\김동휘\업체\동화\testcur.cur');
     //Application.OnIdle := IdleHandler;

  {$ENDIF MSWINDOWS}

{$IFDEF ANDROID}
  FPermissionReadExternalStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  FPermissionWriteExternalStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
{$ENDIF}
  FirstCheck := True;
  Application.OnException := HandleException;
end;

procedure TfDongHwa.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  {$IFDEF ANDROID}
  if (Key = vkHardwareBack) then // 안드로이드 뒤로가기 제어
  begin
    if not KeyBoardFlag then
    begin
      BackClick(Self);
      Key := 0;
    end;
  end;
  {$ENDIF ANDROID}
end;

procedure TfDongHwa.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  // 마우스가 움직일 때마다 커서를 새로 설정
  if CursorHandle <> 0 then
    SetCursor(CursorHandle);
end;

procedure TfDongHwa.FormResize(Sender: TObject);
begin
  Resize;

  if (TabControl1.ActiveTab = TabItemMain)
  and (Reflog = true) then
  begin
    MainReSIZE;
  end;
end;

procedure TfDongHwa.FormShow(Sender: TObject);
var
  sPath : String;
  iFile : TIniFile;
  i : Integer;
begin
  ControllerAllSearchCount := 0;
  GraphSearchCount := 0;


  Alarm := 1;
  ThreadNumber := 0;

  RectanglePW.Visible := False;


  RectangleMain.Visible := false;
  Rectangletop.Visible  := false;

  LayoutMain1Set.Visible := False;
  LayoutMain2Set.Visible := False;
  LayoutMain3Set.Visible := False;
  LayoutMain4Set.Visible := False;
  LayoutMain5Set.Visible := False;
  LayoutMain6Set.Visible := False;
  LayoutMain7Set.Visible := False;
  LayoutMain8Set.Visible := False;
  LayoutMain9Set.Visible := False;
  LayoutMain10Set.Visible := False;
  LayoutMain11Set.Visible := False;
  LayoutMain12Set.Visible := False;
  RectangleMain1Set.Visible := False;
  RectangleMain2Set.Visible := False;
  RectangleMain3Set.Visible := False;
  RectangleMain4Set.Visible := False;
  RectangleMain5Set.Visible := False;
  RectangleMain6Set.Visible := False;
  RectangleMain7Set.Visible := False;
  RectangleMain8Set.Visible := False;
  RectangleMain9Set.Visible := False;
  RectangleMain10Set.Visible := False;
  RectangleMain11Set.Visible := False;
  RectangleMain12Set.Visible := False;

//  Chart1.AllowPanning := pmHorizontal;
  Chart1.AllowPanning := pmBoth;
  Chart1.LeftAxis.Maximum := 70;
  Chart1.LeftAxis.Minimum := -30;


  for i := 0 to 1000 do
  begin
    ModelStr[i] := '';
  end;

  MainRect[1] := RectangleMain1;
  MainRect[2] := RectangleMain2;
  MainRect[3] := RectangleMain3;
  MainRect[4] := RectangleMain4;
  MainRect[5] := RectangleMain5;
  MainRect[6] := RectangleMain6;
  MainRect[7] := RectangleMain7;
  MainRect[8] := RectangleMain8;
  MainRect[9] := RectangleMain9;
  MainRect[10] := RectangleMain10;
  MainRect[11] := RectangleMain11;
  MainRect[12] := RectangleMain12;

  TextMainRTop[1] := TextMain1RTop;
  TextMainRTop[2] := TextMain2RTop;
  TextMainRTop[3] := TextMain3RTop;
  TextMainRTop[4] := TextMain4RTop;
  TextMainRTop[5] := TextMain5RTop;
  TextMainRTop[6] := TextMain6RTop;
  TextMainRTop[7] := TextMain7RTop;
  TextMainRTop[8] := TextMain8RTop;
  TextMainRTop[9] := TextMain9RTop;
  TextMainRTop[10] := TextMain10RTop;
  TextMainRTop[11] := TextMain11RTop;
  TextMainRTop[12] := TextMain12RTop;

  TextMainRClient[1] := TextMain1RClient;
  TextMainRClient[2] := TextMain2RClient;
  TextMainRClient[3] := TextMain3RClient;
  TextMainRClient[4] := TextMain4RClient;
  TextMainRClient[5] := TextMain5RClient;
  TextMainRClient[6] := TextMain6RClient;
  TextMainRClient[7] := TextMain7RClient;
  TextMainRClient[8] := TextMain8RClient;
  TextMainRClient[9] := TextMain9RClient;
  TextMainRClient[10] := TextMain10RClient;
  TextMainRClient[11] := TextMain11RClient;
  TextMainRClient[12] := TextMain12RClient;

  MainSetChangeState := False;
  PreMain1InCount := -1;
  PreMain2InCount := -1;
  PreMain3InCount := -1;
  PreMain4InCount := -1;
  PreMain5InCount := -1;
  PreMain6InCount := -1;
  PreMain7InCount := -1;
  PreMain8InCount := -1;
  PreMain9InCount := -1;
  PreMain10InCount := -1;
  PreMain11InCount := -1;
  PreMain12InCount := -1;

  PreMain1OutCount := -1;
  PreMain2OutCount := -1;
  PreMain3OutCount := -1;
  PreMain4OutCount := -1;
  PreMain5OutCount := -1;
  PreMain6OutCount := -1;
  PreMain7OutCount := -1;
  PreMain8OutCount := -1;
  PreMain9OutCount := -1;
  PreMain10OutCount := -1;
  PreMain11OutCount := -1;
  PreMain12OutCount := -1;

 // {$IFDEF ANDROID}
  try

    if  not FileExists(TPath.GetDocumentsPath + '\' +'alarm2.mp3')  then
    begin
      IdFTP.Connect;
      IdFTP.IOHandler.DefStringEncoding := IndyTextEncoding(949);
      IdFTP.ChangeDir('DongHwa_Monitoring');
      IdFTP.Get('alarm2.mp3', TPath.GetDocumentsPath  + '\' +'alarm2.mp3', True);
    end;
    MP3Files :=   TPath.Combine(TPath.GetDocumentsPath, 'alarm2.mp3');
    MediaPlayer1.FileName := MP3Files;
     // MediaPlayer1.Play;
    if  not FileExists(TPath.GetDocumentsPath +'엑셀파일저장형식.xlsx')  then
    begin
      IdFTP.Connect;
      IdFTP.IOHandler.DefStringEncoding := IndyTextEncoding(949);
      idFTP.ChangeDir('DongHwa_Monitoring');
      IdFTP.Get('엑셀파일저장형식.xlsx', TPath.GetDocumentsPath +'\엑셀파일저장형식.xlsx', True);
    end;

  finally
    if IdFTP.Connected then
    begin
      IdFTP.Disconnect;
    end;
    IdFTP.Free;
  end;
 // {$ENDIF ANDROID}

  KeyBoardFlag := False;
  sPath := TPath.Combine(TPath.GetDocumentsPath, 'Env.ini');
  if FileExists(sPath) then
  begin
    iFile := TIniFile.Create(sPath);
    try



      EditID.Text := iFile.ReadString('Login', 'login_Id', '');
      if iFile.ReadString('Login', 'login_Auto', '') = 'Y' then
      begin
        EditPW.Text := iFile.ReadString('Login', 'login_Password', '');
        CheckBoxLoginAuto.IsChecked := True;
      end else
      begin
        CheckBoxLoginAuto.IsChecked := False;
      end;
      EditPW.SelectAll;
    finally
      iFile.DisposeOf;
    end;
  end;

  Text_DetailRight1.Text := '단말기'+#13+#10+'삭제';
  Text_DetailRight2.Text := '사용'+#13+#10+'대기';
  Text_DetailRight3.Text := '경보'+#13+#10+'알림';

  ImageMain1Plus.Visible := True;
  ImageMain2Plus.Visible := True;
  ImageMain3Plus.Visible := True;

  LayoutMain1Set.Visible := False;
  LayoutMain2Set.Visible := False;
  LayoutMain3Set.Visible := False;


  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.ActiveTab := TabItemLogin;


  ImageWifi3.Visible := False;
  ImageWifi2.Visible := False;
  ImageWifi1.Visible := False;
  ImageWifi0.Visible := False;

  ImageAlarmOn.Visible := False;
  ImageAlarmOff.Visible := False;

  ImageAlarmO.Visible := False;
  ImageAlarmX.Visible := False;

  Chart1.Title.Text.Clear;


  for var a := 1 to 12 do
  begin
    MainRect[a].Fill.Kind := TBrushKind.Solid;
    MainRect[a].Fill.Color := TAlphaColors.Silver;
  end;
  Reflog := true;
//  Resize;
end;

procedure TfDongHwa.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  KeyBoardFlag := False;
  if TabControl1.ActiveTab = TabItemDetailPC then
  begin
    RectangleDetailDevice.Visible := True;
    LayoutDetailHighLow.Visible := True;
  end;
end;

procedure TfDongHwa.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  KeyBoardFlag := True;

  if TabControl1.ActiveTab = TabItemDetailPC then
  begin
    if EditDetailIn1.IsFocused
      or EditDetailIn2.IsFocused
      or EditDetailIn3.IsFocused
      or EditDetailIn4.IsFocused
      or EditDetailIn5.IsFocused
      or EditDetailOut1.IsFocused
      or EditDetailOut2.IsFocused
      or EditDetailOut3.IsFocused
      or EditDetailOut4.IsFocused
      or EditDetailOut5.IsFocused then
    begin
      RectangleDetailDevice.Visible := False;
      LayoutDetailHighLow.Visible := False;
    end;
  end;
end;

procedure TfDongHwa.GraphExpand;
var
  MulCalcDate, MulCalcTemp : Double;
begin
  try
    if Expand = 777 then
    begin
      TextGraphExpand.Text := 'x1'; // 1배 = 2시간차  [ 라인4개 ]
      if Chart1.BottomAxis.Minimum <= ChartMaxDate then
      begin
//        try
//          Chart1.BottomAxis.Maximum := ChartMaxDate;  // 8시간
//          Chart1.BottomAxis.Minimum := ChartMaxDate - (1 / 24 * 8);
//        except
//          Chart1.BottomAxis.Maximum := Chart1.BottomAxis.Minimum + ChartMaxDate;
//          Chart1.BottomAxis.Minimum := ChartMaxDate - (1 / 24 * 8);
//          Chart1.BottomAxis.Maximum := ChartMaxDate;  // 8시간
//        end;
        try
          Chart1.BottomAxis.Maximum := ChartMaxDate;  // 8시간
          Chart1.BottomAxis.Minimum := ChartMinDate - (1 / 24 * 8);
        except
          Chart1.BottomAxis.Maximum := Chart1.BottomAxis.Minimum + ChartMaxDate;
          Chart1.BottomAxis.Minimum := ChartMinDate - (1 / 24 * 8);
          Chart1.BottomAxis.Maximum := ChartMinDate;  // 8시간
        end;
      end else
      begin
        if Chart1.BottomAxis.Maximum < ChartMaxDate then
        begin
          Chart1.BottomAxis.Maximum := Chart1.BottomAxis.Minimum + 1;
        end;
    //    Chart1.BottomAxis.Maximum := ChartMaxDate;
      //  Chart1.BottomAxis.Minimum := ChartMaxDate - (1 / 24 * 8);
      end;
      Expand := 1;

      GraphDateAvg1 := (Chart1.BottomAxis.Maximum - Chart1.BottomAxis.Minimum) / 2;
      GraphDateAvg1 := Chart1.BottomAxis.Minimum + GraphDateAvg1;
    end else
    begin
      GraphDateAvg1 := (Chart1.BottomAxis.Maximum - Chart1.BottomAxis.Minimum) / 2;
      GraphDateAvg1 := Chart1.BottomAxis.Minimum + GraphDateAvg1;

      if Expand = 1 then
      begin
        TextGraphExpand.Text := 'x1'; // 1배 = 2시간차  [ 라인4개 ]
        MulCalcDate := 4;
      end else if Expand = 2 then // 2배 = 1시간차
      begin
        TextGraphExpand.Text := 'x2';
        MulCalcDate := 2;
      end else if Expand = 3 then // 4배 = 30분차
      begin
        TextGraphExpand.Text := 'x4';
        MulCalcDate := 1;
      end else if Expand = 4 then // 8배 = 15분차
      begin
        TextGraphExpand.Text := 'x8';
        MulCalcDate := 0.5;
      end else if Expand = 0 then  // -2배 = 4시간차
      begin
        TextGraphExpand.Text := 'x(-2)';
        MulCalcDate := 8;
      end else if Expand = -1 then // -4배 = 6시간차
      begin
        TextGraphExpand.Text := 'x(-4)';
        MulCalcDate := 12;
      end;
      Chart1.BottomAxis.Maximum := Now + 10000;
      Chart1.BottomAxis.Minimum := Now - 10000;
      Chart1.BottomAxis.Minimum := GraphDateAvg1 - (MulCalcDate / 24);    // AvgDateTime
      Chart1.BottomAxis.Maximum := GraphDateAvg1 + (MulCalcDate / 24);
    end;

    with UniQueryGraph do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Max(Temp) as Mx, Min(Temp) as Mn from TempCheck');
      SQL.Add('Where SerialNo = '+#39+GraphDetailSerialNo+#39);
      SQL.Add('And CheckDate >= '+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',Chart1.BottomAxis.Minimum)+#39);
      SQL.Add('And CheckDate <= '+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',Chart1.BottomAxis.Maximum)+#39);
      Open;

      if FieldByName('Mx').AsCurrency <> FieldByName('Mn').AsCurrency then
      begin
        Chart1.LeftAxis.Maximum := 99999;
        Chart1.LeftAxis.Minimum := -99999;
        MulCalcTemp := FieldByName('Mx').AsCurrency - FieldByName('Mn').AsCurrency;
        if MulCalcTemp < 1 then MulCalcTemp := 10;

        Chart1.LeftAxis.Maximum := FieldByName('Mx').AsCurrency
                  + (MulCalcTemp / 10);
        Chart1.LeftAxis.Minimum := FieldByName('Mn').AsCurrency
                  - (MulCalcTemp / 10);
      end;
    end;


    if Chart1.Series[0].Count > 0 then
    begin
      var tmp, i : Integer;

      for i := 0 to Chart1.Series[0].Count - 1 do
      begin
        if Chart1.Series[0].XValue[i] >= GraphDateAvg1 then
        begin
          tmp := i;
          break;
        end;
      end;

      if tmp <> Current then
      begin
        Current := tmp;
        Series1.Repaint;
      end;
    end;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.GraphExpand2;
begin

end;

procedure TfDongHwa.GraphSearch;
var
  i : integer;
begin
  try
    if UniConnection1.Connected then
    begin
      GraphSearchCount := 0;
      SelectKNumber := 1;
      with UniQueryGraphGetMark do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select top(1) M.OutCount,');
        SQL.Add('( CASE WHEN ISNULL(C.Out1,'''') = '''' THEN M.K1Name ELSE C.Out1 END ) as K1,');
        SQL.Add('( CASE WHEN ISNULL(C.Out2,'''') = '''' THEN M.K2Name ELSE C.Out2 END ) as K2,');
        SQL.Add('( CASE WHEN ISNULL(C.Out3,'''') = '''' THEN M.K3Name ELSE C.Out3 END ) as K3,');
        SQL.Add('( CASE WHEN ISNULL(C.Out4,'''') = '''' THEN M.K4Name ELSE C.Out4 END ) as K4,');
        SQL.Add('( CASE WHEN ISNULL(C.Out5,'''') = '''' THEN M.K5Name ELSE C.Out5 END ) as K5  from ControllerInfo as C');
        SQL.Add('Left Outer Join Model as M');
        SQL.Add('On C.ModelCODE = M.Code');
        SQL.Add('Where C.ControllerID = '+DetailControllerID.ToString);
        Open;
        NameK[1] := FieldByName('K1').AsString;
        NameK[2] := FieldByName('K2').AsString;
        NameK[3] := FieldByName('K3').AsString;
        NameK[4] := FieldByName('K4').AsString;
        NameK[5] := FieldByName('K5').AsString;
        KOutCount := FieldByName('OutCount').AsInteger;
      end;

      with UniQueryGraph do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from ControllerInfo');
        SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
        Open;
        GraphDetailSerialNo := Trim(FieldByName('SerialNo').AsString);

        Close;
        SQL.Clear;
        SQL.Add('select * from TempCheck');
        SQL.Add('Where SerialNo = '+#39+GraphDetailSerialNo+#39);
        SQL.Add('And CheckDate >= '+#39+GraphStart+#39);
        SQL.Add('And CheckDate <= '+#39+GraphEnd+#39);
        SQL.Add('Order by CheckDate ');
        Open;

        if RecordCount <= 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('select Top(50) * from TempCheck');
          SQL.Add('Where SerialNo = '+#39+GraphDetailSerialNo+#39);
          SQL.Add('And CheckDate <= '+#39+GraphStart+#39);
          SQL.Add('Order by CheckDate ');
          Open;
        end;

        for i := 0 to 5 do
        begin
          SaveTimeK[i] := 0;
        end;

        ChartMinDate := FieldByName('CheckDate').AsDateTime;
        Chart1.Series[0].Clear;

        GraphTempAvg := 0;
        for i := 0 to RecordCount - 1 do
        begin
          Chart1.Series[0].AddXY(
                   FieldByName('CheckDate').AsDateTime,
                   FieldByName('TEMP').AsFloat,
                   '',
                   Chart1.Series[0].Color);
         
          GraphTempAvg := GraphTempAvg + FieldByName('TEMP').AsFloat;
          ChartMaxDate := FieldByName('CheckDate').AsDateTime;

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
          end;
          Next;
        end;
        for i := 1 to 5 do
        begin
          SaveTimeK[i]:= SaveTimeK[i] / 0.00069444;  // 0.0000011574 * 600 = 1분
        end;
        SaveTimeDisplay;
        GraphTempAvg := SimpleRoundTo(GraphTempAvg / RecordCount,1);
        Expand := 777;
        GraphExpand;
        Expand2 := 777;
        GraphExpand2;
      end;
    end else
    begin
      UniConnection1.Connected := True;
      TimerGraphSearch.Enabled := True;
    end;
  except on e:exception do
    begin
      //Memo1.Lines.Add('GraphSearch : '+e.Message);
      TimerGraphSearch.Enabled := True;
    end;
  end;
end;

procedure TfDongHwa.HandleException(Sender: TObject; E: Exception);
begin
  //Memo1.Lines.Add('HE : ' + E.Message);
end;

procedure TfDongHwa.IdTCPClientConnected(Sender: TObject);
begin
  try
    //Memo1.Lines.Add('Connect!');
    idThreadComponent.Active := True;
  except
    On e : exception do
    begin
    //  Memo1.Lines.Add('E0 ' + e.Message);
    end;
  end;
end;

procedure TfDongHwa.IdTCPClientDisconnected(Sender: TObject);
begin
  try
    idThreadComponent.Active := False;
    //Memo1.Lines.Add('DisConnect!');
  except
    On e : exception do
    begin
     // Memo1.Lines.Add('ED ' + e.Message);
    end;
  end;
end;

procedure TfDongHwa.IdThreadComponentRun(Sender: TIdThreadComponent);
begin

end;

procedure TfDongHwa.ImagePlusClick(Sender: TObject);
begin
Exit;
  if MasterCheck then
  begin
    UniConnection1.Connected := False;
    //ImageConnectBack.Bitmap := ImageBack1.Bitmap;
   // TabControl1.ActiveTab := TabItemConnect;
  end else
  begin
    Showmessage('관리자만 가능한 기능입니다');
  end;
end;

procedure TfDongHwa.ImageXClick(Sender: TObject);
begin
  EditPW2.Text := '';
  if RectanglePW.Visible = True then
  begin
    RectanglePW.Visible := false;
  end
  else
  begin
    if ImageX.Tag = 0 then
    begin
      TextPW1.Text := '단말기 사용 대기';
      TextPW2.Text := '단말기의 사용을 일시적으로'+#13+'대기합니다.'+#13
                     +'사용대기 시에는 단말기의'+#13+'모든 기능이 정지됩니다.'+#13
                     +'사용대기를 원하시면'+#13+'비밀번호를 입력하세요';
      RectanglePW.Height := ( ClientHeight / 10 * 3 ) + EditPW2.Height;
      RectanglePW.Margins.Bottom := ClientHeight / 3 * 2;
    end else
    begin
      TextPW1.Text := '단말기 사용 대기 해제';
      TextPW2.Text := '비밀번호를 입력하세요';
      RectanglePW.Height := ( ClientHeight / 5 * 1 ) + EditPW2.Height;
      RectanglePW.Margins.Bottom := ClientHeight / 3 * 2;
    end;
    RectanglePW.Visible := True;
    EditPW2.SetFocus;
  end;
end;

procedure TfDongHwa.Image_LeftClick(Sender: TObject);
begin
  DateEditGraph1.Date := DateEditGraph1.Date -1;
  DateEditGraph2.Date := DateEditGraph2.Date -1;
end;

procedure TfDongHwa.Image_LeftMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
   Image_left.Bitmap.Assign(ImageList1.Source[1].MultiResBitmap[0].Bitmap);
end;

procedure TfDongHwa.Image_LeftMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
   Image_left.Bitmap.Assign(ImageList1.Source[0].MultiResBitmap[0].Bitmap);
end;

procedure TfDongHwa.Image_rightClick(Sender: TObject);
begin
  DateEditGraph1.Date := DateEditGraph1.Date +1;
  DateEditGraph2.Date := DateEditGraph2.Date +1;
end;

procedure TfDongHwa.Image_rightMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
   Image_right.Bitmap.Assign(ImageList1.Source[3].MultiResBitmap[0].Bitmap);
end;

procedure TfDongHwa.Image_rightMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Image_right.Bitmap.Assign(ImageList1.Source[2].MultiResBitmap[0].Bitmap);
end;

procedure TfDongHwa.Image_SearchMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
   Image_Search.Bitmap.Assign(ImageList1.Source[5].MultiResBitmap[0].Bitmap);
end;

procedure TfDongHwa.Image_SearchMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Image_Search.Bitmap.Assign(ImageList1.Source[4].MultiResBitmap[0].Bitmap);
end;

procedure TfDongHwa.Image1Click(Sender: TObject);
begin
  Image1.Visible := False;
end;

procedure TfDongHwa.Image_HomeClick(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItemMain then  exit;

  if TextDetailChange.Text = '취소' then
  begin
    TextDetailChangeClick(self);
    TabControl1.ActiveTab := TabItemMain;
  end
  else
  begin
    try
      if TabControl1.ActiveTab = TabItemJoin then
      begin
        TabControl1.ActiveTab := TabItemLogin;
      end else if (TabControl1.ActiveTab = TabItemDetailPC) then
      begin
        TabControl1.ActiveTab := TabItemMain;
      end;
    except on e:exception do
      begin
        Showmessage(e.Message);
      end;
    end;
  end;
end;

procedure TfDongHwa.ImageAlarm1Click(Sender: TObject);
begin
  TImage(Sender).Visible := false;
end;

procedure TfDongHwa.ImageDetailAlarmClick(Sender: TObject);
var
  MessageStr : String;
begin
  if ImageDetailAlarm.Tag = 1 then
  begin
    MessageStr := TextEditDetailName.Text + ' 알람을 끄시겠습니까?';
  end else
  begin
    MessageStr := TextEditDetailName.Text + ' 알람을 켜시겠습니까?';
  end;

    MessageDlg(MessageStr
    , System.UITypes.TMsgDlgType.mtInformation,
    [
     System.UITypes.TMsgDlgBtn.mbYes,
     System.UITypes.TMsgDlgBtn.mbNo
    ], 0,
    procedure (const AResult: TModalResult)
    begin
      if AResult = mrYes then
      begin

          if ImageDetailAlarm.Tag = 1 then
          begin
            ImageDetailAlarm.Tag := 0;
            ImageDetailAlarm.MultiResBitmap := ImageAlarmOff.MultiResBitmap;
          end else
          begin
            ImageDetailAlarm.Tag := 1;
            ImageDetailAlarm.MultiResBitmap := ImageAlarmOn.MultiResBitmap;
          end;
          UniQueryIOT.Close;
          UniQueryIOT.SQL.Clear;
          UniQueryIOT.SQL.Add('update ControllerInfo Set Alarm = '+ImageDetailAlarm.Tag.ToString);
          UniQueryIOT.SQL.Add('where ControllerID = '+DetailControllerID.ToString);
          UniQueryIOT.ExecSQL;

      end;
    end
    );
end;

procedure TfDongHwa.ImageDetailMinusClick(Sender: TObject);
begin
    DetailSetTemp := DetailSetTemp - 0.1;
    TextDetailSetTemp.Text := FormatFloat('0.0',DetailSetTemp);//+'℃';
    TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
end;

procedure TfDongHwa.ImageDetailPlusClick(Sender: TObject);
begin
    DetailSetTemp := DetailSetTemp + 0.1;
    TextDetailSetTemp.Text := FormatFloat('0.0',DetailSetTemp);//+'℃';
    TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
end;

procedure TfDongHwa.ImageDetailPowerClick(Sender: TObject);
var
  MessageStr : String;
  PowerOnOffStr : Boolean;
begin
  try
    UniQueryIOT.Close;
    UniQueryIOT.SQL.Clear;
    UniQueryIOT.SQL.Add('Select ISNULL(PowerState,0) as PowerState from TempState');
    UniQueryIOT.SQL.Add('WHERE ControllerID = '+DetailControllerID.ToString);
    UniQueryIOT.Open;

    if UniQueryIOT.RecordCount > 0 then
    begin
      if UniQueryIOT.FieldByName('PowerState').AsBoolean then
      begin
        MessageStr := '전원을 종료하시겠습니까?';
        PowerOnOffStr := False;
      end else
      begin
        MessageStr := '전원을 켜시겠습니까?';
        PowerOnOffStr := True;
      end;
      MessageDlg(MessageStr
      , System.UITypes.TMsgDlgType.mtInformation,
      [
       System.UITypes.TMsgDlgBtn.mbYes,
       System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
      procedure (const AResult: TModalResult)
      begin
        if AResult = mrYes then
        begin
          UniQueryIOT.Close;
          UniQueryIOT.SQL.Clear;
          UniQueryIOT.SQL.Add('Exec usp_Controller @Option = ''P'', @ControllerID = :ControllerID');
          UniQueryIOT.SQL.Add(', @PowerState = :PowerState, @Defrost = :Defrost');
          UniQueryIOT.ParamByName('ControllerID').AsInteger := DetailControllerID;
          UniQueryIOT.ParamByName('PowerState').AsBoolean := PowerOnOffStr;
          UniQueryIOT.ParamByName('Defrost').AsBoolean := False;
          UniQueryIOT.ExecSQL;

//          if PowerOnOffStr = False then
//          begin
//            // 경보알람
//            UniQueryIOT.Close;
//            UniQueryIOT.SQL.Clear;
//            UniQueryIOT.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, EndTime, CheckTime)');
//            UniQueryIOT.SQL.Add('Values('+#39+DetailControllerID.ToString+#39);
//            UniQueryIOT.SQL.Add(','+#39+'['+EditID.Text +'] : '+TextEditDetailName.text+' 단말기의 전원이 OFF 되었습니다.'+#39+', GETDATE(), GETDATE(), GETDATE() )');
//            UniQueryIOT.Execute;
//
//            // off 푸시알람
//            UniQueryIOT.Close;
//            UniQueryIOT.SQL.Clear;
//            UniQueryIOT.SQL.Add('Insert Into PushData(Token, Title, Msg, InsertTime)');
//            UniQueryIOT.SQL.Add('Values('+#39+pushToken+#39);
//           // UniQueryDelete.SQL.Add(','+#39+'리웍스 단말기 경보알림'+#39+','+#39+'('+EditID.Text +') ['+TextEditDetailName.text+']의 전원\이 OFF 되었습니다.'+#39+', GETDATE())');
//            UniQueryIOT.SQL.Add(','+#39+'['+EditID.Text +'] : '+TextEditDetailName.text+#39+','+#39+'단말기의 전원이 OFF 되었습니다.'+#39+', GETDATE())');
//            UniQueryIOT.Execute;
//          end;

          Showmessage('전원 상태 변경 요청을 하였습니다.'+#13+'시간이 다소 소요될 수 있습니다');

          TabControl1.ActiveTab := TabItemMain;
        end;
      end
      );
    end;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.ImageGraph2MinusClick(Sender: TObject);
begin
  Expand2 := Expand2 - 1;
  if Expand2 < -1 then Expand2 := -1;
  GraphExpand2;
end;

procedure TfDongHwa.ImageGraph2PlusClick(Sender: TObject);
begin
  Expand2 := Expand2 + 1;
  if Expand2 > 4 then Expand2 := 4;
  GraphExpand2;
end;

procedure TfDongHwa.ImageGraphClick(Sender: TObject);
begin
 // LayoutGraph1DateTime.Visible := False;
 // LayoutGraph1Button.Visible := True;
  DateEditGraph1.Date := Now;
  DateEditGraph2.Date := Now;
  TimeEditGraph1.Time := StrToTime('00:00:00');
  TimeEditGraph2.Time := StrToTime('23:59:59');
  GraphStart := FormatDateTime('yyyy-mm-dd ',DateEditGraph1.Date) + FormatDateTime('hh:nn:ss',TimeEditGraph1.Time);
  GraphEnd := FormatDateTime('yyyy-mm-dd ',DateEditGraph2.Date) + FormatDateTime('hh:nn:ss',TimeEditGraph2.Time);
  GraphSearch;
  TextGraphDevice.Text := TextDetailModel.Text;
  EditGraphModel.Text := EditDetailName.Text;
  //TabControl1.ActiveTab := TabItemGraph;
end;

procedure TfDongHwa.ImageGraphMinusClick(Sender: TObject);
begin
  Expand := Expand - 1;
  if Expand < -1 then Expand := -1;
  GraphExpand;
end;

procedure TfDongHwa.ImageGraphPlusClick(Sender: TObject);
begin
  Expand := Expand + 1;
  if Expand > 4 then Expand := 4;
  GraphExpand;
end;

procedure TfDongHwa.ImageLoginClick(Sender: TObject);
begin
//  MemoLog.Visible := not MemoLog.Visible;
end;

procedure TfDongHwa.ImageMainNextClick(Sender: TObject);
begin
  if MainSetChangeState  then Exit;
  if Page < ControllerCount then Page := Page + 1;
  TextMainBottom.Text := Page.ToString + ' / ' + ControllerCount.ToString;
  MainRefresh;
end;

procedure TfDongHwa.ImageMainPriorClick(Sender: TObject);
begin
  if MainSetChangeState  then Exit;
  if Page > 1 then Page := Page - 1;
  TextMainBottom.Text := Page.ToString + ' / ' + ControllerCount.ToString;
  MainRefresh;
end;

procedure TfDongHwa.ImageMouseLeave(Sender: TObject);
begin
  (Sender as TImage).Opacity := 1;
end;

procedure TfDongHwa.ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  (Sender as TImage).Opacity := 0.7;
end;

procedure TfDongHwa.Join(Sender: TObject);
begin
  try
    TimerProcedure.Enabled := False;
    if EditJoinID.Text = '' then
    begin
      Showmessage('아이디가 입력되지 않았습니다');
    end
    // 아이디 유효성 검사: 영문 대소문자, 숫자만 허용, 한글 금지, 4~32자
    else if not TRegEx.IsMatch(EditJoinID.Text, '^[a-zA-Z0-9]{4,32}$') then
    begin
      ShowMessage('아이디는 대소문자 구분, 한글 사용 금지, 4~32자여야 합니다.');
     // Exit;
    end
    else if EditJoinPW.Text = '' then
    begin
      Showmessage('비밀번호가 입력되지 않았습니다');
    end
    // 비밀번호 유효성 검사: 영문 대소문자, 숫자, 특수문자 허용, 한글 금지, 4~32자
    else if not TRegEx.IsMatch(EditJoinPW.Text, '^[a-zA-Z0-9!@#$%^&*()_+\-=]{4,32}$') then
    begin
      ShowMessage('비밀번호는 한글 사용 금지, 4~32자여야 합니다.');
      //Exit;
    end
    else if EditJoinPW.Text <> EditJoinPW2.Text then
    begin
      Showmessage('비밀번호가 일치하지 않습니다');
    end
    else if EditJoinCompany.Text = '' then
    begin
      Showmessage('업체명이 입력되지 않았습니다');
    end
    else
    begin
      try
        UniQueryLogin.Close;
        UniQueryLogin.SQL.Clear;
        UniQueryLogin.SQL.Add('Exec usp_User @Option = ''O'', @LoginID = :LoginID');
        UniQueryLogin.ParamByName('LoginID').AsString := EditJoinID.Text;
        UniQueryLogin.ExecSQL;
        if UniQueryLogin.RecordCount > 0 then
        begin
          Showmessage('이미 존재하는 아이디입니다');
        end else
        begin
          UniQueryLogin.Close;
          UniQueryLogin.SQL.Clear;
          UniQueryLogin.SQL.Add('Exec usp_User @Option = ''E'', @LoginID = :LoginID, @Password = :Password ');
          UniQueryLogin.SQL.Add(', @Name = :Name, @Position = :Position ');
          UniQueryLogin.ParamByName('LoginID').AsString := EditJoinID.Text;
          UniQueryLogin.ParamByName('Password').AsString := EditJoinPW.Text;
          UniQueryLogin.ParamByName('Name').AsString := EditJoinCompany.Text;
          UniQueryLogin.ParamByName('Position').AsString := '관리자';
          UniQueryLogin.ExecSQL;

          EditID.Text := EditJoinID.Text;
          TabControl1.ActiveTab := TabItemLogin;
        end;
      except on e : Exception do
        begin
          TWaitDialog.Hide;
          Showmessage(e.Message);
        end;
      end;
    end;
    TWaitDialog.Hide;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.BackMouseLeave(Sender: TObject);
begin
  (Sender as TImage).Bitmap := ImageBack1.Bitmap;
end;

procedure TfDongHwa.BackMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  (Sender as TImage).Bitmap :=  ImageBack2.Bitmap;
end;

procedure TfDongHwa.Login(Sender: TObject);
var
  sPath : String;
  iFile : TIniFile;
  i : Integer;
  {$IFDEF ANDROID}
    Intent: JIntent;
    PushService: TPushService;
    ServiceConnection: TPushServiceConnection;
    Notifications: TArray<TPushServiceNotification>;
  {$ENDIF ANDROID}
  Msg : string;
begin
  TimerProcedure.Enabled := False;

//  {$IFDEF ANDROID}
//  if UniConnection1.Connected then
//  begin
//    UniQueryVersionCheck.Close;
//    UniQueryVersionCheck.SQL.Text := 'Select * From VERSION ';
//    UniQueryVersionCheck.Open;
//    if not (TextVersion.Text = UniQueryVersionCheck.FieldByName('VERSION').AsString) then
//    begin
//      MessageDlg('새로운 버전이 있습니다.'+#13+'업데이트 하시겠습니까?'
//        , System.UITypes.TMsgDlgType.mtInformation,
//       [
//         System.UITypes.TMsgDlgBtn.mbYes,
//         System.UITypes.TMsgDlgBtn.mbNo
//       ], 0,
//       procedure (const AResult: TModalResult)
//       begin
//         if AResult = mrYes then
//         begin
//          Intent := TJIntent.Create;
//          Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
//          Intent.setData(StrToJURI( UniQueryVersionCheck.FieldByName('URL').AsString ));
//          SharedActivity.startActivity(Intent);
//         end;
//       end
//       );
//    end;
//  end;
//  {$ENDIF ANDROID}

  if UniConnection1.Connected then
  begin
    UniQueryVersionCheck.Close;
    UniQueryVersionCheck.SQL.Text := 'Select * From PC_VERSION ';
    UniQueryVersionCheck.Open;
    if not (TextVersion.Text = UniQueryVersionCheck.FieldByName('VERSION').AsString) then
    begin
      MessageDlg('새로운 버전이 있습니다.'+#13+'업데이트 하시겠습니까?'
        , System.UITypes.TMsgDlgType.mtInformation,
       [
         System.UITypes.TMsgDlgBtn.mbYes,
         System.UITypes.TMsgDlgBtn.mbNo
       ], 0,
       procedure (const AResult: TModalResult)
       begin
         if AResult = mrYes then
         begin
           ShellExecute(0, 'open', PChar(UniQueryVersionCheck.FieldByName('URL').AsString), nil, nil, SW_SHOWNORMAL);
           Application.Terminate;
         end;
       end
       );
    end;
  end;

  PermissionsService.RequestPermissions(['android.permission.POST_NOTIFICATIONS'],
    procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
    begin
      if AGrantResults[0] = TPermissionStatus.Granted then
        // Permission was granted
    end
  );
  try
    UniConnection1.Connected := True;
    UniQueryLogin.Close;
    UniQueryLogin.SQL.Clear;
    //UniQueryLogin.SQL.Add('Exec usp_User @Option = ''O'', @LoginID = :LoginID');
        // 250317 김동휘 쿼리로 수정
    UniQueryLogin.sql.add(' SELECT UserID ,MasterID ,LoginID ,Password ,Name ,Position				  ');
    UniQueryLogin.sql.add(' FROM MasterUser WHERE	BINARY_CHECKSUM(LoginID)  = BINARY_CHECKSUM(:LoginID) ');
    UniQueryLogin.sql.add(' AND  LoginID <> ''수정해주세요''											  ');
    UniQueryLogin.ParamByName('LoginID').AsString := EditID.Text;
    UniQueryLogin.ExecSQL;

    if UniQueryLogin.RecordCount = 0 then
    begin
      Showmessage('아이디가 틀렸습니다.');
    end else if UniQueryLogin.FieldByName('Password').AsString = EditPW.Text then
    begin
      sPath := TPath.Combine(TPath.GetDocumentsPath, 'Env.ini');
      iFile := TIniFile.Create(sPath);
      try
        iFile.WriteString('Login' ,'login_Id', EditID.Text);
        iFile.WriteString('Login', 'login_Password', EditPW.Text);
        if CheckBoxLoginAuto.IsChecked then
          iFile.WriteString('Login', 'login_Auto', 'Y')
        else
          iFile.WriteString('Login', 'login_Auto', 'N');
      finally
        iFile.DisposeOf;
      end;
      MasterUserID := UniQueryLogin.FieldByName('MasterID').AsInteger;
      Company := UniQueryLogin.FieldByName('Name').AsString;
      if UniQueryLogin.FieldByName('Position').AsString = '관리자' then
      begin
        MasterCheck := True;
        Msg := EditID.Text+'(PC)가 접속되었습니다';
      end else
      begin
        MasterCheck := False;
        Msg := EditID.Text+'(부-PC)가 접속되었습니다';
      end;

      RectangleMain1Set.Enabled := MasterCheck;
      RectangleMain2Set.Enabled := MasterCheck;
      RectangleMain3Set.Enabled := MasterCheck;
//      RectangleMember.Visible := MasterCheck;
      ImageManage.Visible := MasterCheck;

    // 로그인 푸시알람////////////////////////////////////////////////////////
// 로그인 알람
      UniQuery_LoginA1.Close;
      UniQuery_LoginA1.SQL.Clear;
      UniQuery_LoginA1.SQL.Add('select top 1 push_token, reg_date from tb_user_info as TUI');
      UniQuery_LoginA1.SQL.Add('Inner Join MasterUser as M');
      UniQuery_LoginA1.SQL.Add('On TUI.user_id = M.LoginID');
      UniQuery_LoginA1.SQL.Add('where M.MasterID = '+inttostr(MasterUserID));
      UniQuery_LoginA1.SQL.Add('and Position = ''관리자'' ');
      UniQuery_LoginA1.SQL.Add('and TUI.reg_date >= GETDATE() - 30');
      UniQuery_LoginA1.SQL.Add('Group by push_token, reg_date ');
      UniQuery_LoginA1.SQL.Add('ORDER BY reg_date desc ');
      UniQuery_LoginA1.Open;

      pushToken := UniQuery_LoginA1.FieldByName('push_token').AsString;

      UniQuery_LoginA2.SQL.Clear;
      if UniQuery_LoginA1.RecordCount > 0 then
      begin
        for I := 1 to UniQuery_LoginA1.RecordCount do
        begin
          if pushToken <> '' then
          begin
  //          JArr.Add(FDQuery2.FieldByName('push_token').AsString);
            UniQuery_LoginA2.SQL.Add('Insert Into PushData(Token, Title, Msg, InsertTime)');
            UniQuery_LoginA2.SQL.Add('Values('+#39+pushToken+#39);
            UniQuery_LoginA2.SQL.Add(','+#39+'로그인 알림'+#39+','+#39+Msg+#39+', GETDATE())');
          end;
          UniQuery_LoginA1.Next;
        end;
        UniQuery_LoginA2.ExecSQL;
      end;

      ControllerAllSearch;
      TabControl1.ActiveTab := TabItemMain;
      fDongHwa.WindowState := TWindowState.wsMaximized;
      Resize;

  //    Timer1.OnTimer := ControllerRefresh;
  //    Timer1.Enabled := True;
    end else
    begin
      Showmessage('비밀번호가 틀렸습니다.');
    end;
  except
    Showmessage('인터넷 상태를 확인해 주세요');
  end;
  TWaitDialog.Hide;
end;

procedure TfDongHwa.MainRefresh;
var
  Index : Integer;
  i,j : integer;
  AlarmCheck : Boolean;
  test : integer;
             test1 : string;

  procedure Main1PlusVisible;
  begin
    ImageMain1Plus.Visible := false;
    ImageMain1Logo.Visible := true;
    TextMain1Name.Text := '';
    TextMain1Model.Text := '';
    TextMain1TempL.Text := '';// : ';
    TextMain1SetTempL.Text := '';// : ';
    TextMain1Temp.Text   := '';
    TextMain1SetTemp.Text:= '';
    TextMain1RTopC1.Text := '';
    TextMain1RTopC2.Text := '';
    TextMain1RTopC3.Text := '';
    TextMain1RTopC4.Text := '';
    TextMain1RTopC5.Text := '';
    TextMain1RClientC1.Text := '';
    TextMain1RClientC2.Text := '';
    TextMain1RClientC3.Text := '';
    TextMain1RClientC4.Text := '';
    TextMain1RClientC5.Text := '';
    TextMain1RTop.Text    := '';
    TextMain1RClient.Text := '';
    TextMain1RTop.Visible    := false;
    LayoutMain1RTopC.Visible := false;
    TextMain1RClient.Visible := false;
    LayoutMain1RClientC.Visible := false;
    ImageMain1.Visible := false;
    RectangleMain1.Hint := 'A';
    RectangleMain1Client.Hint := 'A';
    RectangleMain1Right.Hint  := 'A';
    ImageAlarm1.Visible := false;
    TextMain1Serial.Text := '';
    TextMain1inDate.Text := '';
  end;
  procedure Main2PlusVisible;
  begin
    ImageMain2Plus.Visible := false;
    ImageMain2Logo.Visible := true;
    TextMain2Name.Text := '';
    TextMain2Model.Text := '';
    TextMain2TempL.Text := '';// : ';
    TextMain2SetTempL.Text := '';// : ';
    TextMain2Temp.Text   := '';
    TextMain2SetTemp.Text:= '';
    TextMain2RTopC1.Text := '';
    TextMain2RTopC2.Text := '';
    TextMain2RTopC3.Text := '';
    TextMain2RTopC4.Text := '';
    TextMain2RTopC5.Text := '';
    TextMain2RClientC1.Text := '';
    TextMain2RClientC2.Text := '';
    TextMain2RClientC3.Text := '';
    TextMain2RClientC4.Text := '';
    TextMain2RClientC5.Text := '';
    TextMain2RTop.Text    := '';
    TextMain2RClient.Text := '';
    TextMain2RTop.Visible    := false;
    LayoutMain2RTopC.Visible := false;
    TextMain2RClient.Visible := false;
    LayoutMain2RClientC.Visible := false;
    ImageMain2.Visible := false;
    RectangleMain2Alarm.Visible := False;
    FloatAnimation2.Enabled := False;
    RectangleMain2.Hint := 'A';
    RectangleMain2Client.Hint := 'A';
    RectangleMain2Right.Hint  := 'A';
    ImageAlarm2.Visible := false;
    TextMain2Serial.Text := '';
    TextMain2inDate.Text := '';
  end;
  procedure Main3PlusVisible;
  begin
    ImageMain3Plus.Visible := false;
    ImageMain3Logo.Visible := true;
    TextMain3Name.Text := '';
    TextMain3Model.Text := '';
    TextMain3Temp.Text   := '';
    TextMain3SetTemp.Text:= '';
    TextMain3TempL.Text := '';// : ';
    TextMain3SetTempL.Text := '';// : ';
    TextMain3RTopC1.Text := '';
    TextMain3RTopC2.Text := '';
    TextMain3RTopC3.Text := '';
    TextMain3RTopC4.Text := '';
    TextMain3RTopC5.Text := '';
    TextMain3RClientC1.Text := '';
    TextMain3RClientC2.Text := '';
    TextMain3RClientC3.Text := '';
    TextMain3RClientC4.Text := '';
    TextMain3RClientC5.Text := '';
    TextMain3RTop.Text    := '';
    TextMain3RClient.Text := '';
    TextMain3RTop.Visible    := false;
    LayoutMain3RTopC.Visible := false;
    TextMain3RClient.Visible := false;
    LayoutMain3RClientC.Visible := false;
    ImageMain3.Visible := false;
    RectangleMain3Alarm.Visible := False;
    FloatAnimation3.Enabled := False;
    RectangleMain3.Hint := 'A';
    RectangleMain3Client.Hint := 'A';
    RectangleMain3Right.Hint  := 'A';
    ImageAlarm3.Visible := false;
    TextMain3Serial.Text := '';
    TextMain3inDate.Text := '';
  end;

  procedure Main4PlusVisible;
  begin
    ImageMain4Plus.Visible := false;
    ImageMain4Logo.Visible := true;
    TextMain4Name.Text := '';
    TextMain4Model.Text := '';
    TextMain4Temp.Text   := '';
    TextMain4SetTemp.Text:= '';
    TextMain4TempL.Text := '';// : ';
    TextMain4SetTempL.Text := '';// : ';
    TextMain4RTopC1.Text := '';
    TextMain4RTopC2.Text := '';
    TextMain4RTopC3.Text := '';
    TextMain4RTopC4.Text := '';
    TextMain4RTopC5.Text := '';
    TextMain4RClientC1.Text := '';
    TextMain4RClientC2.Text := '';
    TextMain4RClientC3.Text := '';
    TextMain4RClientC4.Text := '';
    TextMain4RClientC5.Text := '';
    TextMain4RTop.Text    := '';
    TextMain4RClient.Text := '';
    TextMain4RTop.Visible    := false;
    LayoutMain4RTopC.Visible := false;
    TextMain4RClient.Visible := false;
    LayoutMain4RClientC.Visible := false;
    ImageMain4.Visible := false;
    RectangleMain4Alarm.Visible := False;
    FloatAnimation4.Enabled := False;
    RectangleMain4.Hint := 'A';
    RectangleMain4Client.Hint := 'A';
    RectangleMain4Right.Hint  := 'A';
    ImageAlarm4.Visible := false;
    TextMain4Serial.Text := '';
    TextMain4inDate.Text := '';
  end;

  procedure main5PlusVisible;
  begin
    Imagemain5Plus.Visible := false;
    ImageMain5Logo.Visible := true;
    Textmain5Name.Text := '';
    Textmain5Model.Text := '';
    TextMain5Temp.Text   := '';
    TextMain5SetTemp.Text:= '';
    Textmain5TempL.Text := '';// : ';
    Textmain5SetTempL.Text := '';// : ';
    Textmain5RTopC1.Text := '';
    Textmain5RTopC2.Text := '';
    Textmain5RTopC3.Text := '';
    Textmain5RTopC4.Text := '';
    Textmain5RTopC5.Text := '';
    Textmain5RClientC1.Text := '';
    Textmain5RClientC2.Text := '';
    Textmain5RClientC3.Text := '';
    Textmain5RClientC4.Text := '';
    Textmain5RClientC5.Text := '';
    TextMain5RTop.Text    := '';
    TextMain5RClient.Text := '';
    TextMain5RTop.Visible    := false;
    LayoutMain5RTopC.Visible := false;
    TextMain5RClient.Visible := false;
    LayoutMain5RClientC.Visible := false;
    ImageMain5.Visible := false;
    Rectanglemain5Alarm.Visible := False;
    FloatAnimation5.Enabled := False;
    RectangleMain5.Hint := 'A';
    RectangleMain5Client.Hint := 'A';
    RectangleMain5Right.Hint  := 'A';
    imageAlarm5.Visible := false;
    TextMain5Serial.Text := '';
    TextMain5inDate.Text := '';
  end;

  procedure main6PlusVisible;
  begin
    Imagemain6Plus.Visible := false;
    ImageMain6Logo.Visible := true;
    Textmain6Name.Text := '';
    Textmain6Model.Text := '';
    TextMain6Temp.Text   := '';
    TextMain6SetTemp.Text:= '';
    Textmain6TempL.Text := '';// : ';
    Textmain6SetTempL.Text := '';// : ';
    Textmain6RTopC1.Text := '';
    Textmain6RTopC2.Text := '';
    Textmain6RTopC3.Text := '';
    Textmain6RTopC4.Text := '';
    Textmain6RTopC5.Text := '';
    Textmain6RClientC1.Text := '';
    Textmain6RClientC2.Text := '';
    Textmain6RClientC3.Text := '';
    Textmain6RClientC4.Text := '';
    Textmain6RClientC5.Text := '';
    TextMain6RTop.Text    := '';
    TextMain6RClient.Text := '';
    TextMain6RTop.Visible    := false;
    LayoutMain6RTopC.Visible := false;
    TextMain6RClient.Visible := false;
    LayoutMain6RClientC.Visible := false;
    ImageMain6.Visible := false;
    Rectanglemain6Alarm.Visible := False;
    FloatAnimation6.Enabled := False;
    RectangleMain6.Hint := 'A';
    RectangleMain6Client.Hint := 'A';
    RectangleMain6Right.Hint  := 'A';
    imageAlarm6.Visible := false;
    TextMain6Serial.Text := '';
    TextMain6inDate.Text := '';
  end;

  procedure Main7PlusVisible;
  begin
    ImageMain7Plus.Visible := false;
    ImageMain7Logo.Visible := true;
    TextMain7Name.Text := '';
    TextMain7Model.Text := '';
    TextMain7Temp.Text   := '';
    TextMain7SetTemp.Text:= '';
    TextMain7TempL.Text := '';// : ';
    TextMain7SetTempL.Text := '';// : ';
    TextMain7RTopC1.Text := '';
    TextMain7RTopC2.Text := '';
    TextMain7RTopC3.Text := '';
    TextMain7RTopC4.Text := '';
    TextMain7RTopC5.Text := '';
    TextMain7RClientC1.Text := '';
    TextMain7RClientC2.Text := '';
    TextMain7RClientC3.Text := '';
    TextMain7RClientC4.Text := '';
    TextMain7RClientC5.Text := '';
    TextMain7RTop.Text    := '';
    TextMain7RClient.Text := '';
    TextMain7RTop.Visible    := false;
    LayoutMain7RTopC.Visible := false;
    TextMain7RClient.Visible := false;
    LayoutMain7RClientC.Visible := false;
    ImageMain7.Visible := false;
    RectangleMain7Alarm.Visible := False;
    FloatAnimation7.Enabled := False;
    RectangleMain7.Hint := 'A';
    RectangleMain7Client.Hint := 'A';
    RectangleMain7Right.Hint  := 'A';
    imageAlarm7.Visible := false;
    TextMain7Serial.Text := '';
    TextMain7inDate.Text := '';
  end;

  procedure Main8PlusVisible;
  begin
    ImageMain8Plus.Visible := false;
    ImageMain8Logo.Visible := true;
    TextMain8Name.Text := '';
    TextMain8Model.Text := '';
    TextMain8Temp.Text   := '';
    TextMain8SetTemp.Text:= '';
    TextMain8TempL.Text := '';// : ';
    TextMain8SetTempL.Text := '';// : ';
    TextMain8RTopC1.Text := '';
    TextMain8RTopC2.Text := '';
    TextMain8RTopC3.Text := '';
    TextMain8RTopC4.Text := '';
    TextMain8RTopC5.Text := '';
    TextMain8RClientC1.Text := '';
    TextMain8RClientC2.Text := '';
    TextMain8RClientC3.Text := '';
    TextMain8RClientC4.Text := '';
    TextMain8RClientC5.Text := '';
    TextMain8RTop.Text    := '';
    TextMain8RClient.Text := '';
    TextMain8RTop.Visible    := false;
    LayoutMain8RTopC.Visible := false;
    TextMain8RClient.Visible := false;
    LayoutMain8RClientC.Visible := false;
    ImageMain8.Visible := false;
    RectangleMain8Alarm.Visible := False;
    FloatAnimation8.Enabled := False;
    RectangleMain8.Hint := 'A';
    RectangleMain8Client.Hint := 'A';
    RectangleMain8Right.Hint  := 'A';
    imageAlarm8.Visible := false;
    TextMain8Serial.Text := '';
    TextMain8inDate.Text := '';
  end;

  procedure Main9PlusVisible;
  begin
    ImageMain9Plus.Visible := false;
    ImageMain9Logo.Visible := true;
    TextMain9Name.Text := '';
    TextMain9Model.Text := '';
    TextMain9Temp.Text   := '';
    TextMain9SetTemp.Text:= '';
    TextMain9TempL.Text := '';// : ';
    TextMain9SetTempL.Text := '';// : ';
    TextMain9RTopC1.Text := '';
    TextMain9RTopC2.Text := '';
    TextMain9RTopC3.Text := '';
    TextMain9RTopC4.Text := '';
    TextMain9RTopC5.Text := '';
    TextMain9RClientC1.Text := '';
    TextMain9RClientC2.Text := '';
    TextMain9RClientC3.Text := '';
    TextMain9RClientC4.Text := '';
    TextMain9RClientC5.Text := '';
    TextMain9RTop.Text    := '';
    TextMain9RClient.Text := '';
    TextMain9RTop.Visible    := false;
    LayoutMain9RTopC.Visible := false;
    TextMain9RClient.Visible := false;
    LayoutMain9RClientC.Visible := false;
    ImageMain9.Visible := false;
    RectangleMain9Alarm.Visible := False;
    FloatAnimation9.Enabled := False;
    RectangleMain9.Hint := 'A';
    RectangleMain9Client.Hint := 'A';
    RectangleMain9Right.Hint  := 'A';
    imageAlarm9.Visible := false;
    TextMain9Serial.Text := '';
    TextMain9inDate.Text := '';
  end;

  procedure Main10PlusVisible;
  begin
    ImageMain10Plus.Visible := false;
    ImageMain10Logo.Visible := true;
    TextMain10Name.Text := '';
    TextMain10Model.Text := '';
    TextMain10Temp.Text   := '';
    TextMain10SetTemp.Text:= '';
    TextMain10TempL.Text := '';// : ';
    TextMain10SetTempL.Text := '';// : ';
    TextMain10RTopC1.Text := '';
    TextMain10RTopC2.Text := '';
    TextMain10RTopC3.Text := '';
    TextMain10RTopC4.Text := '';
    TextMain10RTopC5.Text := '';
    TextMain10RClientC1.Text := '';
    TextMain10RClientC2.Text := '';
    TextMain10RClientC3.Text := '';
    TextMain10RClientC4.Text := '';
    TextMain10RClientC5.Text := '';
    TextMain10RTop.Text    := '';
    TextMain10RClient.Text := '';
    TextMain10RTop.Visible    := false;
    LayoutMain10RTopC.Visible := false;
    TextMain10RClient.Visible := false;
    LayoutMain10RClientC.Visible := false;
    ImageMain10.Visible := false;
    RectangleMain10Alarm.Visible := False;
    FloatAnimation10.Enabled := False;
    RectangleMain10.Hint := 'A';
    RectangleMain10Client.Hint := 'A';
    RectangleMain10Right.Hint  := 'A';
    imageAlarm10.Visible := false;
    TextMain10Serial.Text := '';
    TextMain10inDate.Text := '';
  end;

  procedure Main11PlusVisible;
  begin
    ImageMain11Plus.Visible := false;
    ImageMain11Logo.Visible := true;
    TextMain11Name.Text := '';
    TextMain11Model.Text := '';
    TextMain11Temp.Text   := '';
    TextMain11SetTemp.Text:= '';
    TextMain11TempL.Text := '';// : ';
    TextMain11SetTempL.Text := '';// : ';
    TextMain11RTopC1.Text := '';
    TextMain11RTopC2.Text := '';
    TextMain11RTopC3.Text := '';
    TextMain11RTopC4.Text := '';
    TextMain11RTopC5.Text := '';
    TextMain11RClientC1.Text := '';
    TextMain11RClientC2.Text := '';
    TextMain11RClientC3.Text := '';
    TextMain11RClientC4.Text := '';
    TextMain11RClientC5.Text := '';
    TextMain11RTop.Text    := '';
    TextMain11RClient.Text := '';
    TextMain11RTop.Visible    := false;
    LayoutMain11RTopC.Visible := false;
    TextMain11RClient.Visible := false;
    LayoutMain11RClientC.Visible := false;
    ImageMain11.Visible := false;
    RectangleMain11Alarm.Visible := False;
    FloatAnimation11.Enabled := False;
    RectangleMain11.Hint := 'A';
    RectangleMain11Client.Hint := 'A';
    RectangleMain11Right.Hint  := 'A';
    imageAlarm11.Visible := false;
    TextMain11Serial.Text := '';
    TextMain11inDate.Text := '';
  end;

  procedure Main12PlusVisible;
  begin
    ImageMain12Plus.Visible := false;
    ImageMain12Logo.Visible := true;
    TextMain12Name.Text := '';
    TextMain12Model.Text := '';
    TextMain12Temp.Text   := '';
    TextMain12SetTemp.Text:= '';
    TextMain12TempL.Text := '';// : ';
    TextMain12SetTempL.Text := '';// : ';
    TextMain12RTopC1.Text := '';
    TextMain12RTopC2.Text := '';
    TextMain12RTopC3.Text := '';
    TextMain12RTopC4.Text := '';
    TextMain12RTopC5.Text := '';
    TextMain12RClientC1.Text := '';
    TextMain12RClientC2.Text := '';
    TextMain12RClientC3.Text := '';
    TextMain12RClientC4.Text := '';
    TextMain12RClientC5.Text := '';
    TextMain12RTop.Text    := '';
    TextMain12RClient.Text := '';
    TextMain12RTop.Visible    := false;
    LayoutMain12RTopC.Visible := false;
    TextMain12RClient.Visible := false;
    LayoutMain12RClientC.Visible := false;
    ImageMain12.Visible := false;
    RectangleMain12Alarm.Visible := False;
    FloatAnimation12.Enabled := False;
    RectangleMain12.Hint       := 'A';
    RectangleMain12Client.Hint := 'A';
    RectangleMain12Right.Hint  := 'A';
    ImageAlarm12.Visible := false;
    TextMain12Serial.Text := '';
    TextMain12inDate.Text := '';
  end;

begin
  if TabControl1.ActiveTab = TabItemMain then
  begin
    try
      Rectangletop.Visible := true;
      AlarmCheck := False;
      With UniQueryTempCheck do
      begin
        // 여기서 경보 전체 검색 후, 한개라도 있으면 소리 경보 시작, 1분 - 5분 - 1분??

        UniQueryTempCheck2.Close;
        UniQueryTempCheck2.SQL.Clear;
        UniQueryTempCheck2.SQL.Add('Select Count(C.ControllerID) as C from Alarm as A');
        UniQueryTempCheck2.SQL.Add('Inner Join ControllerInfo as C');
        UniQueryTempCheck2.SQL.Add('On A.ControllerID = C.ControllerID');
        UniQueryTempCheck2.SQL.Add('Where C.MasterID = '+MasterUserID.ToString);
//        SQL.Add('And A.EndTime IS NULL');
        UniQueryTempCheck2.Open;

        if UniQueryTempCheck2.FieldByName('C').AsInteger > 0 then
        begin
          ImageAlarm.MultiResBitmap := ImageAlarmO.MultiResBitmap;
        end else
        begin
          ImageAlarm.MultiResBitmap := ImageAlarmX.MultiResBitmap;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Exec usp_Temp @Option = ''A'', @MasterID = :MasterID, @Page = :Page, @PAGE_SIZE = :PAGE_SIZE ');
        ParamByName('MasterID').AsInteger := MasterUserID;
        ParamByName('Page').AsInteger := Page;
        ParamByName('PAGE_SIZE').AsInteger := 12;
        Open;

        for I := 1 to 12 do
        begin
          MainRect[i].Hint        := '';
          TextMainRTop[i].text    := '입력';
          TextMainRClient[i].Text := '출력';
        end;

        if UniQueryTempCheck.RecordCount > 0 then
        begin
          First;

          for i := 1 to 12 do
          begin
            ControllerID[i] := 0;
            ControllerHighTemp[i] := 50;
            ControllerLowTemp[i] := -10;
          end;

//          for I := 1 to RecordCount do
//          begin
//            MainRect[i].Visible := true;
//          end;

          for i := 1 to 12 do
          begin
            for j := 1 to 5 do
            begin
              DIn[i][j] := False;
              DOut[i][j] := False;
            end;
          end;


          Index := 1;
          ImageMain1Plus.Visible := False;
          ImageMain1Logo.Visible := False;
          ImageMain1.Visible := true;
          LayoutMain1RClientC.Visible := true;
          RectangleMain1Client.Hint := '';
          RectangleMain1Right.Hint  := '';
          if FieldByName('ControllerName').AsString = '' then
          begin
            TextMain1Name.Text := '단말기'+(((Page-1)*3)+1).ToString;
          end else
          begin
            TextMain1Name.Text := FieldByName('ControllerName').AsString;
          end;
          TextMain1Model.Text := FieldByName('ControllerModel').AsString;
          TextMain1Serial.Text := FieldByName('Serial').AsString;
          TextMain1inDate.Text := FieldByName('WDT').AsString;



          TextMain1TempL.Text  := FieldByName('TempName').AsString;
          TextMain1SetTempL.Text := FieldByName('SetTempName').AsString;
          TextMain1RTopC1.Text := FieldByName('In1').AsString;
          TextMain1RTopC2.Text := FieldByName('In2').AsString;
          TextMain1RTopC3.Text := FieldByName('In3').AsString;
          TextMain1RTopC4.Text := FieldByName('In4').AsString;
          TextMain1RTopC5.Text := FieldByName('In5').AsString;
          TextMain1RClientC1.Text := FieldByName('Out1').AsString;
          TextMain1RClientC2.Text := FieldByName('Out2').AsString;
          TextMain1RClientC3.Text := FieldByName('Out3').AsString;
          TextMain1RClientC4.Text := FieldByName('Out4').AsString;
          TextMain1RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then CircleMain1RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then CircleMain1RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColor(65280)// TAlphaColors.Greenyellow
                            else CircleMain1RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then CircleMain1RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then CircleMain1RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain1RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then CircleMain1RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then CircleMain1RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain1RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then CircleMain1RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then CircleMain1RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain1RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then CircleMain1RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then CircleMain1RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain1RClientC5.Fill.Color := TAlphaColors.Lightgray;

          if FieldByName('InCount').AsInteger = 0 then
          begin
            TextMain1RTop.Text := '';
          end;

          if PreMain1InCount <> FieldByName('InCount').AsInteger then
          begin
            PreMain1InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain1RTopC1.Visible := True;
              LayoutMain1RTopC2.Visible := True;
              LayoutMain1RTopC3.Visible := True;
              LayoutMain1RTopC4.Visible := True;
              LayoutMain1RTopC5.Visible := True;
              LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 5;
              LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 5;
              LayoutMain1RTopC4.Width := LayoutMain1RTopC.Width / 5;
              LayoutMain1RTopC5.Width := LayoutMain1RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain1RTopC1.Visible := True;
              LayoutMain1RTopC2.Visible := True;
              LayoutMain1RTopC3.Visible := True;
              LayoutMain1RTopC4.Visible := True;
              LayoutMain1RTopC5.Visible := False;
              LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 4;
              LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 4;
              LayoutMain1RTopC4.Width := LayoutMain1RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain1RTopC1.Visible := True;
              LayoutMain1RTopC2.Visible := True;
              LayoutMain1RTopC3.Visible := True;
              LayoutMain1RTopC4.Visible := False;
              LayoutMain1RTopC5.Visible := False;
              LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 3;
              LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain1RTopC1.Visible := True;
              LayoutMain1RTopC2.Visible := True;
              LayoutMain1RTopC3.Visible := False;
              LayoutMain1RTopC4.Visible := False;
              LayoutMain1RTopC5.Visible := False;
              LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 2;
              LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain1RTopC1.Visible := True;
              LayoutMain1RTopC2.Visible := False;
              LayoutMain1RTopC3.Visible := False;
              LayoutMain1RTopC4.Visible := False;
              LayoutMain1RTopC5.Visible := False;
              LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width;
            end else
            begin
              LayoutMain1RTopC1.Visible := False;
              LayoutMain1RTopC2.Visible := False;
              LayoutMain1RTopC3.Visible := False;
              LayoutMain1RTopC4.Visible := False;
              LayoutMain1RTopC5.Visible := False;
            end;
          end;

          if PreIndex11 <> FieldByName('K1Index').AsInteger then
          begin
            if FieldByName('K1Index').AsInteger = 1 then
            begin
              LayoutMain1RClientC1.Align := TAlignLayout.MostLeft;
            end else if FieldByName('K1Index').AsInteger = 2 then
            begin
              LayoutMain1RClientC1.Align := TAlignLayout.Left;
            end else if FieldByName('K1Index').AsInteger = 3 then
            begin
              LayoutMain1RClientC1.Align := TAlignLayout.Client;
            end else if FieldByName('K1Index').AsInteger = 4 then
            begin
              LayoutMain1RClientC1.Align := TAlignLayout.Right;
            end else if FieldByName('K1Index').AsInteger = 5 then
            begin
              LayoutMain1RClientC1.Align := TAlignLayout.MostRight;
            end;
          end;
          if PreIndex12 <> FieldByName('K2Index').AsInteger then
          begin
            if FieldByName('K2Index').AsInteger = 1 then
            begin
              LayoutMain1RClientC2.Align := TAlignLayout.MostLeft;
            end else if FieldByName('K2Index').AsInteger = 2 then
            begin
              LayoutMain1RClientC2.Align := TAlignLayout.Left;
            end else if FieldByName('K2Index').AsInteger = 3 then
            begin
              LayoutMain1RClientC2.Align := TAlignLayout.Client;
            end else if FieldByName('K2Index').AsInteger = 4 then
            begin
              LayoutMain1RClientC2.Align := TAlignLayout.Right;
            end else if FieldByName('K2Index').AsInteger = 5 then
            begin
              LayoutMain1RClientC2.Align := TAlignLayout.MostRight;
            end;
          end;
          if PreIndex13 <> FieldByName('K3Index').AsInteger then
          begin
            if FieldByName('K3Index').AsInteger = 1 then
            begin
              LayoutMain1RClientC3.Align := TAlignLayout.MostLeft;
            end else if FieldByName('K3Index').AsInteger = 2 then
            begin
              LayoutMain1RClientC3.Align := TAlignLayout.Left;
            end else if FieldByName('K3Index').AsInteger = 3 then
            begin
              LayoutMain1RClientC3.Align := TAlignLayout.Client;
            end else if FieldByName('K3Index').AsInteger = 4 then
            begin
              LayoutMain1RClientC3.Align := TAlignLayout.Right;
            end else if FieldByName('K3Index').AsInteger = 5 then
            begin
              LayoutMain1RClientC3.Align := TAlignLayout.MostRight;
            end;
          end;
          if PreIndex14 <> FieldByName('K4Index').AsInteger then
          begin
            if FieldByName('K4Index').AsInteger = 1 then
            begin
              LayoutMain1RClientC4.Align := TAlignLayout.MostLeft;
            end else if FieldByName('K4Index').AsInteger = 2 then
            begin
              LayoutMain1RClientC4.Align := TAlignLayout.Left;
            end else if FieldByName('K4Index').AsInteger = 3 then
            begin
              LayoutMain1RClientC4.Align := TAlignLayout.Client;
            end else if FieldByName('K4Index').AsInteger = 4 then
            begin
              LayoutMain1RClientC4.Align := TAlignLayout.Right;
            end else if FieldByName('K4Index').AsInteger = 5 then
            begin
              LayoutMain1RClientC4.Align := TAlignLayout.MostRight;
            end;
          end;
          if PreIndex15 <> FieldByName('K5Index').AsInteger then
          begin
            if FieldByName('K5Index').AsInteger = 1 then
            begin
              LayoutMain1RClientC5.Align := TAlignLayout.MostLeft;
            end else if FieldByName('K5Index').AsInteger = 2 then
            begin
              LayoutMain1RClientC5.Align := TAlignLayout.Left;
            end else if FieldByName('K5Index').AsInteger = 3 then
            begin
              LayoutMain1RClientC5.Align := TAlignLayout.Client;
            end else if FieldByName('K5Index').AsInteger = 4 then
            begin
              LayoutMain1RClientC5.Align := TAlignLayout.Right;
            end else if FieldByName('K5Index').AsInteger = 5 then
            begin
              LayoutMain1RClientC5.Align := TAlignLayout.MostRight;
            end;
          end;

          if FieldByName('OutCount').AsInteger = 0 then
          begin
            LayoutMain1RClientC.Visible := false;
            TextMain1RClient.Visible := false;
            TextMain1RClient.Text := '';
          end
          else
          begin
            LayoutMain1RClientC.Visible := true;
            TextMain1RClient.Visible := true;
            TextMain1RClient.Text    := '출력';
          end;

          if PreMain1OutCount <> FieldByName('OutCount').AsInteger then
          begin
            PreMain1OutCount := FieldByName('OutCount').AsInteger;

            // visible false 에따라
            // 순서에따라 MostLeft
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain1RClientC1.Visible := True;
              LayoutMain1RClientC2.Visible := True;
              LayoutMain1RClientC3.Visible := True;
              LayoutMain1RClientC4.Visible := True;
              LayoutMain1RClientC5.Visible := True;
              LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 5;
              LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 5;
              LayoutMain1RClientC4.Width := LayoutMain1RClientC.Width / 5;
              LayoutMain1RClientC5.Width := LayoutMain1RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain1RClientC1.Visible := True;
              LayoutMain1RClientC2.Visible := True;
              LayoutMain1RClientC3.Visible := True;
              LayoutMain1RClientC4.Visible := True;
              LayoutMain1RClientC5.Visible := False;
              LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 4;
              LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 4;
              LayoutMain1RClientC4.Width := LayoutMain1RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain1RClientC1.Visible := True;
              LayoutMain1RClientC2.Visible := True;
              LayoutMain1RClientC3.Visible := True;
              LayoutMain1RClientC4.Visible := False;
              LayoutMain1RClientC5.Visible := False;
              LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 3;
              LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain1RClientC1.Visible := True;
              LayoutMain1RClientC2.Visible := True;
              LayoutMain1RClientC3.Visible := False;
              LayoutMain1RClientC4.Visible := False;
              LayoutMain1RClientC5.Visible := False;
              LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 2;
              LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain1RClientC1.Visible := True;
              LayoutMain1RClientC2.Visible := False;
              LayoutMain1RClientC3.Visible := False;
              LayoutMain1RClientC4.Visible := False;
              LayoutMain1RClientC5.Visible := False;
              LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width;
            end else
            begin
              LayoutMain1RClientC1.Visible := False;
              LayoutMain1RClientC2.Visible := False;
              LayoutMain1RClientC3.Visible := False;
              LayoutMain1RClientC4.Visible := False;
              LayoutMain1RClientC5.Visible := False;
              LayoutMain1RClientC.Visible  := false;
            end;
          end;

          ControllerState[1] := False;
                                 // 1분 * 5
          if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
          begin
            ImageMain1.MultiResBitmap := ImageWifi3.MultiResBitmap;
            ControllerState[1] := True;
          end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
          begin
            ImageMain1.MultiResBitmap := ImageWifi2.MultiResBitmap;
            TextMain1Temp.Text := 'ER10';
            TextMain1SetTemp.Text := '연결끊김';
          end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
          begin
            ImageMain1.MultiResBitmap := ImageWifi1.MultiResBitmap;
            TextMain1Temp.Text := 'ER10';
            TextMain1SetTemp.Text := '연결끊김';
          end else
          begin
            ImageMain1.MultiResBitmap := ImageWifi0.MultiResBitmap;
            TextMain1Temp.Text := 'ER10';
            TextMain1SetTemp.Text := '연결끊김';
          end;

          if TextMain1Temp.Text = 'ER10' then
          begin
            CircleMain1RTopC1.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RClientC1.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RTopC2.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RClientC2.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RTopC3.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RClientC3.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RTopC4.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RClientC4.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RTopC5.Fill.Color := TAlphaColors.Lightgray;
            CircleMain1RClientC5.Fill.Color := TAlphaColors.Lightgray;
          end;

          ControllerID[Index] := FieldByName('ControllerID').AsInteger;
          ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
          ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
          DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
          DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
          if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
          begin
            TextMain1Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//            if RectangleMain1Set.Visible then
//            begin
              TextMain1SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
              TextMain1SetTemp.Hint := TextMain1SetTemp.Text;
              SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//            end;
          end else  if not FieldByName('PowerState').AsBoolean then
          begin
            TextMain1Temp.Text := 'OFF';
            TextMain1SetTemp.Text := 'OFF';
          end;

          if FieldByName('Err').AsString = '001' then
          begin
//            TextMain1Temp.TextSettings.Font.Size := TitleSize;
            TextMain1Temp.Text := 'ER1';
            //TextMain1SetTemp.TextSettings.Font.Size := TitleSize;
            TextMain1SetTemp.Text := 'SENSOR ERROR';                   {
          end else if FieldByName('Err').AsString = '010' then
          begin
            TextMain1Temp.TextSettings.Font.Size := TitleSize;
            TextMain1Temp.Text := 'MEMORY ERROR';
            TextMain1SetTemp.TextSettings.Font.Size := TitleSize;
            TextMain1SetTemp.Text := 'MEMORY ERROR';                   }
          end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
            or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
          begin
         //   TextMain1SetTemp.TextSettings.Font.Size := TitleSize;
            if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
            begin
              TextMain1SetTemp.Text := '온도과도상승';
            end else
            begin
              TextMain1SetTemp.Text := '온도과도하강';
            end;
          end else
          begin
           // TextMain1Temp.TextSettings.Font.Size := PCTempSize;
           // TextMain1SetTemp.TextSettings.Font.Size := PCTempSetSize;
            RectangleMain1Alarm.Visible := False;
            FloatAnimation1.Enabled := False;
          end;

          DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
          if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
          begin
            if FieldByName('Err').AsString = '001' then
            begin
              RectangleMain1Alarm.Visible := True;
              FloatAnimation1.Enabled := True;
              ImageAlarm1.Visible := true;  // 경보 떳으면 기록 추가  240911 김동휘 추가
              AlarmCheck := True;
              try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
              except

              end;                                                    {
            end else if FieldByName('Err').AsString = '010' then
            begin
              RectangleMain1Alarm.Visible := True;
              FloatAnimation1.Enabled := True;
              AlarmCheck := True;
              try
                if MediaPlayer1.State = TMediaState.Stopped then
                begin
                  MediaPlayer1.Play;
                end;
              except

              end;                                                     }
            end else  if TextMain1Temp.Text = 'ER10' then
            begin
              RectangleMain1Alarm.Visible := True;
              FloatAnimation1.Enabled := True;
              ImageAlarm1.Visible := true;
              AlarmCheck := True;
              try
//                if MediaPlayer1.State = TMediaState.Stopped then
//                begin
//                  MediaPlayer1.Play;
//                end;
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
              except

              end;
            end  else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              RectangleMain1Alarm.Visible := True;
              FloatAnimation1.Enabled := True;
              ImageAlarm1.Visible := true;
              AlarmCheck := True;
              try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
              except

              end;
            end else
            begin
              RectangleMain1Alarm.Visible := False;
              FloatAnimation1.Enabled := False;
            end;
          end else
          begin
            RectangleMain1Alarm.Visible := False;
            FloatAnimation1.Enabled := False;
          end;
          Next;

          if not Eof then
          begin
            Index := Index + 1;
            ImageMain2Plus.Visible := False;
            ImageMain2Logo.Visible := False;
            ImageMain2.Visible := true;
            RectangleMain2Client.Hint := '';
            RectangleMain2Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              TextMain2Name.Text := '단말기'+(((Page-1)*3)+2).ToString;
            end else
            begin
              TextMain2Name.Text := FieldByName('ControllerName').AsString;
            end;
            TextMain2Model.Text := FieldByName('ControllerModel').AsString;

            TextMain2Serial.Text := FieldByName('Serial').AsString;
            TextMain2inDate.Text := FieldByName('WDT').AsString;

            TextMain2TempL.Text := FieldByName('TempName').AsString;
            TextMain2SetTempL.Text := FieldByName('SetTempName').AsString;
            TextMain2RTopC1.Text := FieldByName('In1').AsString;
            TextMain2RTopC2.Text := FieldByName('In2').AsString;
            TextMain2RTopC3.Text := FieldByName('In3').AsString;
            TextMain2RTopC4.Text := FieldByName('In4').AsString;
            TextMain2RTopC5.Text := FieldByName('In5').AsString;
            TextMain2RClientC1.Text := FieldByName('Out1').AsString;
            TextMain2RClientC2.Text := FieldByName('Out2').AsString;
            TextMain2RClientC3.Text := FieldByName('Out3').AsString;
            TextMain2RClientC4.Text := FieldByName('Out4').AsString;
            TextMain2RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then CircleMain2RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then CircleMain2RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then CircleMain2RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then CircleMain2RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then CircleMain2RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then CircleMain2RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then CircleMain2RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then CircleMain2RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then CircleMain2RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then CircleMain2RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain2RTop.Text := '';
            end;

            if PreMain2InCount <> FieldByName('InCount').AsInteger then
            begin
              PreMain2InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                LayoutMain2RTopC1.Visible := True;
                LayoutMain2RTopC2.Visible := True;
                LayoutMain2RTopC3.Visible := True;
                LayoutMain2RTopC4.Visible := True;
                LayoutMain2RTopC5.Visible := True;
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 5;
                LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 5;
                LayoutMain2RTopC4.Width := LayoutMain2RTopC.Width / 5;
                LayoutMain2RTopC5.Width := LayoutMain2RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                LayoutMain2RTopC1.Visible := True;
                LayoutMain2RTopC2.Visible := True;
                LayoutMain2RTopC3.Visible := True;
                LayoutMain2RTopC4.Visible := True;
                LayoutMain2RTopC5.Visible := False;
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 4;
                LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 4;
                LayoutMain2RTopC4.Width := LayoutMain2RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                LayoutMain2RTopC1.Visible := True;
                LayoutMain2RTopC2.Visible := True;
                LayoutMain2RTopC3.Visible := True;
                LayoutMain2RTopC4.Visible := False;
                LayoutMain2RTopC5.Visible := False;
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 3;
                LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                LayoutMain2RTopC1.Visible := True;
                LayoutMain2RTopC2.Visible := True;
                LayoutMain2RTopC3.Visible := False;
                LayoutMain2RTopC4.Visible := False;
                LayoutMain2RTopC5.Visible := False;
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 2;
                LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                LayoutMain2RTopC1.Visible := True;
                LayoutMain2RTopC2.Visible := False;
                LayoutMain2RTopC3.Visible := False;
                LayoutMain2RTopC4.Visible := False;
                LayoutMain2RTopC5.Visible := False;
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width;
              end else
              begin
                LayoutMain2RTopC1.Visible := False;
                LayoutMain2RTopC2.Visible := False;
                LayoutMain2RTopC3.Visible := False;
                LayoutMain2RTopC4.Visible := False;
                LayoutMain2RTopC5.Visible := False;
              end;
            end;


            if PreIndex21 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                LayoutMain2RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                LayoutMain2RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                LayoutMain2RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                LayoutMain2RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                LayoutMain2RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex22 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                LayoutMain2RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                LayoutMain2RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                LayoutMain2RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                LayoutMain2RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                LayoutMain2RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex23 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                LayoutMain2RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                LayoutMain2RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                LayoutMain2RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                LayoutMain2RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                LayoutMain2RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex24 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                LayoutMain2RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                LayoutMain2RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                LayoutMain2RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                LayoutMain2RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                LayoutMain2RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex25 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                LayoutMain2RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                LayoutMain2RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                LayoutMain2RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                LayoutMain2RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                LayoutMain2RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain2RClientC.Visible := false;
              TextMain2RClient.Visible := false;
              TextMain2RClient.Text := '';
            end
            else
            begin
              LayoutMain2RClientC.Visible := true;
              TextMain2RClient.Visible := true;
              TextMain2RClient.Text    := '출력';
            end;

            if PreMain2OutCount <> FieldByName('OutCount').AsInteger then
            begin
              PreMain2OutCount := FieldByName('OutCount').AsInteger;

              if FieldByName('OutCount').AsInteger = 5 then
              begin
                LayoutMain2RClientC1.Visible := True;
                LayoutMain2RClientC2.Visible := True;
                LayoutMain2RClientC3.Visible := True;
                LayoutMain2RClientC4.Visible := True;
                LayoutMain2RClientC5.Visible := True;
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 5;
                LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 5;
                LayoutMain2RClientC4.Width := LayoutMain2RClientC.Width / 5;
                LayoutMain2RClientC5.Width := LayoutMain2RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                LayoutMain2RClientC1.Visible := True;
                LayoutMain2RClientC2.Visible := True;
                LayoutMain2RClientC3.Visible := True;
                LayoutMain2RClientC4.Visible := True;
                LayoutMain2RClientC5.Visible := False;
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 4;
                LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 4;
                LayoutMain2RClientC4.Width := LayoutMain2RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                LayoutMain2RClientC1.Visible := True;
                LayoutMain2RClientC2.Visible := True;
                LayoutMain2RClientC3.Visible := True;
                LayoutMain2RClientC4.Visible := False;
                LayoutMain2RClientC5.Visible := False;
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 3;
                LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                LayoutMain2RClientC1.Visible := True;
                LayoutMain2RClientC2.Visible := True;
                LayoutMain2RClientC3.Visible := False;
                LayoutMain2RClientC4.Visible := False;
                LayoutMain2RClientC5.Visible := False;
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 2;
                LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                LayoutMain2RClientC1.Visible := True;
                LayoutMain2RClientC2.Visible := False;
                LayoutMain2RClientC3.Visible := False;
                LayoutMain2RClientC4.Visible := False;
                LayoutMain2RClientC5.Visible := False;
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width;
              end else
              begin
                LayoutMain2RClientC1.Visible := False;
                LayoutMain2RClientC2.Visible := False;
                LayoutMain2RClientC3.Visible := False;
                LayoutMain2RClientC4.Visible := False;
                LayoutMain2RClientC5.Visible := False;
                 LayoutMain2RClientC.Visible := False;
              end;
            end;

            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              ImageMain2.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              ImageMain2.MultiResBitmap := ImageWifi2.MultiResBitmap;
              TextMain2Temp.Text := 'ER10';
              TextMain2SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              ImageMain2.MultiResBitmap := ImageWifi1.MultiResBitmap;
              TextMain2Temp.Text := 'ER10';
              TextMain2SetTemp.Text := '연결끊김';
            end else
            begin
              ImageMain2.MultiResBitmap := ImageWifi0.MultiResBitmap;
              TextMain2Temp.Text := 'ER10';
              TextMain2SetTemp.Text := '연결끊김';
            end;

            if TextMain2Temp.Text = 'ER10 ' then
            begin
              CircleMain2RTopC1.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RClientC1.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RTopC2.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RClientC2.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RTopC3.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RClientC3.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RTopC4.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RClientC4.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RTopC5.Fill.Color := TAlphaColors.Lightgray;
              CircleMain2RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              TextMain2Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if RectangleMain2Set.Visible then
//              begin
                TextMain2SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                TextMain2SetTemp.Hint := TextMain2SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else  if not FieldByName('PowerState').AsBoolean then
            begin
              TextMain2Temp.Text := 'OFF';
              TextMain2SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              TextMain2Temp.TextSettings.Font.Size := TitleSize;
              TextMain2Temp.Text := 'ER1';

              //TextMain2SetTemp.TextSettings.Font.Size := PCTitleSize;
              TextMain2SetTemp.Text := 'SENSOR ERROR';                 {
            end else if FieldByName('Err').AsString = '010' then
            begin
              TextMain2Temp.TextSettings.Font.Size := TitleSize;
              TextMain2Temp.Text := 'MEMORY ERROR';
              TextMain2SetTemp.TextSettings.Font.Size := TitleSize;
              TextMain2SetTemp.Text := 'MEMORY ERROR';                 }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              //TextMain2SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                TextMain2SetTemp.Text := '온도과도상승';
              end else
              begin
                TextMain2SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
              //TextMain2Temp.TextSettings.Font.Size := PCTempSize;
             // TextMain2SetTemp.TextSettings.Font.Size := PCTempSetSize;
              RectangleMain2Alarm.Visible := False;
              FloatAnimation2.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                RectangleMain2Alarm.Visible := True;
                FloatAnimation2.Enabled := True;
                ImageAlarm2.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;                                               {
              end else if FieldByName('Err').AsString = '010' then
              begin
                RectangleMain2Alarm.Visible := True;
                FloatAnimation2.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;                                              }
              end
              else  if TextMain2Temp.Text = 'ER10' then
              begin
                RectangleMain2Alarm.Visible := True;
                FloatAnimation2.Enabled := True;
                ImageAlarm2.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                RectangleMain2Alarm.Visible := True;
                FloatAnimation2.Enabled := True;
                ImageAlarm2.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                RectangleMain2Alarm.Visible := False;
                FloatAnimation2.Enabled := False;
              end;
            end else
            begin
              RectangleMain2Alarm.Visible := False;
              FloatAnimation2.Enabled := False;
            end;

            Next;
          end else
          begin
            Main2PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            ImageMain3Plus.Visible := False;
            ImageMain3Logo.Visible := False;
            ImageMain3.Visible := true;
            RectangleMain3Client.Hint := '';
            RectangleMain3Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              TextMain3Name.Text := '단말기'+(((Page-1)*3)+3).ToString;
            end else
            begin
              TextMain3Name.Text := FieldByName('ControllerName').AsString;
            end;
            TextMain3Model.Text := FieldByName('ControllerModel').AsString;

            TextMain3Serial.Text := FieldByName('Serial').AsString;
            TextMain3inDate.Text := FieldByName('WDT').AsString;

            TextMain3TempL.Text := FieldByName('TempName').AsString;
            TextMain3SetTempL.Text := FieldByName('SetTempName').AsString;
            TextMain3RTopC1.Text := FieldByName('In1').AsString;
            TextMain3RTopC2.Text := FieldByName('In2').AsString;
            TextMain3RTopC3.Text := FieldByName('In3').AsString;
            TextMain3RTopC4.Text := FieldByName('In4').AsString;
            TextMain3RTopC5.Text := FieldByName('In5').AsString;
            TextMain3RClientC1.Text := FieldByName('Out1').AsString;
            TextMain3RClientC2.Text := FieldByName('Out2').AsString;
            TextMain3RClientC3.Text := FieldByName('Out3').AsString;
            TextMain3RClientC4.Text := FieldByName('Out4').AsString;
            TextMain3RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then CircleMain3RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then CircleMain3RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then CircleMain3RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then CircleMain3RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then CircleMain3RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then CircleMain3RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then CircleMain3RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then CircleMain3RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then CircleMain3RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then CircleMain3RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain3RTop.Text := '';
            end;

            if PreMain3InCount <> FieldByName('InCount').AsInteger then
            begin
              PreMain3InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                LayoutMain3RTopC1.Visible := True;
                LayoutMain3RTopC2.Visible := True;
                LayoutMain3RTopC3.Visible := True;
                LayoutMain3RTopC4.Visible := True;
                LayoutMain3RTopC5.Visible := True;
                LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 5;
                LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 5;
                LayoutMain3RTopC4.Width := LayoutMain3RTopC.Width / 5;
                LayoutMain3RTopC5.Width := LayoutMain3RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                LayoutMain3RTopC1.Visible := True;
                LayoutMain3RTopC2.Visible := True;
                LayoutMain3RTopC3.Visible := True;
                LayoutMain3RTopC4.Visible := True;
                LayoutMain3RTopC5.Visible := False;
                LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 4;
                LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 4;
                LayoutMain3RTopC4.Width := LayoutMain3RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                LayoutMain3RTopC1.Visible := True;
                LayoutMain3RTopC2.Visible := True;
                LayoutMain3RTopC3.Visible := True;
                LayoutMain3RTopC4.Visible := False;
                LayoutMain3RTopC5.Visible := False;
                LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 3;
                LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                LayoutMain3RTopC1.Visible := True;
                LayoutMain3RTopC2.Visible := True;
                LayoutMain3RTopC3.Visible := False;
                LayoutMain3RTopC4.Visible := False;
                LayoutMain3RTopC5.Visible := False;
                LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 2;
                LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                LayoutMain3RTopC1.Visible := True;
                LayoutMain3RTopC2.Visible := False;
                LayoutMain3RTopC3.Visible := False;
                LayoutMain3RTopC4.Visible := False;
                LayoutMain3RTopC5.Visible := False;
                LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width;
              end else
              begin
                LayoutMain3RTopC1.Visible := False;
                LayoutMain3RTopC2.Visible := False;
                LayoutMain3RTopC3.Visible := False;
                LayoutMain3RTopC4.Visible := False;
                LayoutMain3RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                LayoutMain3RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                LayoutMain3RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                LayoutMain3RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                LayoutMain3RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                LayoutMain3RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                LayoutMain3RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                LayoutMain3RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                LayoutMain3RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                LayoutMain3RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                LayoutMain3RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                LayoutMain3RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                LayoutMain3RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                LayoutMain3RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                LayoutMain3RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                LayoutMain3RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                LayoutMain3RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                LayoutMain3RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                LayoutMain3RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                LayoutMain3RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                LayoutMain3RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                LayoutMain3RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                LayoutMain3RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                LayoutMain3RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                LayoutMain3RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                LayoutMain3RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain3RClientC.Visible := false;
              TextMain3RClient.Visible := false;
              TextMain3RClient.Text := '';
            end
            else
            begin
              LayoutMain3RClientC.Visible := true;
              TextMain3RClient.Visible := true;
              TextMain3RClient.Text    := '출력';
            end;

            if PreMain3OutCount <> FieldByName('OutCount').AsInteger then
            begin
              PreMain3OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                LayoutMain3RClientC1.Visible := True;
                LayoutMain3RClientC2.Visible := True;
                LayoutMain3RClientC3.Visible := True;
                LayoutMain3RClientC4.Visible := True;
                LayoutMain3RClientC5.Visible := True;
                LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 5;
                LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 5;
                LayoutMain3RClientC4.Width := LayoutMain3RClientC.Width / 5;
                LayoutMain3RClientC5.Width := LayoutMain3RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                LayoutMain3RClientC1.Visible := True;
                LayoutMain3RClientC2.Visible := True;
                LayoutMain3RClientC3.Visible := True;
                LayoutMain3RClientC4.Visible := True;
                LayoutMain3RClientC5.Visible := False;
                LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 4;
                LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 4;
                LayoutMain3RClientC4.Width := LayoutMain3RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                LayoutMain3RClientC1.Visible := True;
                LayoutMain3RClientC2.Visible := True;
                LayoutMain3RClientC3.Visible := True;
                LayoutMain3RClientC4.Visible := False;
                LayoutMain3RClientC5.Visible := False;
                LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 3;
                LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                LayoutMain3RClientC1.Visible := True;
                LayoutMain3RClientC2.Visible := True;
                LayoutMain3RClientC3.Visible := False;
                LayoutMain3RClientC4.Visible := False;
                LayoutMain3RClientC5.Visible := False;
                LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 2;
                LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                LayoutMain3RClientC1.Visible := True;
                LayoutMain3RClientC2.Visible := False;
                LayoutMain3RClientC3.Visible := False;
                LayoutMain3RClientC4.Visible := False;
                LayoutMain3RClientC5.Visible := False;
                LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width;
              end else
              begin
                LayoutMain3RClientC1.Visible := False;
                LayoutMain3RClientC2.Visible := False;
                LayoutMain3RClientC3.Visible := False;
                LayoutMain3RClientC4.Visible := False;
                LayoutMain3RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              ImageMain3.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              ImageMain3.MultiResBitmap := ImageWifi2.MultiResBitmap;
              TextMain3Temp.Text := 'ER10';
              TextMain3SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              ImageMain3.MultiResBitmap := ImageWifi1.MultiResBitmap;
              TextMain3Temp.Text := 'ER10';
              TextMain3SetTemp.Text := '연결끊김';
            end else
            begin
              ImageMain3.MultiResBitmap := ImageWifi0.MultiResBitmap;
              TextMain3Temp.Text := 'ER10';
              TextMain3SetTemp.Text := '연결끊김';
            end;

            if TextMain3Temp.Text = 'ER10' then
            begin
              CircleMain3RTopC1.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RClientC1.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RTopC2.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RClientC2.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RTopC3.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RClientC3.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RTopC4.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RClientC4.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RTopC5.Fill.Color := TAlphaColors.Lightgray;
              CircleMain3RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              TextMain3Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if RectangleMain3Set.Visible then
//              begin
                TextMain3SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                TextMain3SetTemp.Hint := TextMain3SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else   if not FieldByName('PowerState').AsBoolean then
            begin
              TextMain3Temp.Text := 'OFF';
              TextMain3SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              TextMain3Temp.TextSettings.Font.Size := TitleSize;
              TextMain3Temp.Text := 'ER1';
             // TextMain3SetTemp.TextSettings.Font.Size := PCTitleSize;
              TextMain3SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              TextMain3Temp.TextSettings.Font.Size := TitleSize;
              TextMain3Temp.Text := 'MEMORY ERROR';
              TextMain3SetTemp.TextSettings.Font.Size := TitleSize;
              TextMain3SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              //TextMain3SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                TextMain3SetTemp.Text := '온도과도상승';
              end else
              begin
                TextMain3SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
              //TextMain3Temp.TextSettings.Font.Size := PCTempSize;
              //TextMain3SetTemp.TextSettings.Font.Size := PCTempSetSize;
              RectangleMain3Alarm.Visible := False;
              FloatAnimation3.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                RectangleMain3Alarm.Visible := True;
                FloatAnimation3.Enabled := True;
                ImageAlarm3.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                RectangleMain3Alarm.Visible := True;
                FloatAnimation3.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
              else  if TextMain3Temp.Text = 'ER10' then
              begin
                RectangleMain3Alarm.Visible := True;
                FloatAnimation3.Enabled := True;
                ImageAlarm3.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                RectangleMain3Alarm.Visible := True;
                FloatAnimation3.Enabled := True;
                ImageAlarm3.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                RectangleMain3Alarm.Visible := False;
                FloatAnimation3.Enabled := False;
              end;
            end else
            begin
              RectangleMain3Alarm.Visible := False;
              FloatAnimation3.Enabled := False;
            end;
            Next;
          end else
          begin
            Main3PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            ImageMain4Plus.Visible := False;
            ImageMain4Logo.Visible := False;
            ImageMain4.Visible := true;
            RectangleMain4Client.Hint := '';
            RectangleMain4Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              TextMain4Name.Text := '단말기'+(((Page-1)*3)+4).ToString;
            end else
            begin
              TextMain4Name.Text := FieldByName('ControllerName').AsString;
            end;
            TextMain4Model.Text := FieldByName('ControllerModel').AsString;
            TextMain4Serial.Text := FieldByName('Serial').AsString;
            TextMain4inDate.Text := FieldByName('WDT').AsString;

            TextMain4TempL.Text := FieldByName('TempName').AsString;
            TextMain4SetTempL.Text := FieldByName('SetTempName').AsString;
            TextMain4RTopC1.Text := FieldByName('In1').AsString;
            TextMain4RTopC2.Text := FieldByName('In2').AsString;
            TextMain4RTopC3.Text := FieldByName('In3').AsString;
            TextMain4RTopC4.Text := FieldByName('In4').AsString;
            TextMain4RTopC5.Text := FieldByName('In5').AsString;
            TextMain4RClientC1.Text := FieldByName('Out1').AsString;
            TextMain4RClientC2.Text := FieldByName('Out2').AsString;
            TextMain4RClientC3.Text := FieldByName('Out3').AsString;
            TextMain4RClientC4.Text := FieldByName('Out4').AsString;
            TextMain4RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then CircleMain4RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain4RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then CircleMain4RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain4RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then CircleMain4RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain4RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then CircleMain4RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain4RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then CircleMain4RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain4RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then CircleMain4RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain4RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then CircleMain4RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain4RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then CircleMain4RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain4RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then CircleMain4RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain4RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then CircleMain4RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain4RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain4RTop.Text := '';
            end;

            if PreMain4InCount <> FieldByName('InCount').AsInteger then
            begin
              PreMain4InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                LayoutMain4RTopC1.Visible := True;
                LayoutMain4RTopC2.Visible := True;
                LayoutMain4RTopC3.Visible := True;
                LayoutMain4RTopC4.Visible := True;
                LayoutMain4RTopC5.Visible := True;
                LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 5;
                LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 5;
                LayoutMain4RTopC4.Width := LayoutMain4RTopC.Width / 5;
                LayoutMain4RTopC5.Width := LayoutMain4RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                LayoutMain4RTopC1.Visible := True;
                LayoutMain4RTopC2.Visible := True;
                LayoutMain4RTopC3.Visible := True;
                LayoutMain4RTopC4.Visible := True;
                LayoutMain4RTopC5.Visible := False;
                LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 4;
                LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 4;
                LayoutMain4RTopC4.Width := LayoutMain4RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                LayoutMain4RTopC1.Visible := True;
                LayoutMain4RTopC2.Visible := True;
                LayoutMain4RTopC3.Visible := True;
                LayoutMain4RTopC4.Visible := False;
                LayoutMain4RTopC5.Visible := False;
                LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 3;
                LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                LayoutMain4RTopC1.Visible := True;
                LayoutMain4RTopC2.Visible := True;
                LayoutMain4RTopC3.Visible := False;
                LayoutMain4RTopC4.Visible := False;
                LayoutMain4RTopC5.Visible := False;
                LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 2;
                LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                LayoutMain4RTopC1.Visible := True;
                LayoutMain4RTopC2.Visible := False;
                LayoutMain4RTopC3.Visible := False;
                LayoutMain4RTopC4.Visible := False;
                LayoutMain4RTopC5.Visible := False;
                LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width;
              end else
              begin
                LayoutMain4RTopC1.Visible := False;
                LayoutMain4RTopC2.Visible := False;
                LayoutMain4RTopC3.Visible := False;
                LayoutMain4RTopC4.Visible := False;
                LayoutMain4RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                LayoutMain4RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                LayoutMain4RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                LayoutMain4RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                LayoutMain4RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                LayoutMain4RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                LayoutMain4RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                LayoutMain4RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                LayoutMain4RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                LayoutMain4RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                LayoutMain4RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                LayoutMain4RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                LayoutMain4RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                LayoutMain4RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                LayoutMain4RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                LayoutMain4RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                LayoutMain4RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                LayoutMain4RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                LayoutMain4RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                LayoutMain4RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                LayoutMain4RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                LayoutMain4RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                LayoutMain4RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                LayoutMain4RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                LayoutMain4RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                LayoutMain4RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain4RClientC.Visible := false;
              TextMain4RClient.Visible := false;
              TextMain4RClient.Text := '';
            end
            else
            begin
              LayoutMain4RClientC.Visible := true;
              TextMain4RClient.Visible := true;
              TextMain4RClient.Text    := '출력';
            end;

            if PreMain4OutCount <> FieldByName('OutCount').AsInteger then
            begin
              PreMain4OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                LayoutMain4RClientC1.Visible := True;
                LayoutMain4RClientC2.Visible := True;
                LayoutMain4RClientC3.Visible := True;
                LayoutMain4RClientC4.Visible := True;
                LayoutMain4RClientC5.Visible := True;
                LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 5;
                LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 5;
                LayoutMain4RClientC4.Width := LayoutMain4RClientC.Width / 5;
                LayoutMain4RClientC5.Width := LayoutMain4RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                LayoutMain4RClientC1.Visible := True;
                LayoutMain4RClientC2.Visible := True;
                LayoutMain4RClientC3.Visible := True;
                LayoutMain4RClientC4.Visible := True;
                LayoutMain4RClientC5.Visible := False;
                LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 4;
                LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 4;
                LayoutMain4RClientC4.Width := LayoutMain4RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                LayoutMain4RClientC1.Visible := True;
                LayoutMain4RClientC2.Visible := True;
                LayoutMain4RClientC3.Visible := True;
                LayoutMain4RClientC4.Visible := False;
                LayoutMain4RClientC5.Visible := False;
                LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 3;
                LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                LayoutMain4RClientC1.Visible := True;
                LayoutMain4RClientC2.Visible := True;
                LayoutMain4RClientC3.Visible := False;
                LayoutMain4RClientC4.Visible := False;
                LayoutMain4RClientC5.Visible := False;
                LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 2;
                LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                LayoutMain4RClientC1.Visible := True;
                LayoutMain4RClientC2.Visible := False;
                LayoutMain4RClientC3.Visible := False;
                LayoutMain4RClientC4.Visible := False;
                LayoutMain4RClientC5.Visible := False;
                LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width;
              end else
              begin
                LayoutMain4RClientC1.Visible := False;
                LayoutMain4RClientC2.Visible := False;
                LayoutMain4RClientC3.Visible := False;
                LayoutMain4RClientC4.Visible := False;
                LayoutMain4RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              ImageMain4.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              ImageMain4.MultiResBitmap := ImageWifi2.MultiResBitmap;
              TextMain4Temp.Text := 'ER10';
              TextMain4SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              ImageMain4.MultiResBitmap := ImageWifi1.MultiResBitmap;
              TextMain4Temp.Text := 'ER10';
              TextMain4SetTemp.Text := '연결끊김';
            end else
            begin
              ImageMain4.MultiResBitmap := ImageWifi0.MultiResBitmap;
              TextMain4Temp.Text := 'ER10';
              TextMain4SetTemp.Text := '연결끊김';
            end;

            if TextMain4Temp.Text = 'ER10' then
            begin
              CircleMain4RTopC1.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RClientC1.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RTopC2.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RClientC2.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RTopC3.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RClientC3.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RTopC4.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RClientC4.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RTopC5.Fill.Color := TAlphaColors.Lightgray;
              CircleMain4RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              TextMain4Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if RectangleMain4Set.Visible then
//              begin
                TextMain4SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                TextMain4SetTemp.Hint := TextMain4SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else  if not FieldByName('PowerState').AsBoolean then
            begin
              TextMain4Temp.Text := 'OFF';
              TextMain4SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              TextMain4Temp.TextSettings.Font.Size := TitleSize;
              TextMain4Temp.Text := 'ER1';
              //TextMain4SetTemp.TextSettings.Font.Size := PCTitleSize;
              TextMain4SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              TextMain4Temp.TextSettings.Font.Size := TitleSize;
              TextMain4Temp.Text := 'MEMORY ERROR';
              TextMain4SetTemp.TextSettings.Font.Size := TitleSize;
              TextMain4SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              //TextMain4SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                TextMain4SetTemp.Text := '온도과도상승';
              end else
              begin
                TextMain4SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
              //TextMain4Temp.TextSettings.Font.Size := PCTempSize;
              //TextMain4SetTemp.TextSettings.Font.Size := PCTempSetSize;
              RectangleMain4Alarm.Visible := False;
              FloatAnimation4.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                RectangleMain4Alarm.Visible := True;
                FloatAnimation4.Enabled := True;
                ImageAlarm4.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                RectangleMain4Alarm.Visible := True;
                FloatAnimation4.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
              else  if TextMain4Temp.Text = 'ER10' then
              begin
                RectangleMain4Alarm.Visible := True;
                FloatAnimation4.Enabled := True;
                ImageAlarm4.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                RectangleMain4Alarm.Visible := True;
                FloatAnimation4.Enabled := True;
                ImageAlarm4.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                RectangleMain4Alarm.Visible := False;
                FloatAnimation4.Enabled := False;
              end;
            end else
            begin
              RectangleMain4Alarm.Visible := False;
              FloatAnimation4.Enabled := False;
            end;
            Next;
          end else
          begin
            Main4PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            Imagemain5Plus.Visible := False;
            ImageMain5Logo.Visible := False;
            ImageMain5.Visible := true;
            RectangleMain5Client.Hint := '';
            RectangleMain5Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              Textmain5Name.Text := '단말기'+(((Page-1)*3)+5).ToString;
            end else
            begin
              Textmain5Name.Text := FieldByName('ControllerName').AsString;
            end;
            Textmain5Model.Text := FieldByName('ControllerModel').AsString;
            TextMain5Serial.Text := FieldByName('Serial').AsString;
            TextMain5inDate.Text := FieldByName('WDT').AsString;

            Textmain5TempL.Text := FieldByName('TempName').AsString;
            Textmain5SetTempL.Text := FieldByName('SetTempName').AsString;
            Textmain5RTopC1.Text := FieldByName('In1').AsString;
            Textmain5RTopC2.Text := FieldByName('In2').AsString;
            Textmain5RTopC3.Text := FieldByName('In3').AsString;
            Textmain5RTopC4.Text := FieldByName('In4').AsString;
            Textmain5RTopC5.Text := FieldByName('In5').AsString;
            Textmain5RClientC1.Text := FieldByName('Out1').AsString;
            Textmain5RClientC2.Text := FieldByName('Out2').AsString;
            Textmain5RClientC3.Text := FieldByName('Out3').AsString;
            Textmain5RClientC4.Text := FieldByName('Out4').AsString;
            Textmain5RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then Circlemain5RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain5RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then Circlemain5RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain5RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then Circlemain5RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain5RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then Circlemain5RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain5RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then Circlemain5RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain5RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then Circlemain5RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain5RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then Circlemain5RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain5RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then Circlemain5RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain5RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then Circlemain5RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain5RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then Circlemain5RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain5RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain5RTop.Text := '';
            end;

            if Premain5InCount <> FieldByName('InCount').AsInteger then
            begin
              Premain5InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                Layoutmain5RTopC1.Visible := True;
                Layoutmain5RTopC2.Visible := True;
                Layoutmain5RTopC3.Visible := True;
                Layoutmain5RTopC4.Visible := True;
                Layoutmain5RTopC5.Visible := True;
                Layoutmain5RTopC1.Width := Layoutmain5RTopC.Width / 5;
                Layoutmain5RTopC2.Width := Layoutmain5RTopC.Width / 5;
                Layoutmain5RTopC4.Width := Layoutmain5RTopC.Width / 5;
                Layoutmain5RTopC5.Width := Layoutmain5RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                Layoutmain5RTopC1.Visible := True;
                Layoutmain5RTopC2.Visible := True;
                Layoutmain5RTopC3.Visible := True;
                Layoutmain5RTopC4.Visible := True;
                Layoutmain5RTopC5.Visible := False;
                Layoutmain5RTopC1.Width := Layoutmain5RTopC.Width / 4;
                Layoutmain5RTopC2.Width := Layoutmain5RTopC.Width / 4;
                Layoutmain5RTopC4.Width := Layoutmain5RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                Layoutmain5RTopC1.Visible := True;
                Layoutmain5RTopC2.Visible := True;
                Layoutmain5RTopC3.Visible := True;
                Layoutmain5RTopC4.Visible := False;
                Layoutmain5RTopC5.Visible := False;
                Layoutmain5RTopC1.Width := Layoutmain5RTopC.Width / 3;
                Layoutmain5RTopC2.Width := Layoutmain5RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                Layoutmain5RTopC1.Visible := True;
                Layoutmain5RTopC2.Visible := True;
                Layoutmain5RTopC3.Visible := False;
                Layoutmain5RTopC4.Visible := False;
                Layoutmain5RTopC5.Visible := False;
                Layoutmain5RTopC1.Width := Layoutmain5RTopC.Width / 2;
                Layoutmain5RTopC2.Width := Layoutmain5RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                Layoutmain5RTopC1.Visible := True;
                Layoutmain5RTopC2.Visible := False;
                Layoutmain5RTopC3.Visible := False;
                Layoutmain5RTopC4.Visible := False;
                Layoutmain5RTopC5.Visible := False;
                Layoutmain5RTopC1.Width := Layoutmain5RTopC.Width;
              end else
              begin
                Layoutmain5RTopC1.Visible := False;
                Layoutmain5RTopC2.Visible := False;
                Layoutmain5RTopC3.Visible := False;
                Layoutmain5RTopC4.Visible := False;
                Layoutmain5RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                Layoutmain5RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                Layoutmain5RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                Layoutmain5RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                Layoutmain5RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                Layoutmain5RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                Layoutmain5RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                Layoutmain5RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                Layoutmain5RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                Layoutmain5RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                Layoutmain5RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                Layoutmain5RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                Layoutmain5RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                Layoutmain5RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                Layoutmain5RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                Layoutmain5RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                Layoutmain5RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                Layoutmain5RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                Layoutmain5RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                Layoutmain5RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                Layoutmain5RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                Layoutmain5RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                Layoutmain5RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                Layoutmain5RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                Layoutmain5RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                Layoutmain5RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain5RClientC.Visible := false;
              TextMain5RClient.Visible := false;
              TextMain5RClient.Text := '';
            end
            else
            begin
              LayoutMain5RClientC.Visible := true;
              TextMain5RClient.Visible := true;
              TextMain5RClient.Text    := '출력';
            end;

            if Premain5OutCount <> FieldByName('OutCount').AsInteger then
            begin
              Premain5OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                Layoutmain5RClientC1.Visible := True;
                Layoutmain5RClientC2.Visible := True;
                Layoutmain5RClientC3.Visible := True;
                Layoutmain5RClientC4.Visible := True;
                Layoutmain5RClientC5.Visible := True;
                Layoutmain5RClientC1.Width := Layoutmain5RClientC.Width / 5;
                Layoutmain5RClientC2.Width := Layoutmain5RClientC.Width / 5;
                Layoutmain5RClientC4.Width := Layoutmain5RClientC.Width / 5;
                Layoutmain5RClientC5.Width := Layoutmain5RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                Layoutmain5RClientC1.Visible := True;
                Layoutmain5RClientC2.Visible := True;
                Layoutmain5RClientC3.Visible := True;
                Layoutmain5RClientC4.Visible := True;
                Layoutmain5RClientC5.Visible := False;
                Layoutmain5RClientC1.Width := Layoutmain5RClientC.Width / 4;
                Layoutmain5RClientC2.Width := Layoutmain5RClientC.Width / 4;
                Layoutmain5RClientC4.Width := Layoutmain5RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                Layoutmain5RClientC1.Visible := True;
                Layoutmain5RClientC2.Visible := True;
                Layoutmain5RClientC3.Visible := True;
                Layoutmain5RClientC4.Visible := False;
                Layoutmain5RClientC5.Visible := False;
                Layoutmain5RClientC1.Width := Layoutmain5RClientC.Width / 3;
                Layoutmain5RClientC2.Width := Layoutmain5RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                Layoutmain5RClientC1.Visible := True;
                Layoutmain5RClientC2.Visible := True;
                Layoutmain5RClientC3.Visible := False;
                Layoutmain5RClientC4.Visible := False;
                Layoutmain5RClientC5.Visible := False;
                Layoutmain5RClientC1.Width := Layoutmain5RClientC.Width / 2;
                Layoutmain5RClientC2.Width := Layoutmain5RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                Layoutmain5RClientC1.Visible := True;
                Layoutmain5RClientC2.Visible := False;
                Layoutmain5RClientC3.Visible := False;
                Layoutmain5RClientC4.Visible := False;
                Layoutmain5RClientC5.Visible := False;
                Layoutmain5RClientC1.Width := Layoutmain5RClientC.Width;
              end else
              begin
                Layoutmain5RClientC1.Visible := False;
                Layoutmain5RClientC2.Visible := False;
                Layoutmain5RClientC3.Visible := False;
                Layoutmain5RClientC4.Visible := False;
                Layoutmain5RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              Imagemain5.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain5.MultiResBitmap := ImageWifi2.MultiResBitmap;
              Textmain5Temp.Text := 'ER10';
              Textmain5SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain5.MultiResBitmap := ImageWifi1.MultiResBitmap;
              Textmain5Temp.Text := 'ER10';
              Textmain5SetTemp.Text := '연결끊김';
            end else
            begin
              Imagemain5.MultiResBitmap := ImageWifi0.MultiResBitmap;
              Textmain5Temp.Text := 'ER10';
              Textmain5SetTemp.Text := '연결끊김';
            end;

            if Textmain5Temp.Text = 'ER10' then
            begin
              Circlemain5RTopC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RClientC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RTopC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RClientC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RTopC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RClientC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RTopC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RClientC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RTopC5.Fill.Color := TAlphaColors.Lightgray;
              Circlemain5RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              Textmain5Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if Rectanglemain5Set.Visible then
//              begin
                Textmain5SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                Textmain5SetTemp.Hint := Textmain5SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else  if not FieldByName('PowerState').AsBoolean then
            begin
              Textmain5Temp.Text := 'OFF';
              Textmain5SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              Textmain5Temp.TextSettings.Font.Size := TitleSize;
              Textmain5Temp.Text := 'ER1';
              //Textmain5SetTemp.TextSettings.Font.Size := PCTitleSize;
              Textmain5SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              Textmain5Temp.TextSettings.Font.Size := TitleSize;
              Textmain5Temp.Text := 'MEMORY ERROR';
              Textmain5SetTemp.TextSettings.Font.Size := TitleSize;
              Textmain5SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              //Textmain5SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                Textmain5SetTemp.Text := '온도과도상승';
              end else
              begin
                Textmain5SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
//              Textmain5Temp.TextSettings.Font.Size := PCTempSize;
//              Textmain5SetTemp.TextSettings.Font.Size := PCTempSetSize;
              Rectanglemain5Alarm.Visible := False;
              FloatAnimation5.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                Rectanglemain5Alarm.Visible := True;
                FloatAnimation5.Enabled := True;
                ImageAlarm5.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                Rectanglemain5Alarm.Visible := True;
                FloatAnimation5.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
            else  if TextMain5Temp.Text = 'ER10' then
            begin
              RectangleMain5Alarm.Visible := True;
              FloatAnimation5.Enabled := True;
	            ImageAlarm5.Visible := true;
              AlarmCheck := True;
              try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
              except

              end;
            end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                Rectanglemain5Alarm.Visible := True;
                FloatAnimation5.Enabled := True;
                ImageAlarm5.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                Rectanglemain5Alarm.Visible := False;
                FloatAnimation5.Enabled := False;
              end;
            end else
            begin
              Rectanglemain5Alarm.Visible := False;
              FloatAnimation5.Enabled := False;
            end;
            Next;
          end else
          begin
            main5PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            Imagemain6Plus.Visible := False;
            ImageMain6Logo.Visible := False;
            ImageMain6.Visible := true;
            RectangleMain6Client.Hint := '';
            RectangleMain6Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              Textmain6Name.Text := '단말기'+(((Page-1)*3)+6).ToString;
            end else
            begin
              Textmain6Name.Text := FieldByName('ControllerName').AsString;
            end;
            Textmain6Model.Text := FieldByName('ControllerModel').AsString;
            TextMain6Serial.Text := FieldByName('Serial').AsString;
            TextMain6inDate.Text := FieldByName('WDT').AsString;

            Textmain6TempL.Text := FieldByName('TempName').AsString;
            Textmain6SetTempL.Text := FieldByName('SetTempName').AsString;
            Textmain6RTopC1.Text := FieldByName('In1').AsString;
            Textmain6RTopC2.Text := FieldByName('In2').AsString;
            Textmain6RTopC3.Text := FieldByName('In3').AsString;
            Textmain6RTopC4.Text := FieldByName('In4').AsString;
            Textmain6RTopC5.Text := FieldByName('In5').AsString;
            Textmain6RClientC1.Text := FieldByName('Out1').AsString;
            Textmain6RClientC2.Text := FieldByName('Out2').AsString;
            Textmain6RClientC3.Text := FieldByName('Out3').AsString;
            Textmain6RClientC4.Text := FieldByName('Out4').AsString;
            Textmain6RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then Circlemain6RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain6RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then Circlemain6RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain6RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then Circlemain6RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain6RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then Circlemain6RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain6RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then Circlemain6RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain6RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then Circlemain6RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain6RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then Circlemain6RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain6RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then Circlemain6RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain6RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then Circlemain6RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain6RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then Circlemain6RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain6RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain6RTop.Text := '';
            end;

            if Premain6InCount <> FieldByName('InCount').AsInteger then
            begin
              Premain6InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                Layoutmain6RTopC1.Visible := True;
                Layoutmain6RTopC2.Visible := True;
                Layoutmain6RTopC3.Visible := True;
                Layoutmain6RTopC4.Visible := True;
                Layoutmain6RTopC5.Visible := True;
                Layoutmain6RTopC1.Width := Layoutmain6RTopC.Width / 5;
                Layoutmain6RTopC2.Width := Layoutmain6RTopC.Width / 5;
                Layoutmain6RTopC4.Width := Layoutmain6RTopC.Width / 5;
                Layoutmain6RTopC5.Width := Layoutmain6RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                Layoutmain6RTopC1.Visible := True;
                Layoutmain6RTopC2.Visible := True;
                Layoutmain6RTopC3.Visible := True;
                Layoutmain6RTopC4.Visible := True;
                Layoutmain6RTopC5.Visible := False;
                Layoutmain6RTopC1.Width := Layoutmain6RTopC.Width / 4;
                Layoutmain6RTopC2.Width := Layoutmain6RTopC.Width / 4;
                Layoutmain6RTopC4.Width := Layoutmain6RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                Layoutmain6RTopC1.Visible := True;
                Layoutmain6RTopC2.Visible := True;
                Layoutmain6RTopC3.Visible := True;
                Layoutmain6RTopC4.Visible := False;
                Layoutmain6RTopC5.Visible := False;
                Layoutmain6RTopC1.Width := Layoutmain6RTopC.Width / 3;
                Layoutmain6RTopC2.Width := Layoutmain6RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                Layoutmain6RTopC1.Visible := True;
                Layoutmain6RTopC2.Visible := True;
                Layoutmain6RTopC3.Visible := False;
                Layoutmain6RTopC4.Visible := False;
                Layoutmain6RTopC5.Visible := False;
                Layoutmain6RTopC1.Width := Layoutmain6RTopC.Width / 2;
                Layoutmain6RTopC2.Width := Layoutmain6RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                Layoutmain6RTopC1.Visible := True;
                Layoutmain6RTopC2.Visible := False;
                Layoutmain6RTopC3.Visible := False;
                Layoutmain6RTopC4.Visible := False;
                Layoutmain6RTopC5.Visible := False;
                Layoutmain6RTopC1.Width := Layoutmain6RTopC.Width;
              end else
              begin
                Layoutmain6RTopC1.Visible := False;
                Layoutmain6RTopC2.Visible := False;
                Layoutmain6RTopC3.Visible := False;
                Layoutmain6RTopC4.Visible := False;
                Layoutmain6RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                Layoutmain6RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                Layoutmain6RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                Layoutmain6RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                Layoutmain6RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                Layoutmain6RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                Layoutmain6RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                Layoutmain6RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                Layoutmain6RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                Layoutmain6RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                Layoutmain6RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                Layoutmain6RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                Layoutmain6RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                Layoutmain6RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                Layoutmain6RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                Layoutmain6RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                Layoutmain6RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                Layoutmain6RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                Layoutmain6RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                Layoutmain6RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                Layoutmain6RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                Layoutmain6RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                Layoutmain6RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                Layoutmain6RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                Layoutmain6RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                Layoutmain6RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain6RClientC.Visible := false;
              TextMain6RClient.Visible := false;
              TextMain6RClient.Text := '';
            end
            else
            begin
              LayoutMain6RClientC.Visible := true;
              TextMain6RClient.Visible := true;
              TextMain6RClient.Text    := '출력';
            end;

            if Premain6OutCount <> FieldByName('OutCount').AsInteger then
            begin
              Premain6OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                Layoutmain6RClientC1.Visible := True;
                Layoutmain6RClientC2.Visible := True;
                Layoutmain6RClientC3.Visible := True;
                Layoutmain6RClientC4.Visible := True;
                Layoutmain6RClientC5.Visible := True;
                Layoutmain6RClientC1.Width := Layoutmain6RClientC.Width / 5;
                Layoutmain6RClientC2.Width := Layoutmain6RClientC.Width / 5;
                Layoutmain6RClientC4.Width := Layoutmain6RClientC.Width / 5;
                Layoutmain6RClientC5.Width := Layoutmain6RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                Layoutmain6RClientC1.Visible := True;
                Layoutmain6RClientC2.Visible := True;
                Layoutmain6RClientC3.Visible := True;
                Layoutmain6RClientC4.Visible := True;
                Layoutmain6RClientC5.Visible := False;
                Layoutmain6RClientC1.Width := Layoutmain6RClientC.Width / 4;
                Layoutmain6RClientC2.Width := Layoutmain6RClientC.Width / 4;
                Layoutmain6RClientC4.Width := Layoutmain6RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                Layoutmain6RClientC1.Visible := True;
                Layoutmain6RClientC2.Visible := True;
                Layoutmain6RClientC3.Visible := True;
                Layoutmain6RClientC4.Visible := False;
                Layoutmain6RClientC5.Visible := False;
                Layoutmain6RClientC1.Width := Layoutmain6RClientC.Width / 3;
                Layoutmain6RClientC2.Width := Layoutmain6RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                Layoutmain6RClientC1.Visible := True;
                Layoutmain6RClientC2.Visible := True;
                Layoutmain6RClientC3.Visible := False;
                Layoutmain6RClientC4.Visible := False;
                Layoutmain6RClientC5.Visible := False;
                Layoutmain6RClientC1.Width := Layoutmain6RClientC.Width / 2;
                Layoutmain6RClientC2.Width := Layoutmain6RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                Layoutmain6RClientC1.Visible := True;
                Layoutmain6RClientC2.Visible := False;
                Layoutmain6RClientC3.Visible := False;
                Layoutmain6RClientC4.Visible := False;
                Layoutmain6RClientC5.Visible := False;
                Layoutmain6RClientC1.Width := Layoutmain6RClientC.Width;
              end else
              begin
                Layoutmain6RClientC1.Visible := False;
                Layoutmain6RClientC2.Visible := False;
                Layoutmain6RClientC3.Visible := False;
                Layoutmain6RClientC4.Visible := False;
                Layoutmain6RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              Imagemain6.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain6.MultiResBitmap := ImageWifi2.MultiResBitmap;
              Textmain6Temp.Text := 'ER10';
              Textmain6SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain6.MultiResBitmap := ImageWifi1.MultiResBitmap;
              Textmain6Temp.Text := 'ER10';
              Textmain6SetTemp.Text := '연결끊김';
            end else
            begin
              Imagemain6.MultiResBitmap := ImageWifi0.MultiResBitmap;
              Textmain6Temp.Text := 'ER10';
              Textmain6SetTemp.Text := '연결끊김';
            end;

            if Textmain6Temp.Text = 'ER10' then
            begin
              Circlemain6RTopC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RClientC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RTopC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RClientC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RTopC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RClientC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RTopC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RClientC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RTopC5.Fill.Color := TAlphaColors.Lightgray;
              Circlemain6RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              Textmain6Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if Rectanglemain6Set.Visible then
//              begin
                Textmain6SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                Textmain6SetTemp.Hint := Textmain6SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else  if not FieldByName('PowerState').AsBoolean then //if TextMain6Temp.Text = 'ER10' then
            begin
              Textmain6Temp.Text := 'OFF';
              Textmain6SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              Textmain6Temp.TextSettings.Font.Size := TitleSize;
              Textmain6Temp.Text := 'ER1';
             // Textmain6SetTemp.TextSettings.Font.Size := PCTitleSize;
              Textmain6SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              Textmain6Temp.TextSettings.Font.Size := TitleSize;
              Textmain6Temp.Text := 'MEMORY ERROR';
              Textmain6SetTemp.TextSettings.Font.Size := TitleSize;
              Textmain6SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              //Textmain6SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                Textmain6SetTemp.Text := '온도과도상승';
              end else
              begin
                Textmain6SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
//              Textmain6Temp.TextSettings.Font.Size := PCTempSize;
//              Textmain6SetTemp.TextSettings.Font.Size := PCTempSetSize;
              Rectanglemain6Alarm.Visible := False;
              FloatAnimation6.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                Rectanglemain6Alarm.Visible := True;
                FloatAnimation6.Enabled := True;
                ImageAlarm6.Visible := true;
                AlarmCheck := True;
                try

                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                Rectanglemain6Alarm.Visible := True;
                FloatAnimation6.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
              else if TextMain6Temp.Text = 'ER10' then
              begin
                RectangleMain6Alarm.Visible := True;
                FloatAnimation6.Enabled := True;
                ImageAlarm6.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                Rectanglemain6Alarm.Visible := True;
                FloatAnimation6.Enabled := True;
                ImageAlarm6.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                Rectanglemain6Alarm.Visible := False;
                FloatAnimation6.Enabled := False;
              end;
            end else
            begin
              Rectanglemain6Alarm.Visible := False;
              FloatAnimation6.Enabled := False;
            end;
            Next;
          end else
          begin
            main6PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            Imagemain7Plus.Visible := False;
            ImageMain7Logo.Visible := False;
            ImageMain7.Visible := true;
            RectangleMain7Client.Hint := '';
            RectangleMain7Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              Textmain7Name.Text := '단말기'+(((Page-1)*3)+7).ToString;
            end else
            begin
              Textmain7Name.Text := FieldByName('ControllerName').AsString;
            end;
            Textmain7Model.Text := FieldByName('ControllerModel').AsString;
            TextMain7Serial.Text := FieldByName('Serial').AsString;
            TextMain7inDate.Text := FieldByName('WDT').AsString;

            Textmain7TempL.Text := FieldByName('TempName').AsString;
            Textmain7SetTempL.Text := FieldByName('SetTempName').AsString;
            Textmain7RTopC1.Text := FieldByName('In1').AsString;
            Textmain7RTopC2.Text := FieldByName('In2').AsString;
            Textmain7RTopC3.Text := FieldByName('In3').AsString;
            Textmain7RTopC4.Text := FieldByName('In4').AsString;
            Textmain7RTopC5.Text := FieldByName('In5').AsString;
            Textmain7RClientC1.Text := FieldByName('Out1').AsString;
            Textmain7RClientC2.Text := FieldByName('Out2').AsString;
            Textmain7RClientC3.Text := FieldByName('Out3').AsString;
            Textmain7RClientC4.Text := FieldByName('Out4').AsString;
            Textmain7RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then Circlemain7RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain7RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then Circlemain7RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain7RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then Circlemain7RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain7RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then Circlemain7RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain7RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then Circlemain7RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain7RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then Circlemain7RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain7RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then Circlemain7RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain7RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then Circlemain7RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain7RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then Circlemain7RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain7RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then Circlemain7RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain7RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain7RTop.Text := '';
            end;

            if Premain7InCount <> FieldByName('InCount').AsInteger then
            begin
              Premain7InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                Layoutmain7RTopC1.Visible := True;
                Layoutmain7RTopC2.Visible := True;
                Layoutmain7RTopC3.Visible := True;
                Layoutmain7RTopC4.Visible := True;
                Layoutmain7RTopC5.Visible := True;
                Layoutmain7RTopC1.Width := Layoutmain7RTopC.Width / 5;
                Layoutmain7RTopC2.Width := Layoutmain7RTopC.Width / 5;
                Layoutmain7RTopC4.Width := Layoutmain7RTopC.Width / 5;
                Layoutmain7RTopC5.Width := Layoutmain7RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                Layoutmain7RTopC1.Visible := True;
                Layoutmain7RTopC2.Visible := True;
                Layoutmain7RTopC3.Visible := True;
                Layoutmain7RTopC4.Visible := True;
                Layoutmain7RTopC5.Visible := False;
                Layoutmain7RTopC1.Width := Layoutmain7RTopC.Width / 4;
                Layoutmain7RTopC2.Width := Layoutmain7RTopC.Width / 4;
                Layoutmain7RTopC4.Width := Layoutmain7RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                Layoutmain7RTopC1.Visible := True;
                Layoutmain7RTopC2.Visible := True;
                Layoutmain7RTopC3.Visible := True;
                Layoutmain7RTopC4.Visible := False;
                Layoutmain7RTopC5.Visible := False;
                Layoutmain7RTopC1.Width := Layoutmain7RTopC.Width / 3;
                Layoutmain7RTopC2.Width := Layoutmain7RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                Layoutmain7RTopC1.Visible := True;
                Layoutmain7RTopC2.Visible := True;
                Layoutmain7RTopC3.Visible := False;
                Layoutmain7RTopC4.Visible := False;
                Layoutmain7RTopC5.Visible := False;
                Layoutmain7RTopC1.Width := Layoutmain7RTopC.Width / 2;
                Layoutmain7RTopC2.Width := Layoutmain7RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                Layoutmain7RTopC1.Visible := True;
                Layoutmain7RTopC2.Visible := False;
                Layoutmain7RTopC3.Visible := False;
                Layoutmain7RTopC4.Visible := False;
                Layoutmain7RTopC5.Visible := False;
                Layoutmain7RTopC1.Width := Layoutmain7RTopC.Width;
              end else
              begin
                Layoutmain7RTopC1.Visible := False;
                Layoutmain7RTopC2.Visible := False;
                Layoutmain7RTopC3.Visible := False;
                Layoutmain7RTopC4.Visible := False;
                Layoutmain7RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                Layoutmain7RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                Layoutmain7RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                Layoutmain7RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                Layoutmain7RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                Layoutmain7RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                Layoutmain7RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                Layoutmain7RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                Layoutmain7RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                Layoutmain7RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                Layoutmain7RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                Layoutmain7RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                Layoutmain7RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                Layoutmain7RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                Layoutmain7RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                Layoutmain7RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                Layoutmain7RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                Layoutmain7RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                Layoutmain7RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                Layoutmain7RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                Layoutmain7RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                Layoutmain7RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                Layoutmain7RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                Layoutmain7RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                Layoutmain7RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                Layoutmain7RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain7RClientC.Visible := false;
              TextMain7RClient.Visible := false;
              TextMain7RClient.Text := '';
            end
            else
            begin
              LayoutMain7RClientC.Visible := true;
              TextMain7RClient.Visible := true;
              TextMain7RClient.Text    := '출력';
            end;

            if Premain7OutCount <> FieldByName('OutCount').AsInteger then
            begin
              Premain7OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                Layoutmain7RClientC1.Visible := True;
                Layoutmain7RClientC2.Visible := True;
                Layoutmain7RClientC3.Visible := True;
                Layoutmain7RClientC4.Visible := True;
                Layoutmain7RClientC5.Visible := True;
                Layoutmain7RClientC1.Width := Layoutmain7RClientC.Width / 5;
                Layoutmain7RClientC2.Width := Layoutmain7RClientC.Width / 5;
                Layoutmain7RClientC4.Width := Layoutmain7RClientC.Width / 5;
                Layoutmain7RClientC5.Width := Layoutmain7RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                Layoutmain7RClientC1.Visible := True;
                Layoutmain7RClientC2.Visible := True;
                Layoutmain7RClientC3.Visible := True;
                Layoutmain7RClientC4.Visible := True;
                Layoutmain7RClientC5.Visible := False;
                Layoutmain7RClientC1.Width := Layoutmain7RClientC.Width / 4;
                Layoutmain7RClientC2.Width := Layoutmain7RClientC.Width / 4;
                Layoutmain7RClientC4.Width := Layoutmain7RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                Layoutmain7RClientC1.Visible := True;
                Layoutmain7RClientC2.Visible := True;
                Layoutmain7RClientC3.Visible := True;
                Layoutmain7RClientC4.Visible := False;
                Layoutmain7RClientC5.Visible := False;
                Layoutmain7RClientC1.Width := Layoutmain7RClientC.Width / 3;
                Layoutmain7RClientC2.Width := Layoutmain7RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                Layoutmain7RClientC1.Visible := True;
                Layoutmain7RClientC2.Visible := True;
                Layoutmain7RClientC3.Visible := False;
                Layoutmain7RClientC4.Visible := False;
                Layoutmain7RClientC5.Visible := False;
                Layoutmain7RClientC1.Width := Layoutmain7RClientC.Width / 2;
                Layoutmain7RClientC2.Width := Layoutmain7RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                Layoutmain7RClientC1.Visible := True;
                Layoutmain7RClientC2.Visible := False;
                Layoutmain7RClientC3.Visible := False;
                Layoutmain7RClientC4.Visible := False;
                Layoutmain7RClientC5.Visible := False;
                Layoutmain7RClientC1.Width := Layoutmain7RClientC.Width;
              end else
              begin
                Layoutmain7RClientC1.Visible := False;
                Layoutmain7RClientC2.Visible := False;
                Layoutmain7RClientC3.Visible := False;
                Layoutmain7RClientC4.Visible := False;
                Layoutmain7RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              Imagemain7.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain7.MultiResBitmap := ImageWifi2.MultiResBitmap;
              Textmain7Temp.Text := 'ER10';
              Textmain7SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain7.MultiResBitmap := ImageWifi1.MultiResBitmap;
              Textmain7Temp.Text := 'ER10';
              Textmain7SetTemp.Text := '연결끊김';
            end else
            begin
              Imagemain7.MultiResBitmap := ImageWifi0.MultiResBitmap;
              Textmain7Temp.Text := 'ER10';
              Textmain7SetTemp.Text := '연결끊김';
            end;

            if Textmain7Temp.Text = 'ER10' then
            begin
              Circlemain7RTopC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RClientC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RTopC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RClientC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RTopC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RClientC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RTopC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RClientC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RTopC5.Fill.Color := TAlphaColors.Lightgray;
              Circlemain7RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              Textmain7Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if Rectanglemain7Set.Visible then
//              begin
                Textmain7SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                Textmain7SetTemp.Hint := Textmain7SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else   if not FieldByName('PowerState').AsBoolean then //if TextMain7Temp.Text = 'ER10' then
            begin
              Textmain7Temp.Text := 'OFF';
              Textmain7SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              Textmain7Temp.TextSettings.Font.Size := TitleSize;
              Textmain7Temp.Text := 'ER1';
             // Textmain7SetTemp.TextSettings.Font.Size := PCTitleSize;
              Textmain7SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              Textmain7Temp.TextSettings.Font.Size := TitleSize;
              Textmain7Temp.Text := 'MEMORY ERROR';
              Textmain7SetTemp.TextSettings.Font.Size := TitleSize;
              Textmain7SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
             // Textmain7SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                Textmain7SetTemp.Text := '온도과도상승';
              end else
              begin
                Textmain7SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
//              Textmain7Temp.TextSettings.Font.Size := PCTempSize;
//              Textmain7SetTemp.TextSettings.Font.Size := PCTempSetSize;
              Rectanglemain7Alarm.Visible := False;
              FloatAnimation7.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                Rectanglemain7Alarm.Visible := True;
                FloatAnimation7.Enabled := True;
                ImageAlarm7.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                Rectanglemain7Alarm.Visible := True;
                FloatAnimation7.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
              else if TextMain7Temp.Text = 'ER10' then
              begin
                RectangleMain7Alarm.Visible := True;
                FloatAnimation7.Enabled := True;
                ImageAlarm7.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                Rectanglemain7Alarm.Visible := True;
                FloatAnimation7.Enabled := True;
                ImageAlarm7.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                Rectanglemain7Alarm.Visible := False;
                FloatAnimation7.Enabled := False;
              end;
            end else
            begin
              Rectanglemain7Alarm.Visible := False;
              FloatAnimation7.Enabled := False;
            end;
            Next;
          end else
          begin
            main7PlusVisible;
          end;


          if not Eof then
          begin
            Index := Index + 1;
            Imagemain8Plus.Visible := False;
            ImageMain8Logo.Visible := False;
            ImageMain8.Visible := true;
            RectangleMain8Client.Hint := '';
            RectangleMain8Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              Textmain8Name.Text := '단말기'+(((Page-1)*3)+8).ToString;
            end else
            begin
              Textmain8Name.Text := FieldByName('ControllerName').AsString;
            end;
            Textmain8Model.Text := FieldByName('ControllerModel').AsString;
            TextMain8Serial.Text := FieldByName('Serial').AsString;
            TextMain8inDate.Text := FieldByName('WDT').AsString;

            Textmain8TempL.Text := FieldByName('TempName').AsString;
            Textmain8SetTempL.Text := FieldByName('SetTempName').AsString;
            Textmain8RTopC1.Text := FieldByName('In1').AsString;
            Textmain8RTopC2.Text := FieldByName('In2').AsString;
            Textmain8RTopC3.Text := FieldByName('In3').AsString;
            Textmain8RTopC4.Text := FieldByName('In4').AsString;
            Textmain8RTopC5.Text := FieldByName('In5').AsString;
            Textmain8RClientC1.Text := FieldByName('Out1').AsString;
            Textmain8RClientC2.Text := FieldByName('Out2').AsString;
            Textmain8RClientC3.Text := FieldByName('Out3').AsString;
            Textmain8RClientC4.Text := FieldByName('Out4').AsString;
            Textmain8RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then Circlemain8RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain8RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then Circlemain8RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain8RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then Circlemain8RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain8RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then Circlemain8RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain8RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then Circlemain8RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain8RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then Circlemain8RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain8RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then Circlemain8RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain8RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then Circlemain8RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain8RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then Circlemain8RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain8RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then Circlemain8RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain8RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain8RTop.Text := '';
            end;

            if Premain8InCount <> FieldByName('InCount').AsInteger then
            begin
              Premain8InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                Layoutmain8RTopC1.Visible := True;
                Layoutmain8RTopC2.Visible := True;
                Layoutmain8RTopC3.Visible := True;
                Layoutmain8RTopC4.Visible := True;
                Layoutmain8RTopC5.Visible := True;
                Layoutmain8RTopC1.Width := Layoutmain8RTopC.Width / 5;
                Layoutmain8RTopC2.Width := Layoutmain8RTopC.Width / 5;
                Layoutmain8RTopC4.Width := Layoutmain8RTopC.Width / 5;
                Layoutmain8RTopC5.Width := Layoutmain8RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                Layoutmain8RTopC1.Visible := True;
                Layoutmain8RTopC2.Visible := True;
                Layoutmain8RTopC3.Visible := True;
                Layoutmain8RTopC4.Visible := True;
                Layoutmain8RTopC5.Visible := False;
                Layoutmain8RTopC1.Width := Layoutmain8RTopC.Width / 4;
                Layoutmain8RTopC2.Width := Layoutmain8RTopC.Width / 4;
                Layoutmain8RTopC4.Width := Layoutmain8RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                Layoutmain8RTopC1.Visible := True;
                Layoutmain8RTopC2.Visible := True;
                Layoutmain8RTopC3.Visible := True;
                Layoutmain8RTopC4.Visible := False;
                Layoutmain8RTopC5.Visible := False;
                Layoutmain8RTopC1.Width := Layoutmain8RTopC.Width / 3;
                Layoutmain8RTopC2.Width := Layoutmain8RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                Layoutmain8RTopC1.Visible := True;
                Layoutmain8RTopC2.Visible := True;
                Layoutmain8RTopC3.Visible := False;
                Layoutmain8RTopC4.Visible := False;
                Layoutmain8RTopC5.Visible := False;
                Layoutmain8RTopC1.Width := Layoutmain8RTopC.Width / 2;
                Layoutmain8RTopC2.Width := Layoutmain8RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                Layoutmain8RTopC1.Visible := True;
                Layoutmain8RTopC2.Visible := False;
                Layoutmain8RTopC3.Visible := False;
                Layoutmain8RTopC4.Visible := False;
                Layoutmain8RTopC5.Visible := False;
                Layoutmain8RTopC1.Width := Layoutmain8RTopC.Width;
              end else
              begin
                Layoutmain8RTopC1.Visible := False;
                Layoutmain8RTopC2.Visible := False;
                Layoutmain8RTopC3.Visible := False;
                Layoutmain8RTopC4.Visible := False;
                Layoutmain8RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                Layoutmain8RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                Layoutmain8RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                Layoutmain8RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                Layoutmain8RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                Layoutmain8RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                Layoutmain8RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                Layoutmain8RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                Layoutmain8RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                Layoutmain8RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                Layoutmain8RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                Layoutmain8RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                Layoutmain8RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                Layoutmain8RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                Layoutmain8RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                Layoutmain8RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                Layoutmain8RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                Layoutmain8RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                Layoutmain8RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                Layoutmain8RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                Layoutmain8RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                Layoutmain8RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                Layoutmain8RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                Layoutmain8RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                Layoutmain8RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                Layoutmain8RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain8RClientC.Visible := false;
              TextMain8RClient.Visible := false;
              TextMain8RClient.Text := '';
            end
            else
            begin
              LayoutMain8RClientC.Visible := true;
              TextMain8RClient.Visible := true;
              TextMain8RClient.Text    := '출력';
            end;

            if Premain8OutCount <> FieldByName('OutCount').AsInteger then
            begin
              Premain8OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                Layoutmain8RClientC1.Visible := True;
                Layoutmain8RClientC2.Visible := True;
                Layoutmain8RClientC3.Visible := True;
                Layoutmain8RClientC4.Visible := True;
                Layoutmain8RClientC5.Visible := True;
                Layoutmain8RClientC1.Width := Layoutmain8RClientC.Width / 5;
                Layoutmain8RClientC2.Width := Layoutmain8RClientC.Width / 5;
                Layoutmain8RClientC4.Width := Layoutmain8RClientC.Width / 5;
                Layoutmain8RClientC5.Width := Layoutmain8RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                Layoutmain8RClientC1.Visible := True;
                Layoutmain8RClientC2.Visible := True;
                Layoutmain8RClientC3.Visible := True;
                Layoutmain8RClientC4.Visible := True;
                Layoutmain8RClientC5.Visible := False;
                Layoutmain8RClientC1.Width := Layoutmain8RClientC.Width / 4;
                Layoutmain8RClientC2.Width := Layoutmain8RClientC.Width / 4;
                Layoutmain8RClientC4.Width := Layoutmain8RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                Layoutmain8RClientC1.Visible := True;
                Layoutmain8RClientC2.Visible := True;
                Layoutmain8RClientC3.Visible := True;
                Layoutmain8RClientC4.Visible := False;
                Layoutmain8RClientC5.Visible := False;
                Layoutmain8RClientC1.Width := Layoutmain8RClientC.Width / 3;
                Layoutmain8RClientC2.Width := Layoutmain8RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                Layoutmain8RClientC1.Visible := True;
                Layoutmain8RClientC2.Visible := True;
                Layoutmain8RClientC3.Visible := False;
                Layoutmain8RClientC4.Visible := False;
                Layoutmain8RClientC5.Visible := False;
                Layoutmain8RClientC1.Width := Layoutmain8RClientC.Width / 2;
                Layoutmain8RClientC2.Width := Layoutmain8RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                Layoutmain8RClientC1.Visible := True;
                Layoutmain8RClientC2.Visible := False;
                Layoutmain8RClientC3.Visible := False;
                Layoutmain8RClientC4.Visible := False;
                Layoutmain8RClientC5.Visible := False;
                Layoutmain8RClientC1.Width := Layoutmain8RClientC.Width;
              end else
              begin
                Layoutmain8RClientC1.Visible := False;
                Layoutmain8RClientC2.Visible := False;
                Layoutmain8RClientC3.Visible := False;
                Layoutmain8RClientC4.Visible := False;
                Layoutmain8RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              Imagemain8.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain8.MultiResBitmap := ImageWifi2.MultiResBitmap;
              Textmain8Temp.Text := 'ER10';
              Textmain8SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain8.MultiResBitmap := ImageWifi1.MultiResBitmap;
              Textmain8Temp.Text := 'ER10';
              Textmain8SetTemp.Text := '연결끊김';
            end else
            begin
              Imagemain8.MultiResBitmap := ImageWifi0.MultiResBitmap;
              Textmain8Temp.Text := 'ER10';
              Textmain8SetTemp.Text := '연결끊김';
            end;

            if Textmain8Temp.Text = 'ER10' then
            begin
              Circlemain8RTopC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RClientC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RTopC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RClientC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RTopC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RClientC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RTopC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RClientC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RTopC5.Fill.Color := TAlphaColors.Lightgray;
              Circlemain8RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              Textmain8Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if Rectanglemain8Set.Visible then
//              begin
                Textmain8SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                Textmain8SetTemp.Hint := Textmain8SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else  if not FieldByName('PowerState').AsBoolean then
            begin
              Textmain8Temp.Text := 'OFF';
              Textmain8SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              Textmain8Temp.TextSettings.Font.Size := TitleSize;
              Textmain8Temp.Text := 'ER1';
              //Textmain8SetTemp.TextSettings.Font.Size := PCTitleSize;
              Textmain8SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              Textmain8Temp.TextSettings.Font.Size := TitleSize;
              Textmain8Temp.Text := 'MEMORY ERROR';
              Textmain8SetTemp.TextSettings.Font.Size := TitleSize;
              Textmain8SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              //Textmain8SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                Textmain8SetTemp.Text := '온도과도상승';
              end else
              begin
                Textmain8SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
//              Textmain8Temp.TextSettings.Font.Size := PCTempSize;
//              Textmain8SetTemp.TextSettings.Font.Size := PCTempSetSize;
              Rectanglemain8Alarm.Visible := False;
              FloatAnimation8.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                Rectanglemain8Alarm.Visible := True;
                FloatAnimation8.Enabled := True;
                ImageAlarm8.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                Rectanglemain8Alarm.Visible := True;
                FloatAnimation8.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
              else if TextMain8Temp.Text = 'ER10' then
              begin
                RectangleMain8Alarm.Visible := True;
                FloatAnimation8.Enabled := True;
                ImageAlarm8.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                Rectanglemain8Alarm.Visible := True;
                FloatAnimation8.Enabled := True;
                ImageAlarm8.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                Rectanglemain8Alarm.Visible := False;
                FloatAnimation8.Enabled := False;
              end;
            end else
            begin
              Rectanglemain8Alarm.Visible := False;
              FloatAnimation8.Enabled := False;
            end;
            Next;
          end else
          begin
            main8PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            Imagemain9Plus.Visible := False;
            ImageMain9Logo.Visible := False;
            ImageMain9.Visible := true;
            RectangleMain9Client.Hint := '';
            RectangleMain9Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              Textmain9Name.Text := '단말기'+(((Page-1)*3)+9).ToString;
            end else
            begin
              Textmain9Name.Text := FieldByName('ControllerName').AsString;
            end;
            Textmain9Model.Text := FieldByName('ControllerModel').AsString;
            TextMain9Serial.Text := FieldByName('Serial').AsString;
            TextMain9inDate.Text := FieldByName('WDT').AsString;

            Textmain9TempL.Text := FieldByName('TempName').AsString;
            Textmain9SetTempL.Text := FieldByName('SetTempName').AsString;
            Textmain9RTopC1.Text := FieldByName('In1').AsString;
            Textmain9RTopC2.Text := FieldByName('In2').AsString;
            Textmain9RTopC3.Text := FieldByName('In3').AsString;
            Textmain9RTopC4.Text := FieldByName('In4').AsString;
            Textmain9RTopC5.Text := FieldByName('In5').AsString;
            Textmain9RClientC1.Text := FieldByName('Out1').AsString;
            Textmain9RClientC2.Text := FieldByName('Out2').AsString;
            Textmain9RClientC3.Text := FieldByName('Out3').AsString;
            Textmain9RClientC4.Text := FieldByName('Out4').AsString;
            Textmain9RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then Circlemain9RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain9RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then Circlemain9RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain9RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then Circlemain9RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain9RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then Circlemain9RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain9RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then Circlemain9RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain9RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then Circlemain9RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain9RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then Circlemain9RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain9RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then Circlemain9RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain9RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then Circlemain9RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain9RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then Circlemain9RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain9RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain9RTop.Text := '';
            end;

            if Premain9InCount <> FieldByName('InCount').AsInteger then
            begin
              Premain9InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                Layoutmain9RTopC1.Visible := True;
                Layoutmain9RTopC2.Visible := True;
                Layoutmain9RTopC3.Visible := True;
                Layoutmain9RTopC4.Visible := True;
                Layoutmain9RTopC5.Visible := True;
                Layoutmain9RTopC1.Width := Layoutmain9RTopC.Width / 5;
                Layoutmain9RTopC2.Width := Layoutmain9RTopC.Width / 5;
                Layoutmain9RTopC4.Width := Layoutmain9RTopC.Width / 5;
                Layoutmain9RTopC5.Width := Layoutmain9RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                Layoutmain9RTopC1.Visible := True;
                Layoutmain9RTopC2.Visible := True;
                Layoutmain9RTopC3.Visible := True;
                Layoutmain9RTopC4.Visible := True;
                Layoutmain9RTopC5.Visible := False;
                Layoutmain9RTopC1.Width := Layoutmain9RTopC.Width / 4;
                Layoutmain9RTopC2.Width := Layoutmain9RTopC.Width / 4;
                Layoutmain9RTopC4.Width := Layoutmain9RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                Layoutmain9RTopC1.Visible := True;
                Layoutmain9RTopC2.Visible := True;
                Layoutmain9RTopC3.Visible := True;
                Layoutmain9RTopC4.Visible := False;
                Layoutmain9RTopC5.Visible := False;
                Layoutmain9RTopC1.Width := Layoutmain9RTopC.Width / 3;
                Layoutmain9RTopC2.Width := Layoutmain9RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                Layoutmain9RTopC1.Visible := True;
                Layoutmain9RTopC2.Visible := True;
                Layoutmain9RTopC3.Visible := False;
                Layoutmain9RTopC4.Visible := False;
                Layoutmain9RTopC5.Visible := False;
                Layoutmain9RTopC1.Width := Layoutmain9RTopC.Width / 2;
                Layoutmain9RTopC2.Width := Layoutmain9RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                Layoutmain9RTopC1.Visible := True;
                Layoutmain9RTopC2.Visible := False;
                Layoutmain9RTopC3.Visible := False;
                Layoutmain9RTopC4.Visible := False;
                Layoutmain9RTopC5.Visible := False;
                Layoutmain9RTopC1.Width := Layoutmain9RTopC.Width;
              end else
              begin
                Layoutmain9RTopC1.Visible := False;
                Layoutmain9RTopC2.Visible := False;
                Layoutmain9RTopC3.Visible := False;
                Layoutmain9RTopC4.Visible := False;
                Layoutmain9RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                Layoutmain9RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                Layoutmain9RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                Layoutmain9RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                Layoutmain9RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                Layoutmain9RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                Layoutmain9RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                Layoutmain9RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                Layoutmain9RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                Layoutmain9RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                Layoutmain9RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                Layoutmain9RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                Layoutmain9RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                Layoutmain9RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                Layoutmain9RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                Layoutmain9RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                Layoutmain9RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                Layoutmain9RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                Layoutmain9RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                Layoutmain9RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                Layoutmain9RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                Layoutmain9RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                Layoutmain9RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                Layoutmain9RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                Layoutmain9RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                Layoutmain9RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain9RClientC.Visible := false;
              TextMain9RClient.Visible := false;
              TextMain9RClient.Text := '';
            end
            else
            begin
              LayoutMain9RClientC.Visible := true;
              TextMain9RClient.Visible := true;
              TextMain9RClient.Text    := '출력';
            end;

            if Premain9OutCount <> FieldByName('OutCount').AsInteger then
            begin
              Premain9OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                Layoutmain9RClientC1.Visible := True;
                Layoutmain9RClientC2.Visible := True;
                Layoutmain9RClientC3.Visible := True;
                Layoutmain9RClientC4.Visible := True;
                Layoutmain9RClientC5.Visible := True;
                Layoutmain9RClientC1.Width := Layoutmain9RClientC.Width / 5;
                Layoutmain9RClientC2.Width := Layoutmain9RClientC.Width / 5;
                Layoutmain9RClientC4.Width := Layoutmain9RClientC.Width / 5;
                Layoutmain9RClientC5.Width := Layoutmain9RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                Layoutmain9RClientC1.Visible := True;
                Layoutmain9RClientC2.Visible := True;
                Layoutmain9RClientC3.Visible := True;
                Layoutmain9RClientC4.Visible := True;
                Layoutmain9RClientC5.Visible := False;
                Layoutmain9RClientC1.Width := Layoutmain9RClientC.Width / 4;
                Layoutmain9RClientC2.Width := Layoutmain9RClientC.Width / 4;
                Layoutmain9RClientC4.Width := Layoutmain9RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                Layoutmain9RClientC1.Visible := True;
                Layoutmain9RClientC2.Visible := True;
                Layoutmain9RClientC3.Visible := True;
                Layoutmain9RClientC4.Visible := False;
                Layoutmain9RClientC5.Visible := False;
                Layoutmain9RClientC1.Width := Layoutmain9RClientC.Width / 3;
                Layoutmain9RClientC2.Width := Layoutmain9RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                Layoutmain9RClientC1.Visible := True;
                Layoutmain9RClientC2.Visible := True;
                Layoutmain9RClientC3.Visible := False;
                Layoutmain9RClientC4.Visible := False;
                Layoutmain9RClientC5.Visible := False;
                Layoutmain9RClientC1.Width := Layoutmain9RClientC.Width / 2;
                Layoutmain9RClientC2.Width := Layoutmain9RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                Layoutmain9RClientC1.Visible := True;
                Layoutmain9RClientC2.Visible := False;
                Layoutmain9RClientC3.Visible := False;
                Layoutmain9RClientC4.Visible := False;
                Layoutmain9RClientC5.Visible := False;
                Layoutmain9RClientC1.Width := Layoutmain9RClientC.Width;
              end else
              begin
                Layoutmain9RClientC1.Visible := False;
                Layoutmain9RClientC2.Visible := False;
                Layoutmain9RClientC3.Visible := False;
                Layoutmain9RClientC4.Visible := False;
                Layoutmain9RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              Imagemain9.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain9.MultiResBitmap := ImageWifi2.MultiResBitmap;
              Textmain9Temp.Text := 'ER10';
              Textmain9SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain9.MultiResBitmap := ImageWifi1.MultiResBitmap;
              Textmain9Temp.Text := 'ER10';
              Textmain9SetTemp.Text := '연결끊김';
            end else
            begin
              Imagemain9.MultiResBitmap := ImageWifi0.MultiResBitmap;
              Textmain9Temp.Text := 'ER10';
              Textmain9SetTemp.Text := '연결끊김';
            end;

            if Textmain9Temp.Text = 'ER10' then
            begin
              Circlemain9RTopC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RClientC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RTopC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RClientC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RTopC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RClientC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RTopC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RClientC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RTopC5.Fill.Color := TAlphaColors.Lightgray;
              Circlemain9RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              Textmain9Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if Rectanglemain9Set.Visible then
//              begin
                Textmain9SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                Textmain9SetTemp.Hint := Textmain9SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else  if not FieldByName('PowerState').AsBoolean then
            begin
              Textmain9Temp.Text := 'OFF';
              Textmain9SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              Textmain9Temp.TextSettings.Font.Size := TitleSize;
              Textmain9Temp.Text := 'ER1';
              //Textmain9SetTemp.TextSettings.Font.Size := PCTitleSize;
              Textmain9SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              Textmain9Temp.TextSettings.Font.Size := TitleSize;
              Textmain9Temp.Text := 'MEMORY ERROR';
              Textmain9SetTemp.TextSettings.Font.Size := TitleSize;
              Textmain9SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              //Textmain9SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                Textmain9SetTemp.Text := '온도과도상승';
              end else
              begin
                Textmain9SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
//              Textmain9Temp.TextSettings.Font.Size := PCTempSize;
//              Textmain9SetTemp.TextSettings.Font.Size := PCTempSetSize;
              Rectanglemain9Alarm.Visible := False;
              FloatAnimation9.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                Rectanglemain9Alarm.Visible := True;
                FloatAnimation9.Enabled := True;
                ImageAlarm9.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                Rectanglemain9Alarm.Visible := True;
                FloatAnimation9.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
              else if TextMain9Temp.Text = 'ER10' then
              begin
                RectangleMain9Alarm.Visible := True;
                FloatAnimation9.Enabled := True;
                ImageAlarm9.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end
              else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                Rectanglemain9Alarm.Visible := True;
                FloatAnimation9.Enabled := True;
                ImageAlarm9.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                Rectanglemain9Alarm.Visible := False;
                FloatAnimation9.Enabled := False;
              end;
            end else
            begin
              Rectanglemain9Alarm.Visible := False;
              FloatAnimation9.Enabled := False;
            end;
            Next;
          end else
          begin
            main9PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            Imagemain10Plus.Visible := False;
            ImageMain10Logo.Visible := False;
            ImageMain10.Visible := true;
            RectangleMain10Client.Hint := '';
            RectangleMain10Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              Textmain10Name.Text := '단말기'+(((Page-1)*3)+10).ToString;
            end else
            begin
              Textmain10Name.Text := FieldByName('ControllerName').AsString;
            end;
            Textmain10Model.Text := FieldByName('ControllerModel').AsString;
            TextMain10Serial.Text := FieldByName('Serial').AsString;
            TextMain10inDate.Text := FieldByName('WDT').AsString;

            Textmain10TempL.Text := FieldByName('TempName').AsString;
            Textmain10SetTempL.Text := FieldByName('SetTempName').AsString;
            Textmain10RTopC1.Text := FieldByName('In1').AsString;
            Textmain10RTopC2.Text := FieldByName('In2').AsString;
            Textmain10RTopC3.Text := FieldByName('In3').AsString;
            Textmain10RTopC4.Text := FieldByName('In4').AsString;
            Textmain10RTopC5.Text := FieldByName('In5').AsString;
            Textmain10RClientC1.Text := FieldByName('Out1').AsString;
            Textmain10RClientC2.Text := FieldByName('Out2').AsString;
            Textmain10RClientC3.Text := FieldByName('Out3').AsString;
            Textmain10RClientC4.Text := FieldByName('Out4').AsString;
            Textmain10RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then Circlemain10RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain10RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then Circlemain10RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain10RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then Circlemain10RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain10RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then Circlemain10RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain10RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then Circlemain10RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain10RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then Circlemain10RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain10RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then Circlemain10RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain10RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then Circlemain10RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain10RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then Circlemain10RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain10RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then Circlemain10RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain10RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain10RTop.Text := '';
            end;

            if Premain10InCount <> FieldByName('InCount').AsInteger then
            begin
              Premain10InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                Layoutmain10RTopC1.Visible := True;
                Layoutmain10RTopC2.Visible := True;
                Layoutmain10RTopC3.Visible := True;
                Layoutmain10RTopC4.Visible := True;
                Layoutmain10RTopC5.Visible := True;
                Layoutmain10RTopC1.Width := Layoutmain10RTopC.Width / 5;
                Layoutmain10RTopC2.Width := Layoutmain10RTopC.Width / 5;
                Layoutmain10RTopC4.Width := Layoutmain10RTopC.Width / 5;
                Layoutmain10RTopC5.Width := Layoutmain10RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                Layoutmain10RTopC1.Visible := True;
                Layoutmain10RTopC2.Visible := True;
                Layoutmain10RTopC3.Visible := True;
                Layoutmain10RTopC4.Visible := True;
                Layoutmain10RTopC5.Visible := False;
                Layoutmain10RTopC1.Width := Layoutmain10RTopC.Width / 4;
                Layoutmain10RTopC2.Width := Layoutmain10RTopC.Width / 4;
                Layoutmain10RTopC4.Width := Layoutmain10RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                Layoutmain10RTopC1.Visible := True;
                Layoutmain10RTopC2.Visible := True;
                Layoutmain10RTopC3.Visible := True;
                Layoutmain10RTopC4.Visible := False;
                Layoutmain10RTopC5.Visible := False;
                Layoutmain10RTopC1.Width := Layoutmain10RTopC.Width / 3;
                Layoutmain10RTopC2.Width := Layoutmain10RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                Layoutmain10RTopC1.Visible := True;
                Layoutmain10RTopC2.Visible := True;
                Layoutmain10RTopC3.Visible := False;
                Layoutmain10RTopC4.Visible := False;
                Layoutmain10RTopC5.Visible := False;
                Layoutmain10RTopC1.Width := Layoutmain10RTopC.Width / 2;
                Layoutmain10RTopC2.Width := Layoutmain10RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                Layoutmain10RTopC1.Visible := True;
                Layoutmain10RTopC2.Visible := False;
                Layoutmain10RTopC3.Visible := False;
                Layoutmain10RTopC4.Visible := False;
                Layoutmain10RTopC5.Visible := False;
                Layoutmain10RTopC1.Width := Layoutmain10RTopC.Width;
              end else
              begin
                Layoutmain10RTopC1.Visible := False;
                Layoutmain10RTopC2.Visible := False;
                Layoutmain10RTopC3.Visible := False;
                Layoutmain10RTopC4.Visible := False;
                Layoutmain10RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                Layoutmain10RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                Layoutmain10RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                Layoutmain10RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                Layoutmain10RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                Layoutmain10RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                Layoutmain10RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                Layoutmain10RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                Layoutmain10RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                Layoutmain10RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                Layoutmain10RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                Layoutmain10RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                Layoutmain10RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                Layoutmain10RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                Layoutmain10RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                Layoutmain10RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                Layoutmain10RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                Layoutmain10RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                Layoutmain10RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                Layoutmain10RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                Layoutmain10RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                Layoutmain10RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                Layoutmain10RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                Layoutmain10RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                Layoutmain10RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                Layoutmain10RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain10RClientC.Visible := false;
              TextMain10RClient.Visible := false;
              TextMain10RClient.Text := '';
            end
            else
            begin
              LayoutMain10RClientC.Visible := true;
              TextMain10RClient.Visible := true;
              TextMain10RClient.Text    := '출력';
            end;

            if Premain10OutCount <> FieldByName('OutCount').AsInteger then
            begin
              Premain10OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                Layoutmain10RClientC1.Visible := True;
                Layoutmain10RClientC2.Visible := True;
                Layoutmain10RClientC3.Visible := True;
                Layoutmain10RClientC4.Visible := True;
                Layoutmain10RClientC5.Visible := True;
                Layoutmain10RClientC1.Width := Layoutmain10RClientC.Width / 5;
                Layoutmain10RClientC2.Width := Layoutmain10RClientC.Width / 5;
                Layoutmain10RClientC4.Width := Layoutmain10RClientC.Width / 5;
                Layoutmain10RClientC5.Width := Layoutmain10RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                Layoutmain10RClientC1.Visible := True;
                Layoutmain10RClientC2.Visible := True;
                Layoutmain10RClientC3.Visible := True;
                Layoutmain10RClientC4.Visible := True;
                Layoutmain10RClientC5.Visible := False;
                Layoutmain10RClientC1.Width := Layoutmain10RClientC.Width / 4;
                Layoutmain10RClientC2.Width := Layoutmain10RClientC.Width / 4;
                Layoutmain10RClientC4.Width := Layoutmain10RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                Layoutmain10RClientC1.Visible := True;
                Layoutmain10RClientC2.Visible := True;
                Layoutmain10RClientC3.Visible := True;
                Layoutmain10RClientC4.Visible := False;
                Layoutmain10RClientC5.Visible := False;
                Layoutmain10RClientC1.Width := Layoutmain10RClientC.Width / 3;
                Layoutmain10RClientC2.Width := Layoutmain10RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                Layoutmain10RClientC1.Visible := True;
                Layoutmain10RClientC2.Visible := True;
                Layoutmain10RClientC3.Visible := False;
                Layoutmain10RClientC4.Visible := False;
                Layoutmain10RClientC5.Visible := False;
                Layoutmain10RClientC1.Width := Layoutmain10RClientC.Width / 2;
                Layoutmain10RClientC2.Width := Layoutmain10RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                Layoutmain10RClientC1.Visible := True;
                Layoutmain10RClientC2.Visible := False;
                Layoutmain10RClientC3.Visible := False;
                Layoutmain10RClientC4.Visible := False;
                Layoutmain10RClientC5.Visible := False;
                Layoutmain10RClientC1.Width := Layoutmain10RClientC.Width;
              end else
              begin
                Layoutmain10RClientC1.Visible := False;
                Layoutmain10RClientC2.Visible := False;
                Layoutmain10RClientC3.Visible := False;
                Layoutmain10RClientC4.Visible := False;
                Layoutmain10RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              Imagemain10.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain10.MultiResBitmap := ImageWifi2.MultiResBitmap;
              Textmain10Temp.Text := 'ER10';
              Textmain10SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain10.MultiResBitmap := ImageWifi1.MultiResBitmap;
              Textmain10Temp.Text := 'ER10';
              Textmain10SetTemp.Text := '연결끊김';
            end else
            begin
              Imagemain10.MultiResBitmap := ImageWifi0.MultiResBitmap;
              Textmain10Temp.Text := 'ER10';
              Textmain10SetTemp.Text := '연결끊김';
            end;

            if Textmain10Temp.Text = 'ER10' then
            begin
              Circlemain10RTopC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RClientC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RTopC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RClientC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RTopC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RClientC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RTopC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RClientC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RTopC5.Fill.Color := TAlphaColors.Lightgray;
              Circlemain10RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              Textmain10Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if Rectanglemain10Set.Visible then
//              begin
                Textmain10SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                Textmain10SetTemp.Hint := Textmain10SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else  if not FieldByName('PowerState').AsBoolean then
            begin
              Textmain10Temp.Text := 'OFF';
              Textmain10SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              Textmain10Temp.TextSettings.Font.Size := TitleSize;
              Textmain10Temp.Text := 'ER1';
             // Textmain10SetTemp.TextSettings.Font.Size := PCTitleSize;
              Textmain10SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              Textmain10Temp.TextSettings.Font.Size := TitleSize;
              Textmain10Temp.Text := 'MEMORY ERROR';
              Textmain10SetTemp.TextSettings.Font.Size := TitleSize;
              Textmain10SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
             // Textmain10SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                Textmain10SetTemp.Text := '온도과도상승';
              end else
              begin
                Textmain10SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
//              Textmain10Temp.TextSettings.Font.Size := PCTempSize;
//              Textmain10SetTemp.TextSettings.Font.Size := PCTempSetSize;
              Rectanglemain10Alarm.Visible := False;
              FloatAnimation10.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                Rectanglemain10Alarm.Visible := True;
                FloatAnimation10.Enabled := True;
                ImageAlarm10.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                Rectanglemain10Alarm.Visible := True;
                FloatAnimation10.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
              else if TextMain10Temp.Text = 'ER10' then
              begin
                RectangleMain10Alarm.Visible := True;
                FloatAnimation10.Enabled := True;
                ImageAlarm10.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                Rectanglemain10Alarm.Visible := True;
                FloatAnimation10.Enabled := True;
                ImageAlarm10.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                Rectanglemain10Alarm.Visible := False;
                FloatAnimation10.Enabled := False;
              end;
            end else
            begin
              Rectanglemain10Alarm.Visible := False;
              FloatAnimation10.Enabled := False;
            end;
            Next;
          end else
          begin
            main10PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            Imagemain11Plus.Visible := False;
            ImageMain11Logo.Visible := False;
            ImageMain11.Visible := true;
            RectangleMain11Client.Hint := '';
            RectangleMain11Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              Textmain11Name.Text := '단말기'+(((Page-1)*3)+11).ToString;
            end else
            begin
              Textmain11Name.Text := FieldByName('ControllerName').AsString;
            end;
            Textmain11Model.Text := FieldByName('ControllerModel').AsString;
            TextMain11Serial.Text := FieldByName('Serial').AsString;
            TextMain11inDate.Text := FieldByName('WDT').AsString;

            Textmain11TempL.Text := FieldByName('TempName').AsString;
            Textmain11SetTempL.Text := FieldByName('SetTempName').AsString;
            Textmain11RTopC1.Text := FieldByName('In1').AsString;
            Textmain11RTopC2.Text := FieldByName('In2').AsString;
            Textmain11RTopC3.Text := FieldByName('In3').AsString;
            Textmain11RTopC4.Text := FieldByName('In4').AsString;
            Textmain11RTopC5.Text := FieldByName('In5').AsString;
            Textmain11RClientC1.Text := FieldByName('Out1').AsString;
            Textmain11RClientC2.Text := FieldByName('Out2').AsString;
            Textmain11RClientC3.Text := FieldByName('Out3').AsString;
            Textmain11RClientC4.Text := FieldByName('Out4').AsString;
            Textmain11RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then Circlemain11RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain11RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then Circlemain11RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain11RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then Circlemain11RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain11RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then Circlemain11RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain11RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then Circlemain11RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain11RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then Circlemain11RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain11RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then Circlemain11RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain11RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then Circlemain11RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain11RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then Circlemain11RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain11RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then Circlemain11RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain11RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain11RTop.Text := '';
            end;

            if Premain11InCount <> FieldByName('InCount').AsInteger then
            begin
              Premain11InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                Layoutmain11RTopC1.Visible := True;
                Layoutmain11RTopC2.Visible := True;
                Layoutmain11RTopC3.Visible := True;
                Layoutmain11RTopC4.Visible := True;
                Layoutmain11RTopC5.Visible := True;
                Layoutmain11RTopC1.Width := Layoutmain11RTopC.Width / 5;
                Layoutmain11RTopC2.Width := Layoutmain11RTopC.Width / 5;
                Layoutmain11RTopC4.Width := Layoutmain11RTopC.Width / 5;
                Layoutmain11RTopC5.Width := Layoutmain11RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                Layoutmain11RTopC1.Visible := True;
                Layoutmain11RTopC2.Visible := True;
                Layoutmain11RTopC3.Visible := True;
                Layoutmain11RTopC4.Visible := True;
                Layoutmain11RTopC5.Visible := False;
                Layoutmain11RTopC1.Width := Layoutmain11RTopC.Width / 4;
                Layoutmain11RTopC2.Width := Layoutmain11RTopC.Width / 4;
                Layoutmain11RTopC4.Width := Layoutmain11RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                Layoutmain11RTopC1.Visible := True;
                Layoutmain11RTopC2.Visible := True;
                Layoutmain11RTopC3.Visible := True;
                Layoutmain11RTopC4.Visible := False;
                Layoutmain11RTopC5.Visible := False;
                Layoutmain11RTopC1.Width := Layoutmain11RTopC.Width / 3;
                Layoutmain11RTopC2.Width := Layoutmain11RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                Layoutmain11RTopC1.Visible := True;
                Layoutmain11RTopC2.Visible := True;
                Layoutmain11RTopC3.Visible := False;
                Layoutmain11RTopC4.Visible := False;
                Layoutmain11RTopC5.Visible := False;
                Layoutmain11RTopC1.Width := Layoutmain11RTopC.Width / 2;
                Layoutmain11RTopC2.Width := Layoutmain11RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                Layoutmain11RTopC1.Visible := True;
                Layoutmain11RTopC2.Visible := False;
                Layoutmain11RTopC3.Visible := False;
                Layoutmain11RTopC4.Visible := False;
                Layoutmain11RTopC5.Visible := False;
                Layoutmain11RTopC1.Width := Layoutmain11RTopC.Width;
              end else
              begin
                Layoutmain11RTopC1.Visible := False;
                Layoutmain11RTopC2.Visible := False;
                Layoutmain11RTopC3.Visible := False;
                Layoutmain11RTopC4.Visible := False;
                Layoutmain11RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                Layoutmain11RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                Layoutmain11RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                Layoutmain11RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                Layoutmain11RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                Layoutmain11RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                Layoutmain11RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                Layoutmain11RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                Layoutmain11RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                Layoutmain11RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                Layoutmain11RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                Layoutmain11RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                Layoutmain11RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                Layoutmain11RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                Layoutmain11RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                Layoutmain11RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                Layoutmain11RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                Layoutmain11RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                Layoutmain11RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                Layoutmain11RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                Layoutmain11RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                Layoutmain11RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                Layoutmain11RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                Layoutmain11RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                Layoutmain11RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                Layoutmain11RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain11RClientC.Visible := false;
              TextMain11RClient.Visible := false;
              TextMain11RClient.Text := '';
            end
            else
            begin
              LayoutMain11RClientC.Visible := true;
              TextMain11RClient.Visible := true;
              TextMain11RClient.Text    := '출력';
            end;


            if Premain11OutCount <> FieldByName('OutCount').AsInteger then
            begin
              Premain11OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                Layoutmain11RClientC1.Visible := True;
                Layoutmain11RClientC2.Visible := True;
                Layoutmain11RClientC3.Visible := True;
                Layoutmain11RClientC4.Visible := True;
                Layoutmain11RClientC5.Visible := True;
                Layoutmain11RClientC1.Width := Layoutmain11RClientC.Width / 5;
                Layoutmain11RClientC2.Width := Layoutmain11RClientC.Width / 5;
                Layoutmain11RClientC4.Width := Layoutmain11RClientC.Width / 5;
                Layoutmain11RClientC5.Width := Layoutmain11RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                Layoutmain11RClientC1.Visible := True;
                Layoutmain11RClientC2.Visible := True;
                Layoutmain11RClientC3.Visible := True;
                Layoutmain11RClientC4.Visible := True;
                Layoutmain11RClientC5.Visible := False;
                Layoutmain11RClientC1.Width := Layoutmain11RClientC.Width / 4;
                Layoutmain11RClientC2.Width := Layoutmain11RClientC.Width / 4;
                Layoutmain11RClientC4.Width := Layoutmain11RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                Layoutmain11RClientC1.Visible := True;
                Layoutmain11RClientC2.Visible := True;
                Layoutmain11RClientC3.Visible := True;
                Layoutmain11RClientC4.Visible := False;
                Layoutmain11RClientC5.Visible := False;
                Layoutmain11RClientC1.Width := Layoutmain11RClientC.Width / 3;
                Layoutmain11RClientC2.Width := Layoutmain11RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                Layoutmain11RClientC1.Visible := True;
                Layoutmain11RClientC2.Visible := True;
                Layoutmain11RClientC3.Visible := False;
                Layoutmain11RClientC4.Visible := False;
                Layoutmain11RClientC5.Visible := False;
                Layoutmain11RClientC1.Width := Layoutmain11RClientC.Width / 2;
                Layoutmain11RClientC2.Width := Layoutmain11RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                Layoutmain11RClientC1.Visible := True;
                Layoutmain11RClientC2.Visible := False;
                Layoutmain11RClientC3.Visible := False;
                Layoutmain11RClientC4.Visible := False;
                Layoutmain11RClientC5.Visible := False;
                Layoutmain11RClientC1.Width := Layoutmain11RClientC.Width;
              end else
              begin
                Layoutmain11RClientC1.Visible := False;
                Layoutmain11RClientC2.Visible := False;
                Layoutmain11RClientC3.Visible := False;
                Layoutmain11RClientC4.Visible := False;
                Layoutmain11RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              Imagemain11.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain11.MultiResBitmap := ImageWifi2.MultiResBitmap;
              Textmain11Temp.Text := 'ER10';
              Textmain11SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain11.MultiResBitmap := ImageWifi1.MultiResBitmap;
              Textmain11Temp.Text := 'ER10';
              Textmain11SetTemp.Text := '연결끊김';
            end else
            begin
              Imagemain11.MultiResBitmap := ImageWifi0.MultiResBitmap;
              Textmain11Temp.Text := 'ER10';
              Textmain11SetTemp.Text := '연결끊김';
            end;

            if Textmain11Temp.Text = 'ER10' then
            begin
              Circlemain11RTopC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RClientC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RTopC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RClientC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RTopC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RClientC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RTopC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RClientC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RTopC5.Fill.Color := TAlphaColors.Lightgray;
              Circlemain11RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              Textmain11Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if Rectanglemain11Set.Visible then
//              begin
                Textmain11SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                Textmain11SetTemp.Hint := Textmain11SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else if not FieldByName('PowerState').AsBoolean then
            begin
              Textmain11Temp.Text := 'OFF';
              Textmain11SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              Textmain11Temp.TextSettings.Font.Size := TitleSize;
              Textmain11Temp.Text := 'ER1';
           //   Textmain11SetTemp.TextSettings.Font.Size := PCTitleSize;
              Textmain11SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              Textmain11Temp.TextSettings.Font.Size := TitleSize;
              Textmain11Temp.Text := 'MEMORY ERROR';
              Textmain11SetTemp.TextSettings.Font.Size := TitleSize;
              Textmain11SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
           //   Textmain11SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                Textmain11SetTemp.Text := '온도과도상승';
              end else
              begin
                Textmain11SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
//              Textmain11Temp.TextSettings.Font.Size := PCTempSize;
//              Textmain11SetTemp.TextSettings.Font.Size := PCTempSetSize;
              Rectanglemain11Alarm.Visible := False;
              FloatAnimation11.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                Rectanglemain11Alarm.Visible := True;
                FloatAnimation11.Enabled := True;
                ImageAlarm11.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                Rectanglemain11Alarm.Visible := True;
                FloatAnimation11.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end else if TextMain11Temp.Text = 'ER10' then
              begin
                RectangleMain11Alarm.Visible := True;
                FloatAnimation11.Enabled := True;
                ImageAlarm11.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                Rectanglemain11Alarm.Visible := True;
                FloatAnimation11.Enabled := True;
                ImageAlarm11.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                Rectanglemain11Alarm.Visible := False;
                FloatAnimation11.Enabled := False;
              end;
            end else
            begin
              Rectanglemain11Alarm.Visible := False;
              FloatAnimation11.Enabled := False;
            end;
            Next;
          end else
          begin
            main11PlusVisible;
          end;

          if not Eof then
          begin
            Index := Index + 1;
            Imagemain12Plus.Visible := False;
            ImageMain12Logo.Visible := False;
            ImageMain12.Visible := true;
            RectangleMain12Client.Hint := '';
            RectangleMain12Right.Hint  := '';
            if FieldByName('ControllerName').AsString = '' then
            begin
              Textmain12Name.Text := '단말기'+(((Page-1)*3)+12).ToString;
            end else
            begin
              Textmain12Name.Text := FieldByName('ControllerName').AsString;
            end;
            Textmain12Model.Text := FieldByName('ControllerModel').AsString;
            TextMain12Serial.Text := FieldByName('Serial').AsString;
            TextMain12inDate.Text := FieldByName('WDT').AsString;

            Textmain12TempL.Text := FieldByName('TempName').AsString;
            Textmain12SetTempL.Text := FieldByName('SetTempName').AsString;
            Textmain12RTopC1.Text := FieldByName('In1').AsString;
            Textmain12RTopC2.Text := FieldByName('In2').AsString;
            Textmain12RTopC3.Text := FieldByName('In3').AsString;
            Textmain12RTopC4.Text := FieldByName('In4').AsString;
            Textmain12RTopC5.Text := FieldByName('In5').AsString;
            Textmain12RClientC1.Text := FieldByName('Out1').AsString;
            Textmain12RClientC2.Text := FieldByName('Out2').AsString;
            Textmain12RClientC3.Text := FieldByName('Out3').AsString;
            Textmain12RClientC4.Text := FieldByName('Out4').AsString;
            Textmain12RClientC5.Text := FieldByName('Out5').AsString;

              DIn[Index][1] := FieldByName('DIn1').AsBoolean;
              DOut[Index][1] := FieldByName('DOut1').AsBoolean;
              if DIn[Index][1] then Circlemain12RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain12RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][1] then Circlemain12RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain12RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][2] := FieldByName('DIn2').AsBoolean;
              DOut[Index][2] := FieldByName('DOut2').AsBoolean;
              if DIn[Index][2] then Circlemain12RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain12RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][2] then Circlemain12RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain12RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][3] := FieldByName('DIn3').AsBoolean;
              DOut[Index][3] := FieldByName('DOut3').AsBoolean;
              if DIn[Index][3] then Circlemain12RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain12RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][3] then Circlemain12RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain12RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][4] := FieldByName('DIn4').AsBoolean;
              DOut[Index][4] := FieldByName('DOut4').AsBoolean;
              if DIn[Index][4] then Circlemain12RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain12RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][4] then Circlemain12RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain12RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[Index][5] := FieldByName('DIn5').AsBoolean;
              DOut[Index][5] := FieldByName('DOut5').AsBoolean;
              if DIn[Index][5] then Circlemain12RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else Circlemain12RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[Index][5] then Circlemain12RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else Circlemain12RClientC5.Fill.Color := TAlphaColors.Lightgray;

            if FieldByName('InCount').AsInteger = 0 then
            begin
              TextMain12RTop.Text := '';
            end;

            if Premain12InCount <> FieldByName('InCount').AsInteger then
            begin
              Premain12InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                Layoutmain12RTopC1.Visible := True;
                Layoutmain12RTopC2.Visible := True;
                Layoutmain12RTopC3.Visible := True;
                Layoutmain12RTopC4.Visible := True;
                Layoutmain12RTopC5.Visible := True;
                Layoutmain12RTopC1.Width := Layoutmain12RTopC.Width / 5;
                Layoutmain12RTopC2.Width := Layoutmain12RTopC.Width / 5;
                Layoutmain12RTopC4.Width := Layoutmain12RTopC.Width / 5;
                Layoutmain12RTopC5.Width := Layoutmain12RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                Layoutmain12RTopC1.Visible := True;
                Layoutmain12RTopC2.Visible := True;
                Layoutmain12RTopC3.Visible := True;
                Layoutmain12RTopC4.Visible := True;
                Layoutmain12RTopC5.Visible := False;
                Layoutmain12RTopC1.Width := Layoutmain12RTopC.Width / 4;
                Layoutmain12RTopC2.Width := Layoutmain12RTopC.Width / 4;
                Layoutmain12RTopC4.Width := Layoutmain12RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                Layoutmain12RTopC1.Visible := True;
                Layoutmain12RTopC2.Visible := True;
                Layoutmain12RTopC3.Visible := True;
                Layoutmain12RTopC4.Visible := False;
                Layoutmain12RTopC5.Visible := False;
                Layoutmain12RTopC1.Width := Layoutmain12RTopC.Width / 3;
                Layoutmain12RTopC2.Width := Layoutmain12RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                Layoutmain12RTopC1.Visible := True;
                Layoutmain12RTopC2.Visible := True;
                Layoutmain12RTopC3.Visible := False;
                Layoutmain12RTopC4.Visible := False;
                Layoutmain12RTopC5.Visible := False;
                Layoutmain12RTopC1.Width := Layoutmain12RTopC.Width / 2;
                Layoutmain12RTopC2.Width := Layoutmain12RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                Layoutmain12RTopC1.Visible := True;
                Layoutmain12RTopC2.Visible := False;
                Layoutmain12RTopC3.Visible := False;
                Layoutmain12RTopC4.Visible := False;
                Layoutmain12RTopC5.Visible := False;
                Layoutmain12RTopC1.Width := Layoutmain12RTopC.Width;
              end else
              begin
                Layoutmain12RTopC1.Visible := False;
                Layoutmain12RTopC2.Visible := False;
                Layoutmain12RTopC3.Visible := False;
                Layoutmain12RTopC4.Visible := False;
                Layoutmain12RTopC5.Visible := False;
              end;
            end;

            if PreIndex31 <> FieldByName('K1Index').AsInteger then
            begin
              if FieldByName('K1Index').AsInteger = 1 then
              begin
                Layoutmain12RClientC1.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K1Index').AsInteger = 2 then
              begin
                Layoutmain12RClientC1.Align := TAlignLayout.Left;
              end else if FieldByName('K1Index').AsInteger = 3 then
              begin
                Layoutmain12RClientC1.Align := TAlignLayout.Client;
              end else if FieldByName('K1Index').AsInteger = 4 then
              begin
                Layoutmain12RClientC1.Align := TAlignLayout.Right;
              end else if FieldByName('K1Index').AsInteger = 5 then
              begin
                Layoutmain12RClientC1.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex32 <> FieldByName('K2Index').AsInteger then
            begin
              if FieldByName('K2Index').AsInteger = 1 then
              begin
                Layoutmain12RClientC2.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K2Index').AsInteger = 2 then
              begin
                Layoutmain12RClientC2.Align := TAlignLayout.Left;
              end else if FieldByName('K2Index').AsInteger = 3 then
              begin
                Layoutmain12RClientC2.Align := TAlignLayout.Client;
              end else if FieldByName('K2Index').AsInteger = 4 then
              begin
                Layoutmain12RClientC2.Align := TAlignLayout.Right;
              end else if FieldByName('K2Index').AsInteger = 5 then
              begin
                Layoutmain12RClientC2.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex33 <> FieldByName('K3Index').AsInteger then
            begin
              if FieldByName('K3Index').AsInteger = 1 then
              begin
                Layoutmain12RClientC3.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K3Index').AsInteger = 2 then
              begin
                Layoutmain12RClientC3.Align := TAlignLayout.Left;
              end else if FieldByName('K3Index').AsInteger = 3 then
              begin
                Layoutmain12RClientC3.Align := TAlignLayout.Client;
              end else if FieldByName('K3Index').AsInteger = 4 then
              begin
                Layoutmain12RClientC3.Align := TAlignLayout.Right;
              end else if FieldByName('K3Index').AsInteger = 5 then
              begin
                Layoutmain12RClientC3.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex34 <> FieldByName('K4Index').AsInteger then
            begin
              if FieldByName('K4Index').AsInteger = 1 then
              begin
                Layoutmain12RClientC4.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K4Index').AsInteger = 2 then
              begin
                Layoutmain12RClientC4.Align := TAlignLayout.Left;
              end else if FieldByName('K4Index').AsInteger = 3 then
              begin
                Layoutmain12RClientC4.Align := TAlignLayout.Client;
              end else if FieldByName('K4Index').AsInteger = 4 then
              begin
                Layoutmain12RClientC4.Align := TAlignLayout.Right;
              end else if FieldByName('K4Index').AsInteger = 5 then
              begin
                Layoutmain12RClientC4.Align := TAlignLayout.MostRight;
              end;
            end;
            if PreIndex35 <> FieldByName('K5Index').AsInteger then
            begin
              if FieldByName('K5Index').AsInteger = 1 then
              begin
                Layoutmain12RClientC5.Align := TAlignLayout.MostLeft;
              end else if FieldByName('K5Index').AsInteger = 2 then
              begin
                Layoutmain12RClientC5.Align := TAlignLayout.Left;
              end else if FieldByName('K5Index').AsInteger = 3 then
              begin
                Layoutmain12RClientC5.Align := TAlignLayout.Client;
              end else if FieldByName('K5Index').AsInteger = 4 then
              begin
                Layoutmain12RClientC5.Align := TAlignLayout.Right;
              end else if FieldByName('K5Index').AsInteger = 5 then
              begin
                Layoutmain12RClientC5.Align := TAlignLayout.MostRight;
              end;
            end;

            if FieldByName('OutCount').AsInteger = 0 then
            begin
              LayoutMain12RClientC.Visible := false;
              TextMain12RClient.Visible := false;
              TextMain12RClient.Text := '';
            end
            else
            begin
              LayoutMain12RClientC.Visible := true;
              TextMain12RClient.Visible := true;
              TextMain12RClient.Text    := '출력';
            end;

            if Premain12OutCount <> FieldByName('OutCount').AsInteger then
            begin
              Premain12OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                Layoutmain12RClientC1.Visible := True;
                Layoutmain12RClientC2.Visible := True;
                Layoutmain12RClientC3.Visible := True;
                Layoutmain12RClientC4.Visible := True;
                Layoutmain12RClientC5.Visible := True;
                Layoutmain12RClientC1.Width := Layoutmain12RClientC.Width / 5;
                Layoutmain12RClientC2.Width := Layoutmain12RClientC.Width / 5;
                Layoutmain12RClientC4.Width := Layoutmain12RClientC.Width / 5;
                Layoutmain12RClientC5.Width := Layoutmain12RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                Layoutmain12RClientC1.Visible := True;
                Layoutmain12RClientC2.Visible := True;
                Layoutmain12RClientC3.Visible := True;
                Layoutmain12RClientC4.Visible := True;
                Layoutmain12RClientC5.Visible := False;
                Layoutmain12RClientC1.Width := Layoutmain12RClientC.Width / 4;
                Layoutmain12RClientC2.Width := Layoutmain12RClientC.Width / 4;
                Layoutmain12RClientC4.Width := Layoutmain12RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                Layoutmain12RClientC1.Visible := True;
                Layoutmain12RClientC2.Visible := True;
                Layoutmain12RClientC3.Visible := True;
                Layoutmain12RClientC4.Visible := False;
                Layoutmain12RClientC5.Visible := False;
                Layoutmain12RClientC1.Width := Layoutmain12RClientC.Width / 3;
                Layoutmain12RClientC2.Width := Layoutmain12RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                Layoutmain12RClientC1.Visible := True;
                Layoutmain12RClientC2.Visible := True;
                Layoutmain12RClientC3.Visible := False;
                Layoutmain12RClientC4.Visible := False;
                Layoutmain12RClientC5.Visible := False;
                Layoutmain12RClientC1.Width := Layoutmain12RClientC.Width / 2;
                Layoutmain12RClientC2.Width := Layoutmain12RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                Layoutmain12RClientC1.Visible := True;
                Layoutmain12RClientC2.Visible := False;
                Layoutmain12RClientC3.Visible := False;
                Layoutmain12RClientC4.Visible := False;
                Layoutmain12RClientC5.Visible := False;
                Layoutmain12RClientC1.Width := Layoutmain12RClientC.Width;
              end else
              begin
                Layoutmain12RClientC1.Visible := False;
                Layoutmain12RClientC2.Visible := False;
                Layoutmain12RClientC3.Visible := False;
                Layoutmain12RClientC4.Visible := False;
                Layoutmain12RClientC5.Visible := False;
              end;
            end;


            ControllerState[Index] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              Imagemain12.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[Index] := True;
            end else if (Now - (0.0000011574 * 600 * 10)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain12.MultiResBitmap := ImageWifi2.MultiResBitmap;
              Textmain12Temp.Text := 'ER10';
              Textmain12SetTemp.Text := '연결끊김';
            end else if (Now - (0.0000011574 * 600 * 30)) <= FieldByName('CheckDate').AsDateTime then
            begin
              Imagemain12.MultiResBitmap := ImageWifi1.MultiResBitmap;
              Textmain12Temp.Text := 'ER10';
              Textmain12SetTemp.Text := '연결끊김';
            end else
            begin
              Imagemain12.MultiResBitmap := ImageWifi0.MultiResBitmap;
              Textmain12Temp.Text := 'ER10';
              Textmain12SetTemp.Text := '연결끊김';
            end;

            if Textmain12Temp.Text = 'ER10' then
            begin
              Circlemain12RTopC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RClientC1.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RTopC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RClientC2.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RTopC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RClientC3.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RTopC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RClientC4.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RTopC5.Fill.Color := TAlphaColors.Lightgray;
              Circlemain12RClientC5.Fill.Color := TAlphaColors.Lightgray;
            end;


            ControllerID[Index] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[Index] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[Index] := FieldByName('LowTemp').AsFloat;
            DefrostMode[Index] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[Index] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              Textmain12Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if Rectanglemain12Set.Visible then
//              begin
                Textmain12SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                Textmain12SetTemp.Hint := Textmain12SetTemp.Text;
                SetTemp[Index] := FieldByName('SetTemp').AsFloat;
//              end;
            end else  if not FieldByName('PowerState').AsBoolean then
            begin
              Textmain12Temp.Text := 'OFF';
              Textmain12SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              Textmain12Temp.TextSettings.Font.Size := TitleSize;
              Textmain12Temp.Text := 'ER1';
              //Textmain12SetTemp.TextSettings.Font.Size := PCTitleSize;
              Textmain12SetTemp.Text := 'SENSOR ERROR';                {
            end else if FieldByName('Err').AsString = '010' then
            begin
              Textmain12Temp.TextSettings.Font.Size := TitleSize;
              Textmain12Temp.Text := 'MEMORY ERROR';
              Textmain12SetTemp.TextSettings.Font.Size := TitleSize;
              Textmain12SetTemp.Text := 'MEMORY ERROR';                }
            end else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
             // Textmain12SetTemp.TextSettings.Font.Size := PCTitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                Textmain12SetTemp.Text := '온도과도상승';
              end else
              begin
                Textmain12SetTemp.Text := '온도과도하강';
              end;
            end else
            begin
//              Textmain12Temp.TextSettings.Font.Size := PCTempSize;
//              Textmain12SetTemp.TextSettings.Font.Size := PCTempSetSize;
              Rectanglemain12Alarm.Visible := False;
              FloatAnimation12.Enabled := False;
            end;

            DetailAlarm[Index] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
              begin
                Rectanglemain12Alarm.Visible := True;
                FloatAnimation12.Enabled := True;
                ImageAlarm12.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;    {
              end else if FieldByName('Err').AsString = '010' then
              begin
                Rectanglemain12Alarm.Visible := True;
                FloatAnimation12.Enabled := True;
                AlarmCheck := True;
                try
                  if MediaPlayer1.State = TMediaState.Stopped then
                  begin
                    MediaPlayer1.Play;
                  end;
                except

                end;    }
              end
              else if TextMain12Temp.Text = 'ER10' then
              begin
                RectangleMain12Alarm.Visible := True;
                FloatAnimation12.Enabled := True;
                ImageAlarm12.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                Rectanglemain12Alarm.Visible := True;
                FloatAnimation12.Enabled := True;
                ImageAlarm12.Visible := true;
                AlarmCheck := True;
                try
                  if (MediaPlayer1.State = TMediaState.Stopped)
                  or (MediaPlayer1.State = TMediaState.Unavailable) then
                  begin
                    MediaPlayer1.FileName := MP3Files;
                    MediaPlayer1.Play;
                  end;
                except

                end;
              end else
              begin
                Rectanglemain12Alarm.Visible := False;
                FloatAnimation12.Enabled := False;
              end;
            end else
            begin
              Rectanglemain12Alarm.Visible := False;
              FloatAnimation12.Enabled := False;
            end;
            Next;
          end else
          begin
            main12PlusVisible;
          end;

          if not AlarmCheck then
          begin
            try
              if MediaPlayer1.State = TMediaState.Playing then
              begin
                MediaPlayer1.Stop;
              end;
            except

            end;
          end;

        end else
        begin
          Main1PlusVisible;
          Main2PlusVisible;
          Main3PlusVisible;
          Main4PlusVisible;
          Main5PlusVisible;
          Main6PlusVisible;
          Main7PlusVisible;
          Main8PlusVisible;
          Main9PlusVisible;
          Main10PlusVisible;
          Main11PlusVisible;
          Main12PlusVisible;
        end;
      end;

         // MainResize;
            Resize;
    except on e:exception do
      begin
     //   Memo1.Lines.Add(UniQueryTempCheck.FieldByName('ControllerName').AsString  + '= Refresh Error : '+e.Message);
      end;
    end;
  end;
end;

procedure TfDongHwa.MainResize;
begin
  try
    if UniQueryTempCheck.Active = true  then
    begin
      With UniQueryTempCheck do
      begin
        if UniQueryTempCheck.RecordCount > 0 then
        begin
          First;

          PreMain1InCount := FieldByName('InCount').AsInteger;
          if FieldByName('InCount').AsInteger = 5 then
          begin
            LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 5;
            LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 5;
            LayoutMain1RTopC4.Width := LayoutMain1RTopC.Width / 5;
            LayoutMain1RTopC5.Width := LayoutMain1RTopC.Width / 5;
          end else if FieldByName('InCount').AsInteger = 4 then
          begin
            LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 4;
            LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 4;
            LayoutMain1RTopC4.Width := LayoutMain1RTopC.Width / 4;
          end else if FieldByName('InCount').AsInteger = 3 then
          begin
            LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 3;
            LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 3;
          end else if FieldByName('InCount').AsInteger = 2 then
          begin
            LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 2;
            LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 2;
          end else if FieldByName('InCount').AsInteger = 1 then
          begin
            LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width;
          end;

         PreMain1OutCount := FieldByName('OutCount').AsInteger;
          // visible false 에따라

          if FieldByName('OutCount').AsInteger = 5 then
          begin
            LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 5;
            LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 5;
            LayoutMain1RClientC4.Width := LayoutMain1RClientC.Width / 5;
            LayoutMain1RClientC5.Width := LayoutMain1RClientC.Width / 5;
          end else if FieldByName('OutCount').AsInteger = 4 then
          begin
            LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 4;
            LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 4;
            LayoutMain1RClientC4.Width := LayoutMain1RClientC.Width / 4;
          end else if FieldByName('OutCount').AsInteger = 3 then
          begin
            LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 3;
            LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 3;
          end else if FieldByName('OutCount').AsInteger = 2 then
          begin
            LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 2;
            LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 2;
          end else if FieldByName('OutCount').AsInteger = 1 then
          begin
            LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width;
          end;

          if not Eof then
          begin
              PreMain2InCount := FieldByName('InCount').AsInteger;
              if FieldByName('InCount').AsInteger = 5 then
              begin
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 5;
                LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 5;
                LayoutMain2RTopC4.Width := LayoutMain2RTopC.Width / 5;
                LayoutMain2RTopC5.Width := LayoutMain2RTopC.Width / 5;
              end else if FieldByName('InCount').AsInteger = 4 then
              begin
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 4;
                LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 4;
                LayoutMain2RTopC4.Width := LayoutMain2RTopC.Width / 4;
              end else if FieldByName('InCount').AsInteger = 3 then
              begin
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 3;
                LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 3;
              end else if FieldByName('InCount').AsInteger = 2 then
              begin
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 2;
                LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 2;
              end else if FieldByName('InCount').AsInteger = 1 then
              begin
                LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width;
              end;

              PreMain2OutCount := FieldByName('OutCount').AsInteger;
              if FieldByName('OutCount').AsInteger = 5 then
              begin
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 5;
                LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 5;
                LayoutMain2RClientC4.Width := LayoutMain2RClientC.Width / 5;
                LayoutMain2RClientC5.Width := LayoutMain2RClientC.Width / 5;
              end else if FieldByName('OutCount').AsInteger = 4 then
              begin
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 4;
                LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 4;
                LayoutMain2RClientC4.Width := LayoutMain2RClientC.Width / 4;
              end else if FieldByName('OutCount').AsInteger = 3 then
              begin
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 3;
                LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 3;
              end else if FieldByName('OutCount').AsInteger = 2 then
              begin
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 2;
                LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 2;
              end else if FieldByName('OutCount').AsInteger = 1 then
              begin
                LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width;
              end;

          end;

          if not Eof then
          begin
            PreMain3InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 5;
              LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 5;
              LayoutMain3RTopC4.Width := LayoutMain3RTopC.Width / 5;
              LayoutMain3RTopC5.Width := LayoutMain3RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 4;
              LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 4;
              LayoutMain3RTopC4.Width := LayoutMain3RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 3;
              LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 2;
              LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width;
            end;

            PreMain3OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 5;
              LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 5;
              LayoutMain3RClientC4.Width := LayoutMain3RClientC.Width / 5;
              LayoutMain3RClientC5.Width := LayoutMain3RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 4;
              LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 4;
              LayoutMain3RClientC4.Width := LayoutMain3RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 3;
              LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 2;
              LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width;
            end;
          end;

          if not Eof then
          begin
            PreMain4InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 5;
              LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 5;
              LayoutMain4RTopC4.Width := LayoutMain4RTopC.Width / 5;
              LayoutMain4RTopC5.Width := LayoutMain4RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 4;
              LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 4;
              LayoutMain4RTopC4.Width := LayoutMain4RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 3;
              LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 2;
              LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width;
            end;

            PreMain4OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 5;
              LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 5;
              LayoutMain4RClientC4.Width := LayoutMain4RClientC.Width / 5;
              LayoutMain4RClientC5.Width := LayoutMain4RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 4;
              LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 4;
              LayoutMain4RClientC4.Width := LayoutMain4RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 3;
              LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 2;
              LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width;
            end;
          end;

          if not Eof then
          begin
            PreMain5InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain5RTopC1.Width := LayoutMain5RTopC.Width / 5;
              LayoutMain5RTopC2.Width := LayoutMain5RTopC.Width / 5;
              LayoutMain5RTopC4.Width := LayoutMain5RTopC.Width / 5;
              LayoutMain5RTopC5.Width := LayoutMain5RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain5RTopC1.Width := LayoutMain5RTopC.Width / 4;
              LayoutMain5RTopC2.Width := LayoutMain5RTopC.Width / 4;
              LayoutMain5RTopC4.Width := LayoutMain5RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain5RTopC1.Width := LayoutMain5RTopC.Width / 3;
              LayoutMain5RTopC2.Width := LayoutMain5RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain5RTopC1.Width := LayoutMain5RTopC.Width / 2;
              LayoutMain5RTopC2.Width := LayoutMain5RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain5RTopC1.Width := LayoutMain5RTopC.Width;
            end;

            PreMain5OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain5RClientC1.Width := LayoutMain5RClientC.Width / 5;
              LayoutMain5RClientC2.Width := LayoutMain5RClientC.Width / 5;
              LayoutMain5RClientC4.Width := LayoutMain5RClientC.Width / 5;
              LayoutMain5RClientC5.Width := LayoutMain5RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain5RClientC1.Width := LayoutMain5RClientC.Width / 4;
              LayoutMain5RClientC2.Width := LayoutMain5RClientC.Width / 4;
              LayoutMain5RClientC4.Width := LayoutMain5RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain5RClientC1.Width := LayoutMain5RClientC.Width / 3;
              LayoutMain5RClientC2.Width := LayoutMain5RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain5RClientC1.Width := LayoutMain5RClientC.Width / 2;
              LayoutMain5RClientC2.Width := LayoutMain5RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain5RClientC1.Width := LayoutMain5RClientC.Width;
            end;
          end;
          if not Eof then
          begin
            PreMain6InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain6RTopC1.Width := LayoutMain6RTopC.Width / 5;
              LayoutMain6RTopC2.Width := LayoutMain6RTopC.Width / 5;
              LayoutMain6RTopC4.Width := LayoutMain6RTopC.Width / 5;
              LayoutMain6RTopC5.Width := LayoutMain6RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain6RTopC1.Width := LayoutMain6RTopC.Width / 4;
              LayoutMain6RTopC2.Width := LayoutMain6RTopC.Width / 4;
              LayoutMain6RTopC4.Width := LayoutMain6RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain6RTopC1.Width := LayoutMain6RTopC.Width / 3;
              LayoutMain6RTopC2.Width := LayoutMain6RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain6RTopC1.Width := LayoutMain6RTopC.Width / 2;
              LayoutMain6RTopC2.Width := LayoutMain6RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain6RTopC1.Width := LayoutMain6RTopC.Width;
            end;

            PreMain6OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain6RClientC1.Width := LayoutMain6RClientC.Width / 5;
              LayoutMain6RClientC2.Width := LayoutMain6RClientC.Width / 5;
              LayoutMain6RClientC4.Width := LayoutMain6RClientC.Width / 5;
              LayoutMain6RClientC5.Width := LayoutMain6RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain6RClientC1.Width := LayoutMain6RClientC.Width / 4;
              LayoutMain6RClientC2.Width := LayoutMain6RClientC.Width / 4;
              LayoutMain6RClientC4.Width := LayoutMain6RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain6RClientC1.Width := LayoutMain6RClientC.Width / 3;
              LayoutMain6RClientC2.Width := LayoutMain6RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain6RClientC1.Width := LayoutMain6RClientC.Width / 2;
              LayoutMain6RClientC2.Width := LayoutMain6RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain6RClientC1.Width := LayoutMain6RClientC.Width;
            end;
          end;
          if not Eof then
          begin
            PreMain7InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain7RTopC1.Width := LayoutMain7RTopC.Width / 5;
              LayoutMain7RTopC2.Width := LayoutMain7RTopC.Width / 5;
              LayoutMain7RTopC4.Width := LayoutMain7RTopC.Width / 5;
              LayoutMain7RTopC5.Width := LayoutMain7RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain7RTopC1.Width := LayoutMain7RTopC.Width / 4;
              LayoutMain7RTopC2.Width := LayoutMain7RTopC.Width / 4;
              LayoutMain7RTopC4.Width := LayoutMain7RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain7RTopC1.Width := LayoutMain7RTopC.Width / 3;
              LayoutMain7RTopC2.Width := LayoutMain7RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain7RTopC1.Width := LayoutMain7RTopC.Width / 2;
              LayoutMain7RTopC2.Width := LayoutMain7RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain7RTopC1.Width := LayoutMain7RTopC.Width;
            end;

            PreMain7OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain7RClientC1.Width := LayoutMain7RClientC.Width / 5;
              LayoutMain7RClientC2.Width := LayoutMain7RClientC.Width / 5;
              LayoutMain7RClientC4.Width := LayoutMain7RClientC.Width / 5;
              LayoutMain7RClientC5.Width := LayoutMain7RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain7RClientC1.Width := LayoutMain7RClientC.Width / 4;
              LayoutMain7RClientC2.Width := LayoutMain7RClientC.Width / 4;
              LayoutMain7RClientC4.Width := LayoutMain7RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain7RClientC1.Width := LayoutMain7RClientC.Width / 3;
              LayoutMain7RClientC2.Width := LayoutMain7RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain7RClientC1.Width := LayoutMain7RClientC.Width / 2;
              LayoutMain7RClientC2.Width := LayoutMain7RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain7RClientC1.Width := LayoutMain7RClientC.Width;
            end;
          end;

          if not Eof then
          begin
            PreMain8InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain8RTopC1.Width := LayoutMain8RTopC.Width / 5;
              LayoutMain8RTopC2.Width := LayoutMain8RTopC.Width / 5;
              LayoutMain8RTopC4.Width := LayoutMain8RTopC.Width / 5;
              LayoutMain8RTopC5.Width := LayoutMain8RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain8RTopC1.Width := LayoutMain8RTopC.Width / 4;
              LayoutMain8RTopC2.Width := LayoutMain8RTopC.Width / 4;
              LayoutMain8RTopC4.Width := LayoutMain8RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain8RTopC1.Width := LayoutMain8RTopC.Width / 3;
              LayoutMain8RTopC2.Width := LayoutMain8RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain8RTopC1.Width := LayoutMain8RTopC.Width / 2;
              LayoutMain8RTopC2.Width := LayoutMain8RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain8RTopC1.Width := LayoutMain8RTopC.Width;
            end;

            PreMain8OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain8RClientC1.Width := LayoutMain8RClientC.Width / 5;
              LayoutMain8RClientC2.Width := LayoutMain8RClientC.Width / 5;
              LayoutMain8RClientC4.Width := LayoutMain8RClientC.Width / 5;
              LayoutMain8RClientC5.Width := LayoutMain8RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain8RClientC1.Width := LayoutMain8RClientC.Width / 4;
              LayoutMain8RClientC2.Width := LayoutMain8RClientC.Width / 4;
              LayoutMain8RClientC4.Width := LayoutMain8RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain8RClientC1.Width := LayoutMain8RClientC.Width / 3;
              LayoutMain8RClientC2.Width := LayoutMain8RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain8RClientC1.Width := LayoutMain8RClientC.Width / 2;
              LayoutMain8RClientC2.Width := LayoutMain8RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain8RClientC1.Width := LayoutMain8RClientC.Width;
            end;
          end;

          if not Eof then
          begin
            PreMain9InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain9RTopC1.Width := LayoutMain9RTopC.Width / 5;
              LayoutMain9RTopC2.Width := LayoutMain9RTopC.Width / 5;
              LayoutMain9RTopC4.Width := LayoutMain9RTopC.Width / 5;
              LayoutMain9RTopC5.Width := LayoutMain9RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain9RTopC1.Width := LayoutMain9RTopC.Width / 4;
              LayoutMain9RTopC2.Width := LayoutMain9RTopC.Width / 4;
              LayoutMain9RTopC4.Width := LayoutMain9RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain9RTopC1.Width := LayoutMain9RTopC.Width / 3;
              LayoutMain9RTopC2.Width := LayoutMain9RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain9RTopC1.Width := LayoutMain9RTopC.Width / 2;
              LayoutMain9RTopC2.Width := LayoutMain9RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain9RTopC1.Width := LayoutMain9RTopC.Width;
            end;

            PreMain9OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain9RClientC1.Width := LayoutMain9RClientC.Width / 5;
              LayoutMain9RClientC2.Width := LayoutMain9RClientC.Width / 5;
              LayoutMain9RClientC4.Width := LayoutMain9RClientC.Width / 5;
              LayoutMain9RClientC5.Width := LayoutMain9RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain9RClientC1.Width := LayoutMain9RClientC.Width / 4;
              LayoutMain9RClientC2.Width := LayoutMain9RClientC.Width / 4;
              LayoutMain9RClientC4.Width := LayoutMain9RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain9RClientC1.Width := LayoutMain9RClientC.Width / 3;
              LayoutMain9RClientC2.Width := LayoutMain9RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain9RClientC1.Width := LayoutMain9RClientC.Width / 2;
              LayoutMain9RClientC2.Width := LayoutMain9RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain9RClientC1.Width := LayoutMain9RClientC.Width;
            end;
          end;

          if not Eof then
          begin
            PreMain10InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain10RTopC1.Width := LayoutMain10RTopC.Width / 5;
              LayoutMain10RTopC2.Width := LayoutMain10RTopC.Width / 5;
              LayoutMain10RTopC4.Width := LayoutMain10RTopC.Width / 5;
              LayoutMain10RTopC5.Width := LayoutMain10RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain10RTopC1.Width := LayoutMain10RTopC.Width / 4;
              LayoutMain10RTopC2.Width := LayoutMain10RTopC.Width / 4;
              LayoutMain10RTopC4.Width := LayoutMain10RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain10RTopC1.Width := LayoutMain10RTopC.Width / 3;
              LayoutMain10RTopC2.Width := LayoutMain10RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain10RTopC1.Width := LayoutMain10RTopC.Width / 2;
              LayoutMain10RTopC2.Width := LayoutMain10RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain10RTopC1.Width := LayoutMain10RTopC.Width;
            end;

            PreMain10OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain10RClientC1.Width := LayoutMain10RClientC.Width / 5;
              LayoutMain10RClientC2.Width := LayoutMain10RClientC.Width / 5;
              LayoutMain10RClientC4.Width := LayoutMain10RClientC.Width / 5;
              LayoutMain10RClientC5.Width := LayoutMain10RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain10RClientC1.Width := LayoutMain10RClientC.Width / 4;
              LayoutMain10RClientC2.Width := LayoutMain10RClientC.Width / 4;
              LayoutMain10RClientC4.Width := LayoutMain10RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain10RClientC1.Width := LayoutMain10RClientC.Width / 3;
              LayoutMain10RClientC2.Width := LayoutMain10RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain10RClientC1.Width := LayoutMain10RClientC.Width / 2;
              LayoutMain10RClientC2.Width := LayoutMain10RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain10RClientC1.Width := LayoutMain10RClientC.Width;
            end;
          end;

          if not Eof then
          begin
            PreMain11InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain11RTopC1.Width := LayoutMain11RTopC.Width / 5;
              LayoutMain11RTopC2.Width := LayoutMain11RTopC.Width / 5;
              LayoutMain11RTopC4.Width := LayoutMain11RTopC.Width / 5;
              LayoutMain11RTopC5.Width := LayoutMain11RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain11RTopC1.Width := LayoutMain11RTopC.Width / 4;
              LayoutMain11RTopC2.Width := LayoutMain11RTopC.Width / 4;
              LayoutMain11RTopC4.Width := LayoutMain11RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain11RTopC1.Width := LayoutMain11RTopC.Width / 3;
              LayoutMain11RTopC2.Width := LayoutMain11RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain11RTopC1.Width := LayoutMain11RTopC.Width / 2;
              LayoutMain11RTopC2.Width := LayoutMain11RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain11RTopC1.Width := LayoutMain11RTopC.Width;
            end;

            PreMain11OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain11RClientC1.Width := LayoutMain11RClientC.Width / 5;
              LayoutMain11RClientC2.Width := LayoutMain11RClientC.Width / 5;
              LayoutMain11RClientC4.Width := LayoutMain11RClientC.Width / 5;
              LayoutMain11RClientC5.Width := LayoutMain11RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain11RClientC1.Width := LayoutMain11RClientC.Width / 4;
              LayoutMain11RClientC2.Width := LayoutMain11RClientC.Width / 4;
              LayoutMain11RClientC4.Width := LayoutMain11RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain11RClientC1.Width := LayoutMain11RClientC.Width / 3;
              LayoutMain11RClientC2.Width := LayoutMain11RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain11RClientC1.Width := LayoutMain11RClientC.Width / 2;
              LayoutMain11RClientC2.Width := LayoutMain11RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain11RClientC1.Width := LayoutMain11RClientC.Width;
            end;
          end;

          if not Eof then
          begin
            PreMain12InCount := FieldByName('InCount').AsInteger;
            if FieldByName('InCount').AsInteger = 5 then
            begin
              LayoutMain12RTopC1.Width := LayoutMain12RTopC.Width / 5;
              LayoutMain12RTopC2.Width := LayoutMain12RTopC.Width / 5;
              LayoutMain12RTopC4.Width := LayoutMain12RTopC.Width / 5;
              LayoutMain12RTopC5.Width := LayoutMain12RTopC.Width / 5;
            end else if FieldByName('InCount').AsInteger = 4 then
            begin
              LayoutMain12RTopC1.Width := LayoutMain12RTopC.Width / 4;
              LayoutMain12RTopC2.Width := LayoutMain12RTopC.Width / 4;
              LayoutMain12RTopC4.Width := LayoutMain12RTopC.Width / 4;
            end else if FieldByName('InCount').AsInteger = 3 then
            begin
              LayoutMain12RTopC1.Width := LayoutMain12RTopC.Width / 3;
              LayoutMain12RTopC2.Width := LayoutMain12RTopC.Width / 3;
            end else if FieldByName('InCount').AsInteger = 2 then
            begin
              LayoutMain12RTopC1.Width := LayoutMain12RTopC.Width / 2;
              LayoutMain12RTopC2.Width := LayoutMain12RTopC.Width / 2;
            end else if FieldByName('InCount').AsInteger = 1 then
            begin
              LayoutMain12RTopC1.Width := LayoutMain12RTopC.Width;
            end;

            PreMain12OutCount := FieldByName('OutCount').AsInteger;
            if FieldByName('OutCount').AsInteger = 5 then
            begin
              LayoutMain12RClientC1.Width := LayoutMain12RClientC.Width / 5;
              LayoutMain12RClientC2.Width := LayoutMain12RClientC.Width / 5;
              LayoutMain12RClientC4.Width := LayoutMain12RClientC.Width / 5;
              LayoutMain12RClientC5.Width := LayoutMain12RClientC.Width / 5;
            end else if FieldByName('OutCount').AsInteger = 4 then
            begin
              LayoutMain12RClientC1.Width := LayoutMain12RClientC.Width / 4;
              LayoutMain12RClientC2.Width := LayoutMain12RClientC.Width / 4;
              LayoutMain12RClientC4.Width := LayoutMain12RClientC.Width / 4;
            end else if FieldByName('OutCount').AsInteger = 3 then
            begin
              LayoutMain12RClientC1.Width := LayoutMain12RClientC.Width / 3;
              LayoutMain12RClientC2.Width := LayoutMain12RClientC.Width / 3;
            end else if FieldByName('OutCount').AsInteger = 2 then
            begin
              LayoutMain12RClientC1.Width := LayoutMain12RClientC.Width / 2;
              LayoutMain12RClientC2.Width := LayoutMain12RClientC.Width / 2;
            end else if FieldByName('OutCount').AsInteger = 1 then
            begin
              LayoutMain12RClientC1.Width := LayoutMain12RClientC.Width;
            end;
          end;

        end;
      end;
    end;

  except on e:exception do
    begin
      //Memo1.Lines.Add(UniQueryTempCheck.FieldByName('ControllerName').AsString   + '= Refresh Error : '+e.Message);
    end;
  end;
end;

procedure TfDongHwa.MinusImageClick(Sender: TObject);
var
  SenderTag : Integer;
begin
  SenderTag := (Sender as TImage).Tag;
  SetTemp[SenderTag] := SetTemp[SenderTag] - 0.1;
  (FindComponent('TextMain'+SenderTag.ToString+'SetTemp') as TText).Text :=
                          FormatFloat('0.0',SetTemp[SenderTag])+'℃';
end;

procedure TfDongHwa.PlusImageClick(Sender: TObject);
var
  SenderTag : Integer;
begin
  SenderTag := (Sender as TImage).Tag;
  SetTemp[SenderTag] := SetTemp[SenderTag] + 0.1;
  (FindComponent('TextMain'+SenderTag.ToString+'SetTemp') as TText).Text :=
                          FormatFloat('0.0',SetTemp[SenderTag])+'℃';
end;

procedure TfDongHwa.RectangleGraphSaveTimeClick(Sender: TObject);
begin
//  SelectKNumber := SelectKNumber + 1;
//  if SelectKNumber > KOutCount then
//  begin
//    SelectKNumber := 1;
//  end;
//  SaveTimeDisplay;
end;

procedure TfDongHwa.RectangleMain1MouseEnter(Sender: TObject);
begin
 TRectangle(Sender).Stroke.Color := TAlphaColorRec.Yellow;  // 테두리 색상 강조
  TRectangle(Sender).Stroke.Thickness := 10;
end;

procedure TfDongHwa.RectangleMain1MouseLeave(Sender: TObject);
begin
 TRectangle(Sender).Stroke.Color := TAlphaColorRec.White;  //
   TRectangle(Sender).Stroke.Thickness := 1;
end;

procedure TfDongHwa.RectangleMainBackGroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
//  MouseDownY := Y;
//  MouseDownCheck := True;
//  TimerMouseDown.Enabled := True;
end;

procedure TfDongHwa.RectangleMainBackGroundMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
//  MouseDownCheck := False;
//  TimerMouseDown.Enabled := False;
end;

procedure TfDongHwa.Resize;
var
  FFontScale : Double;
  checkin, checkout : integer;
  ButtonWidth, ButtonHeight, ButtonSpacing, TotalWidth: Single;
  SFontSize, SWidth : Single;
begin
  FFontScale := 1.0;
  checkin := 0;
  checkout := 0;
  {$IFDEF ANDROID}
  if TAndroidHelper.Context <> nil then
  begin
    var Resource := TAndroidHelper.Context.getResources;
    if Resource <> nil then
    begin
      var Configuration := Resource.getConfiguration;
      if Configuration <> nil then
      begin
        FFontScale := Round(Configuration.fontScale * 100) / 100;
      end;
    end;
  end;
  {$ENDIF ANDROID}
    TempSizePercent := 0.65;
    TempSize := Round(ClientWidth / 6);// * FFontScale);        8
    TempSetSize := Round(ClientWidth / 6);// * FFontScale);    10
    TitleSize := Round(ClientWidth / 15);// * FFontScale);      20
    MiddleSize := Round(ClientWidth / 20);// * FFontScale);     25
    LowSize := Round(ClientWidth / 22);// * FFontScale);        30
    MostLowSize := Round(ClientWidth / 35);// * FFontScale);    40

  {$IFDEF MSWINDOWS}
    ClientWidthDiv3 := ClientWidth Div 3;
    RectangleMainG1.Width := ClientWidthDiv3;
    RectangleMainG2.Width := ClientWidthDiv3;
    RectangleMainG3.Width := ClientWidthDiv3;

     SFontSize := RectangleMain1Serial.Width / 15;
     SWidth    := TextMain1Model.Width/3.77;
    PCTempSize    := Round(ClientWidthDiv3 / 16);
    PCTempSetSize := Round(ClientWidthDiv3 / 16);
    PCerrSize     := Round(ClientWidthDiv3 / 20);
    PCerrSetSize  := Round(ClientWidthDiv3 / 20);

    PCTitleSize := Round(ClientWidthDiv3 / 15);
    PCMiddleSize := Round(ClientWidthDiv3 / 20);
    PCLowSize := Round(ClientWidthDiv3 / 22);
    PCMostLowSize := Round(ClientWidthDiv3 / 35);
    PCrTOPSize := Round(ClientWidthDiv3 / 45);
  {$ENDIF MSWINDOWS}

  // 최상단
    Rectangletop.Height :=   ClientHeight / 21.6;
   Text_Timer.Width  := Rectangletop.Width / 4.7;
   Text_UserID.width := Rectangletop.Width / 7.27;
   Image_Home.Width :=  Rectangletop.Width / 19.2;

   Text_Timer.Font.Size  := PCLowSize;
   Text_UserID.Font.Size := PCLowSize;
   Text_Title.Font.Size  := PCLowSize;
   Text_Update.Font.Size := PCLowSize;

/////////////////////////////////////////////////////
  CheckBoxPassword.TextSettings.Font.Size := LowSize;

  TextNote.TextSettings.Font.Size  := MostLowSize*1.5;
  TextNote2.TextSettings.Font.Size := MostLowSize*1.5;
  TextNote3.TextSettings.Font.Size := MostLowSize*1.5;
  TextNote4.TextSettings.Font.Size := MostLowSize*1.5;
  TextNote5.TextSettings.Font.Size := MostLowSize*1.5;

  //메인
  TextMain.TextSettings.Font.Size := PCTitleSize;
  TextMainBottom.TextSettings.Font.Size := PCTitleSize;

  TextMain1Name.TextSettings.Font.Size := PCTitleSize;
  TextMain2Name.TextSettings.Font.Size := PCTitleSize;
  TextMain3Name.TextSettings.Font.Size := PCTitleSize;

  TextMain4Name.TextSettings.Font.Size := PCTitleSize;
  TextMain5Name.TextSettings.Font.Size := PCTitleSize;
  TextMain6Name.TextSettings.Font.Size := PCTitleSize;
  TextMain7Name.TextSettings.Font.Size := PCTitleSize;
  TextMain8Name.TextSettings.Font.Size := PCTitleSize;
  TextMain9Name.TextSettings.Font.Size := PCTitleSize;
  TextMain10Name.TextSettings.Font.Size := PCTitleSize;
  TextMain11Name.TextSettings.Font.Size := PCTitleSize;
  TextMain12Name.TextSettings.Font.Size := PCTitleSize;

  TextMain1Model.TextSettings.Font.Size := PCLowSize;
  TextMain2Model.TextSettings.Font.Size := PCLowSize;
  TextMain3Model.TextSettings.Font.Size := PCLowSize;

  TextMain4Model.TextSettings.Font.Size := PCLowSize;
  TextMain5Model.TextSettings.Font.Size := PCLowSize;
  TextMain6Model.TextSettings.Font.Size := PCLowSize;
  TextMain7Model.TextSettings.Font.Size := PCLowSize;
  TextMain8Model.TextSettings.Font.Size := PCLowSize;
  TextMain9Model.TextSettings.Font.Size := PCLowSize;
  TextMain10Model.TextSettings.Font.Size := PCLowSize;
  TextMain11Model.TextSettings.Font.Size := PCLowSize;
  TextMain12Model.TextSettings.Font.Size := PCLowSize;

  TextMain1TempL.TextSettings.Font.Size := PCLowSize;
  TextMain2TempL.TextSettings.Font.Size := PCLowSize;
  TextMain3TempL.TextSettings.Font.Size := PCLowSize;
  TextMain4TempL.TextSettings.Font.Size := PCLowSize;
  TextMain5TempL.TextSettings.Font.Size := PCLowSize;
  TextMain6TempL.TextSettings.Font.Size := PCLowSize;
  TextMain7TempL.TextSettings.Font.Size := PCLowSize;
  TextMain8TempL.TextSettings.Font.Size := PCLowSize;
  TextMain9TempL.TextSettings.Font.Size := PCLowSize;
  TextMain10TempL.TextSettings.Font.Size := PCLowSize;
  TextMain11TempL.TextSettings.Font.Size := PCLowSize;
  TextMain12TempL.TextSettings.Font.Size := PCLowSize;

//  TextMain1Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain2Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain3Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain4Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain5Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain6Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain7Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain8Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain9Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain10Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain11Temp.TextSettings.Font.Size := PCTempSize;
//  TextMain12Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain1Temp.Text) >= 5 then
    TextMain1Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain1Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain2Temp.Text) >= 5 then
    TextMain2Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain2Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain3Temp.Text) >= 5 then
    TextMain3Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain3Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain4Temp.Text) >= 5 then
    TextMain4Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain4Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain5Temp.Text) >= 5 then
    TextMain5Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain5Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain6Temp.Text) >= 5 then
    TextMain6Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain6Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain7Temp.Text) >= 5 then
    TextMain7Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain7Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain8Temp.Text) >= 5 then
    TextMain8Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain8Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain9Temp.Text) >= 5 then
    TextMain9Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain9Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain10Temp.Text) >= 5 then
    TextMain10Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain10Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain11Temp.Text) >= 5 then
    TextMain11Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain11Temp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain12Temp.Text) >= 5 then
    TextMain12Temp.TextSettings.Font.Size := PCerrSize
  else
    TextMain12Temp.TextSettings.Font.Size := PCTempSize;

  TextMain1TempR.TextSettings.Font.Size := PCLowSize;
  TextMain2TempR.TextSettings.Font.Size := PCLowSize;
  TextMain3TempR.TextSettings.Font.Size := PCLowSize;
  TextMain4TempR.TextSettings.Font.Size := PCLowSize;
  TextMain5TempR.TextSettings.Font.Size := PCLowSize;
  TextMain6TempR.TextSettings.Font.Size := PCLowSize;
  TextMain7TempR.TextSettings.Font.Size := PCLowSize;
  TextMain8TempR.TextSettings.Font.Size := PCLowSize;
  TextMain9TempR.TextSettings.Font.Size := PCLowSize;
  TextMain10TempR.TextSettings.Font.Size := PCLowSize;
  TextMain11TempR.TextSettings.Font.Size := PCLowSize;
  TextMain12TempR.TextSettings.Font.Size := PCLowSize;

  TextMain1SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain2SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain3SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain4SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain5SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain6SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain7SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain8SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain9SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain10SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain11SetTempL.TextSettings.Font.Size := PCLowSize;
  TextMain12SetTempL.TextSettings.Font.Size := PCLowSize;

//  TextMain1SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain2SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain3SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain4SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain5SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain6SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain7SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain8SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain9SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain10SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain11SetTemp.TextSettings.Font.Size := PCTempSetSize;
//  TextMain12SetTemp.TextSettings.Font.Size := PCTempSetSize;

  if Length(TextMain1SetTemp.Text) >= 5 then
    TextMain1SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain1SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain2SetTemp.Text) >= 5 then
    TextMain2SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain2SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain3SetTemp.Text) >= 5 then
    TextMain3SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain3SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain4SetTemp.Text) >= 5 then
    TextMain4SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain4SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain5SetTemp.Text) >= 5 then
    TextMain5SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain5SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain6SetTemp.Text) >= 5 then
    TextMain6SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain6SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain7SetTemp.Text) >= 5 then
    TextMain7SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain7SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain8SetTemp.Text) >= 5 then
    TextMain8SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain8SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain9SetTemp.Text) >= 5 then
    TextMain9SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain9SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain10SetTemp.Text) >= 5 then
    TextMain10SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain10SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain11SetTemp.Text) >= 5 then
    TextMain11SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain11SetTemp.TextSettings.Font.Size := PCTempSize;

  if Length(TextMain12SetTemp.Text) >= 5 then
    TextMain12SetTemp.TextSettings.Font.Size := PCerrSize
  else
    TextMain12SetTemp.TextSettings.Font.Size := PCTempSize;

  RectangleMain1Serial.Width := SWidth;
  RectangleMain2Serial.Width := SWidth;
  RectangleMain3Serial.Width := SWidth;
  RectangleMain4Serial.Width := SWidth;
  RectangleMain5Serial.Width := SWidth;
  RectangleMain6Serial.Width := SWidth;
  RectangleMain7Serial.Width := SWidth;
  RectangleMain8Serial.Width := SWidth;
  RectangleMain9Serial.Width := SWidth;
  RectangleMain10Serial.Width := SWidth;
  RectangleMain11Serial.Width := SWidth;
  RectangleMain12Serial.Width := SWidth;

  TextMain1Serial.TextSettings.Font.Size := SFontSize;
  TextMain2Serial.TextSettings.Font.Size := SFontSize;
  TextMain3Serial.TextSettings.Font.Size := SFontSize;
  TextMain4Serial.TextSettings.Font.Size := SFontSize;
  TextMain5Serial.TextSettings.Font.Size := SFontSize;
  TextMain6Serial.TextSettings.Font.Size := SFontSize;
  TextMain7Serial.TextSettings.Font.Size := SFontSize;
  TextMain8Serial.TextSettings.Font.Size := SFontSize;
  TextMain9Serial.TextSettings.Font.Size := SFontSize;
  TextMain10Serial.TextSettings.Font.Size := SFontSize;
  TextMain11Serial.TextSettings.Font.Size := SFontSize;
  TextMain12Serial.TextSettings.Font.Size := SFontSize;

  TextMain1inDate.TextSettings.Font.Size := SFontSize;
  TextMain2inDate.TextSettings.Font.Size := SFontSize;
  TextMain3inDate.TextSettings.Font.Size := SFontSize;
  TextMain4inDate.TextSettings.Font.Size := SFontSize;
  TextMain5inDate.TextSettings.Font.Size := SFontSize;
  TextMain6inDate.TextSettings.Font.Size := SFontSize;
  TextMain7inDate.TextSettings.Font.Size := SFontSize;
  TextMain8inDate.TextSettings.Font.Size := SFontSize;
  TextMain9inDate.TextSettings.Font.Size := SFontSize;
  TextMain10inDate.TextSettings.Font.Size := SFontSize;
  TextMain11inDate.TextSettings.Font.Size := SFontSize;
  TextMain12inDate.TextSettings.Font.Size := SFontSize;

  TextMain1SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain2SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain3SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain4SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain5SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain6SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain7SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain8SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain9SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain10SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain11SetTempR.TextSettings.Font.Size := PCLowSize;
  TextMain12SetTempR.TextSettings.Font.Size := PCLowSize;


  TextMain1Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain2Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain3Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain4Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain5Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain6Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain7Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain8Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain9Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain10Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain11Set.TextSettings.Font.Size := PCMiddleSize;
  TextMain12Set.TextSettings.Font.Size := PCMiddleSize;


  TextMain1SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain2SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain3SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain4SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain5SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain6SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain7SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain8SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain9SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain10SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain11SetSave.TextSettings.Font.Size := PCMiddleSize;
  TextMain12SetSave.TextSettings.Font.Size := PCMiddleSize;

  TextMain1RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain1RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain1RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain1RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain1RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain1RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain2RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain3RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain4RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain5RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain6RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain7RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain8RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain9RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain10RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain11RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RTopC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RTop.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain12RTopC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RTopC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RTopC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RTopC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RTopC5.TextSettings.Font.Size := PCrTOPSize;

  TextMain1RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain1RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain1RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain1RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain1RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain1RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain2RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain2RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain3RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain3RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain4RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain4RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain5RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain5RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain6RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain6RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain7RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain7RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain8RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain8RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain9RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain9RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain10RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain10RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain11RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain11RClientC5.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RClient.TextSettings.Font.Size := PCMostLowSize+3;
  TextMain12RClientC1.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RClientC2.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RClientC3.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RClientC4.TextSettings.Font.Size := PCrTOPSize;
  TextMain12RClientC5.TextSettings.Font.Size := PCrTOPSize;

  ImageMainPrior.Width := ClientWidth / 38.4;
  ImageMainNext.Width  := ClientWidth / 38.4;
  RectangleMainBottom.Height := ClientHeight / 21.6;

  Panel_Load.Width := ClientWidth * 0.4;
  Panel_Load.Height := ClientHeight * 0.1;

  Panel_Load.Position.x := (ClientWidth - Panel_Load.Width)/ 2;
  Panel_Load.Position.y := (ClientHeight - Panel_Load.Height) / 2.5;

  //회원가입
  TextJoinWarning.TextSettings.Font.Size := MostLowSize;

  TextJoinID.TextSettings.Font.Size := LowSize;
  TextJoinPW.TextSettings.Font.Size := LowSize;
  TextJoinPW2.TextSettings.Font.Size := LowSize;
  TextJoinCompany.TextSettings.Font.Size := LowSize;

  LayoutJoin.Margins.Right := ClientHeight / 10;
  LayoutJoin.Margins.Left := ClientHeight / 10;

  LayoutJoin.Height := ClientHeight / 2;
  LayoutJoinID.Height := LayoutJoin.Height / 5;
  LayoutJoinPW.Height := LayoutJoin.Height / 5;
  LayoutJoinPW2.Height := LayoutJoin.Height / 5;
  LayoutJoinCompany.Height := LayoutJoin.Height / 5;
  RectangleJoinAdd.Height := LayoutJoin.Height / 5;

  TextJoinID.Height := LayoutJoinID.Height / 2;
  TextJoinPW.Height := LayoutJoinPW.Height / 2;
  TextJoinPW2.Height := LayoutJoinPW2.Height / 2;
  TextJoinCompany.Height := LayoutJoinCompany.Height / 2;

  LayoutJoinID.Position.Y := 0;
  LayoutJoinPW.Position.Y := LayoutJoinID.Position.Y + LayoutJoinID.Height + 10;
  LayoutJoinPW2.Position.Y := LayoutJoinPW.Position.Y + LayoutJoinPW.Height + 10;
  LayoutJoinCompany.Position.Y := LayoutJoinPW2.Position.Y + LayoutJoinPW2.Height + 10;
  RectangleJoinAdd.Position.Y := LayoutJoinCompany.Position.Y + LayoutJoinCompany.Height + 10;

  //그래프
  TextGraphTitle.TextSettings.Font.Size := PCTitleSize ;
  //TextGraphChange.TextSettings.Font.Size := PCMiddleSize;
  TextGraphDevice.TextSettings.Font.Size := PCMiddleSize;
  EditGraphModel.TextSettings.Font.Size := PCTitleSize;

//  RectangleGraphSaveTime.Width := LayoutGraphExpand.Width / 4;
//  RectangleGraphExpand.Width := LayoutGraphExpand.Width / 4;
//  TextSaveTime.Width := RectangleGraphSaveTime.Width / 3;

  TextSaveTime.Font.Size := PCMostLowSize-1;
  TextGraphSaveTimeTitle1.Font.Size := PCMostLowSize;
  TextGraphSaveTimeValue1.Font.Size := PCMostLowSize;

  TextGraphSaveTimeTitle2.Font.Size := PCMostLowSize;
  TextGraphSaveTimeValue2.Font.Size := PCMostLowSize;

  TextGraphSaveTimeTitle3.Font.Size := PCMostLowSize;
  TextGraphSaveTimeValue3.Font.Size := PCMostLowSize;

  TextGraphSaveTimeTitle4.Font.Size := PCMostLowSize;
  TextGraphSaveTimeValue4.Font.Size := PCMostLowSize;

  TextGraphSaveTimeTitle5.Font.Size := PCMostLowSize;
  TextGraphSaveTimeValue5.Font.Size := PCMostLowSize;

  Text_Detail4_chart.Font.Size := PCMostLowSize;
  Text_Detail4_excel.Font.Size := PCMostLowSize;

  ImageGraphPlus.Width := ImageGraphPlus.Height;
  ImageGraphMinus.Width := ImageGraphMinus.Height;
  TextGraphExpand.TextSettings.Font.Size := PCTitleSize;

  //상세
  TextDetailTitle.TextSettings.Font.Size := PCLowSize;
  TextDetailSaveButton.TextSettings.Font.Size := PCMostLowSize;
  TextDetailChange.TextSettings.Font.Size := PCMostLowSize;

  TextDetailModel.TextSettings.Font.Size := PCLowSize;
  EditDetailName.TextSettings.Font.Size := PCLowSize;
  TextEditDetailName.TextSettings.Font.Size := PCLowSize;

  TextEditDetailTemp.TextSettings.Font.Size := PCLowSize;//PCLowSize;
  EditDetailTemp.TextSettings.Font.Size := PCLowSize;//PCLowSize;
  TextDetailTemp.TextSettings.Font.Size := PCLowSize;//PCLowSize;
  TextEditDetailSetTemp.TextSettings.Font.Size := PCLowSize;//PCLowSize;
  EditDetailSetTemp.TextSettings.Font.Size := PCLowSize;//PCLowSize;
  TextDetailSetTemp.TextSettings.Font.Size := PCLowSize;//PCLowSize;
  TextDetailSetTempEdit.TextSettings.Font.Size := PCLowSize;//PCLowSize;

  TextDetailHigh.TextSettings.Font.Size := PCLowSize;// PCLowSize - 1;
  TextDetailLow.TextSettings.Font.Size := PCLowSize;// PCLowSize - 1;
  EditDetailHigh.TextSettings.Font.Size := PCLowSize;
  EditDetailLow.TextSettings.Font.Size := PCLowSize;
  TextEditDetailHigh.TextSettings.Font.Size := PCLowSize; //PCLowSize;
  TextEditDetailLow.TextSettings.Font.Size := PCLowSize;// PCLowSize;

  TextPW1.TextSettings.Font.Size := PCMostLowSize;
  TextPW2.TextSettings.Font.Size := PCMostLowSize;
  EditPW2.TextSettings.Font.Size := PCMostLowSize;
  ButtonPW.TextSettings.Font.Size := PCMostLowSize;
//  RectanglePW.Height := 100 + EditPW2.Height;
  RectanglePW.Width := ClientWidth div 4 ;
 // RectanglePW.Width :=   EditPW2.Width/2;

  TextDetailIn.TextSettings.Font.Size := PCMostLowSize;

  TextDetailIn1.TextSettings.Font.Size := PCMostLowSize;
  TextDetailIn2.TextSettings.Font.Size := PCMostLowSize;
  TextDetailIn3.TextSettings.Font.Size := PCMostLowSize;
  TextDetailIn4.TextSettings.Font.Size := PCMostLowSize;
  TextDetailIn5.TextSettings.Font.Size := PCMostLowSize;
  EditDetailIn1.TextSettings.Font.Size := PCMostLowSize;
  EditDetailIn2.TextSettings.Font.Size := PCMostLowSize;
  EditDetailIn3.TextSettings.Font.Size := PCMostLowSize;
  EditDetailIn4.TextSettings.Font.Size := PCMostLowSize;
  EditDetailIn5.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailIn1.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailIn2.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailIn3.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailIn4.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailIn5.TextSettings.Font.Size := PCMostLowSize;

  TextDetailOut.TextSettings.Font.Size := PCMostLowSize;
  TextModelDetail.TextSettings.Font.Size := PCMostLowSize;

  TextDetailOut1.TextSettings.Font.Size := PCMostLowSize;
  TextDetailOut2.TextSettings.Font.Size := PCMostLowSize;
  TextDetailOut3.TextSettings.Font.Size := PCMostLowSize;
  TextDetailOut4.TextSettings.Font.Size := PCMostLowSize;
  TextDetailOut5.TextSettings.Font.Size := PCMostLowSize;
  EditDetailOut1.TextSettings.Font.Size := PCMostLowSize;
  EditDetailOut2.TextSettings.Font.Size := PCMostLowSize;
  EditDetailOut3.TextSettings.Font.Size := PCMostLowSize;
  EditDetailOut4.TextSettings.Font.Size := PCMostLowSize;
  EditDetailOut5.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailOut1.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailOut2.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailOut3.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailOut4.TextSettings.Font.Size := PCMostLowSize;
  TextEditDetailOut5.TextSettings.Font.Size := PCMostLowSize;

  Text_DetailRight1.TextSettings.Font.Size := PCMostLowSize;
  Text_DetailRight2.TextSettings.Font.Size := PCMostLowSize;
  Text_DetailRight3.TextSettings.Font.Size := PCMostLowSize;
  // 상세 좌측하단
  Text_Detail2Top.TextSettings.Font.Size := PCMostLowSize-2;
   DateEditGraph1.TextSettings.Font.Size := PCMostLowSize-1.5;
   TimeEditGraph1.TextSettings.Font.Size := PCMostLowSize-1.5;
   DateEditGraph2.TextSettings.Font.Size := PCMostLowSize-1.5;
   TimeEditGraph2.TextSettings.Font.Size := PCMostLowSize-1.5;
   Text_Detail2_excel.Font.Size := PCMostLowSize;
   Text_Detail3_excel.Font.Size := PCMostLowSize;




  // Tab Login
//  ImageJoin.Height := ClientHeight / 16;
//  ImageJoinBack.Width := ImageJoinBack.Height;
  LayoutLogin.Margins.Top := (ClientHeight / 5) + (ClientHeight / 6);
  LayoutLogin.Margins.Bottom := ClientHeight / 4 - 100;
  LayoutLogin.Margins.Right := ClientHeight / 13;
  LayoutLogin.Margins.Left := ClientHeight / 13;

  RectangleLogin.Height := LayoutLogin.Height / 7;
  RectangleJoin.Height := LayoutLogin.Height / 7;


  // Tab Main1
  RectangleMain1.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain1.Margins.Top - RectangleMain1.Margins.Bottom;
  TextMain1Name.Height := RectangleMain1.Height / 4; // 단말기이름
  ImageMain1.Width := ImageMain1.Height;

  RectangleMain1Right.Width := RectangleMain1.Width / 3; // 입출력 색
  RectangleMain1RTop.Height := RectangleMain1Right.Height / 2; // 입력LayOut
  TextMain1RTop.Height := RectangleMain1RTop.Height / 3;


  CircleMain1RTopC1.Height := LayoutMain1RTopC1.Height/2;
  CircleMain1RTopC2.Height := LayoutMain1RTopC1.Height/2;
  CircleMain1RTopC3.Height := LayoutMain1RTopC1.Height/2;
  CircleMain1RTopC4.Height := LayoutMain1RTopC1.Height/2;
  CircleMain1RTopC5.Height := LayoutMain1RTopC1.Height/2;

  TextMain1RClient.Height := RectangleMain1RClient .Height / 3; // 출력


  CircleMain1RClientC1.Height := LayoutMain1RClientC.Height/2;
  CircleMain1RClientC2.Height := LayoutMain1RClientC.Height/2;
  CircleMain1RClientC3.Height := LayoutMain1RClientC.Height/2;
  CircleMain1RClientC4.Height := LayoutMain1RClientC.Height/2;
  CircleMain1RClientC5.Height := LayoutMain1RClientC.Height/2;

  LayoutMain1Temp.Height := LayoutMain1Client.Height / 2;//3; // 현재온도
  TextMain1TempL.Width := ClientWidthDiv3 / 5;
  TextMain1TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain1Set.Height := ( LayoutMain1Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain1Set.Height := ( LayoutMain1Client.Height / 3 ); // 설정Layout
  ImageMain1SetPlus.Width := LayoutMain1Set.Width / 3;
  ImageMain1SetMinus.Width := LayoutMain1Set.Width / 3;

  TextMain1SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain1SetTempR.Width := ClientWidthDiv3 / 20;


  ImageMain1Logo.Width  := LayoutMain1Client.Width /2.5;     // 리웍스 로고
  ImageMain1Logo.Height := LayoutMain1Client.Height /2.8;
  ImageMain1Logo.Position.X := LayoutMain1Client.Width /40;
  ImageMain1Logo.Position.Y := LayoutMain1Client.Height /1.7;


  // Tab Main2
  RectangleMain2.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain2.Margins.Top - RectangleMain2.Margins.Bottom;
  TextMain2Name.Height := RectangleMain2.Height / 4; // 단말기이름
  ImageMain2.Width := ImageMain2.Height;

  RectangleMain2Right.Width  := RectangleMain2.Width / 3; // 입출력 색
  RectangleMain2RTop.Height := RectangleMain2Right.Height / 2; // 입력LayOut
  TextMain2RTop.Height    := RectangleMain2RTop.Height / 3;
//  LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 5;
//  LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 5;
//  LayoutMain2RTopC4.Width := LayoutMain2RTopC.Width / 5;
//  LayoutMain2RTopC5.Width := LayoutMain2RTopC.Width / 5;

  CircleMain2RTopC1.Height := LayoutMain2RTopC1.Height/2;
  CircleMain2RTopC2.Height := LayoutMain2RTopC1.Height/2;
  CircleMain2RTopC3.Height := LayoutMain2RTopC1.Height/2;
  CircleMain2RTopC4.Height := LayoutMain2RTopC1.Height/2;
  CircleMain2RTopC5.Height := LayoutMain2RTopC1.Height/2;


  TextMain2RClient.Height    := RectangleMain2RClient.Height / 3; // 출력
//  LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 5;
//  LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 5;
//  LayoutMain2RClientC4.Width := LayoutMain2RClientC.Width / 5;
//  LayoutMain2RClientC5.Width := LayoutMain2RClientC.Width / 5;

  CircleMain2RClientC1.Height := LayoutMain2RClientC.Height/2;
  CircleMain2RClientC2.Height := LayoutMain2RClientC.Height/2;
  CircleMain2RClientC3.Height := LayoutMain2RClientC.Height/2;
  CircleMain2RClientC4.Height := LayoutMain2RClientC.Height/2;
  CircleMain2RClientC5.Height := LayoutMain2RClientC.Height/2;

  LayoutMain2Temp.Height := LayoutMain2Client.Height / 2;//3; // 현재온도
  TextMain2TempL.Width := ClientWidthDiv3 / 5;
  TextMain2TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain2Set.Height := ( LayoutMain2Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain2Set.Height := ( LayoutMain2Client.Height / 3 ); // 설정Layout
  ImageMain2SetPlus.Width := LayoutMain2Set.Width / 3;
  ImageMain2SetMinus.Width := LayoutMain2Set.Width / 3;

  TextMain2SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain2SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain2Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain2Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain2Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain2Logo.Position.Y := LayoutMain2Client.Height /1.7;


    // Tab Main3
  RectangleMain3.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain3.Margins.Top - RectangleMain3.Margins.Bottom;
  TextMain3Name.Height := RectangleMain3.Height / 4; // 단말기이름
  ImageMain3.Width := ImageMain3.Height;

  RectangleMain3Right .Width := RectangleMain3.Width / 3; // 입출력 색
  RectangleMain3RTop.Height := RectangleMain3Right.Height / 2; // 입력LayOut
  TextMain3RTop.Height := RectangleMain3RTop.Height / 3;
//  LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 5;
//  LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 5;
//  LayoutMain3RTopC4.Width := LayoutMain3RTopC.Width / 5;
//  LayoutMain3RTopC5.Width := LayoutMain3RTopC.Width / 5;

  CircleMain3RTopC1.Height := LayoutMain3RTopC1.Height/2;
  CircleMain3RTopC2.Height := LayoutMain3RTopC1.Height/2;
  CircleMain3RTopC3.Height := LayoutMain3RTopC1.Height/2;
  CircleMain3RTopC4.Height := LayoutMain3RTopC1.Height/2;
  CircleMain3RTopC5.Height := LayoutMain3RTopC1.Height/2;

  TextMain3RClient.Height    := RectangleMain3RClient .Height / 3; // 출력
//  LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 5;
//  LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 5;
//  LayoutMain3RClientC4.Width := LayoutMain3RClientC.Width / 5;
//  LayoutMain3RClientC5.Width := LayoutMain3RClientC.Width / 5;

  CircleMain3RClientC1.Height := LayoutMain3RClientC.Height/2;
  CircleMain3RClientC2.Height := LayoutMain3RClientC.Height/2;
  CircleMain3RClientC3.Height := LayoutMain3RClientC.Height/2;
  CircleMain3RClientC4.Height := LayoutMain3RClientC.Height/2;
  CircleMain3RClientC5.Height := LayoutMain3RClientC.Height/2;

  LayoutMain3Temp.Height := LayoutMain3Client.Height / 2;//3; // 현재온도
  TextMain3TempL.Width := ClientWidthDiv3 / 5;
  TextMain3TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain3Set.Height := ( LayoutMain3Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain3Set.Height := ( LayoutMain3Client.Height / 3 ); // 설정Layout
  ImageMain3SetPlus.Width := LayoutMain3Set.Width / 3;
  ImageMain3SetMinus.Width := LayoutMain3Set.Width / 3;

  TextMain3SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain3SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain3Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain3Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain3Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain3Logo.Position.Y := LayoutMain2Client.Height /1.7;

  // Tab Main4
  RectangleMain4.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain4.Margins.Top - RectangleMain4.Margins.Bottom;
  TextMain4Name.Height := RectangleMain4.Height / 4; // 단말기이름
  ImageMain4.Width := ImageMain4.Height;

  RectangleMain4Right.Width := RectangleMain4.Width / 3; // 입출력 색
  RectangleMain4RTop.Height := RectangleMain4Right.Height / 2; // 입력LayOut
  TextMain4RTop.Height := RectangleMain4RTop.Height / 3;
//  LayoutMain4RTopC1.Width := LayoutMain4RTopC.Width / 5;
//  LayoutMain4RTopC2.Width := LayoutMain4RTopC.Width / 5;
//  LayoutMain4RTopC4.Width := LayoutMain4RTopC.Width / 5;
//  LayoutMain4RTopC5.Width := LayoutMain4RTopC.Width / 5;

  CircleMain4RTopC1.Height := LayoutMain4RTopC1.Height/2;
  CircleMain4RTopC2.Height := LayoutMain4RTopC1.Height/2;
  CircleMain4RTopC3.Height := LayoutMain4RTopC1.Height/2;
  CircleMain4RTopC4.Height := LayoutMain4RTopC1.Height/2;
  CircleMain4RTopC5.Height := LayoutMain4RTopC1.Height/2;

  TextMain4RClient.Height := RectangleMain4RClient.Height / 3; // 출력
//  LayoutMain4RClientC1.Width := LayoutMain4RClientC.Width / 5;
//  LayoutMain4RClientC2.Width := LayoutMain4RClientC.Width / 5;
//  LayoutMain4RClientC4.Width := LayoutMain4RClientC.Width / 5;
//  LayoutMain4RClientC5.Width := LayoutMain4RClientC.Width / 5;

  CircleMain4RClientC1.Height := LayoutMain4RClientC.Height/2;
  CircleMain4RClientC2.Height := LayoutMain4RClientC.Height/2;
  CircleMain4RClientC3.Height := LayoutMain4RClientC.Height/2;
  CircleMain4RClientC4.Height := LayoutMain4RClientC.Height/2;
  CircleMain4RClientC5.Height := LayoutMain4RClientC.Height/2;

  LayoutMain4Temp.Height := LayoutMain4Client.Height / 2;//3; // 현재온도
  TextMain4TempL.Width := ClientWidthDiv3 / 5;
  TextMain4TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain4Set.Height := ( LayoutMain4Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain4Set.Height := ( LayoutMain4Client.Height / 3 ); // 설정Layout
  ImageMain4SetPlus.Width := LayoutMain4Set.Width / 3;
  ImageMain4SetMinus.Width := LayoutMain4Set.Width / 3;

  TextMain4SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain4SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain4Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain4Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain4Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain4Logo.Position.Y := LayoutMain2Client.Height /1.7;

  // Tab Main5
  RectangleMain5.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain5.Margins.Top - RectangleMain5.Margins.Bottom;
  TextMain5Name.Height := RectangleMain5.Height / 4; // 단말기이름
  ImageMain5.Width := ImageMain5.Height;

  RectangleMain5Right.Width := RectangleMain5.Width / 3; // 입출력 색
  RectangleMain5RTop.Height := RectangleMain5Right.Height / 2; // 입력LayOut
  TextMain5RTop.Height    := RectangleMain5RTop.Height / 3;
//  LayoutMain5RTopC1.Width := LayoutMain5RTopC.Width / 5;
//  LayoutMain5RTopC2.Width := LayoutMain5RTopC.Width / 5;
//  LayoutMain5RTopC4.Width := LayoutMain5RTopC.Width / 5;
//  LayoutMain5RTopC5.Width := LayoutMain5RTopC.Width / 5;

  CircleMain5RTopC1.Height := LayoutMain5RTopC1.Height/2;
  CircleMain5RTopC2.Height := LayoutMain5RTopC1.Height/2;
  CircleMain5RTopC3.Height := LayoutMain5RTopC1.Height/2;
  CircleMain5RTopC4.Height := LayoutMain5RTopC1.Height/2;
  CircleMain5RTopC5.Height := LayoutMain5RTopC1.Height/2;

  TextMain5RClient.Height    := RectangleMain5RClient.Height / 3; // 출력
//  LayoutMain5RClientC1.Width := LayoutMain5RClientC.Width / 5;
//  LayoutMain5RClientC2.Width := LayoutMain5RClientC.Width / 5;
//  LayoutMain5RClientC4.Width := LayoutMain5RClientC.Width / 5;
//  LayoutMain5RClientC5.Width := LayoutMain5RClientC.Width / 5;

  CircleMain5RClientC1.Height := LayoutMain5RClientC.Height/2;
  CircleMain5RClientC2.Height := LayoutMain5RClientC.Height/2;
  CircleMain5RClientC3.Height := LayoutMain5RClientC.Height/2;
  CircleMain5RClientC4.Height := LayoutMain5RClientC.Height/2;
  CircleMain5RClientC5.Height := LayoutMain5RClientC.Height/2;

  LayoutMain5Temp.Height := LayoutMain5Client.Height / 2;//3; // 현재온도
  TextMain5TempL.Width := ClientWidthDiv3 / 5;
  TextMain5TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain5Set.Height := ( LayoutMain5Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain5Set.Height := ( LayoutMain5Client.Height / 3 ); // 설정Layout
  ImageMain5SetPlus.Width := LayoutMain5Set.Width / 3;
  ImageMain5SetMinus.Width := LayoutMain5Set.Width / 3;

  TextMain5SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain5SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain5Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain5Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain5Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain5Logo.Position.Y := LayoutMain2Client.Height /1.7;

  // Tab Main6
  RectangleMain6.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain6.Margins.Top - RectangleMain6.Margins.Bottom;
  TextMain6Name.Height := RectangleMain6.Height / 4; // 단말기이름
  ImageMain6.Width := ImageMain6.Height;

  RectangleMain6Right .Width := RectangleMain6.Width / 3; // 입출력 색
  RectangleMain6RTop.Height := RectangleMain6Right.Height / 2; // 입력LayOut
  TextMain6RTop.Height    := RectangleMain6RTop.Height / 3;
//  LayoutMain6RTopC1.Width := LayoutMain6RTopC.Width / 5;
//  LayoutMain6RTopC2.Width := LayoutMain6RTopC.Width / 5;
//  LayoutMain6RTopC4.Width := LayoutMain6RTopC.Width / 5;
//  LayoutMain6RTopC5.Width := LayoutMain6RTopC.Width / 5;

  CircleMain6RTopC1.Height := LayoutMain6RTopC1.Height/2;
  CircleMain6RTopC2.Height := LayoutMain6RTopC1.Height/2;
  CircleMain6RTopC3.Height := LayoutMain6RTopC1.Height/2;
  CircleMain6RTopC4.Height := LayoutMain6RTopC1.Height/2;
  CircleMain6RTopC5.Height := LayoutMain6RTopC1.Height/2;

  TextMain6RClient.Height    := RectangleMain6RClient.Height / 3; // 출력
//  LayoutMain6RClientC1.Width := LayoutMain6RClientC.Width / 5;
//  LayoutMain6RClientC2.Width := LayoutMain6RClientC.Width / 5;
//  LayoutMain6RClientC4.Width := LayoutMain6RClientC.Width / 5;
//  LayoutMain6RClientC5.Width := LayoutMain6RClientC.Width / 5;

  CircleMain6RClientC1.Height := LayoutMain6RClientC.Height/2;
  CircleMain6RClientC2.Height := LayoutMain6RClientC.Height/2;
  CircleMain6RClientC3.Height := LayoutMain6RClientC.Height/2;
  CircleMain6RClientC4.Height := LayoutMain6RClientC.Height/2;
  CircleMain6RClientC5.Height := LayoutMain6RClientC.Height/2;


  LayoutMain6Temp.Height := LayoutMain6Client.Height / 2;//3; // 현재온도
  TextMain6TempL.Width := ClientWidthDiv3 / 5;
  TextMain6TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain6Set.Height := ( LayoutMain6Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain6Set.Height := ( LayoutMain6Client.Height / 3 ); // 설정Layout
  ImageMain6SetPlus.Width := LayoutMain6Set.Width / 3;
  ImageMain6SetMinus.Width := LayoutMain6Set.Width / 3;

  TextMain6SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain6SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain6Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain6Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain6Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain6Logo.Position.Y := LayoutMain2Client.Height /1.7;

  // Tab Main7
  RectangleMain7.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain7.Margins.Top - RectangleMain7.Margins.Bottom;
  TextMain7Name.Height := RectangleMain7.Height / 4; // 단말기이름
  ImageMain7.Width := ImageMain7.Height;

  RectangleMain7Right.Width := RectangleMain7.Width / 3; // 입출력 색
  RectangleMain7RTop.Height := RectangleMain7Right.Height / 2; // 입력LayOut
  TextMain7RTop.Height := RectangleMain7RTop.Height / 3;
//  LayoutMain7RTopC1.Width := LayoutMain7RTopC.Width / 5;
//  LayoutMain7RTopC2.Width := LayoutMain7RTopC.Width / 5;
//  LayoutMain7RTopC4.Width := LayoutMain7RTopC.Width / 5;
//  LayoutMain7RTopC5.Width := LayoutMain7RTopC.Width / 5;

    CircleMain7RTopC1.Height := LayoutMain7RTopC1.Height/2;
  CircleMain7RTopC2.Height := LayoutMain7RTopC1.Height/2;
  CircleMain7RTopC3.Height := LayoutMain7RTopC1.Height/2;
  CircleMain7RTopC4.Height := LayoutMain7RTopC1.Height/2;
  CircleMain7RTopC5.Height := LayoutMain7RTopC1.Height/2;

  TextMain7RClient.Height := RectangleMain7RClient.Height / 3; // 출력
//  LayoutMain7RClientC1.Width := LayoutMain7RClientC.Width / 5;
//  LayoutMain7RClientC2.Width := LayoutMain7RClientC.Width / 5;
//  LayoutMain7RClientC4.Width := LayoutMain7RClientC.Width / 5;
//  LayoutMain7RClientC5.Width := LayoutMain7RClientC.Width / 5;

  CircleMain7RClientC1.Height := LayoutMain7RClientC.Height/2;
  CircleMain7RClientC2.Height := LayoutMain7RClientC.Height/2;
  CircleMain7RClientC3.Height := LayoutMain7RClientC.Height/2;
  CircleMain7RClientC4.Height := LayoutMain7RClientC.Height/2;
  CircleMain7RClientC5.Height := LayoutMain7RClientC.Height/2;

  LayoutMain7Temp.Height := LayoutMain7Client.Height / 2;//3; // 현재온도
  TextMain7TempL.Width := ClientWidthDiv3 / 5;
  TextMain7TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain7Set.Height := ( LayoutMain7Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain7Set.Height := ( LayoutMain7Client.Height / 3 ); // 설정Layout
  ImageMain7SetPlus.Width := LayoutMain7Set.Width / 3;
  ImageMain7SetMinus.Width := LayoutMain7Set.Width / 3;

  TextMain7SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain7SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain7Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain7Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain7Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain7Logo.Position.Y := LayoutMain2Client.Height /1.7;

  // Tab Main8
  RectangleMain8.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain8.Margins.Top - RectangleMain8.Margins.Bottom;
  TextMain8Name.Height := RectangleMain8.Height / 4; // 단말기이름
  ImageMain8.Width := ImageMain8.Height;

  RectangleMain8Right.Width := RectangleMain8.Width / 3; // 입출력 색
  RectangleMain8RTop.Height := RectangleMain8Right.Height / 2; // 입력LayOut
  TextMain8RTop.Height    := RectangleMain8RTop.Height / 3;
//  LayoutMain8RTopC1.Width := LayoutMain8RTopC.Width / 5;
//  LayoutMain8RTopC2.Width := LayoutMain8RTopC.Width / 5;
//  LayoutMain8RTopC4.Width := LayoutMain8RTopC.Width / 5;
//  LayoutMain8RTopC5.Width := LayoutMain8RTopC.Width / 5;

  CircleMain8RTopC1.Height := LayoutMain8RTopC1.Height/2;
  CircleMain8RTopC2.Height := LayoutMain8RTopC1.Height/2;
  CircleMain8RTopC3.Height := LayoutMain8RTopC1.Height/2;
  CircleMain8RTopC4.Height := LayoutMain8RTopC1.Height/2;
  CircleMain8RTopC5.Height := LayoutMain8RTopC1.Height/2;

  TextMain8RClient.Height    := RectangleMain8RClient.Height / 3; // 출력
//  LayoutMain8RClientC1.Width := LayoutMain8RClientC.Width / 5;
//  LayoutMain8RClientC2.Width := LayoutMain8RClientC.Width / 5;
//  LayoutMain8RClientC4.Width := LayoutMain8RClientC.Width / 5;
//  LayoutMain8RClientC5.Width := LayoutMain8RClientC.Width / 5;

  CircleMain8RClientC1.Height := LayoutMain8RClientC.Height/2;
  CircleMain8RClientC2.Height := LayoutMain8RClientC.Height/2;
  CircleMain8RClientC3.Height := LayoutMain8RClientC.Height/2;
  CircleMain8RClientC4.Height := LayoutMain8RClientC.Height/2;
  CircleMain8RClientC5.Height := LayoutMain8RClientC.Height/2;


  LayoutMain8Temp.Height := LayoutMain8Client.Height / 2;//3; // 현재온도
  TextMain8TempL.Width := ClientWidthDiv3 / 5;
  TextMain8TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain8Set.Height := ( LayoutMain8Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain8Set.Height := ( LayoutMain8Client.Height / 3 ); // 설정Layout
  ImageMain8SetPlus.Width := LayoutMain8Set.Width / 3;
  ImageMain8SetMinus.Width := LayoutMain8Set.Width / 3;

  TextMain8SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain8SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain8Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain8Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain8Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain8Logo.Position.Y := LayoutMain2Client.Height /1.7;

    // Tab Main9
  RectangleMain9.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain9.Margins.Top - RectangleMain9.Margins.Bottom;
  TextMain9Name.Height := RectangleMain9.Height / 4; // 단말기이름
  ImageMain9.Width := ImageMain9.Height;

  RectangleMain9Right.Width := RectangleMain9.Width / 3; // 입출력 색
  RectangleMain9RTop.Height := RectangleMain9Right.Height / 2; // 입력LayOut
  TextMain9RTop.Height    := RectangleMain9RTop.Height / 3;
//  LayoutMain9RTopC1.Width := LayoutMain9RTopC.Width / 5;
//  LayoutMain9RTopC2.Width := LayoutMain9RTopC.Width / 5;
//  LayoutMain9RTopC4.Width := LayoutMain9RTopC.Width / 5;
//  LayoutMain9RTopC5.Width := LayoutMain9RTopC.Width / 5;

  CircleMain9RTopC1.Height := LayoutMain9RTopC1.Height/2;
  CircleMain9RTopC2.Height := LayoutMain9RTopC1.Height/2;
  CircleMain9RTopC3.Height := LayoutMain9RTopC1.Height/2;
  CircleMain9RTopC4.Height := LayoutMain9RTopC1.Height/2;
  CircleMain9RTopC5.Height := LayoutMain9RTopC1.Height/2;

  TextMain9RClient.Height    := RectangleMain9RClient.Height / 3; // 출력
//  LayoutMain9RClientC1.Width := LayoutMain9RClientC.Width / 5;
//  LayoutMain9RClientC2.Width := LayoutMain9RClientC.Width / 5;
//  LayoutMain9RClientC4.Width := LayoutMain9RClientC.Width / 5;
//  LayoutMain9RClientC5.Width := LayoutMain9RClientC.Width / 5;

  CircleMain9RClientC1.Height := LayoutMain9RClientC.Height/2;
  CircleMain9RClientC2.Height := LayoutMain9RClientC.Height/2;
  CircleMain9RClientC3.Height := LayoutMain9RClientC.Height/2;
  CircleMain9RClientC4.Height := LayoutMain9RClientC.Height/2;
  CircleMain9RClientC5.Height := LayoutMain9RClientC.Height/2;

  LayoutMain9Temp.Height := LayoutMain9Client.Height / 2;//3; // 현재온도
  TextMain9TempL.Width := ClientWidthDiv3 / 5;
  TextMain9TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain9Set.Height := ( LayoutMain9Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain9Set.Height := ( LayoutMain9Client.Height / 3 ); // 설정Layout
  ImageMain9SetPlus.Width := LayoutMain9Set.Width / 3;
  ImageMain9SetMinus.Width := LayoutMain9Set.Width / 3;

  TextMain9SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain9SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain9Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain9Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain9Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain9Logo.Position.Y := LayoutMain2Client.Height /1.7;

  // Tab Main10
  RectangleMain10.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain10.Margins.Top - RectangleMain10.Margins.Bottom;
  TextMain10Name.Height := RectangleMain10.Height / 4; // 단말기이름
  ImageMain10.Width := ImageMain10.Height;

  RectangleMain10Right .Width := RectangleMain10.Width / 3; // 입출력 색
  RectangleMain10RTop .Height := RectangleMain10Right.Height / 2; // 입력LayOut
  TextMain10RTop.Height    := RectangleMain10RTop.Height / 3;
//  LayoutMain10RTopC1.Width := LayoutMain10RTopC.Width / 5;
//  LayoutMain10RTopC2.Width := LayoutMain10RTopC.Width / 5;
//  LayoutMain10RTopC4.Width := LayoutMain10RTopC.Width / 5;
//  LayoutMain10RTopC5.Width := LayoutMain10RTopC.Width / 5;

  CircleMain10RTopC1.Height := LayoutMain10RTopC1.Height/2;
  CircleMain10RTopC2.Height := LayoutMain10RTopC1.Height/2;
  CircleMain10RTopC3.Height := LayoutMain10RTopC1.Height/2;
  CircleMain10RTopC4.Height := LayoutMain10RTopC1.Height/2;
  CircleMain10RTopC5.Height := LayoutMain10RTopC1.Height/2;

  TextMain10RClient.Height    := RectangleMain10RClient.Height / 3; // 출력
//  LayoutMain10RClientC1.Width := LayoutMain10RClientC.Width / 5;
//  LayoutMain10RClientC2.Width := LayoutMain10RClientC.Width / 5;
//  LayoutMain10RClientC4.Width := LayoutMain10RClientC.Width / 5;
//  LayoutMain10RClientC5.Width := LayoutMain10RClientC.Width / 5;

  CircleMain10RClientC1.Height := LayoutMain10RClientC.Height/2;
  CircleMain10RClientC2.Height := LayoutMain10RClientC.Height/2;
  CircleMain10RClientC3.Height := LayoutMain10RClientC.Height/2;
  CircleMain10RClientC4.Height := LayoutMain10RClientC.Height/2;
  CircleMain10RClientC5.Height := LayoutMain10RClientC.Height/2;

  LayoutMain10Temp.Height := LayoutMain10Client.Height / 2;//3; // 현재온도
  TextMain10TempL.Width := ClientWidthDiv3 / 5;
  TextMain10TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain10Set.Height := ( LayoutMain10Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain10Set.Height := ( LayoutMain10Client.Height / 3 ); // 설정Layout
  ImageMain10SetPlus.Width := LayoutMain10Set.Width / 3;
  ImageMain10SetMinus.Width := LayoutMain10Set.Width / 3;

  TextMain10SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain10SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain10Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain10Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain10Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain10Logo.Position.Y := LayoutMain2Client.Height /1.7;

    // Tab Main11
  RectangleMain11.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain11.Margins.Top - RectangleMain11.Margins.Bottom;
  TextMain11Name.Height := RectangleMain11.Height / 4; // 단말기이름
  ImageMain11.Width := ImageMain11.Height;

  RectangleMain11Right.Width := RectangleMain11.Width / 3; // 입출력 색
  RectangleMain11RTop.Height := RectangleMain11Right .Height / 2; // 입력LayOut
  TextMain11RTop.Height    := RectangleMain11RTop .Height / 3;
//  LayoutMain11RTopC1.Width := LayoutMain11RTopC.Width / 5;
//  LayoutMain11RTopC2.Width := LayoutMain11RTopC.Width / 5;
//  LayoutMain11RTopC4.Width := LayoutMain11RTopC.Width / 5;
//  LayoutMain11RTopC5.Width := LayoutMain11RTopC.Width / 5;

  CircleMain11RTopC1.Height := LayoutMain11RTopC1.Height/2;
  CircleMain11RTopC2.Height := LayoutMain11RTopC1.Height/2;
  CircleMain11RTopC3.Height := LayoutMain11RTopC1.Height/2;
  CircleMain11RTopC4.Height := LayoutMain11RTopC1.Height/2;
  CircleMain11RTopC5.Height := LayoutMain11RTopC1.Height/2;

  TextMain11RClient.Height    := RectangleMain11RClient.Height / 3; // 출력
//  LayoutMain11RClientC1.Width := LayoutMain11RClientC.Width / 5;
//  LayoutMain11RClientC2.Width := LayoutMain11RClientC.Width / 5;
//  LayoutMain11RClientC4.Width := LayoutMain11RClientC.Width / 5;
//  LayoutMain11RClientC5.Width := LayoutMain11RClientC.Width / 5;

  CircleMain11RClientC1.Height := LayoutMain11RClientC.Height/2;
  CircleMain11RClientC2.Height := LayoutMain11RClientC.Height/2;
  CircleMain11RClientC3.Height := LayoutMain11RClientC.Height/2;
  CircleMain11RClientC4.Height := LayoutMain11RClientC.Height/2;
  CircleMain11RClientC5.Height := LayoutMain11RClientC.Height/2;

  LayoutMain11Temp.Height := LayoutMain11Client.Height / 2;//3; // 현재온도
  TextMain11TempL.Width := ClientWidthDiv3 / 5;
  TextMain11TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain11Set.Height := ( LayoutMain11Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain11Set.Height := ( LayoutMain11Client.Height / 3 ); // 설정Layout
  ImageMain11SetPlus.Width := LayoutMain11Set.Width / 3;
  ImageMain11SetMinus.Width := LayoutMain11Set.Width / 3;

  TextMain11SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain11SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain11Logo.Width  := LayoutMain2Client.Width /2.5;     // 리웍스 로고
  ImageMain11Logo.Height := LayoutMain2Client.Height /2.8;
  ImageMain11Logo.Position.X := LayoutMain2Client.Width /40;
  ImageMain11Logo.Position.Y := LayoutMain2Client.Height /1.7;

  // Tab Main12
  RectangleMain12.Height := ( ClientHeight - TextMain.Height - LayoutMainBottom.Height ) / 4
                    - RectangleMain12.Margins.Top - RectangleMain12.Margins.Bottom;
  TextMain12Name.Height := RectangleMain12.Height / 4; // 단말기이름
  ImageMain12.Width := ImageMain12.Height;

  RectangleMain12Right.Width := RectangleMain12.Width / 3; // 입출력 색
  RectangleMain12RTop.Height := RectangleMain12Right.Height / 2; // 입력LayOut
  TextMain12RTop.Height    := RectangleMain12RTop.Height / 3;
//  LayoutMain12RTopC1.Width := LayoutMain12RTopC.Width / 5;
//  LayoutMain12RTopC2.Width := LayoutMain12RTopC.Width / 5;
//  LayoutMain12RTopC4.Width := LayoutMain12RTopC.Width / 5;
//  LayoutMain12RTopC5.Width := LayoutMain12RTopC.Width / 5;

  CircleMain12RTopC1.Height := LayoutMain12RTopC1.Height/2;
  CircleMain12RTopC2.Height := LayoutMain12RTopC1.Height/2;
  CircleMain12RTopC3.Height := LayoutMain12RTopC1.Height/2;
  CircleMain12RTopC4.Height := LayoutMain12RTopC1.Height/2;
  CircleMain12RTopC5.Height := LayoutMain12RTopC1.Height/2;

  TextMain12RClient.Height    := RectangleMain12RClient.Height / 3; // 출력
//  LayoutMain12RClientC1.Width := LayoutMain12RClientC.Width / 5;
//  LayoutMain12RClientC2.Width := LayoutMain12RClientC.Width / 5;
//  LayoutMain12RClientC4.Width := LayoutMain12RClientC.Width / 5;
//  LayoutMain12RClientC5.Width := LayoutMain12RClientC.Width / 5;

  CircleMain12RClientC1.Height := LayoutMain12RClientC.Height/2;
  CircleMain12RClientC2.Height := LayoutMain12RClientC.Height/2;
  CircleMain12RClientC3.Height := LayoutMain12RClientC.Height/2;
  CircleMain12RClientC4.Height := LayoutMain12RClientC.Height/2;
  CircleMain12RClientC5.Height := LayoutMain12RClientC.Height/2;

  LayoutMain12Temp.Height := LayoutMain12Client.Height / 2;//3; // 현재온도
  TextMain12TempL.Width := ClientWidthDiv3 / 5;
  TextMain12TempR.Width := ClientWidthDiv3 / 20;

  RectangleMain12Set.Height := ( LayoutMain12Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain12Set.Height := ( LayoutMain12Client.Height / 3 ); // 설정Layout
  ImageMain12SetPlus.Width := LayoutMain12Set.Width / 3;
  ImageMain12SetMinus.Width := LayoutMain12Set.Width / 3;

  TextMain12SetTempL.Width := ClientWidthDiv3 / 5; // 설정온도
  TextMain12SetTempR.Width := ClientWidthDiv3 / 20;

  ImageMain12Logo.Width  := LayoutMain12Client.Width /2.5;     // 리웍스 로고
  ImageMain12Logo.Height := LayoutMain12Client.Height /2.8;
  ImageMain12Logo.Position.X := LayoutMain12Client.Width /40;
  ImageMain12Logo.Position.Y := LayoutMain12Client.Height /1.7;

  //PCDetail Tap
  LayoutDetailPCTop.Height := LayoutDetailPC0.Height / 2;
 // LayoutDetailPC1.Width := LayoutDetailPCTop.Width / 2;
  RectangleDetailPC1.Width := LayoutDetailPCTop.Width / 2;
//  LayoutDetailPC3.Width := LayoutDetailPCTop.Width / 2;
  RectangleDetailPC3.Width := LayoutDetailPCTop.Width / 2;

  Text_Title1.Font.Size := PCMostLowSize+1;
  Text_Title2.Font.Size := PCMostLowSize+1;
////////////////////////////////////////////////////////////////////////////////
    //  {$IFDEF ANDROID}
  // Detail Tap
  RectangleDetail.Height := ClientHeight / 14;

 // Layout6.Width :=  RectangleDetail.Width / 3;
   TextDetailTitle.Width := RectangleDetailPC1.Width /4.1;// 5.15;

  Text_Title1.Height := Layout6.Height/2;

  //TextDetailModel.Height := ClientHeight / 24;
  TextDetailModel.Width  :=  RectangleDetailPC1.Width / 4.71;

  RectangleDetailChange.Width := RectangleDetailPC1.Width / 11;//8.72; //ClientWidth / 5;
  ImageGraph.Width := ClientWidth / 5;


  ButtonDeviceDelete.Width := ButtonDeviceDelete.Height;
  ImageDetailAlarm.Width := ImageDetailAlarm.Height;

  RectangleDetail11.Width := (RectangleDetailBackGround.Width/3)/3.2;
  RectangleDetail12.Width := (RectangleDetailBackGround.Width/3)/3.2;
  RectangleDetail13.Width := (RectangleDetailBackGround.Width/3)/3.2;
  RectangleDetail11.Height  := RectangleDetailBackGround.Height/3.2;
  RectangleDetail12.Height  := RectangleDetailBackGround.Height/3.2;
  RectangleDetail13.Height  := RectangleDetailBackGround.Height/3.2;
  ButtonSpacing :=  ((RectangleDetailBackGround.Width/2 )- (RectangleDetail11.Width* 3))/3;
  RectangleDetail11.Position.X := ButtonSpacing/2;
  RectangleDetail12.Position.X := RectangleDetail11.Position.X + RectangleDetail11.Width + ButtonSpacing;
  RectangleDetail13.Position.X := RectangleDetail12.Position.X + RectangleDetail12.Width + ButtonSpacing;
  RectangleDetail11.Position.Y :=(RectangleDetailBackGround.Height/2)/40;
  RectangleDetail12.Position.Y :=(RectangleDetailBackGround.Height/2)/40;
  RectangleDetail13.Position.Y :=(RectangleDetailBackGround.Height/2)/40;

  Text_DetailRight1.Height := RectangleDetail11.Height / 2.7;
  Text_DetailRight2.Height := RectangleDetail12.Height / 2.7;
  Text_DetailRight3.Height := RectangleDetail13.Height / 2.7;

 // RectangleDetail_BTM.Height := RectangleDetailInOut.Height -  RectangleDetailOut.Height;
  RectangleInoutRight.Width :=       RectangleDetailBackGround.width/2;

  ImageX.Width := ImageX.Height;

  RectangleDetailSaveButton.Width := RectangleDetailPC1.Width / 11;//8.72;
  //RectangleDetailSaveButton.Height := ( ClientHeight - TextDetailTitle.Height ) / 42 * 3;
//    RectangleDetailSaveButton.XRadius := RectangleDetailSaveButton.Width / 50;
//    RectangleDetailSaveButton.YRadius := RectangleDetailSaveButton.Width / 50;
    // RectangleDetailDevice.Height := ( ClientHeight - TextDetailTitle.Height ) / 42 * 7;
     RectangleDetailDevice.Height :=   RectangleDetailBackGround.Height/2;

//    RectangleDetailTemp.XRadius := ClientHeight / 27;
//    RectangleDetailTemp.YRadius := ClientHeight / 27;
//    RectangleDetailHigh.XRadius := ClientHeight / 80;
//    RectangleDetailHigh.YRadius := ClientHeight / 80;
//    RectangleDetailLow.XRadius := ClientHeight / 80;
//    RectangleDetailLow.YRadius := ClientHeight / 80;
//  LayoutDetailInOut.Height := ( ClientHeight - TextDetailTitle.Height ) / 36 * 8;
//    RectangleDetailIn.XRadius := ClientHeight / 27;
//    RectangleDetailIn.YRadius := ClientHeight / 27;
//    RectangleDetailOut.XRadius := ClientHeight / 27;
//    RectangleDetailOut.YRadius := ClientHeight / 27;
//  LayoutDetailHighLow.Height := ( ClientHeight - TextDetailTitle.Height ) / 70 * 7;

//  LayoutDetailTempClient.Margins.Left := LayoutDetailInOut.Width / 10;
//  LayoutDetailTempClient.Margins.Right := LayoutDetailInOut.Width / 4;

  LayoutDetailHighLow.Width := RectangleDetailDevice.Width /2;


    RectangleDetailHigh.Height := RectangleDetailBackGround.Height/9;
    RectangleDetailLow.Height  := RectangleDetailBackGround.Height/9;
//  RectangleDetailHigh.Margins.Left := LayoutDetailHighLow.Width / 9;
//  RectangleDetailHigh.Margins.Right := LayoutDetailHighLow.Width / 9;
//  RectangleDetailLow.Margins.Left := LayoutDetailHighLow.Width / 9;
//  RectangleDetailLow.Margins.Right := LayoutDetailHighLow.Width / 9;

  TextDetailHigh.Width := RectangleDetailHigh.Width / 2;
  TextDetailLow.Width := RectangleDetailLow.Width / 2;

  LayoutDetailTemp.Height := LayoutDetailTempClient.Height / 3;
  TextDetailTemp.Width := LayoutDetailTemp.Width / 2;
  TextDetailSetTemp.Width := LayoutDetailTemp.Width / 2;
  TextDetailSetTempEdit.Width := LayoutDetailTemp.Width / 2;
  LayoutDetailSetTemp.Height := LayoutDetailTempClient.Height / 3;


  if RectangleDefrost.Visible = false then
  begin
    ImageDetailPlus.Width  := LayoutDetailSetTemp.Width / 3;
    ImageDetailPower.Width := LayoutDetailSetTemp.Width / 3;
    ImageDetailMinus.Width := LayoutDetailSetTemp.Width / 3;
  end
  else
  begin
    ImageDetailPlus.Width  := LayoutDetailSetTemp.Width / 4;
    ImageDetailPower.Width := LayoutDetailSetTemp.Width / 4;
    ImageDetailMinus.Width := LayoutDetailSetTemp.Width / 4;
    RectangleDefrost.Width := LayoutDetailSetTemp.Width / 4;
  end;

//  RectangleDefrost.Visible := False;
  TextDefrost.TextSettings.Font.Size := PCLowSize-5;
    RectangleDefrost.XRadius := ClientWidth / 250;
    RectangleDefrost.YRadius := ClientWidth / 250;
  //  RectangleDefrost.Width  := LayoutDetailSetTemp.Width / 3;
//  ButtonDefrost.Width := LayoutDetailTempClient.Width / 4;

  RectangleDetailInOutLeft.Width := LayoutDetailInOut.Width/2;


  //240808 김동휘 수정
  RectangleDetailIn.Height := RectangleDetailBackGround.Height / 2.7;
//  RectangleDetailIn.Margins.Left := LayoutDetailInOut.Width / 10;
//  RectangleDetailIn.Margins.Right := LayoutDetailInOut.Width / 10;

  TextDetailIn.Height := LayoutDetailIn.Height / 3.5;
  CircleDetailIn1.Height := LayoutDetailIn.Height / 6;
  CircleDetailIn2.Height := LayoutDetailIn.Height / 6;
  CircleDetailIn3.Height := LayoutDetailIn.Height / 6;
  CircleDetailIn4.Height := LayoutDetailIn.Height / 6;
  CircleDetailIn5.Height := LayoutDetailIn.Height / 6;
  checkin := 0;
  if LayoutDetailin1.Visible = true then
     inc(checkin);
  if LayoutDetailin2.Visible = true then
     inc(checkin);
  if LayoutDetailin3.Visible = true then
     inc(checkin);
  if LayoutDetailin4.Visible = true then
     inc(checkin);
  if LayoutDetailin5.Visible = true then
     inc(checkin);

  LayoutDetailIn1.Width := LayoutDetailInClient.Width / checkin;
  LayoutDetailIn2.Width := LayoutDetailInClient.Width / checkin;
  LayoutDetailIn3.Width := LayoutDetailInClient.Width / checkin;
  LayoutDetailIn4.Width := LayoutDetailInClient.Width / checkin;
  LayoutDetailIn5.Width := LayoutDetailInClient.Width / checkin;

//      TextDetailIn1.Height := LayoutDetailIn1.Height / 3;
//      CircleDetailIn1.Height  := LayoutDetailIn1.Height / 3;
//      TextDetailIn2.Height := LayoutDetailIn2.Height / 3;
//      CircleDetailIn2.Height  := LayoutDetailIn2.Height / 3;
//      TextDetailIn3.Height := LayoutDetailIn3.Height / 3;
//      CircleDetailIn3.Height  := LayoutDetailIn3.Height / 3;
//      TextDetailIn4.Height := LayoutDetailIn4.Height / 3;
//      CircleDetailIn4.Height  := LayoutDetailIn4.Height / 3;
//      TextDetailIn5.Height := LayoutDetailIn5.Height / 3;
//      CircleDetailIn5.Height  := LayoutDetailIn5.Height / 3;


  RectangleDetailOut.Height := RectangleDetailBackGround.Height / 2.7;
//  RectangleDetailOut.Margins.Left := LayoutDetailInOut.Width / 10;
//  RectangleDetailOut.Margins.Right := LayoutDetailInOut.Width / 10;
  TextDetailOut.Height := LayoutDetailOut.Height / 3.5;
  CircleDetailOut1.Height := LayoutDetailOut.Height / 6;
  CircleDetailOut2.Height := LayoutDetailOut.Height / 6;
  CircleDetailOut3.Height := LayoutDetailOut.Height / 6;
  CircleDetailOut4.Height := LayoutDetailOut.Height / 6;
  CircleDetailOut5.Height := LayoutDetailOut.Height / 6;
///
  checkout := 0;
  if LayoutDetailOut1.Visible = true then
    inc(checkout);
  if LayoutDetailOut2.Visible = true then
     inc(checkout);
  if LayoutDetailOut3.Visible = true then
     inc(checkout);
  if LayoutDetailOut4.Visible = true then
     inc(checkout);
  if LayoutDetailOut5.Visible = true then
     inc(checkout);


    LayoutDetailOut1.Width := LayoutDetailOutClient.Width / checkout;
    LayoutDetailOut2.Width := LayoutDetailOutClient.Width / checkout;
    LayoutDetailOut3.Width := LayoutDetailOutClient.Width / checkout;
    LayoutDetailOut4.Width := LayoutDetailOutClient.Width / checkout;
    LayoutDetailOut5.Width := LayoutDetailOutClient.Width / checkout;

//      TextDetailOut1.Height := LayoutDetailOut1.Height / 3;
//      CircleDetailOut1.Height  := LayoutDetailOut1.Height / 3;
//      TextDetailOut2.Height := LayoutDetailOut2.Height / 3;
//      CircleDetailOut2.Height  := LayoutDetailOut2.Height / 3;
//      TextDetailOut3.Height := LayoutDetailOut3.Height / 3;
//      CircleDetailOut3.Height  := LayoutDetailOut3.Height / 3;
//      TextDetailOut4.Height := LayoutDetailOut4.Height / 3;
//      CircleDetailOut4.Height  := LayoutDetailOut4.Height / 3;
//      TextDetailOut5.Height := LayoutDetailOut5.Height / 3;
//      CircleDetailOut5.Height  := LayoutDetailOut5.Height / 3;

  //  우측상단
  RectangleDetail2_Right.Width  := LayoutDetailPC2.Width / 10.66;
  RectangleDetail2_Excel.Height := LayoutDetailPC2.Height / 9;
  RectangleDetail2_Excel.Margins.Right  := 1;
  RectangleDetail2_Excel.Margins.Left   := 1;
  Text_Detail2_excel.Height    := RectangleDetail2_Excel.Height/3;


  //좌측 하단
  LayoutGraph.Height         := LayoutDetailPC3.Height / 8.16;
  LayoutGraph1DateTime.Width := LayoutGraph.Width / 1.92;
  RectangleGraph_.Height     := LayoutGraph.Height / 2.6;
  TextGraphDateTime.Width    := LayoutGraph1DateTime.Width / 27.77;
  LayoutDateEditGraph1.Width := (LayoutGraph1DateTime.Width+ TextGraphDateTime.Width) / 2.15;
  LayoutDateEditGraph2.Width := (LayoutGraph1DateTime.Width+ TextGraphDateTime.Width) / 2.15;

  DateEditGraph1.Width       := LayoutDateEditGraph1.Width/2;
  TimeEditGraph1.width       := LayoutDateEditGraph1.Width/2;
  DateEditGraph2.Width       := LayoutDateEditGraph2.Width/2;
  TimeEditGraph2.width       := LayoutDateEditGraph2.Width/2;

  Image_Left.Width   := LayoutGraph.Width / 19.2;
  Image_right.Width  := LayoutGraph.Width / 19.2;
  Image_Search.Width := LayoutGraph.Width / 12;

  RectangleDetail3_Excel.Margins.Top    := 1;
  RectangleDetail3_Excel.Margins.Bottom := 1;
  RectangleDetail3_Excel.Margins.Right  := 0;
  RectangleDetail3_Excel.Margins.Left   := 0;
  RectangleDetail3_Excel.Width := LayoutGraph.Width / 10.66;
  Text_Detail3_excel.Height    := RectangleDetail3_Excel.Height/3.5;

  // 우측 하단
  LayoutGraph_Detail_top.Height := LayoutDetailPC4.Height / 8.16;

  TextSaveTime.Width := LayoutDetailPC4.Width / 12;
  RectangleGraphSaveTimeTitle1.Width  := LayoutDetailPC4.Width / 11;
  RectangleGraphSaveTimeTitle2.Width  := LayoutDetailPC4.Width / 11;
  RectangleGraphSaveTimeTitle3.Width  := LayoutDetailPC4.Width / 11;
  RectangleGraphSaveTimeTitle4.Width  := LayoutDetailPC4.Width / 11;
  RectangleGraphSaveTimeTitle5.Width  := LayoutDetailPC4.Width / 11;

  TextGraphSaveTimeTitle1.Height  := RectangleGraphSaveTimeTitle1.Height/2;
  TextGraphSaveTimeTitle2.Height  := RectangleGraphSaveTimeTitle2.Height/2;
  TextGraphSaveTimeTitle3.Height  := RectangleGraphSaveTimeTitle3.Height/2;
  TextGraphSaveTimeTitle4.Height  := RectangleGraphSaveTimeTitle4.Height/2;
  TextGraphSaveTimeTitle5.Height  := RectangleGraphSaveTimeTitle5.Height/2;

  RectangleGraphSaveTime.Width :=  TextSaveTime.Width+(RectangleGraphSaveTimeTitle1.Width *5);



  RectangleGraphExpand.Width :=  LayoutDetailPC4.Width / 4.2;
  ImageGraphPlus.Width       :=  RectangleGraphExpand.Width /6;
  ImageGraphMinus.Width      :=  RectangleGraphExpand.Width /6;

  Text_Detail4_excel.Height    := RectangleDetail4_Excel.Height/3.5;
  Text_Detail4_Chart.Height    := RectangleDetail4_Chart.Height/3.5;

  RectangleDetail4_chart.Width := LayoutDetailPC4.Width / 10.6;
  RectangleDetail4_Excel.Width := LayoutDetailPC4.Width / 10.6;
  RectangleDetail4_chart.Margins.Right := LayoutDetailPC4.Width / 96;
  RectangleDetail4_Excel.Margins.Right := LayoutDetailPC4.Width / 96;


  // Graph
  RectangleGraphTitle.Height := ClientHeight / 16;
  TextGraphDevice.Height := ClientHeight / 16;

  ButtonGraphSave.Width := LayoutGraph2.Width / 2 - 20;
  ButtonGraphCSV.Width := LayoutGraph2.Width / 2 - 20;

  //ImageGraphDetail.Width := ImageGraphDetail.Height;


 // {$ENDIF ANDROID}
end;

procedure TfDongHwa.SaveTimeDisplay;
begin
  TextGraphSaveTimeTitle1.Text := NameK[1];
  TextGraphSaveTimeValue1.Text := FormatFloat('#,0h ',Round(SaveTimeK[1]) div 60) + FormatFloat('#,0m',Round(SaveTimeK[1]) mod 60);

  TextGraphSaveTimeTitle2.Text := NameK[2];
  TextGraphSaveTimeValue2.Text := FormatFloat('#,0h ',Round(SaveTimeK[2]) div 60) + FormatFloat('#,0m',Round(SaveTimeK[2]) mod 60);

  TextGraphSaveTimeTitle3.Text := NameK[3];
  TextGraphSaveTimeValue3.Text := FormatFloat('#,0h ',Round(SaveTimeK[3]) div 60) + FormatFloat('#,0m',Round(SaveTimeK[3]) mod 60);

  TextGraphSaveTimeTitle4.Text := NameK[4];
  TextGraphSaveTimeValue4.Text := FormatFloat('#,0h ',Round(SaveTimeK[4]) div 60) + FormatFloat('#,0m',Round(SaveTimeK[4]) mod 60);

  TextGraphSaveTimeTitle5.Text := NameK[5];
  TextGraphSaveTimeValue5.Text := FormatFloat('#,0h ',Round(SaveTimeK[5]) div 60) + FormatFloat('#,0m',Round(SaveTimeK[5]) mod 60);
end;

procedure TfDongHwa.Series1GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: string);
begin
  try
    if ValueIndex <> Current then
    begin
      MarkText:='';
    end else
    begin
      MarkText := FormatDateTime('yy.m.dd hh:nn  ',Chart1.Series[0].XValue[ValueIndex]) + MarkText+'℃';
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
        //제상버튼추가
        if ( (TextDetailModel.Text = 'WT2023C')
          or (TextDetailModel.Text = 'W1120DC2S')
          or (TextDetailModel.Text = 'WK2023C')
          or (TextDetailModel.Text = 'WK2023AC')
          or (TextDetailModel.Text = 'WT2023AC')
          or (TextDetailModel.Text = 'W2023AC')
          or (TextDetailModel.Text = 'W2023C')
          or (TextDetailModel.Text = 'BW7023-S')  )
          And (FieldByName('DefrostState').AsBoolean) then
        begin
          if FieldByName('DefrostMode').AsBoolean then
          begin
            MarkText := MarkText+ '  수동제상';
          end else
          begin
            MarkText := MarkText+ '  제상';
          end;
        end else
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
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.SetSaveButton1(Sender: TObject);
var
  ParnetRectangle : TRectangle;
begin
  if MainSetChangeState  then Exit;
  if ControllerState[(Sender as TText).Tag] then
  begin
    MainSetChangeState := True;
    ParnetRectangle := ((Sender as TText).Parent as TRectangle);
    ParnetRectangle.Visible := False;
    (FindComponent('LayoutMain'+ParnetRectangle.Tag.ToString+'Set') as TLayOut).Visible := True;
  end else
  begin
    Showmessage('컨트롤러의 신호가 약합니다...');
  end;
end;

procedure TfDongHwa.SetSaveButton2(Sender: TObject);
var
  ParnetLayout : TLayout;
begin
  try
     MessageDlg('온도값을 변경하시겠습니까?'
      , System.UITypes.TMsgDlgType.mtInformation,
     [
       System.UITypes.TMsgDlgBtn.mbYes,
       System.UITypes.TMsgDlgBtn.mbNo
     ], 0,
     procedure (const AResult: TModalResult)
     begin
       if AResult = mrYes then
       begin
          UniQueryIOT.Close;
          UniQueryIOT.SQL.Clear;
          UniQueryIOT.SQL.Add('Exec usp_Controller @Option = ''T'', @ControllerID = :ControllerID');
          UniQueryIOT.SQL.Add(', @SetTemp = :SetTemp');
          UniQueryIOT.ParamByName('ControllerID').AsInteger := ControllerID[(Sender as TText).Tag];
          UniQueryIOT.ParamByName('SetTemp').AsFloat := SetTemp[(Sender as TText).Tag];
          UniQueryIOT.ExecSQL;

          Showmessage('온도설정값 변경 요청을 하였습니다.'+#13+'시간이 다소 소요될 수 있습니다');
       end;
       MainSetChangeState := False;
       ParnetLayout := (((Sender as TText).Parent as TImage).Parent as TLayOut);
       ParnetLayout.Visible := False;
       (FindComponent('RectangleMain'+ParnetLayout.Tag.ToString+'Set') as TRectangle).Visible := True;
     end
     );
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
//check the Secure File Sharing option in the Entitlements List in the Project Options
  //ShowShareSheetAction1.Bitmap.Assign(Chart1.TeeCreateBitmap);
end;

procedure TfDongHwa.StringGrid1DrawColumnCell(Sender: TObject;
  const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
  const Row: Integer; const Value: TValue; const State: TGridDrawStates);
var
  AdjustedBounds: TRectF;
begin
    // 기본 그리기를 막음
  Canvas.BeginScene;
  try
    // Bounds를 약간 확장하여 여백 제거
    AdjustedBounds := TRectF.Create(Bounds.Left, Bounds.Top, Bounds.Right, Bounds.Bottom);
    // 짝수/홀수 행에 따른 색상 적용
    if Row mod 2 = 0 then
      Canvas.Fill.Color := $FFF9F5F9  // 짝수 행
    else
      Canvas.Fill.Color := $FFEFF7FE; // 홀수 행
    // 배경을 칠함
    Canvas.FillRect(AdjustedBounds, 0, 0, [], 1);
    // 셀의 텍스트를 직접 그리기
    Canvas.Fill.Color := TAlphaColorRec.Black;  // 텍스트 색상
    Canvas.Font.Size := 14; // 폰트 크기
    Canvas.FillText(AdjustedBounds, Value.ToString, False, 1, [], TTextAlign.Leading, TTextAlign.Center);
  finally
    Canvas.EndScene;
  end;
end;

procedure TfDongHwa.StringGrid2DrawColumnCell(Sender: TObject;
  const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
  const Row: Integer; const Value: TValue; const State: TGridDrawStates);
begin
//  Canvas.Fill.Color := TAlphaColors.Red; // 빨간색으로 설정
//  Canvas.FillText(Bounds, Value.ToString, False, 1, [], TTextAlign.Leading, TTextAlign.Center);
end;

procedure TfDongHwa.TabControl1Change(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItemMain then
  begin
    {$IFDEF MSWINDOWS}
      fDongHwa.WindowState := TWindowState.wsMaximized;
    {$ENDIF MSWINDOWS}
    MainRefresh;
  end else
  begin
    {$IFDEF MSWINDOWS}
//      fDongHwa.Width := 600;
//      fDongHwa.Height := 800;
//      fDongHwa.Position := TFormPosition.ScreenCenter;
    {$ENDIF MSWINDOWS}
  end;
end;

procedure TfDongHwa.Text1Click(Sender: TObject);
begin
//  ButtonTEST.Visible := not ButtonTEST.Visible;
end;

procedure TfDongHwa.Text5Click(Sender: TObject);
var
  {$IFDEF ANDROID}
 Intent: JIntent;
 FileUri: Jnet_Uri;
 ListArqs: JArrayList;
  {$ENDIF ANDROID}
 FileName : String;
begin
  {$IFDEF ANDROID}
  try
  //    Image1.Bitmap := Chart1.TeeCreateBitmap;
  //    Image1.Visible := True;

    PermissionsService.RequestPermissions([FPermissionReadExternalStorage],
    procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
    begin
    end);
    PermissionsService.RequestPermissions([FPermissionWriteExternalStorage],
    procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
    begin
    end);

    if (PermissionsService.IsPermissionGranted(FPermissionReadExternalStorage))
     and (PermissionsService.IsPermissionGranted(FPermissionWriteExternalStorage)) then
    begin

      Chart2.SaveToBitmapFile(TPath.GetDownloadsPath+'/'
                    +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
                                      +'_'+Copy(GraphEnd,1,10)+'_2.jpeg');

      ShowShareSheetAction2.Execute;

    end;

  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
  {$ENDIF ANDROID}
                {
  try
    Chart2.SaveToBitmapFile(TPath.GetDownloadsPath+'/'
                  +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
                                    +'_'+Copy(GraphEnd,1,10)+'_2.jpeg');
//    TeeSaveToPNG(Chart1, TPath.GetDownloadsPath+'\'
//                  +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
//                                    +'_'+Copy(GraphEnd,1,10)+'.png');
    Showmessage(TPath.GetDownloadsPath+'/'
                  +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
                                    +'_'+Copy(GraphEnd,1,10)+'_2.jpeg');
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;         }
end;

procedure TfDongHwa.TextGraph2ExpandClick(Sender: TObject);
begin
  Expand2 := 1;
  GraphExpand2;
end;

procedure TfDongHwa.TextGraphExpandClick(Sender: TObject);
begin
  Expand := 1;
  GraphExpand;
end;

procedure TfDongHwa.TextConnectTitleClick(Sender: TObject);
var
  PathStr : String;
begin

end;

procedure TfDongHwa.TextDefrostClick(Sender: TObject);
var
  MessageStr : String;
  DefrostState : Boolean;
begin
  try
    TextDefrost.TextSettings.FontColor := $FFFFFFFF;
    RectangleDefrost.Fill.Color := $FFFF0000;

    UniQueryIOT.Close;
    UniQueryIOT.SQL.Clear;
    UniQueryIOT.SQL.Add('Select ISNULL(PowerState,0) as PowerState,');
    UniQueryIOT.SQL.Add('ISNULL(DefrostState,0) as DefrostState from TempState');
    UniQueryIOT.SQL.Add('WHERE ControllerID = '+DetailControllerID.ToString);
    UniQueryIOT.Open;

    if UniQueryIOT.RecordCount > 0 then
    begin
      if UniQueryIOT.FieldByName('PowerState').AsBoolean then
      begin
        if UniQueryIOT.FieldByName('DefrostState').AsBoolean then
        begin
          MessageStr := '제상을 중지';
          DefrostState := False;
        end else
        begin
          MessageStr := '수동 제상을 실행';
          DefrostState := True;
        end;
      end else
      begin
        Showmessage('전원이 꺼져있습니다.');
        Exit;
      end;
      MessageDlg(MessageStr + '하시겠습니까?'
      , System.UITypes.TMsgDlgType.mtInformation,
      [
       System.UITypes.TMsgDlgBtn.mbYes,
       System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
      procedure (const AResult: TModalResult)
      begin
        if AResult = mrYes then
        begin
          UniQueryIOT.Close;
          UniQueryIOT.SQL.Clear;
          UniQueryIOT.SQL.Add('Exec usp_Controller @Option = ''P'', @ControllerID = :ControllerID');
          UniQueryIOT.SQL.Add(', @Defrost = :Defrost');
          UniQueryIOT.SQL.Add(', @PowerState = :PowerState');
          UniQueryIOT.ParamByName('ControllerID').AsInteger := DetailControllerID;
          UniQueryIOT.ParamByName('PowerState').AsBoolean := True;
          UniQueryIOT.ParamByName('Defrost').AsBoolean := DefrostState;
          UniQueryIOT.ExecSQL;

          Showmessage(MessageStr+' 하였습니다.'+#13+'시간이 다소 소요될 수 있습니다');

          TabControl1.ActiveTab := TabItemMain;
        end else
        begin
          TextDefrost.TextSettings.FontColor := $FFFF0000;
          RectangleDefrost.Fill.Color := $FFFFFFFF;
        end;
      end
      );
    end;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.TextDetailChangeClick(Sender: TObject);
begin

  if TextDetailChange.Text = '취소' then
  begin
    RectangleDetailSaveButton.Visible := false;
    EditDetailFlag.SetFocus;

    TextEditDetailName.Visible := false;
    EditDetailName.Visible := False;
    EditDetailName.ReadOnly := True;
    EditDetailName.Text := EditDetailName.TextPrompt;
    TextEditDetailName.Text := EditDetailName.TextPrompt;

    TextDetailTitle.Text := EditDetailName.TextPrompt;

    TextEditDetailTemp.Visible := True;
    EditDetailTemp.Visible := False;
    EditDetailTemp.ReadOnly := True;

    if  EditDetailTemp.Text = EditDetailTemp.TextPrompt then
    begin
      EditDetailTemp.Text := EditDetailTemp.TextPrompt;
    end
    else
    begin
      EditDetailTemp.TextPrompt := EditDetailTemp.Text;
    end;
    TextEditDetailTemp.Text := EditDetailTemp.TextPrompt;

    TextEditDetailSetTemp.Visible := True;
    EditDetailSetTemp.Visible := False;
    EditDetailSetTemp.ReadOnly := True;
    if EditDetailSetTemp.Text = EditDetailSetTemp.TextPrompt then
    begin
      EditDetailSetTemp.Text := EditDetailSetTemp.TextPrompt;
    end
    else
    begin
      EditDetailSetTemp.TextPrompt := EditDetailSetTemp.Text;
    end;
    TextEditDetailSetTemp.Text := EditDetailSetTemp.TextPrompt;

    TextDetailSetTemp.Visible := True;
    TextDetailSetTempEdit.Visible := False;
    TextDetailSetTempEdit.ReadOnly := True;
    TextDetailSetTempEdit.Text := TextDetailSetTempEdit.TextPrompt;
    DetailSetTemp := StrToFloatDef(TextDetailSetTempEdit.TextPrompt,0);
    TextDetailSetTemp.Text := TextDetailSetTempEdit.TextPrompt;// + '℃';

    TextEditDetailHigh.Visible := True;
    EditDetailHigh.Visible := False;
    EditDetailHigh.Text := EditDetailHigh.TextPrompt;

    TextEditDetailHigh.Text := EditDetailHigh.TextPrompt + '℃';
    TextEditDetailLow.Visible := True;
    EditDetailLow.Visible := False;
    EditDetailLow.Text := EditDetailLow.TextPrompt;
    TextEditDetailLow.Text := EditDetailLow.TextPrompt + '℃';

    TextEditDetailIn1.Visible := True;
    TextEditDetailIn2.Visible := True;
    TextEditDetailIn3.Visible := True;
    TextEditDetailIn4.Visible := True;
    TextEditDetailIn5.Visible := True;
    EditDetailIn1.Visible := False;
    EditDetailIn2.Visible := False;
    EditDetailIn3.Visible := False;
    EditDetailIn4.Visible := False;
    EditDetailIn5.Visible := False;

    EditDetailIn1.ReadOnly := True;
    if EditDetailIn1.Text = EditDetailIn1.TextPrompt then
    begin
      EditDetailIn1.Text := EditDetailIn1.TextPrompt;
    end
    else
    begin
      EditDetailIn1.TextPrompt := EditDetailIn1.Text;
    end;
    TextEditDetailIn1.Text := EditDetailIn1.TextPrompt;

    EditDetailIn2.ReadOnly := True;
    if EditDetailIn2.Text = EditDetailIn2.TextPrompt then
    begin
      EditDetailIn2.Text := EditDetailIn2.TextPrompt;
    end
    else
    begin
      EditDetailIn2.TextPrompt := EditDetailIn2.Text;
    end;
    TextEditDetailIn2.Text := EditDetailIn2.TextPrompt;

    EditDetailIn3.ReadOnly := True;
    if EditDetailIn3.Text = EditDetailIn3.TextPrompt then
    begin
      EditDetailIn3.Text := EditDetailIn3.TextPrompt;
    end
    else
    begin
      EditDetailIn3.TextPrompt := EditDetailIn3.Text;
    end;
    TextEditDetailIn3.Text := EditDetailIn3.TextPrompt;

    EditDetailIn4.ReadOnly := True;
    if EditDetailIn4.Text = EditDetailIn4.TextPrompt then
    begin
      EditDetailIn4.Text := EditDetailIn4.TextPrompt;
    end
    else
    begin
      EditDetailIn4.TextPrompt := EditDetailIn4.Text;
    end;
    TextEditDetailIn4.Text := EditDetailIn4.TextPrompt;

    EditDetailIn5.ReadOnly := True;
    if EditDetailIn5.Text = EditDetailIn5.TextPrompt then
    begin
      EditDetailIn5.Text := EditDetailIn5.TextPrompt;
    end
    else
    begin
      EditDetailIn5.TextPrompt := EditDetailIn5.Text;
    end;
    TextEditDetailIn5.Text := EditDetailIn5.TextPrompt;

    TextEditDetailOut1.Visible := True;
    TextEditDetailOut2.Visible := True;
    TextEditDetailOut3.Visible := True;
    TextEditDetailOut4.Visible := True;
    TextEditDetailOut5.Visible := True;
    EditDetailOut1.Visible := False;
    EditDetailOut2.Visible := False;
    EditDetailOut3.Visible := False;
    EditDetailOut4.Visible := False;
    EditDetailOut5.Visible := False;


    EditDetailOut1.ReadOnly := True;
    if EditDetailOut1.Text = EditDetailOut1.TextPrompt then
    begin
      EditDetailOut1.Text := EditDetailOut1.TextPrompt;
    end
    else
    begin
      EditDetailOut1.TextPrompt := EditDetailOut1.Text;
    end;
    TextEditDetailOut1.Text := EditDetailOut1.TextPrompt;

    EditDetailOut2.ReadOnly := True;
    if EditDetailOut2.Text = EditDetailOut2.TextPrompt then
    begin
      EditDetailOut2.Text := EditDetailOut2.TextPrompt;
    end
    else
    begin
      EditDetailOut2.TextPrompt := EditDetailOut2.Text;
    end;
    TextEditDetailOut2.Text := EditDetailOut2.TextPrompt;


    EditDetailOut3.ReadOnly := True;
    if EditDetailOut3.Text = EditDetailOut3.TextPrompt then
    begin
      EditDetailOut3.Text := EditDetailOut3.TextPrompt;
    end
    else
    begin
      EditDetailOut3.TextPrompt := EditDetailOut3.Text;
    end;
    TextEditDetailOut3.Text := EditDetailOut3.TextPrompt;

    EditDetailOut4.ReadOnly := True;
    if EditDetailOut4.Text = EditDetailOut4.TextPrompt then
    begin
      EditDetailOut4.Text := EditDetailOut4.TextPrompt;
    end
    else
    begin
      EditDetailOut4.TextPrompt := EditDetailOut4.Text;
    end;
    TextEditDetailOut4.Text := EditDetailOut4.TextPrompt;

    EditDetailOut5.ReadOnly := True;
    if EditDetailOut5.Text = EditDetailOut5.TextPrompt then
    begin
      EditDetailOut5.Text := EditDetailOut5.TextPrompt;
    end
    else
    begin
      EditDetailOut5.TextPrompt := EditDetailOut5.Text;
    end;
    TextEditDetailOut5.Text := EditDetailOut5.TextPrompt;

    TextDetailChange.Text := '설정변경';
  //  TextDetailSaveButton.Text := '상세정보창 나가기';
    ImageDetailPlus.Enabled := False;
    ImageDetailMinus.Enabled := False;
    ImageDetailPower.Enabled := False;
    RectangleDefrost.Enabled := False;


  end else
  begin
    RectangleDetailSaveButton.Visible := true;

    EditDetailFlag.SetFocus;
    TextEditDetailName.Visible := False;
    TextEditDetailTemp.Visible := False;
    TextEditDetailSetTemp.Visible := False;
    EditDetailName.Visible := True;
    EditDetailTemp.Visible := True;
    EditDetailSetTemp.Visible := True;
    EditDetailName.ReadOnly := False;
    EditDetailTemp.ReadOnly := False;
    EditDetailSetTemp.ReadOnly := False;

    TextDetailSetTemp.Visible := False;
    TextDetailSetTempEdit.Visible := True;
    TextDetailSetTempEdit.ReadOnly := False;

    TextEditDetailHigh.Visible := False;
    EditDetailHigh.Visible := True;
    TextEditDetailLow.Visible := False;
    EditDetailLow.Visible := True;

    TextEditDetailIn1.Visible := False;
    TextEditDetailIn2.Visible := False;
    TextEditDetailIn3.Visible := False;
    TextEditDetailIn4.Visible := False;
    TextEditDetailIn5.Visible := False;
    EditDetailIn1.Visible := True;
    EditDetailIn2.Visible := True;
    EditDetailIn3.Visible := True;
    EditDetailIn4.Visible := True;
    EditDetailIn5.Visible := True;
    EditDetailIn1.ReadOnly := False;
    EditDetailIn2.ReadOnly := False;
    EditDetailIn3.ReadOnly := False;
    EditDetailIn4.ReadOnly := False;
    EditDetailIn5.ReadOnly := False;

    TextEditDetailOut1.Visible := False;
    TextEditDetailOut2.Visible := False;
    TextEditDetailOut3.Visible := False;
    TextEditDetailOut4.Visible := False;
    TextEditDetailOut5.Visible := False;
    EditDetailOut1.Visible := True;
    EditDetailOut2.Visible := True;
    EditDetailOut3.Visible := True;
    EditDetailOut4.Visible := True;
    EditDetailOut5.Visible := True;
    EditDetailOut1.ReadOnly := False;
    EditDetailOut2.ReadOnly := False;
    EditDetailOut3.ReadOnly := False;
    EditDetailOut4.ReadOnly := False;
    EditDetailOut5.ReadOnly := False;
    TextDetailChange.Text := '취소';
    TextDetailSaveButton.Text := '저장';
    ImageDetailPlus.Enabled := True;
    ImageDetailMinus.Enabled := True;
    ImageDetailPower.Enabled := True;
    RectangleDefrost.Enabled := True;

              /////////////off
      if TextDetailTemp.Text = 'OFF' then
      begin
        TextDetailSetTempEdit.Enabled := false;
        EditDetailName.Enabled    := false;
        ImageDetailPlus.Enabled   := false;
        ImageDetailMinus.Enabled  := false;
        TextDefrost.Enabled       := false;
        EditDetailHigh.Enabled    := false;
        EditDetailLow.Enabled     := false;
        EditDetailOut1.Enabled    := false;
        EditDetailOut2.Enabled    := false;
        EditDetailOut3.Enabled    := false;
        EditDetailOut4.Enabled    := false;
        EditDetailOut5.Enabled    := false;
      end
      else
      begin
        TextDetailSetTempEdit.Enabled := true;
        EditDetailName.Enabled    := true;
        ImageDetailPlus.Enabled   := true;
        ImageDetailMinus.Enabled  := true;
        TextDefrost.Enabled       := true;
        EditDetailHigh.Enabled    := true;
        EditDetailLow.Enabled     := true;
        EditDetailOut1.Enabled    := true;
        EditDetailOut2.Enabled    := true;
        EditDetailOut3.Enabled    := true;
        EditDetailOut4.Enabled    := true;
        EditDetailOut5.Enabled    := true;
      end;
  end;
  Resize;
end;

procedure TfDongHwa.TextDetailSaveButtonClick(Sender: TObject);
var
  MessageStr : String;
  SetName : string;
begin
  try
    if StrToFloatDef(EditDetailHigh.Text,99999) = 99999 then
    begin
      EditDetailHigh.Text := EditDetailHigh.TextPrompt;
//      Exit;
    end;

    if StrToFloatDef(EditDetailLow.Text,99999) = 99999 then
    begin
      EditDetailLow.Text := EditDetailLow.TextPrompt;
//      Exit;
    end;

    if StrToFloatDef(TextDetailSetTempEdit.Text,99999) = 99999 then
    begin
      TextDetailSetTempEdit.Text := TextDetailSetTempEdit.TextPrompt;
//      Exit
    end;

    DetailSetTemp := StrToFloatDef(TextDetailSetTempEdit.Text,99999);
    TextDetailSetTemp.Text := FormatFloat('0.0',DetailSetTemp);//+'℃';
    //상한
    hightemp :=   StrToFloatDef(EditDetailHigh.Text,99999);
    Lowtemp  :=   StrToFloatDef(EditDetailLow.Text,99999);
    // 설정온도 상하한 체크
    with UniQuery_SetCheck do
    begin
      close;
      sql.Clear;
      sql.Add('select SetCountHigh,SetCountLow from model where  Name = :Name');
      ParamByName('Name').AsString := TextDetailModel.Text;
      open;

      if RecordCount > 0 then
      begin
        hightemp2 :=   FieldByName('SetCountHigh').AsFloat;
        Lowtemp2  :=   FieldByName('SetCountLow').AsFloat;
      end
      else
      begin
        hightemp2 :=   99.9;
        Lowtemp2  :=   -99.9;
      end;
    end;

    if (DetailSetTemp > hightemp2)
    or (DetailSetTemp < Lowtemp2)
     then
    begin
      ShowMessage('설정값이 범위를 초과하였습니다');
      exit;
    end;
    

    if TextDetailSaveButton.Text = '저장' then
    begin
      if TextDetailTemp.Text = 'OFF' then
      begin
        TextDetailChangeClick(self);
      end
      else
      begin
        MessageStr := '';
        if DetailSetTempStr <> TextDetailSetTemp.Text then
        begin
          MessageStr := '설정온도 변경 : '+DetailSetTempStr+'=>'+TextDetailSetTemp.Text+#13;
        end;
        MessageDlg(MessageStr + '저장하시겠습니까?'
        , System.UITypes.TMsgDlgType.mtInformation,
        [
         System.UITypes.TMsgDlgBtn.mbYes,
         System.UITypes.TMsgDlgBtn.mbNo
        ], 0,
        procedure (const AResult: TModalResult)
        begin
          if AResult = mrYes then
          begin
            TWaitDialog.Show('설정 정보를'+#13+'저장중입니다.');
            TimerProcedure.OnTimer := DetailSave;
            TimerProcedure.Enabled := True;
           // TabControl1.ActiveTab := TabItemMain;

            if MessageStr <> '' then
            begin
              UniQueryIOT.Close;
              UniQueryIOT.SQL.Clear;
              UniQueryIOT.SQL.Add('Exec usp_Controller @Option = ''T'', @ControllerID = :ControllerID');
              UniQueryIOT.SQL.Add(', @SetTemp = :SetTemp');
              UniQueryIOT.ParamByName('ControllerID').AsInteger := DetailControllerID;
              UniQueryIOT.ParamByName('SetTemp').AsFloat := DetailSetTemp;
              UniQueryIOT.ExecSQL;
            //  TextDetailSetTemp.Text := TextDetailSetTempEdit.Text;
              Showmessage('온도설정값 변경 요청을 하였습니다.'+#13+'시간이 다소 소요될 수 있습니다');
            //  TextDetailSetTemp.Text := TextDetailSetTempEdit.TextPrompt;
              TextDetailSetTempEdit.Text := FormatFloat('0.0',DetailSetTemp);
              TextDetailSetTempEdit.TextPrompt := TextDetailSetTempEdit.Text;
              DetailSetTempStr  := TextDetailSetTempEdit.Text;

            end;

              SetName := EditDetailName.Text;
              TextDetailChangeClick(self);
              TextEditDetailName.Text :=  SetName;
              TextDetailTitle.Text := SetName;
              EditDetailName.Text := SetName;
          end;
        end
      );
      end;
    end else
    begin
      TabControl1.ActiveTab := TabItemMain;
    end;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.TextDetailSetTempEditEnter(Sender: TObject);
begin
  try
    (Sender as TEdit).Text := '';
  except

  end;
end;

procedure TfDongHwa.TextDetailSetTempEditExit(Sender: TObject);
begin
  try
    if StrToFloatDef((Sender as TEdit).Text,99999) = 99999 then
    begin
//      Showmessage('숫자만 입력해 주세요');
      (Sender as TEdit).Text := (Sender as TEdit).TextPrompt;
    end else
    begin
      DetailSetTemp := StrToFloatDef((Sender as TEdit).Text,99999);
      TextDetailSetTemp.Text := FormatFloat('0.0',DetailSetTemp);//+'℃';
    end;
  except

  end;
end;

procedure TfDongHwa.TextJoinAddClick(Sender: TObject);
begin
  TWaitDialog.Show('등록중입니다.');
  TimerProcedure.OnTimer := Join;
  TimerProcedure.Enabled := True;
end;

procedure TfDongHwa.TextJoinClick(Sender: TObject);
begin
  ImageJoinBack.Bitmap := ImageBack1.Bitmap;
  TabControl1.ActiveTab := TabItemJoin;
end;

procedure TfDongHwa.TextLoginClick(Sender: TObject);
begin
  TWaitDialog.Show('로그인중입니다.');
  TimerProcedure.OnTimer := Login;
  TimerProcedure.Enabled := True;
  Text_UserID.Text := EditID.Text;
end;

procedure TfDongHwa.TextMouseLeaveR(Sender: TObject);
begin
  ((Sender as TText).Parent as TRectangle).Opacity := 1;
end;

procedure TfDongHwa.TextMouseMoveR(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  ((Sender as TText).Parent as TRectangle).Opacity := 0.7;
end;

procedure TfDongHwa.TextMainClick(Sender: TObject);
begin
//  TabControl1.ActiveTab := TabItemLogin;
end;

procedure TfDongHwa.TextManageBackClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItemMain;
end;

procedure TfDongHwa.TextMouseLeave(Sender: TObject);
begin
  ((Sender as TText).Parent as TRectangle).Fill.Color := $FF74A3F2;
  (Sender as TText).TextSettings.FontColor := TAlphaColors.White;
end;

procedure TfDongHwa.TextMouseLeaveI(Sender: TObject);
begin
  ((Sender as TText).Parent as TImage).Opacity := 1;
end;

procedure TfDongHwa.TextMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  ((Sender as TText).Parent as TRectangle).Fill.Color := TAlphaColors.White;
  (Sender as TText).TextSettings.FontColor := TAlphaColors.Black;
end;

procedure TfDongHwa.TextMouseMoveI(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  ((Sender as TText).Parent as TImage).Opacity := 0.7;
end;

procedure TfDongHwa.TimeEditGraph1Change(Sender: TObject);
begin
   if TimeEditGraph1.Time > Time then
    TimeEditGraph1.Time := Time; // 현재 시간으로 변경
end;

procedure TfDongHwa.TimeEditGraph2Change(Sender: TObject);
begin
   if TimeEditGraph2.Time > Time then
    TimeEditGraph2.Time := Time; // 현재 시간으로 변경
end;

procedure TfDongHwa.TimerControllerAllSearchTimer(Sender: TObject);
begin
  TimerControllerAllSearch.Enabled := False;
  ControllerAllSearchCount := ControllerAllSearchCount + 1;
  if ControllerAllSearchCount < 5 then
  begin
    ControllerAllSearch;
  end else
  begin
    Showmessage('ControllerAllSearch Error');
  end;
end;

procedure TfDongHwa.TimerFirstCheckTimer(Sender: TObject);
begin
  TimerFirstCheck.Enabled := False;
  try
    UniConnection1.Server := 'db.dhesys.kr';
    UniConnection1.Connected := True;
  except
    try
      UniConnection1.Server := 'coderun.co.kr';
      UniConnection1.Connected := True;
    except

    end;
  end;
  TextServer.Text := UniConnection1.Server;
end;

procedure TfDongHwa.TimerGraphSearchTimer(Sender: TObject);
begin
  TimerGraphSearch.Enabled := False;
  GraphSearchCount := GraphSearchCount + 1;
  if GraphSearchCount < 5 then
  begin
    GraphSearch;
  end else
  begin
    Showmessage('GraphSearch Error');
  end;
end;

procedure TfDongHwa.TimerTempCheckTimer(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItemMain then
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        try
          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              try
                if UniConnection1.Connected then
                begin
                  MainRefresh;
                end;
              except on e:Exception do
                showmessage(e.Message);
              end;
            end);
        finally

        end;
      end).Start();

  end;
end;

procedure TfDongHwa.Timer_CheckTimer(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
  Text_Timer.Text := DateTimeToStr(now);

  if not IsInternetConnected then
  begin
    if MessageShown = false then
    begin
      MessageShown := true;
      ShowMessage('인터넷 연결이 없습니다. 연결상태를 확인해주십시오.');
    end;
  end
  else
  begin
    MessageShown := false;
  end;
  {$ENDIF MSWINDOWS}
end;

procedure TfDongHwa.Timer_UpdateTimer(Sender: TObject);
begin
  with UniQuery_Update do  // 더블클릭하면 쿼리있음
  begin
    if Active = false then
      Active := true
    else
      Refresh;

    if FieldByName('VERSION').AsString <> TextVersion.Text  then
    begin
      Text_Update.Visible := true;
    end
    else
    begin
      Text_Update.Visible := false;
    end;
  end;
end;

procedure TfDongHwa.SearchAlarmList;
var
  SaveTimeK : Array[0..5] of Currency;
   FirstK1, FirstK2, FirstK3, FirstK4, FirstK5 : Boolean;
    TempCheckDate, AlarmDate, ClosestDate: TDateTime;
begin


    // 240812 김동휘추가
//   왼쪽 하단
    with UniQuery_AlarmList do
    begin
      close;
      sql.Clear;
      SQL.Add('select t.* from TempCheck as T');
      SQL.Add('left join ControllerInfo as c ');
      SQL.Add('on c.SerialNo = t.SerialNo    ');
      SQL.Add('where ControllerID = '+DetailControllerID.ToString);
      SQL.Add('and CheckDate >= '+#39+FormatDateTime('yyyy-mm-dd',DateEditGraph1.Date)
                                 +FormatDateTime(' hh:nn:ss',TimeEditGraph1.Time)+#39);
      SQL.Add('and CheckDate <= '+#39+FormatDateTime('yyyy-mm-dd',DateEditGraph2.Date)
                                 +FormatDateTime(' hh:nn:ss',TimeEditGraph2.Time)+#39);
      SQL.Add('Order by CheckDate');
      open;


      for var i := 0 to 5 do
      begin
        SaveTimeK[i] := 0;
      end;

      StringGrid2.BeginUpdate;
      StringGrid2.RowCount :=0;
      StringGrid2.RowCount := RecordCount;
      for var i := 0 to RecordCount - 1 do
      begin
        StringGrid2.Cells[StringColumn4.Index,i] :=
                  FormatDateTime('yyyy-mm-dd hh:nn:ss',FieldByName('CheckDate').AsDateTime);
        StringGrid2.Cells[StringColumn5.Index,i] :=
                              FormatFloat('#,0.##',FieldByName('Temp').AsCurrency);
        StringGrid2.Cells[StringColumn6.Index,i] :=
                              FormatFloat('#,0.##',FieldByName('SetTemp').AsCurrency);
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

        StringGrid2.Cells[StringColumn7.Index,i] := '';
        if FieldByName('DOut1').AsBoolean then
        begin
          StringGrid2.Cells[StringColumn7.Index,i] := StringGrid2.Cells[StringColumn7.Index,i] + 'k1 ';
          if SaveTimeK[1] > 0 then
          begin
             StringGrid2.Cells[StringColumn11.Index,i] := ' [k1 : '+Round(SaveTimeK[1] / 0.00069444).ToString+'m]';  // 0.0000011574 * 600 = 1분
          end;
        end;
        if FieldByName('DOut2').AsBoolean then
        begin
          StringGrid2.Cells[StringColumn7.Index,i] :=StringGrid2.Cells[StringColumn7.Index,i] + 'k2 ';
          if SaveTimeK[2] > 0 then
          begin
             StringGrid2.Cells[StringColumn11.Index,i] := VarToStr( StringGrid2.Cells[StringColumn11.Index,i]) +
                                                                      ' [k2 : '+Round(SaveTimeK[2] / 0.00069444).ToString+'m]';
          end;
        end;
        if FieldByName('DOut3').AsBoolean then
        begin
          StringGrid2.Cells[StringColumn7.Index,i] := StringGrid2.Cells[StringColumn7.Index,i] + 'k3 ';
          if SaveTimeK[3] > 0 then
          begin
             StringGrid2.Cells[StringColumn11.Index,i] := VarToStr( StringGrid2.Cells[StringColumn11.Index,i]) +
                                                                      ' [k3 : '+Round(SaveTimeK[3] / 0.00069444).ToString+'m]';
          end;
        end;
        if FieldByName('DOut4').AsBoolean then
        begin
          StringGrid2.Cells[StringColumn7.Index,i] := StringGrid2.Cells[StringColumn7.Index,i] + 'k4 ';
          if SaveTimeK[4] > 0 then
          begin
             StringGrid2.Cells[StringColumn11.Index,i] := VarToStr( StringGrid2.Cells[StringColumn11.Index,i]) +
                                                                      ' [k4 : '+Round(SaveTimeK[4] / 0.00069444).ToString+'m]';
          end;
        end;
        if FieldByName('DOut5').AsBoolean then
        begin
          StringGrid2.Cells[StringColumn7.Index,i] := StringGrid2.Cells[StringColumn7.Index,i] + 'k5 ';
          if SaveTimeK[5] > 0 then
          begin
             StringGrid2.Cells[StringColumn11.Index,i] := VarToStr( StringGrid2.Cells[StringColumn11.Index,i]) +
                                                                      ' [k5 : '+Round(SaveTimeK[5] / 0.00069444).ToString+'m]';
          end;
        end;

        if FieldByName('Err').AsString = '010' then
        begin
          StringGrid2.Cells[StringColumn8.Index,i] := 'Er2';
        end else if FieldByName('Err').AsString = '001' then
        begin
           StringGrid2.Cells[StringColumn8.Index,i] := 'Er1';
        end;
        Next;
      end;

      UniQuery_DetailAlarm2.close;
      UniQuery_DetailAlarm2.sql.Clear;
      UniQuery_DetailAlarm2.sql.Add('SELECT * FROM ALARM ');
      UniQuery_DetailAlarm2.SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
      UniQuery_DetailAlarm2.SQL.Add('and StartTime between :Start and :End ');
      UniQuery_DetailAlarm2.ParamByName('Start').AsString := FormatDateTime('yyyy-mm-dd',DateEditGraph1.Date)+FormatDateTime(' hh:nn:ss',TimeEditGraph1.Time);
      UniQuery_DetailAlarm2.ParamByName('End').AsString := FormatDateTime('yyyy-mm-dd',DateEditGraph2.Date)+FormatDateTime(' hh:nn:ss',TimeEditGraph2.Time);

      UniQuery_DetailAlarm2.open;
      if StringGrid2.RowCount < UniQuery_DetailAlarm2.RecordCount then
      begin
        StringGrid2.RowCount := UniQuery_DetailAlarm2.RecordCount;
      end;
      for var I := 0 to UniQuery_DetailAlarm2.RecordCount -1 do
      begin
        StringGrid2.Cells[StringColumn8.Index,i]  := UniQuery_DetailAlarm2.FieldByName('ErrCode').AsString;
        StringGrid2.Cells[StringColumn9.Index,i]  := UniQuery_DetailAlarm2.FieldByName('StartTime').AsString;
        StringGrid2.Cells[StringColumn10.Index,i] := UniQuery_DetailAlarm2.FieldByName('EndTime').AsString;
        UniQuery_DetailAlarm2.next;
      end;
      StringGrid2.EndUpdate;
    end;
end;


function TfDongHwa.IsInternetConnected: Boolean;
begin
  Result := InternetGetConnectedState(nil, 0);
end;


end.
