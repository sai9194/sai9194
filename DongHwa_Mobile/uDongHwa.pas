unit uDongHwa;

interface

uses
  {$IFDEF ANDROID}
    FMX.PushNotification.Android,   // for Pus
      Androidapi.JNI.Net,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.Provider,
  Androidapi.JNI.App,
   FMX.Helpers.Android,
 Androidapi.JNI.Java.Security,
  Androidapi.JNI.Java.Net,
   Androidapi.JNI.Util,

   FMX.Platform.Android,
   Androidapi.JNI.GraphicsContentViewText,
   ZXing.BarcodeFormat,
  ZXing.ReadResult,
  ZXing.ScanManager,
  {$ENDIF ANDROID}
   System.PushNotification,       System.JSON, System.RegularExpressions,
     System.Messaging,
  FMX.WaitDialog, IdTCPClient,   Math, DateUtils,    System.Notification, System.StrUtils,
  System.Threading,  IdSync, IdThreadComponent,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, UniProvider,
  SQLServerUniProvider, Data.DB, DBAccess, Uni, MemDS, FMX.Gestures,
  System.Actions, FMX.ActnList, FMX.ListBox, FMX.Media, FMX.Ani, FMXTee.Engine,  FMX.Platform,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.StdActns,
  FMX.MediaLibrary.Actions, FMX.DateTimeCtrls;

type
  TfDongHwa = class(TForm)
    TabControl1: TTabControl;
    TabItemConnect: TTabItem;
    Layout1: TLayout;
    Text1: TText;
    EdtWifiID: TEdit;
    Layout2: TLayout;
    Text2: TText;
    EdtWifiPW: TEdit;
    ButtonWifiSave: TButton;
    ButtonWifiName: TButton;
    BtnConnect: TButton;
    ButtonWifiSet: TButton;
    Memo1: TMemo;
    TimerSerial: TTimer;
    TimerLoadingOut: TTimer;
    TimerConnectionClose: TTimer;
    TimerSerialCheck: TTimer;
    TimerWifiSend: TTimer;
    TimerC: TTimer;
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
    RectangleMain1Top: TRectangle;
    LayoutMain1Right: TLayout;
    LayoutMain1Client: TLayout;
    RectangleMain1Set: TRectangle;
    TextMain1Set: TText;
    LayoutMain1Temp: TLayout;
    TextMain1TempL: TText;
    TextMain1Temp: TText;
    RectangleMain1SetTemp: TRectangle;
    TextMain1SetTempL: TText;
    TextMain1SetTemp: TText;
    LayoutMain1RTop: TLayout;
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
    LayoutMain1RClient: TLayout;
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
    RectangleMain2: TRectangle;
    TextMain2Name: TText;
    TextMain2Model: TText;
    RectangleMain2Top: TRectangle;
    LayoutMain2Right: TLayout;
    LayoutMain2RTop: TLayout;
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
    LayoutMain2RClient: TLayout;
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
    LayoutMain2Client: TLayout;
    RectangleMain2Set: TRectangle;
    TextMain2Set: TText;
    LayoutMain2Temp: TLayout;
    TextMain2TempL: TText;
    TextMain2Temp: TText;
    RectangleMain2SetTemp: TRectangle;
    TextMain2SetTempL: TText;
    TextMain2SetTemp: TText;
    ImageMain2Plus: TImage;
    RectangleMain3: TRectangle;
    TextMain3Name: TText;
    TextMain3Model: TText;
    RectangleMain3Top: TRectangle;
    LayoutMain3Right: TLayout;
    LayoutMain3RTop: TLayout;
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
    LayoutMain3RClient: TLayout;
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
    LayoutMain3Client: TLayout;
    RectangleMain3Set: TRectangle;
    TextMain3Set: TText;
    LayoutMain3Temp: TLayout;
    TextMain3TempL: TText;
    TextMain3Temp: TText;
    RectangleMain3SetTemp: TRectangle;
    TextMain3SetTempL: TText;
    TextMain3SetTemp: TText;
    ImageMain3Plus: TImage;
    Layout3: TLayout;
    ImageConnectBack: TImage;
    TimerPlusOk: TTimer;
    TimerTempCheck: TTimer;
    UniQueryTempCheck: TUniQuery;
    UniQueryPlus: TUniQuery;
    LayoutMain1Set: TLayout;
    ImageMain1SetPlus: TImage;
    ImageMain1SetMinus: TImage;
    ImageMain1SetSave: TImage;
    TextMain1SetSave: TText;
    LayoutMain2Set: TLayout;
    ImageMain2SetPlus: TImage;
    ImageMain2SetMinus: TImage;
    ImageMain2SetSave: TImage;
    TextMain2SetSave: TText;
    LayoutMain3Set: TLayout;
    ImageMain3SetPlus: TImage;
    ImageMain3SetMinus: TImage;
    ImageMain3SetSave: TImage;
    TextMain3SetSave: TText;
    TabItemDetail: TTabItem;
    RectangleDetailBackGround: TRectangle;
    TextDetailTitle: TText;
    RectangleDetailDevice: TRectangle;
    TextDetailModel: TText;
    LayoutDetailTempClient: TLayout;
    LayoutDetailTemp: TLayout;
    TextDetailTemp: TText;
    RectangleDetailSetTemp: TRectangle;
    TextDetailSetTemp: TText;
    LayoutDetailSetTemp: TLayout;
    ImageDetailPlus: TImage;
    ImageDetailMinus: TImage;
    LayoutDetailInOut: TLayout;
    LayoutDetailIn: TLayout;
    LayoutDetailInClient: TLayout;
    LayoutDetailIn1: TLayout;
    CircleDetailIn1: TCircle;
    LayoutDetailIn2: TLayout;
    CircleDetailIn2: TCircle;
    LayoutDetailIn5: TLayout;
    CircleDetailIn5: TCircle;
    LayoutDetailIn4: TLayout;
    CircleDetailIn4: TCircle;
    LayoutDetailIn3: TLayout;
    CircleDetailIn3: TCircle;
    TextDetailIn: TText;
    LayoutDetailOut: TLayout;
    LayoutDetailOutClient: TLayout;
    LayoutDetailOut1: TLayout;
    CircleDetailOut1: TCircle;
    LayoutDetailOut2: TLayout;
    CircleDetailOut2: TCircle;
    LayoutDetailOut5: TLayout;
    CircleDetailOut5: TCircle;
    LayoutDetailOut4: TLayout;
    CircleDetailOut4: TCircle;
    LayoutDetailOut3: TLayout;
    CircleDetailOut3: TCircle;
    TextDetailOut: TText;
    EditDetailName: TEdit;
    EditDetailTemp: TEdit;
    EditDetailSetTemp: TEdit;
    RectangleDetailSaveButton: TRectangle;
    TextDetailSaveButton: TText;
    EditDetailIn1: TEdit;
    EditDetailIn2: TEdit;
    EditDetailIn3: TEdit;
    EditDetailIn4: TEdit;
    EditDetailIn5: TEdit;
    EditDetailOut5: TEdit;
    EditDetailOut4: TEdit;
    EditDetailOut3: TEdit;
    EditDetailOut2: TEdit;
    EditDetailOut1: TEdit;
    RectangleDetailChange: TRectangle;
    TextDetailChange: TText;
    UniQueryDetailSave: TUniQuery;
    EditDetailFlag: TEdit;
    UniQueryAllSearch: TUniQuery;
    RectangleMain: TRectangle;
    RectangleMainBottom: TRectangle;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    ActionNext: TAction;
    ActionPrior: TAction;
    TimerMouseDown: TTimer;
    ImageMain1: TImage;
    ImageMain2: TImage;
    ImageMain3: TImage;
    TabItemMember: TTabItem;
    RectangleMember: TRectangle;
    TextMember: TText;
    RectangleMemberBackGround: TRectangle;
    TextMemberTitle: TText;
    RectangleMemberBack: TRectangle;
    TextMemberBack: TText;
    ListBoxMember: TListBox;
    RectangleMemberSave: TRectangle;
    TextMemberSave: TText;
    UniQueryMember: TUniQuery;
    LayoutMember0: TLayout;
    RectangleMember1: TRectangle;
    TextMember1: TText;
    RectangleMember2: TRectangle;
    TextMember2: TText;
    RectangleMember3: TRectangle;
    TextMember3: TText;
    RectangleMember4: TRectangle;
    TextMember4: TText;
    RectangleMember5: TRectangle;
    TextMember5: TText;
    RectangleNew: TRectangle;
    TextNew: TText;
    ButtonTEST: TButton;
    ImageManage: TImage;
    TabItemManage: TTabItem;
    RectangleDetail: TRectangle;
    RectangleManage: TRectangle;
    TextManageTitle: TText;
    RectangleManageBackGround: TRectangle;
    LayoutManage2: TLayout;
    LayoutManage1: TLayout;
    RectangleManage1: TRectangle;
    TextManage1: TText;
    RectangleManageBack: TRectangle;
    TextManageBack: TText;
    RectangleMain1Alarm: TRectangle;
    MediaPlayer1: TMediaPlayer;
    FloatAnimation1: TFloatAnimation;
    RectangleMain2Alarm: TRectangle;
    FloatAnimation2: TFloatAnimation;
    RectangleMain3Alarm: TRectangle;
    FloatAnimation3: TFloatAnimation;
    MemoLog: TMemo;
    UniQueryLog: TUniQuery;
    LayoutManage3: TLayout;
    RectangleAlarm: TRectangle;
    TextAlarm: TText;
    ImageAlarm: TImage;
    RectangleDetailIn: TRectangle;
    ImageGraph: TImage;
    ImageDetailPower: TImage;
    RectangleDetailOut: TRectangle;
    ButtonTEST2: TButton;
    RectangleDetailTemp: TRectangle;
    TextDetailIn1: TText;
    TextDetailIn2: TText;
    TextDetailIn3: TText;
    TextDetailIn4: TText;
    TextDetailIn5: TText;
    TextDetailOut5: TText;
    TextDetailOut4: TText;
    TextDetailOut3: TText;
    TextDetailOut2: TText;
    TextDetailOut1: TText;
    UniQueryIOT: TUniQuery;
    ButtonDeviceDelete: TButton;
    UniQueryDelete: TUniQuery;
    TabItemGraph: TTabItem;
    RectangleMain1RTop: TRectangle;
    RectangleMain1RClient: TRectangle;
    RectangleMain2RTop: TRectangle;
    RectangleMain2RClient: TRectangle;
    RectangleMain3RTop: TRectangle;
    RectangleMain3RClient: TRectangle;
    RectangleGraphTitle: TRectangle;
    TextGraphTitle: TText;
    Chart1: TChart;
    Series1: TFastLineSeries;
    UniQueryGraph: TUniQuery;
    TextGraphDevice: TText;
    EditGraphModel: TEdit;
    RectangleGraphBackGround: TRectangle;
    LayoutGraph: TLayout;
    LayoutGraph1: TLayout;
    LayoutGraph2: TLayout;
    ButtonGraphWeek: TButton;
    ButtonGraphMonth: TButton;
    ButtonGraphSet: TButton;
    ButtonGraphSave: TButton;
    ButtonGraphCSV: TButton;
    TabItemGraph2: TTabItem;
    RectangleGraph2: TRectangle;
    Text4: TText;
    RectangleLandscapeSave: TRectangle;
    Text5: TText;
    RectangleLandscape: TRectangle;
    Text6: TText;
    ImageGraphDetail: TImage;
    RectangleGraphChange: TRectangle;
    TextGraphChange: TText;
    TabItemAlarm: TTabItem;
    RectangleAlarmTitle: TRectangle;
    TextAlarmTitle: TText;
    Image6: TImage;
    ImageAlarmDetail: TImage;
    Rectangle6: TRectangle;
    ListBox1: TListBox;
    UniQueryAlarm: TUniQuery;
    ImageWifi3: TImage;
    ImageWifi2: TImage;
    ImageWifi1: TImage;
    ImageWifi0: TImage;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    TextEditDetailIn1: TText;
    TextEditDetailIn2: TText;
    TextEditDetailIn3: TText;
    TextEditDetailIn4: TText;
    TextEditDetailIn5: TText;
    TextEditDetailOut1: TText;
    TextEditDetailOut2: TText;
    TextEditDetailOut3: TText;
    TextEditDetailOut4: TText;
    TextEditDetailOut5: TText;
    TextEditDetailName: TText;
    TextEditDetailTemp: TText;
    TextEditDetailSetTemp: TText;
    LayoutDetailHighLow: TLayout;
    RectangleDetailHigh: TRectangle;
    RectangleDetailLow: TRectangle;
    TextDetailHigh: TText;
    TextDetailLow: TText;
    EditDetailHigh: TEdit;
    EditDetailLow: TEdit;
    TextEditDetailHigh: TText;
    TextEditDetailLow: TText;
    TextDetailSetTempEdit: TEdit;
    UniQueryModel: TUniQuery;
    TabItemConnect2: TTabItem;
    RectangleConnectTitle: TRectangle;
    TextConnectTitle: TText;
    RectangleConnectBack: TRectangle;
    TextConnectBack: TText;
    RectangleConnectBackGroung: TRectangle;
    LayoutConnect1: TLayout;
    RectangleConnect1: TRectangle;
    TextConnect1: TText;
    LayoutConnect2: TLayout;
    LayoutWifiName: TLayout;
    TextWifiName: TText;
    EdtWifiID2: TEdit;
    Layout5: TLayout;
    TextPassWord: TText;
    EdtWifiPW2: TEdit;
    RectangleConnect2: TRectangle;
    TextConnect2: TText;
    LayoutConnect3: TLayout;
    RectangleConnect3: TRectangle;
    TextConnect3: TText;
    LayoutConnect4: TLayout;
    RectangleConnect4: TRectangle;
    TextConnect4: TText;
    TimerPlusOkPre: TTimer;
    ImageGraphSave: TImage;
    RectangleGraphExpand: TRectangle;
    LayoutGraphExpand: TLayout;
    ImageGraphPlus: TImage;
    ImageGraphMinus: TImage;
    TextGraphExpand: TText;
    Chart2: TChart;
    Image2: TImage;
    Series2: TFastLineSeries;
    LayoutGraph1Button: TLayout;
    LayoutGraph1DateTime: TLayout;
    DateEditGraph1: TDateEdit;
    DateEditGraph2: TDateEdit;
    TextGraphDateTime: TText;
    ButtonGraphDateTime: TButton;
    LayoutGraph2Expand: TLayout;
    RectangleGraph2Expand: TRectangle;
    ImageGraph2Plus: TImage;
    ImageGraph2Minus: TImage;
    TextGraph2Expand: TText;
    RectangleGraph2BackGround: TRectangle;
    TextMain1TempR: TText;
    TextMain2TempR: TText;
    TextMain3TempR: TText;
    TextMain1SetTempR: TText;
    TextMain2SetTempR: TText;
    TextMain3SetTempR: TText;
    RectanglePW: TRectangle;
    Rectangle2: TRectangle;
    TextPW1: TText;
    TextPW2: TText;
    EditPW2: TEdit;
    ButtonPW: TButton;
    ImageDetailAlarm: TImage;
    ImageAlarmOn: TImage;
    ImageAlarmOff: TImage;
    ImageAlarmO: TImage;
    ImageAlarmX: TImage;
    Image1: TImage;
    ShowShareSheetAction1: TShowShareSheetAction;
    UniQueryTempCheck2: TUniQuery;
    CheckBoxPassword: TCheckBox;
    ShowShareSheetAction2: TShowShareSheetAction;
    UniQueryDetailSearch: TUniQuery;
    RectangleModelDetail: TRectangle;
    TextModelDetail: TText;
    UniQueryDetailSearch2: TUniQuery;
    UniQueryGraphGetMark: TUniQuery;
    RectangleGraphSaveTime: TRectangle;
    TextSaveTime: TText;
    RectangleGraphSaveTimeTitle: TRectangle;
    TextGraphSaveTimeTitle: TText;
    TextGraphSaveTimeValue: TText;
    TimeEditGraph1: TTimeEdit;
    LayoutDateEditGraph1: TLayout;
    LayoutDateEditGraph2: TLayout;
    TimeEditGraph2: TTimeEdit;
    TimerConnectOK: TTimer;
    TextNote: TText;
    ImageJoinBackGround: TImage;
    TextNote2: TText;
    RectangleDefrost: TRectangle;
    TextDefrost: TText;
    NotificationCenter1: TNotificationCenter;
    ImageX: TImage;
    ImageX0: TImage;
    ImageX1: TImage;
    TimerFirstCheck: TTimer;
    TextServer: TText;
    TimerControllerAllSearch: TTimer;
    TimerGraphSearch: TTimer;
    TextNote3: TText;
    TextNote4: TText;
    TextNote5: TText;
    LayoutNote: TLayout;
    RectangleAlarmDelete: TRectangle;
    TextAlarmDelete: TText;
    TabItemQR: TTabItem;
    CameraComponent1: TCameraComponent;
    Layout4: TLayout;
    ToolBar1: TToolBar;
    btnMenu: TButton;
    lblScanStatus: TLabel;
    imgCamera: TImage;
    Memo_QR: TMemo;
    ToolBar3: TToolBar;
    btnStopCamera: TButton;
    btnStartCamera: TButton;
    Rectangle_QR_Title: TRectangle;
    Text_QR_Title: TText;
    Rectangle_QRBack: TRectangle;
    Text_QrBack: TText;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    LayoutConnect1_1: TLayout;
    Rectangle_QR: TRectangle;
    Text_QrSearch: TText;
    Rectangle_QRImage: TRectangle;
    Text_QRImage: TText;
    UniQuery_LoginA1: TUniQuery;
    UniQuery_LoginA2: TUniQuery;
    ScrollBox_WifiPW2: TScrollBox;
    ScrollBox_WifiID2: TScrollBox;
    UniQuery_SetCheck: TUniQuery;
    UniQueryUpdateAlarm: TUniQuery;
    LayoutManage4: TLayout;
    Rectangle1: TRectangle;
    Text_delay: TText;
    Rectangle_delay: TRectangle;
    Label_delay: TLabel;
    Edit_delay: TEdit;
    UniQuery_Delay: TUniQuery;
    procedure ButtonWifiNameClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure TimerSerialTimer(Sender: TObject);
    procedure TimerSerialCheckTimer(Sender: TObject);
    procedure TimerConnectionCloseTimer(Sender: TObject);
    procedure TimerWifiSendTimer(Sender: TObject);
    procedure TimerCTimer(Sender: TObject);
    procedure ButtonWifiSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonWifiSetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerLoadingOutTimer(Sender: TObject);
    ///////////// 컴포넌트 공통 이벤트 /////////////////
    procedure TextMouseLeave(Sender: TObject);
    procedure TextMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Login(Sender: TObject);
    procedure Join(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure MainRefresh;
    procedure MemberSearch;
    procedure MemberIDEditEnter(Sender: TObject);
    procedure MemberIDEditExit(Sender: TObject);
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
    procedure TimerPlusOkTimer(Sender: TObject);
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
    procedure TimerMouseDownTimer(Sender: TObject);
    procedure TextMemberClick(Sender: TObject);
    procedure TextNewClick(Sender: TObject);
    procedure TextMemberSaveClick(Sender: TObject);
    procedure Text1Click(Sender: TObject);
    procedure ButtonTESTClick(Sender: TObject);
    procedure TextManage1Click(Sender: TObject);
    procedure ImageManageClick(Sender: TObject);
    procedure TextManageBackClick(Sender: TObject);
    procedure TextMainClick(Sender: TObject);
    procedure ImageLoginClick(Sender: TObject);
    procedure TextAlarmClick(Sender: TObject);
    procedure EditDetailIn1Exit(Sender: TObject);
    procedure ButtonTEST2Click(Sender: TObject);
    procedure ImageDetailPowerClick(Sender: TObject);
    procedure ButtonDeviceDeleteClick(Sender: TObject);
    procedure ImageGraphClick(Sender: TObject);
    procedure ButtonGraphWeekClick(Sender: TObject);
    procedure ButtonGraphMonthClick(Sender: TObject);
    procedure ButtonGraphCSVClick(Sender: TObject);
    procedure ButtonGraphSaveClick(Sender: TObject);
    procedure Text6Click(Sender: TObject);
    procedure TextGraphChangeClick(Sender: TObject);
    procedure Text5Click(Sender: TObject);
    procedure ImageAlarmClick(Sender: TObject);
    procedure AlarmSearch;
    procedure Resize;
    procedure Chart1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure EditDetailHighExit(Sender: TObject);
    procedure TextDetailSetTempEditExit(Sender: TObject);
    procedure TextConnectTitleClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure TimerPlusOkPreTimer(Sender: TObject);
    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: string);
    procedure ImageGraphPlusClick(Sender: TObject);
    procedure ImageGraphMinusClick(Sender: TObject);
    procedure TextGraphExpandClick(Sender: TObject);
    procedure ButtonGraphSetClick(Sender: TObject);
    procedure ButtonGraphDateTimeClick(Sender: TObject);
    procedure Chart2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Series2GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: string);
    procedure ImageGraph2PlusClick(Sender: TObject);
    procedure ImageGraph2MinusClick(Sender: TObject);
    procedure TextGraph2ExpandClick(Sender: TObject);
    procedure ButtonPWClick(Sender: TObject);
    procedure DButtonALClick(Sender: TObject);
    procedure DButtonMemberDelClick(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ImageDetailAlarmClick(Sender: TObject);
    procedure TextDetailSetTempEditEnter(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure CheckBoxPasswordChange(Sender: TObject);
    procedure ShowShareSheetAction2BeforeExecute(Sender: TObject);
    procedure SaveTimeDisplay;
    procedure RectangleGraphSaveTimeClick(Sender: TObject);
    procedure TimerConnectOKTimer(Sender: TObject);
    procedure TextDefrostClick(Sender: TObject);
    procedure ImageXClick(Sender: TObject);
    procedure TimerFirstCheckTimer(Sender: TObject);
    procedure TimerControllerAllSearchTimer(Sender: TObject);
    procedure TimerGraphSearchTimer(Sender: TObject);
    procedure TextAlarmDeleteClick(Sender: TObject);
    procedure btnStartCameraClick(Sender: TObject);
    procedure btnStopCameraClick(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure Text_QrSearchClick(Sender: TObject);
    procedure Text_QRImageClick(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure Text_delayClick(Sender: TObject);
    procedure Text_delayInputMouseEnter(Sender: TObject);
    procedure Edit_delayExit(Sender: TObject);

  private
    { Private declarations }
    FPermissionReadMediaImage,
    FPermissionReadExternalStorage,
    FPermissionWriteExternalStorage: string;

    FDeviceId: string;
    FDeviceToken: string;
    FirstCheck : Boolean;
    FLastDistance : integer;
    FirstDown : Boolean;
    ThreadNumber : Integer;
      //QR스캔 함수
    FScanInProgress: Boolean;
    frameTake: Integer;
    {$IFDEF ANDROID}
    FScanManager: TScanManager;
    procedure OnReceiveNotificationEvent(Sender: TObject; const ServiceNotification: TPushServiceNotification);
    procedure OnServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
    procedure SetNotification(const aTitle, aMessage: string);

    procedure ProcessGalleryResult( Data: JIntent);
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
    function TJavaInputStreamToStream(AInputStream: JInputStream): TStream;
//    procedure ReceiveNotification(Sender: TObject; const ANotification: TPushServiceNotification);
    {$ENDIF ANDROID}
     procedure StartScanning;    //이미지 qr 찾기
     function VclToFmxColor(const VclColor: Integer): TAlphaColor;
     // 경보지연

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
    //QR
    procedure GetImage();
    function AppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
    // Wi-Fi 정보 추출 함수
    function ExtractWiFiInfo(const QRText, Key: string): string;
  end;

  const
  PICK_IMAGE_REQUEST_CODE = 1001;// qr 갤러리 관련
  OneSec = 1/86400; // TDateTime에서 1초

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
    ControllerID : array[1..3] of Integer;
    ControllerState : array[1..3] of Boolean;
    ControllerHighTemp : array[1..3] of Double;
    ControllerLowTemp : array[1..3] of Double;
    SetTemp : array[1..3] of Double;
    DefrostMode : array[1..3] of Boolean;
    DefrostState : array[1..3] of Boolean;
    DIn, DOut : array[1..3] of array[1..5] of Boolean;
    DetailSetTemp : Double;
    DetailControllerID : Integer;
    MemberCount : Integer;
    MemberID : array[0..1000] of Integer;
    MemberEnterID : String;

    Alarm : Integer;
    DetailAlarm : array[1..3] of Boolean;
    AlarmDelButton : TButton;

    DetailSetTempStr : String;

    GraphStart, GraphEnd : String;

    PreIndex11, PreIndex12, PreIndex13, PreIndex14, PreIndex15,
    PreIndex21, PreIndex22, PreIndex23, PreIndex24, PreIndex25,
    PreIndex31, PreIndex32, PreIndex33, PreIndex34, PreIndex35 : Integer;

    PreMain1InCount, PreMain1OutCount : Integer;
    PreMain2InCount, PreMain2OutCount : Integer;
    PreMain3InCount, PreMain3OutCount : Integer;

    MainSetChangeState : Boolean;

  TitleSize, TempSize, TempSetSize, MiddleSize, LowSize, MostLowSize : Integer;
  TempSizePercent : Double;

  GraphDetailSerialNo : String;
  GraphDateAvg1, GraphDateAvg2 : Double;
  GraphTempAvg : Double;
  ChartMinDate, ChartMaxDate : TDateTime;
  Current : Integer;
  Expand, Expand2 : Integer;
  Delay : integer;

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
  pushToken : string;

  // 설정온도 상하한
  hightemp2, Lowtemp2 : Double;
  //
  PTop, Pbot : Single;

implementation

{$R *.fmx}

uses
  System.IniFiles,  // Ini File
  System.IOUtils,   // Path
  System.Permissions,

{$IFDEF ANDROID}
//  Androidapi.JNI.GraphicsContentViewText,
//  Androidapi.JNI.Net,
//  Androidapi.JNI.JavaTypes,
//  Androidapi.Helpers,
//  Androidapi.JNIBridge,
//  Androidapi.JNI.Os,
//  Androidapi.JNI.Provider,
//  Androidapi.JNI.App,
//   FMX.Helpers.Android,
// Androidapi.JNI.Java.Security,
//  Androidapi.JNI.Java.Net,
//   Androidapi.JNI.Util,
{$ENDIF}
  FMX.DialogService;


procedure TfDongHwa.ActionNextExecute(Sender: TObject);
begin
  ImageMainNextClick(ImageMainNext);
end;

procedure TfDongHwa.ActionPriorExecute(Sender: TObject);
begin
  ImageMainPriorClick(ImageMainPrior);
end;

procedure TfDongHwa.AlarmSearch;
var
  DText, DText2 : TText;
  DRectangle : TRectangle;
  DButton : TButton;
  i : integer;
begin
  try
    with UniQueryAlarm do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Alarm as A');
      SQL.Add('Inner Join ControllerInfo as C');
      SQL.Add('On A.ControllerID = C.ControllerID');
      SQL.Add('Where C.MasterID = '+MasterUserID.ToString);
      SQL.Add('and A.ControllerID > 0');
      SQL.Add('and A.Dcheck = ''N'' ');     //250911 김동휘 추가
      SQL.Add('Order by A.StartTime desc');
      Open;
    end;
    ListBox1.Clear;
    for i := 0 to UniQueryAlarm.RecordCount - 1 do
    begin
      ListBox1.Items.Add('');
      ListBox1.ListItems[i].Height := ListBox1.Height / 8;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleAL1'+inttostr(i);
      DRectangle.Fill.Color := $FFD9D9D9;
      DRectangle.Parent := ListBox1.ListItems[i];
      DRectangle.Align := TAlignLayout.Client;
      DRectangle.HitTest := False;
      DRectangle.Opacity := 0.8;

      DButton := TButton.Create(Self);
      DButton.Name := 'DButtonAL'+inttostr(i);
      DButton.StyleLookup := 'trashtoolbutton';
      DButton.Parent := DRectangle;
      DButton.Align := TAlignLayout.MostRight;
      DButton.Width := DButton.Height;
      DButton.Tag := UniQueryAlarm.FieldByName('No').AsInteger;
      // 250918 김동휘 값 먼저 비교하게 수정
      if UniQueryAlarm.FieldByName('EndTime').AsString  <> '' then
      begin
        DButton.Hint := FormatDateTime('yyyy-mm-dd tt hh:nn:ss',  UniQueryAlarm.FieldByName('EndTime').AsDateTime);
        DButton.OnClick := DButtonALClick;
      end;
      DButton.Visible := False;

      DText := TText.Create(Self);
      DText.Name := 'DTextAL1'+inttostr(i);
  //    DText.Parent := ListBox1.ListItems[i];
      DText.Parent := DRectangle;
      DText.Text := UniQueryAlarm.FieldByName('ControllerName').AsString;
      DText.TextSettings.Font.Size := MiddleSize;
      DText.TextSettings.HorzAlign := TTextAlign.Leading;
      DText.Align := TAlignLayout.Top;
      DText.Height := ListBox1.Height / 16;
      DText.HitTest := False;

      DText2 := TText.Create(Self);
      DText2.Name := 'DTextAL2'+inttostr(i);
      DText2.Parent := DText;
      DText2.Text := FormatDateTime('yy-mm-dd hh:nn',  UniQueryAlarm.FieldByName('StartTime').AsDateTime);
      DText2.TextSettings.Font.Size := LowSize;
      DText2.TextSettings.HorzAlign := TTextAlign.Trailing;
      DText2.Align := TAlignLayout.Client;
      DText2.HitTest := False;

      DText := TText.Create(Self);
      DText.Name := 'DTextAL3'+inttostr(i);
  //    DText.Parent := ListBox1.ListItems[i];
      DText.Parent := DRectangle;
      DText.Text := UniQueryAlarm.FieldByName('ErrCode').AsString;
      DText.TextSettings.FontColor := $FFFF0000;  // Red
      DText.TextSettings.Font.Size := MiddleSize;
      DText.TextSettings.HorzAlign := TTextAlign.Leading;
      DText.Align := TAlignLayout.Client;
      DText.HitTest := False;

      DText2 := TText.Create(Self);
      DText2.Name := 'DTextAL4'+inttostr(i);
      DText2.Parent := DText;

      if UniQueryAlarm.FieldByName('EndTime').AsString  ='' then
        DText2.Text := '~ '
      else
      DText2.Text := '~ ' +(FormatDateTime('yy-mm-dd hh:nn',  UniQueryAlarm.FieldByName('EndTime').AsDateTime));

      DText2.TextSettings.Font.Size := LowSize;
      DText2.TextSettings.HorzAlign := TTextAlign.Trailing;
      DText2.Align := TAlignLayout.Client;
      DText2.HitTest := False;

      UniQueryAlarm.Next;
    end;
    AlarmDelButton := DButton;
    if UniQueryAlarm.RecordCount * (ListBox1.Height / 8) < ListBox1.Height then
    begin
      ListBox1.Items.Add('');
      ListBox1.ListItems[UniQueryAlarm.RecordCount].Height := ListBox1.Height - (UniQueryAlarm.RecordCount * (ListBox1.Height / 8));

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleAL00'+inttostr(i);
      DRectangle.Fill.Color := $FFD9D9D9;
      DRectangle.Parent := ListBox1.ListItems[UniQueryAlarm.RecordCount];
      DRectangle.Align := TAlignLayout.Client;
      DRectangle.HitTest := False;
      DRectangle.Opacity := 0.8;

      DButton := TButton.Create(Self);
      DButton.Name := 'DButtonAL'+inttostr(i);
      DButton.Parent := DRectangle;
      DButton.Align := TAlignLayout.MostRight;
      DButton.Width := 1;
      DButton.Visible := False;
    end;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.BackClick(Sender: TObject);
begin
  try
    if TabControl1.ActiveTab = TabItemJoin then
    begin
      TabControl1.ActiveTab := TabItemLogin;
    end
    else if (TabControl1.ActiveTab = TabItemConnect)
              or (TabControl1.ActiveTab = TabItemMember)
              or (TabControl1.ActiveTab = TabItemConnect2) then
    begin
      TabControl1.ActiveTab := TabItemManage;
    end
    else if (TabControl1.ActiveTab = TabItemDetail)
              or (TabControl1.ActiveTab = TabItemAlarm) then
    begin
      TabControl1.ActiveTab := TabItemMain;
    end
    else if (TabControl1.ActiveTab = TabItemManage) then
    begin
      if  strtoint(Edit_delay.Text) <> delay  then
      begin
        TRY
          with UniQuery_Delay do
          begin
            close;
            sql.Clear;
            sql.Add(SQLInsert.Text);
            ParamByName('D').AsInteger  := strtoint(Edit_delay.Text);
            ParamByName('ID').AsInteger := MasterUserID;
            ExecSQL;
          end;
        EXCEPT
          on E: Exception  do
          begin
            ShowMessage('지연시간저장에 실패했습니다.'+#13#10+'다시 시도해주세요.');
            EXIT;
          end;
        END;
        Delay := strtoint(Edit_delay.Text);
      end;
      TabControl1.ActiveTab := TabItemMain;
    end
    else if (TabControl1.ActiveTab = TabItemGraph) then
    begin
      TabControl1.ActiveTab := TabItemDetail;
    end
    else if TabControl1.ActiveTab = TabItemQR then
    begin
      CameraComponent1.Active := False;
      imgCamera.Bitmap := nil;
      TabControl1.ActiveTab := TabItemConnect2;

    end
    else
    begin
       MessageDlg('종료하시겠습니까?'
        , System.UITypes.TMsgDlgType.mtInformation,
       [
         System.UITypes.TMsgDlgBtn.mbYes,
         System.UITypes.TMsgDlgBtn.mbNo
       ], 0,
       procedure (const AResult: TModalResult)
       begin
         if AResult = mrYes then
         begin
           Close;
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

procedure TfDongHwa.BtnConnectClick(Sender: TObject);
const
  PermissionAccessFineLocation = 'android.permission.ACCESS_FINE_LOCATION';
var
{$IFDEF ANDROID}
  WifiManager: JWifiManager;
  WifiInfo: JWifiInfo;
{$ENDIF}
  WifiID : String;
  I: Integer;
  ModelCheck : Boolean;
begin
  try
    try
      WifiID := '';
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
      end;
    {$ENDIF}
      ModelCheck := False;
      Memo1.Lines.Add('');
      Memo1.Lines.Add('연결된 Wifi 정보 : ' + WifiID);
      Memo1.Lines.Add('');
               {
      for i := 0 to ModelCount - 1 do
      begin
        if Pos(ModelStr[i],WifiID) > 0 then
        begin
          ModelCheck := True;
          Break;
        end;
      end;     }

      if Pos('DongHwaAP',WifiID) > 0 then
    //  if ModelCheck then
      begin

        try
          // ... create TIdTCPClient
          idTCPClient                 := TIdTCPClient.Create();

          // ... set properties
          idTCPClient.Host            := '192.168.4.1';
          idTCPClient.Port            := 1480;
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

        try
          UniConnection1.Connected := False;
          IdTCPClient.Connect;
          TimerSerial.Enabled := True;
          TWaitDialog.Show('디바이스 '+#13+'설정 중 입니다.');
          TimerLoadingOut.Enabled := True;
        except
            on E: Exception do begin
                Memo1.Lines.Add('CONNECTION ERROR! ' + E.Message);
                TimerConnectionClose.Enabled := True;
                showmessage('디바이스 설정모드 해제 후, 다시 진행해 주세요');
            end;
        end;
      end else
      begin
        Memo1.Lines.Add('온도컨트롤러에 연결되어있지 않습니다.');
        Memo1.Lines.Add('');
        Memo1.Lines.Add('와이파이 설정화면으로 이동하여, ');
        Memo1.Lines.Add('디바이스 모델명으로 된 와이파이에 연결해주세요');
        Memo1.Lines.Add('온도컨트롤러의 암호는 12345678 입니다');
        Memo1.Lines.Add('');
        Memo1.Lines.Add('연결후, 앱으로 돌아와 ');
        Memo1.Lines.Add('Wifi Info Send 버튼을 다시 눌러주세요');
      end;
    except on e:exception do
      begin
        Showmessage(e.Message);
      end;
    end;
  finally
    MainRefresh;
    RectangleDetailChange.Enabled := true;
    TextDetailChange.Enabled := true;
  end;
end;

procedure TfDongHwa.btnStartCameraClick(Sender: TObject);
begin
  if CameraComponent1.Active = False then
  begin
    CameraComponent1.Active := False;
    CameraComponent1.Kind := FMX.Media.TCameraKind.BackCamera;
    CameraComponent1.Active := True;

    lblScanStatus.Text := '';
    memo1.Lines.Clear;
  end;
end;

procedure TfDongHwa.btnStopCameraClick(Sender: TObject);
begin
  if btnStopCamera.Text ='중지' then
  begin
    CameraComponent1.Active := False;
    btnStopCamera.Text :='실행';
  end
  else if btnStopCamera.Text = '실행' then
  begin
      CameraComponent1.Active := False;
      CameraComponent1.Kind := FMX.Media.TCameraKind.BackCamera;
      CameraComponent1.Active := True;

      lblScanStatus.Text := '';
      memo1.Lines.Clear;
      btnStopCamera.Text :='중지';
  end;

end;

procedure TfDongHwa.ButtonTEST2Click(Sender: TObject);
var
  sCommand : AnsiString;
begin
  sCommand := AnsiChar(#$04)+AnsiChar(#$20)+AnsiChar(#$01)+AnsiChar(#$00)+AnsiChar(#$C8)+AnsiChar(#$03);
  Memo1.Lines.Add('BCC Calc :'+IntToHex(BccCalculator(sCommand,1),2));

  sCommand :=  AnsiChar(#$04) + AnsiChar(#$20) + AnsiChar(#$01) + AnsiChar(#$00) + AnsiChar(#$C8) + AnsiChar(#$03); // 온도변경
  sCommand := AnsiChar(#$02) + sCommand + Chr(BccCalculator(sCommand,1));
end;

procedure TfDongHwa.ButtonDeviceDeleteClick(Sender: TObject);
begin
  EditPW2.Text := '';
  TextPW1.Text := '단말기 등록 삭제';
  TextPW2.Text := '비밀번호를 입력하세요';
  RectanglePW.Height := 100 + EditPW2.Height;
  RectanglePW.Margins.Bottom := 500;
  RectanglePW.Visible := True;
  EditPW2.SetFocus;
end;

procedure TfDongHwa.ButtonWifiSaveClick(Sender: TObject);
var
  sPath : String;
  iFile : TIniFile;
begin
  sPath := TPath.Combine(TPath.GetDocumentsPath, 'Env.ini');
  iFile := TIniFile.Create(sPath);
  try
//    iFile.WriteString('Wifi' ,'ID', EdtWifiID.Text);
//    iFile.WriteString('Wifi', 'PW', EdtWifiPW.Text);
    iFile.WriteString('Wifi' ,'ID', EdtWifiID2.Text);
    iFile.WriteString('Wifi', 'PW', EdtWifiPW2.Text);
    iFile.WriteString('Alarm', 'G', Alarm.ToString);
  finally
    iFile.DisposeOf;
  end;
    Showmessage('저장되었습니다');
end;

procedure TfDongHwa.ButtonGraphCSVClick(Sender: TObject);
var
//  Stream: TFileStream;
  i: Integer;
  OutLine, OutLine2: string;
  sTemp: string;                     // TextGraphDevice
  DetailSerialNo : String;

  {$IFDEF ANDROID}
     Intent: JIntent;
     FileUri: Jnet_Uri;
     ListArqs: JArrayList;
      FileStream: TFileStream;
        PermissionArray: TJavaObjectArray<JString>;
        FileContent: string;
        URI: Jnet_Uri;
  {$ENDIF ANDROID}

  FileName : String;
  SendText : String;

  strList :TStringList;
  aRow :Integer;
begin
//  try
//    with UniQueryGraph do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('select * from ControllerInfo');
//      SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
//      Open;
//      DetailSerialNo := Trim(FieldByName('SerialNo').AsString);
//                              {
//      Close;
//      SQL.Clear;
//      SQL.Add('select Format(CheckDate,''yyyy-MM-dd HH:mm:ss'') as CheckDate, Temp from TempCheck');
//      SQL.Add('Where SerialNo = '+#39+DetailSerialNo+#39);
//      SQL.Add('And CheckDate >= '+#39+GraphStart+#39);
//      SQL.Add('And CheckDate <= '+#39+GraphEnd+#39);
//      Open;                   }
//
//        Close;
//        SQL.Clear;
//        SQL.Add('select Format(CheckDate,''yyyy-MM-dd HH:mm:ss'') as CheckDate, Temp,');
//        SQL.Add('T.DOut1, T.DOut2, T.DOut3, T.DOut4, T.DOut5, M.OutCount, T.DefrostMode, T.DefrostState,');
//        SQL.Add('( CASE WHEN ISNULL(C.Out1,'''') = '''' THEN M.K1Name ELSE C.Out1 END ) as K1,');
//        SQL.Add('( CASE WHEN ISNULL(C.Out2,'''') = '''' THEN M.K2Name ELSE C.Out2 END ) as K2,');
//        SQL.Add('( CASE WHEN ISNULL(C.Out3,'''') = '''' THEN M.K3Name ELSE C.Out3 END ) as K3,');
//        SQL.Add('( CASE WHEN ISNULL(C.Out4,'''') = '''' THEN M.K4Name ELSE C.Out4 END ) as K4,');
//        SQL.Add('( CASE WHEN ISNULL(C.Out5,'''') = '''' THEN M.K5Name ELSE C.Out5 END ) as K5  from TempCheck as T');
//        SQL.Add('Left Outer Join ControllerInfo as C');
//        SQL.Add('On T.SerialNo = C.SerialNo');
//        SQL.Add('Left Outer Join Model as M');
//        SQL.Add('On C.ModelCODE = M.Code');
//      SQL.Add('Where T.SerialNo = '+#39+DetailSerialNo+#39);
//      SQL.Add('And CheckDate >= '+#39+GraphStart+#39);
//      SQL.Add('And CheckDate <= '+#39+GraphEnd+#39);
//        Open;
//    end;
//
//  //  Stream := TFileStream.Create(TPath.GetDownloadsPath+'/'
//  //                  +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
//  //                                    +'_'+Copy(GraphEnd,1,10)+'.csv', fmCreate);
//
//  //  Stream := TFileStream.Create(TPath.GetDocumentsPath+'/'
//  //                    +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
//  //                                    +'_'+Copy(GraphEnd,1,10)+'.csv', fmCreate);
//
//    strList:=TStringList.Create;
//    try
//      SendText := '';
//      UniQueryGraph.First;
//      strList.Add('일시,현재값,출력상태');
//  //      OutLine := '일시,현재값,출력상태';
//  //      oString := UTF8String(OutLine);
//  //      SetLength(OutLine, Length(OutLine) - 1);
//  //      Stream.Write(OutLine[1], Length(OutLine) * SizeOf(Char));
//  //      SetLength(oString, Length(oString) - 1);
//  //      Stream.Write(oString[1], Length(oString) * SizeOf(Char));
//  //      Stream.WriteBuffer(PAnsiChar(oString)^, Length(oString));
//  //      Stream.Write(sLineBreak, Length(sLineBreak));
//      while not UniQueryGraph.Eof do
//      begin
//        SendText := SendText + #13#10 + OutLine2;
//  //      OutLine := '';
//        OutLine2 := '';
//                                                       {
//        for i := 0 to UniQueryGraph.FieldCount - 1 do
//        begin
//          sTemp := UniQueryGraph.Fields[i].AsString;
//          OutLine := OutLine + sTemp + ',';
//        end;                                           }
//
//  //      OutLine := UniQueryGraph.FieldByName('CheckDate').AsString;
//  //      OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('Temp').AsString;
//        OutLine := UniQueryGraph.FieldByName('CheckDate').AsString + ',';
//        OutLine := OutLine + UniQueryGraph.FieldByName('Temp').AsString + '°C,';
//        OutLine2 := UniQueryGraph.FieldByName('CheckDate').AsString + '    ,';
//        OutLine2 := OutLine2 + UniQueryGraph.FieldByName('Temp').AsString + '°C    ,';
//
//제상버튼추가
//        if ( (TextDetailModel.Text = 'WT2023C')
//          or (TextDetailModel.Text = 'W1120DC2S')
//          or (TextDetailModel.Text = 'WK2023C')
//          or (TextDetailModel.Text = 'WK2023AC')
//          or (TextDetailModel.Text = 'WT2023AC')
//          or (TextDetailModel.Text = 'W2023AC')
//          or (TextDetailModel.Text = 'BW7023-S') )
//          And (UniQueryGraph.FieldByName('DefrostState').AsBoolean) then
//        begin
//          if UniQueryGraph.FieldByName('DefrostMode').AsBoolean then
//          begin
//            OutLine := OutLine + '수동제상,' ;
//            OutLine2 := OutLine2 + '수동제상    ,' ;
//          end else
//          begin
//            OutLine := OutLine + '제상,' ;
//            OutLine2 := OutLine2 + '제상    ,' ;
//          end;
//        end else
//        begin
//          if (UniQueryGraph.FieldByName('DOut1').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 0) then
//          begin
//    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K1').AsString;
//            OutLine := OutLine + UniQueryGraph.FieldByName('K1').AsString + ',' ;
//            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K1').AsString + '    ,' ;
//          end;
//          if (UniQueryGraph.FieldByName('DOut2').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 1) then
//          begin
//    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K2').AsString;
//            OutLine := OutLine + UniQueryGraph.FieldByName('K2').AsString + ',' ;
//            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K2').AsString + '    ,' ;
//          end;
//          if (UniQueryGraph.FieldByName('DOut3').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 2) then
//          begin
//    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K3').AsString;
//            OutLine := OutLine + UniQueryGraph.FieldByName('K3').AsString + ',' ;
//            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K3').AsString + '    ,' ;
//          end;
//          if (UniQueryGraph.FieldByName('DOut4').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 3) then
//          begin
//    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K4').AsString;
//            OutLine := OutLine + UniQueryGraph.FieldByName('K4').AsString + ',' ;
//            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K4').AsString + '    ,' ;
//          end;
//          if (UniQueryGraph.FieldByName('DOut5').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 4) then
//          begin
//    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K5').AsString;
//            OutLine := OutLine + UniQueryGraph.FieldByName('K5').AsString + ',' ;
//            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K5').AsString + '    ,' ;
//          end;
//        end;
//
//  //      oString := UTF8String(OutLine);
//  //      SetLength(OutLine, Length(OutLine) - 1);
//  //      Stream.Write(OutLine[1], Length(OutLine) * SizeOf(Char));
//  //      SetLength(oString, Length(oString) - 1);
//  //      Stream.Write(oString[1], Length(oString) * SizeOf(Char));
//  //      Stream.WriteBuffer(PAnsiChar(oString)^, Length(oString));
//  //      Stream.Write(sLineBreak, Length(sLineBreak));
//
//        strList.Add(OutLine);
//        UniQueryGraph.Next;
//      end;
//
//      strList.SaveToFile(TPath.GetDownloadsPath+'/'
//             +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
//                              +'_'+Copy(GraphEnd,1,10)+'.csv');
//    finally
//  //    Stream.Free;
//       strList.Free;
//    end;
//
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
//
//  //      FileName := TPath.GetDocumentsPath+'/'
//  //                    +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
//  //                                    +'_'+Copy(GraphEnd,1,10)+'.csv';
//  //
//  //      ListArqs := TJArrayList.Create;
//  //      FileUri := TJNet_Uri.JavaClass.fromFile(TJFile.JavaClass.init(StringToJString(FileName)));
//  //      ListArqs.Add(0, FileUri);
//  //      try
//  //         Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
//  //         Intent.setType(StringToJString('*/*'));
//  //         Intent.putParcelableArrayListExtra(TJIntent.JavaClass.EXTRA_STREAM, ListArqs);
//  //         Intent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
//  //         SharedActivity.startActivity(TJIntent.JavaClass.createChooser(Intent, StrToJCharSequence('')));
//  //      except
//  //         on E: Exception do
//  //            ShowMessage(E.Message);
//  //      end;
//
//    {$ENDIF ANDROID}
//  //  Showmessage(TPath.GetDownloadsPath+'/'
//  //                  +EditGraphModel.Text+'_'+Copy(GraphStart,1,10)
//  //                                    +'_'+Copy(GraphEnd,1,10)+'.csv');
//  except on e:exception do
//    begin
//      Showmessage(e.Message);
//    end;
//  end;

  {$IFDEF ANDROID}
  // 권한요청
  if TOSVersion.Check(6, 0) then // Android 6.0 이상
  begin
    if SharedActivity.checkSelfPermission(StringToJString('android.permission.WRITE_EXTERNAL_STORAGE')) <>
      TJPackageManager.JavaClass.PERMISSION_GRANTED then  //권한 확인
    begin
      // 권한 배열을 생성
      PermissionArray := TJavaObjectArray<JString>.Create(1);
      PermissionArray.Items[0] := StringToJString('android.permission.WRITE_EXTERNAL_STORAGE');
      // 권한 요청
      SharedActivity.requestPermissions(PermissionArray, 0);
    end;
  end;
  {$ENDIF ANDROID}

  try
    with UniQueryGraph do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ControllerInfo');
      SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
      Open;
      DetailSerialNo := Trim(FieldByName('SerialNo').AsString);

      Close;
      SQL.Clear;
      SQL.Add('select Format(CheckDate,''yyyy-MM-dd HH:mm:ss'') as CheckDate, Temp,');
      SQL.Add('T.DOut1, T.DOut2, T.DOut3, T.DOut4, T.DOut5, M.OutCount, T.DefrostMode, T.DefrostState,');
      SQL.Add('( CASE WHEN ISNULL(C.Out1,'''') = '''' THEN M.K1Name ELSE C.Out1 END ) as K1,');
      SQL.Add('( CASE WHEN ISNULL(C.Out2,'''') = '''' THEN M.K2Name ELSE C.Out2 END ) as K2,');
      SQL.Add('( CASE WHEN ISNULL(C.Out3,'''') = '''' THEN M.K3Name ELSE C.Out3 END ) as K3,');
      SQL.Add('( CASE WHEN ISNULL(C.Out4,'''') = '''' THEN M.K4Name ELSE C.Out4 END ) as K4,');
      SQL.Add('( CASE WHEN ISNULL(C.Out5,'''') = '''' THEN M.K5Name ELSE C.Out5 END ) as K5  from TempCheck as T');
      SQL.Add('Left Outer Join ControllerInfo as C');
      SQL.Add('On T.SerialNo = C.SerialNo');
      SQL.Add('Left Outer Join Model as M');
      SQL.Add('On C.ModelCODE = M.Code');
      SQL.Add('Where T.SerialNo = '+#39+DetailSerialNo+#39);
      SQL.Add('And CheckDate >= '+#39+GraphStart+#39);
      SQL.Add('And CheckDate <= '+#39+GraphEnd+#39);
      SQL.Add('Order by  CheckDate ');
      Open;
    end;

    strList:=TStringList.Create;
    try
      SendText := EditGraphModel.Text+', '+TextGraphDevice.Text;
      UniQueryGraph.First;
      strList.Add(EditGraphModel.Text+', '+TextGraphDevice.Text);
      strList.Add('일시,현재값,출력상태');

      while not UniQueryGraph.Eof do
      begin
        SendText := SendText + #13#10 + OutLine2;
        OutLine2 := '';
        OutLine := UniQueryGraph.FieldByName('CheckDate').AsString + ',';
        OutLine := OutLine + UniQueryGraph.FieldByName('Temp').AsString + '°C,';
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
          And (UniQueryGraph.FieldByName('DefrostState').AsBoolean) then
        begin
          if UniQueryGraph.FieldByName('DefrostMode').AsBoolean then
          begin
            OutLine := OutLine + '수동제상,' ;
            OutLine2 := OutLine2 + '수동제상    ,' ;
          end else
          begin
            OutLine := OutLine + '제상,' ;
            OutLine2 := OutLine2 + '제상    ,' ;
          end;
        end else
        begin
          if (UniQueryGraph.FieldByName('DOut1').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 0) then
          begin
    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K1').AsString;
            OutLine := OutLine + UniQueryGraph.FieldByName('K1').AsString + ',' ;
            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K1').AsString + '    ,' ;
          end;
          if (UniQueryGraph.FieldByName('DOut2').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 1) then
          begin
    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K2').AsString;
            OutLine := OutLine + UniQueryGraph.FieldByName('K2').AsString + ',' ;
            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K2').AsString + '    ,' ;
          end;
          if (UniQueryGraph.FieldByName('DOut3').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 2) then
          begin
    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K3').AsString;
            OutLine := OutLine + UniQueryGraph.FieldByName('K3').AsString + ',' ;
            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K3').AsString + '    ,' ;
          end;
          if (UniQueryGraph.FieldByName('DOut4').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 3) then
          begin
    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K4').AsString;
            OutLine := OutLine + UniQueryGraph.FieldByName('K4').AsString + ',' ;
            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K4').AsString + '    ,' ;
          end;
          if (UniQueryGraph.FieldByName('DOut5').AsBoolean) and (UniQueryGraph.FieldByName('OutCount').AsInteger > 4) then
          begin
    //        OutLine := OutLine + '    ,' +  UniQueryGraph.FieldByName('K5').AsString;
            OutLine := OutLine + UniQueryGraph.FieldByName('K5').AsString + ',' ;
            OutLine2 := OutLine2 + UniQueryGraph.FieldByName('K5').AsString + '    ,' ;
          end;
        end;

        strList.Add(OutLine);
        UniQueryGraph.Next;
      end;
      // 다운로드폴더 저장   TPath.GetSharedDownloadsPath      TPath.GetCachePath
      FileName := TPath.Combine( TPath.GetSharedDownloadsPath, EditGraphModel.Text+', '+TextGraphDevice.Text+'_'+Copy(GraphStart,1,10)  +'_'+Copy(GraphEnd,1,10)+'.csv');
      strList.SaveToFile(FileName, TEncoding.UTF8);
     // ShowMessage(FileName);
    finally
      strList.Free;
    end;
    {$IFDEF ANDROID}
    try
       // 인텐트 생성
  //        Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  //        Intent.setType(StringToJString('text/csv'));
  //        // 파일의 URI 생성
  //        URI := TAndroidHelper.JFileToJURI(TJFile.JavaClass.init(StringToJString(FileName)));
  //        // 인텐트에 파일 URI를 첨부
  //        Intent.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap((URI as ILocalObject).GetObjectID));
  //        // 공유 인텐트 실행
  //        TAndroidHelper.Activity.startActivity(TJIntent.JavaClass.createChooser(Intent, StrToJCharSequence('CSV 파일 공유')));
        // 인텐트 생성
        Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
        Intent.setType(StringToJString('application/octet-stream')); // MIME 타입을 일반적 파일 형식으로 변경
        // 파일의 URI 생성
        URI := TAndroidHelper.JFileToJURI(TJFile.JavaClass.init(StringToJString(FileName)));
        // 인텐트에 파일 URI를 첨부
        Intent.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap((URI as ILocalObject).GetObjectID));
        // 공유 인텐트 실행
        TAndroidHelper.Activity.startActivity(TJIntent.JavaClass.createChooser(Intent, StrToJCharSequence('카카오톡으로 CSV 파일 공유')));

//        // 파일 삭제는 사용자에게 파일이 공유된 후에 지우기 위해 잠시 지연
//        TThread.CreateAnonymousThread(
//          procedure
//          begin
//            // 약간의 지연 후 삭제 (예: 5초)
//            Sleep(10000);
//            TFile.Delete(FileName);
//          end
//        ).Start;
  //      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  //      Intent.setType(StringToJString('text/pas'));
  //      Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(SendText));
  //      Intent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
  //      SharedActivity.startActivity(TJIntent.JavaClass.createChooser(Intent, StrToJCharSequence('')));

      except on E: Exception do
        ShowMessage(E.Message);
      end;
   {$ENDIF ANDROID}
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure TfDongHwa.ButtonGraphDateTimeClick(Sender: TObject);
begin
  LayoutGraph1Button.Visible := True;
  LayoutGraph1DateTime.Visible := False;
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
begin
  {$IFDEF ANDROID}
  try
    try
    //    Image1.Bitmap := Chart1.TeeCreateBitmap;
    //    Image1.Visible := True;
      Chart1.Title.Text.Add(EditGraphModel.Text+', '+TextGraphDevice.Text);// := EditGraphModel.Text;

      PermissionsService.RequestPermissions([FPermissionReadExternalStorage],
      procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
      begin
      end);
      PermissionsService.RequestPermissions([FPermissionWriteExternalStorage],
      procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
      begin
      end);

  //    if (PermissionsService.IsPermissionGranted(FPermissionReadExternalStorage))
  //     and (PermissionsService.IsPermissionGranted(FPermissionWriteExternalStorage)) then
      begin

        Chart1.SaveToBitmapFile(TPath.GetPicturesPath+'/'
                      +EditGraphModel.Text+', '+TextGraphDevice.Text+'_'+Copy(GraphStart,1,10)
                                        +'_'+Copy(GraphEnd,1,10)+'.jpeg');

        ShowShareSheetAction1.Execute;

               {
        FileName := TPath.GetPicturesPath+'/'
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
           begin
              ShowMessage(E.Message);
              Memo2.Lines.Add(E.Message);
           end;
        end;
                }
      end;

    except on e:exception do
      begin
        Showmessage(e.Message);
      end;
    end;
  finally
    Chart1.Title.Text.Clear;
  end;
  {$ENDIF ANDROID}
end;

procedure TfDongHwa.ButtonGraphSetClick(Sender: TObject);
begin
  LayoutGraph1Button.Visible := False;
  LayoutGraph1DateTime.Visible := True;
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
        // 경보알람
        UniQueryDelete.Close;
        UniQueryDelete.SQL.Clear;
        UniQueryDelete.SQL.Add('Insert Into Alarm(ControllerID, ErrCode, StartTime, EndTime, CheckTime)');
        UniQueryDelete.SQL.Add('Values('+#39+DetailControllerID.ToString+#39);
        UniQueryDelete.SQL.Add(','+#39+'['+EditID.Text +'] : '+TextEditDetailName.text+' 단말기가 삭제되었습니다.'+#39+', GETDATE(), GETDATE(), GETDATE() )');
        UniQueryDelete.Execute;

        // 삭제 푸시알람
        UniQueryDelete.Close;
        UniQueryDelete.SQL.Clear;
        UniQueryDelete.SQL.Add('Insert Into PushData(Token, Title, Msg, InsertTime)');
        UniQueryDelete.SQL.Add('Values('+#39+pushToken+#39);
        //UniQueryDelete.SQL.Add(','+#39+'단말기 삭제 알림'+#39+','+#39+'('+EditID.Text +') ['+TextEditDetailName.text+']이 삭제되었습니다.'+#39+', GETDATE())');
        UniQueryDelete.SQL.Add(','+#39+'['+EditID.Text +'] : '+TextEditDetailName.text+#39+','+#39+'단말기가 삭제되었습니다.'+#39+', GETDATE())');
        UniQueryDelete.Execute;

        UniQueryDelete.Close;
        UniQueryDelete.SQL.Clear;
        UniQueryDelete.SQL.Add('Update ControllerInfo Set MasterID = -1 , ControllerName = '''' ');
        UniQueryDelete.SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
        UniQueryDelete.Execute;

        ControllerAllSearch;
        TabControl1.ActiveTab := TabItemMain;
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

procedure TfDongHwa.ButtonTESTClick(Sender: TObject);
var
  sCommand: AnsiString;
begin
    try
      // ... create TIdTCPClient
      idTCPClient                 := TIdTCPClient.Create();
      // ... set properties
      idTCPClient.Host            := '192.168.4.1';
      idTCPClient.Port            := 1480;
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

    IdTCPClient.Connect;

//  sCommand := (AnsiChar(#$01)+AnsiChar(#$1A)+AnsiChar(#$03)+AnsiChar(#$1A));  // 시리얼 번호 요청
//  sCommand :=  AnsiChar(#$0D) + AnsiChar(#$0A) + AnsiChar(#$31) + AnsiChar(#$30)
//             + AnsiChar(#$30) + AnsiChar(#$31) + AnsiChar(#$31) + AnsiChar(#$31)
//             + AnsiChar(#$30) + AnsiChar(#$31) + AnsiChar(#$31) + AnsiChar(#$31)
//             + AnsiChar(#$30) + AnsiChar(#$31) + AnsiChar(#$03);// + AnsiChar(#$03);  // 시리얼 번호 등록
  sCommand :=  AnsiChar(#$04) + AnsiChar(#$20) + AnsiChar(#$01) + AnsiChar(#$00) + AnsiChar(#$C8) + AnsiChar(#$03); // 온도변경
  sCommand := AnsiChar(#$02) + sCommand + Chr(BccCalculator(sCommand,1));
  IdTCPClient.IOHandler.WriteLn(sCommand);

  TimerConnectionClose.Enabled := True;
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

procedure TfDongHwa.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread, GetImage);
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

procedure TfDongHwa.Chart2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  tmp : Integer;

  i: Integer;
  Value: Double;
begin
  for i := Series2.FirstValueIndex to Series2.LastValueIndex do begin
    if Series2.CalcXPos(i) > Round(X) then begin
      tmp := i;
      break;
    end;
  end;

  if tmp <> Current then
  begin
    Current := tmp;
    Series2.Repaint;
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
        SQL.Add('Select (Count(T.No) - 1) as C FROM TempState as T Inner Join ControllerInfo as C');
        SQL.Add('On C.SerialNo = T.SerialNo Where C.MasterID = '+MasterUserID.ToString);
        Open;
        ControllerCount := FieldByName('C').AsInteger div 3 + 1;
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
      Memo1.Lines.Add('ControllerAllSearch : '+e.Message);
      TimerControllerAllSearch.Enabled := True;
    end;
  end;
end;

procedure TfDongHwa.DButtonALClick(Sender: TObject);
begin
  try
    if (Sender as TButton).Hint <> '' then
    begin
       MessageDlg('삭제하시겠습니까?'
        , System.UITypes.TMsgDlgType.mtInformation,
       [
         System.UITypes.TMsgDlgBtn.mbYes,
         System.UITypes.TMsgDlgBtn.mbNo
       ], 0,
       procedure (const AResult: TModalResult)
       begin
         if AResult = mrYes then
         begin
           UniQueryDelete.Close;
           UniQueryDelete.SQL.Clear;
           UniQueryDelete.SQL.Add('Update Alarm Set DCHECK = ''Y'' ');         // 250911 김동휘 알람 삭제체크 수정
           UniQueryDelete.SQL.Add('Where No = '+(Sender as TButton).Tag.ToString);
           UniQueryDelete.Execute;
           AlarmSearch;
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

procedure TfDongHwa.DButtonMemberDelClick(Sender: TObject);
begin
  with UniQueryMember do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from MasterUser');
    SQL.Add('Where UserID = ' + MemberID[(Sender as TButton).Tag].ToString);
    Open;
  end;


  MessageDlg(UniQueryMember.FieldByName('LoginID').AsString + ' 계정을 삭제하시겠습니까?'
  , System.UITypes.TMsgDlgType.mtInformation,
  [
   System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure (const AResult: TModalResult)
  begin
    if AResult = mrYes then
    begin
      with UniQueryMember do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Delete from MasterUser');
        SQL.Add('Where UserID = ' + MemberID[(Sender as TButton).Tag].ToString);
        Execute;

        MemberSearch;
        Showmessage('삭제되었습니다');
      end;
    end;
  end
  );
end;

procedure TfDongHwa.DetailRectangleClick(Sender: TObject);
var
  SenderTag : Integer;
  DetailInCount, DetailOutCount : Integer;
begin
  try
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
      TextEditDetailName.Text := TextMain1Name.Text;
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
      TextEditDetailName.Text := TextMain2Name.Text;
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
    end else if SenderTag = 3 then
    begin
      TextEditDetailName.Text := TextMain3Name.Text;
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
    end else
    begin
      Exit;
    end;

//    if TextDetailTemp.Text = 'OFF' then
//    begin
//      TextDetailChange.Enabled := false;
//    end
//    else
//    begin
//      TextDetailChange.Enabled := true;
//    end;


    TextDefrost.TextSettings.FontColor := $FFFF0000;
    RectangleDefrost.Fill.Color := $FFFFFFFF;

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
      ImageDetailPlus.Width := LayoutDetailSetTemp.Width / 4;
      ImageDetailPower.Width := LayoutDetailSetTemp.Width / 4;
      ImageDetailMinus.Width := LayoutDetailSetTemp.Width / 4;
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
        //RectangleDetailChange.Enabled := False;
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
      LayoutDetailInOut.Height := ( ClientHeight - TextDetailTitle.Height ) / 21 * 8;
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
      LayoutDetailInOut.Height := ( ClientHeight - TextDetailTitle.Height ) / 21 * 8 / 2;  // 입력수 칸 제거를 위해 나누기 2 추가
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


      TextEditDetailName.Visible := True;
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




    TabControl1.ActiveTab := TabItemDetail;
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
    UniQueryDetailSave.SQL.Add(', HighTemp = '+#39+EditDetailHigh.Text+#39);
    UniQueryDetailSave.SQL.Add(', LowTemp = '+#39+EditDetailLow.Text+#39);
    UniQueryDetailSave.SQL.Add('Where ControllerID = '+DetailControllerID.ToString);
    UniQueryDetailSave.ExecSQL;
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
//      Showmessage('숫자만 입력해 주세요');
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

procedure TfDongHwa.Edit_delayExit(Sender: TObject);
var
  N: Integer;
begin
  LayoutManage1.Visible := true;
  LayoutManage2.Visible := true;
  LayoutManage3.Visible := true;
  LayoutManage4.Align := TAlignLayout(0);
  LayoutManage3.Align := TAlignLayout(0);
  LayoutManage2.Align := TAlignLayout(0);
  LayoutManage3.Align := TAlignLayout(1);
  LayoutManage2.Align := TAlignLayout(1);
  LayoutManage4.Align := TAlignLayout(1);

  if trim(Edit_delay.Text) = '' then Edit_delay.Text := '0';

  N := StrToIntDef(Edit_delay.Text, -1);
  if (N < 0) or (N > 9999) then
  begin
    ShowMessage('0~9999 사이의 숫자만 입력 가능합니다.');
    Edit_delay.Text := '0'; // 기본값 강제
  end;
end;

procedure TfDongHwa.FormCreate(Sender: TObject);
var
  H: Single;
begin
{$IFDEF ANDROID}
  FPermissionReadExternalStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  FPermissionWriteExternalStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  FPermissionReadMediaImage := JStringToString(TJManifest_permission.JavaClass.MEDIA_CONTENT_CONTROL);

  H := Self.ClientHeight;

   PTop := H * 0.03;
   Pbot := H * 0.07;
  // 비율은 테스트하면서 조정 가능
  Self.Padding.Top := Round(PTop);     // 약 3% → 상단 SafeArea
  Self.Padding.Bottom := Round(Pbot);  // 약 7% → 하단 SafeArea
  //Self.Height := Self.Height - Round(Self.Padding.Top +Self.Padding.Bottom );
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

procedure TfDongHwa.FormShow(Sender: TObject);
var
  sPath : String;
  iFile : TIniFile;
  i : Integer;
  AppEventSvc: IFMXApplicationEventService;
begin
  ControllerAllSearchCount := 0;
  GraphSearchCount := 0;

  TextConnect1.Text := '연결된 Wifi 이름 가져오기'+#13+'(2.4GHz만 가능)'+#13+'(비밀번호는 직접 입력)' ;

  Alarm := 1;
  ThreadNumber := 0;

  RectanglePW.Visible := False;
  RectangleMain1SetTemp.Fill.Color := $FF202020;
  RectangleMain2SetTemp.Fill.Color := $FF202020;
  RectangleMain3SetTemp.Fill.Color := $FF202020;

  LayoutMain1Set.Visible := False;
  LayoutMain2Set.Visible := False;
  LayoutMain3Set.Visible := False;
  RectangleMain1Set.Visible := False;
  RectangleMain2Set.Visible := False;
  RectangleMain3Set.Visible := False;

//  Chart1.AllowPanning := pmHorizontal;
  Chart1.AllowPanning := pmBoth;
  Chart1.LeftAxis.Maximum := 70;
  Chart1.LeftAxis.Minimum := -30;
  Chart2.AllowPanning := pmBoth;
  Chart2.LeftAxis.Maximum := 70;
  Chart2.LeftAxis.Minimum := -30;

 // Chart1.LeftAxis.Title.Angle := 0;
//  Chart1.LeftAxis.Title.Text := '           온도(℃)';

 // Chart2.LeftAxis.Title.Angle := 0;
//  Chart2.LeftAxis.Title.Text := '           온도(℃)';

  for i := 0 to 1000 do
  begin
    ModelStr[i] := '';
  end;

  MainSetChangeState := False;
  PreMain1InCount := -1;
  PreMain2InCount := -1;
  PreMain3InCount := -1;
  PreMain1OutCount := -1;
  PreMain2OutCount := -1;
  PreMain3OutCount := -1;
  {$IFDEF ANDROID}
  try
    MediaPlayer1.FileName := TPath.Combine(TPath.GetDocumentsPath, 'alarm2.mp3');
  except

  end;
  {$ENDIF ANDROID}
  ButtonTEST.Visible := False;
  ButtonTEST2.Visible := False;
  KeyBoardFlag := False;
  sPath := TPath.Combine(TPath.GetDocumentsPath, 'Env.ini');
  if FileExists(sPath) then
  begin
    iFile := TIniFile.Create(sPath);
    try
//      EdtWifiID.Text := iFile.ReadString('Wifi' ,'ID', '');
//      EdtWifiPW.Text := iFile.ReadString('Wifi' ,'PW', '');
      EdtWifiID2.Text := iFile.ReadString('Wifi' ,'ID', '');
      EdtWifiPW2.Text := iFile.ReadString('Wifi' ,'PW', '');
      Alarm := StrToIntDef(iFile.ReadString('Alarm' ,'G', ''),1);
      if Alarm = 0 then
      begin
        TextAlarm.Text := '경 보 알 림 OFF';
      end else
      begin
        TextAlarm.Text := '경 보 알 림 ON';
      end;

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
  Chart2.Title.Text.Clear;


  Text_QrSearch.Text := 'QR 코드'+#13+'촬영';
  Text_QRImage.Text  := 'QR 코드'+#13+'가져오기';
  TextConnect4.Text  := 'WIFI 설정화면으로 이동'+#13+'DongHwaAP 선택'+#13+'비밀번호 최초 1회 입력'+#13+'PW: 12345678';

//    if TPlatformServices.Current.SupportsPlatformService
//    (IFMXApplicationEventService, IInterface(AppEventSvc)) then
//    AppEventSvc.SetApplicationEventHandler(AppEvent);
//    FScanManager := TScanManager.Create(TBarcodeFormat.Auto, nil);

  Resize;
end;

procedure TfDongHwa.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  KeyBoardFlag := False;
  if TabControl1.ActiveTab = TabItemDetail then
  begin
    RectangleDetailDevice.Visible := True;
    LayoutDetailHighLow.Visible := True;
  end;
end;

procedure TfDongHwa.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  KeyBoardFlag := True;

  if TabControl1.ActiveTab = TabItemDetail then
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
          Chart1.BottomAxis.Minimum := ChartMinDate;// - (1 / 24 * 8);
        except
          Chart1.BottomAxis.Maximum := Chart1.BottomAxis.Minimum + ChartMaxDate;
          Chart1.BottomAxis.Minimum := ChartMinDate;// - (1 / 24 * 8);
          Chart1.BottomAxis.Maximum := ChartMaxDate;  // 8시간
        end;
      end else
      begin
        if Chart1.BottomAxis.Maximum < ChartMaxDate then
        begin
          Chart1.BottomAxis.Maximum := Chart1.BottomAxis.Minimum + 1;
        end;
        Chart1.BottomAxis.Maximum := ChartMaxDate;
        Chart1.BottomAxis.Minimum := ChartMinDate;// - (1 / 24 * 8);
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
      Showmessage('검색조건을 확인하세요.'+#13+#10+'에러코드: '+  e.Message);
      exit;
    end;
  end;
end;

procedure TfDongHwa.GraphExpand2;
var
  MulCalcDate, MulCalcTemp : Double;
begin
  try
    if Expand2 = 777 then
    begin
      TextGraph2Expand.Text := 'x1'; // 1배 = 2시간차  [ 라인4개 ]
      if Chart2.BottomAxis.Minimum < ChartMaxDate then
      begin
        try
          Chart2.BottomAxis.Maximum := ChartMaxDate;  // 8시간
          Chart2.BottomAxis.Minimum := ChartMinDate;// - (1 / 24 * 8);
        except
          Chart2.BottomAxis.Maximum := Chart2.BottomAxis.Minimum + ChartMaxDate;
          Chart2.BottomAxis.Minimum := ChartMinDate;// - (1 / 24 * 8);
          Chart2.BottomAxis.Maximum := ChartMaxDate;  // 8시간
        end;
      end else
      begin
        if Chart2.BottomAxis.Maximum < ChartMaxDate then
        begin
          Chart2.BottomAxis.Maximum := Chart2.BottomAxis.Minimum + 1;
        end;
        Chart2.BottomAxis.Maximum := ChartMaxDate;
        Chart2.BottomAxis.Minimum := ChartMinDate;// - (1 / 24 * 8);
      end;
      Expand2 := 1;

      GraphDateAvg2 := (Chart2.BottomAxis.Maximum - Chart2.BottomAxis.Minimum) / 2;
      GraphDateAvg2 := Chart2.BottomAxis.Minimum + GraphDateAvg2;
    end else
    begin
      GraphDateAvg2 := (Chart2.BottomAxis.Maximum - Chart2.BottomAxis.Minimum) / 2;
      GraphDateAvg2 := Chart2.BottomAxis.Minimum + GraphDateAvg2;

      if Expand2 = 1 then
      begin
        TextGraph2Expand.Text := 'x1'; // 1배 = 2시간차  [ 라인4개 ]
        MulCalcDate := 4;
      end else if Expand2 = 2 then // 2배 = 1시간차
      begin
        TextGraph2Expand.Text := 'x2';
        MulCalcDate := 2;
      end else if Expand2 = 3 then // 4배 = 30분차
      begin
        TextGraph2Expand.Text := 'x4';
        MulCalcDate := 1;
      end else if Expand2 = 4 then // 8배 = 15분차
      begin
        TextGraph2Expand.Text := 'x8';
        MulCalcDate := 0.5;
      end else if Expand2 = 0 then  // -2배 = 4시간차
      begin
        TextGraph2Expand.Text := 'x(-2)';
        MulCalcDate := 8;
      end else if Expand2 = -1 then // -4배 = 6시간차
      begin
        TextGraph2Expand.Text := 'x(-4)';
        MulCalcDate := 12;
      end;
      Chart2.BottomAxis.Minimum := GraphDateAvg2 - (MulCalcDate / 24);    // AvgDateTime
      Chart2.BottomAxis.Maximum := GraphDateAvg2 + (MulCalcDate / 24);
    end;

    with UniQueryGraph do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Max(Temp) as Mx, Min(Temp) as Mn from TempCheck');
      SQL.Add('Where SerialNo = '+#39+GraphDetailSerialNo+#39);
      SQL.Add('And CheckDate >= '+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',Chart2.BottomAxis.Minimum)+#39);
      SQL.Add('And CheckDate <= '+#39+FormatDateTime('yyyy-mm-dd hh:nn:ss',Chart2.BottomAxis.Maximum)+#39);
      Open;

      if FieldByName('Mx').AsCurrency <> FieldByName('Mn').AsCurrency then
      begin
        Chart2.LeftAxis.Maximum := 99999;
        Chart2.LeftAxis.Minimum := -99999;
        MulCalcTemp := FieldByName('Mx').AsCurrency - FieldByName('Mn').AsCurrency;
        if MulCalcTemp < 1 then MulCalcTemp := 10;

        Chart2.LeftAxis.Maximum := FieldByName('Mx').AsCurrency
                  + (MulCalcTemp / 10);
        Chart2.LeftAxis.Minimum := FieldByName('Mn').AsCurrency
                  - (MulCalcTemp / 10);
      end;
    end;

    if Chart2.Series[0].Count > 0 then
    begin
      var tmp, i : Integer;

      for i := 0 to Chart2.Series[0].Count - 1 do
      begin
        if Chart2.Series[0].XValue[i] >= GraphDateAvg2 then
        begin
          tmp := i;
          break;
        end;
      end;

      if tmp <> Current then
      begin
        Current := tmp;
        Series2.Repaint;
      end;
    end;
  except on e:exception do
    begin
      Showmessage('검색조건을 확인하세요.'+#13+#10+'에러코드: '+  e.Message);
     // Showmessage(e.Message);
      exit;
    end;
  end;
end;

procedure TfDongHwa.GraphSearch;
var
  i : integer;
begin
  try
    Chart1.BottomAxis.Automatic := True;
    Chart1.LeftAxis.Automatic := True;
//    if UniConnection1.Connected then
//    begin
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
        Chart2.Series[0].Clear;
        GraphTempAvg := 0;
        for i := 0 to RecordCount - 1 do
        begin
          Chart1.Series[0].AddXY(
                   FieldByName('CheckDate').AsDateTime,
                   FieldByName('TEMP').AsFloat,
                   '',
                   Chart1.Series[0].Color);
          Chart2.Series[0].AddXY(
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
//    end else
//    begin
//      UniConnection1.Connected := True;
//      TimerGraphSearch.Enabled := True;
//    end;
  except on e:exception do
    begin
      Memo1.Lines.Add('GraphSearch : '+e.Message);
      TimerGraphSearch.Enabled := True;
    end;
  end;
end;

procedure TfDongHwa.HandleException(Sender: TObject; E: Exception);
begin
  Memo1.Lines.Add('HE : ' + E.Message);
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
          TimerC.Enabled := True;
        end else
        begin
          TimerPlusOkPre.Enabled := True;
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

procedure TfDongHwa.ImagePlusClick(Sender: TObject);
begin
Exit;
  if MasterCheck then
  begin
    UniConnection1.Connected := False;
    ImageConnectBack.Bitmap := ImageBack1.Bitmap;
    TabControl1.ActiveTab := TabItemConnect;
  end else
  begin
    Showmessage('관리자만 가능한 기능입니다');
  end;
end;

procedure TfDongHwa.ImageXClick(Sender: TObject);
begin
  EditPW2.Text := '';
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

procedure TfDongHwa.Image1Click(Sender: TObject);
begin
  Image1.Visible := False;
end;

procedure TfDongHwa.ImageAlarmClick(Sender: TObject);
begin
  AlarmSearch;
  TabControl1.ActiveTab := TabItemAlarm;
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
  LayoutGraph1DateTime.Visible := False;
  LayoutGraph1Button.Visible := True;
  DateEditGraph1.Date := Now;
  DateEditGraph2.Date := Now;
  TimeEditGraph1.Format := 'AM/PM hh:nn';
  TimeEditGraph2.Format := 'AM/PM hh:nn';
  TimeEditGraph1.Time := EncodeTime(0,0,0,0);//StrToTime('00:00:00');
  TimeEditGraph2.Time := EncodeTime(23,59,59,0);//StrToTime('23:59:59');

  GraphStart := FormatDateTime('yyyy-mm-dd ',DateEditGraph1.Date) + FormatDateTime('hh:nn:ss',TimeEditGraph1.Time);
  GraphEnd := FormatDateTime('yyyy-mm-dd ',DateEditGraph2.Date) + FormatDateTime('hh:nn:ss',TimeEditGraph2.Time);
  GraphSearch;
  TextGraphDevice.Text := TextDetailModel.Text;
  EditGraphModel.Text := EditDetailName.Text;
  TabControl1.ActiveTab := TabItemGraph;
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

procedure TfDongHwa.ImageManageClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItemManage;
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

procedure TfDongHwa.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  if ListBox1.Count > 0 then
  begin
    AlarmDelButton.Visible := False;

    AlarmDelButton := (FindComponent('DButtonAL'+ListBox1.ItemIndex.ToString) as TButton);

    if AlarmDelButton.Hint <> '' then
      AlarmDelButton.Visible := True;
  end;
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
procedure CreateNotificationChannel;
//var
//  NotificationManager: JNotificationManager;
//  Channel: JNotificationChannel;
begin
//  NotificationManager := TJNotificationManager.Wrap(
//    TAndroidHelper.Context.getSystemService(TJContext.JavaClass.NOTIFICATION_SERVICE)
//  );
//  Channel := TJNotificationChannel.JavaClass.init(
//    StringToJString('default_channel'),
//    StrToJCharSequence('Default Channel'),
//    TJNotificationManager.JavaClass.IMPORTANCE_HIGH
//  );
//  NotificationManager.createNotificationChannel(Channel);
end;
begin
  TimerProcedure.Enabled := False;

  {$IFDEF ANDROID}
  if UniConnection1.Connected then
  begin
    UniQueryVersionCheck.Close;
    UniQueryVersionCheck.SQL.Text := 'Select * From VERSION ';
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
          Intent := TJIntent.Create;
          Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
          Intent.setData(StrToJURI( UniQueryVersionCheck.FieldByName('URL').AsString ));
          SharedActivity.startActivity(Intent);
         end;
       end
       );
    end;
  end;
  {$ENDIF ANDROID}

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
  //  UniQueryLogin.SQL.Add('Exec usp_User @Option = ''O'', @LoginID = :LoginID');
    // 250317 김동휘 쿼리로 수정
    UniQueryLogin.sql.add(' SELECT UserID ,MasterID ,LoginID ,Password ,Name ,Position ,Delay_sec			  '); //250929_김동휘 경보지연시간 추가
    UniQueryLogin.sql.add(' FROM MasterUser WHERE	BINARY_CHECKSUM(LoginID)  = BINARY_CHECKSUM(:LoginID) ');
    UniQueryLogin.sql.add(' AND  LoginID <> ''수정해주세요''											  ');
    UniQueryLogin.ParamByName('LoginID').AsString := EditID.Text;
    UniQueryLogin.ExecSQL;

    Delay := UniQueryLogin.FieldByName('Delay_sec').AsInteger;
    Edit_delay.Text := inttostr(Delay);

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
        Msg := EditID.Text+'(스마트폰)가 접속되었습니다';
      end else
      begin
        MasterCheck := False;
        Msg := EditID.Text+'(부-스마트폰)가 접속되었습니다';
      end;

      RectangleMain1Set.Enabled := MasterCheck;
      RectangleMain2Set.Enabled := MasterCheck;
      RectangleMain3Set.Enabled := MasterCheck;
//      RectangleMember.Visible := MasterCheck;
      ImageManage.Visible := MasterCheck;

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
      {$IFDEF Release}
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
       {$ENDIF}

       {$IFDEF ANDROID}
      if FirstCheck then
        begin
          try
            FirstCheck := False;
            // FCM 푸시 서비스 가져오기
            PushService := TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.FCM);
            // 서비스 연결 생성 후 활성화
            ServiceConnection := TPushServiceConnection.Create(PushService);
            ServiceConnection.Active := True;
            ServiceConnection.OnChange := OnServiceConnectionChange;
            ServiceConnection.OnReceiveNotification := OnReceiveNotificationEvent;
            // 기기 ID 확인 (디버그용)
            FDeviceId := PushService.DeviceIDValue[TPushService.TDeviceIDNames.DeviceId];
            MemoLog.Lines.Add('DeviceID: ' + FDeviceId);
            // 앱 시작 시 전달받은 알림이 있을 경우 처리
            Notifications := PushService.StartupNotifications;
            if Length(Notifications) > 0 then
            begin
              MemoLog.Lines.Add('-----------------------------------------');
              MemoLog.Lines.Add('DataKey = ' + Notifications[0].DataKey);
              MemoLog.Lines.Add('Json = ' + Notifications[0].Json.ToString);
              MemoLog.Lines.Add('DataObject = ' + Notifications[0].DataObject.ToString);
              MemoLog.Lines.Add('-----------------------------------------');
            end;
            CreateNotificationChannel;
          except
            on E: Exception do
              MemoLog.Lines.Add('Error: ' + E.Message);
          end;
        end;
        {$ENDIF ANDROID}
               {
      UniQueryModel.Close;
      UniQueryModel.SQL.Text := 'select Name From Model Group by Name';
      UniQueryModel.Open;
      ModelCount := UniQueryModel.RecordCount;
      for i := 0 to ModelCount - 1 do
      begin
        ModelStr[i] := UniQueryModel.FieldByName('Name').AsString;
        UniQueryModel.Next;
      end;
              }
      ControllerAllSearch;
      TabControl1.ActiveTab := TabItemMain;

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

//procedure TfDongHwa.ReceiveNotification(Sender: TObject; const ANotification: TPushServiceNotification);
//var
//  LNotification: TNotification;
//begin
//  // 포그라운드에서도 로컬 알림으로 표시
//  LNotification := TNotification.Create;
//  try
//    LNotification.AlertBody := ANotification.Json.ToString; // 필요한 데이터로 가공 가능
//    NotificationCenter1.ScheduleNotification(LNotification);
//    MemoLog.Lines.Add('-----------------------------------------');
//    MemoLog.Lines.Add('DataKey = ' + ANotification.DataKey);
//    MemoLog.Lines.Add('Json = ' + ANotification.Json.ToString);
//    MemoLog.Lines.Add('DataObject = ' +
//    ANotification.DataObject.ToString);
//    MemoLog.Lines.Add('---------------------------------------');
//  finally
//    LNotification.Free;
//  end;
//  // 로그에 기록
//  MemoLog.Lines.Add('포그라운드 알림 수신: ' + ANotification.Json.ToString);
//end;

procedure TfDongHwa.MainRefresh;
var
  i,j : integer;
  AlarmCheck : Boolean;
  procedure Main1PlusVisible;
  begin
    ImageMain1Plus.Visible := True;
    TextMain1Name.Text := '단말기';
    TextMain1Model.Text := '';
    TextMain1TempL.Text := '현재온도';// : ';
    TextMain1SetTempL.Text := '설정온도';// : ';
    TextMain1RTopC1.Text := '1';
    TextMain1RTopC2.Text := '2';
    TextMain1RTopC3.Text := '3';
    TextMain1RTopC4.Text := '4';
    TextMain1RTopC5.Text := '5';
    TextMain1RClientC1.Text := '1';
    TextMain1RClientC2.Text := '2';
    TextMain1RClientC3.Text := '3';
    TextMain1RClientC4.Text := '4';
    TextMain1RClientC5.Text := '5';
  end;
  procedure Main2PlusVisible;
  begin
    ImageMain2Plus.Visible := True;
    TextMain2Name.Text := '단말기';
    TextMain2Model.Text := '';
    TextMain2TempL.Text := '현재온도';// : ';
    TextMain2SetTempL.Text := '설정온도';// : ';
    TextMain2RTopC1.Text := '1';
    TextMain2RTopC2.Text := '2';
    TextMain2RTopC3.Text := '3';
    TextMain2RTopC4.Text := '4';
    TextMain2RTopC5.Text := '5';
    TextMain2RClientC1.Text := '1';
    TextMain2RClientC2.Text := '2';
    TextMain2RClientC3.Text := '3';
    TextMain2RClientC4.Text := '4';
    TextMain2RClientC5.Text := '5';

    RectangleMain2Alarm.Visible := False;
    FloatAnimation2.Enabled := False;
  end;
  procedure Main3PlusVisible;
  begin
    ImageMain3Plus.Visible := True;
    TextMain3Name.Text := '단말기';
    TextMain3Model.Text := '';
    TextMain3TempL.Text := '현재온도';// : ';
    TextMain3SetTempL.Text := '설정온도';// : ';
    TextMain3RTopC1.Text := '1';
    TextMain3RTopC2.Text := '2';
    TextMain3RTopC3.Text := '3';
    TextMain3RTopC4.Text := '4';
    TextMain3RTopC5.Text := '5';
    TextMain3RClientC1.Text := '1';
    TextMain3RClientC2.Text := '2';
    TextMain3RClientC3.Text := '3';
    TextMain3RClientC4.Text := '4';
    TextMain3RClientC5.Text := '5';

    RectangleMain3Alarm.Visible := False;
    FloatAnimation3.Enabled := False;
  end;

begin
  if TabControl1.ActiveTab = TabItemMain then
  begin
    try
      AlarmCheck := False;
      With UniQueryTempCheck do
      begin
        // 여기서 경보 전체 검색 후, 한개라도 있으면 소리 경보 시작, 1분 - 5분 - 1분??

        UniQueryTempCheck2.Close;
        UniQueryTempCheck2.SQL.Clear;
        UniQueryTempCheck2.SQL.Text := UniQueryTempCheck2.SQLInsert.Text;
        UniQueryTempCheck2.ParamByName('MasterID').AsInteger := MasterUserID;
//        UniQueryTempCheck2.SQL.Add('Select Count(C.ControllerID) as C from Alarm as A');
//        UniQueryTempCheck2.SQL.Add('Inner Join ControllerInfo as C');
//        UniQueryTempCheck2.SQL.Add('On A.ControllerID = C.ControllerID');
//        UniQueryTempCheck2.SQL.Add('Where C.MasterID = '+MasterUserID.ToString);
//        UniQueryTempCheck2.SQL.Add('AND A.Dcheck = ''N'' '); // 250911 김동휘 추가
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
       // SQL.Add('Exec usp_Temp @Option = ''A'', @MasterID = :MasterID, @Page = :Page');
        SQL.Text := UniQueryTempCheck.SQLInsert.Text;
        ParamByName('MasterID').AsInteger := MasterUserID;
        ParamByName('Page').AsInteger := Page;
        ParamByName('PAGE_SIZE').AsInteger := 3;
        Open;
        if RecordCount > 0 then
        begin
          First;
          ControllerID[1] := 0;
          ControllerID[2] := 0;
          ControllerID[3] := 0;
          ControllerHighTemp[1] := 50;
          ControllerHighTemp[2] := 50;
          ControllerHighTemp[3] := 50;
          ControllerLowTemp[1] := -10;
          ControllerLowTemp[2] := -10;
          ControllerLowTemp[3] := -10;

          for i := 1 to 3 do
          begin
            for j := 1 to 5 do
            begin
              DIn[i][j] := False;
              DOut[i][j] := False;
            end;
          end;
          ImageMain1Plus.Visible := False;
          if FieldByName('ControllerName').AsString = '' then
          begin
            TextMain1Name.Text := '단말기'+(((Page-1)*3)+1).ToString;
          end else
          begin
            TextMain1Name.Text := FieldByName('ControllerName').AsString;
          end;
          TextMain1Model.Text := FieldByName('ControllerModel').AsString;

          TextMain1TempL.Text := FieldByName('TempName').AsString;
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

              DIn[1][1] := FieldByName('DIn1').AsBoolean;
              DOut[1][1] := FieldByName('DOut1').AsBoolean;
              if DIn[1][1] then CircleMain1RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[1][1] then CircleMain1RClientC1.Fill.Color := FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColor(65280)// TAlphaColors.Greenyellow
                            else CircleMain1RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[1][2] := FieldByName('DIn2').AsBoolean;
              DOut[1][2] := FieldByName('DOut2').AsBoolean;
              if DIn[1][2] then CircleMain1RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[1][2] then CircleMain1RClientC2.Fill.Color := FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain1RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[1][3] := FieldByName('DIn3').AsBoolean;
              DOut[1][3] := FieldByName('DOut3').AsBoolean;
              if DIn[1][3] then CircleMain1RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[1][3] then CircleMain1RClientC3.Fill.Color := FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain1RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[1][4] := FieldByName('DIn4').AsBoolean;
              DOut[1][4] := FieldByName('DOut4').AsBoolean;
              if DIn[1][4] then CircleMain1RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[1][4] then CircleMain1RClientC4.Fill.Color := FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain1RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[1][5] := FieldByName('DIn5').AsBoolean;
              DOut[1][5] := FieldByName('DOut5').AsBoolean;
              if DIn[1][5] then CircleMain1RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain1RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[1][5] then CircleMain1RClientC5.Fill.Color := FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain1RClientC5.Fill.Color := TAlphaColors.Lightgray;


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
            end;
          end;

          ControllerState[1] := False;
                                 // 1분 * 5
          if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
          begin
            ImageMain1.MultiResBitmap := ImageWifi3.MultiResBitmap;
            ControllerState[1] := True;
            TextMain1SetTemp.TextSettings.Font.Size := TempSize;
            TextMain1Temp.TextSettings.Font.Size := TempSize;
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

        //    TextMain1SetTemp.TextSettings.Font.Size := LowSize;
          end;

          if TextMain1Temp.Text = 'ER10' then
          begin
            TextMain1Temp.TextSettings.Font.Size := TitleSize;
            TextMain1SetTemp.TextSettings.Font.Size := TitleSize;
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

          ControllerID[1] := FieldByName('ControllerID').AsInteger;
          ControllerHighTemp[1] := FieldByName('HighTemp').AsFloat;
          ControllerLowTemp[1] := FieldByName('LowTemp').AsFloat;
          DefrostMode[1] := FieldByName('DefrostMode').AsBoolean;
          DefrostState[1] := FieldByName('DefrostState').AsBoolean;
          if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
          begin
            TextMain1Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
            TextMain1SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
            TextMain1SetTemp.Hint := TextMain1SetTemp.Text;
            SetTemp[1] := FieldByName('SetTemp').AsFloat;
          end else if not FieldByName('PowerState').AsBoolean then   // 전원끄기 동작
          begin
            TextMain1Temp.Text := 'OFF';
            TextMain1SetTemp.Text := 'OFF';
          end;

          if FieldByName('Err').AsString = '001' then
          begin
            TextMain1Temp.Text := 'ER1';
            TextMain1SetTemp.TextSettings.Font.Size := TitleSize;
            TextMain1SetTemp.Text := 'SENSOR ERROR';
          end
          else
          if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
            or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
          begin
            if Delay > 0 then
            begin
              // 지연시간 비교
              if not FieldByName('occur_time').IsNull then
              begin
                if (SecondsBetween(Now, FieldByName('occur_time').AsDateTime) >= delay) then
                begin
                  TextMain1SetTemp.TextSettings.Font.Size := TitleSize;
                  if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
                  begin
                    TextMain1SetTemp.Text := '온도과도상승';
                  end
                  else
                  begin
                    TextMain1SetTemp.Text := '온도과도하강';
                  end;
                end;
              end;
            end
            else
            begin
              TextMain1SetTemp.TextSettings.Font.Size := TitleSize;
              if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
              begin
                TextMain1SetTemp.Text := '온도과도상승';
              end
              else
              begin
                TextMain1SetTemp.Text := '온도과도하강';
              end;
            end;
          end
          else
          begin
            RectangleMain1Alarm.Visible := False;
            FloatAnimation1.Enabled := False;
          end;

          DetailAlarm[1] := FieldByName('Alarm').AsBoolean;
          if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
          begin
            if FieldByName('Err').AsString = '001' then
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

              end;                                                    {                                                   }
            end else  if TextMain1Temp.Text = 'ER10' then
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

              end;
            end
            else
            if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              if Delay > 0 then
              begin
                if (SecondsBetween(Now, FieldByName('occur_time').AsDateTime) >= delay) then
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

                  end;
                end;
              end
              else
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

                end;
              end;

            end
            else
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
            ImageMain2Plus.Visible := False;
            if FieldByName('ControllerName').AsString = '' then
            begin
              TextMain2Name.Text := '단말기'+(((Page-1)*3)+2).ToString;
            end else
            begin
              TextMain2Name.Text := FieldByName('ControllerName').AsString;
            end;
            TextMain2Model.Text := FieldByName('ControllerModel').AsString;

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

              DIn[2][1] := FieldByName('DIn1').AsBoolean;
              DOut[2][1] := FieldByName('DOut1').AsBoolean;
              if DIn[2][1] then CircleMain2RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[2][1] then CircleMain2RClientC1.Fill.Color :=  FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[2][2] := FieldByName('DIn2').AsBoolean;
              DOut[2][2] := FieldByName('DOut2').AsBoolean;
              if DIn[2][2] then CircleMain2RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[2][2] then CircleMain2RClientC2.Fill.Color :=  FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[2][3] := FieldByName('DIn3').AsBoolean;
              DOut[2][3] := FieldByName('DOut3').AsBoolean;
              if DIn[2][3] then CircleMain2RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[2][3] then CircleMain2RClientC3.Fill.Color :=  FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[2][4] := FieldByName('DIn4').AsBoolean;
              DOut[2][4] := FieldByName('DOut4').AsBoolean;
              if DIn[2][4] then CircleMain2RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[2][4] then CircleMain2RClientC4.Fill.Color :=  FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[2][5] := FieldByName('DIn5').AsBoolean;
              DOut[2][5] := FieldByName('DOut5').AsBoolean;
              if DIn[2][5] then CircleMain2RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain2RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[2][5] then CircleMain2RClientC5.Fill.Color :=  FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain2RClientC5.Fill.Color := TAlphaColors.Lightgray;


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
              end;
            end;

            ControllerState[2] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              ImageMain2.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[2] := True;
              TextMain2SetTemp.TextSettings.Font.Size := TempSize;
              TextMain2Temp.TextSettings.Font.Size := TempSize;
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

            if TextMain2Temp.Text = 'ER10' then
            begin
              TextMain2Temp.TextSettings.Font.Size := TitleSize;
              TextMain2SetTemp.TextSettings.Font.Size := TitleSize;
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


            ControllerID[2] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[2] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[2] := FieldByName('LowTemp').AsFloat;
            DefrostMode[2] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[2] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              TextMain2Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if RectangleMain2Set.Visible then
//              begin
                TextMain2SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                TextMain2SetTemp.Hint := TextMain2SetTemp.Text;
                SetTemp[2] := FieldByName('SetTemp').AsFloat;
//              end;
            end else if not FieldByName('PowerState').AsBoolean then
            begin
              TextMain2Temp.Text := 'OFF';
              TextMain2SetTemp.Text := 'OFF';
              //TextDetailChange.Enabled := False;
            end;

            if FieldByName('Err').AsString = '001' then
            begin
//              TextMain2Temp.TextSettings.Font.Size := TitleSize;
              TextMain2Temp.Text := 'ER1';
              TextMain2SetTemp.TextSettings.Font.Size := TitleSize;
              TextMain2SetTemp.Text := 'SENSOR ERROR';
            end
            else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              if Delay > 0 then
              begin
                // 지연시간 비교
                if not FieldByName('occur_time').IsNull then
                begin
                  if (SecondsBetween(Now, FieldByName('occur_time').AsDateTime) >= delay) then
                  begin
                    TextMain2SetTemp.TextSettings.Font.Size := TitleSize;
                    if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
                    begin
                      TextMain2SetTemp.Text := '온도과도상승';
                    end else
                    begin
                      TextMain2SetTemp.Text := '온도과도하강';
                    end;
                  end;
                end;
              end
              else
              begin
                TextMain2SetTemp.TextSettings.Font.Size := TitleSize;
                if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
                begin
                  TextMain2SetTemp.Text := '온도과도상승';
                end
                else
                begin
                  TextMain2SetTemp.Text := '온도과도하강';
                end;
              end;
            end
            else
            begin
              RectangleMain2Alarm.Visible := False;
              FloatAnimation2.Enabled := False;
            end;

            DetailAlarm[2] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
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

                end;
              end
              else if TextMain2Temp.Text = 'ER10' then
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

                end;
              end
              else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                if Delay > 0 then
                begin
                  if (SecondsBetween(Now, FieldByName('occur_time').AsDateTime) >= delay) then
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

                    end;
                  end;
                end
                else
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

                  end;
                end;
              end
              else
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
            ImageMain3Plus.Visible := False;
            if FieldByName('ControllerName').AsString = '' then
            begin
              TextMain3Name.Text := '단말기'+(((Page-1)*3)+3).ToString;
            end else
            begin
              TextMain3Name.Text := FieldByName('ControllerName').AsString;
            end;
            TextMain3Model.Text := FieldByName('ControllerModel').AsString;

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

              DIn[3][1] := FieldByName('DIn1').AsBoolean;
              DOut[3][1] := FieldByName('DOut1').AsBoolean;
              if DIn[3][1] then CircleMain3RTopC1.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC1.Fill.Color := TAlphaColors.Lightgray;
              if DOut[3][1] then CircleMain3RClientC1.Fill.Color :=  FieldByName('K1Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC1.Fill.Color := TAlphaColors.Lightgray;

              DIn[3][2] := FieldByName('DIn2').AsBoolean;
              DOut[3][2] := FieldByName('DOut2').AsBoolean;
              if DIn[3][2] then CircleMain3RTopC2.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC2.Fill.Color := TAlphaColors.Lightgray;
              if DOut[3][2] then CircleMain3RClientC2.Fill.Color :=  FieldByName('K2Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC2.Fill.Color := TAlphaColors.Lightgray;

              DIn[3][3] := FieldByName('DIn3').AsBoolean;
              DOut[3][3] := FieldByName('DOut3').AsBoolean;
              if DIn[3][3] then CircleMain3RTopC3.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC3.Fill.Color := TAlphaColors.Lightgray;
              if DOut[3][3] then CircleMain3RClientC3.Fill.Color :=  FieldByName('K3Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC3.Fill.Color := TAlphaColors.Lightgray;

              DIn[3][4] := FieldByName('DIn4').AsBoolean;
              DOut[3][4] := FieldByName('DOut4').AsBoolean;
              if DIn[3][4] then CircleMain3RTopC4.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC4.Fill.Color := TAlphaColors.Lightgray;
              if DOut[3][4] then CircleMain3RClientC4.Fill.Color :=  FieldByName('K4Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC4.Fill.Color := TAlphaColors.Lightgray;

              DIn[3][5] := FieldByName('DIn5').AsBoolean;
              DOut[3][5] := FieldByName('DOut5').AsBoolean;
              if DIn[3][5] then CircleMain3RTopC5.Fill.Color := TAlphaColors.Greenyellow
                           else CircleMain3RTopC5.Fill.Color := TAlphaColors.Lightgray;
              if DOut[3][5] then CircleMain3RClientC5.Fill.Color :=  FieldByName('K5Color2').AsInteger + 4278190080//TAlphaColors.Greenyellow
                            else CircleMain3RClientC5.Fill.Color := TAlphaColors.Lightgray;

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


            ControllerState[3] := False;
                                   // 1분 * 5
            if (Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime  then
            begin
              ImageMain3.MultiResBitmap := ImageWifi3.MultiResBitmap;
              ControllerState[3] := True;
              TextMain3SetTemp.TextSettings.Font.Size := TempSize;
              TextMain3Temp.TextSettings.Font.Size := TempSize;
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
              TextMain3Temp.TextSettings.Font.Size := TitleSize;
              TextMain3SetTemp.TextSettings.Font.Size := TitleSize;
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


            ControllerID[3] := FieldByName('ControllerID').AsInteger;
            ControllerHighTemp[3] := FieldByName('HighTemp').AsFloat;
            ControllerLowTemp[3] := FieldByName('LowTemp').AsFloat;
            DefrostMode[3] := FieldByName('DefrostMode').AsBoolean;
            DefrostState[3] := FieldByName('DefrostState').AsBoolean;
            if FieldByName('PowerState').AsBoolean and ((Now - (0.0000011574 * 600 * 5)) <= FieldByName('CheckDate').AsDateTime) then
            begin
              TextMain3Temp.Text := FormatFloat('0.0',FieldByName('Temp').AsFloat);//+'℃';
//              if RectangleMain3Set.Visible then
//              begin
                TextMain3SetTemp.Text := FormatFloat('0.0',FieldByName('SetTemp').AsFloat);//+'℃';
                TextMain3SetTemp.Hint := TextMain3SetTemp.Text;
                SetTemp[3] := FieldByName('SetTemp').AsFloat;
//              end;
            end else if not FieldByName('PowerState').AsBoolean then
            begin
              TextMain3Temp.Text := 'OFF';
              TextMain3SetTemp.Text := 'OFF';
            end;

            if FieldByName('Err').AsString = '001' then
            begin

              TextMain3Temp.Text := 'ER1';
              TextMain3SetTemp.TextSettings.Font.Size := TitleSize;
              TextMain3SetTemp.Text := 'SENSOR ERROR';
            end
            else if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat )
              or ( FieldByName('Temp').AsFloat < FieldByName('LowTemp').AsFloat ) then
            begin
              if Delay > 0 then
              begin
                // 지연시간 비교
                if not FieldByName('occur_time').IsNull then
                begin
                  if (SecondsBetween(Now, FieldByName('occur_time').AsDateTime) >= delay) then
                  begin
                    TextMain3SetTemp.TextSettings.Font.Size := TitleSize;
                    if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
                    begin
                      TextMain3SetTemp.Text := '온도과도상승';
                    end else
                    begin
                      TextMain3SetTemp.Text := '온도과도하강';
                    end;
                  end;
                end;
              end
              else
              begin
                TextMain3SetTemp.TextSettings.Font.Size := TitleSize;
                if ( FieldByName('Temp').AsFloat > FieldByName('HighTemp').AsFloat ) then
                begin
                  TextMain3SetTemp.Text := '온도과도상승';
                end else
                begin
                  TextMain3SetTemp.Text := '온도과도하강';
                end;
              end;
            end
            else
            begin
              RectangleMain3Alarm.Visible := False;
              FloatAnimation3.Enabled := False;
            end;

            DetailAlarm[3] := FieldByName('Alarm').AsBoolean;
            if (Alarm = 1) and FieldByName('Alarm').AsBoolean then
            begin
              if FieldByName('Err').AsString = '001' then
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

                end;
              end else if TextMain3Temp.Text = 'ER10' then
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

                end;
              end else if ( FieldByName('Temp').AsFloat > (FieldByName('HighTemp').AsFloat) )
                or ( FieldByName('Temp').AsFloat < (FieldByName('LowTemp').AsFloat) ) then
              begin
                if Delay > 0 then
                begin
                  if (SecondsBetween(Now, FieldByName('occur_time').AsDateTime) >= delay) then
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

                    end;
                  end;
                end
                else
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

                  end;
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
        end;
      end;

    except on e:exception do
      begin
        Memo1.Lines.Add(UniQueryTempCheck.FieldByName('ControllerName').AsString
                      + '= Refresh Error : '+e.Message);
      end;
    end;
  end;
end;

procedure TfDongHwa.MemberIDEditEnter(Sender: TObject);
begin
  MemberEnterID := (Sender as TEdit).Text;
end;

procedure TfDongHwa.MemberIDEditExit(Sender: TObject);
var
  i : Integer;
  DnyEdit : TEdit;
begin
  try
    UniQueryMember.Close;
    UniQueryMember.SQL.Clear;
    UniQueryMember.SQL.Add('Select UserID from MasterUser');
   // UniQueryMember.SQL.Add('Where UPPER(LoginID) = '+#39+UpperCase((Sender as TEdit).Text)+#39);
   // 250305 김동휘 대소문자 구분하게 수정
    UniQueryMember.SQL.Add('Where BINARY_CHECKSUM(LoginID) = BINARY_CHECKSUM('''+(Sender as TEdit).Text+''') ');
    UniQueryMember.Open;

    if UniQueryMember.RecordCount > 0 then
    begin
      Showmessage('이미 가입된 아이디입니다');
      (Sender as TEdit).Text := MemberEnterID;
    end;

    for i := 0 to ListBoxMember.Items.Count - 2 do
    begin

      DnyEdit := FindComponent('DEditM1'+inttostr(i)) as TEdit;
      if DnyEdit.Tag <> (Sender as TEdit).Tag then
      begin
         // 250305 김동휘 수정
        if DnyEdit.Text = (Sender as TEdit).Text then
        begin
          Showmessage('등록중인 아이디입니다');
          (Sender as TEdit).Text := MemberEnterID;
          break;
        end;
//        if UpperCase(DnyEdit.Text) = UpperCase((Sender as TEdit).Text) then
//        begin
//          Showmessage('등록중인 아이디입니다');
//          (Sender as TEdit).Text := MemberEnterID;
//          break;
//        end;
      end;
    end;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.MemberSearch;
var
  DEdit : TEdit;
  DRectangle : TRectangle;
  DButton : TButton;
  PositionX : integer;
  i, FontSize : Integer;
begin
  try
    with UniQueryMember do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from MasterUser');
      SQL.Add('Where MasterID = '+MasterUserID.ToString);
      SQL.Add('And UserID <> MasterID');
      Open;
    end;
    FontSize := Round(ClientWidth / 30);

    ListBoxMember.Clear;
    for i := 0 to UniQueryMember.RecordCount - 1 do
    begin
      ListBoxMember.Items.Add('');
      ListBoxMember.ListItems[i].Height := 75;
      PositionX := 0;

      MemberID[i] := UniQueryMember.FieldByName('UserID').AsInteger;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleM1'+inttostr(i);
//      DRectangle.Fill.Color := $FF333333;                 
      DRectangle.Fill.Color := $FFFFFFFF;
      DRectangle.Parent := ListBoxMember.ListItems[i];
      DRectangle.Align := TAlignLayout.MostLeft;
      DRectangle.Width := RectangleMember1.Width;
      DRectangle.HitTest := False;
      PositionX := PositionX + Round(DRectangle.Width);
      DRectangle.Position.X := PositionX + 10;
      DEdit := TEdit.Create(Self);
      DEdit.Name := 'DEditM1'+inttostr(i);
      DEdit.Parent := DRectangle;
      DEdit.Text := UniQueryMember.FieldByName('LoginID').AsString;
      DEdit.TextSettings.Font.Size := FontSize;
      DEdit.TextSettings.HorzAlign := TTextAlign.Center;
      DEdit.OnEnter := MemberIDEditEnter;
      DEdit.OnExit := MemberIDEditExit;
      DEdit.Tag := i;
      DEdit.Align := TAlignLayout.Client;       
      DEdit.FontColor := $FFFFFFFF;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleM2'+inttostr(i);
//      DRectangle.Fill.Color := $FF333333;                 
      DRectangle.Fill.Color := $FFFFFFFF;
      DRectangle.Parent := ListBoxMember.ListItems[i];
      DRectangle.Align := TAlignLayout.Left;
      DRectangle.Width := RectangleMember2.Width;
      PositionX := PositionX + Round(DRectangle.Width);
      DRectangle.Position.X := PositionX + 10;
      DRectangle.HitTest := False;
      DEdit := TEdit.Create(Self);
      DEdit.Name := 'DEditM2'+inttostr(i);
      DEdit.Parent := DRectangle;
      DEdit.Text := UniQueryMember.FieldByName('Password').AsString;
      DEdit.TextSettings.Font.Size := FontSize;
      DEdit.TextSettings.HorzAlign := TTextAlign.Center;
      DEdit.Align := TAlignLayout.Client;      
      DEdit.FontColor := $FF000000;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleM3'+inttostr(i);
//      DRectangle.Fill.Color := $FF333333;                 
      DRectangle.Fill.Color := $FFFFFFFF;
      DRectangle.Parent := ListBoxMember.ListItems[i];
      DRectangle.Align := TAlignLayout.Right;
      DRectangle.Width := RectangleMember3.Width;
      PositionX := PositionX + Round(DRectangle.Width);
      DRectangle.Position.X := PositionX + 10;
      DRectangle.HitTest := False;
      DEdit := TEdit.Create(Self);         
      DEdit.Name := 'DEditM3'+inttostr(i);
      DEdit.Parent := DRectangle;                   
      DEdit.Text := UniQueryMember.FieldByName('Name').AsString;
      DEdit.TextSettings.Font.Size := FontSize;
      DEdit.TextSettings.HorzAlign := TTextAlign.Center;
      DEdit.Align := TAlignLayout.Client;       
      DEdit.FontColor := TColors.White;       
      DEdit.TextSettings.FontColor := TColors.White;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleM4'+inttostr(i);
      DRectangle.Fill.Color := $FFFFFFFF;
      DRectangle.Parent := ListBoxMember.ListItems[i];
      DRectangle.Align := TAlignLayout.MostRight;
      DRectangle.Width := RectangleMember4.Width;
      PositionX := PositionX + Round(DRectangle.Width);
      DRectangle.Position.X := PositionX + 10;
      DRectangle.HitTest := False;
      DButton := TButton.Create(Self);
      DButton.Name := 'DButtonM4'+inttostr(i);
      DButton.StyleLookup := 'trashtoolbutton';
      DButton.Parent := DRectangle;
      DButton.Align := TAlignLayout.Client;
      DButton.Width := RectangleMember4.Width;
      DButton.Tag := i;
      DButton.OnClick := DButtonMemberDelClick;

      UniQueryMember.Next;
    end;

    if ListBoxMember.Height > UniQueryMember.RecordCount * 50 then
    begin
      ListBoxMember.Items.Add('');
      ListBoxMember.ListItems[UniQueryMember.RecordCount].Height := ListBoxMember.Height - UniQueryMember.RecordCount * 50;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleBACK';
      DRectangle.Fill.Color := $FF333333;
      DRectangle.Parent := ListBoxMember.ListItems[UniQueryMember.RecordCount];
      DRectangle.Align := TAlignLayout.Client;
    end;
  except on e:exception do
    begin
      Showmessage(e.Message);
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
{$IFDEF ANDROID}
procedure TfDongHwa.OnReceiveNotificationEvent(Sender: TObject;
  const ServiceNotification: TPushServiceNotification);
begin
  MemoLog.Lines.Add('-----------------------------------------');
  MemoLog.Lines.Add('DataKey = ' + ServiceNotification.DataKey);
  MemoLog.Lines.Add('Json = ' + ServiceNotification.Json.ToString);
  MemoLog.Lines.Add('DataObject = ' +
  ServiceNotification.DataObject.ToString);
  MemoLog.Lines.Add('---------------------------------------');
end;

procedure TfDongHwa.OnServiceConnectionChange(Sender: TObject;
  PushChanges: TPushService.TChanges);
var
 PushService: TPushService;
begin
  PushService :=
  TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.FCM);
  if TPushService.TChange.DeviceToken in PushChanges then
  begin
    FDeviceToken :=
    PushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];
    MemoLog.Lines.Add('Firebase Token: ' + FDeviceToken);
    with UniQueryLog do begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from tb_user_info');
      SQL.Add('Where push_token = '+#39+FDeviceToken+#39);
      SQL.Add('And  user_id = '+#39+EditID.Text+#39);
      Open;

      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQl.Add('Insert into tb_user_info(user_id,push_token,reg_date)');
        SQL.Add('values('+#39+EditID.Text+#39+','+#39+FDeviceToken+#39);
        SQL.Add(',GetDate() )');
        Execute;
      end else
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update tb_user_info set user_id = '+#39+EditID.Text+#39);
        SQL.Add(', reg_date = GetDate()');
        SQL.Add('Where push_token = '+#39+FDeviceToken+#39);
        Execute;
      end;
      MemoLog.Lines.Add(SQL.Text);
    end;
    Log.d('Firebase device token: token=' + FDeviceToken);
  end;
   if (TPushService.TChange.Status in PushChanges) and
    (PushService.Status = TPushService.TStatus.StartupError) then
       MemoLog.Lines.Add('Error: ' + PushService.StartupError);
end;

procedure TfDongHwa.SetNotification(const aTitle, aMessage: string);
begin
var vNotifiCenter:= TNotificationCenter.Create(nil);
  try
    if vNotifiCenter.Supported then
    begin
      var LChannel := vNotifiCenter.CreateChannel('MyChannel', 'MyChannel', 'My Channel');
      try
        LChannel.Importance := TImportance.High;
        vNotifiCenter.CreateOrUpdateChannel(LChannel);
      finally
        LChannel.Free;
      end;
      var vNotification := vNotifiCenter.CreateNotification;
      try
        vNotification.AlertBody := aMessage;
        vNotification.Title := aTitle;
        vNotification.SoundName := TPath.Combine(TPath.GetDocumentsPath, 'alarm2.mp3');
        vNotification.EnableSound := true;
        vNotification.ChannelId := 'MyChannel';
        vNotifiCenter.PresentNotification(vNotification);
      finally
        vNotification.Free;
      end;
    end;
  finally
    vNotifiCenter.Free;
  end;
end;
{$ENDIF ANDROID}
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
  SelectKNumber := SelectKNumber + 1;
  if SelectKNumber > KOutCount then
  begin
    SelectKNumber := 1;
  end;
  SaveTimeDisplay;
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
  Pheight : Double;
begin
  FFontScale := 1.0;
   Pheight := ClientHeight;
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
  Pheight := self.ClientHeight - (PTop+Pbot);
  {$ENDIF ANDROID}

  TempSizePercent := 0.65;
  TempSize := Round(ClientWidth / 10);// * FFontScale);        8
  TempSetSize := Round(ClientWidth / 10);// * FFontScale);    10
  TitleSize := Round(ClientWidth / 16);// * FFontScale);      20
  MiddleSize := Round(ClientWidth / 20);// * FFontScale);     25
  LowSize := Round(ClientWidth / 22);// * FFontScale);        30
  MostLowSize := Round(ClientWidth / 35);// * FFontScale);    40

  CheckBoxPassword.TextSettings.Font.Size := LowSize;

  TextNote.TextSettings.Font.Size := LowSize;
  TextNote2.TextSettings.Font.Size := LowSize;
  TextNote3.TextSettings.Font.Size := LowSize;
  TextNote4.TextSettings.Font.Size := LowSize;
  TextNote5.TextSettings.Font.Size := LowSize;

  //메인
  TextMain.TextSettings.Font.Size := TitleSize;
  TextMainBottom.TextSettings.Font.Size := TitleSize;

  TextMain1Name.TextSettings.Font.Size := TitleSize;
  TextMain2Name.TextSettings.Font.Size := TitleSize;
  TextMain3Name.TextSettings.Font.Size := TitleSize;
  TextMain1Model.TextSettings.Font.Size := LowSize;
  TextMain2Model.TextSettings.Font.Size := LowSize;
  TextMain3Model.TextSettings.Font.Size := LowSize;

  TextMain1TempL.TextSettings.Font.Size := LowSize;
  TextMain2TempL.TextSettings.Font.Size := LowSize;
  TextMain3TempL.TextSettings.Font.Size := LowSize;

//  TextMain1Temp.TextSettings.Font.Size := TempSize;
//  TextMain2Temp.TextSettings.Font.Size := TempSize;
//  TextMain3Temp.TextSettings.Font.Size := TempSize;

  TextMain1TempR.TextSettings.Font.Size := LowSize;
  TextMain2TempR.TextSettings.Font.Size := LowSize;
  TextMain3TempR.TextSettings.Font.Size := LowSize;

  TextMain1SetTempL.TextSettings.Font.Size := LowSize;
  TextMain2SetTempL.TextSettings.Font.Size := LowSize;
  TextMain3SetTempL.TextSettings.Font.Size := LowSize;

//  TextMain1SetTemp.TextSettings.Font.Size := TempSetSize;
//  TextMain2SetTemp.TextSettings.Font.Size := TempSetSize;
//  TextMain3SetTemp.TextSettings.Font.Size := TempSetSize;

  if TextMain1SetTemp.Text = '연결끊김' then
  begin
    TextMain1SetTemp.TextSettings.Font.Size := LowSize;
    TextMain1Temp.TextSettings.Font.Size := LowSize;
  end
  else
  begin
    TextMain1Temp.TextSettings.Font.Size := TempSize;
    TextMain1SetTemp.TextSettings.Font.Size := TempSetSize;
  end;

  if TextMain2SetTemp.Text = '연결끊김' then
  begin
    TextMain2SetTemp.TextSettings.Font.Size := LowSize;
    TextMain2SetTemp.TextSettings.Font.Size := LowSize;
  end
  else
  begin
    TextMain2Temp.TextSettings.Font.Size := TempSize;
    TextMain2SetTemp.TextSettings.Font.Size := TempSetSize;
  end;
  if TextMain3SetTemp.Text = '연결끊김' then
  begin
    TextMain3SetTemp.TextSettings.Font.Size := LowSize;
    TextMain3SetTemp.TextSettings.Font.Size := LowSize ;
  end
  else
  begin
    TextMain3SetTemp.TextSettings.Font.Size := TempSetSize;
    TextMain3SetTemp.TextSettings.Font.Size := TempSetSize;
  end;


  TextMain1SetTempR.TextSettings.Font.Size := LowSize;
  TextMain2SetTempR.TextSettings.Font.Size := LowSize;
  TextMain3SetTempR.TextSettings.Font.Size := LowSize;

  TextMain1Set.TextSettings.Font.Size := MiddleSize;
  TextMain2Set.TextSettings.Font.Size := MiddleSize;
  TextMain3Set.TextSettings.Font.Size := MiddleSize;
  TextMain1SetSave.TextSettings.Font.Size := MiddleSize;
  TextMain2SetSave.TextSettings.Font.Size := MiddleSize;
  TextMain3SetSave.TextSettings.Font.Size := MiddleSize;

  TextMain1RTop.TextSettings.Font.Size := LowSize;
  TextMain1RTopC1.TextSettings.Font.Size := MostLowSize;
  TextMain1RTopC2.TextSettings.Font.Size := MostLowSize;
  TextMain1RTopC3.TextSettings.Font.Size := MostLowSize;
  TextMain1RTopC4.TextSettings.Font.Size := MostLowSize;
  TextMain1RTopC5.TextSettings.Font.Size := MostLowSize;
  TextMain2RTop.TextSettings.Font.Size := LowSize;
  TextMain2RTopC1.TextSettings.Font.Size := MostLowSize;
  TextMain2RTopC2.TextSettings.Font.Size := MostLowSize;
  TextMain2RTopC3.TextSettings.Font.Size := MostLowSize;
  TextMain2RTopC4.TextSettings.Font.Size := MostLowSize;
  TextMain2RTopC5.TextSettings.Font.Size := MostLowSize;
  TextMain3RTop.TextSettings.Font.Size := LowSize;
  TextMain3RTopC1.TextSettings.Font.Size := MostLowSize;
  TextMain3RTopC2.TextSettings.Font.Size := MostLowSize;
  TextMain3RTopC3.TextSettings.Font.Size := MostLowSize;
  TextMain3RTopC4.TextSettings.Font.Size := MostLowSize;
  TextMain3RTopC5.TextSettings.Font.Size := MostLowSize;

  TextMain1RClient.TextSettings.Font.Size := LowSize;
  TextMain1RClientC1.TextSettings.Font.Size := MostLowSize;
  TextMain1RClientC2.TextSettings.Font.Size := MostLowSize;
  TextMain1RClientC3.TextSettings.Font.Size := MostLowSize;
  TextMain1RClientC4.TextSettings.Font.Size := MostLowSize;
  TextMain1RClientC5.TextSettings.Font.Size := MostLowSize;
  TextMain2RClient.TextSettings.Font.Size := LowSize;
  TextMain2RClientC1.TextSettings.Font.Size := MostLowSize;
  TextMain2RClientC2.TextSettings.Font.Size := MostLowSize;
  TextMain2RClientC3.TextSettings.Font.Size := MostLowSize;
  TextMain2RClientC4.TextSettings.Font.Size := MostLowSize;
  TextMain2RClientC5.TextSettings.Font.Size := MostLowSize;
  TextMain3RClient.TextSettings.Font.Size := LowSize;
  TextMain3RClientC1.TextSettings.Font.Size := MostLowSize;
  TextMain3RClientC2.TextSettings.Font.Size := MostLowSize;
  TextMain3RClientC3.TextSettings.Font.Size := MostLowSize;
  TextMain3RClientC4.TextSettings.Font.Size := MostLowSize;
  TextMain3RClientC5.TextSettings.Font.Size := MostLowSize;

  //회원가입
  TextJoinWarning.TextSettings.Font.Size := MostLowSize;

  TextJoinID.TextSettings.Font.Size := LowSize;
  TextJoinPW.TextSettings.Font.Size := LowSize;
  TextJoinPW2.TextSettings.Font.Size := LowSize;
  TextJoinCompany.TextSettings.Font.Size := LowSize;

  LayoutJoin.Margins.Right := Pheight / 10;
  LayoutJoin.Margins.Left := Pheight / 10;

  LayoutJoin.Height := Pheight / 2;
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
  TextGraphTitle.TextSettings.Font.Size := TitleSize;
  TextGraphChange.TextSettings.Font.Size := MiddleSize;
  TextGraphDevice.TextSettings.Font.Size := TitleSize;
  EditGraphModel.TextSettings.Font.Size := TitleSize;

  RectangleGraphSaveTime.Width := LayoutGraphExpand.Width / 4;
  RectangleGraphExpand.Width := LayoutGraphExpand.Width / 2;
  TextSaveTime.Width := RectangleGraphSaveTime.Width / 3;

  TextSaveTime.Font.Size := MostLowSize;
  TextGraphSaveTimeTitle.Font.Size := MostLowSize;
  TextGraphSaveTimeValue.Font.Size := MostLowSize;

  ImageGraphPlus.Width := ImageGraphPlus.Height;
  ImageGraphMinus.Width := ImageGraphMinus.Height;
  TextGraphExpand.TextSettings.Font.Size := TitleSize;

  //상세
  TextDetailTitle.TextSettings.Font.Size := TitleSize;
  TextDetailSaveButton.TextSettings.Font.Size := TitleSize;
  TextDetailChange.TextSettings.Font.Size := MiddleSize;

  TextDetailModel.TextSettings.Font.Size := TitleSize;
  EditDetailName.TextSettings.Font.Size := TitleSize;
  TextEditDetailName.TextSettings.Font.Size := TitleSize;

  TextEditDetailTemp.TextSettings.Font.Size := TitleSize;
  EditDetailTemp.TextSettings.Font.Size := TitleSize;
  TextDetailTemp.TextSettings.Font.Size := TitleSize;
  TextEditDetailSetTemp.TextSettings.Font.Size := TitleSize;
  EditDetailSetTemp.TextSettings.Font.Size := TitleSize;
  TextDetailSetTemp.TextSettings.Font.Size := TitleSize;
  TextDetailSetTempEdit.TextSettings.Font.Size := TitleSize;

  TextDetailHigh.TextSettings.Font.Size := TitleSize - 1;
  TextDetailLow.TextSettings.Font.Size := TitleSize - 1;
  EditDetailHigh.TextSettings.Font.Size := TitleSize;
  EditDetailLow.TextSettings.Font.Size := TitleSize;
  TextEditDetailHigh.TextSettings.Font.Size := TitleSize;
  TextEditDetailLow.TextSettings.Font.Size := TitleSize;

  TextPW1.TextSettings.Font.Size := MiddleSize;
  TextPW2.TextSettings.Font.Size := MiddleSize;
  EditPW2.TextSettings.Font.Size := MiddleSize;
  ButtonPW.TextSettings.Font.Size := MiddleSize;
  RectanglePW.Height := 100 + EditPW2.Height;
  RectanglePW.Width := ClientWidth div 4 * 3;


  TextDetailIn.TextSettings.Font.Size := MiddleSize;

  TextDetailIn1.TextSettings.Font.Size := LowSize;
  TextDetailIn2.TextSettings.Font.Size := LowSize;
  TextDetailIn3.TextSettings.Font.Size := LowSize;
  TextDetailIn4.TextSettings.Font.Size := LowSize;
  TextDetailIn5.TextSettings.Font.Size := LowSize;
  EditDetailIn1.TextSettings.Font.Size := LowSize;
  EditDetailIn2.TextSettings.Font.Size := LowSize;
  EditDetailIn3.TextSettings.Font.Size := LowSize;
  EditDetailIn4.TextSettings.Font.Size := LowSize;
  EditDetailIn5.TextSettings.Font.Size := LowSize;
  TextEditDetailIn1.TextSettings.Font.Size := LowSize;
  TextEditDetailIn2.TextSettings.Font.Size := LowSize;
  TextEditDetailIn3.TextSettings.Font.Size := LowSize;
  TextEditDetailIn4.TextSettings.Font.Size := LowSize;
  TextEditDetailIn5.TextSettings.Font.Size := LowSize;

  TextDetailOut.TextSettings.Font.Size := MiddleSize;
  TextModelDetail.TextSettings.Font.Size := MiddleSize;

  TextDetailOut1.TextSettings.Font.Size := LowSize;
  TextDetailOut2.TextSettings.Font.Size := LowSize;
  TextDetailOut3.TextSettings.Font.Size := LowSize;
  TextDetailOut4.TextSettings.Font.Size := LowSize;
  TextDetailOut5.TextSettings.Font.Size := LowSize;
  EditDetailOut1.TextSettings.Font.Size := LowSize;
  EditDetailOut2.TextSettings.Font.Size := LowSize;
  EditDetailOut3.TextSettings.Font.Size := LowSize;
  EditDetailOut4.TextSettings.Font.Size := LowSize;
  EditDetailOut5.TextSettings.Font.Size := LowSize;
  TextEditDetailOut1.TextSettings.Font.Size := LowSize;
  TextEditDetailOut2.TextSettings.Font.Size := LowSize;
  TextEditDetailOut3.TextSettings.Font.Size := LowSize;
  TextEditDetailOut4.TextSettings.Font.Size := LowSize;
  TextEditDetailOut5.TextSettings.Font.Size := LowSize;

  //직원관리
  TextMemberTitle.TextSettings.Font.Size := TitleSize;
  TextNew.TextSettings.Font.Size := TitleSize;
  TextMember1.TextSettings.Font.Size := MiddleSize;
  TextMember2.TextSettings.Font.Size := MiddleSize;
  TextMember3.TextSettings.Font.Size := MiddleSize;
  RectangleMemberBack.Width := ClientWidth / 6;
  TextMemberBack.TextSettings.Font.Size := MiddleSize;
  RectangleMemberSave.Width := ClientWidth / 6;
  TextMemberSave.TextSettings.Font.Size := MiddleSize;

  //설정화면
  RectangleManage.Height := Pheight / 16;
  TextManageTitle.TextSettings.Font.Size := TitleSize;
  RectangleManageBack.Width := ClientWidth / 5;
  TextManageBack.TextSettings.Font.Size := MiddleSize;

  LayoutManage1.Height := Pheight / 7;
  LayoutManage2.Height := Pheight / 7;
  LayoutManage3.Height := Pheight / 7;
  LayoutManage4.Height := Pheight / 7;

  Text_delay.Height := LayoutManage4.Height /2;
  Label_delay.Width := Text_delay.Width /3;

  TextManage1.TextSettings.Font.Size := TitleSize;
  TextMember.TextSettings.Font.Size := TitleSize;
  TextAlarm.TextSettings.Font.Size := TitleSize;
  Text_delay.TextSettings.Font.Size := TitleSize;
  Label_delay.TextSettings.Font.Size := TitleSize;
  Edit_delay.TextSettings.Font.Size := TitleSize;

  // 단말기 등록 화면
  RectangleConnectTitle.Height := ClientHeight / 16;
  LayoutConnect1.Height := Pheight / 10;
  LayoutConnect1_1.Height := Pheight / 10;
//  LayoutConnect2.Height := ClientHeight / 3;
  LayoutConnect3.Height := Pheight / 5;
  LayoutConnect4.Height := Pheight / 7;
  LayoutWifiName.Height := LayoutConnect2.Height / 2;
  RectangleConnectBack.Width := ClientWidth / 5;
  TextConnectBack.TextSettings.Font.Size := MiddleSize;
  RectangleConnect2.Width := LayoutConnect2.Width / 5;
  TextWifiName.Width := LayoutConnect2.Width / 3;
  TextPassWord.Width := LayoutConnect2.Width / 3;
  TextConnectTitle.TextSettings.Font.Size := TitleSize;
  TextConnect1.TextSettings.Font.Size := LowSize;
  TextConnect2.TextSettings.Font.Size := LowSize;
  TextWifiName.TextSettings.Font.Size := LowSize;
  TextPassWord.TextSettings.Font.Size := LowSize;
  TextConnect3.TextSettings.Font.Size := TitleSize;
  TextConnect4.TextSettings.Font.Size := LowSize;
  Text_QrSearch.TextSettings.Font.Size := LowSize;
  Text_QR_Title.TextSettings.Font.Size := MiddleSize;

  // Tab Login
//  ImageJoin.Height := ClientHeight / 16;
//  ImageJoinBack.Width := ImageJoinBack.Height;
  LayoutLogin.Margins.Top := (Pheight / 5) + (Pheight / 8);
  LayoutLogin.Margins.Bottom := Pheight / 4 - 100;
  LayoutLogin.Margins.Right := Pheight / 13;
  LayoutLogin.Margins.Left := Pheight / 13;

  RectangleLogin.Height := LayoutLogin.Height / 7;
  RectangleJoin.Height := LayoutLogin.Height / 7;

//  TextNote.Position.Y := RectangleJoin.Position.Y + RectangleJoin.Height + 10;
//  TextNote2.Position.Y := TextNote.Position.Y + TextNote.Height + 10;

  // Tab Main1
  RectangleMain.Height := Pheight / 16;
  RectangleMainBottom.Height := Pheight / 16;

  RectangleMain1.Height := ( Pheight - TextMain.Height - LayoutMainBottom.Height ) / 3
                    - RectangleMain1.Margins.Top - RectangleMain1.Margins.Bottom;
  TextMain1Name.Height := RectangleMain1.Height / 4; // 단말기이름
  ImageMain1.Width := ImageMain1.Height;

  LayoutMain1Right.Width := RectangleMain1.Width / 3; // 입출력 색
  LayoutMain1RTop.Height := LayoutMain1Right.Height / 2; // 입력LayOut
  TextMain1RTop.Height := LayoutMain1RTop.Height / 3;
  LayoutMain1RTopC1.Width := LayoutMain1RTopC.Width / 5;
  LayoutMain1RTopC2.Width := LayoutMain1RTopC.Width / 5;
  LayoutMain1RTopC4.Width := LayoutMain1RTopC.Width / 5;
  LayoutMain1RTopC5.Width := LayoutMain1RTopC.Width / 5;

  TextMain1RClient.Height := LayoutMain1RClient.Height / 3; // 출력
  LayoutMain1RClientC1.Width := LayoutMain1RClientC.Width / 5;
  LayoutMain1RClientC2.Width := LayoutMain1RClientC.Width / 5;
  LayoutMain1RClientC4.Width := LayoutMain1RClientC.Width / 5;
  LayoutMain1RClientC5.Width := LayoutMain1RClientC.Width / 5;

  LayoutMain1Temp.Height := LayoutMain1Client.Height / 2;//3; // 현재온도
  TextMain1TempL.Width := ClientWidth / 6;
  TextMain1TempR.Width := ClientWidth / 21;

  RectangleMain1Set.Height := ( LayoutMain1Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain1Set.Height := ( LayoutMain1Client.Height / 3 ); // 설정Layout
  ImageMain1SetPlus.Width := LayoutMain1Set.Width / 3;
  ImageMain1SetMinus.Width := LayoutMain1Set.Width / 3;

//  TextMain1Temp.TextSettings.Font.Size := TextMain1Temp.Height * TempSizePercent;
//  TextMain1SetTemp.TextSettings.Font.Size := TextMain1SetTemp.Height * TempSizePercent;

  TextMain1SetTempL.Width := ClientWidth / 6; // 설정온도
  TextMain1SetTempR.Width := ClientWidth / 22;

  // Tab Main2
  RectangleMain2.Height := ( Pheight - TextMain.Height - LayoutMainBottom.Height ) / 3
                    - RectangleMain2.Margins.Top - RectangleMain2.Margins.Bottom;
  TextMain2Name.Height := RectangleMain2.Height / 4; // 단말기이름
  ImageMain2.Width := ImageMain2.Height;

  LayoutMain2Right.Width := RectangleMain2.Width / 3; // 입출력 색
  LayoutMain2RTop.Height := LayoutMain2Right.Height / 2; // 입력LayOut
  TextMain2RTop.Height := LayoutMain2RTop.Height / 3;
  LayoutMain2RTopC1.Width := LayoutMain2RTopC.Width / 5;
  LayoutMain2RTopC2.Width := LayoutMain2RTopC.Width / 5;
  LayoutMain2RTopC4.Width := LayoutMain2RTopC.Width / 5;
  LayoutMain2RTopC5.Width := LayoutMain2RTopC.Width / 5;

  TextMain2RClient.Height := LayoutMain2RClient.Height / 3; // 출력
  LayoutMain2RClientC1.Width := LayoutMain2RClientC.Width / 5;
  LayoutMain2RClientC2.Width := LayoutMain2RClientC.Width / 5;
  LayoutMain2RClientC4.Width := LayoutMain2RClientC.Width / 5;
  LayoutMain2RClientC5.Width := LayoutMain2RClientC.Width / 5;

  LayoutMain2Temp.Height := LayoutMain2Client.Height / 2;//3; // 현재온도
  TextMain2TempL.Width := ClientWidth / 6;
  TextMain2TempR.Width := ClientWidth / 23;

  RectangleMain2Set.Height := ( LayoutMain2Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain2Set.Height := ( LayoutMain2Client.Height / 3 ); // 설정Layout
  ImageMain2SetPlus.Width := LayoutMain2Set.Width / 3;
  ImageMain2SetMinus.Width := LayoutMain2Set.Width / 3;

  TextMain2SetTempL.Width := ClientWidth / 6; // 설정온도
  TextMain2SetTempR.Width := ClientWidth / 24;

//  TextMain2Temp.TextSettings.Font.Size := TextMain2Temp.Height * TempSizePercent;
//  TextMain2SetTemp.TextSettings.Font.Size := TextMain2SetTemp.Height * TempSizePercent;

  // Tab Main3
  RectangleMain3.Height := ( Pheight - TextMain.Height - LayoutMainBottom.Height ) / 3
                    - RectangleMain3.Margins.Top - RectangleMain3.Margins.Bottom;
  TextMain3Name.Height := RectangleMain3.Height / 4; // 단말기이름
  ImageMain3.Width := ImageMain3.Height;

  LayoutMain3Right.Width := RectangleMain3.Width / 3; // 입출력 색
  LayoutMain3RTop.Height := LayoutMain3Right.Height / 2; // 입력LayOut
  TextMain3RTop.Height := LayoutMain3RTop.Height / 3;
  LayoutMain3RTopC1.Width := LayoutMain3RTopC.Width / 5;
  LayoutMain3RTopC2.Width := LayoutMain3RTopC.Width / 5;
  LayoutMain3RTopC4.Width := LayoutMain3RTopC.Width / 5;
  LayoutMain3RTopC5.Width := LayoutMain3RTopC.Width / 5;

  TextMain3RClient.Height := LayoutMain3RClient.Height / 3; // 출력
  LayoutMain3RClientC1.Width := LayoutMain3RClientC.Width / 5;
  LayoutMain3RClientC2.Width := LayoutMain3RClientC.Width / 5;
  LayoutMain3RClientC4.Width := LayoutMain3RClientC.Width / 5;
  LayoutMain3RClientC5.Width := LayoutMain3RClientC.Width / 5;

  LayoutMain3Temp.Height := LayoutMain3Client.Height / 2;//3; // 현재온도
  TextMain3TempL.Width := ClientWidth / 6;
  TextMain3TempR.Width := ClientWidth / 25;

  RectangleMain3Set.Height := ( LayoutMain3Client.Height / 3 ) - 20; // 설정버튼
  LayoutMain3Set.Height := ( LayoutMain3Client.Height / 3 ); // 설정Layout
  ImageMain3SetPlus.Width := LayoutMain3Set.Width / 3;
  ImageMain3SetMinus.Width := LayoutMain3Set.Width / 3;

  TextMain3SetTempL.Width := ClientWidth / 6; // 설정온도
  TextMain3SetTempR.Width := ClientWidth / 26;

//  TextMain3Temp.TextSettings.Font.Size := TextMain3Temp.Height * TempSizePercent;
//  TextMain3SetTemp.TextSettings.Font.Size := TextMain3SetTemp.Height * TempSizePercent;

  // Detail Tap
  RectangleDetail.Height := Pheight / 16;
  TextDetailModel.Height := Pheight / 16;
  RectangleDetailChange.Width := ClientWidth / 5;
  ImageGraph.Width := ClientWidth / 5;


  ButtonDeviceDelete.Width := ButtonDeviceDelete.Height;
  ImageDetailAlarm.Width := ImageDetailAlarm.Height;
  ImageX.Width := ImageX.Height;

  RectangleDetailSaveButton.Height := ( ClientHeight - TextDetailTitle.Height ) / 42 * 3;
    RectangleDetailSaveButton.XRadius := RectangleDetailSaveButton.Width / 50;
    RectangleDetailSaveButton.YRadius := RectangleDetailSaveButton.Width / 50;
  RectangleDetailDevice.Height := ( ClientHeight - TextDetailTitle.Height ) / 21 * 7;
    RectangleDetailTemp.XRadius := Pheight / 27;
    RectangleDetailTemp.YRadius := Pheight / 27;
    RectangleDetailHigh.XRadius := Pheight / 80;
    RectangleDetailHigh.YRadius := Pheight / 80;
    RectangleDetailLow.XRadius := Pheight / 80;
    RectangleDetailLow.YRadius := Pheight / 80;
  LayoutDetailInOut.Height := ( Pheight - TextDetailTitle.Height ) / 21 * 8;
    RectangleDetailIn.XRadius := Pheight / 27;
    RectangleDetailIn.YRadius := Pheight / 27;
    RectangleDetailOut.XRadius := Pheight / 27;
    RectangleDetailOut.YRadius := Pheight / 27;
  LayoutDetailHighLow.Height := ( Pheight - TextDetailTitle.Height ) / 42 * 7;

  LayoutDetailTempClient.Margins.Left := LayoutDetailInOut.Width / 10;
  LayoutDetailTempClient.Margins.Right := LayoutDetailInOut.Width / 10;

  RectangleDetailHigh.Height := LayoutDetailHighLow.Height / 2 - 20;
  RectangleDetailHigh.Margins.Left := LayoutDetailHighLow.Width / 10;
  RectangleDetailHigh.Margins.Right := LayoutDetailHighLow.Width / 10;
  RectangleDetailLow.Margins.Left := LayoutDetailHighLow.Width / 10;
  RectangleDetailLow.Margins.Right := LayoutDetailHighLow.Width / 10;

  TextDetailHigh.Width := RectangleDetailHigh.Width / 2;
  TextDetailLow.Width := RectangleDetailLow.Width / 2;

  LayoutDetailTemp.Height := LayoutDetailTempClient.Height / 3;
  TextDetailTemp.Width := LayoutDetailTemp.Width / 2;
  TextDetailSetTemp.Width := LayoutDetailTemp.Width / 2;
  TextDetailSetTempEdit.Width := LayoutDetailTemp.Width / 2;
  LayoutDetailSetTemp.Height := LayoutDetailTempClient.Height / 3;

  ImageDetailPlus.Width := LayoutDetailSetTemp.Width / 3;
  ImageDetailPower.Width := LayoutDetailSetTemp.Width / 3;
  ImageDetailMinus.Width := LayoutDetailSetTemp.Width / 3;
  RectangleDefrost.Visible := False;
  TextDefrost.TextSettings.Font.Size := MiddleSize;
    RectangleDefrost.XRadius := ClientWidth / 50;
    RectangleDefrost.YRadius := ClientWidth / 50;
//  ButtonDefrost.Width := LayoutDetailTempClient.Width / 4;

  RectangleDetailIn.Height := LayoutDetailInOut.Height / 2 - 20;
  RectangleDetailIn.Margins.Left := LayoutDetailInOut.Width / 10;
  RectangleDetailIn.Margins.Right := LayoutDetailInOut.Width / 10;

  TextDetailIn.Height := LayoutDetailIn.Height / 3;
//  CircleDetailIn1.Height := LayoutDetailIn.Height / 6;
//  CircleDetailIn2.Height := LayoutDetailIn.Height / 6;
//  CircleDetailIn3.Height := LayoutDetailIn.Height / 6;
//  CircleDetailIn4.Height := LayoutDetailIn.Height / 6;
//  CircleDetailIn5.Height := LayoutDetailIn.Height / 6;
  LayoutDetailIn1.Width := LayoutDetailInClient.Width / 5;
  LayoutDetailIn2.Width := LayoutDetailInClient.Width / 5;
//  LayoutDetailIn3.Width := LayoutDetailInClient.Width / 5;
  LayoutDetailIn4.Width := LayoutDetailInClient.Width / 5;
  LayoutDetailIn5.Width := LayoutDetailInClient.Width / 5;

      TextDetailIn1.Height := LayoutDetailIn1.Height / 3;
      CircleDetailIn1.Height  := LayoutDetailIn1.Height / 3;
      TextDetailIn2.Height := LayoutDetailIn2.Height / 3;
      CircleDetailIn2.Height  := LayoutDetailIn2.Height / 3;
      TextDetailIn3.Height := LayoutDetailIn3.Height / 3;
      CircleDetailIn3.Height  := LayoutDetailIn3.Height / 3;
      TextDetailIn4.Height := LayoutDetailIn4.Height / 3;
      CircleDetailIn4.Height  := LayoutDetailIn4.Height / 3;
      TextDetailIn5.Height := LayoutDetailIn5.Height / 3;
      CircleDetailIn5.Height  := LayoutDetailIn5.Height / 3;


  RectangleDetailOut.Height := LayoutDetailInOut.Height / 2;
  RectangleDetailOut.Margins.Left := LayoutDetailInOut.Width / 10;
  RectangleDetailOut.Margins.Right := LayoutDetailInOut.Width / 10;
  TextDetailOut.Height := LayoutDetailOut.Height / 3;
//  CircleDetailOut1.Height := LayoutDetailOut.Height / 6;
//  CircleDetailOut2.Height := LayoutDetailOut.Height / 6;
//  CircleDetailOut3.Height := LayoutDetailOut.Height / 6;
//  CircleDetailOut4.Height := LayoutDetailOut.Height / 6;
//  CircleDetailOut5.Height := LayoutDetailOut.Height / 6;
  LayoutDetailOut1.Width := LayoutDetailOutClient.Width / 5;
  LayoutDetailOut2.Width := LayoutDetailOutClient.Width / 5;
//  LayoutDetailOut3.Width := LayoutDetailOutClient.Width / 5;
  LayoutDetailOut4.Width := LayoutDetailOutClient.Width / 5;
  LayoutDetailOut5.Width := LayoutDetailOutClient.Width / 5;

      TextDetailOut1.Height := LayoutDetailOut1.Height / 3;
      CircleDetailOut1.Height  := LayoutDetailOut1.Height / 3;
      TextDetailOut2.Height := LayoutDetailOut2.Height / 3;
      CircleDetailOut2.Height  := LayoutDetailOut2.Height / 3;
      TextDetailOut3.Height := LayoutDetailOut3.Height / 3;
      CircleDetailOut3.Height  := LayoutDetailOut3.Height / 3;
      TextDetailOut4.Height := LayoutDetailOut4.Height / 3;
      CircleDetailOut4.Height  := LayoutDetailOut4.Height / 3;
      TextDetailOut5.Height := LayoutDetailOut5.Height / 3;
      CircleDetailOut5.Height  := LayoutDetailOut5.Height / 3;

  // Member Tab
  TextMemberTitle.Height := Pheight / 16;
  RectangleNew.Height := Pheight / 16;
  RectangleMemberBack.Width := ClientWidth / 5;
  RectangleMemberSave.Width := ClientWidth / 5;
  RectangleMember1.Width := LayOutMember0.Width / 4;
  RectangleMember2.Width := LayOutMember0.Width / 4;
  RectangleMember3.Width := LayOutMember0.Width / 4;
  RectangleMember4.Width := LayOutMember0.Width / 4;

  // Graph
  RectangleGraphTitle.Height := Pheight / 16;
  TextGraphDevice.Height := Pheight / 16;
  LayoutGraphExpand.Height := Pheight / 16;
  RectangleGraphChange.Width := ClientWidth / 5;
  RectangleLandscapeSave.Width := ClientWidth / 3;
  RectangleLandscape.Width := ClientWidth / 4;
  RectangleGraphExpand.Height := LayoutGraphExpand.Height;

  RectangleGraph2.Height := Pheight / 16;
  LayoutGraph2Expand.Height := Pheight / 16;
  RectangleGraph2Expand.Height := LayoutGraph2Expand.Height;
  LayoutGraph.Height := Pheight / 4;
  LayoutGraph1.Height := Pheight / 8;
  LayoutGraph2.Height := Pheight / 8;
  ButtonGraphWeek.Width := LayoutGraph1.Width / 3 - 20;
  ButtonGraphSet.Width := LayoutGraph1.Width / 3 - 20;

  LayoutDateEditGraph1.Width := LayoutGraph1.Width / 3;
//  DateEditGraph1.Width := LayoutGraph1.Width / 3 - 20;
//  DateEditGraph2.Width := LayoutGraph1.Width / 3 - 20;
  ButtonGraphDateTime.Width := LayoutGraph1.Width / 3 - 20;

  ButtonGraphSave.Width := LayoutGraph2.Width / 2 - 20;
  ButtonGraphCSV.Width := LayoutGraph2.Width / 2 - 20;

  ImageGraphDetail.Width := ImageGraphDetail.Height;


  // 경보
  RectangleAlarmTitle.Height := Pheight / 16;
  ImageAlarmDetail.Width := ImageAlarmDetail.Height;
  TextAlarmTitle.TextSettings.Font.Size := TitleSize;
  TextAlarmDelete.TextSettings.Font.Size := MiddleSize;
  //QR
  Rectangle_QR.Width      := LayoutConnect1.Width /3.2;
  Rectangle_QRBack.Width  := LayoutConnect1.Width /3.2;
  Rectangle_QRImage.Width := LayoutConnect1.Width /3.2;

  btnStartCamera.Width    := ClientWidth/3.5;
   btnStopCamera.Width    := ClientWidth/3.5;

  Text_QrSearch.TextSettings.Font.Size := MiddleSize;
  Text_QrBack.TextSettings.Font.Size   := MiddleSize;
  Text_QRImage.TextSettings.Font.Size  := MiddleSize;

  btnStartCamera.TextSettings.Font.Size := MiddleSize;
   btnStopCamera.TextSettings.Font.Size := MiddleSize;

end;

procedure TfDongHwa.SaveTimeDisplay;
begin
  TextGraphSaveTimeTitle.Text := NameK[SelectKNumber];
  TextGraphSaveTimeValue.Text := FormatFloat('#,0h ',Round(SaveTimeK[SelectKNumber]) div 60) + FormatFloat('#,0m',Round(SaveTimeK[SelectKNumber]) mod 60);
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

procedure TfDongHwa.Series2GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: string);
begin
  if ValueIndex <> Current then MarkText:=''
  else MarkText := FormatDateTime('yy.m.dd hh:nn  ',Chart2.Series[0].XValue[ValueIndex]) + MarkText+'℃';
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
  ShowShareSheetAction1.Bitmap.Assign(Chart1.TeeCreateBitmap);
end;

procedure TfDongHwa.ShowShareSheetAction2BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction2.Bitmap.Assign(Chart2.TeeCreateBitmap);
end;

procedure TfDongHwa.TabControl1Change(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItemMain then
  begin
    MainRefresh;
  end;
end;

procedure TfDongHwa.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
   {$IFDEF ANDROID}
     ShowMessage('1');
  // QR 이미지 스캔
    if Assigned(Image) then
    begin
       ShowMessage('2');
      // 선택한 이미지를 TImage 컴포넌트에 할당
      imgCamera.Bitmap.Assign(Image);
        if Assigned(Image) then
        begin
           ShowMessage('3');
           StartScanning;
        end;
    end;
  {$ENDIF ANDROID}
end;

procedure TfDongHwa.StartScanning;  //이미지 qr 찾기
var
  {$IFDEF ANDROID}
  ScanResult: TReadResult;
  {$ENDIF ANDROID}
  QRText, SSID, Password: string;
begin
{$IFDEF ANDROID}
  if not Assigned(imgCamera.Bitmap) then
  begin
    ShowMessage('갤러리에서 이미지를 가져올 수 없습니다.');
    Exit;
  end;
  TTask.Run(
    procedure
    begin
      try
        // 스캔 작업 수행
        ScanResult := FScanManager.Scan(imgCamera.Bitmap);
        // 스캔 결과 처리
        if (ScanResult <> nil) and (ScanResult.Text <> '') then
        begin
          QRText := ScanResult.Text;
          if QRText.StartsWith('WIFI:') then
          begin
            SSID := ExtractWiFiInfo(QRText, 'S:');
            Password := ExtractWiFiInfo(QRText, 'P:');
            TThread.Synchronize(nil,
              procedure
              begin
                EdtWifiID2.Text := SSID;
                EdtWifiPW2.Text := Password;
                CameraComponent1.Active := False;
                imgCamera.Bitmap := nil;
                FScanInProgress := False;
                TabControl1.ActiveTab := TabItemConnect2;
                ShowMessage('Wifi : ' + SSID + #13#10 + 'Pass: ' + Password);
              end);
          end
          else
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                ShowMessage('Wifi QR 코드를 인식하지 못했습니다.');
              end);
          end;
        end
        else
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              ShowMessage('QR 코드를 인식하지 못했습니다.');
            end);
        end;
      except
        on E: Exception do
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              ShowMessage('스캔 중 에러 발생: ' + E.Message);
              StartScanning; // 예외 발생 시 재시도
            end);
        end;
      end;
    end);
      {$ENDIF ANDROID}
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

procedure TfDongHwa.Text6Click(Sender: TObject);

var ScreenService      : IFMXScreenService;
    ScreenOrientations : TScreenOrientations;
begin
  Expand := Expand2;
  GraphExpand;

  if Chart1.BottomAxis.Minimum > Chart2.BottomAxis.Maximum then
  begin
    Chart1.BottomAxis.Minimum := Chart2.BottomAxis.Minimum;
    Chart1.BottomAxis.Maximum := Chart2.BottomAxis.Maximum;
  end else
  begin
    Chart1.BottomAxis.Maximum := Chart2.BottomAxis.Maximum;
    Chart1.BottomAxis.Minimum := Chart2.BottomAxis.Minimum;
  end;

  if Chart1.LeftAxis.Minimum > Chart2.LeftAxis.Maximum then
  begin
    Chart1.LeftAxis.Minimum := Chart2.LeftAxis.Minimum;
    Chart1.LeftAxis.Maximum := Chart2.LeftAxis.Maximum;
  end else
  begin
    Chart1.LeftAxis.Maximum := Chart2.LeftAxis.Maximum;
    Chart1.LeftAxis.Minimum := Chart2.LeftAxis.Minimum;
  end;

  TabControl1.ActiveTab := TabItemGraph;

  {$IFDEF ANDROID}
    if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then begin
       ScreenOrientations := [ TScreenOrientation.Portrait ];

       ScreenService.SetSupportedScreenOrientations( ScreenOrientations );
    end;
  {$ENDIF ANDROID}
end;

procedure TfDongHwa.TextGraph2ExpandClick(Sender: TObject);
begin
  Expand2 := 1;
  GraphExpand2;
end;

procedure TfDongHwa.TextGraphChangeClick(Sender: TObject);
var ScreenService      : IFMXScreenService;
    ScreenOrientations : TScreenOrientations;
begin
  Expand2 := Expand;
  GraphExpand2;
  if Chart2.BottomAxis.Minimum > Chart1.BottomAxis.Maximum then
  begin
    Chart2.BottomAxis.Minimum := Chart1.BottomAxis.Minimum;
    Chart2.BottomAxis.Maximum := Chart1.BottomAxis.Maximum;
  end else
  begin
    Chart2.BottomAxis.Maximum := Chart1.BottomAxis.Maximum;
    Chart2.BottomAxis.Minimum := Chart1.BottomAxis.Minimum;
  end;

  if Chart2.LeftAxis.Minimum > Chart1.LeftAxis.Maximum then
  begin
    Chart2.LeftAxis.Minimum := Chart1.LeftAxis.Minimum;
    Chart2.LeftAxis.Maximum := Chart1.LeftAxis.Maximum;
  end else
  begin
    Chart2.LeftAxis.Maximum := Chart1.LeftAxis.Maximum;
    Chart2.LeftAxis.Minimum := Chart1.LeftAxis.Minimum;
  end;

  TabControl1.ActiveTab := TabItemGraph2;
  {$IFDEF ANDROID}
    if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then begin
       ScreenOrientations := [ TScreenOrientation.Landscape ];// soLandscape ];

       ScreenService.SetSupportedScreenOrientations( ScreenOrientations ); //SetScreenOrientation( ScreenOrientations );
    end;
  {$ENDIF ANDROID}
end;

procedure TfDongHwa.TextGraphExpandClick(Sender: TObject);
begin
  Expand := 1;
  GraphExpand;
end;

procedure TfDongHwa.TextAlarmClick(Sender: TObject);
var
  sPath : String;
  iFile : TIniFile;
begin
  try
    if Alarm = 0 then
    begin
      Alarm := 1;
      TextAlarm.Text := '경 보 알 림 ON';
    end else
    begin
      Alarm := 0;
      TextAlarm.Text := '경 보 알 림 OFF';
    end;

    UniQueryIOT.Close;
    UniQueryIOT.SQL.Clear;
    UniQueryIOT.SQL.Add('update ControllerInfo Set Alarm = '+Alarm.ToString);
    UniQueryIOT.SQL.Add('where MasterID = '+MasterUserID.ToString);
    UniQueryIOT.ExecSQL;

    sPath := TPath.Combine(TPath.GetDocumentsPath, 'Env.ini');
    iFile := TIniFile.Create(sPath);
    try
      iFile.WriteString('Alarm', 'G', Alarm.ToString);
    finally
      iFile.DisposeOf;
    end;
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.TextAlarmDeleteClick(Sender: TObject);
begin
  try
     MessageDlg('종료된 경보를 '+#13#10+'일괄 삭제하시겠습니까?'
      , System.UITypes.TMsgDlgType.mtInformation,
     [
       System.UITypes.TMsgDlgBtn.mbYes,
       System.UITypes.TMsgDlgBtn.mbNo
     ], 0,
     procedure (const AResult: TModalResult)
     begin
       if AResult = mrYes then
       begin
          with UniQueryDelete do
          begin
            Close;
            SQL.Clear;
            //SQL.Add('Update Alarm Set Alarm.ControllerID = Alarm.ControllerID * -1');
            SQL.Add('Update Alarm Set  DCHECK = ''Y'' ');         // 250911 김동휘 알람 삭제체크 수정
            SQL.Add('From ControllerInfo as C');
            SQL.Add('Where C.MasterID = '+MasterUserID.ToString);
            SQL.Add('And Alarm.ControllerID = C.ControllerID');
            SQL.Add('And ISNULL(EndTime, '''') <> ''''');
            //Execute;
            execsql;
          end;
         AlarmSearch;
       end;
     end
     );
  except on e:exception do
    begin
      Showmessage(e.Message);
    end;
  end;
end;

procedure TfDongHwa.TextConnectTitleClick(Sender: TObject);
var
  PathStr : String;
begin
//  PathStr := TPath.GetDownloadsPath+'/Log_'+FormatDateTime('yymmddhhnnss',Now)+'.txt';
//  Memo1.Lines.SaveToFile(PathStr);
//  Showmessage(PathStr);
//  TabControl1.ActiveTab := TabItemConnect;
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
    EditDetailFlag.SetFocus;

    TextEditDetailName.Visible := True;
    EditDetailName.Visible := False;
    EditDetailName.ReadOnly := True;
    EditDetailName.Text := EditDetailName.TextPrompt;
    TextEditDetailName.Text := EditDetailName.TextPrompt;

    TextEditDetailTemp.Visible := True;
    EditDetailTemp.Visible := False;
    EditDetailTemp.ReadOnly := True;
    EditDetailTemp.Text := EditDetailTemp.TextPrompt;
    TextEditDetailTemp.Text := EditDetailTemp.TextPrompt;

    TextEditDetailSetTemp.Visible := True;
    EditDetailSetTemp.Visible := False;
    EditDetailSetTemp.ReadOnly := True;
    EditDetailSetTemp.Text := EditDetailSetTemp.TextPrompt;
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
    EditDetailIn1.Text := EditDetailIn1.TextPrompt;
    TextEditDetailIn1.Text := EditDetailIn1.TextPrompt;

    EditDetailIn2.ReadOnly := True;
    EditDetailIn2.Text := EditDetailIn2.TextPrompt;
    TextEditDetailIn2.Text := EditDetailIn2.TextPrompt;

    EditDetailIn3.ReadOnly := True;
    EditDetailIn3.Text := EditDetailIn3.TextPrompt;
    TextEditDetailIn3.Text := EditDetailIn3.TextPrompt;

    EditDetailIn4.ReadOnly := True;
    EditDetailIn4.Text := EditDetailIn4.TextPrompt;
    TextEditDetailIn4.Text := EditDetailIn4.TextPrompt;

    EditDetailIn5.ReadOnly := True;
    EditDetailIn5.Text := EditDetailIn5.TextPrompt;
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
    EditDetailOut1.Text := EditDetailOut1.TextPrompt;
    TextEditDetailOut1.Text := EditDetailOut1.TextPrompt;

    EditDetailOut2.ReadOnly := True;
    EditDetailOut2.Text := EditDetailOut2.TextPrompt;
    TextEditDetailOut2.Text := EditDetailOut2.TextPrompt;

    EditDetailOut3.ReadOnly := True;
    EditDetailOut3.Text := EditDetailOut3.TextPrompt;
    TextEditDetailOut3.Text := EditDetailOut3.TextPrompt;

    EditDetailOut4.ReadOnly := True;
    EditDetailOut4.Text := EditDetailOut4.TextPrompt;
    TextEditDetailOut4.Text := EditDetailOut4.TextPrompt;

    EditDetailOut5.ReadOnly := True;
    EditDetailOut5.Text := EditDetailOut5.TextPrompt;
    TextEditDetailOut5.Text := EditDetailOut5.TextPrompt;

    TextDetailChange.Text := '설정변경';
    TextDetailSaveButton.Text := '상세정보창 나가기';
    ImageDetailPlus.Enabled := False;
    ImageDetailMinus.Enabled := False;
    ImageDetailPower.Enabled := False;
    RectangleDefrost.Enabled := False;
  end else
  begin
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
    TextDetailSaveButton.Text := '저장하고 나가기';
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
end;

procedure TfDongHwa.TextDetailSaveButtonClick(Sender: TObject);
var
  MessageStr : String;
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

    if TextDetailSaveButton.Text = '저장하고 나가기' then
    begin

      if TextDetailTemp.Text = 'OFF' then
      begin
        TabControl1.ActiveTab := TabItemMain;
        exit;
      end;

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
          TabControl1.ActiveTab := TabItemMain;

          if MessageStr <> '' then
          begin
            UniQueryIOT.Close;
            UniQueryIOT.SQL.Clear;
            UniQueryIOT.SQL.Add('Exec usp_Controller @Option = ''T'', @ControllerID = :ControllerID');
            UniQueryIOT.SQL.Add(', @SetTemp = :SetTemp');
            UniQueryIOT.ParamByName('ControllerID').AsInteger := DetailControllerID;
            UniQueryIOT.ParamByName('SetTemp').AsFloat := DetailSetTemp;
            UniQueryIOT.ExecSQL;

            Showmessage('온도설정값 변경 요청을 하였습니다.'+#13+'시간이 다소 소요될 수 있습니다');
          end;
        end;
      end
      );
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
end;

procedure TfDongHwa.TextMouseLeaveR(Sender: TObject);
begin
  ((Sender as TText).Parent as TRectangle).Opacity := 1;
end;

procedure TfDongHwa.TextMouseMoveR(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  ((Sender as TText).Parent as TRectangle).Opacity := 0.7;
end;

procedure TfDongHwa.TextNewClick(Sender: TObject);
var
  DRectangle : TRectangle;
  DEdit : TEdit;
  i, FontSize : Integer;
  PositionX : integer;
begin
  i := ListBoxMember.Items.Count - 1;
  ListBoxMember.Items.Delete(i);

  FontSize := 15;

      ListBoxMember.Items.Add('');
      ListBoxMember.ListItems[i].Height := 75;
      PositionX := 0;

      MemberID[i] := 0;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleM1'+inttostr(i);
//      DRectangle.Fill.Color := $FF333333;
      DRectangle.Fill.Color := $FFFFFFFF;
      DRectangle.Parent := ListBoxMember.ListItems[i];
      DRectangle.Align := TAlignLayout.MostLeft;
      DRectangle.Width := RectangleMember1.Width;
      DRectangle.HitTest := False;
      PositionX := PositionX + Round(DRectangle.Width);
      DRectangle.Position.X := PositionX + 10;
      DEdit := TEdit.Create(Self);
      DEdit.Name := 'DEditM1'+inttostr(i);
      DEdit.Parent := DRectangle;
      DEdit.Text := '';
      DEdit.TextSettings.Font.Size := FontSize;
      DEdit.TextSettings.FontColor := $FF000000;
      DEdit.TextSettings.HorzAlign := TTextAlign.Center;
      DEdit.OnEnter := MemberIDEditEnter;
      DEdit.OnExit := MemberIDEditExit;
      DEdit.Tag := i;
      DEdit.Align := TAlignLayout.Client;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectanglePM'+inttostr(i);
//      DRectangle.Fill.Color := $FF333333;
      DRectangle.Fill.Color := $FFFFFFFF;
      DRectangle.Parent := ListBoxMember.ListItems[i];
      DRectangle.Align := TAlignLayout.MostLeft;
      DRectangle.Width := RectangleMember1.Width;
      PositionX := PositionX + Round(DRectangle.Width);
      DRectangle.Position.X := PositionX + 10;
      DRectangle.HitTest := False;
      DEdit := TEdit.Create(Self);
      DEdit.Name := 'DEditM2'+inttostr(i);
      DEdit.Parent := DRectangle;
      DEdit.Text := '';
      DEdit.TextSettings.Font.Size := FontSize;
      DEdit.TextSettings.FontColor := $FFFFFFFF;
      DEdit.TextSettings.HorzAlign := TTextAlign.Center;
      DEdit.Align := TAlignLayout.Client;

      DRectangle := TRectangle.Create(Self);
      DRectangle.Name := 'DRectangleM3'+inttostr(i);
//      DRectangle.Fill.Color := $FF333333;                 
      DRectangle.Fill.Color := $FFFFFFFF;
      DRectangle.Parent := ListBoxMember.ListItems[i];
      DRectangle.Align := TAlignLayout.MostLeft;
      DRectangle.Width := RectangleMember1.Width;
      PositionX := PositionX + Round(DRectangle.Width);
      DRectangle.Position.X := PositionX + 10;
      DRectangle.HitTest := False;
      DEdit := TEdit.Create(Self);
      DEdit.Name := 'DEditM3'+inttostr(i);
      DEdit.Parent := DRectangle;
      DEdit.Text := '';
      DEdit.TextSettings.Font.Size := FontSize;
      DEdit.TextSettings.FontColor := $FF000000;
      DEdit.TextSettings.HorzAlign := TTextAlign.Center;
      DEdit.Align := TAlignLayout.Client;


  if ListBoxMember.Height > ListBoxMember.Items.Count * 50 then
  begin
    ListBoxMember.Items.Add('');
    ListBoxMember.ListItems[ListBoxMember.Items.Count - 1].Height := ListBoxMember.Height - UniQueryMember.RecordCount * 50;

    DRectangle := TRectangle.Create(Self);
    DRectangle.Name := 'DRectangleBACK';
    DRectangle.Fill.Color := $FF333333;
    DRectangle.Parent := ListBoxMember.ListItems[ListBoxMember.Items.Count - 1];
    DRectangle.Align := TAlignLayout.Client;
  end;
end;

procedure TfDongHwa.Text_delayClick(Sender: TObject);
begin
  LayoutManage1.Visible := false;
  LayoutManage2.Visible := false;
  LayoutManage3.Visible := false;
  Edit_delay.SetFocus;
end;

procedure TfDongHwa.Text_delayInputMouseEnter(Sender: TObject);
var
  Line: TRectangle;
begin
  Line := TRectangle.Create(Self);
  Line.Parent := Edit_delay;              // 밑줄은 Edit 밑에 붙이기
  Line.Align := TAlignLayout.Bottom; // 항상 아래
  Line.Height := 2;                  // 두께
  Line.Stroke.Kind := TBrushKind.None;
  Line.Fill.Color := TAlphaColorRec.Gray; // 기본 회색
end;

procedure TfDongHwa.Text_QRImageClick(Sender: TObject);
const
  PermissionReadMediaVisualUserSelected = 'android.permission.READ_MEDIA_VISUAL_USER_SELECTED';
  PermissionReadMediaImages = 'android.permission.READ_MEDIA_IMAGES';
  PermissionReadExternalStorage = 'android.permission.READ_EXTERNAL_STORAGE';
      {$IFDEF ANDROID}
var

    Permissions : TJavaObjectArray<JString>;
  AppEventSvc: IFMXApplicationEventService;
  PermissionGranted: Boolean;
  Intent: JIntent;
  RequestCode: Integer;


   Uri: Jnet_Uri;
  InputStream: JInputStream;
  Stream: TMemoryStream;
  Buffer: TJavaArray<Byte>;
  ReadCount: Integer;
  Bitmap: TBitmap;
   PermissionStatus: TPermissionStatus;
   {$ENDIF ANDROID}

begin
 // CameraComponent1.Active := False;
//  imgCamera.Bitmap := nil;
{$IFDEF ANDROID}
//  btnStartCameraClick(self);
////
 // TabControl1.ActiveTab := TabItemQR;
////
  CameraComponent1.Active := False;
  lblScanStatus.Text := '';
  frameTake := 0;
    if TPlatformServices.Current.SupportsPlatformService
    (IFMXApplicationEventService, IInterface(AppEventSvc)) then
    AppEventSvc.SetApplicationEventHandler(AppEvent);
    FScanManager := TScanManager.Create(TBarcodeFormat.Auto, nil);
//
//  CameraComponent1.Quality := FMX.Media.TVideoCaptureQuality.MediumQuality;
//  CameraComponent1.FocusMode := TFocusMode.AutoFocus;
  lblScanStatus.Text := '';
//  btnStartCameraClick(self);

 // Photo Picker를 사용하여 이미지 선택
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_PICK);
  Intent.setType(StringToJString('image/*'));
  TAndroidHelper.Activity.startActivityForResult(Intent, PICK_IMAGE_REQUEST_CODE);
  // 메시지 매니저로 Activity 결과를 수신하도록 등록
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessage);





//  if TOSVersion.Check(13) then // Android 6.0 이상인지 확인        FPermissionReadMediaImage
//  begin
//    if TAndroidHelper.Context.checkSelfPermission(StringToJString('android.permission.READ_MEDIA_IMAGES')) <>
//      TJPackageManager.JavaClass.PERMISSION_GRANTED then
//    begin
//      try
//        Permissions := TJavaObjectArray<JString>.Create(1);
//        Permissions.Items[0] := StringToJString('android.permission.READ_MEDIA_IMAGES');
//        // 권한 요청
//        TAndroidHelper.Activity.requestPermissions(Permissions, 1);
//      finally
//       Permissions.Free;
//      end;
//      // 반복적으로 권한 상태 확인
//      TThread.CreateAnonymousThread(
//        procedure
//        begin
//          var
//            Attempts := 0;
//          while (Attempts < 10) and
//                (TAndroidHelper.Context.checkSelfPermission(StringToJString('android.permission.READ_MEDIA_IMAGES')) <>
//                 TJPackageManager.JavaClass.PERMISSION_GRANTED) do
//          begin
//            Inc(Attempts);
//            TThread.Sleep(300); // 0.3초 지연 후 다시 확인
//          end;
//          // 권한이 허용된 경우 갤러리 실행
//          if TAndroidHelper.Context.checkSelfPermission(StringToJString('android.permission.READ_MEDIA_IMAGES')) =
//             TJPackageManager.JavaClass.PERMISSION_GRANTED then
//          begin
//            TThread.Synchronize(nil,
//              procedure
//              begin
//                TakePhotoFromLibraryAction1.Execute; // 갤러리 실행
//              end
//            );
//          end
//          else
//          begin
//            TThread.Synchronize(nil,
//              procedure
//              begin
//                ShowMessage('갤러리 접근 권한이 거부되었습니다.');
//              end
//            );
//          end;
//        end
//      ).Start;
//      Exit; // 권한 요청 후 종료
//    end;
//  end;
//  // 이미 권한이 허용된 경우 바로 갤러리 실행
//  TakePhotoFromLibraryAction1.Execute;
   {$ENDIF ANDROID}

end;

  {$IFDEF ANDROID}
procedure TfDongHwa.ProcessGalleryResult(Data: JIntent);
var

 Uri: Jnet_Uri;
  InputStream: JInputStream;

  MemoryStream: TMemoryStream;
  Bitmap: TBitmap;
  Buffer: TJavaArray<Byte>;
  ReadCount: Integer;
begin
// 선택된 이미지 데이터 처리
  if Data <> nil then
  begin
    Uri := Data.getData;
   // ShowMessage('1');
    if Uri <> nil then
    begin
    //   ShowMessage('2');
      InputStream := TAndroidHelper.Context.getContentResolver.openInputStream(Uri);
      if InputStream <> nil then
      begin
        MemoryStream := TMemoryStream.Create;
        try
          Buffer := TJavaArray<Byte>.Create(1024);
          repeat
            ReadCount := InputStream.read(Buffer, 0, Buffer.Length);
            if ReadCount > 0 then
              MemoryStream.Write(Buffer.Data^, ReadCount);
          until ReadCount <= 0;
          MemoryStream.Position := 0;
          Bitmap := TBitmap.Create;
          try
            Bitmap.LoadFromStream(MemoryStream);
            imgCamera.Bitmap.Assign(Bitmap); // TImage에 선택된 이미지 할당
            StartScanning;
          finally
            Bitmap.Free;
          end;
        finally
          MemoryStream.Free;
          Buffer.Free;
        end;
      end
      else
        ShowMessage('이미지를 가져오는 데 실패했습니다.');
    end
    else
      ShowMessage('유효하지 않은 URI입니다.');
  end;
end;

procedure TfDongHwa.HandleActivityMessage(const Sender: TObject; const M: TMessage);
var
  ResultMsg: TMessageResultNotification;
begin
  if M is TMessageResultNotification then
  begin
    ResultMsg := TMessageResultNotification(M);
    if ResultMsg.RequestCode = PICK_IMAGE_REQUEST_CODE then
    begin
      ProcessGalleryResult(ResultMsg.Value);
    end;
    // 메시지 매니저로부터 구독 해제
    TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, HandleActivityMessage);
  end;
end;

function TfDongHwa.TJavaInputStreamToStream(AInputStream: JInputStream): TStream;
var
  LBytes: TJavaArray<Byte>;
  LSize: Integer;
begin
  Result := TMemoryStream.Create;
  LBytes := TJavaArray<Byte>.Create(1024);
  try
    repeat
      LSize := AInputStream.read(LBytes);
      if LSize > 0 then
        Result.Write(LBytes.Data^, LSize);
    until LSize <= 0;
    Result.Position := 0; // 스트림의 처음으로 이동
  finally
    LBytes.Free;
  end;
end;
{$ENDIF ANDROID}
procedure TfDongHwa.Text_QrSearchClick(Sender: TObject);
{$IFDEF ANDROID}
var
  AppEventSvc: IFMXApplicationEventService;
{$ENDIF ANDROID}
begin
{$IFDEF ANDROID}
  imgCamera.Bitmap := nil;
  btnStartCameraClick(self);
  btnStopCamera.Text :='중지';
  TabControl1.ActiveTab := TabItemQR;
  lblScanStatus.Text := '';
  frameTake := 0;
    if TPlatformServices.Current.SupportsPlatformService
    (IFMXApplicationEventService, IInterface(AppEventSvc)) then
    AppEventSvc.SetApplicationEventHandler(AppEvent);
    FScanManager := TScanManager.Create(TBarcodeFormat.Auto, nil);

  CameraComponent1.Quality := FMX.Media.TVideoCaptureQuality.MediumQuality;
  CameraComponent1.FocusMode := TFocusMode.AutoFocus;
  lblScanStatus.Text := '';


  btnStartCameraClick(self);
   {$ENDIF ANDROID}
end;

procedure TfDongHwa.TextMainClick(Sender: TObject);
begin
//  TabControl1.ActiveTab := TabItemLogin;
end;

procedure TfDongHwa.TextManage1Click(Sender: TObject);
begin
  if MasterCheck then
  begin
    UniConnection1.Connected := False;
    ImageConnectBack.Bitmap := ImageBack1.Bitmap;
//    TabControl1.ActiveTab := TabItemConnect;
    TabControl1.ActiveTab := TabItemConnect2;
  end else
  begin
    Showmessage('관리자만 가능한 기능입니다');
  end;
end;

procedure TfDongHwa.TextManageBackClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItemMain;
end;

procedure TfDongHwa.TextMemberClick(Sender: TObject);
begin
  MemberSearch;
  TabControl1.ActiveTab := TabItemMember;
end;

procedure TfDongHwa.TextMemberSaveClick(Sender: TObject);
var
  i : Integer;
begin
  try
    UniQueryMember.Close;
    UniQueryMember.SQL.Clear;
    for i := 0 to ListBoxMember.Items.Count - 2 do
    begin
      if (FindComponent('DEditM1'+inttostr(i)) as TEdit).Text = '' then continue;

      // 아이디 유효성 검사: 영문 대소문자, 숫자만 허용, 한글 금지, 4~32자
      if not TRegEx.IsMatch((FindComponent('DEditM1'+inttostr(i)) as TEdit).Text, '^[a-zA-Z0-9]{4,32}$') then
      begin
        ShowMessage('아이디는 대소문자 구분, 한글 사용 금지, 4~32자여야 합니다.');
        Exit;
      end
      else if (FindComponent('DEditM2'+inttostr(i)) as TEdit).Text = '' then
      begin
        Showmessage('비밀번호가 입력되지 않았습니다');
        Exit;
      end
      // 비밀번호 유효성 검사: 영문 대소문자, 숫자, 특수문자 허용, 한글 금지, 4~32자
      else if not TRegEx.IsMatch((FindComponent('DEditM2'+inttostr(i)) as TEdit).Text, '^[a-zA-Z0-9!@#$%^&*()_+\-=]{4,32}$') then
      begin
        ShowMessage('비밀번호는 한글 사용 금지, 4~32자여야 합니다.');
        Exit;
      end;

      if MemberID[i] <= 0 then
      begin
        UniQueryMember.SQL.Add('Insert Into MasterUser(MasterID, LoginID, Password,');
        UniQueryMember.SQL.Add('Name, Position, IsUsable, WritingDateTime)');
        UniQueryMember.SQL.Add('Values('+MasterUserID.ToString+',');
        UniQueryMember.SQL.Add(#39+(FindComponent('DEditM1'+inttostr(i)) as TEdit).Text+#39+',');
        UniQueryMember.SQL.Add(#39+(FindComponent('DEditM2'+inttostr(i)) as TEdit).Text+#39+',');
        UniQueryMember.SQL.Add(#39+(FindComponent('DEditM3'+inttostr(i)) as TEdit).Text+#39+',');
        UniQueryMember.SQL.Add('''직원'',0,GETDATE() ) ');
      end else
      begin
        UniQueryMember.SQL.Add('Update MasterUser Set ModifiedDateTime = GETDATE()');
        UniQueryMember.SQL.Add(', LoginID = '+#39+(FindComponent('DEditM1'+inttostr(i)) as TEdit).Text+#39);
        UniQueryMember.SQL.Add(', Password = '+#39+(FindComponent('DEditM2'+inttostr(i)) as TEdit).Text+#39);
        UniQueryMember.SQL.Add(', Name = '+#39+(FindComponent('DEditM3'+inttostr(i)) as TEdit).Text+#39);
        UniQueryMember.SQL.Add('Where UserID = '+MemberID[i].ToString);
      end;
    end;
    UniQueryMember.Execute;              
//    Showmessage(UniQueryMember.SQL.Text);

    MemberSearch;
    Showmessage('저장되었습니다');
  except on e : Exception do
    begin
      Showmessage(e.Message);
    end;
  end;
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

procedure TfDongHwa.TimerConnectionCloseTimer(Sender: TObject);
begin
  TimerConnectionClose.Enabled := False;
  TWaitDialog.Show('연결을 해제중입니다.'+#13+'잠시만 기다려주십시오');
  Memo1.Lines.Add('디바이스 연결을 해제중입니다.'+'잠시만 기다려주십시오');
  {
  Wait(ThreadNumber, procedure()
      begin
        try
          if idThreadComponent.Active then
          begin
            idThreadComponent.Active := False;
            FreeAndNil(IdThreadComponent);
          end;
          if IdTCPClient.Connected then
          begin
            IdTCPClient.Disconnect;
            FreeAndNil(IdTCPClient);
          end;
          Memo1.Lines.Add('Free TCP');
          TWaitDialog.Show('디바이스 연결을 '+#13#10+'해제하였습니다.');
          Memo1.Lines.Add('디바이스 연결을 해제하였습니다.');
          TWaitDialog.Hide;
          TimerLoadingOut.Enabled := False;
        except
          on E: Exception do begin
            Memo1.Lines.Add('Close ERROR! ' + E.Message);
            TWaitDialog.Hide;
            TimerLoadingOut.Enabled := False;
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
          begin
            try
              if idThreadComponent.Active then
              begin
                idThreadComponent.Active := False;
                FreeAndNil(IdThreadComponent);
              end;
              if IdTCPClient.Connected then
              begin
                IdTCPClient.Disconnect;
                FreeAndNil(IdTCPClient);
              end;
              Memo1.Lines.Add('Free TCP');
              TWaitDialog.Show('디바이스 연결을 '+#13+'해제하였습니다.');
              Memo1.Lines.Add('디바이스 연결을 해제하였습니다.');
              Application.ProcessMessages;
              if (not TimerPlusOkPre.Enabled) and (not TimerPlusOk.Enabled) then
              begin
                TWaitDialog.Hide;
              end else
              begin
                TWaitDialog.Show('디바이스를 계정에 '+#13+'등록중입니다.');
                Memo1.Lines.Add('디바이스를 계정에 등록중입니다.');
              end;
              TimerLoadingOut.Enabled := False;
            except
              on E: Exception do begin
                Memo1.Lines.Add('Close ERROR! ' + E.Message);
                TWaitDialog.Hide;
                TimerLoadingOut.Enabled := False;
              end;
            end;
          end);
      finally

      end;
    end).Start();
end;

procedure TfDongHwa.TimerConnectOKTimer(Sender: TObject);
begin
  TimerConnectOK.Enabled := False;
  ControllerAllSearch;
  TabControl1.ActiveTab := TabItemMain;
  TWaitDialog.Hide;
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

procedure TfDongHwa.TimerCTimer(Sender: TObject);
begin
  TimerC.Enabled := False;
  {
  Wait(ThreadNumber, procedure()
      var
        sCommand: AnsiString;
      begin
        if not IdTCPClient.Connected then Exit;
        TWaitDialog.Show('서버에 등록중입니다.');
        Memo1.Lines.Add('서버에 등록중입니다.');
        try
          SendMod := 2;
          ReadData := '';
      // "211.205.9.2",15337   [ . = 2E  / , = 2C / " = 22 ]
          sCommand :=  AnsiChar(#$22) + AnsiChar(#$32) + AnsiChar(#$31) + AnsiChar(#$31) + AnsiChar(#$2E)
                        + AnsiChar(#$32) + AnsiChar(#$30) + AnsiChar(#$35) + AnsiChar(#$2E) + AnsiChar(#$39) + AnsiChar(#$2E) + AnsiChar(#$32) + AnsiChar(#$22)
                        + AnsiChar(#$2C) + AnsiChar(#$31) + AnsiChar(#$35) + AnsiChar(#$33) + AnsiChar(#$33) + AnsiChar(#$37) + AnsiChar(#$03);
          sCommand := AnsiChar(#$14) + AnsiChar(#$0C) + sCommand + Chr(BccCalculator(sCommand,1));
          IdTCPClient.IOHandler.WriteLn(AnsiChar(#$02) + sCommand);
          Memo1.Lines.Add('Send : '+sCommand);
        except on e : exception do
          begin
            Memo1.Lines.Add(e.Message);
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
            sCommand: AnsiString;
          begin
            if not IdTCPClient.Connected then Exit;
            TWaitDialog.Show('서버에 등록중입니다.');
            Memo1.Lines.Add('서버에 등록중입니다.');
            try
              SendMod := 2;
              ReadData := '';                                                                  {
          // "211.205.9.2",15337   [ . = 2E  / , = 2C / " = 22 ]    ==> 19개 + 1 = 20 ==> Hex : 14
              sCommand :=  AnsiChar(#$22)
                            + AnsiChar(#$32) + AnsiChar(#$31) + AnsiChar(#$31) + AnsiChar(#$2E)
                            + AnsiChar(#$32) + AnsiChar(#$30) + AnsiChar(#$35) + AnsiChar(#$2E)
                            + AnsiChar(#$39) + AnsiChar(#$2E) + AnsiChar(#$32) + AnsiChar(#$22)
                            + AnsiChar(#$2C) + AnsiChar(#$31) + AnsiChar(#$35)
                            + AnsiChar(#$33) + AnsiChar(#$33) + AnsiChar(#$37) + AnsiChar(#$03);
              sCommand := AnsiChar(#$14) + AnsiChar(#$0C) + sCommand + Chr(BccCalculator(sCommand,1));

          // "ftp.coderun.co.kr",15337  ==> 25개 + 1 = 26 ==> Hex : 1A    안됨..?       // "coderun.co.kr",15337 ==> 21 + 1 = 22  ==> Hex : 16
              sCommand :=  AnsiChar(#$22)
                         //   + AnsiChar(#$66) + AnsiChar(#$74) + AnsiChar(#$70) + AnsiChar(#$2E) // ftp.
                            + AnsiChar(#$63) + AnsiChar(#$6F) + AnsiChar(#$64) + AnsiChar(#$65)
                            + AnsiChar(#$72) + AnsiChar(#$75) + AnsiChar(#$6E) + AnsiChar(#$2E) // coderun.
                            + AnsiChar(#$63) + AnsiChar(#$6F) + AnsiChar(#$2E) // co.
                            + AnsiChar(#$6B) + AnsiChar(#$72) + AnsiChar(#$22) // kr"
                            + AnsiChar(#$2C) + AnsiChar(#$31) + AnsiChar(#$35)
                            + AnsiChar(#$33) + AnsiChar(#$33) + AnsiChar(#$37) + AnsiChar(#$03); // ,15337

          // "sycode.co.kr",15337  ==> 20개 + 1 = 21 ==> Hex : 15
              sCommand :=  AnsiChar(#$22)
                            + AnsiChar(#$73) + AnsiChar(#$79) + AnsiChar(#$63) + AnsiChar(#$6F)
                            + AnsiChar(#$64) + AnsiChar(#$65) + AnsiChar(#$2E) // sycode.
                            + AnsiChar(#$63) + AnsiChar(#$6F) + AnsiChar(#$2E) // co.
                            + AnsiChar(#$6B) + AnsiChar(#$72) + AnsiChar(#$22) // kr"
                            + AnsiChar(#$2C) + AnsiChar(#$31) + AnsiChar(#$35)
                            + AnsiChar(#$33) + AnsiChar(#$33) + AnsiChar(#$37) + AnsiChar(#$03); // ,15337  }
          // "db.dhesys.kr",15337  ==> 20개 + 1 = 21 ==> Hex : 15
              sCommand :=  AnsiChar(#$22)   //"
                            + AnsiChar(#$64) + AnsiChar(#$62) + AnsiChar(#$2E) // db.
                            + AnsiChar(#$64) + AnsiChar(#$68) + AnsiChar(#$65) + AnsiChar(#$73) + AnsiChar(#$79) + AnsiChar(#$73) + AnsiChar(#$2E) // dhesys.
                            + AnsiChar(#$6B) + AnsiChar(#$72) + AnsiChar(#$22) // kr"
                            + AnsiChar(#$2C) + AnsiChar(#$31) + AnsiChar(#$35)
                            + AnsiChar(#$33) + AnsiChar(#$33) + AnsiChar(#$37) + AnsiChar(#$03); // ,15337

              sCommand := AnsiChar(#$15) + AnsiChar(#$0C) + sCommand + Chr(BccCalculator(sCommand,1));
              IdTCPClient.IOHandler.WriteLn(AnsiChar(#$02) + sCommand);
              Memo1.Lines.Add('Send : '+sCommand);
            except on e : exception do
              begin
                Memo1.Lines.Add(e.Message);
              end;
            end;
          end);
      finally

      end;
    end).Start();
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

procedure TfDongHwa.TimerLoadingOutTimer(Sender: TObject);
begin
  TimerLoadingOut.Enabled := False;
  if not TimerConnectionClose.Enabled then TimerConnectionClose.Enabled := True;
end;

procedure TfDongHwa.TimerMouseDownTimer(Sender: TObject);
begin
  TimerMouseDown.Enabled := False;
  if not MasterCheck then Exit;
  
  if MouseDownCheck then
  begin
    if (MouseDownY >= RectangleMain1.Position.Y) and
      (MouseDownY <= RectangleMain1.Position.Y + RectangleMain1.Height) then
    begin
      DetailRectangleClick(RectangleMain1);
    end else if (MouseDownY >= RectangleMain2.Position.Y) and
      (MouseDownY <= RectangleMain2.Position.Y + RectangleMain2.Height) then
    begin
      DetailRectangleClick(RectangleMain2);
    end else if (MouseDownY >= RectangleMain3.Position.Y) and
      (MouseDownY <= RectangleMain3.Position.Y + RectangleMain3.Height) then
    begin
      DetailRectangleClick(RectangleMain3);
    end;
  end;
end;

procedure TfDongHwa.TimerPlusOkPreTimer(Sender: TObject);
begin
  TimerPlusOkPre.Enabled := False;
  TWaitDialog.Show('디바이스를 계정에 '+#13+'등록중입니다.');
  Memo1.Lines.Add('디바이스를 계정에 등록중입니다.');
  Application.ProcessMessages;
  TimerPlusOk.Enabled := True;
end;

procedure TfDongHwa.TimerPlusOkTimer(Sender: TObject);
begin
  TimerPlusOk.Enabled := False;
  {
  Wait(ThreadNumber, procedure()
      begin
        try
          With UniQueryPlus do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Exec usp_Controller @Option = ''F'', @MasterID = :MasterID, @Serial= :Serial');
            ParamByName('MasterID').AsInteger := MasterUserID;
            ParamByName('Serial').AsString := Copy(Trim(SerialNo),1,12);
            ExecSQL;
            ControllerAllSearch;
          end;
          TabControl1.ActiveTab := TabItemMain;
          TWaitDialog.Hide;
        except on e : exception do
          begin
            Memo1.Lines.Add('Plus : '+e.Message);
            TimerPlusOk.Enabled := True;
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
          begin
            try
              UniConnection1.Connected := True;
              if UniConnection1.Connected then
              begin
                With UniQueryPlus do
                begin
                  // 241230 김동휘 다른계정에 등록되있을경우 알람보내게 추가
                  Close;
                  SQL.Clear;
                  sql.add(' select push_token, t.user_id, c1.ControllerName, getdate() as da from tb_user_info  as t	');
                  sql.add(' left join MasterUser as m1											      	');
                  sql.add(' on t.user_id = m1.LoginID												      	');
                  sql.add(' left join ControllerInfo as c1										    	');
                  sql.add(' on c1.MasterID = m1.MasterID											    	');
                  sql.add(' where trim(c1.Serial) =trim(:Serial) and m1.MasterID != :MasterID	');
                  sql.add(' group by push_token,t.user_id, c1.ControllerName			 	');
                  ParamByName('MasterID').AsInteger := MasterUserID;
                  ParamByName('Serial').AsString := Copy(Trim(SerialNo),1,12);
                  open;

                  if RecordCount > 0 then
                  begin
                    for var I := 0 to RecordCount -1 do
                    begin
                      UniQueryUpdateAlarm.close;
                      UniQueryUpdateAlarm.sql.Clear;
                      UniQueryUpdateAlarm.SQL.Add('Insert Into PushData(Token, Title, Msg, InsertTime)');
                      UniQueryUpdateAlarm.SQL.Add('Values (:Token, :Title, :Msg, getdate() )        ');
                      UniQueryUpdateAlarm.ParamByName('Token').AsString        := FieldByName('push_token').AsString;
                      UniQueryUpdateAlarm.ParamByName('Title').AsString        := '['+FieldByName('user_id').AsString+'] : '+ FieldByName('ControllerName').AsString;
                      UniQueryUpdateAlarm.ParamByName('Msg').AsString          := '단말기가 삭제되었습니다.';
                      UniQueryUpdateAlarm.ExecSQL;
                      next;
                    end;
                  end;


                  Close;
                  SQL.Clear;
                  SQL.Add('Exec usp_Controller @Option = ''F'', @MasterID = :MasterID, @Serial= :Serial');
                  ParamByName('MasterID').AsInteger := MasterUserID;
                  ParamByName('Serial').AsString := Copy(Trim(SerialNo),1,12);
                  ExecSQL;
                  Memo1.Lines.Add('디바이스를 계정에 등록 완료하였습니다.');
                  TimerConnectOK.Enabled := True;
                end;
              end else
              begin
                TimerPlusOk.Enabled := True;
              end;
            except on e : exception do
              begin
                Memo1.Lines.Add('Plus : '+e.Message);
                TimerPlusOk.Enabled := True;
              end;
            end;
          end);
      finally

      end;
    end).Start();
end;

procedure TfDongHwa.TimerSerialCheckTimer(Sender: TObject);
begin
  TimerSerialCheck.Enabled := False;
  {
  Wait(ThreadNumber, procedure()
      begin

        try
          TWaitDialog.Show('디바이스 정보를 '+#13#10+'확인중입니다');
          Memo1.Lines.Add('디바이스 정보를 확인중입니다');
          if Length(Trim(SerialNo)) > 0 then
          begin
            SerialCheck := False;
            TimerWifiSend.Enabled := True;
          end else
          begin
            TWaitDialog.Show('등록되지 않은 '+#13#10+'디바이스입니다.');
            Memo1.Lines.Add('등록되지 않은 디바이스입니다.');
            TimerConnectionClose.Enabled := True;
          end;
        except on e : exception do
          Memo1.Lines.Add('Serial Check : '+e.Message);
        end;
      end);
 }

  TThread.CreateAnonymousThread(
    procedure
    begin
      try
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            try
              TWaitDialog.Show('디바이스 정보를 '+#13+'확인중입니다');
              Memo1.Lines.Add('디바이스 정보를 확인중입니다');
              if Length(Trim(SerialNo)) > 0 then
              begin
                SerialCheck := False;
                TimerWifiSend.Enabled := True;
              end else
              begin
                TWaitDialog.Show('등록되지 않은 '+#13+'디바이스입니다.');
                Memo1.Lines.Add('등록되지 않은 디바이스입니다.');
                TimerConnectionClose.Enabled := True;
              end;
            except on e : exception do
              Memo1.Lines.Add('Serial Check : '+e.Message);
            end;
          end);
      finally

      end;
    end).Start();
end;

procedure TfDongHwa.TimerSerialTimer(Sender: TObject);
begin
  TimerSerial.Enabled := False;
  {
  Wait(ThreadNumber, procedure()
        var
          sCommand: AnsiString;
        begin
          try
            if not IdTCPClient.Connected then Exit;
            TWaitDialog.Show('디바이스에 연결중입니다.');
            Memo1.Lines.Add('디바이스 연결중입니다.');
            SerialCheck := True;
            SerialNo := '';                     // 시리얼 번호 요청
            sCommand := (AnsiChar(#$01)+AnsiChar(#$1A)+AnsiChar(#$03)+AnsiChar(#$1A));
            sCommand := AnsiChar(#$02) + sCommand + Chr(BccCalculator(sCommand,1));
            IdTCPClient.IOHandler.WriteLn(sCommand);
            TimerSerialCheck.Enabled := True;
          except on e : exception do
            Memo1.Lines.Add('Serial : '+e.Message);
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
            sCommand: AnsiString;
          begin
            try
              if not IdTCPClient.Connected then Exit;
              TWaitDialog.Show('디바이스에 연결중입니다.');
              Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now));
              Memo1.Lines.Add('디바이스 연결중입니다.');
              SerialCheck := True;
              SerialNo := '';                     // 시리얼 번호 요청
              sCommand := (AnsiChar(#$01)+AnsiChar(#$1A)+AnsiChar(#$03)+AnsiChar(#$1A));
              sCommand := AnsiChar(#$02) + sCommand + Chr(BccCalculator(sCommand,1));
              IdTCPClient.IOHandler.WriteLn(sCommand);
              TimerSerialCheck.Enabled := True;
            except on e : exception do
              Memo1.Lines.Add('Serial : '+e.Message);
            end;
          end);
      finally

      end;
    end).Start();
end;

procedure TfDongHwa.TimerTempCheckTimer(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItemMain then
  begin       {
    TThread.Queue(TThread.CurrentThread,
      procedure
      begin
        try
          MainRefresh;
        except on e:Exception do
          showmessage(e.Message);
        end;
      end);    }
    {
    Wait(ThreadNumber, procedure()
      begin
        try
          MainRefresh;
        except on e:Exception do
          showmessage(e.Message);
        end;
      end);
    }

//    TThread.CreateAnonymousThread(
//      procedure
//      begin
//        try
//          TThread.Synchronize(TThread.CurrentThread,
//            procedure
//            begin
//              try
//                if UniConnection1.Connected then
//                begin
//                  MainRefresh;
//                end;
//              except on e:Exception do
//                showmessage(e.Message);
//              end;
//            end);
//        finally
//
//        end;
//      end).Start();

    try
      if UniConnection1.Connected then
      begin
        MainRefresh;
      end;
    except on e:Exception do
      showmessage(e.Message);
    end;

  end;
end;

procedure TfDongHwa.TimerWifiSendTimer(Sender: TObject);
begin
  TimerWifiSend.Enabled := False;
  {
  Wait(ThreadNumber, procedure()
          var
            i : integer;
            TempStr : String;
            PlusStr : String;
            sCommand: AnsiString;
            BCCStr : String;
            PlusLength : Integer;
          begin
            try
              if not IdTCPClient.Connected then Exit;
              TWaitDialog.Show('Wifi 정보를 '+#13#10+'전송중입니다.');
              Memo1.Lines.Add('Wifi 정보를 전송중입니다.');
              // ID          [ " = #34 / x22 ]
          //    TempStr := #34 + EdtWifiID.Text + #34;
              TempStr := #34 + EdtWifiID2.Text + #34;
              PlusStr := '';
              for i := 1 to Length(TempStr) do
              begin
                PlusStr := PlusStr + IntToHex(Ord(TempStr[i]),2) + ' ' ;
                sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+IntToHex(Ord(TempStr[i]),2))));
              end;

              PlusStr := PlusStr + IntToHex(Ord(','),2) + ' ' ;
              sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+IntToHex(Ord(','),2))));

              // PW
          //    TempStr := #34 + EdtWifiPW.Text + #34;
              TempStr := #34 + EdtWifiPW2.Text + #34;
              for i := 1 to Length(TempStr) do
              begin
                PlusStr := PlusStr + IntToHex(Ord(TempStr[i]),2) + ' ' ;
                sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+IntToHex(Ord(TempStr[i]),2))));
              end;

          //    PlusLength := Length(#34 +EdtWifiID.Text + #34 + ',' + #34 +EdtWifiPW.Text+ #34);
              PlusLength := Length(#34 +EdtWifiID2.Text + #34 + ',' + #34 +EdtWifiPW2.Text+ #34);

              ReadData := '';
              SendMod := 1;
              sCommand := AnsiChar(Chr(StrToInt('0x'+IntToHex(PlusLength+1,2))))+ AnsiChar(#$0B)
                          + sCommand + AnsiChar(#$03) ;
              BCCStr := IntToHex(BccCalculator(sCommand,1),2);
              sCommand := AnsiChar(#$02) + sCommand + Chr(BccCalculator(sCommand,1));
              IdTCPClient.IOHandler.WriteLn(sCommand);
              Memo1.Lines.Add('02 '+IntToHex(PlusLength+1,2)+ ' 0B '+ PlusStr + '03 ' + BCCStr);
              Memo1.Lines.Add('Send : '+sCommand);
            except on e : exception do
              Memo1.Lines.Add('E1 : '+e.Message);
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
                i : integer;
                TempStr : String;
                PlusStr : String;
                sCommand: AnsiString;
                BCCStr : String;
                PlusLength : Integer;
              begin
                try
                  if not IdTCPClient.Connected then Exit;
                  TWaitDialog.Show('Wifi 정보를 '+#13+'전송중입니다.');
                  Memo1.Lines.Add('Wifi 정보를 전송중입니다.');
                  // ID          [ " = #34 / x22 ]
              //    TempStr := #34 + EdtWifiID.Text + #34;
                  TempStr := #34 + EdtWifiID2.Text + #34;
                  PlusStr := '';
                  for i := 1 to Length(TempStr) do
                  begin
                    PlusStr := PlusStr + IntToHex(Ord(TempStr[i]),2) + ' ' ;
                    sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+IntToHex(Ord(TempStr[i]),2))));
                  end;

                  PlusStr := PlusStr + IntToHex(Ord(','),2) + ' ' ;
                  sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+IntToHex(Ord(','),2))));

                  // PW
              //    TempStr := #34 + EdtWifiPW.Text + #34;
                  TempStr := #34 + EdtWifiPW2.Text + #34;
                  for i := 1 to Length(TempStr) do
                  begin
                    PlusStr := PlusStr + IntToHex(Ord(TempStr[i]),2) + ' ' ;
                    sCommand := sCommand + AnsiChar(Chr(StrToInt('0x'+IntToHex(Ord(TempStr[i]),2))));
                  end;

              //    PlusLength := Length(#34 +EdtWifiID.Text + #34 + ',' + #34 +EdtWifiPW.Text+ #34);
                  PlusLength := Length(#34 +EdtWifiID2.Text + #34 + ',' + #34 +EdtWifiPW2.Text+ #34);

                  ReadData := '';
                  SendMod := 1;
                  sCommand := AnsiChar(Chr(StrToInt('0x'+IntToHex(PlusLength+1,2))))+ AnsiChar(#$0B)
                              + sCommand + AnsiChar(#$03) ;
                  BCCStr := IntToHex(BccCalculator(sCommand,1),2);
                  sCommand := AnsiChar(#$02) + sCommand + Chr(BccCalculator(sCommand,1));
                  IdTCPClient.IOHandler.WriteLn(sCommand);
                  Memo1.Lines.Add('02 '+IntToHex(PlusLength+1,2)+ ' 0B '+ PlusStr + '03 ' + BCCStr);
                  Memo1.Lines.Add('Send : '+sCommand);
                except on e : exception do
                  Memo1.Lines.Add('E1 : '+e.Message);
                end;
              end);
        finally

        end;
      end).Start();
end;

procedure TfDongHwa.GetImage;
{$IFDEF ANDROID}
var
  scanBitmap: TBitmap;
  ReadResult: TReadResult;
{$ENDIF ANDROID}
begin
{$IFDEF ANDROID}
 // 카메라로부터 이미지를 가져옴
  CameraComponent1.SampleBufferToBitmap(imgCamera.Bitmap, True);
  // 이미 스캔 중이라면 종료
  if FScanInProgress then
    Exit;
  FScanInProgress := True;
  scanBitmap := TBitmap.Create;
  scanBitmap.Assign(imgCamera.Bitmap);
  // 스레드를 사용하여 QR 코드 스캔 수행
  TTask.Run(
    procedure
    var
      ReadResult: TReadResult;
      QRText, SSID, Password: string;
    begin
      try
        try
          // QR 코드 스캔
          ReadResult := FScanManager.Scan(scanBitmap);
          // 스캔 결과가 있고 텍스트가 Wi-Fi 형식인지 확인
          if (ReadResult <> nil) and (ReadResult.Text <> '') then
          begin
            QRText := ReadResult.Text;
            if QRText.StartsWith('WIFI:') then
            begin
              // SSID 및 비밀번호 추출
              SSID := ExtractWiFiInfo(QRText, 'S:');
              Password := ExtractWiFiInfo(QRText, 'P:');
              // 메인 스레드에서 UI 업데이트
              TThread.Synchronize(nil,
                procedure
                begin
                  EdtWifiID2.Text := SSID;
                  EdtWifiPW2.Text := Password;
                  // 단말기 등록 화면으로 back
                    btnStopCameraClick(self);
                    TabControl1.ActiveTab := TabItemConnect2;
                end);
            end;
//            else
//            begin
//              TThread.Synchronize(nil,
//                procedure
//                begin
//                  ShowMessage('Wi-Fi QR 코드가 아닙니다.');
//                end);
//            end;
          end;
        except
          on E: Exception do
          begin
//            TThread.Synchronize(nil,
//              procedure
//              begin
//                ShowMessage('QR 코드 스캔 중 오류 발생: ' + E.Message);
//              end);
          end;
        end;
      finally
        // 스캔이 끝나면 비트맵 해제
        TThread.Synchronize(nil,
          procedure
          begin
            FScanInProgress := False;
            scanBitmap.Free;
          end);
      end;
    end);
{$ENDIF ANDROID}
end;

function TfDongHwa.AppEvent(AAppEvent: TApplicationEvent;
AContext: TObject): Boolean;
begin
  case AAppEvent of
    TApplicationEvent.WillBecomeInactive:
      CameraComponent1.Active := False;
    TApplicationEvent.EnteredBackground:
      CameraComponent1.Active := False;
    TApplicationEvent.WillTerminate:
      CameraComponent1.Active := False;
  end;
end;


// Wi-Fi 정보 추출 함수
function TfDongHwa.ExtractWiFiInfo(const QRText, Key: string): string;
var
  StartPos, EndPos: Integer;
begin
  Result := '';
  StartPos := Pos(Key, QRText);
  if StartPos > 0 then
  begin
    Inc(StartPos, Length(Key));
    EndPos := PosEx(';', QRText, StartPos);
    if EndPos > 0 then
      Result := Copy(QRText, StartPos, EndPos - StartPos)
    else
      Result := Copy(QRText, StartPos, Length(QRText) - StartPos + 1);
  end;
end;

// vcl의 컬러값 fmx로 변환
function TfDongHwa.VclToFmxColor(const VclColor: Integer): TAlphaColor;
begin
  Result := $FF000000                                     // 알파 = 255
          or ((VclColor and $FF) shl 16)                  // B → R
          or  (VclColor and $FF00)                        // G 그대로
          or ((VclColor and $FF0000) shr 16);             // R → B
end;



            {
procedure TfDongHwa.Wait(Number: Integer; Proc: TProc);
var
  Thread: array[0..100] of TThread;
begin
  ThreadNumber := ThreadNumber + 1;
  ThreadNumber := (ThreadNumber mod 100) ;
  Thread[Number] := TThread.CreateAnonymousThread(
    procedure()
    begin
      Proc;
    end);
  Thread[Number].FreeOnTerminate := True;
  Thread[Number].Start;

  while not Thread[Number].Finished do Application.ProcessMessages;
end;     }

initialization
 // RegisterActivityResultHandler;

end.
