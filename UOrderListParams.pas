//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры заявки
//
//------------------------------------------------------------------------------
unit UOrderListParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxButtonEdit, dxLayoutcxEditAdapters,
  dxLayoutContainer, cxClasses, dxLayoutControl, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox, dxWheelPicker,
  dxNumericWheelPicker, dxDateTimeWheelPicker, dxmdaset, cxGridCustomLayoutView,
  cxGridCardView, cxGridWinExplorerView, cxGridDBCardView, cxTimeEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxGridDBWinExplorerView,
  Vcl.WinXCalendars, cxCalc, cxSplitter, dxBarBuiltInMenu, cxPC, cxImage,
  cxGridViewLayoutContainer, cxGridLayoutView, cxGridDBLayoutView,
  Vcl.CategoryButtons, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxDBExtLookupComboBox, dxBar,
  System.Actions, Vcl.ActnList, cxSpinEdit, cxSpinButton,
  cxExtEditRepositoryItems, JvComponentBase, JvClipboardMonitor,
  System.ImageList, Vcl.ImgList, cxImageList, dxScreenTip, dxCustomHint, cxHint,
  dxScrollbarAnnotations;

type
  TOrderParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    tClient: TZQuery;
    mdWork: TdxMemData;
    dsWork: TDataSource;
    mdWorkWorkName: TStringField;
    mdWorkID_WorkType: TIntegerField;
    mdWorkWorkPrice: TFloatField;
    mdWorkWorkAmount: TFloatField;
    mdWorkSum: TFloatField;
    qWorkType: TZQuery;
    dsWorkType: TDataSource;
    tPhone: TZQuery;
    pLeft: TPanel;
    gbClient: TcxGroupBox;
    lPhone: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    eName: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    eAddress: TcxComboBox;
    cbDistrict: TcxComboBox;
    cbMetro: TcxComboBox;
    ePhone: TcxMaskEdit;
    gbWork: TcxGroupBox;
    cxLabel3: TcxLabel;
    eRequestText: TcxMemo;
    StyleRepository: TcxStyleRepository;
    TimeStyle: TcxStyle;
    DayStyle: TcxStyle;
    WeekdayStyle: TcxStyle;
    cxLabel10: TcxLabel;
    eClientComment: TcxMemo;
    cbClientDomSPB: TcxCheckBox;
    mdPhotoClient: TdxMemData;
    mdPhotoClientID: TIntegerField;
    mdPhotoClientPhoto: TGraphicField;
    mdPhotoMaster: TdxMemData;
    IntegerField2: TIntegerField;
    GraphicField1: TGraphicField;
    dsPhotoClient: TDataSource;
    dsPhotoMaster: TDataSource;
    DayContentStyle: TcxStyle;
    mdWorkUnitName: TStringField;
    mdWorkWorkerClassTag: TStringField;
    mdWorkWorkNorm: TFloatField;
    mdWorkTimeSum: TFloatField;
    TimeStyleContent: TcxStyle;
    TimeInfoStyle: TcxStyle;
    PopupMenu: TcxGridPopupMenu;
    cbPhone: TcxLookupComboBox;
    dsClientList: TDataSource;
    gbRes: TcxGroupBox;
    cxLabel18: TcxLabel;
    bResManual: TcxButton;
    eResMaster: TcxButtonEdit;
    cxLabel19: TcxLabel;
    ActionList: TActionList;
    aAddGuide: TAction;
    aAddManual: TAction;
    aEdit: TAction;
    aDel: TAction;
    BarMan: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    cbPaymentForm: TcxComboBox;
    lPaymentForm: TcxLabel;
    pRight: TPanel;
    gbParams: TcxGroupBox;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    eID: TcxTextEdit;
    eAddDate: TcxTextEdit;
    eOrderType: TcxTextEdit;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    mStatusComment: TcxMemo;
    gbChat: TcxGroupBox;
    bSend: TcxButton;
    bResAuto: TcxButton;
    eResDate: TcxDateEdit;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    eTimeCalc: TcxButtonEdit;
    pmMenu: TdxBarPopupMenu;
    cbPayed: TcxCheckBox;
    lInfo1: TcxLabel;
    mdWorkAmountText: TStringField;
    lInfo21: TcxLabel;
    BoldColumn: TcxStyle;
    eFlatNumber: TcxTextEdit;
    eClientTime: TcxTextEdit;
    eResTime: TcxTimeEdit;
    eTimeLen: TcxSpinEdit;
    mdWorkID_WorkerClass: TIntegerField;
    mdWorkWorkWarranryType: TIntegerField;
    mdWorkWorkWarranryTime: TIntegerField;
    mdWorkID: TIntegerField;
    qMetro: TZQuery;
    cbStatusType: TcxLookupComboBox;
    qStatus: TZQuery;
    dsStatus: TDataSource;
    EditRepository: TcxEditRepository;
    ColorEdit: TcxEditRepositoryColorEdit;
    sStatusTypeColor: TShape;
    cbReason: TcxComboBox;
    lReason: TcxLabel;
    sSourceTypeColor: TShape;
    sSignalTypeColor: TShape;
    qSignal: TZQuery;
    dsSignal: TDataSource;
    qSource: TZQuery;
    dsSource: TDataSource;
    cbSourceType: TcxLookupComboBox;
    cbSignalType: TcxLookupComboBox;
    TimerChat: TTimer;
    GridChat: TcxGrid;
    LevelChat: TcxGridLevel;
    qChat: TZQuery;
    dsChat: TDataSource;
    qChatID: TLargeintField;
    qChatAddDateTime: TDateTimeField;
    qChatID_OrderList: TIntegerField;
    qChatID_Worker: TIntegerField;
    qChatID_User: TIntegerField;
    qChatMessageText: TWideStringField;
    qChatUseerWorkerInfo: TWideStringField;
    ViewChat: TcxGridDBBandedTableView;
    ViewChatAddDateTime: TcxGridDBBandedColumn;
    ViewChatMessageText: TcxGridDBBandedColumn;
    ViewChatUseerWorkerInfo: TcxGridDBBandedColumn;
    ChatStyleUser: TcxStyle;
    ChatStyleWorker: TcxStyle;
    ChatStyleTextUser: TcxStyle;
    ViewChatID_Worker: TcxGridDBBandedColumn;
    ViewChatID_User: TcxGridDBBandedColumn;
    ChatStyleTextWorker: TcxStyle;
    bClear: TcxButton;
    ClipboardMonitor: TJvClipboardMonitor;
    sbCopy: TSpeedButton;
    sbPaste: TSpeedButton;
    TelImageList: TcxImageList;
    SpeedButton1: TSpeedButton;
    sbCall: TSpeedButton;
    mdWorkEdited: TSmallintField;
    AddressTimer: TTimer;
    ldadata: TcxLabel;
    qLocations: TZQuery;
    lNeedCallDate: TcxLabel;
    eNeedCallDate: TcxDateEdit;
    lInfo11: TcxLabel;
    lInfo2: TcxLabel;
    eCheckNum: TcxTextEdit;
    lCheckNum: TcxLabel;
    cxLabel11: TcxLabel;
    ePromocode: TcxButtonEdit;
    cxLabel12: TcxLabel;
    eCalcTime: TcxTextEdit;
    qDiscount: TZQuery;
    qDiscountWorkType: TZQuery;
    mdWorkID_Discount: TIntegerField;
    mdWorkID_DiscountPromo: TIntegerField;
    mdWorkDiscountPercent: TFloatField;
    mdWorkDiscountSum: TFloatField;
    mdWorkDiscountPromoPercent: TFloatField;
    mdWorkDiscountPromoSum: TFloatField;
    mdWorkTotalPrice: TFloatField;
    mdWorkTotalSum: TFloatField;
    mdWorkDiscountDebtType: TIntegerField;
    mdWorkDiscountSubType: TIntegerField;
    mdWorkDiscountCanAdd: TIntegerField;
    mdWorkDiscountMinOrderSum: TFloatField;
    mdWorkDiscountPromoDebtType: TIntegerField;
    mdWorkDiscountPromoSubType: TIntegerField;
    mdWorkDiscountPromoCanAdd: TIntegerField;
    mdWorkDiscountPromoMinOrderSum: TFloatField;
    mdWorkPrice: TFloatField;
    mdWorkWorkSum: TFloatField;
    StyleDiscount: TcxStyle;
    HintStyleController: TcxHintStyleController;
    mdWorkDiscountSumRes: TFloatField;
    mdWorkDiscountPromoSumApply: TFloatField;
    lInfo0: TcxLabel;
    eOrderNumberExt: TcxTextEdit;
    cxLabel8: TcxLabel;
    ePersonalAccount: TcxTextEdit;
    cxLabel9: TcxLabel;
    sbHistory: TSpeedButton;
    PageControl: TcxPageControl;
    tsWorkList: TcxTabSheet;
    tsMaterial: TcxTabSheet;
    GridWork: TcxGrid;
    ViewWork: TcxGridDBTableView;
    ViewWorkWorkerClassTag: TcxGridDBColumn;
    ViewWorkWorkName: TcxGridDBColumn;
    ViewWorkAmountText: TcxGridDBColumn;
    ViewWorkPrice: TcxGridDBColumn;
    ViewWorkSum: TcxGridDBColumn;
    ViewWorkAmount: TcxGridDBColumn;
    ViewWorkUnitName: TcxGridDBColumn;
    ViewWorkNorm: TcxGridDBColumn;
    ViewWorkTimeSum: TcxGridDBColumn;
    ViewWorkDiscountSum: TcxGridDBColumn;
    ViewWorkWorkSum: TcxGridDBColumn;
    ViewWorkWorkPrice: TcxGridDBColumn;
    ViewWorkDiscountPromoSum: TcxGridDBColumn;
    ViewWorkDiscountSumRes: TcxGridDBColumn;
    ViewWorkDiscountPromoSumApply: TcxGridDBColumn;
    ViewWorkBanded: TcxGridDBBandedTableView;
    ViewWorkBandedWorkName: TcxGridDBBandedColumn;
    ViewWorkBandedWorkerClassTag: TcxGridDBBandedColumn;
    ViewWorkBandedPrice: TcxGridDBBandedColumn;
    ViewWorkBandedAmount: TcxGridDBBandedColumn;
    ViewWorkBandedSum: TcxGridDBBandedColumn;
    ViewWorkBandedUnitName: TcxGridDBBandedColumn;
    ViewWorkBandedNorm: TcxGridDBBandedColumn;
    ViewWorkBandedTimeSum: TcxGridDBBandedColumn;
    LevelWork: TcxGridLevel;
    bDelete: TcxButton;
    bEdit: TcxButton;
    bAddManual: TcxButton;
    bAdd: TcxButton;
    bAddMaterial: TcxButton;
    GridMaterial: TcxGrid;
    ViewMaterial: TcxGridDBTableView;
    ViewMaterialMaterialCode: TcxGridDBColumn;
    ViewMaterialMaterialName: TcxGridDBColumn;
    ViewMaterialAmountText: TcxGridDBColumn;
    ViewMaterialPrice: TcxGridDBColumn;
    ViewMaterialSum: TcxGridDBColumn;
    ViewMaterialAmount: TcxGridDBColumn;
    ViewMaterialUnitName: TcxGridDBColumn;
    ViewMaterialMaterialSum: TcxGridDBColumn;
    ViewMaterialMaterialPrice: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    LevelMaterial: TcxGridLevel;
    bAddManuualMaterial: TcxButton;
    bEditMaterial: TcxButton;
    bDeleteMaterial: TcxButton;
    aAddGuideMaterial: TAction;
    aAddManualMaterial: TAction;
    aEditMaterial: TAction;
    aDelMaterial: TAction;
    dsMaterial: TDataSource;
    mdMaterial: TdxMemData;
    IntegerField1: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField2: TStringField;
    SmallintField1: TSmallintField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField4: TStringField;
    mdMaterialNaterialCode: TStringField;
    lInfo01: TcxLabel;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eRequestTextPropertiesChange(Sender: TObject);
    procedure ePhonePropertiesChange(Sender: TObject);
    procedure ePhoneExit(Sender: TObject);
    procedure eAddressPropertiesPopup(Sender: TObject);
    procedure cbMetroPropertiesPopup(Sender: TObject);
    procedure cbDistrictPropertiesPopup(Sender: TObject);
    procedure mdWorkCalcFields(DataSet: TDataSet);
    procedure bResManualClick(Sender: TObject);
    procedure cbPhonePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cbPhonePropertiesChange(Sender: TObject);
    procedure cbPhoneExit(Sender: TObject);
    procedure cbPhoneEnter(Sender: TObject);
    procedure ViewWorkDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure ViewWorkNavigatorButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure eTImeCalcPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ViewWorkCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure eResMasterPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bResAutoClick(Sender: TObject);
    procedure cbDistrictPropertiesChange(Sender: TObject);
    procedure aAddGuideExecute(Sender: TObject);
    procedure aAddManualExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure eResTimeExit(Sender: TObject);
    procedure cbStatusTypeColorPropertiesChange(Sender: TObject);
    procedure cbPaymentFormPropertiesChange(Sender: TObject);
    procedure cbReasonPropertiesChange(Sender: TObject);
    procedure cbPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure cbSignalTypePropertiesChange(Sender: TObject);
    procedure cbSourceTypePropertiesChange(Sender: TObject);
    procedure bSendClick(Sender: TObject);
    procedure TimerChatTimer(Sender: TObject);
    procedure ViewChatStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ViewChatStylesGetPreviewStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bClearClick(Sender: TObject);
    procedure sbCopyClick(Sender: TObject);
    procedure sbPasteClick(Sender: TObject);
    procedure ClipboardMonitorChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbCallClick(Sender: TObject);
    procedure eAddressExit(Sender: TObject);
    procedure eAddressPropertiesChange(Sender: TObject);
    procedure eAddressEnter(Sender: TObject);
    procedure eAddressKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddressTimerTimer(Sender: TObject);
    procedure eNeedCallPropertiesChange(Sender: TObject);
    procedure eResDatePropertiesChange(Sender: TObject);
    procedure eResTimePropertiesChange(Sender: TObject);
    procedure eTimeLenPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ViewWorkSumStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ViewWorkSumGetCellHint(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; ACellViewInfo: TcxGridTableDataCellViewInfo;
      const AMousePos: TPoint; var AHintText: TCaption;
      var AIsHintMultiLine: Boolean; var AHintTextRect: TRect);
    procedure ViewWorkPriceGetCellHint(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; ACellViewInfo: TcxGridTableDataCellViewInfo;
      const AMousePos: TPoint; var AHintText: TCaption;
      var AIsHintMultiLine: Boolean; var AHintTextRect: TRect);
    procedure ViewWorkPriceStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ePromocodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure pBottomDblClick(Sender: TObject);
    procedure sbHistoryClick(Sender: TObject);
    procedure aAddGuideMaterialExecute(Sender: TObject);
    procedure mdMaterialCalcFields(DataSet: TDataSet);
    procedure aAddManualMaterialExecute(Sender: TObject);
    procedure aEditMaterialExecute(Sender: TObject);
    procedure aDelMaterialExecute(Sender: TObject);
    procedure ViewMaterialCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ViewMaterialDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure ViewMaterialSumGetCellHint(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; ACellViewInfo: TcxGridTableDataCellViewInfo;
      const AMousePos: TPoint; var AHintText: TCaption;
      var AIsHintMultiLine: Boolean; var AHintTextRect: TRect);
    procedure ViewMaterialPriceGetCellHint(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; ACellViewInfo: TcxGridTableDataCellViewInfo;
      const AMousePos: TPoint; var AHintText: TCaption;
      var AIsHintMultiLine: Boolean; var AHintTextRect: TRect);
  private
    { Private declarations }
    FID, FIDClient, FIDWorker, FIDStatusType : integer;
    FAdd : boolean;
    FTest, FToken, FSecret : string;
    FJSON : string;
    FXML : string;
    FOldAddress : string;//для DATATA
    FLastAddress : string;//для понимания того что адрес отредактирован
    FLocations : string;

    FStoreStream : TMemoryStream;
    FTotalSumFull : double;
    FIDDiscountTypePromo : integer;
    FPromoSum : string;
  public
    { Public declarations }
    procedure AddGuide;
    function AddManual : integer;
    function EditWork : integer;
    function DeleteWork : integer;

    procedure AddGuideMaterial;
    function AddManualMaterial : integer;
    function EditMaterial : integer;
    function EditGuideMaterial : integer;
    function DeleteMaterial : integer;

    procedure FillPhone;
    procedure FillClientInfo;
    procedure FillAddressList;
    procedure FillDistrictList;
    procedure FillMetroList;
    procedure FillSourceType;
    procedure FillStatusType;
    procedure FillPaymentForm;
    procedure FillSignalType;
    procedure FillReason;

    procedure UpdateWorker;
    procedure UpdateTime;
    procedure UpdateCalcTime;

    function GetWorkSum : double;

    procedure FillInfoFromDadata;

    procedure GetLocationList;

    procedure DoRequestAddressJSon;
    procedure DoRequestAddressJSon1;

    procedure DoRequestAddressXML;
    procedure DoRequestAddressXML1;

    procedure SetOKEnabled;

    procedure StartAddressTimer;

    //--------------------------------------------------------------------------
    // скидки
    //--------------------------------------------------------------------------

    //получение суммы с учетом скидок
    function GetTotalSum : double;

    //сохранение всех данных чека
    procedure StoreCheck;

    //восстановление всех данных чека
    procedure RestoreCheck;

    //очистка всех скидок
    procedure ClearDiscount;

    //установка скидки
    function DiscountApply(AIDDiscountType : integer) : boolean;

    //поиск лучшей скидки, действующей на все услуги
    function DiscountFindAll(var ACheckSum : double) : boolean;

    //поиск лучшей скидки, действующей на отдельные услуги
    function DiscountFindOne(var ACheckSum : double) : boolean;

    //поиск лучшей скидки или скидок
    procedure DiscountFind;

    //--------------------------------------------------------------------------
    // промокоды
    //--------------------------------------------------------------------------

    //очистка информации по промокоду
    procedure ClearDiscountPromo;

    //выбор промокода
    procedure SelectDiscountPromo;

    //отмена промокода
    procedure DeleteDiscountPromo;

    //добавляем промо у уже найденным скидкам
    function DiscountPromoApply(AIDDiscountType : integer) : boolean;

    //добавляем промо у уже найденным скидкам (мягкий режим, более лояльный к клиенту)
    function DiscountPromoApply1(AIDDiscountType : integer) : boolean;

    //добавляем промо у уже найденным скидкам (жесткий режим,
    //применяем промокод - значит промокоод, скидку отменяем если не складывается
    //и при этом проверяется действие на весь чек
    //если скидка и промо действует на весь чек, то либо остается скидка, либо промо, либо их сумма
    //если скидка на весь чек, а промо не на весь, то применяем промо, отменяем скидку сразу на весь чек
    //если промо на весь чек, применяем промо, отменяем все скидки, которые не складываются
    //если промо не на весь чек и скидка не на весь чек, то тех позициях, где складываются - складываем, где нет - оставляем промо
    function DiscountPromoApply2(AIDDiscountType : integer) : boolean;

    //обновление информации по промо
    procedure UpdateDiscountPromoInfo;

    //обновление итогов
    procedure UpdateSummary;

    //--------------------------------------------------------------------------
    // материалы
    //--------------------------------------------------------------------------

    //получение суммы материалов
    function GetMaterialSum : double;
  end;

function GetOrderLIstParams(
      AID, AAddTime : string;
  var AOrderNum, AOrderDate, AOrderType : string;
  var AIDSourceType, AIDStatusType, AIDPaymentForm, AIDSignalType, AIDReason : integer;
  var ANeedCallDate : string;
  var AStatusComment : string;
  var APayed : integer;
  var ACheckNum : string;
  var AOrderNumberExt, APersonalAccount : string;

  var AIDClient : integer;
  var APhone, AName, AAddress, AFlatNumber : string;
  var AIDDistrict, AIDMetro : integer;
  var AClientDOMSPB : integer;
  var AClientComment : string;

  var ARequestText : string;

  var AClientDateTime : string;
  var AWorkDate, AWorkTime, APLanTime : string;
  var AIDWorker : integer;

  var AWorkList, AMaterialList : TMemoryStream;
  var AWorkSum, AMaterialSum : double;
  var AIDDiscountTypePromo : integer;
      AAdd : boolean) : boolean;

implementation

{$R *.dfm}

uses UShowDatasetModal,
  math, mesdlg, UGClient, types, DTKUtils, dateutils, Clipbrd, UDadataUtils,
  UDatas, UUtil, UConsts, USelectWorkType, USelectClient, USelectWorker,
  USelectWorkTypeMulti, UOrderWorkTypeParams, UOrderWorkerTimeParams,
  UWaiting, UEditText, UDadataAddressParams, USelectDiscount, UBrowseOrderHistorySimple,
  USelectMaterialTypeMulti, UOrderMaterialTypeParams, UOrderMaterialTypeGuideParams;

function GetOrderLIstParams(
      AID, AAddTime : string;
  var AOrderNum, AOrderDate, AOrderType : string;
  var AIDSourceType, AIDStatusType, AIDPaymentForm, AIDSignalType, AIDReason : integer;
  var ANeedCallDate : string;
  var AStatusComment : string;
  var APayed : integer;
  var ACheckNum : string;
  var AOrderNumberExt, APersonalAccount : string;

  var AIDClient : integer;
  var APhone, AName, AAddress, AFlatNumber : string;
  var AIDDistrict, AIDMetro : integer;
  var AClientDOMSPB : integer;
  var AClientComment : string;

  var ARequestText : string;

  var AClientDateTime : string;
  var AWorkDate, AWorkTime, APLanTime : string;
  var AIDWorker : integer;

  var AWorkList, AMaterialList : TMemoryStream;
  var AWorkSum, AMaterialSum : double;
  var AIDDiscountTypePromo : integer;
      AAdd : boolean) : boolean;
begin
  with TOrderParamForm.Create(nil) do
    try
      ShowWaiting(cDataGetting);

      FID := StrToInt(AID);
      FAdd := AAdd;

      if AID <> '0' then
        eID.Text := AID;

      if AAddTime <> '' then
        eAddDate.Text := FormatDateTime('yyyy.mm.dd hh:nn', StrToDateTime(AAddTime));

      eOrderType.Text := AOrderType;

      FillSourceType;
      cbSourceType.EditValue := AIDSourceType;
//      SetItemIndexByID(cbSourceType, AIDSourceType);

      FIDStatusType := AIDStatusType;
      FillStatusType;
      cbStatusType.EditValue := AIDStatusType;
//      SetItemIndexByID(cbStatusType, AIDStatusType);

      FillPaymentForm;
      SetItemIndexByID(cbPaymentForm, AIDPaymentForm);

      FillSignalType;
      cbSignalType.EditValue := AIDSignalType;
//      SetItemIndexByID(cbSignalType, AIDSignalType);

      FillReason;
      SetItemIndexByID(cbReason, AIDReason);

      if IsDateTime(ANeedCallDate) then
      begin
        ANeedCallDate := FormatDateTIme('dd.mm.yyyy hh:nn:ss', StrToDateTIme(ANeedCallDate));
      end;
      eNeedCallDate.Text := ANeedCallDate;

      mStatusComment.Text := AStatusComment;
      cbPayed.Checked := APayed = 1;
      eCheckNum.Text := ACheckNum;

      eOrderNumberExt.Text := AOrderNumberExt;
      ePersonalAccount.Text := APersonalAccount;

      FIDClient := AIDClient;
      FillClientInfo;

      FillPhone;

      //получаем новые данные по телефонам и клиентам
      Datas.tClientList.Refresh;

      cbPhone.Text := APhone;
      cbPhoneExit(nil);
      ePhone.Text := APhone;
      eName.Text := AName;

      eAddress.Properties.OnChange := nil;
      eAddress.Text := AAddress;
      eAddress.Properties.OnChange := eAddressPropertiesChange;

      eFlatNumber.Text := AFlatNumber;
      FillDistrictList;
      SetItemIndexByID(cbDistrict, AIDDistrict);
      FillMetroList;
      SetItemIndexByID(cbMetro, AIDMetro);

      cbClientDomSPB.Checked := AClientDomSPB = 1;
      eClientComment.Text := AClientComment;

      eRequestText.Text := ARequestText;

      AWorkList.Position := 0;
      mdWork.Open;
      mdWork.LoadFromStream(AWorkList);

      AMaterialList.Position := 0;
      mdMaterial.Open;
      mdMaterial.LoadFromStream(AMaterialList);

      if IsDateTime(AClientDateTime) then
        eClientTime.Text := FormatDateTime('dd.mm.yyyy hh:nn', StrToDateTime(AClientDateTime))
      else
        eClientTime.Text := AClientDateTime;

      eResDate.Text := AWorkDate;
      eResTime.Text := AWorkTime;

      UpdateTime;

      if APlanTime = '' then APlanTime := '0';
      eTimeLen.Value := StrToInt(APlanTime);

      FIDWorker := AIDWorker;
      UpdateWorker;

      FIDDiscountTypePromo := AIDDiscountTypePromo;
      UpdateDiscountPromoInfo;

      HideWaiting;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AIDSourceType := cbSourceType.EditValue; //GetIDByItemIndex(cbSourceType);
        AIDStatusType := cbStatusType.EditValue;
        AIDPaymentForm := GetIDByItemIndex(cbPaymentForm);
        AIDSignalType := cbSignalType.EditValue; //GetIDByItemIndex(cbSignalType);
        AIDReason := GetIDByItemIndex(cbReason);

        if IsDateTIme(eNeedCallDate.Text) then
          ANeedCallDate := eNeedCallDate.Text
        else
          ANeedCallDate := '';

        AStatusComment := Trim(mStatusComment.Text);
        APayed := BooleanToInt(cbPayed.Checked);

        AOrderNumberExt := Trim(eOrderNumberExt.Text);
        APersonalAccount := Trim(ePersonalAccount.Text);

        AIDClient := FIDClient;
        APhone := PreparePhone(Trim(ePhone.Text));
        AName := Trim(eName.Text);
        AAddress := Trim(eAddress.Text);
        AFlatNumber := Trim(eFlatNumber.Text);
        AClientDomSPB := BooleanToInt(cbClientDomSPB.Checked);
        ARequestText := Trim(eRequestText.Text);
        AIDDistrict := GetIDByItemIndex(cbDistrict);
        AIDMetro := GetIDByItemIndex(cbMetro);
        AClientComment := Trim(eClientComment.Text);

        APlanTime := IntToStr(eTimeLen.Value);

        AWorkList.Clear;
        mdWork.First;
        mdWork.SaveToStream(AWorkList);

        AMaterialList.Clear;
        mdMaterial.First;
        mdMaterial.SaveToStream(AMaterialList);

        if IsDate(eResDate.Text) then
          AWorkDate := eResDate.Text
        else
          AWorkDate := '';

        if IsTime(eResTime.Text) then
          AWorkTime := eResTime.Text
        else
          AWorkTime := '';

        AClientDateTime := eClientTime.Text;

        if (AClientDateTime = '') and (AWorkTime <> '') and (AWorkDate <> '') then
          AClientDateTime := AWorkDate + ' ' + AWorkTime;

        AIDWorker := FIDWorker;

//        AWorkSum := GetWorkSum;
        AWorkSum := GetTotalSum;
        AMaterialSum := GetMaterialSum;

        AIDDiscountTypePromo := FIDDiscountTypePromo;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TOrderParamForm.aAddGuideExecute(Sender: TObject);
begin
  AddGuide;
  DiscountFind;
  UpdateTime;
  SetOKEnabled;
end;

procedure TOrderParamForm.aAddGuideMaterialExecute(Sender: TObject);
begin
  AddGuideMaterial;
//  DiscountFind;
//  UpdateTime;
  SetOKEnabled;
end;

procedure TOrderParamForm.aAddManualExecute(Sender: TObject);
begin
  AddManual;
  DiscountFind;
  UpdateTime;
  SetOKEnabled;
end;

procedure TOrderParamForm.aAddManualMaterialExecute(Sender: TObject);
begin
  AddManualMaterial;
//  DiscountFind;
//  UpdateTime;
  SetOKEnabled;
end;

procedure TOrderParamForm.AddGuide;
  var
    vID : TIntegerDynArray;
    v : variant;
    vIDWorkerClass, i : integer;
begin
  if SelectWorkTypeMulti(vID) then
  begin
    mdWork.DisableControls;
    try
      for i := 0 to Length(vID) - 1 do
      begin
        if not mdWork.Locate('ID_WorkType', vID[i], []) then
        begin
          mdWork.Append;
          mdWork.FieldByName('ID_WorkType').AsInteger := vID[i];
          v := Datas.ReadValues('worktype', 'Name;Price;Amount;UnitName;Norm;ID_WorkerClass;WarrantyType;WarrantyTime', vID[i]);
          mdWork.FieldByName('WorkName').AsString := IsNull(v[0], '');
          mdWork.FieldByName('WorkPrice').AsFloat := IsNull(v[1], 0);
          mdWork.FieldByName('WorkAmount').AsFloat := IsNull(v[2], 0);

          mdWork.FieldByName('WorkSum').AsFloat := RoundTo(mdWork.FieldByName('WorkPrice').AsFloat * mdWork.FieldByName('WorkAmount').AsFloat, -2);

          mdWork.FieldByName('WorkUnitName').AsString := IsNull(v[3], '');
          mdWork.FieldByName('WorkNorm').AsFloat := IsNull(v[4], 0);
          mdWork.FieldByName('WorkWarrantyType').Value := v[6];
          mdWork.FieldByName('WorkWarrantyTime').Value := v[7];

          vIDWorkerClass := IsNull(v[5], 0);
          v := Datas.ReadValues('workerclass', 'Tag', vIDWorkerClass);

          mdWork.FieldByName('ID_WorkerClass').AsInteger := vIDWorkerClass;
          mdWork.FieldByName('WorkerClassTag').AsString := IsNull(v[0], '');

          mdWork.FieldByName('TotalPrice').AsFloat := mdWork.FieldByName('WorkPrice').AsFloat;
          mdWork.FieldByName('TotalSum').AsFloat := mdWork.FieldByName('WorkSum').AsFloat;

          mdWork.Post;
        end;
      end;
    finally
      mdWork.EnableControls;
    end;
  end;
end;

procedure TOrderParamForm.AddGuideMaterial;
  var
    vID : TIntegerDynArray;
    v : variant;
    vIDWorkerClass, i : integer;
begin
  if SelectMaterialTypeMulti(vID) then
  begin
    mdMaterial.DisableControls;
    try
      for i := 0 to Length(vID) - 1 do
      begin
        if not mdMaterial.Locate('ID_MaterialType', vID[i], []) then
        begin
          mdMaterial.Append;
          mdMaterial.FieldByName('ID_MaterialType').AsInteger := vID[i];
          v := Datas.ReadValues('materialtype', 'Name;Price;Amount;Unit;Code', vID[i]);
          mdMaterial.FieldByName('MaterialName').AsString := IsNull(v[0], '');
          mdMaterial.FieldByName('MaterialPrice').AsFloat := IsNull(v[1], 0);
          mdMaterial.FieldByName('MaterialAmount').AsFloat := IsNull(v[2], 0);

          mdMaterial.FieldByName('MaterialSum').AsFloat := RoundTo(mdMaterial.FieldByName('MaterialPrice').AsFloat * mdMaterial.FieldByName('MaterialAmount').AsFloat, -2);

          mdMaterial.FieldByName('MaterialUnitName').AsString := IsNull(v[3], '');
          mdMaterial.FieldByName('MaterialCode').AsString := IsNull(v[4], '');

          mdMaterial.Post;
        end;
      end;
    finally
      mdMaterial.EnableControls;
    end;
  end;
end;

function TOrderParamForm.AddManual : integer;
  var
    vIDWorkerClass : integer;
    vName : string;
    vAmount : double;
    vUnit : string;
    vPrice, vNorm : double;
    vIDWorkType : integer;
    vWarrantyType, vWarrantyTime : integer;
    r : integer;
    v : variant;
begin
  with mdWork do
  begin
    vIDWorkerClass := 0;
    vName := '';
    vAmount := 0;
    vUnit := '';
    vPrice := 0;
    vNorm := 0;
    vIDWorkType := 0;
    vWarrantyType := -1;
    vWarrantyTime := 0;
  end;

  Result := GetOrderListWorkTypeParams(
    vIDWorkerClass,
    vName,
    vAmount,
    vUnit,
    vPrice,
    vNorm,
    vWarrantyType,
    vWarrantyTime,
    vIDWorkType
    );

  if Result = mrOK then
  begin
    mdWork.Append;
    mdWork.FieldByName('ID_WorkType').AsInteger := vIDWorkType;
    mdWork.FieldByName('ID_WorkerClass').AsInteger := vIDWorkerClass;
    mdWork.FieldByName('WorkName').AsString := vName;
    mdWork.FieldByName('WorkPrice').AsFloat := vPrice;
    mdWork.FieldByName('WorkAmount').AsFloat := vAmount;

    mdWork.FieldByName('WorkSum').AsFloat := mdWork.FieldByName('WorkPrice').AsFloat * mdWork.FieldByName('WorkAmount').AsFloat;

    mdWork.FieldByName('WorkUnitName').AsString := vUnit;
    mdWork.FieldByName('WorkNorm').AsFloat := vNorm;
    v := Datas.ReadValues('workerclass', 'Tag', vIDWorkerClass);
    mdWork.FieldByName('WorkerClassTag').AsString := IsNull(v[0], '');

//    mdWork.FieldByName('WorkWarrantyType').Value := 0;
//    mdWork.FieldByName('WorkWarrantyTime').Value := 0;

    mdWork.FieldByName('WorkWarrantyType').Value := NullIf(vWarrantyType, -1);
    if mdWork.FieldByName('WorkWarrantyType').Value = null then mdWork.FieldByName('WorkWarrantyTime').Value := null
    else mdWork.FieldByName('WorkWarrantyTime').AsInteger := vWarrantyTime;

    mdWork.FieldByName('TotalPrice').AsFloat := mdWork.FieldByName('WorkPrice').AsFloat;
    mdWork.FieldByName('TotalSum').AsFloat := mdWork.FieldByName('WorkSum').AsFloat;

    mdWork.Post;
  end;
end;

function TOrderParamForm.AddManualMaterial: integer;
  var
    vName : string;
    vAmount : double;
    vUnit : string;
    vPrice : double;
    vIDMaterialType : integer;
    r : integer;
    v : variant;
begin
  with mdWork do
  begin
    vName := '';
    vAmount := 0;
    vUnit := '';
    vPrice := 0;
    vIDMaterialType := 0;
  end;

  Result := GetOrderListMaterialTypeParams(
    vName,
    vAmount,
    vUnit,
    vPrice,
    vIDMaterialType
    );

  if Result = mrOK then
  begin
    mdMaterial.Append;
    mdMaterial.FieldByName('ID_MaterialType').AsInteger := vIDMaterialType;
    mdMaterial.FieldByName('MaterialName').AsString := vName;
    mdMaterial.FieldByName('MaterialPrice').AsFloat := vPrice;
    mdMaterial.FieldByName('MaterialAmount').AsFloat := vAmount;
    mdMaterial.FieldByName('MaterialSum').AsFloat := RoundTo(mdMaterial.FieldByName('MaterialPrice').AsFloat * mdMaterial.FieldByName('MaterialAmount').AsFloat, -2);
    mdMaterial.FieldByName('MaterialUnitName').AsString := vUnit;
    mdMaterial.FieldByName('MaterialCode').AsString := '';
    mdMaterial.Post;
  end;
end;

procedure TOrderParamForm.AddressTimerTimer(Sender: TObject);
  var
    i, n : integer;
    v : string;
begin
  AddressTimer.Enabled := false;
  eAddress.Properties.OnChange := nil;

  DoRequestAddressJSON;

  n := JSONVariantCount(FJSON);

  eAddress.Properties.Items.BeginUpdate;
  eAddress.Properties.Items.Clear;

  for i := 0 to n - 1 do
  begin
    v := JSONVariantName(FJSON, i);
    eAddress.Properties.Items.Add(v);
  end;

  eAddress.Properties.Items.EndUpdate;

//  eAddress.SelectedItem := -1;

//  eAddress.SetSelection(Length(eAddress.Text), 0);

  if (FOldAddress <> eAddress.Text) and not eAddress.DroppedDown then
    eAddress.DroppedDown := true;

  FOldAddress := eAddress.Text;

  eAddress.Properties.OnChange := eAddressPropertiesChange;
end;

procedure TOrderParamForm.aDelExecute(Sender: TObject);
begin
  DeleteWork;
  DiscountFind;
  UpdateTIme;
  SetOKEnabled;
end;

procedure TOrderParamForm.aDelMaterialExecute(Sender: TObject);
begin
  DeleteMaterial;
//  DiscountFind;
//  UpdateTIme;
  SetOKEnabled;
end;

procedure TOrderParamForm.aEditExecute(Sender: TObject);
begin
  if mdWork.RecordCount = 0 then AddManual
  else
  begin
    EditWork
  end;
  DiscountFind;
  UpdateTime;
  SetOKEnabled;
end;

procedure TOrderParamForm.aEditMaterialExecute(Sender: TObject);
begin
  if mdMaterial.RecordCount = 0 then AddManualMaterial
  else
  begin
    if mdMaterial.FieldByName('ID_MaterialType').AsInteger = 0 then EditMaterial
    else EditGuideMaterial;
  end;
//  DiscountFind;
//  UpdateTime;
  SetOKEnabled;
end;

procedure TOrderParamForm.bResManualClick(Sender: TObject);
  var
    vNow, vDate, vTime : TDateTime;
begin
  eResDate.Enabled := true;
  eResTime.Enabled := true;

  eResMaster.Enabled := true;

  //округляем до ближайшего часа и прибавляем один час
  vNow := trunc(Now() * 24) / 24 + 2 / 24;
  vDate := DateOf(vNow);
  vTime := TimeOf(vNow);

  if eResDate.Text = '' then
    eResDate.Date := vDate;

  if eResTime.Text = '00:00' then
  begin
    eResTime.Time := StrToTime(IntToStr(HourOf(vTime)) + ':00:00');
  end;
end;

procedure TOrderParamForm.bSendClick(Sender: TObject);
  var
    t : string;
    vID : integer;
begin
  t := '';
  if EditText(t, 'Введите текст сообщения') then
  begin
    vID := AddChatMessage(FID, t);
    qChat.Refresh;
    qChat.Locate('ID', vID, []);
  end;
end;

procedure TOrderParamForm.sbCallClick(Sender: TObject);
  var
    vPhone, vName : string;
begin
  vPhone := cbPhone.Text;
  vName := eName.Text;
  ExecPhone(vPhone, vName);
end;

procedure TOrderParamForm.sbCopyClick(Sender: TObject);
begin
  if cbPhone.Text <> '' then
    Clipboard.AsText := cbPhone.Text;
end;

procedure TOrderParamForm.sbHistoryClick(Sender: TObject);
  var
    a, p : string;
begin
  p := PreparePhone(cbPhone.Text);
  a := eAddress.Text;
  BrowseOrderHistorySimple(p, a);
end;

procedure TOrderParamForm.cbDistrictPropertiesChange(Sender: TObject);
begin
  FillMetroList;
end;

procedure TOrderParamForm.cbDistrictPropertiesPopup(Sender: TObject);
begin
//  FillDistrictList;
end;

procedure TOrderParamForm.cbMetroPropertiesPopup(Sender: TObject);
begin
//  FillMetroList;
end;

procedure TOrderParamForm.sbPasteClick(Sender: TObject);
  var
    s : string;
begin
  if Clipboard. AsText <> '' then
  begin
    s := Clipboard.AsText;
    s := PreparePhone(s);
    cbPhone.Text := s;
    cbPhone.ValidateEdit;
    cbPhone.SetFocus;
  end;
end;

procedure TOrderParamForm.cbPaymentFormPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderParamForm.cbPhoneEnter(Sender: TObject);
begin
  cbPhone.Text := PreparePhone(cbPhone.Text);
  cbPhone.Properties.MaxLength := 10;
end;

procedure TOrderParamForm.cbPhoneExit(Sender: TObject);
  var
    s : string;
begin
  if Length(PreparePhone(cbPhone.Text)) = 10 then
  begin
    s := PreparePhone(cbPhone.Text);
    cbPhone.Properties.MaxLength := 14;
    cbPhone.Text := '(' + Copy(s, 1, 3) + ') ' + Copy(s, 4, 3) + '-' + Copy(s, 7, 4);
  end;
end;

procedure TOrderParamForm.cbPhoneKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key >= #32) and ( not (Key in ['0'..'9'])) then Key := #0;
end;

procedure TOrderParamForm.cbPhonePropertiesChange(Sender: TObject);
  var
    r, s : string;
begin
{  s := CorrectInteger2(cbPhone.Text);
  r := '';
  if IsIntegerByChar(s) then
  begin
    r := '(' + Copy(s, 1, 3) + ')';

    s := Copy(s, 4, 7);
    if IsInteger(s) then
    begin
      r := r + ' ' + Copy(s, 1, 3);
      s := Copy(s, 4, 4);

      if IsInteger(s) then
      begin
        r := r + '-' + s;

        cbPhone.Text := r;

        cbPhone.SelStart := Length(r) + 1;
        cbPhone.SelStart := 1;
      end;
    end;
  end;}
  SetOKEnabled;
end;

procedure TOrderParamForm.cbPhonePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  ePhone.Text := cbPhone.Text;
  ePhoneExit(nil);
end;

procedure TOrderParamForm.cbReasonPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderParamForm.cbSignalTypePropertiesChange(Sender: TObject);
begin
  if (qSignal.FieldByName('Color').AsInteger <> clNone) and (qSignal.FieldByName('Color').AsInteger <> 0) then
    sSignalTypeColor.Brush.Color := qSignal.FieldByName('Color').AsInteger
  else
    sSignalTypeColor.Brush.Style := bsClear;

  SetOKEnabled;
end;

procedure TOrderParamForm.cbSourceTypePropertiesChange(Sender: TObject);
begin
  if (qSource.FieldByName('Color').AsInteger <> clNone) and (qSource.FieldByName('Color').AsInteger <> 0) then
    sSourceTypeColor.Brush.Color := qSource.FieldByName('Color').AsInteger
  else
    sSourceTypeColor.Brush.Style := bsClear;

  SetOKEnabled;
end;

procedure TOrderParamForm.cbStatusTypeColorPropertiesChange(Sender: TObject);
begin
  if (qStatus.FieldByName('Color').AsInteger <> clNone) and (qStatus.FieldByName('Color').AsInteger <> 0) then
    sStatusTypeColor.Brush.Color := qStatus.FieldByName('Color').AsInteger
  else
    sStatusTypeColor.Brush.Style := bsClear;

  FillReason;

  lNeedCallDate.Enabled := qStatus.FieldByName('NeedCall').AsInteger = 1;
  eNeedCallDate.Enabled := qStatus.FieldByName('NeedCall').AsInteger = 1;

  SetOKEnabled;
end;

procedure TOrderParamForm.ClearDiscount;
  var
    vRecNo : integer;
begin
  try
    vRecNo := mdWork.RecNo;
    mdWork.DisableControls;

    mdWork.First;
    while not mdWork.eof do
    begin
      mdWork.Edit;
      mdWork.FieldByName('ID_Discount').Value := null;
      mdWork.FieldByName('ID_DiscountPromo').Value := null;
      mdWork.FieldByName('DiscountPercent').Value := null;
      mdWork.FieldByName('DiscountSum').Value := null;
      mdWork.FieldByName('DiscountPromoPercent').Value := null;
      mdWork.FieldByName('DiscountPromoSum').Value := null;
      mdWork.FieldByName('DiscountDebtType').Value := null;
      mdWork.FieldByName('DiscountSubType').Value := null;
      mdWork.FieldByName('DiscountCanAdd').Value := null;
      mdWork.FieldByName('DiscountMinOrderSum').Value := null;
      mdWork.FieldByName('DiscountPromoDebtType').Value := null;
      mdWork.FieldByName('DiscountPromoSubType').Value := null;
      mdWork.FieldByName('DiscountPromoCanAdd').Value := null;
      mdWork.FieldByName('DiscountPromoMinOrderSum').Value := null;

      mdWork.FieldByName('TotalPrice').Value := mdWork.FieldByName('WorkPrice').AsFloat;
      mdWork.FieldByName('TotalSum').Value := mdWork.FieldByName('WorkSum').AsFloat;

      mdWork.Post;

      mdWork.Next;
    end;

  finally
    mdWork.RecNo := vRecNo;
    mdWork.EnableControls;
  end;
end;

procedure TOrderParamForm.ClearDiscountPromo;
  var
    vRecNo : integer;
begin
  try
    vRecNo := mdWork.RecNo;
    mdWork.DisableControls;

    mdWork.First;
    while not mdWork.eof do
    begin
      mdWork.Edit;
      mdWork.FieldByName('ID_DiscountPromo').Value := null;
      mdWork.FieldByName('DiscountPromoPercent').Value := null;
      mdWork.FieldByName('DiscountPromoSum').Value := null;
      mdWork.FieldByName('DiscountPromoDebtType').Value := null;
      mdWork.FieldByName('DiscountPromoSubType').Value := null;
      mdWork.FieldByName('DiscountPromoCanAdd').Value := null;
      mdWork.FieldByName('DiscountPromoMinOrderSum').Value := null;

      mdWork.FieldByName('TotalSum').Value := mdWork.FieldByName('WorkSum').AsFloat - mdWork.FieldByName('DiscountSum').AsFloat;
      mdWork.FieldByName('TotalPrice').Value := RoundH(mdWork.FieldByName('TotalSum').AsFloat / mdWork.FieldByName('WorkAmount').AsFloat);

      mdWork.Post;

      mdWork.Next;
    end;

  finally
    mdWork.RecNo := vRecNo;
    mdWork.EnableControls;
  end;
end;

procedure TOrderParamForm.ClipboardMonitorChange(Sender: TObject);
begin
  sbCopy.Enabled := cbPhone.Text <> '';
  sbPaste.Enabled := Clipboard.AsText <> '';
end;

procedure TOrderParamForm.DeleteDiscountPromo;
begin
  FIDDiscountTypePromo := 0;
  ClearDiscountPromo;
end;

function TOrderParamForm.DeleteMaterial: integer;
begin

end;

function TOrderParamForm.DeleteWork: integer;
begin
  mdWork.Delete;
end;

function TOrderParamForm.DiscountApply(AIDDiscountType: integer) : boolean;
  var
    v : variant;
    vSize, vAmount, vMinOrderSum, vDiscountSum, vDiscountSumMax,
    vDiscountPrice, vSum, vPrice,
    vAllSum, vSizeSum : double;
    vIDWorkType, vType, vSubType, vDebtType, vCanAdd, vRecNo, vAllWorkType : integer;
begin
  Result := false;

  if mdWork.RecordCount = 0 then Exit;

  qDiscountWorkType.Close;
  qDiscountWorkType.ParamByName('ID').AsInteger := AIDDiscountType;
  qDiscountWorkType.Open;

  v := Datas.ReadValues('discounttype', 'type;size;subtype;debttype;canadd;minordersum;allworktype', AIDDiscountType);

  //полная сумма чека подготовлена заранее
  vAllSum := FTotalSumFull;

  vType := IsNull(v[0], 0);
  vSize := IsNull(v[1], 0);
  vSubType := IsNull(v[2], 0);
  vDebtType := IsNull(v[3], 0);
  vCanAdd := IsNUll(v[4], 0);
  vMinOrderSum := IsNUll(v[5], 0);
  vAllWorkType := IsNUll(v[6], 0);

  mdWork.First;
  vSizeSum := 0;
  vRecNo := 0;
  while not mdWork.eof do
  begin
    vSum := mdWork.FieldByName('WorkSum').AsFloat;
    vPrice := mdWork.FieldByName('WorkPrice').AsFloat;
    vAmount := mdWork.FieldByName('WorkAmount').AsFloat;
    vIDWorkType := mdWork.FieldByName('ID_WorkType').AsInteger;

    if vType = 0 then
    begin
      //процент, берем от каждой позиции, вне зависимости от того, на весь чек или на позицию действует
      vDiscountSum := RoundH(vSum * vSize / 100);
    end
    else
      if vSubType = 0 then
      begin
        //сумма, действующая на позицию
        vDiscountSum := vAmount * vSize;
      end
      else
      begin
        //сумма, действующая на весь чек, надо разбить пропорционально
        vDiscountSum := RoundH(vSum / vAllSum * vSize);

        if vRecNo = -1 then
        begin
          vRecNo := mdWork.RecNo;
          vDiscountSumMax := vDiscountSum;
        end
        else
          if RoundH(vDiscountSumMax) < RoundH(vDiscountSum) then
          begin
            vRecNo := mdWork.RecNo;
            vDiscountSumMax := vDiscountSum;
          end;
      end;

    if (vType = 1) and (vSubType = 1) then
      vSizeSum := vSizeSum + vDiscountSum;

    //применяем скидку, если она действует на все виды услуг или действует на данную позицию
    //и при этом сумма скидки больше, чем сохраненная в позиции
    if (vAllWorkType = 1) or qDiscountWorkType.Locate('ID_WorkType', vIDWorkType, []) and (RoundH(mdWork.FieldBYName('DiscountSum').AsFloat) < RoundH(vDiscountSum)) then
    begin
      mdWork.Edit;

      mdWork.FieldByName('ID_Discount').Value := AIDDiscountType;

      if vType = 0 then
        mdWork.FieldByName('DiscountPercent').Value := vSize;

      mdWork.FieldByName('DiscountDebtType').Value := vDebtType;
      mdWork.FieldByName('DiscountSubType').Value := vSubType;
      mdWork.FieldByName('DiscountCanAdd').Value := vCanAdd;
      mdWork.FieldByName('DiscountMinOrderSum').Value := vMinOrderSum;

      mdWork.FieldBYName('DiscountSum').AsFloat := vDiscountSum;

      mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat, 0);

      vDiscountPrice := RoundH(mdWork.FieldBYName('TotalSum').AsFloat / vAmount);

      mdWork.FieldBYName('TotalPrice').AsFloat := vDiscountPrice;

      mdWork.Post;

      Result := true;
    end;

    mdWork.Next;
  end;

  //теперь сохраняем "последнюю копейку", если было действие на весь чем и
  //тип скидки = сумма и вычет из всего чека
  if (vAllWorkType = 1) and (vType = 1) and (vSubType = 1) and (vSize <> vSizeSum) then
  begin
    //был алгоритм расчета суммы скидкина весь чек
    mdWork.RecNo := vRecNo;
    mdWork.Edit;

    mdWork.FieldByName('DiscountSum').AsFloat := mdWork.FieldByName('DiscountSum').AsFloat + vSize - vSizeSum;

    mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat, 0);

    vDiscountPrice := RoundH(mdWork.FieldBYName('TotalSum').AsFloat / vAmount);

    mdWork.FieldBYName('TotalPrice').AsFloat := vDiscountPrice;

    mdWork.Post;
  end;

  qDiscountWorkType.Close;
end;

procedure TOrderParamForm.DiscountFind;
  var
    vSum1, vSum2, vSum : double;
    r1, r2 : boolean;
begin
  //очизщаем предыдущие скидки
  ClearDiscount;

  //сохраняем сумму без скидок
  vSum1 := 0;
  vSum2 := 0;
  vSum := GetTotalSum;
  FTotalSumFull := vSum;

  //подбор одной скидки, действие которой распространяется на любые услуги
  r1 := DiscountFindAll(vSum1);

  //запоминаем на всякий пожарный на случай восстановления
  if r1 then StoreCheck;

  //подбираем комплект скидок, действующих на определенные позиции
  r2 := DiscountFindOne(vSum2);

  //сравниваем результаты
  if r1 and r2 then
  begin
    //если оказалось, что скидка действующая на все услуги была лучше,
    //то возвращаем ее
    if RoundH(vSum1) <= RoundH(vSum2) then
      RestoreCheck;
  end
  else
    if r1 then
      RestoreCheck;

  //в остальных случаях или нет скидок, т.е. ничего не сработало
  //или сработал только один алгоритм, его и оставляем

  //теперь восстанавливаем промо, если указан
  DiscountPromoApply(FIDDiscountTypePromo);
  UpdateDiscountPromoInfo;
end;

function TOrderParamForm.DiscountFindAll(var ACheckSum : double) : boolean;
  var
    vSumDT, vSum : double;
    vIDDT, vID : integer;
    vRecNo : integer;
begin
  Result := false;
  try
    vRecNo := mdWork.RecNo;
    mdWork.DisableControls;

    //получаем полную сумму заказа
    //подготовлена заранее
    vSum := FTotalSumFull;

    //перебираем скидки, действующие на весь чек
    qDiscount.Close;
    qDiscount.ParamByName('DT').AsString := DateToSQLDate(Date);
    qDiscount.ParamByName('AWT').AsInteger := 1;//действует на все виды работ
    qDiscount.ParamByName('SM').AsFloat := vSum;
    qDiscount.Open;

//    ShowDatasetModal(qDiscount);

    qDiscount.First;
    vSumDT := vSum;
    vIDDT := 0;
    while not qDiscount.eof do
    begin
      vID := qDiscount.FieldByName('ID').AsInteger;

      ClearDiscount;

      Result := DiscountApply(vID) or Result;

      vSum := GetTotalSum;

      if (vIDDT = 0) or (RoundH(vSum) < RoundH(vSumDT)) then
      begin
//        Result := true;
        vIDDT := vID;
        vSumDT := vSum;
      end;

      qDiscount.Next;
    end;
    qDiscount.Close;

    if Result then
    begin
      ACheckSum := vSumDT;
    end;
  finally
    mdWork.RecNo := vRecNo;
    mdWork.EnableControls;
  end;
end;

function TOrderParamForm.DiscountFindOne(var ACheckSum: double): boolean;
  var
    vSum : double;
    vID : integer;
    vRecNo : integer;
begin
  Result := false;
  try
    vRecNo := mdWork.RecNo;
    mdWork.DisableControls;

    //перебираем скидки, действующие на весь чек
    qDiscount.Close;
    qDiscount.ParamByName('DT').AsString := DateToSQLDate(Date);
    qDiscount.ParamByName('AWT').AsInteger := 0;//действует на определенные услуги
    qDiscount.Open;

    //очищаем все скидки, чтоб подобрать лучшие скидки для каждой позиции в отдельности
    if qDiscount.RecordCount > 0 then
      ClearDiscount;

    qDiscount.First;
    while not qDiscount.eof do
    begin
      vID := qDiscount.FieldByName('ID').AsInteger;

      Result := Result or DiscountApply(vID);

      qDiscount.Next;
    end;
    qDiscount.Close;

    if Result then
    begin
      vSum := GetTotalSum;
      ACheckSum := vSum;
    end;
  finally
    mdWork.RecNo := vRecNo;
    mdWork.EnableControls;
  end;
end;

function TOrderParamForm.DiscountPromoApply(AIDDiscountType: integer): boolean;
begin
  Result := DiscountPromoApply1(AIDDiscountType)
end;

function TOrderParamForm.DiscountPromoApply1(AIDDiscountType : integer) : boolean;
  var
    v : variant;
    vSize, vAmount, vMinOrderSum, vDiscountSum, vDiscountSumMax,
    vDiscountPrice, vSum, vPrice,
    vAllSum, vSizeSum : double;
    vIDWorkType, vType, vSubType, vDebtType, vCanAdd, vRecNo, vAllWorkType : integer;
    vRecNo0 : integer;
begin
  Result := false;

  FIDDiscountTypePromo := AIDDiscountType;

  if mdWork.RecordCount = 0 then Exit;

  try
    vRecNo0 := mdWork.RecNo;
    mdWork.DisableControls;

    qDiscountWorkType.Close;
    qDiscountWorkType.ParamByName('ID').AsInteger := AIDDiscountType;
    qDiscountWorkType.Open;

    v := Datas.ReadValues('discounttype', 'type;size;subtype;debttype;canadd;minordersum;allworktype', AIDDiscountType);

    //полная сумма чека, берем отдельно, так как может не быть подготовлена заранее, если мы считаем ПРОМО отдельно
    vAllSum := GetWorkSum;

    vType := IsNull(v[0], 0);
    vSize := IsNull(v[1], 0);
    vSubType := IsNull(v[2], 0);
    vDebtType := IsNull(v[3], 0);
    vCanAdd := IsNUll(v[4], 0);
    vMinOrderSum := IsNUll(v[5], 0);
    vAllWorkType := IsNUll(v[6], 0);

    mdWork.First;
    vSizeSum := 0;
    vRecNo := 0;
    while not mdWork.eof do
    begin
      vSum := mdWork.FieldByName('WorkSum').AsFloat;
      vPrice := mdWork.FieldByName('WorkPrice').AsFloat;
      vAmount := mdWork.FieldByName('WorkAmount').AsFloat;
      vIDWorkType := mdWork.FieldByName('ID_WorkType').AsInteger;

      if vType = 0 then
      begin
        //процент, берем от каждой позиции, вне зависимости от того, на весь чек или на позицию действует
        vDiscountSum := RoundH(vSum * vSize / 100);
      end
      else
        if vSubType = 0 then
        begin
          //сумма, действующая на позицию
          vDiscountSum := vAmount * vSize;
        end
        else
        begin
          //сумма, действующая на весь чек, надо разбить пропорционально
          vDiscountSum := RoundH(vSum / vAllSum * vSize);

          if vRecNo = -1 then
          begin
            vRecNo := mdWork.RecNo;
            vDiscountSumMax := vDiscountSum;
          end
          else
            if vDiscountSumMax < vDiscountSum then
            begin
              vRecNo := mdWork.RecNo;
              vDiscountSumMax := vDiscountSum;
            end;
        end;

      if (vType = 1) and (vSubType = 1) then
        vSizeSum := vSizeSum + vDiscountSum;

      //применяем скидку, если она действует на все виды услуг или действует на данную позицию
      //и при этом сумма скидки больше, чем сохраненная в позиции
      if (vAllWorkType = 1) or qDiscountWorkType.Locate('ID_WorkType', vIDWorkType, []) and (mdWork.FieldBYName('DiscountPromoSum').AsFloat < vDiscountSum) then
      begin
        mdWork.Edit;

        mdWork.FieldByName('ID_DiscountPromo').Value := AIDDiscountType;

        if vType = 0 then
          mdWork.FieldByName('DiscountPromoPercent').Value := vSize;

        mdWork.FieldByName('DiscountPromoDebtType').Value := vDebtType;
        mdWork.FieldByName('DiscountPromoSubType').Value := vSubType;
        mdWork.FieldByName('DiscountPromoCanAdd').Value := vCanAdd;
        mdWork.FieldByName('DiscountPromoMinOrderSum').Value := vMinOrderSum;

        mdWork.FieldBYName('DiscountPromoSum').AsFloat := vDiscountSum;

        if (mdWork.FieldByName('DiscountPromoCanAdd').AsInteger = 1) and (mdWork.FieldByName('DiscountCanAdd').AsInteger = 1) then
        begin
          //если скидка и промо складываются, то все просто - складываем скидки
          mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0);
        end
        else
        begin
          //или скидка или промо или обе не складываются, то вычисляем наилучшее значение и оставляем его
          mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - Max(mdWork.FieldBYName('DiscountSum').AsFloat, mdWork.FieldBYName('DiscountPromoSum').AsFloat), 0);
        end;

        vDiscountPrice := RoundH(mdWork.FieldBYName('TotalSum').AsFloat / vAmount);

        mdWork.FieldBYName('TotalPrice').AsFloat := vDiscountPrice;

        mdWork.Post;

        Result := true;
      end;

      mdWork.Next;
    end;

    //теперь сохраняем "последнюю копейку", если было действие на весь чем и
    //тип скидки = сумма и вычет из всего чека
    if (vAllWorkType = 1) and (vType = 1) and (vSubType = 1) and (vSize <> vSizeSum) then
    begin
      //был алгоритм расчета суммы скидкина весь чек
      mdWork.RecNo := vRecNo;
      mdWork.Edit;

      mdWork.FieldByName('DiscountPromoSum').AsFloat := mdWork.FieldByName('DiscountPromoSum').AsFloat + vSize - vSizeSum;

      if (mdWork.FieldByName('DiscountPromoCanAdd').AsInteger = 1) and (mdWork.FieldByName('DiscountCanAdd').AsInteger = 1) then
      begin
        //если скидка и промо складываются, то все просто - складываем скидки
        mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0)
      end
      else
      begin
        //или скидка или промо или обе не складываются, то вычисляем наилучшее значение и оставляем его
        mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - Max(mdWork.FieldBYName('DiscountSum').AsFloat, mdWork.FieldBYName('DiscountPromoSum').AsFloat), 0);
      end;

      vDiscountPrice := RoundH(mdWork.FieldBYName('TotalSum').AsFloat / vAmount);

      mdWork.FieldBYName('TotalPrice').AsFloat := vDiscountPrice;

      mdWork.Post;
    end;

    qDiscountWorkType.Close;
  finally
    mdWork.RecNo := vRecNo0;
    mdWork.EnableControls;
  end;
end;

function TOrderParamForm.DiscountPromoApply2(AIDDiscountType: integer): boolean;
  var
    v : variant;
    vSize, vAmount, vMinOrderSum, vDiscountSum, vDiscountSumMax,
    vDiscountPrice, vSum, vPrice,
    vAllSum, vSizeSum : double;
    vIDWorkType, vType, vSubType, vDebtType, vCanAdd, vRecNo, vAllWorkType : integer;
    vRecNo0 : integer;
    vDAll, vDPAll : boolean;//флаг того, что скидка действует на весь чек
    vDAdd, vDPAdd : boolean;//флаги складывания
    vDExists, vDPExists : boolean;//существует хоть одна скидка или промо
    vDExistsNotAdd, vDPExistsNotAdd : boolean;//существует хоть одна скидка или промо которая не складывается
begin
  Result := false;

  FIDDiscountTypePromo := AIDDiscountType;

  if mdWork.RecordCount = 0 then Exit;

  try
    vRecNo0 := mdWork.RecNo;
    mdWork.DisableControls;

    qDiscountWorkType.Close;
    qDiscountWorkType.ParamByName('ID').AsInteger := AIDDiscountType;
    qDiscountWorkType.Open;

    v := Datas.ReadValues('discounttype', 'type;size;subtype;debttype;canadd;minordersum;allworktype', AIDDiscountType);

    //полная сумма чека, берем отдельно, так как может не быть подготовлена заранее, если мы считаем ПРОМО отдельно
    vAllSum := GetWorkSum;

    vType := IsNull(v[0], 0);
    vSize := IsNull(v[1], 0);
    vSubType := IsNull(v[2], 0);
    vDebtType := IsNull(v[3], 0);
    vCanAdd := IsNUll(v[4], 0);
    vMinOrderSum := IsNUll(v[5], 0);
    vAllWorkType := IsNUll(v[6], 0);

    mdWork.First;
    vSizeSum := 0;
    vRecNo := 0;
    while not mdWork.eof do
    begin
      vSum := mdWork.FieldByName('WorkSum').AsFloat;
      vPrice := mdWork.FieldByName('WorkPrice').AsFloat;
      vAmount := mdWork.FieldByName('WorkAmount').AsFloat;
      vIDWorkType := mdWork.FieldByName('ID_WorkType').AsInteger;

      if vType = 0 then
      begin
        //процент, берем от каждой позиции, вне зависимости от того, на весь чек или на позицию действует
        vDiscountSum := RoundH(vSum * vSize / 100);
      end
      else
        if vSubType = 0 then
        begin
          //сумма, действующая на позицию
          vDiscountSum := vAmount * vSize;
        end
        else
        begin
          //сумма, действующая на весь чек, надо разбить пропорционально
          vDiscountSum := RoundH(vSum / vAllSum * vSize);

          if vRecNo = -1 then
          begin
            vRecNo := mdWork.RecNo;
            vDiscountSumMax := vDiscountSum;
          end
          else
            if vDiscountSumMax < vDiscountSum then
            begin
              vRecNo := mdWork.RecNo;
              vDiscountSumMax := vDiscountSum;
            end;
        end;

      if (vType = 1) and (vSubType = 1) then
        vSizeSum := vSizeSum + vDiscountSum;

      //применяем скидку, если она действует на все виды услуг или действует на данную позицию
      //и при этом сумма скидки больше, чем сохраненная в позиции
      if (vAllWorkType = 1) or qDiscountWorkType.Locate('ID_WorkType', vIDWorkType, []) and (mdWork.FieldBYName('DiscountPromoSum').AsFloat < vDiscountSum) then
      begin
        mdWork.Edit;

        mdWork.FieldByName('ID_DiscountPromo').Value := AIDDiscountType;

        if vType = 0 then
          mdWork.FieldByName('DiscountPromoPercent').Value := vSize;

        mdWork.FieldByName('DiscountPromoDebtType').Value := vDebtType;
        mdWork.FieldByName('DiscountPromoSubType').Value := vSubType;
        mdWork.FieldByName('DiscountPromoCanAdd').Value := vCanAdd;
        mdWork.FieldByName('DiscountPromoMinOrderSum').Value := vMinOrderSum;

        mdWork.FieldBYName('DiscountPromoSum').AsFloat := vDiscountSum;

{        if (mdWork.FieldByName('DiscountPromoCanAdd').AsInteger = 1) and (mdWork.FieldByName('DiscountCanAdd').AsInteger = 1) then
        begin
          //если скидка и промо складываются, то все просто - складываем скидки
          mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0)
        end
        else
        begin
          //или скидка или промо или обе не складываются, то вычисляем наилучшее значение и оставляем его
          mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - Max(mdWork.FieldBYName('DiscountSum').AsFloat, mdWork.FieldBYName('DiscountPromoSum').AsFloat), 0);
        end;

        vDiscountPrice := RoundH(mdWork.FieldBYName('TotalSum').AsFloat / vAmount);

        mdWork.FieldBYName('TotalPrice').AsFloat := vDiscountPrice;}

        mdWork.Post;

        Result := true;
      end;

      mdWork.Next;
    end;

    //теперь сохраняем "последнюю копейку", если было действие на весь чем и
    //тип скидки = сумма и вычет из всего чека
    if (vAllWorkType = 1) and (vType = 1) and (vSubType = 1) and (vSize <> vSizeSum) then
    begin
      //был алгоритм расчета суммы скидкина весь чек
      mdWork.RecNo := vRecNo;
      mdWork.Edit;

      mdWork.FieldByName('DiscountPromoSum').AsFloat := mdWork.FieldByName('DiscountPromoSum').AsFloat + vSize - vSizeSum;

{      if (mdWork.FieldByName('DiscountPromoCanAdd').AsInteger = 1) and (mdWork.FieldByName('DiscountCanAdd').AsInteger = 1) then
      begin
        //если скидка и промо складываются, то все просто - складываем скидки
        mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0)
      end
      else
      begin
        //или скидка или промо или обе не складываются, то вычисляем наилучшее значение и оставляем его
        mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - Max(mdWork.FieldBYName('DiscountSum').AsFloat, mdWork.FieldBYName('DiscountPromoSum').AsFloat), 0);
      end;

      vDiscountPrice := RoundH(mdWork.FieldBYName('TotalSum').AsFloat / vAmount);

      mdWork.FieldBYName('TotalPrice').AsFloat := vDiscountPrice;}

      mdWork.Post;
    end;

    //получили столбец промо и столбец скидки
    //смотрим, были ли скидки, на весь ли чек и какого рода
    if (mdWork.REcordCount > 0) then
    begin
      //проверяем действие скидки и действие промо в первой записи, если она есть
      //если в записи стоит, что скидка действует на весь чек, то остальные строки
      //проверять смысла нет, там тоже будет действие на весь чек
      vDAll := mdWork.FieldByName('DiscountSubType').AsInteger = 1;
      vDPAll := mdWork.FieldByName('DiscountPromoSubType').AsInteger = 1;

      vDAdd := mdWork.FieldByName('DiscountCanAdd').AsInteger = 1;
      vDPAdd := mdWork.FieldByName('DiscountPromoCanAdd').AsInteger = 1;

      //эти флаги дают возможность отменять сразу для всех записей действие скидки,
      //если применяем промо, считаем промо более приоритетным
      //появляется несколько веток, если все складывается, то в результате все складываем

      //проверяем существование хоть одной скидки или промо
      vDExists := false;
      vDExistsNotAdd := false;
      mdWork.First;
      while not mdWork.eof do
      begin
        vDExists := vDExists or (mdWork.FieldByName('ID_Discount').AsInteger <> 0);
        vDExistsNotAdd := vDExistsNotAdd or (mdWork.FieldByName('ID_Discount').AsInteger <> 0) and (mdWork.FieldByName('DiscountCanAdd').AsInteger = 0);
        mdWork.Next;
      end;
      vDPExists := false;
      vDPExistsNotAdd := false;
      mdWork.First;
      while not mdWork.eof do
      begin
        vDPExists := vDPExists or (mdWork.FieldByName('ID_DiscountPromo').AsInteger <> 0);
        vDPExistsNotAdd := vDPExistsNotAdd or (mdWork.FieldByName('ID_DiscountPromo').AsInteger <> 0) and (mdWork.FieldByName('DiscountPromoCanAdd').AsInteger = 0);
        mdWork.Next;
      end;

      mdWork.First;
      while not mdWork.eof do
      begin
        mdWork.Edit;

        if (FIDDiscountTypePromo = 0) then
        begin
          mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat, 0);
        end
        else
        begin
          if vDAll and vDPAll then
            if vDAdd and vDPAdd then
            begin
              mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0);
            end
            else
            begin
              mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0);
            end
          else
            if vDAll and vDPExists then
            begin
              mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0);
            end
            else
              if (mdWork.FieldBYName('DiscountCanAdd').AsInteger = 1) and (mdWork.FieldBYName('DiscountPromoCanAdd').AsInteger = 1) then
              begin
                //и скидка и промо на весь чек и все складывается
                mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0)
              end
              else
              begin
                //или скидка или промо или обе не складываются, то оставляем промо, даже если применился по промо ноль
                //ведь оно действует на весь чек
                mdWork.FieldBYName('TotalSum').AsFloat := Max(mdWork.FieldBYName('WorkSum').AsFloat - mdWork.FieldBYName('DiscountPromoSum').AsFloat, 0);
              end;
        end;

        vDiscountPrice := RoundH(mdWork.FieldBYName('TotalSum').AsFloat / vAmount);

        mdWork.FieldBYName('TotalPrice').AsFloat := vDiscountPrice;

        mdWork.Post;

        mdWork.Next;
      end;
    end;

    qDiscountWorkType.Close;
  finally
    mdWork.RecNo := vRecNo0;
    mdWork.EnableControls;
  end;
end;

procedure TOrderParamForm.DoRequestAddressJSon;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/json';
  Accept := 'application/json';
  Token := FToken;
  Body := '"query": "' + eAddress.Text + '"';
  if FLocations <> '' then Body := Body + ', ' + FLocations;
  Body := '{' + Body + '}';

  FJSON := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TOrderParamForm.DoRequestAddressJSon1;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/json';
  Accept := 'application/json';
  Token := FToken;
  Body := '"query": "' + eAddress.Text + '", "count" : 1';
  if FLocations <> '' then Body := Body + ', ' + FLocations;
  Body := '{' + Body + '}';

  FJSON := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TOrderParamForm.DoRequestAddressXML;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/xml';
  Accept := 'application/xml';
  Token := FToken;
  Body := '<req><query>' + eAddress.Text + '</query></req>';
  FXML := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TOrderParamForm.DoRequestAddressXML1;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/xml';
  Accept := 'application/xml';
  Token := FToken;
  Body := '<req><query>' + eAddress.Text + '</query><count>1</count></req>';
  FXML := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TOrderParamForm.bClearClick(Sender: TObject);
begin
  if ShowMsg('Действительно очистить поля для ввода даты, времени и мастера?', smtInformation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
  begin
    eResDate.Text := '';
    eResTime.Time := 0;

    FIDWorker := 0;
    UpdateWorker;
  end;
end;

procedure TOrderParamForm.bResAutoClick(Sender: TObject);
  var
    vClientDateTime : string;
    vTimeLen, vIDDistrict : integer;
    vResDate : TDate;
    vResTime : double;
    vIDWorker : integer;
    r : integer;
begin
  if cbDistrict.ItemIndex = -1 then
  begin
    ShowMsg('Не указан район города!', smtInformation, [smbOK], smbOK, smbOK, 5);
    Exit;
  end;

  if mdWork.RecordCount = 0 then
  begin
    ShowMsg('Не указано ни одной работы!', smtInformation, [smbOK], smbOK, smbOK, 5);
    Exit;
  end;

  eResDate.Enabled := false;
  eResTime.Enabled := false;

  eResMaster.Enabled := false;

//  ShowMsg('Окно подбора времени и мастера!', smtInformation, [smbOK], smbOK, smbOK, 5);

  vClientDateTime := eClientTime.Text;
  vTimeLen := eTimeLen.Value;
  vIDDistrict := GetIDByItemIndex(cbDistrict);

  vResDate := eResDate.Date;
  vResTime := eResTime.Time;
  vIDWorker := FIDWorker;

  r := GetOrderListWorkerTimeParams(FID, mdWork, vClientDateTime, vTimeLen, vIDDistrict, vResDate, vResTime, vIDWorker);

  if r = mrOK then
  begin
    eResDate.Date := vResDate;
    eResTime.Time := vResTime;
    FIDWorker := vIDWorker;
    UpdateWorker;
  end;
end;

procedure TOrderParamForm.eAddressEnter(Sender: TObject);
begin
  FLastAddress := eAddress.Text;

  eAddressPropertiesChange(Sender);
end;

procedure TOrderParamForm.eAddressExit(Sender: TObject);
begin
  //получаем одно наиболее подходящее значение и из него все читаем
//  DoRequestAddressJSon1;
  if eAddress.Text = '' then Exit;
//  if eAddress.Text = FLastAddress then Exit;

  //чтение при выходе района и метро
  DoRequestAddressXML1;

  FillInfoFromDadata;
end;

procedure TOrderParamForm.eAddressKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
  begin
    if eAddress.DroppedDown then
    begin
      eAddress.DroppedDown := false;
      eAddress.SelLength := 0;
      eAddress.SelStart := Length(eAddress.Text);

      eAddress.Properties.Items.BeginUpdate;
      eAddress.Properties.Items.Clear;
      eAddress.Properties.Items.EndUpdate;

      Exit;
    end;

    Key := vk_Tab;
  end;
end;

procedure TOrderParamForm.eAddressPropertiesChange(Sender: TObject);
begin
  if not eAddress.Focused then Exit;

  if Length(eAddress.Text) < 3 then Exit;

  if eAddress.Properties.Items.IndexOf(eAddress.Text) >= 0 then
  begin
    eAddress.SelLength := 0;
    eAddress.SelStart := Length(eAddress.Text);

    Exit;
  end;

  if eAddress.Text = '' then
  begin
    eAddress.Properties.Items.BeginUpdate;
    eAddress.Properties.Items.Clear;
    eAddress.Properties.Items.EndUpdate;

    Exit;
  end;

  StartAddressTimer;
end;

procedure TOrderParamForm.eAddressPropertiesPopup(Sender: TObject);
begin
//  FillAddressList;
end;

procedure TOrderParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

function TOrderParamForm.EditGuideMaterial: integer;
  var
    vName, vCode, vCategory, vComment : string;
    vAmount : double;
    vUnit : string;
    vPrice : double;
    vIDMaterialType : integer;
    r : integer;
    v :variant;
begin
  with mdMaterial do
  begin
    vName := FieldByName('MaterialName').AsString;
    vAmount := FieldByName('MaterialAmount').AsFloat;
    vUnit := FieldByName('MaterialUnitName').AsString;
    vPrice := FieldByName('MaterialPrice').AsFloat;
    vIDMaterialType := FieldByName('ID_MaterialType').AsInteger;
    v := Datas.ReadValues('materialtype', 'Code;Category;Comment');
    vCode := IsNull(v[0], '');
    vCategory := IsNull(v[1], '');
    vComment := IsNull(v[2], '');
  end;

  Result := GetOrderListMaterialTypeGuideParams(
    vCategory,
    vCode,
    vName,
    vAmount,
    vUnit,
    vPrice,
    vComment,
    vIDMaterialType
    );

    if Result = mrAbort then
    begin
      mdMaterial.Delete
    end
    else
      if Result = mrOK then
      begin
        mdMaterial.Edit;
        mdMaterial.FieldByName('MaterialName').AsString := vName;
        mdMaterial.FieldByName('MaterialAmount').AsFloat := vAmount;
        mdMaterial.FieldByName('MaterialPrice').AsFloat := vPrice;

        mdMaterial.FieldByName('MaterialSum').AsFloat := mdMaterial.FieldByName('MaterialPrice').AsFloat * mdMaterial.FieldByName('MaterialAmount').AsFloat;

        mdMaterial.FieldByName('MaterialUnitName').AsString := vUnit;
        mdMaterial.FieldByName('MaterialCode').AsString := vCode;
        mdMaterial.FieldByName('ID_MaterialType').AsInteger := vIDMaterialType;

        mdMaterial.FieldByName('Edited').AsInteger := 1;

        mdMaterial.Post;
      end;
end;

function TOrderParamForm.EditMaterial: integer;
  var
    vName : string;
    vAmount : double;
    vUnit : string;
    vPrice : double;
    vIDMaterialType : integer;
    r : integer;
begin
  with mdMaterial do
  begin
    vName := FieldByName('MaterialName').AsString;
    vAmount := FieldByName('MaterialAmount').AsFloat;
    vUnit := FieldByName('MaterialUnitName').AsString;
    vPrice := FieldByName('MaterialPrice').AsFloat;
    vIDMaterialType := FieldByName('ID_MaterialType').AsInteger;
  end;

  Result := GetOrderListMaterialTypeParams(
    vName,
    vAmount,
    vUnit,
    vPrice,
    vIDMaterialType
    );

  if Result = mrAbort then
  begin
    mdMaterial.Delete
  end
  else
    if Result = mrOK then
    begin
      mdMaterial.Edit;
      mdMaterial.FieldByName('MaterialName').AsString := vName;
      mdMaterial.FieldByName('MaterialAmount').AsFloat := vAmount;
      mdMaterial.FieldByName('MaterialPrice').AsFloat := vPrice;
      mdMaterial.FieldByName('MaterialSum').AsFloat := mdMaterial.FieldByName('MaterialPrice').AsFloat * mdMaterial.FieldByName('MaterialAmount').AsFloat;
      mdMaterial.FieldByName('MaterialUnitName').AsString := vUnit;
      mdMaterial.FieldByName('ID_MaterialType').AsInteger := vIDMaterialType;
      mdMaterial.FieldByName('Edited').AsInteger := 1;
      mdMaterial.Post;
    end;
end;

function TOrderParamForm.EditWork : integer;
  var
    vIDWorkerClass : integer;
    vName : string;
    vAmount : double;
    vUnit : string;
    vPrice, vNorm : double;
    vWarrantyTime, vWarrantyType : integer;
    vIDWorkType : integer;
    r : integer;
begin
  with mdWork do
  begin
    vIDWorkerClass := FieldByName('ID_WorkerClass').AsInteger;
    vName := FieldByName('WorkName').AsString;
    vAmount := FieldByName('WorkAmount').AsFloat;
    vUnit := FieldByName('WorkUnitName').AsString;
    vPrice := FieldByName('WorkPrice').AsFloat;
    vNorm := FieldByName('WorkNorm').AsFloat;

    if FieldByName('WorkWarrantyType').AsString = '' then vWarrantyType := -1
    else vWarrantyType := FieldByName('WorkWarrantyType').AsInteger;
    vWarrantyTime := FieldByName('WorkWarrantyTime').AsInteger;

    vIDWorkType := FieldByName('ID_WorkType').AsInteger;
  end;

    Result := GetOrderListWorkTypeParams(
      vIDWorkerClass,
      vName,
      vAmount,
      vUnit,
      vPrice,
      vNorm,
      vWarrantyType,
      vWarrantyTime,
      vIDWorkType
      );

    if Result = mrAbort then
    begin
      mdWork.Delete
    end
    else
      if Result = mrOK then
      begin
        mdWork.Edit;
        mdWork.FieldByName('ID_WorkerClass').AsInteger := vIDWorkerClass;
        mdWork.FieldByName('WorkName').AsString := vName;
        mdWork.FieldByName('WorkAmount').AsFloat := vAmount;
        mdWork.FieldByName('WorkPrice').AsFloat := vPrice;

        mdWork.FieldByName('WorkSum').AsFloat := mdWork.FieldByName('WorkPrice').AsFloat * mdWork.FieldByName('WorkAmount').AsFloat;

        mdWork.FieldByName('WorkUnitName').AsString := vUnit;
        mdWork.FieldByName('WorkNorm').AsFloat := vNorm;
        mdWork.FieldByName('ID_WorkType').AsInteger := vIDWorkType;

//        mdWork.FieldByName('WorkWarrantyType').Value := 0;
//        mdWork.FieldByName('WorkWarrantyTime').Value := 0;

        mdWork.FieldByName('WorkWarrantyType').Value := NullIf(vWarrantyType, -1);
        if mdWork.FieldByName('WorkWarrantyType').Value = null then mdWork.FieldByName('WorkWarrantyTime').Value := null
        else mdWork.FieldByName('WorkWarrantyTime').AsInteger := vWarrantyTime;

        mdWork.FieldByName('TotalPrice').AsFloat := mdWork.FieldByName('WorkPrice').AsFloat;
        mdWork.FieldByName('TotalSum').AsFloat := mdWork.FieldByName('WorkSum').AsFloat;

        mdWork.FieldByName('Edited').AsInteger := 1;

        mdWork.Post;
      end;
end;

procedure TOrderParamForm.SelectDiscountPromo;
  var
     vID : integer;
begin
  vID := FIDDiscountTypePromo;
  if SelectDiscount(vID) then
  begin
    if FIDDiscountTypePromo <> vID then
    begin
      //очистка полей по промо
      ClearDiscountPromo;

      //расчет скидки по промо
      DiscountPromoApply(vID);

      UpdateDiscountPromoInfo;
    end;
  end;
end;

procedure TOrderParamForm.SetOKEnabled;
  var
    s : string;
begin
  s := PreparePhone(ePhone.Text);

  bOK.Enabled :=
    (Length(s) = 10) and IsIntegerByChar(s) and
    (cbPaymentForm.ItemIndex <> -1) and
    (IsNUll(cbSignalType.EditValue, 0) <> 0) and
    (IsNUll(cbSourceType.EditValue, 0) <> 0) and
    (IsNUll(cbStatusType.EditValue, 0) <> 0) and
    (cbReason.ItemIndex <> -1) and
    (not eNeedCallDate.Enabled or not eNeedCallDate.Visible or IsDateTime(eNeedCallDate.Text));

  GridChat.Enabled := not FAdd;
  bSend.Enabled := not FAdd;

  if not FAdd then
  begin
    if cbPhone.ItemIndex <> -1 then cbPhone.Enabled := false;
  end;

  aAddGuide.Enabled := true;
  aAddManual.Enabled := true;
  aEdit.Enabled := mdWork.RecordCount > 0;
  aDel.Enabled := mdWork.RecordCount > 0;

  aAddGuideMaterial.Enabled := true;
  aAddManualMaterial.Enabled := true;
  aEditMaterial.Enabled := mdMaterial.RecordCount > 0;
  aDelMaterial.Enabled := mdMaterial.RecordCount > 0;

  ClipboardMonitorChange(nil);
  sbCall.Enabled := cbPhone.Text <> '';

  if (FID <> 0) then
  begin
    cbPayed.Enabled := (eCheckNum.Text = '');

//    cbPaymentForm.Enabled := cbPayed.Enabled;
//    lPaymentForm.Enabled := cbPayed.Enabled;

    cbPaymentForm.Enabled := true;
    lPaymentForm.Enabled := true;

    eCheckNum.Enabled := cbPayed.Enabled;
    lCheckNum.Enabled := cbPayed.Enabled;
  end;
end;

procedure TOrderParamForm.SpeedButton1Click(Sender: TObject);
begin
  Clipboard.AsText := '';

  if FID = 0 then
  begin
    cbPhone.Text := '';
  end;

  eName.Text := '';
  eAddress.Text := '';
  eFlatNumber.Text := '';
  cbClientDomSPB.Checked := false;
  cbDistrict.Text := '';
  cbMetro.Text := '';
  eClientComment.Text := '';
end;

procedure TOrderParamForm.StartAddressTimer;
begin
  AddressTimer.Enabled := false;
  AddressTimer.Enabled := true;
end;

procedure TOrderParamForm.StoreCheck;
  var
    vRecNo : integer;
begin
  FStoreStream.Clear;
  vRecNo := mdWork.RecNo;
  try
    mdWork.DisableControls;
    mdWork.First;
    mdWork.SaveToStream(FStoreStream);
  finally
    mdWork.RecNo := vRecNo;
    mdWork.EnableControls;
  end;
end;

procedure TOrderParamForm.TimerChatTimer(Sender: TObject);
begin
  TimerChat.Enabled := false;
  try
    qChat.Refresh;
    qChat.Last;
  finally
    TimerChat.Enabled := true;
  end;
end;

procedure TOrderParamForm.UpdateCalcTime;
begin
  eCalcTime.Text := FormatDateTIme('dd.mm.yy', eResDate.Date) + ' ' + FormatDateTIme('hh:nn', eResTime.Time) + '-' + FormatDateTIme('hh:nn', IncHour(eResTime.Time, eTimeLen.Value));
end;

procedure TOrderParamForm.UpdateDiscountPromoInfo;
  var
    v : variant;
begin
  //обновляем информацию по промокоду
  if FIDDiscountTypePromo = 0 then
  begin
    ePromocode.Text := '';
  end
  else
  begin
    v := Datas.ReadValues('discounttype', 'promocode', FIDDiscountTypePromo);
    ePromocode.Text := IsNUll(v[0], '');
    if FPromoSum <> '0' then
      ePromocode.Text := ePromocode.Text + ' - ' + FPromoSum + ' р.';
  end;
end;

procedure TOrderParamForm.UpdateSummary;
  var
    h, w, m : double;
begin
  lInfo0.Caption := 'Работы: ' + IsNull(NullIf(ViewWork.DataController.Summary.FooterSummaryTexts[7], ''), '0') + ' р.';
  lInfo01.Caption := 'Материалы: ' + IsNull(NullIf(ViewMaterial.DataController.Summary.FooterSummaryTexts[2], ''), '0') + ' р.';

//  lInfo2.Caption := 'ВСЕГО: ' + IsNull(NullIf(ViewWork.DataController.Summary.FooterSummaryTexts[1], ''), '0') + ' р.';
  w := IsNull(ViewWork.DataController.Summary.FooterSummaryValues[1], 0);//сумма по работам
  m := IsNull(ViewMaterial.DataController.Summary.FooterSummaryValues[1], 0);//сумма по материалам
  lInfo2.Caption := 'ВСЕГО: ' + FormatFloat(',0', m + w) + ' р.';

  lInfo21.Caption := 'Скидка/Промо: ' + IsNull(NullIf(ViewWork.DataController.Summary.FooterSummaryTexts[5], ''), '0') + ' р.';
  if (IsNUll(NullIf(ViewWork.DataController.Summary.FooterSummaryTexts[5], ''), '0') <> '0') then
    lInfo21.Style.TextColor := clRed
  else
    lInfo21.Style.TextColor := clBlack;

  FPromoSum := IsNull(NullIf(ViewWork.DataController.Summary.FooterSummaryTexts[6], ''), '0');

  h := IsNUll(ViewWork.DataController.Summary.FooterSummaryValues[2], 0) / 60;
  if ((h - trunc(h)) * 60) > 0 then h := trunc(h) + 1;

  lInfo1.Caption := 'Работ: ' + ViewWork.DataController.Summary.FooterSummaryTexts[0];
  lInfo11.Caption := 'Длительность: ' + FloatToStr(IsNull(ViewWork.DataController.Summary.FooterSummaryValues[2], 0)) + ' м. ≈ ' + FloatToStr(h) + ' ч.';

//  eTimeCalc.Properties.Buttons.Items[1].Caption := FloatToStr(h) + ' ч.';
//  eTimeLen.Value := h;

  UpdateDiscountPromoInfo;
end;

procedure TOrderParamForm.UpdateTime;
  var
    h : double;
begin
  h := IsNUll(ViewWork.DataController.Summary.FooterSummaryValues[2], 0) / 60;
  if ((h - trunc(h)) * 60) > 0 then h := trunc(h) + 1;

  eTimeCalc.Properties.Buttons.Items[1].Caption := FloatToStr(h) + ' ч.';
  eTimeLen.Value := h;
end;

procedure TOrderParamForm.UpdateWorker;
  var
    v : variant;
    p, cl : string;
begin
  v := Datas.ReadValuesSQL('select Concat(Surname, '' '', Name) as Name, ID, Phone, WorkerCategoryList(ID) as CatList from Worker where ID = ' + IntToStr(FIDWorker), 'Name;Phone;CatList;ID');

  if IsNUll(v[3], 0) = 0 then
  begin
    eResMaster.Text := '';
  end
  else
  begin
    p := PhoneFormat(IsNull(v[1], ''));
    cl := IsNull(v[2], '');

    eResMaster.Text := IsNull(v[0], '') + ', +7' + p + ', (' + cl + ')';
  end;
end;

procedure TOrderParamForm.ViewChatStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if IsNull(AREcord.Values[ViewChatID_User.Index], 0) <> 0 then AStyle := ChatStyleUser
  else AStyle := ChatStyleWorker;
end;

procedure TOrderParamForm.ViewChatStylesGetPreviewStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if IsNull(AREcord.Values[ViewChatID_User.Index], 0) <> 0 then AStyle := ChatStyleTextUser
  else AStyle := ChatStyleTextWorker;
end;

procedure TOrderParamForm.ViewMaterialCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  aEditMaterial.Execute;
//  DiscountFind;
//  UpdateTime;
end;

procedure TOrderParamForm.ViewMaterialDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  UpdateSummary;
end;

procedure TOrderParamForm.ViewMaterialPriceGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
begin
  AHintText := FormatFloat(',0.##', IsNull(ARecord.Values[ViewMaterialMaterialPrice.Index], 0))
end;

procedure TOrderParamForm.ViewMaterialSumGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
begin
  AHintText := FormatFloat(',0.##', IsNull(ARecord.Values[ViewMaterialMaterialSum.Index], 0));
end;

procedure TOrderParamForm.ViewWorkCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  EditWork;
  DiscountFind;
  UpdateTime;
end;

procedure TOrderParamForm.ViewWorkDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  UpdateSummary;
end;

procedure TOrderParamForm.ViewWorkNavigatorButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  Case AButtonIndex of
    6 : begin
          //добавление
          AddGuide;
          DiscountFind;
          ADone := true;
        end;
    7 : begin
          //добавление
          AddManual;
          DiscountFind;
          ADone := true;
        end;
    8 : begin
          //удаление штатным способом
          ADone := false;
        end;
    9 : begin
          //редактирование в окне
          if mdWork.RecordCount = 0 then AddManual
          else EditWork;
          DiscountFind;
          ADone := true;
        end;
  End;
end;

procedure TOrderParamForm.ViewWorkPriceGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
begin
  if IsNUll(ARecord.Values[ViewWorkDiscountSumRes.Index], 0) > 0 then
    AHintText := FormatFloat(',0', IsNull(ARecord.Values[ViewWorkWorkPrice.Index], 0))
//    AHintText := FloatToStrF(IsNull(ARecord.Values[ViewWorkWorkPrice.Index], 0), ffFixed, 18, 2);
end;

procedure TOrderParamForm.ViewWorkPriceStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if IsNUll(ARecord.Values[ViewWorkDiscountSumRes.Index], 0) > 0 then
    AStyle := StyleDiscount;
end;

procedure TOrderParamForm.ViewWorkSumGetCellHint(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; ACellViewInfo: TcxGridTableDataCellViewInfo;
  const AMousePos: TPoint; var AHintText: TCaption;
  var AIsHintMultiLine: Boolean; var AHintTextRect: TRect);
begin
  if IsNUll(ARecord.Values[ViewWorkDiscountSumRes.Index], 0) > 0 then
    AHintText := FormatFloat(',0', IsNull(ARecord.Values[ViewWorkWorkSum.Index], 0));
//    AHintText := FloatToStrF(IsNull(ARecord.Values[ViewWorkWorkSum.Index], 0), ffFixed, 18, 2);
end;

procedure TOrderParamForm.ViewWorkSumStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if IsNUll(ARecord.Values[ViewWorkDiscountSumRes.Index], 0) > 0 then
    AStyle := StyleDiscount;
end;

procedure TOrderParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TOrderParamForm.eNeedCallPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderParamForm.ePhoneExit(Sender: TObject);
  var
    s : string;
    n : integer;
begin
  s := PreparePhone(ePhone.Text);
  tClient.Close;
  tClient.ParamByName('P').AsString := s;
  tClient.Open;
  if tClient.RecordCount = 1 then
  begin
    FIDClient := tClient.FieldByName('ID').AsInteger;
    FillClientInfo;

    //по заданию апреля 2023 проверяем район и метро у выбранного адреса
    //если не указано что-то, то запрашиваем у Dadata и заполняем
    if (Trim(cbDistrict.Text) = '') or (Trim(cbMetro.Text) = '') then
    begin
      //чтение при выходе района и метро
      DoRequestAddressXML1;

      FillInfoFromDadata;
    end;
  end;

  SetOKEnabled;
end;

procedure TOrderParamForm.ePhonePropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderParamForm.ePromocodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  case AButtonIndex of
    0 : SelectDiscountPromo;
    1 : DeleteDiscountPromo;
  end;
end;

procedure TOrderParamForm.eRequestTextPropertiesChange(
  Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderParamForm.eResDatePropertiesChange(Sender: TObject);
begin
  UpdateCalcTime;
end;

procedure TOrderParamForm.eResMasterPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    vID : integer;
begin
  vID := FIDWorker;
  if SelectWorker(vID) then
  begin
    FIDWorker := vID;
    qChat.Refresh;
    qChat.Locate('ID', vID, []);
    UpdateWorker;
  end;
end;

procedure TOrderParamForm.eResTimeExit(Sender: TObject);
begin
  eResTime.Time := StrToTIme(IntToStr(HourOf(eResTime.Time)) + ':00:00');
end;

procedure TOrderParamForm.eResTimePropertiesChange(Sender: TObject);
begin
  UpdateCalcTime;
end;

procedure TOrderParamForm.eTImeCalcPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  eTimeLen.Text := CorrectInteger2(eTimeCalc.Properties.Buttons[1].Caption);
  eTimeLen.Properties.OnChange(nil);
end;

procedure TOrderParamForm.eTimeLenPropertiesChange(Sender: TObject);
begin
  UpdateCalcTime;
end;

procedure TOrderParamForm.FillAddressList;
begin
  eAddress.Properties.Items.Clear;
  FillComboBoxEXSQL(eAddress, 'select distinct Address from Client where ID = ' + IntToStr(FIDClient) + ' union ' +
                              'select distinct Address from OrderList where ID_Client = ' + IntToStr(FIDClient) + ' order by Address', 'Address', '');
end;

procedure TOrderParamForm.FillPaymentForm;
begin
  cbPaymentForm.Properties.Items.Clear;
  FillComboBoxExSQL(cbPaymentForm, 'select ID, Name from Paymentformview order by Name', 'Name', 'ID');
end;

procedure TOrderParamForm.FillPhone;
begin
{  ePhone.Properties.LookupItems.BeginUpdate;
  try
    ePhone.Properties.LookupItems.Clear;
    tPhone.Close;
    tPhone.Open;
    tPhone.First;
    while not tPhone.eof do
    begin
      ePhone.Properties.LookupItems.Add(tPhone.FieldByName('Phone').AsString);
      tPhone.Next;
    end;
    tPhone.Close;
  finally
    ePhone.Properties.LookupItems.EndUpdate;
  end;}
end;

procedure TOrderParamForm.FillReason;
  var
    vID : integer;
begin
  vID := IsNull(cbStatusType.EditValue, 0);
  cbReason.Enabled := true;
  lReason.Enabled := true;

  if vID <> 0 then
  begin
    cbReason.Properties.Items.Clear;
    FillComboBoxExSQL(cbReason, 'select ID, Name from ReasonView where ID_StatusType = ' + IntToStr(vID) + ' order by Name', 'Name', 'ID');
    if cbReason.Properties.Items.Count = 0 then
    begin
      cbReason.Properties.Items.AddObject('', Pointer(0));
      cbReason.Enabled := false;
      lReason.Enabled := false;
    end
    else
    begin
      cbReason.Enabled := true;
      lReason.Enabled := true;
    end;
    if cbReason.Properties.Items.Count = 1 then cbReason.ItemIndex := 0;
  end;
end;

procedure TOrderParamForm.FillSignalType;
begin
  qSignal.Close;
  qSignal.Open;

//  cbSignalType.Properties.Items.Clear;
//  FillComboBoxExSQL(cbSignalType, 'select ID, Name from SignalTypeView order by Name', 'Name', 'ID');
end;

procedure TOrderParamForm.FillSourceType;
begin
  qSource.Close;
  qSource.Open;

//  cbSourceType.Properties.Items.Clear;
//  FillComboBoxExSQL(cbSourceType, 'select ID, Name from sourcetypeview order by Name', 'Name', 'ID');
end;

procedure TOrderParamForm.FillStatusType;
begin
{  cbStatusTypeColoe.Properties.Items.Clear;
  FillComboBoxExSQL(cbStatusType, 'select STV.ID, STV.Name from Statustypeview STV, StatusTypeFromTo FT where FT.ID_StatusTypeFrom = ' + IntToStr(FIDStatusType) + ' and STV.ID = FT.ID_StatusTypeTo order by Name', 'Name', 'ID');}

  qStatus.Close;
  qStatus.ParamByName('ID1').AsInteger := FIDStatusType;
  qStatus.ParamByName('ID2').AsInteger := FIDStatusType;
  qStatus.Open;
end;

procedure TOrderParamForm.FillClientInfo;
  var
    v: variant;
begin
  if FIDClient <> 0 then
  begin
    v := Datas.ReadValues('client', 'Phone;Name;Address;FlatNumber;ID_District;ID_Metro;IsClientDomSPB;Comment', FIDClient);
    ePhone.Text := IsNull(v[0], '');
    eName.Text := IsNull(v[1], '');

    FillAddressList;
    eAddress.Text := IsNUll(v[2], '');

    eFlatNumber.Text := IsNUll(v[3], '');

    FillDistrictList;
    SetItemIndexByID(cbDistrict, IsNull(v[4], 0));

    FillMetroList;
    SetItemIndexByID(cbMetro, IsNull(v[5], 0));

    cbClientDomSPB.Checked := IsNUll(v[6], 0) = 1;

    eClientComment.Text := IsNUll(v[7], '');
  end
  else
  begin
    ePhone.Text := '';
    eName.Text := '';
    eAddress.Text := '';
    eAddress.Properties.Items.Clear;
    eFlatNumber.Text := '';

    cbDistrict.Text := '';
    cbDistrict.Properties.Items.Clear;
    cbMetro.Text := '';
    cbMetro.Properties.Items.Clear;

    cbClientDomSPB.Checked := false;
    eClientComment.Text := '';
  end;
end;

procedure TOrderParamForm.FillDistrictList;
  var
    vID : integer;
begin
  vID := GetIDByItemIndex(cbDistrict);
  cbDistrict.Properties.Items.Clear;
  FillComboBoxExSQL(cbDistrict, 'select ID, Name from DistrictView order by Name', 'Name', 'ID');
  if vID <> 0 then SetItemIndexByID(cbDistrict, vID);
end;

procedure TOrderParamForm.FillInfoFromDadata;
  var
    s, m, t, a, p : string;
    vID : integer;
begin
  if FXML <> '' then
  begin
    //читаем правильный адрес, район и метро, стандартизируем

    a := XMLVariantName(FXML);

    //эта процедура срабатывает при выходе из поля ввода адреса, адрес не правим
{    eAddress.Properties.OnChange := nil;
    eAddress.Text := a;
    eAddress.Properties.OnChange := eAddressPropertiesChange;}

    p := XMLReadParams(FXML, 'data', 0);
    s := GetParamValue(p, 'city_district');
    t := GetParamValue(p, 'city_district_type_full');
    cbDistrict.Text := s + ' ' + t;

    FillMetroList;
    m := GetParamValue(p, 'metro');

    s := GetParamValue(m, 'name', '|');
    vID := IsNull(Datas.ReadValuesSQL('select ID from metro where Name = ''' + s + '''', 'ID')[0], 0);
    SetItemIndexByID(cbMetro, vID);

    cbMetro.Text := s;
  end;
end;

procedure TOrderParamForm.FillMetroList;
  var
    i, vID, vIDM : integer;
begin
  vIDM := GetIDByItemIndex(cbMetro);
  vID := GetIDByItemIndex(cbDistrict);
  cbMetro.Properties.Items.Clear;
  FillComboBoxExSQL(cbMetro, 'select ID, Name from MetroView where ID_District = ' + IntToStr(vID) + ' order by Name', 'Name', 'ID');

  if cbMetro.Properties.Items.Count > 0 then
     cbMetro.Properties.Items.AddObject('-----------------------------------', Pointer(-1));

  qMetro.Close;
  qMetro.ParamByName('IDD').AsInteger := vID;
  qMetro.Open;
  qMetro.First;
  while not qMetro.eof do
  begin
    cbMetro.Properties.Items.AddObject(qMetro.FieldByName('Name').AsString + ' (' + qMetro.FieldByName('DInfo').AsString + ')', Pointer(qMetro.FieldByName('ID').AsInteger));
    qMetro.Next;
  end;
  qMetro.Close;

  if vIDM <> 0 then SetItemIndexByID(cbMetro, vIDM);
end;

procedure TOrderParamForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  TimerChat.Enabled := false;
  TimerChat.OnTimer := nil;
end;

procedure TOrderParamForm.FormCreate(Sender: TObject);
begin
  FIDDiscountTypePromo := 0;

  FStoreStream := TMemoryStream.Create;
end;

procedure TOrderParamForm.FormDestroy(Sender: TObject);
begin
  FStoreStream.Free;
end;

procedure TOrderParamForm.FormShow(Sender: TObject);
  var
    v : variant;
begin
  GetLocationList;

  v := Datas.ReadOptions('APIKeyDadata;SecretKeyDadata');

  FToken := IsNull(v[0], '');
  FSecret := IsNull(v[1], '');

  SetOKEnabled;

  qChat.ParamByName('ID').AsInteger := FID;
  qChat.Open;
  TimerChat.Enabled := true;

  if FToken <> '' then
  begin
    FTest := CheckDaDataService(FToken);
    ldadata.Caption := CheckDaDataService(FToken);
  end
  else
    FTest := 'no';

  if cbPhone.Enabled then cbPhone.SetFocus
  else eName.SetFocus;

  PageControl.ActivePageIndex := 0;
end;

procedure TOrderParamForm.GetLocationList;
  var
    s : string;
begin
(*
    "query": "Абрикосовая",
    "locations": [{
        "region": "Самарская",
        "city": "Тольятти"
    }]
*)
  FLocations := '';
  qLocations.Close;
  qLocations.Open;
  while not qLocations.eof do
  begin
    case qLocations.FieldByName('AddressType').AsInteger of
      0: s := '{"region": "' + qLocations.FieldByName('AddressName').AsString + '"}';
      1: s := '{"city": "' + qLocations.FieldByName('AddressName').AsString + '"}';
    end;
    if FLocations <> '' then FLocations := FLocations + ', ';

    FLocations := FLocations + s;
    qLocations.Next;
  end;
  qLocations.Close;

  FLocations := '"locations":[' + FLocations + ']';
end;

function TOrderParamForm.GetMaterialSum: double;
  var
    vRecNo : integer;
begin
  vRecNo := mdMaterial.RecNo;
  Result := 0;
  try
    mdMaterial.DisableControls;
    mdMaterial.First;
    while not mdMaterial.eof do
    begin
      Result := Result + mdMaterial.FieldByName('MaterialSum').AsFloat;
      mdMaterial.Next;
    end;
  finally
    mdMaterial.RecNo := vRecNo;
    mdMaterial.EnableControls;
  end;
end;

function TOrderParamForm.GetTotalSum: double;
  var
    vRecNo : integer;
begin
  vRecNo := mdWork.RecNo;
  Result := 0;
  try
    mdWork.DisableControls;
    mdWork.First;
    while not mdWork.eof do
    begin
      Result := Result + mdWork.FieldByName('TotalSum').AsFloat;
      mdWork.Next;
    end;
  finally
    mdWork.RecNo := vRecNo;
    mdWork.EnableControls;
  end;
end;

function TOrderParamForm.GetWorkSum: double;
  var
    vRecNo : integer;
begin
  vRecNo := mdWork.RecNo;
  Result := 0;
  try
    mdWork.DisableControls;
    mdWork.First;
    while not mdWork.eof do
    begin
      Result := Result + mdWork.FieldByName('WorkSum').AsFloat;

      mdWork.Next;
    end;
  finally
    mdWork.RecNo := vRecNo;
    mdWork.EnableControls;
  end;
end;

procedure TOrderParamForm.mdMaterialCalcFields(DataSet: TDataSet);
begin
  Dataset.FieldByName('AmountText').AsString := Dataset.FieldByName('MaterialAmount').AsString + ' ' + Dataset.FieldByName('MaterialUnitName').AsString;

  Dataset.FieldByName('Price').AsFloat := Dataset.FieldByName('MaterialPrice').AsFloat;

  Dataset.FieldByName('Sum').AsFloat := Round(Dataset.FieldByName('MaterialSum').AsFloat * 100) / 100;
end;

procedure TOrderParamForm.mdWorkCalcFields(DataSet: TDataSet);
begin
  //мягкий режим
  if (Dataset.FieldByName('DiscountCanAdd').AsInteger = 1) and (Dataset.FieldByName('DiscountPromoCanAdd').AsInteger = 1) then
  begin
    Dataset.FieldByName('DiscountSumRes').AsFloat := Dataset.FieldByName('DiscountSum').AsFloat + Dataset.FieldByName('DiscountPromoSum').AsFloat;

    //примененная сумма по промокоду
    Dataset.FieldByName('DiscountPromoSumApply').AsFloat := Dataset.FieldByName('DiscountPromoSum').AsFloat;
  end
  else
  begin
    Dataset.FieldByName('DiscountSumRes').AsFloat := Max(Dataset.FieldByName('DiscountSum').AsFloat, Dataset.FieldByName('DiscountPromoSum').AsFloat);

    //примененная сумма по промокоду
    if Dataset.FieldByName('DiscountPromoSum').AsFloat > Dataset.FieldByName('DiscountSum').AsFloat then
      Dataset.FieldByName('DiscountPromoSumApply').AsFloat := Dataset.FieldByName('DiscountSumRes').AsFloat;
  end;

  Dataset.FieldByName('Price').AsFloat := Round(Dataset.FieldByName('TotalPrice').AsFloat * 100) / 100;

  Dataset.FieldByName('Sum').AsFloat := Round(Dataset.FieldByName('TotalSum').AsFloat * 100) / 100;

  Dataset.FieldByName('TimeSum').AsFloat := Dataset.FieldByName('WorkAmount').AsFloat * Dataset.FieldByName('WorkNorm').AsFloat;

  Dataset.FieldByName('AmountText').AsString := Dataset.FieldByName('WorkAmount').AsString + ' ' + Dataset.FieldByName('WorkUnitName').AsString;
end;

procedure TOrderParamForm.pBottomDblClick(Sender: TObject);
begin
  ShowDatasetModal(mdWork);
end;

procedure TOrderParamForm.RestoreCheck;
  var
    vRecNo : integer;
begin
  FStoreStream.Position := 0;
  vRecNo := mdWork.RecNo;
  try
    mdWork.DisableControls;
    mdWork.LoadFromStream(FStoreStream);
  finally
    mdWork.RecNo := vRecNo;
    mdWork.EnableControls;
  end;
end;

end.
