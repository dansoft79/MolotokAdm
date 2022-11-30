//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Журнал заявок
//
//------------------------------------------------------------------------------
unit UOrderList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, imglist,
  DB,  ADODB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxMemo, dxStatusBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid,
  ActnList, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, cxPropertiesStore,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, cxLookAndFeels, cxLookAndFeelPainters, System.Actions,
  cxNavigator, dxDateRanges, dxBarBuiltInMenu, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, cxContainer, cxTextEdit, cxRichEdit,
  cxDBRichEdit, cxImage, cxDBEdit, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  PropFilerEh, PropStorageEh, Vcl.Menus, cxScheduler, cxSchedulerStorage,
  cxSchedulerCustomControls, cxSchedulerCustomResourceView, cxSchedulerDayView,
  cxSchedulerAgendaView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, cxSchedulerRecurrence,
  cxSchedulerTreeListBrowser, cxSchedulerRibbonStyleEventEditor, cxPC,
  cxCalendar, dxDateTimeWheelPicker, cxBarEditItem, dxBarExtItems,
  YearPlannersEh, PlannersEh, SpreadGridsEh, cxButtons, MemTableDataEh,
  PlannerDataEh, MemTableEh, PlannerCalendarPickerEh, cxScrollBox,
  cxSchedulerDBStorage, dxmdaset, cxGroupBox, cxSplitter, cxCheckComboBox,
  cxCheckGroup, cxDropDownEdit, dxCalloutPopup, dxScreenTip, dxCustomHint,
  cxHint;

type
  TOrderListForm = class(TForm)
    DataSource: TDataSource;
    StatusBar: TdxStatusBar;
    BarManager: TdxBarManager;
    dxBarButton5: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    ActionList: TActionList;
    aAdd: TAction;
    aDelete: TAction;
    aEdit: TAction;
    aPrint: TAction;
    aCancel: TAction;
    Query: TZQuery;
    Table: TZQuery;
    QueryAssertTime: TDateTimeField;
    QueryDeleted: TSmallintField;
    QueryAssertEmployee: TWideStringField;
    QueryID_AssertUser: TSmallintField;
    PopupMenuOrder: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    cbDel: TdxBarCombo;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
    QueryRequestText: TWideStringField;
    QueryID_AddUser: TSmallintField;
    QueryAddTime: TDateTimeField;
    QueryOrderNUmber: TWideStringField;
    QueryOrderDate: TDateTimeField;
    QueryOrderCategory: TSmallintField;
    QueryClosed: TSmallintField;
    QueryID_Client: TIntegerField;
    QueryPhone: TWideStringField;
    QueryAddress: TWideStringField;
    QueryID_StatusType: TSmallintField;
    QueryID_SignalType: TSmallintField;
    QueryID_SourceType: TSmallintField;
    QueryID_Distrinct: TSmallintField;
    QueryID_Metro: TSmallintField;
    QueryFiles: TSmallintField;
    QueryID_PaymentForm: TSmallintField;
    QueryID_Worker: TSmallintField;
    QueryWorkDate: TDateTimeField;
    QueryWorkTime: TDateTimeField;
    QueryPlanTime: TFloatField;
    QueryWorkCost: TFloatField;
    QueryWInfo: TWideStringField;
    QueryID: TIntegerField;
    QueryAddUser: TWideStringField;
    QueryOCInfo: TWideStringField;
    QueryFlatNumber: TWideStringField;
    PageControl: TcxPageControl;
    tsTableRequest: TcxTabSheet;
    tsPlanner: TcxTabSheet;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewID: TcxGridDBColumn;
    TableViewDeleted: TcxGridDBColumn;
    TableViewAddTime: TcxGridDBColumn;
    TableViewAddUser: TcxGridDBColumn;
    TableViewAssertTime: TcxGridDBColumn;
    TableViewAssertUser: TcxGridDBColumn;
    TableViewClosed: TcxGridDBColumn;
    TableViewOrderNUmber: TcxGridDBColumn;
    TableViewOrderDate: TcxGridDBColumn;
    TableViewOCInfo: TcxGridDBColumn;
    TableViewRequestText: TcxGridDBColumn;
    TableViewPhone: TcxGridDBColumn;
    TableViewAddress: TcxGridDBColumn;
    TableViewFlatNumber: TcxGridDBColumn;
    TableViewFiles: TcxGridDBColumn;
    TableViewWorkDate: TcxGridDBColumn;
    TableViewWorkTime: TcxGridDBColumn;
    TableViewPlanTime: TcxGridDBColumn;
    TableViewWorkCost: TcxGridDBColumn;
    TableViewWInfo: TcxGridDBColumn;
    Level: TcxGridLevel;
    tClient: TZQuery;
    SchedulerHolidays: TcxSchedulerHolidays;
    dsMaster: TDataSource;
    StyleRepository: TcxStyleRepository;
    StyleWorker: TcxStyle;
    mdEvents: TdxMemData;
    mdEventsID: TAutoIncField;
    mdEventsParentID: TIntegerField;
    mdEventsType: TIntegerField;
    mdEventsStart: TDateTimeField;
    mdEventsFinish: TDateTimeField;
    mdEventsOptions: TIntegerField;
    mdEventsCaption: TStringField;
    mdEventsRecurrenceIndex: TIntegerField;
    mdEventsRecurrenceInfo: TBlobField;
    mdEventsResourceID: TBlobField;
    mdEventsLocation: TStringField;
    mdEventsMessage: TStringField;
    mdEventsReminderDate: TDateTimeField;
    mdEventsReminderMinutes: TIntegerField;
    mdEventsState: TIntegerField;
    mdEventsLabelColor: TIntegerField;
    mdEventsActualStart: TDateTimeField;
    mdEventsActualFinish: TDateTimeField;
    mdEventsSyncIDField: TStringField;
    dsEvents: TDataSource;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    dxBarButton6: TdxBarButton;
    aRight: TAction;
    aLeft: TAction;
    dxBarButton7: TdxBarButton;
    eDate: TdxBarDateCombo;
    StyleDateEditor: TcxStyle;
    cbAllMaster: TcxBarEditItem;
    cbAllSlot: TcxBarEditItem;
    mdWork: TdxMemData;
    mdWorkWorkType: TStringField;
    mdWorkID_WorkType: TIntegerField;
    mdWorkPrice: TFloatField;
    mdWorkAmount: TFloatField;
    mdWorkUnitName: TStringField;
    mdWorkWorkerClassTag: TStringField;
    mdWorkNorm: TFloatField;
    mdWorkID_WorkerClass: TIntegerField;
    qWork: TZQuery;
    gbWorks: TcxGroupBox;
    SplitterWorks: TcxSplitter;
    GridWork: TcxGrid;
    ViewWork: TcxGridDBTableView;
    LevelWork: TcxGridLevel;
    dsOrderWork: TDataSource;
    qOrderWork: TZQuery;
    SmallintField15: TSmallintField;
    SmallintField17: TSmallintField;
    WideStringField13: TWideStringField;
    DateTimeField7: TDateTimeField;
    qOrderWorkID_OrderList: TIntegerField;
    qOrderWorkID_WorkType: TSmallintField;
    qOrderWorkID_WorkerClass: TSmallintField;
    qOrderWorkWorkName: TWideStringField;
    qOrderWorkWorkPrice: TFloatField;
    qOrderWorkWorkNorm: TFloatField;
    qOrderWorkWorkAmount: TFloatField;
    qOrderWorkWorkUnitName: TWideStringField;
    qOrderWorkWorkCode: TWideStringField;
    qOrderWorkWorkWarrantyType: TSmallintField;
    qOrderWorkWorkWarrantyTime: TIntegerField;
    qOrderWorkWTInfo: TWideStringField;
    qOrderWorkWTypeInfo: TWideStringField;
    qOrderWorkWTypeShortInfo: TWideStringField;
    ViewWorkWorkName: TcxGridDBColumn;
    ViewWorkWorkPrice: TcxGridDBColumn;
    ViewWorkWorkAmount: TcxGridDBColumn;
    ViewWorkWorkCode: TcxGridDBColumn;
    qOrderWorkID: TSmallintField;
    PopupMenuWork: TcxGridPopupMenu;
    mdWorkID: TLargeintField;
    mdWorkWorkWarrantyType: TIntegerField;
    mdWorkWorkWarrantyTime: TIntegerField;
    QueryName: TWideStringField;
    QueryIsClientDOMSPB: TSmallintField;
    QueryClientComment: TWideStringField;
    TableViewName: TcxGridDBColumn;
    TableViewIsClientDOMSPB: TcxGridDBColumn;
    TableViewClientComment: TcxGridDBColumn;
    QueryClientDateTime: TDateTimeField;
    QueryStatusComment: TWideStringField;
    TableViewClientDateTime: TcxGridDBColumn;
    TableViewStatusComment: TcxGridDBColumn;
    QueryPayed: TSmallintField;
    QueryStatusInfo: TWideStringField;
    QuerySignalInfo: TWideStringField;
    QueryPFInfo: TWideStringField;
    TableViewPayed: TcxGridDBColumn;
    TableViewStatusInfo: TcxGridDBColumn;
    TableViewSignalInfo: TcxGridDBColumn;
    TableViewPFInfo: TcxGridDBColumn;
    QuerySourceInfo: TWideStringField;
    TableViewSourceInfo: TcxGridDBColumn;
    qWorkList: TZQuery;
    qMaster: TZQuery;
    Scheduler: TcxScheduler;
    mdEventsID_OrderList: TIntegerField;
    qWorkOne: TZQuery;
    pmEvent: TdxBarPopupMenu;
    QueryID_Reason: TSmallintField;
    QueryReasonInfo: TWideStringField;
    TableViewReasonInfo: TcxGridDBColumn;
    mdEventsImageIndex: TIntegerField;
    mdEventsOrderTime: TStringField;
    mdEventsMetro: TStringField;
    mdEventsDistrict: TStringField;
    mdEventsStatus: TStringField;
    mdEventsAddress: TStringField;
    mdEventsCost: TFloatField;
    qDistrict: TZQuery;
    qCategory: TZQuery;
    mdEventsRequestText: TStringField;
    CalloutPopup: TdxCalloutPopup;
    HintStyleController: TcxHintStyleController;
    UpdateTimer: TTimer;
    QueryHideTime: TDateTimeField;
    QueryCloseTime: TDateTimeField;
    TableViewHideTime: TcxGridDBColumn;
    TableViewCloseTime: TcxGridDBColumn;
    tsTableLead: TcxTabSheet;
    LeadGrid: TcxGrid;
    TableViewLead: TcxGridDBTableView;
    TableViewLeadID: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    TableViewLeadOCOnfo: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn29: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridDBColumn31: TcxGridDBColumn;
    cxGridDBColumn32: TcxGridDBColumn;
    cxGridDBColumn33: TcxGridDBColumn;
    LevelLead: TcxGridLevel;
    gbWorksLead: TcxGroupBox;
    GridWorkLead: TcxGrid;
    ViewWorkLead: TcxGridDBTableView;
    LevelWorkLead: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    dsWorkList: TDataSource;
    cbDistricts: TcxBarEditItem;
    BarScheduler: TdxBar;
    cbCategories: TcxBarEditItem;
    cbSignalTypes: TcxBarEditItem;
    aExportData: TAction;
    dxBarButton9: TdxBarButton;
    SaveDialog: TSaveDialog;
    mdWorkEdited: TSmallintField;
    qOrderWorkWCTag: TWideStringField;
    qOrderWorkWarranty: TWideStringField;
    ViewWorkWCTag: TcxGridDBColumn;
    ViewWorkWarranty: TcxGridDBColumn;
    qOrderWorkWorkCost: TFloatField;
    ViewWorkWorkCost: TcxGridDBColumn;
    qOrderWorkAmountText: TWideStringField;
    ViewWorkLeadWorkName: TcxGridDBColumn;
    ViewWorkLeadWorkPrice: TcxGridDBColumn;
    ViewWorkLeadWorkCode: TcxGridDBColumn;
    ViewWorkLeadWCTag: TcxGridDBColumn;
    ViewWorkLeadWarranty: TcxGridDBColumn;
    ViewWorkLeadWorkCost: TcxGridDBColumn;
    ViewWorkLeadAmountText: TcxGridDBColumn;
    bPrint: TdxBarSubItem;
    dxBarButton10: TdxBarButton;
    aPrintReport: TAction;
    QueryNeedCallDate: TDateTimeField;
    QueryUid: TWideStringField;
    DockControlScheduler: TdxBarDockControl;
    QueryCheckNumber: TWideStringField;
    PopupMenu: TcxGridPopupMenu;
    qOrderWorkWorkSum: TFloatField;
    qOrderWorkID_Discount: TSmallintField;
    qOrderWorkID_DiscountPromo: TSmallintField;
    qOrderWorkDiscountPercent: TFloatField;
    qOrderWorkDiscountSum: TFloatField;
    qOrderWorkDiscountPromoPercent: TFloatField;
    qOrderWorkDiscountPromoSum: TFloatField;
    qOrderWorkTotalPrice: TFloatField;
    qOrderWorkTotalSum: TFloatField;
    qOrderWorkDiscountDebtType: TSmallintField;
    qOrderWorkDiscountSubType: TSmallintField;
    qOrderWorkDiscountCanAdd: TSmallintField;
    qOrderWorkDiscountPromoDebtType: TSmallintField;
    qOrderWorkDiscountPromoSubType: TSmallintField;
    qOrderWorkDiscountPromoCanAdd: TSmallintField;
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
    mdWorkWorkSum: TFloatField;
    qOrderWorkDiscountMinOrderSum: TFloatField;
    qOrderWorkDiscountPromoMinOrderSum: TFloatField;
    QueryWorkDateTime: TDateTimeField;
    QueryID_DiscountPromo: TSmallintField;
    DetailTimer: TTimer;
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure aPrintExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure TableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DBGridDblClick(Sender: TObject);
    procedure TableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure cbDelChange(Sender: TObject);
    procedure cbActiveChange(Sender: TObject);
    procedure aUndoDeleteExecute(Sender: TObject);
    procedure PlannerControlEh1DrawSpanItem(PlannerControl: TPlannerControlEh;
      PlannerView: TCustomPlannerViewEh; SpanItem: TTimeSpanDisplayItemEh;
      Rect: TRect; DrawArgs: TDrawSpanItemArgsEh; var Processed: Boolean);
    procedure SchedulerResize(Sender: TObject);
    procedure SchedulerSelectionChanged(Sender: TObject);
    procedure SchedulerCustomDrawResourceHeader(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxSchedulerHeaderCellViewInfo;
      var ADone: Boolean);
    procedure PageControlPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure aRightExecute(Sender: TObject);
    procedure aLeftExecute(Sender: TObject);
    procedure tsPlannerResize(Sender: TObject);
    procedure eDateChange(Sender: TObject);
    procedure SchedulerCustomDrawContent(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerContentCellViewInfo; var ADone: Boolean);
    procedure cbAllMasterPropertiesChange(Sender: TObject);
    procedure cbAllSlotPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SchedulerEventSelectionChanged(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent);
    procedure SchedulerDblClick(Sender: TObject);
    procedure SchedulerCustomDrawEvent(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerEventCellViewInfo; var ADone: Boolean);
    procedure SchedulerInitEventImages(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent; AImages: TcxSchedulerEventImages);
    procedure SchedulerGetEventModernStyleHintInfo(Sender: TObject;
      AEvent: TcxSchedulerControlEvent;
      AInfo: TcxSchedulerEventModernStyleHintInfo);
    procedure SchedulerGetEventDisplayText(Sender: TObject;
      AEvent: TcxSchedulerControlEvent; var AText: string);
    procedure cbDistrictChange(Sender: TObject);
    procedure cbCategoryChange(Sender: TObject);
    procedure SchedulerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HintStyleControllerShowHint(Sender: TObject; var HintStr: string;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure SchedulerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure TableViewWorkCostGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxGridDBColumn23GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cbDistrictsPropertiesChange(Sender: TObject);
    procedure cbCategoriesPropertiesChange(Sender: TObject);
    procedure cbSignalTypesPropertiesChange(Sender: TObject);
    procedure TableViewNameGetFilterValues(Sender: TcxCustomGridTableItem;
      AValueList: TcxDataFilterValueList);
    procedure aExportDataExecute(Sender: TObject);
    procedure cbCategoriesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDistrictsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbSignalTypesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbCategoriesPropertiesCloseUp(Sender: TObject);
    procedure cbSignalTypesPropertiesCloseUp(Sender: TObject);
    procedure cbDistrictsPropertiesCloseUp(Sender: TObject);
    procedure aPrintReportExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TableViewSelectionChanged(Sender: TcxCustomGridTableView);
    procedure TableViewLeadSelectionChanged(Sender: TcxCustomGridTableView);
    procedure FormDestroy(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DetailTimerTimer(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
    FStartTime, FFinishTime : TTime;
    FLastUpdateTimeOrderList : TDateTime;
    FLastUpdateTimeOrderWork : TDateTIme;
    FLastUpdateTimeOrderChat : TDateTIme;

    FTimerCounter : integer;
    FUpdateCounter : integer;

    procedure SetEnabledButtons;
    function AddOrderLIstDialog(var IDOrderLIst : integer) : boolean;
    function EditOrderLIstDialog : boolean;
    function DeleteOrderLIstDialog : boolean;
    function UndoDeleteOrderLIstDialog : boolean;
    function ExistsOrderLIst(AName : string; AIDWorkType, AIDExclude : integer) : boolean;
    function FindWorker(AIDWorker : integer) : TcxSchedulerStorageREsourceItem;
  public
    { Public declarations }
    procedure SaveWorkList(AIDOrderList : integer; AMemoryStream : TMemoryStream);
    procedure LoadWorkList(AIDOrderList : integer; AMemoryStream : TMemoryStream);

    //полное заполнение задач в шедулере
//    procedure FillWorkList;

    //обновление табличных данных
    procedure UpdateData;
    //обновление рабочих в шедулере
    procedure UpdateResources;
    //обновление задач в шедулере
    procedure UpdateWorkList;

    procedure AppendScheduleOrder(AIDOrderList : integer);
    procedure UpdateScheduleOrder(AIDOrderList : integer);
    procedure DeleteScheduleOrder(AIDOrderList : integer);

    procedure FillDistrict;
    procedure FillCategory;
    procedure FillSignalType;

    //таймер автообновления
    procedure StartAutoUpdateTimer;
    procedure StopAutoUpdateTimer;

    //обновление списка работ
    procedure UpdateDetailData;

    //обновление текущего заказа
    procedure UpdateCurrentOrderListID;
  end;

//отображение окна справочника
function ShowOrderLIst(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddOrderLIst(var AIDOrderLIst : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditOrderLIst(AIDOrderLIst : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteOrderLIst(AIDOrderLIst : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses math,
  UOptions, UDatas, UOrderLIstParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, dateutils, dxOffice11, cxDateUtils, USchedulerWorkerHint,
  UShowDatasetModal, cxGridExportLink;

var
  W1, H1, C1, C2: Integer;
  ABitmap: TBitmap;

  IDWorkerDef : integer = 0;
  WorkDateDef : string = '';
  WorkTimeDef : string = '';

procedure FillGradientRect(ACanvas: TcxCanvas;
  const ARect: TRect; AColor1, AColor2: TColor; AHorizontal: Boolean);
begin
  with ARect do
  begin
    W1 := Right - Left;
    H1 := Bottom - Top;
    if (W1 < 1) or (H1 < 1) then Exit;
    if (ABitmap.Height <> H1) or (ABitmap.Width <> W1) or (AColor1 <> C1) or (AColor2 <> C2) then
    begin
      C1 := AColor1;
      C2 := AColor2;
      ABitmap.Free;
      ABitmap := TBitmap.Create;
      ABitmap.PixelFormat := pf32Bit;
      ABitmap.Height := H1;
      ABitmap.Width := W1;
      Office11FillTubeGradientRect(ABitmap.Canvas.Handle, Rect(0, 0, W1, H1), AColor1, AColor2, AHorizontal);
    end;
    BitBlt(ACanvas.Handle, Left, Top, W1, H1, ABitmap.Canvas.Handle, 0, 0, srcCopy);
  end;
end;

function DoAction(var AIDOrderLIst : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TOrderLIstForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TOrderLIstForm) then
  begin
    with FindForm(TOrderLIstForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TOrderLIstForm.Create(nil);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    try
      UpdateData;
    finally
      HideWaiting;
    end;

    eDateChange(nil);

    FModified := false;
    Result := false;
    if AAction = cOpenAction then
    begin
      Tag := MaxMDITag(ClassType) + 1;
      if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
      Name := Name + IntToStr(Tag);

      RegisterFloatingForm(vForm, AParentAction, Caption);
      Show;
    end
    else
      if AAction = cAddAction then
      begin
        Result := AddOrderLIstDialog(AIDOrderLIst);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDOrderLIst, []);
          Result := EditOrderLIstDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDOrderLIst, []);
            Result := DeleteOrderLIstDialog;
            Close;
          end;
  end;
end;

function ShowOrderLIst(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddOrderLIst(var AIDOrderLIst : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDOrderLIst, cAddAction, nil);
end;

function EditOrderLIst(AIDOrderLIst : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDOrderLIst, cEditAction, nil);
end;

function DeleteOrderLIst(AIDOrderLIst : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDOrderLIst, cDeleteAction, nil);
end;

procedure TOrderListForm.SaveWorkList(AIDOrderList : integer; AMemoryStream: TMemoryStream);
begin
  qWork.Close;
  qWork.ParamByName('ID').AsInteger := AIDOrderList;
  qWork.Open;

  AMemoryStream.Position := 0;;
  mdWork.Close;
  mdWork.Open;
  mdWork.LoadFromStream(AMemoryStream);

  //удаляем записи, отсутствующие в мемдата
  qWork.First;
  while not qWork.eof do
  begin
    if not mdWork.Locate('ID', qWork.FieldByName('ID').AsInteger, []) then
    begin
      qWork.Edit;
      qWork.FieldByName('ID_AssertUser').AsInteger := UserID;
      qWork.FieldByName('Deleted').AsInteger := 1;
      qWork.Post;
    end;
    qWork.Next;
  end;

  qWork.Close;
  qWork.Open;

  //добавляем или обновляем
  mdWork.First;
  while not mdWork.eof do
  begin
    if mdWork.FieldByName('ID').AsInteger = 0 then
    begin
      //добавляем строку
      qWork.Append;
      qWork.FieldByName('ID_OrderList').AsInteger := AIDOrderList;
      qWork.FieldByName('ID_AssertUser').AsInteger := UserID;
      qWork.FieldByName('ID_WorkType').Value := NullIfZero(mdWork.FieldByName('ID_WorkType').AsINteger);
      qWork.FieldByName('ID_WorkerClass').Value := NullIfZero(mdWork.FieldByName('ID_WorkerClass').AsInteger);
    end
    else
    begin
      //редактируем строку
      qWork.Locate('ID', mdWork.FieldByName('ID').AsInteger, []);
      qWork.Edit;

      if mdWork.FieldByName('Edited').AsInteger = 1 then
      begin
        qWork.FieldByName('ID_AssertUser').AsInteger := UserID;
      end;
    end;

    qWork.FieldByName('WorkName').AsString := mdWork.FieldByName('WorkName').AsString;
    qWork.FieldByName('WorkPrice').AsFloat := mdWork.FieldByName('WorkPrice').AsFloat;
    qWork.FieldByName('WorkAmount').AsFloat := mdWork.FieldByName('WorkAmount').AsFloat;
    qWork.FieldByName('WorkUnitName').AsString := mdWork.FieldByName('WorkUnitName').AsString;
    qWork.FieldByName('WorkNorm').AsFloat := mdWork.FieldByName('WorkNorm').AsFloat;
    qWork.FieldByName('WorkWarrantyType').Value := mdWork.FieldByName('WorkWarrantyType').Value;
    qWork.FieldByName('WorkWarrantyTime').Value := mdWork.FieldByName('WorkWarrantyTime').Value;

    //добавляем все поля по скидкам
    qWork.FieldByName('WorkSum').Value := mdWork.FieldByName('WorkSum').Value;

    qWork.FieldByName('ID_Discount').Value := mdWork.FieldByName('ID_Discount').Value;
    qWork.FieldByName('ID_DiscountPromo').Value := mdWork.FieldByName('ID_DiscountPromo').Value;
    qWork.FieldByName('DiscountPercent').Value := mdWork.FieldByName('DiscountPercent').Value;
    qWork.FieldByName('DiscountSum').Value := mdWork.FieldByName('DiscountSum').Value;
    qWork.FieldByName('DiscountPromoPercent').Value := mdWork.FieldByName('DiscountPromoPercent').Value;
    qWork.FieldByName('DiscountPromoSum').Value := mdWork.FieldByName('DiscountPromoSum').Value;
    qWork.FieldByName('TotalPrice').AsFloat := mdWork.FieldByName('TotalPrice').AsFloat;
    qWork.FieldByName('TotalSum').AsFloat := mdWork.FieldByName('TotalSum').AsFloat;
    qWork.FieldByName('DiscountDebtType').Value := mdWork.FieldByName('DiscountDebtType').Value;
    qWork.FieldByName('DiscountSubType').Value := mdWork.FieldByName('DiscountSubType').Value;
    qWork.FieldByName('DiscountCanAdd').Value := mdWork.FieldByName('DiscountCanAdd').Value;
    qWork.FieldByName('DiscountMinOrderSum').Value := mdWork.FieldByName('DiscountMinOrderSum').Value;
    qWork.FieldByName('DiscountPromoDebtType').Value := mdWork.FieldByName('DiscountPromoDebtType').Value;
    qWork.FieldByName('DiscountPromoSubType').Value := mdWork.FieldByName('DiscountPromoSubType').Value;
    qWork.FieldByName('DiscountPromoCanAdd').Value := mdWork.FieldByName('DiscountPromoCanAdd').Value;
    qWork.FieldByName('DiscountPromoMinOrderSum').Value := mdWork.FieldByName('DiscountPromoMinOrderSum').Value;

    qWork.Post;

    mdWork.Next;
  end;
  qWork.Close;
end;

procedure TOrderListForm.SchedulerCustomDrawContent(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerContentCellViewInfo;
  var ADone: Boolean);
begin
{  if (AViewInfo.Resource <> nil) and (AViewInfo.Resource.ResourceID <> 0) then
  begin
     if TimeOf(AViewInfo.TimeStart) < AViewInfo.Resource.ResourceItem.WorkStart then
     begin
       AViewInfo.Transparent := True;
       ACanvas.FillRect(AViewInfo.Bounds, dxGetMiddleRGB(AViewInfo.Color, 0, 80));
       ADone := true
     end
  end;}

{  FillGradientRect(ACanvas, AViewInfo.Bounds, AViewInfo.Color, dxGetMiddleRGB(AViewInfo.Color, 0, 75), True);
  AViewInfo.Color := dxGetMiddleRGB(AViewInfo.Color, 0, 80)}

{
  if AViewInfo.Resource <> nil then
  begin
    if TimeOf(AViewInfo.TimeStart) = StrToTime('00:00') then
      AViewInfo.Color := dxGetMiddleRGB(AViewInfo.Color, 0, 80)
{    else
      AViewInfo.Color := AViewInfo.Resource.Color;}
//    AParams.Color := AViewInfo.Resource.Color;
//    AViewInfo.TimeLineParams := AParams;
//    ACanvas.Brush.Color := AViewInfo.Resource.Color //dxGetMiddleRGB(AViewInfo.Resource.Color, 0, 70);
//  end;

//  ADone := false;
end;

procedure TOrderListForm.SchedulerCustomDrawEvent(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerEventCellViewInfo;
  var ADone: Boolean);
begin
//  AViewInfo.
end;

procedure TOrderListForm.SchedulerCustomDrawResourceHeader(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerHeaderCellViewInfo;
  var ADone: Boolean);
begin
  //перерисовка мастеров
//  AViewInfo.DisplayText := '123123123';

  AViewInfo.AlignHorz := taLeftJustify;
  ADone := False;

{  Exit;
  if not Assigned(AViewInfo.Resource) then Exit;}

{  AViewInfo.Transparent := True;
//  FillGradientRect(ACanvas, AViewInfo.Bounds, ACanvas.Brush.Color, AViewInfo.Resource.Color, true);
  vRect := AViewInfo.Bounds;
  vRect.Top := vRect.Top - 1;
  vRect.Bottom := vRect.Bottom + 1;
  ACanvas.FillRect(vRect, AViewInfo.ViewParams);
  ACanvas.Brush.Style := bsClear;
  ACanvas.DrawText(AViewInfo.DisplayText, vRect, cxAlignLeft or cxAlignVCenter or cxShowEndEllipsis);
  ACanvas.Brush.Style := bsSolid;
  ADone := True;}

{  AViewInfo.Transparent := True;
  vRect := AViewInfo.Bounds;
  ACanvas.FillRect(vRect, AViewInfo.ViewParams);
  vRect.Top := vRect.Top - 1;
  vRect.Bottom := vRect.Bottom + 1;
  ACanvas.DrawComplexFrame(vRect, ACanvas.Pen.Color, ACanvas.Pen.Color, cxBordersAll, 1);
//  ACanvas.FrameRect(vRect, ACanvas.Pen.Color);

  vText := AViewInfo.DisplayText;
  vRect := AViewInfo.Bounds;
  vRect.Left := vRect.Left + 2;
  vRect.Right := vRect.Right - 4;

  ACanvas.DrawText(vText, vRect, cxAlignLeft or cxAlignVCenter or cxShowEndEllipsis);
}
end;

procedure TOrderListForm.SchedulerDblClick(Sender: TObject);
  var
    vID : integer;
begin
  if Scheduler.SelectedEventCount = 1 then
  begin
    vID := Scheduler.SelectedEvents[0].GetCustomFieldValueByName('ID_OrderList');
    if not Query.Locate('ID', vID, []) then ShowMsg('Заказ в списке не найден!'#13#10'Вероятно он закрыт и истекло время его тображения!', smtWarning)
    else
      if aEdit.Enabled then aEdit.Execute;
  end
  else
    if (Scheduler.SelectedEventCount = 0) then
    begin
      if Assigned(Scheduler.SelResource) and (Scheduler.SelResource.ResourceID > 0) then
      begin
        IDWorkerDef := Scheduler.SelResource.ResourceID;
        WorkDateDef := DateToStr(DateOf(Scheduler.SelStart));
        WorkTimeDef := TimeToStr(TimeOf(Scheduler.SelStart));

        AddOrderLIstDialog(vID);
      end;
    end;
end;

procedure TOrderListForm.SchedulerEventSelectionChanged(
  Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent);
  var
    vID : integer;
begin
  if Assigned(AEvent) and AEvent.Selected then
  begin
    vID := AEvent.GetCustomFieldValueByName('ID_OrderList');
    Query.Locate('ID', vID, []);

    UpdateCurrentOrderListID;
  end;
end;

procedure TOrderListForm.SchedulerGetEventDisplayText(Sender: TObject;
  AEvent: TcxSchedulerControlEvent; var AText: string);
  var
    m, d : string;
begin
  AText := '';

  m := AEvent.GetCustomFieldValueByName('Metro');
  d := AEvent.GetCustomFieldValueByName('District');

  if m <> '' then AText := m + ', ';

  AText := AText + d;
end;

procedure TOrderListForm.SchedulerGetEventModernStyleHintInfo(Sender: TObject;
  AEvent: TcxSchedulerControlEvent;
  AInfo: TcxSchedulerEventModernStyleHintInfo);
  var
    res, c, a, s, l, n, d, r : string;
begin
  if not Assigned(AEvent) then Exit;

  r := AEvent.GetCustomFieldValueByName('RequestText');
  d := AEvent.GetCustomFieldValueByName('OrderTime');
  n := AEvent.GetCustomFieldValueByName('ID_OrderList');
  s := AEvent.GetCustomFieldValueByName('Status');
  c := FormatFloat(',0.', IsNUll(AEvent.GetCustomFieldValueByName('Cost'), 0));

  AInfo.Caption := '№ ' + n + '   ИТОГО: ' + c + ' р.' + #13#10 + s;

  l := AEvent.GetCustomFieldValueByName('District');
  a := AEvent.GetCustomFieldValueByName('Address');

  res := '';
  if l <> '' then res := res + 'Район: ' + l + #13#10;
  if a <> '' then res := res + 'Адрес: ' + a + #13#10;
  if r <> '' then res := res + 'Заказ: ' + r + #13#10;

  res := Trim(res);

  AInfo.Location := res;

  AInfo.ShowLocation := res <> '';
  AInfo.ShowReminder := false;

  AInfo.Start := ' ' + AInfo.Start;
  AInfo.Finish := ' ' + AInfo.Finish;
end;

procedure TOrderListForm.SchedulerResize(Sender: TObject);
  var
    w : integer;
    h : integer;
begin
  if cbAllSlot.EditValue then
  begin

//  Scheduler.OptionsView.EventHeight := Scheduler.Res
  w := Scheduler.Width - {Scheduler.OptionsView.ResourceHeaders.Height } 150 - Scheduler.ResourceNavigator.Width;
//  Caption := IntToStr(Scheduler.Width) + ' - ' + IntToStr(w);
  Scheduler.ViewTimeGrid.Scales.MinorUnitWidth :=  w div 24;

  Scheduler.OptionsView.ResourceHeaders.Height :=
    Scheduler.Width - Scheduler.ViewTimeGrid.Scales.MinorUnitWidth * 24 - Scheduler.ResourceNavigator.Width - 3;

//  Scheduler.ViewTimeGrid.Scales.MajorUnitSeparatorWidth := Scheduler.ViewTimeGrid.Scales.MinorUnitWidth * 24;

//  Scheduler.SetScrollBarInfo(sbHorizontal, 0, 0, 0, 0, 0, false, false);
  end
  else
  begin
    w := Scheduler.Width - 150 - Scheduler.ResourceNavigator.Width;
    h := Round(StrToTime(Copy(WorkTime, 7, 5)) * 24) - Round(StrToTime(Copy(WorkTime, 1, 5)) * 24);

    Scheduler.ViewTimeGrid.Scales.MinorUnitWidth :=  w div h;

    Scheduler.OptionsView.ResourceHeaders.Height := Scheduler.Width - Scheduler.ViewTimeGrid.Scales.MinorUnitWidth * h - Scheduler.ResourceNavigator.Width - 3;
  end;
end;

procedure TOrderListForm.SchedulerSelectionChanged(Sender: TObject);
  var
    vDate : TDate;
begin
  vDate := eDate.Date;
  Scheduler.OnSelectionChanged := nil;

  if cbAllSlot.EditValue then
  begin
  //  CAption := DateToStr( AEvent.GetOriginalDate);
//  Scheduler.SelectTime()
//  Caption := IntTOStr(Scheduler.SelectedDays.Count);
{  if (Scheduler.SelectedDays.Count = 1) and (DateOf(Scheduler.SelectedDays.Items[0]) <> Date) then
    Caption := DateToStr(DateOf(Scheduler.SelectedDays.Items[0]));}
    if (DateOf(Scheduler.SelStart) > vDate) then
    begin
//     Scheduler.GoToDate(Date);
      Scheduler.SelectTime(vDate + StrToTime('23:00:00'), vDate + StrToTime('23:00:00'), Scheduler.SelResource);
    end
    else
      if (DateOf(Scheduler.SelStart) < vDate)  then
      begin
//       Scheduler.GoToDate(Date);
        Scheduler.SelectTime(vDate, vDate, Scheduler.SelResource);
      end
      else
        if (DateOf(Scheduler.SelFinish) > vDate) then
        begin
          Scheduler.SelectTime(Scheduler.SelStart, vDate + 1, Scheduler.SelResource);
        end;
  end
  else
  begin
    if (Scheduler.SelStart > (vDate + FFinishTime)) then
    begin
//     Scheduler.GoToDate(Date);
     Scheduler.SelectTime(vDate + FFinishTime, vDate + FFinishTime, Scheduler.SelResource);
   end
   else
     if (Scheduler.SelStart < (vDate + FStartTime)) then
     begin
//       Scheduler.GoToDate(Date);
       Scheduler.SelectTime(vDate + FStartTime, vDate + FStartTime, Scheduler.SelResource);
     end
     else
       if (Scheduler.SelFinish > (vDate + FFinishTime + StrToTime('01:00'))) then
       begin
         Scheduler.SelectTime(Scheduler.SelStart, vDate + FFinishTime + StrToTime('01:00'), Scheduler.SelResource);
       end;
  end;

  Scheduler.ViewTimeGrid.VisibleStart := vDate;

  Scheduler.OnSelectionChanged := SchedulerSelectionChanged;
end;

procedure TOrderListForm.SetEnabledButtons;
  var
    ce, e, del : boolean;
begin
  if PageControl.ActivePageIndex = 2 then
    with TableViewLead.Controller do
      e :=
        Query.Active and
        not Query.IsEmpty and
        Assigned(FocusedRow) and
        FocusedRow.IsData
  else
    with TableView.Controller do
      e :=
        Query.Active and
        not Query.IsEmpty and
        Assigned(FocusedRow) and
        FocusedRow.IsData;

  del := e and (Query.FieldByName('Deleted').AsINteger = 1);

  ce := CanEditInActionByAction(MainForm.aaOrderLIst);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  aPrint.Enabled := (PageControl.ActivePageIndex = 1) or (PageControl.ActivePageIndex = 2);
  aExportData.Enabled := (PageControl.ActivePageIndex = 1) or (PageControl.ActivePageIndex = 2);
  aPrintReport.Enabled := CanShowAction(MainForm.arCreateReport);
end;

procedure TOrderListForm.StartAutoUpdateTimer;
begin
  UpdateTimer.Enabled := false;
  if Datas.ZConnection.Connected then
    UpdateTimer.Interval := IsNull(Datas.ReadOptions('CheckUpdateTime')[0], 0) * 1000;
  UpdateTimer.Enabled := true;
end;

procedure TOrderListForm.StopAutoUpdateTimer;
begin
  UpdateTimer.Enabled := false;
end;

procedure TOrderListForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TOrderListForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  UpdateCurrentOrderListID;

  SetEnabledButtons;
end;

procedure TOrderListForm.FillCategory;
begin
{  cbCategory.OnChange := nil;

  FillBarComboBoxExSQL(cbCategory, 'select Tag, ID from WorkerClass order by Tag', 'Tag', 'ID');
  cbCategory.Items.AddObject('(ничего не выбрано)', pointer(0));
  SetBarItemIndexByID(cbCategory, 0);

  cbCategory.OnChange := cbCategoryChange;}

  //мультивыбор
  cbCategories.Properties.OnChange := nil;
  FillBarCheckComboBoxExSQL(cbCategories, 'select Tag, Concat(Tag, '' - '', Name) as Name, ID from WorkerClass order by Name', 'Name', 'Tag', 'ID');
  cbCategories.Properties.OnChange := cbCategoriesPropertiesChange;
end;

procedure TOrderListForm.FillDistrict;
begin
{  cbDistrict.OnChange := nil;

  FillBarComboBoxExSQL(cbDistrict, 'select Name, ID from District order by Name', 'Name', 'ID');
  cbDistrict.Items.AddObject('(ничего не выбрано)', pointer(0));
  SetBarItemIndexByID(cbDistrict, 0);

  cbDistrict.OnChange := cbDistrictChange;}

  //мультивыбор
  cbDistricts.Properties.OnChange := nil;
  FillBarCheckComboBoxExSQL(cbDistricts, 'select Tag, Name, ID from District order by Name', 'Name', 'Tag', 'ID');
  cbDistricts.Properties.OnChange := cbDistrictsPropertiesChange;
end;

procedure TOrderListForm.FillSignalType;
begin
  //мультивыбор
  cbSignalTypes.Properties.OnChange := nil;
  FillBarCheckComboBoxExSQL(cbSignalTypes, 'select Code, Name, ID from SignalType order by Name', 'Name', 'Code', 'ID');
  cbSignalTypes.Properties.OnChange := cbSignalTypesPropertiesChange;
end;

{procedure TOrderListForm.FillWorkList;
  var
    vCaption : string;
begin
  Scheduler.BeginUpdate;
  try

  mdEvents.Close;
  mdEvents.Open;

  qWorkList.Close;
  qWorkList.ParamByName('DS').AsString := DateToSQLDate(eDate.Date);
  qWorkList.Open;
  qWorkList.First;
  while not qWorkList.eof do
  begin
    mdEvents.Append;

    if qWorkList.FieldByName('Closed').AsInteger = 1 then
      mdEvents.FieldByName('State').AsInteger := 2
    else
      mdEvents.FieldByName('State').AsInteger := 0;

    mdEvents.FieldByName('ID_OrderList').AsInteger := qWorkList.FieldByName('ID').AsInteger;
    mdEvents.FieldByName('OrderTime').AsString := DateToStr(DateOf(qWorkList.FieldByName('OrderDate').AsDateTime));
    mdEvents.FieldByName('Metro').AsString := qWorkList.FieldByName('MetroInfo').AsString;
    mdEvents.FieldByName('District').AsString := qWorkList.FieldByName('DistrictInfo').AsString;
    mdEvents.FieldByName('Status').AsString := qWorkList.FieldByName('StatusInfo').AsString;

    mdEvents.FieldByName('Address').AsString := qWorkList.FieldByName('Address').AsString;
    if qWorkList.FieldByName('FlatNumber').AsString <> '' then
      mdEvents.FieldByName('Address').AsString := mdEvents.FieldByName('Address').AsString + ', кв.' + qWorkList.FieldByName('FlatNumber').AsString;

    mdEvents.FieldByName('Cost').AsFloat := qWorkList.FieldByName('WorkCost').AsFloat;
    mdEvents.FieldByName('RequestText').AsString := qWorkList.FieldByName('RequestText').AsString;

    mdEvents.FieldByName('Type').AsInteger := 0;

    mdEvents.FieldByName('Start').AsDateTIme := DateOf(qWorkList.FieldByName('WorkDate').AsDateTime) + TimeOf(qWorkList.FieldByName('WorkTime').AsDateTime);
    mdEvents.FieldByName('Finish').AsDateTIme := mdEvents.FieldByName('Start').AsDateTIme + qWorkList.FieldByName('PLanTime').AsFloat / 24;

//    mdEvents.FieldByName('Caption').AsString := qWorkList.FieldByName('MetroInfo').AsString + ', ' + qWorkList.FieldByName('DistrictInfo').AsString;

//    mdEvents.FieldByName('Location').AsString := qWorkList.FieldByName('DistrictInfo').AsString;

    mdEvents.FieldByName('ResourceID').AsString := qWorkList.FieldByName('ID_Worker').AsString;
    mdEvents.FieldByName('LabelColor').AsInteger := qWorkList.FieldByName('Color').AsInteger;
    mdEvents.FieldByName('Message').AsString :=  qWorkList.FieldByName('RequestText').AsString;

    if qWorkList.FieldByName('DefSignal').AsInteger = 0 then
      mdEvents.FieldByName('ImageIndex').AsInteger := 421
    else
      mdEvents.FieldByName('ImageIndex').AsInteger := -1;

    mdEvents.Post;

    qWorkList.Next;
  end;
  qWorkList.Close;

  finally
    Scheduler.EndUpdate;
    Scheduler.CurrentView.Refresh;
  end;
end;}

function TOrderListForm.FindWorker(
  AIDWorker: integer): TcxSchedulerStorageREsourceItem;
  var
    I: Integer;
    AResourceItem : TcxSchedulerStorageREsourceItem;
begin
  Result := nil;
  for i := 0 to SchedulerDBStorage.Resources.Items.Count - 1 do
  begin
    AResourceItem := SchedulerDBStorage.Resources.Items[i];
    if AResourceItem.ResourceID = AIDWorker then
    begin
      Result := AResourceItem;
      Break;
    end;
  end;
end;

procedure TOrderListForm.FormActivate(Sender: TObject);
begin
  CurrentOrderList := Self;
  UpdateCurrentOrderListID;
end;

procedure TOrderListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StopAutoUpdateTimer;

  PrepareFormName(self); PropertiesStore.StoreTo(false);

  TableView.StoreToIniFile(cIniFileName, false);
  ViewWork.StoreToIniFile(cIniFileName, false);

  TableViewLead.StoreToIniFile(cIniFileName, false);
  ViewWorkLead.StoreToIniFile(cIniFileName, false);

  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TOrderListForm.FormCreate(Sender: TObject);
  var
    vDays : TDays;
begin
  FTimerCounter := 0;
  FUpdateCounter := 0;

  PageControl.ActivePageIndex := 0;

  FillCategory;
  FillDistrict;
  FillSignalType;

  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableView.RestoreFromIniFile(cIniFileName);
  ViewWork.RestoreFromIniFile(cIniFileName);

  TableViewLead.RestoreFromIniFile(cIniFileName);
  ViewWorkLead.RestoreFromIniFile(cIniFileName);

  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
  BarScheduler.Visible := true;
  BarScheduler.DockControl := DockControlScheduler;

  SetDaysFromStr(vDays, WorkDay);
  Scheduler.OptionsView.WorkDays := vDays;
  Scheduler.OptionsView.WorkStart := StrToTime(Copy(WorkTime, 1, 5));
  Scheduler.OptionsView.WorkFinish := StrToTime(Copy(WorkTime, 7, 5));

  if cbAllSlot.EditValue then
  begin
    FStartTime := StrToTime('00:00');
    FFinishTime := StrToTime('23:00');
    Scheduler.ViewTimeGrid.WorkTimeOnly := false;
  end
  else
  begin
    FStartTime := StrToTime(Copy(WorkTime, 1, 5));
    FFinishTime := StrToTime(Copy(WorkTime, 7, 5)) - StrToTIme('01:00');
    Scheduler.ViewTimeGrid.WorkTimeOnly := true;
  end;

  Scheduler.ONSelectionChanged := SchedulerSelectionChanged;
  Scheduler.ONRESIZE := SchedulerResize;
  SchedulerResize(nil);

  mdEvents.Close;
  mdEvents.Open;
{  mdEvents.Append;
  mdEvents.FieldByName('ResourceID').AsString := '0';
  mdEvents.FieldByName('ID_OrderList').AsInteger := 0;
  mdEvents.Post;}

//  UpdateResources;//один раз перед открытием окна заполняем ресурсы

  eDateChange(nil);

  //запускаем таймер автообновления
  StartAutoUpdateTimer;

  TableView.DataController.Filter.AddItem(nil, TableViewOCInfo, TcxFilterOperatorKind.foEqual, 'Заказ', 'Заказ');
  TableView.DataController.Filter.Active := true;
  TableViewLead.DataController.Filter.AddItem(nil, TableViewLeadOCOnfo, TcxFilterOperatorKind.foEqual, 'Лид', 'Лид');
  TableViewLead.DataController.Filter.Active := true;

  SetEnabledButtons;
end;

procedure TOrderListForm.FormDeactivate(Sender: TObject);
begin
{  if CurrentOrderList = self then
  begin
    IDOrderList := 0;
    CurrentOrderList := nil;
  end;}
end;

procedure TOrderListForm.FormDestroy(Sender: TObject);
begin
  if CurrentOrderList = self then
  begin
    IDOrderList := 0;
    CurrentOrderList := nil;
  end;
end;

procedure TOrderListForm.HintStyleControllerShowHint(Sender: TObject;
  var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
  var
    vHitTest : TcxSchedulerTimeGridViewHitTest;
    vHeader : TcxSchedulerHeaderCellViewInfo;
    vIDWorker : integer;
    vBounds : TRect;
begin
  if WorkerHintVisible then
  begin
    CanShow := false;
    Exit;
  end;

//  ShowMessage(Scheduler.ActiveHitTest.ClassName);

  if not (Scheduler.ActiveHitTest is TcxSchedulerTimeGridViewHitTest) then
  begin
    CanShow := false;
    Exit;
  end;

  vHitTest := Scheduler.ActiveHitTest as TcxSchedulerTimeGridViewHitTest;
  if not vHitTest.HitAtResourceHeader then
  begin
    CanShow := false;
    Exit;
  end;

  HintStr := '';

  vHeader := vHitTest.HeaderCell;
  vIDWorker := vHeader.Resource.ResourceID;
  if vIDWorker <= 0 then
  begin
    CanShow := false;
    Exit;
  end;

  vBounds := vHeader.Bounds;

  ShowWorkerHint(vIDWorker);

{  SchedulerWorkerHintForm := TSchedulerWorkerHintForm.Create(Application);
  vForm :=
  vForm.IDWorker := vIDWorker;
  vForm.FillWorker;

//  vForm.ClientHeight := vForm.lText.Top + vForm.lText.Height - 20;
  vForm.AutoSize := true;
  vForm.AutoSize := false;}

  CalloutPopup.PopupControl := SchedulerWorkerHintForm;

  CalloutPopup.Popup(Scheduler, vBounds);
end;

procedure TOrderListForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteOrderLIstDialog or FModified;

  SetEnabledButtons;
end;

procedure TOrderListForm.aEditExecute(Sender: TObject);
begin
  FModified := EditOrderLIstDialog or FModified;

  SetEnabledButtons;
end;

procedure TOrderListForm.aExportDataExecute(Sender: TObject);
begin
{procedure ExportGridToXLSX(const AFileName: string; AGrid: TcxGrid; AExpand: Boolean = True; ASaveAll: Boolean = True;
  AUseNativeFormat: Boolean = True; const AFileExt: string = 'xlsx'; AHandler: TObject = nil);}

{procedure ExportGridDataToXLSX(const AFileName: string; AGrid: TcxGrid; AExpand: Boolean = True; ASaveAll: Boolean = True;
  AUseNativeFormat: Boolean = True; const AFileExt: string = 'xlsx'; AHandler: TObject = nil);}


  if SaveDialog.InitialDir = '' then
  begin
    SaveDialog.InitialDir := cABSExportDir;
  end
  else
  begin
    SaveDialog.InitialDir := ExtractFilePath(SaveDialog.FileName);
  end;

  case PageControl.ActivePageIndex of
    1: SaveDialog.FileName := 'Экспорт заказов';
    2: SaveDialog.FileName := 'Экспорт лидов';
  end;
  SaveDialog.FileName := SaveDialog.FileName + ' ' + FormatDateTime('dd.mm.yy hh-nn', Now());

  if SaveDialog.Execute then
  begin

    if PageControl.ActivePageIndex = 1 then
    begin
      ExportGridToXLSX(SaveDialog.FileName, Grid);
//      ExportGridDataToXLSX('C:\Temp\2.xlsx', Grid);
    end;

    if PageControl.ActivePageIndex = 2 then
    begin
      ExportGridToXLSX(SaveDialog.FileName, LeadGrid);
//      ExportGridDataToXLSX('C:\Temp\2.xlsx', Grid);
    end;

  end;
end;

procedure TOrderListForm.aLeftExecute(Sender: TObject);
begin
  eDate.Date := IncDay(eDate.Date, -1);
end;

procedure TOrderListForm.AppendScheduleOrder(AIDOrderList: integer);
begin
  //может нет, рабочего, добавляем в ресурсы
  UpdateResources;

  qWorkOne.Close;
  qWorkOne.ParamByName('ID').AsInteger := AIDOrderList;
  qWorkOne.Open;

  mdEvents.Append;

  if qWorkOne.FieldByName('Closed').AsInteger = 1 then
    mdEvents.FieldByName('State').AsInteger := 2
  else
    mdEvents.FieldByName('State').AsInteger := 0;

  mdEvents.FieldByName('ID_OrderList').AsInteger := AIDOrderList;
  mdEvents.FieldByName('OrderTime').AsString := DateToStr(DateOf(qWorkOne.FieldByName('OrderDate').AsDateTime));
  mdEvents.FieldByName('Metro').AsString := qWorkOne.FieldByName('MetroInfo').AsString;
  mdEvents.FieldByName('District').AsString := qWorkOne.FieldByName('DistrictInfo').AsString;
  mdEvents.FieldByName('Status').AsString := qWorkOne.FieldByName('StatusInfo').AsString;

  mdEvents.FieldByName('Address').AsString := qWorkOne.FieldByName('Address').AsString;
  if qWorkOne.FieldByName('FlatNumber').AsString <> '' then
    mdEvents.FieldByName('Address').AsString := mdEvents.FieldByName('Address').AsString + ', кв.' + qWorkOne.FieldByName('FlatNumber').AsString;

  mdEvents.FieldByName('Cost').AsFloat := qWorkOne.FieldByName('WorkCost').AsFloat;
  mdEvents.FieldByName('RequestText').AsString := qWorkOne.FieldByName('RequestText').AsString;

  mdEvents.FieldByName('Type').AsInteger := 0;

  mdEvents.FieldByName('Start').AsDateTIme := DateOf(qWorkOne.FieldByName('WorkDate').AsDateTime) + TimeOf(qWorkOne.FieldByName('WorkTime').AsDateTime);
  mdEvents.FieldByName('Finish').AsDateTIme := mdEvents.FieldByName('Start').AsDateTIme + qWorkOne.FieldByName('PLanTime').AsFloat / 24;

//  mdEvents.FieldByName('Caption').AsString := qWorkOne.FieldByName('DistrictInfo').AsString;

//  mdEvents.FieldByName('Location').AsString := qWorkOne.FieldByName('DistrictInfo').AsString;

  mdEvents.FieldByName('ResourceID').AsString := qWorkOne.FieldByName('ID_Worker').AsString;
  mdEvents.FieldByName('LabelColor').AsInteger := qWorkOne.FieldByName('Color').AsInteger;
  mdEvents.FieldByName('Message').AsString :=  qWorkOne.FieldByName('RequestText').AsString;

  if qWorkOne.FieldByName('DefSignal').AsInteger = 0 then
    mdEvents.FieldByName('ImageIndex').AsInteger := 421
  else
    mdEvents.FieldByName('ImageIndex').AsInteger := -1;

  mdEvents.Post;

  qWorkOne.Close;

  SchedulerDBStorage.FullRefresh;
end;

procedure TOrderListForm.aPrintExecute(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    1: PrintGuideGridDX(Caption, Grid);
    2: PrintGuideGridDX(Caption, LeadGrid);
  end;
end;

procedure TOrderListForm.aPrintReportExecute(Sender: TObject);
begin
  if MainForm.arCreateReport.Enabled then MainForm.arCreateReport.Execute;
end;

procedure TOrderListForm.aRightExecute(Sender: TObject);
begin
  eDate.Date := IncDay(eDate.Date, 1);
end;

procedure TOrderListForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteOrderLIstDialog or FModified;
  SetEnabledButtons;
end;

procedure TOrderListForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := 1;//cbActive.ItemIndex;
  Query.Open;
end;

procedure TOrderListForm.cbAllMasterPropertiesChange(Sender: TObject);
begin
  UpdateResources;
end;

procedure TOrderListForm.cbAllSlotPropertiesChange(Sender: TObject);
  var
    vIDWorker : integer;
    vRes : TcxSchedulerStorageREsourceItem;
    vTime1, vTime2 : TTime;
    vDate : TDateTime;
    vMin, vMax : integer;
begin
  vDate := DateOf(eDate.Date);
  vIDWorker := Scheduler.SelResource.ResourceID;
  vTime1 := Scheduler.SelStart;
  vTime2 := Scheduler.SelFinish;

{  qMinMaxTime.Close;
  qMinMaxTime.ParamByName('DS').AsString := DateToSQLDate(vDate);
  qMinMaxTime.Open;
  vMin := TimeOf(qMinMaxTime.FieldByName('FromTime').AsDateTime);
  if DateOf(qMinMaxTime.FieldByName('FromTime').AsDateTime) <> DateOf(qMinMaxTime.FieldByName('ToTime').AsDateTime) then
    vMax := StrToTime('23:00')
  else
    vMax := TimeOf(qMinMaxTime.FieldByName('ToTime').AsDateTime);}

  if cbAllSlot.EditValue then
  begin
    FStartTime := StrToTime('00:00');
    FFinishTime := StrToTime('23:00');
    Scheduler.ViewTimeGrid.WorkTimeOnly := false;
  end
  else
  begin
    FStartTime := StrToTime(Copy(WorkTime, 1, 5));
    FFinishTime := StrToTime(Copy(WorkTime, 7, 5)) - StrToTIme('01:00');
    Scheduler.ViewTimeGrid.WorkTimeOnly := true;
  end;

  SchedulerResize(nil);
//  eDateChange(nil);

  Scheduler.ViewTimeGrid.VisibleStart := vDate;

  vRes := FindWorker(vIDWorker);
  if Assigned(vRes) then
    Scheduler.SelectTime(vTime1, vTime2, vRes)
  else
    Scheduler.SelectTime(vTime1, vTime2, Scheduler.SelResource);
end;

procedure TOrderListForm.cbCategoriesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    s : string;
begin
  if Key = vk_Return then
  begin
    Key := vk_Tab;
  end
  else
    if Key = vk_Delete then
    begin
      //Очищаем все ячейки

      cbCategories.EditValue := 'Ничего не указано';

      eDate.SetFocus;
      cbCategories.SetFocus;
      cbCategories.Properties.OnChange(nil);
    end;
end;

procedure TOrderListForm.cbCategoriesPropertiesChange(Sender: TObject);
begin
  UpdateData;

  UpdateResources;
end;

procedure TOrderListForm.cbCategoriesPropertiesCloseUp(Sender: TObject);
begin
//  cbCategories.SetFocus;
end;

procedure TOrderListForm.cbCategoryChange(Sender: TObject);
begin
  UpdateResources;
end;

procedure TOrderListForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TOrderListForm.cbDistrictChange(Sender: TObject);
begin
  UpdateResources;
end;

procedure TOrderListForm.cbDistrictsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    s : string;
begin
  if Key = vk_Return then
  begin
    Key := vk_Tab;
  end
  else
    if Key = vk_Delete then
    begin
      //Очищаем все ячейки

      cbDistricts.EditValue := 'Ничего не указано';

      eDate.SetFocus;
      cbDistricts.SetFocus;
      cbDistricts.Properties.OnChange(nil);
    end;
end;

procedure TOrderListForm.cbDistrictsPropertiesChange(Sender: TObject);
begin
  UpdateData;

  UpdateResources;
end;

procedure TOrderListForm.cbDistrictsPropertiesCloseUp(Sender: TObject);
begin
//  cbDistricts.SetFocus;
end;

procedure TOrderListForm.cbSignalTypesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    s : string;
begin
  if Key = vk_Return then
  begin
    Key := vk_Tab;
  end
  else
    if Key = vk_Delete then
    begin
      //Очищаем все ячейки

      cbSignalTypes.EditValue := 'Ничего не указано';

      eDate.SetFocus;
      cbSignalTypes.SetFocus;
      cbSignalTypes.Properties.OnChange(nil);
    end;
end;

procedure TOrderListForm.cbSignalTypesPropertiesChange(Sender: TObject);
begin
  UpdateData;
  UpdateWorkList;
  UpdateResources;
end;

procedure TOrderListForm.cbSignalTypesPropertiesCloseUp(Sender: TObject);
begin
//  cbSignalTypes.SetFocus;
end;

procedure TOrderListForm.cxGridDBColumn23GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then AText := '';
end;

procedure TOrderListForm.PageControlChange(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TOrderListForm.PageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  //  if NewPage = tsPlanner then Scheduler.FullRefresh;
end;

procedure TOrderListForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TOrderListForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TOrderListForm.TableViewLeadSelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  UpdateCurrentOrderListID;

  SetEnabledButtons;
end;

procedure TOrderListForm.TableViewNameGetFilterValues(
  Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
begin
{  if AValueList.Count = 1 then
    if (AValueList[0].DisplayText <> '') and (AValueList[0].DisplayText[1] <> '%') then}
end;

procedure TOrderListForm.TableViewSelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  UpdateCurrentOrderListID;

  SetEnabledButtons;
end;

procedure TOrderListForm.TableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  vDeleted : boolean;
  vID : integer;
begin
  if not ARecord.IsData then Exit;

  Datas.DeletedRecordStyle.Color := DeletedRecordColor;

  vID := IsNull(ARecord.Values[TableViewID.Index], 0);
  vDeleted := IsNull(ARecord.Values[TableViewDeleted.Index], 0) = 1;

  if vDeleted then AStyle := Datas.DeletedRecordStyle;
end;

procedure TOrderListForm.TableViewWorkCostGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then AText := '';
end;

procedure TOrderListForm.tsPlannerResize(Sender: TObject);
begin
  Scheduler.Height := tsPlanner.Height + Scheduler.ResourceNavigator.Width + 1
    - DockControlScheduler.Height;
end;

function TOrderListForm.UndoDeleteOrderLIstDialog: boolean;
  var
    vRecNo, vID : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  vRecNo := Query.RecNo;

  Table.Close;
  Table.ParamByName('ID').AsInteger := vID;
  Table.Open;
  Table.Edit;
  Table.FieldByName('ID_AssertUser').AsInteger := UserID;
  Table.FieldByName('Deleted').AsInteger := 0;
  Table.Post;
  Table.Close;

  Query.Refresh;

  if Query.RecordCount > 1 then
    Query.RecNo := vRecNo;

  SetEnabledButtons;
end;

procedure TOrderListForm.UpdateCurrentOrderListID;
begin
  case PageControl.ActivePageIndex of
   0 :
     begin
       if Scheduler.SelectedEventCount = 0 then IDOrderList := 0
       else IDOrderList := Scheduler.SelectedEvents[0].GetCustomFieldValueByName('ID_OrderList');
     end;
   1 :
     begin
       if Assigned(TableView.Controller.FocusedRow) and TableView.Controller.FocusedRow.IsData and not TableView.Controller.FocusedRow.IsFilterRow then
         IDOrderList := IsNull(TableView.Controller.FocusedRecord.Values[TableViewID.Index], 0)
       else
         IDOrderList := 0;
     end;
   2 :
     begin
       if Assigned(TableViewLead.Controller.FocusedRow) and TableViewLead.Controller.FocusedRow.IsData and not TableViewLead.Controller.FocusedRow.IsFilterRow then
         IDOrderList := IsNull(TableViewLead.Controller.FocusedRecord.Values[TableViewLeadID.Index], 0)
       else
         IDOrderList := 0;
     end;
  end;
end;

procedure TOrderListForm.UpdateData;
  var
    vDistrictList, vCategoriesList, vSignalTypeList : string;
    vID : integer;
begin
  vID := 0;
  if Query.Active then
    vID := Query.FieldByName('ID').AsInteger;

  qOrderWork.Close;
  Query.Close;

  vDistrictList := GetBarCheckComboboxIDList(cbDistricts);
  vCategoriesList := GetBarCheckComboboxIDList(cbCategories);
  vSignalTypeList := GetBarCheckComboboxIDList(cbSignalTypes);

  qOrderWork.Open;

{  Query.ParamByName('CLIst1').AsString := vCategoriesList;
  Query.ParamByName('CLIst2').AsString := vCategoriesList;
  Query.ParamByName('DLIst1').AsString := vDistrictList;
  Query.ParamByName('DLIst2').AsString := vDistrictList;}

  Query.ParamByName('CLIst1').AsString := '';
  Query.ParamByName('CLIst2').AsString := '';
  Query.ParamByName('DLIst1').AsString := '';
  Query.ParamByName('DLIst2').AsString := '';
  Query.ParamByName('STLIst1').AsString := '';
  Query.ParamByName('STLIst2').AsString := '';

  Query.Open;
  if vID <> 0 then Query.Locate('ID', vID, []);
end;

procedure TOrderListForm.UpdateDetailData;
begin
  if qOrderWork.ParamByName('ID').AsInteger <> Query.FieldBYName('ID').AsInteger then
    qOrderWork.Close;

  DetailTimer.Enabled := false;
  DetailTimer.Interval := 1000;
  DetailTimer.Enabled := true;
end;

procedure TOrderListForm.UpdateResources;
{
  TDay = (dSunday, dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday);
  TDays = set of TDay;
}
  var
    i, wd : integer;
    ss, s, f, t : string;
    vDays : TDays;
    vIDWorker : integer;
    vRes : TcxSchedulerStorageREsourceItem;
    vTime1, vTime2 : TTime;
    vCategoriesList, vDistrictList : string;
begin
  if Assigned(Scheduler.SelResource) and (Scheduler.SelResource.ResourceID <> unAssigned) then
    vIDWorker := IsNull(Scheduler.SelResource.ResourceID, 0)
  else
    vIDWorker := 0;

  vTime1 := Scheduler.SelStart;
  vTime2 := Scheduler.SelFinish;

  SchedulerDBStorage.Resources.Items.ClearAndResetID;

  qMaster.Close;
  vDistrictList := GetBarCheckComboboxIDList(cbDistricts);
//  vDistrictList := IfNull(cbDistricts.CurEditValue, '');
  vCategoriesList := GetBarCheckComboboxIDList(cbCategories);
//  vCategoriesList := IfNull(cbCategories.CurEditValue, '');
  qMaster.ParamByName('DS').AsString := DateToSQLDate(eDate.Date);
  qMaster.ParamByName('CLIst1').AsString := vCategoriesList;
  qMaster.ParamByName('CLIst2').AsString := vCategoriesList;
  qMaster.ParamByName('DLIst1').AsString := vDistrictList;
  qMaster.ParamByName('DLIst2').AsString := vDistrictList;
{  qMaster.ParamByName('IDD1').AsInteger := GetBarIDByItemIndex(cbDistrict);
  qMaster.ParamByName('IDD2').AsInteger := GetBarIDByItemIndex(cbDistrict);
  qMaster.ParamByName('IDC1').AsInteger := GetBarIDByItemIndex(cbCategory);
  qMaster.ParamByName('IDC2').AsInteger := GetBarIDByItemIndex(cbCategory);}
  qMaster.Open;
//  ShowDatasetModal(qMaster);
  qMaster.First;
  while not qMaster.eof do
  begin
    //вычисляем текущий день недели
    wd := DayOfWeek(eDate.Date);
    if wd = 1 then wd := 7
    else wd := wd - 1;

    if
      cbAllMaster.EditValue and (qMaster.FieldByName('Deleted').AsInteger = 0) or
      (qMaster.FieldByName('Day' + IntToStr(wd)).AsString <> '') and (qMaster.FieldByName('Deleted').AsInteger = 0) or
      (qMaster.FieldByName('CID').AsInteger <> 0) then
    with qMaster, SchedulerDBStorage.Resources.Items.Add do
    begin
      ResourceID := FieldByName('ID').AsInteger;
      Name := FieldByName('WSNInfo').AsString;
      if FieldByName('CatList').AsString <> '' then
        Name := Name + #13#10 + FieldByName('CatList').AsString
      else
        Name := Name + #13#10'(категории не указаны)';

      if FieldByName('TagList').AsString <> '' then
      begin
        Name := Name + #13#10 + FieldByName('TagList').AsString
      end;

      //если график по конкретным дням
      //устанавливаем рабочие и выходндые дни
      ss := '';
      for i := 1 to 7 do
        if FieldByName('Day' + IntToStr(i)).AsString <> '' then ss := ss + '1'
        else ss := ss + '0';

      SetDaysFromStr(vDays, ss);
      WorkDays := vDays;

      //получили день недели, берем расписание рабочего на этот день
      s := FieldBYName('Day' + IntToStr(wd)).AsString;
      if s = '' then  //ставим рабочее время компании
      begin
        WorkStart := Scheduler.OptionsView.WorkStart;
        WorkFinish := Scheduler.OptionsView.WorkFinish;
      end
      else
      begin
        f := Copy(s, 1, 5);
        t := Copy(s, 7, 5);
        WorkStart := StrToTime(f);
        WorkFinish := StrToTime(t);
      end;

{        SetStrFromDays(ss, WorkDays);
      Name := ss;}

    end;

    qMaster.Next;
  end;

  //дозаливка до нужного количества, чтоб в высоту работники не росли
  for i := 1 to Scheduler.OptionsView.ResourcesPerPage - SchedulerDBStorage.Resources.Items.Count do
  begin
    with SchedulerDBStorage.Resources.Items.Add do
    begin
      ResourceID := -i;
      Name := '';
      WorkDays := [];
      Color := Self.Color
    end;
  end;

  vRes := FindWorker(vIDWorker);

  if Assigned(vRes) then
    Scheduler.SelectTime(vTime1, vTime2, vRes)
  else
    Scheduler.SelectTime(vTime1, vTime2, Scheduler.SelResource);
end;

procedure TOrderListForm.UpdateScheduleOrder(AIDOrderList: integer);
begin
  //может нет, рабочего, добавляем в ресурсы
  UpdateResources;

  qWorkOne.Close;
  qWorkOne.ParamByName('ID').AsInteger := AIDOrderList;
  qWorkOne.Open;

  if mdEvents.Locate('ID_OrderList', AIDOrderList, []) then
  begin
    mdEvents.Edit;

    if qWorkOne.FieldByName('Closed').AsInteger = 1 then
      mdEvents.FieldByName('State').AsInteger := 2
    else
      mdEvents.FieldByName('State').AsInteger := 0;

    mdEvents.FieldByName('ID_OrderList').AsInteger := AIDOrderList;
    mdEvents.FieldByName('OrderTime').AsString := DateToStr(DateOf(qWorkOne.FieldByName('OrderDate').AsDateTime));
    mdEvents.FieldByName('Metro').AsString := qWorkOne.FieldByName('MetroInfo').AsString;
    mdEvents.FieldByName('District').AsString := qWorkOne.FieldByName('DistrictInfo').AsString;
    mdEvents.FieldByName('Status').AsString := qWorkOne.FieldByName('StatusInfo').AsString;

    mdEvents.FieldByName('Address').AsString := qWorkOne.FieldByName('Address').AsString;
    if qWorkOne.FieldByName('FlatNumber').AsString <> '' then
      mdEvents.FieldByName('Address').AsString := mdEvents.FieldByName('Address').AsString + ', кв.' + qWorkOne.FieldByName('FlatNumber').AsString;

    mdEvents.FieldByName('Cost').AsFloat := qWorkOne.FieldByName('WorkCost').AsFloat;
    mdEvents.FieldByName('RequestText').AsString := qWorkOne.FieldByName('RequestText').AsString;

    mdEvents.FieldByName('Type').AsInteger := 0;

    mdEvents.FieldByName('Start').AsDateTIme := DateOf(qWorkOne.FieldByName('WorkDate').AsDateTime) + TimeOf(qWorkOne.FieldByName('WorkTime').AsDateTime);
    mdEvents.FieldByName('Finish').AsDateTIme := mdEvents.FieldByName('Start').AsDateTIme + qWorkOne.FieldByName('PLanTime').AsFloat / 24;

//    mdEvents.FieldByName('Caption').AsString := qWorkOne.FieldByName('DistrictInfo').AsString;

//    mdEvents.FieldByName('Location').AsString := qWorkOne.FieldByName('DistrictInfo').AsString;

    mdEvents.FieldByName('ResourceID').AsString := qWorkOne.FieldByName('ID_Worker').AsString;
    mdEvents.FieldByName('LabelColor').AsInteger := qWorkOne.FieldByName('Color').AsInteger;
    mdEvents.FieldByName('Message').AsString :=  qWorkOne.FieldByName('RequestText').AsString;

    if qWorkOne.FieldByName('DefSignal').AsInteger = 0 then
      mdEvents.FieldByName('ImageIndex').AsInteger := 421
    else
      mdEvents.FieldByName('ImageIndex').AsInteger := -1;

    mdEvents.Post;
  end;

  qWorkOne.Close;
end;

procedure TOrderListForm.UpdateTimerTimer(Sender: TObject);
  var
    tol, tow, toc : TDateTIme;
    v : variant;
begin
  FTimerCounter := FTimerCounter + 1;

  UpdateTimer.Enabled := false;

  if Datas.ZConnection.Connected then
  begin
    v := Datas.ReadValues('UpdateTime', 'OrderList;OrderWork;OrderChat');
    tol := IsNull(v[0], 0);
    tow := IsNull(v[0], 1);
    toc := IsNull(v[0], 2);
    if (tol <> FLastUpdateTimeOrderList) or (tow <> FLastUpdateTimeOrderWork) or (toc <> FLastUpdateTimeOrderChat) then
    begin
      FUpdateCounter := FUpdateCounter + 1;

      FLastUpdateTimeOrderList := tol;
      FLastUpdateTimeOrderWork := tow;
      FLastUpdateTimeOrderChat := toc;

      if Query.Active then Query.Refresh;
      //if qOrderWork.Active then qOrderWork.Refresh;
      UpdateDetailData;

      UpdateWorkList;
    end;
  end;

  StatusBar.Panels[0].Text := 'Запросов: ' + IntToStr(FTimerCounter) + ', обновлений: ' + IntToStr(FUpdateCounter) + ', записей: ' + IntToStr(qWorkList.RecordCount);

  UpdateTimer.Enabled := true;
end;

procedure TOrderListForm.UpdateWorkList;
  var
    vID : integer;
    vSignalTypeList : string;
begin
  //нужно сделать мягкое обновлние
  //если в шедулере есть задачи, которых уже нет в текущем запросе, то их надо удалить
  //если в запросе есть задачи, которых нет в шедулере, то их надо добавить
  //если в запросе есть задачи, которые есть в шедулере, то их надо обновить

  Scheduler.BeginUpdate;
  try
    qWorkList.Close;
    vSignalTypeList := GetBarCheckComboboxIDList(cbSignalTypes);
    qWorkList.ParamByName('DS').AsString := DateToSQLDate(eDate.Date);
    qWorkList.ParamByName('SList1').AsString := vSignalTypeList;
    qWorkList.ParamByName('SList2').AsString := vSignalTypeList;
    qWorkList.Open;

    //удаление пропавших из запроса событий
    mdEvents.First;
    while not mdEvents.eof do
    begin
      if not qWorkList.Locate('ID', mdEvents.FieldByName('ID_OrderList').AsInteger, []) then
        mdEvents.Delete
      else
        if not Query.Locate('ID', mdEvents.FieldByName('ID_OrderList').AsInteger, []) then
          mdEvents.Delete
        else
          mdEvents.Next;
    end;

    //добавление или обновление событий
    qWorkList.First;
    while not qWorkList.eof do
    begin
      vID := qWorkList.FieldByName('ID').AsInteger;

      //проверяем, есть ли заказ в списках, добавляем в шедулер, только если он есть в списках
      if Query.Locate('ID', vID, []) then
      begin

        if not mdEvents.Locate('ID_OrderList', vID, []) then
        begin
          mdEvents.Append;
          mdEvents.FieldByName('ID_OrderList').AsInteger := qWorkList.FieldByName('ID').AsInteger;
          mdEvents.FieldByName('OrderTime').AsString := DateToStR(DateOf(qWorkList.FieldByName('OrderDate').AsDateTime));
        end
        else
        begin
          mdEvents.Edit;
        end;

        if qWorkList.FieldByName('Closed').AsInteger = 1 then
          mdEvents.FieldByName('State').AsInteger := 2
        else
          mdEvents.FieldByName('State').AsInteger := 0;

        mdEvents.FieldByName('Metro').AsString := qWorkList.FieldByName('MetroInfo').AsString;
        mdEvents.FieldByName('District').AsString := qWorkList.FieldByName('DistrictInfo').AsString;
        mdEvents.FieldByName('Status').AsString := qWorkList.FieldByName('StatusInfo').AsString;

        mdEvents.FieldByName('Address').AsString := qWorkList.FieldByName('Address').AsString;
        if qWorkList.FieldByName('FlatNumber').AsString <> '' then
          mdEvents.FieldByName('Address').AsString := mdEvents.FieldByName('Address').AsString + ', кв.' + qWorkList.FieldByName('FlatNumber').AsString;

        mdEvents.FieldByName('Cost').AsFloat := qWorkList.FieldByName('WorkCost').AsFloat;
        mdEvents.FieldByName('RequestText').AsString := qWorkList.FieldByName('RequestText').AsString;

        mdEvents.FieldByName('Type').AsInteger := 0;

        mdEvents.FieldByName('Start').AsDateTIme := DateOf(qWorkList.FieldByName('WorkDate').AsDateTime) + TimeOf(qWorkList.FieldByName('WorkTime').AsDateTime);
        mdEvents.FieldByName('Finish').AsDateTIme := mdEvents.FieldByName('Start').AsDateTIme + qWorkList.FieldByName('PLanTime').AsFloat / 24;

  //      mdEvents.FieldByName('Caption').AsString := qWorkList.FieldByName('DistrictInfo').AsString;

  //      mdEvents.FieldByName('Location').AsString := qWorkList.FieldByName('DistrictInfo').AsString;

  //      mdEvents.FieldByName('ParentID').AsString := '1';

        mdEvents.FieldByName('ResourceID').AsString := qWorkList.FieldByName('ID_Worker').AsString;
        mdEvents.FieldByName('LabelColor').AsInteger := qWorkList.FieldByName('Color').AsInteger;
        mdEvents.FieldByName('Message').AsString :=  qWorkList.FieldByName('RequestText').AsString;

        if qWorkList.FieldByName('DefSignal').AsInteger = 0 then
          mdEvents.FieldByName('ImageIndex').AsInteger := 421
        else
          mdEvents.FieldByName('ImageIndex').AsInteger := -1;

        mdEvents.Post;
      end;

      qWorkList.Next;
    end;
//    qWorkList.Close;
  finally
    Scheduler.EndUpdate;
    Scheduler.CurrentView.Refresh;
  end;
end;

procedure TOrderListForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
  UpdateDetailData;
end;

procedure TOrderListForm.LoadWorkList(AIDOrderList : integer; AMemoryStream: TMemoryStream);
  var
    v : variant;
begin
  mdWork.Close;
  mdWork.Open;

  qWork.Close;
  qWork.ParamByName('ID').AsInteger := AIDOrderList;
  qWork.Open;
  qWork.First;
  while not qWork.eof do
  begin
    mdWork.Append;
    mdWork.FieldByName('Edited').AsInteger := 0;
    mdWork.FieldByName('ID').AsInteger := qWork.FieldByName('ID').AsInteger;
    mdWork.FieldByName('ID_WorkType').Value := qWork.FieldByName('ID_WorkType').Value;
    mdWork.FieldByName('ID_WorkerClass').Value := qWork.FieldByName('ID_WorkerClass').Value;
    mdWork.FieldByName('WorkName').AsString := qWork.FieldByName('WorkName').AsString;
    mdWork.FieldByName('WorkPrice').AsFloat := qWork.FieldByName('WorkPrice').AsFloat;
    mdWork.FieldByName('WorkAmount').AsFloat := qWork.FieldByName('WorkAmount').AsFloat;
    mdWork.FieldByName('WorkUnitName').AsString := qWork.FieldByName('WorkUnitName').AsString;
    mdWork.FieldByName('WorkNorm').AsFloat := qWork.FieldByName('WorkNorm').AsFloat;
    mdWork.FieldByName('WorkWarrantyType').Value := qWork.FieldByName('WorkWarrantyType').Value;
    mdWork.FieldByName('WorkWarrantyTime').Value := qWork.FieldByName('WorkWarrantyTime').Value;
    v := Datas.ReadValues('workerclass', 'tag', IsNull(qWork.FieldByName('ID_WorkerClass').Value, 0));
    mdWork.FieldByName('WorkerClassTag').AsString := IsNull(v[0], '');

    //добавляем все поля по скидкам
    mdWork.FieldByName('WorkSum').Value := qWork.FieldByName('WorkSum').Value;

    mdWork.FieldByName('ID_Discount').Value := qWork.FieldByName('ID_Discount').Value;
    mdWork.FieldByName('ID_DiscountPromo').Value := qWork.FieldByName('ID_DiscountPromo').Value;
    mdWork.FieldByName('DiscountPercent').Value := qWork.FieldByName('DiscountPercent').Value;
    mdWork.FieldByName('DiscountSum').Value := qWork.FieldByName('DiscountSum').Value;
    mdWork.FieldByName('DiscountPromoPercent').Value := qWork.FieldByName('DiscountPromoPercent').Value;
    mdWork.FieldByName('DiscountPromoSum').Value := qWork.FieldByName('DiscountPromoSum').Value;
    mdWork.FieldByName('TotalPrice').Value := qWork.FieldByName('TotalPrice').Value;
    mdWork.FieldByName('TotalSum').Value := qWork.FieldByName('TotalSum').Value;
    mdWork.FieldByName('DiscountDebtType').Value := qWork.FieldByName('DiscountDebtType').Value;
    mdWork.FieldByName('DiscountSubType').Value := qWork.FieldByName('DiscountSubType').Value;
    mdWork.FieldByName('DiscountCanAdd').Value := qWork.FieldByName('DiscountCanAdd').Value;
    mdWork.FieldByName('DiscountMinOrderSum').Value := qWork.FieldByName('DiscountMinOrderSum').Value;
    mdWork.FieldByName('DiscountPromoDebtType').Value := qWork.FieldByName('DiscountPromoDebtType').Value;
    mdWork.FieldByName('DiscountPromoSubType').Value := qWork.FieldByName('DiscountPromoSubType').Value;
    mdWork.FieldByName('DiscountPromoCanAdd').Value := qWork.FieldByName('DiscountPromoCanAdd').Value;
    mdWork.FieldByName('DiscountPromoMinOrderSum').Value := qWork.FieldByName('DiscountPromoMinOrderSum').Value;

    mdWork.Post;

    qWork.Next;
  end;
  qWork.Close;

  AMemoryStream.Clear;
  mdWork.SaveToStream(AMemoryStream);
end;

procedure TOrderListForm.PlannerControlEh1DrawSpanItem(
  PlannerControl: TPlannerControlEh; PlannerView: TCustomPlannerViewEh;
  SpanItem: TTimeSpanDisplayItemEh; Rect: TRect; DrawArgs: TDrawSpanItemArgsEh;
  var Processed: Boolean);
begin
  if SpanItem.PlanItem.ReadOnly then
  begin
    DrawArgs.FillColor := ColorToGray(DrawArgs.FillColor);
    DrawArgs.AltFillColor := ColorToGray(DrawArgs.AltFillColor);
    DrawArgs.FrameColor := ColorToGray(DrawArgs.FrameColor);
  end;
end;

procedure TOrderListForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddOrderLIstDialog(vID) or FModified;

  SetEnabledButtons;
end;

procedure TOrderListForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TOrderListForm.AddOrderLIstDialog(var IDOrderLIst: integer): boolean;
  var
    vStatusComment, vOrderNum, vOrderDate, vAddTime, vOrderType : string;
    vPayed, vID, vIDClient, vIDSourceType, vIDStatusType, vIDSignalType, vIDPaymentForm, vIDDistrict, vIDMetro, vIDReason : integer;
    vPhone, vName, vAddress, vFlatNumber, vRequestText, vClientComment : string;
    vClientDomSPB : integer;
    vWorkList : TMemoryStream;
    vClientDateTime : string;
    vCheckNumber, vNeedCallDate, vWorkDate, vWorkTime, vPLanTime : string;
    vIDDiscountTypePromo, vClosed, vIDWorker : integer;
    vSum : double;
begin
  vID := 0;
  vOrderNum := '';
  vOrderDate := '';
  vIDSourceType := GetSourceTypeDef;
  vIDStatusType := GetStatusTypeDef;
  vIDPaymentForm := GetPaymentFormDef;
  vIDSignalType := GetSignalTypeDef;
  vIDReason := 0;
  vNeedCallDate := '';
  vStatusComment := '';
  vPayed := 0;
  vCheckNumber := '';

  vIDClient := 0;
  vPhone := '';
  vName := '';
  vAddress := '';
  vFlatNumber := '';
  vIDDistrict := 0;
  vIDMetro := 0;
  vClientDomSPB := 0;
  vClientComment := '';
  vRequestText := '';

  vClientDateTime := '';
  vWorkDate := WorkDateDef;
  vWorkTime := WorkTimeDef;
  vPLanTime := '';
  vIDWorker := IDWorkerDef;
  vSum := 0;
  vIDDiscountTypePromo := 0;

  IDWorkerDef := 0;
  WorkDateDef := '';
  WorkTimeDef := '';

  vWorkList := TMemoryStream.Create;

  Result :=
    GetOrderListParams(IntToStr(vID), vAddTime, vOrderNum, vOrderDate, vOrderType,
      vIDSourceType, vIDStatusType, vIDPaymentForm, vIDSignalType, vIDReason,
      vNeedCallDate, vStatusComment, vPayed, vCheckNumber,
      vIDClient, vPhone, vName, vAddress, vFlatNumber, vIDDistrict, vIDMetro,
      vClientDomSPB, vClientComment, vRequestText,
      vClientDateTime, vWorkDate, vWorkTime, vPLanTime, vIDWorker,
      vWorkList, vSum,
      vIDDiscountTypePromo,
      true
      );

  if Result then
  begin
    //добавляем клиента
    tClient.Close;
    tClient.ParamByName('P').AsString := vPhone;
    tClient.Open;
    if tClient.RecordCount = 0 then
      tClient.Append
    else
      tClient.Edit;
    tClient.FieldByName('Phone').AsString := vPhone;
    tClient.FieldByName('Name').AsString := vName;
    tClient.FieldByName('Address').AsString := vAddress;
    tClient.FieldByName('FlatNumber').AsString := vFlatNumber;
    tClient.FieldByName('ID_District').Value := NullIfZero(vIDDistrict);
    tClient.FieldByName('ID_Metro').Value := NullIfZero(vIDMetro);
    tClient.FieldByName('IsClientDOMSPB').AsInteger := vClientDOMSPB;
    tClient.FieldByName('Comment').AsString := vClientComment;
    tClient.Post;
    vIDClient := tClient.FieldByName('ID').AsInteger;

    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;

      FieldByName('ID_AddUser').AsInteger := UserID;
      FieldByName('ID_AssertUser').AsInteger := UserID;

      FieldByName('OrderNumber').AsString := vOrderNum;
      FieldByName('OrderDate').AsString := vOrderDate;
      FieldByName('ID_SourceType').AsInteger := vIDSourceType;
      FieldByName('ID_StatusType').AsInteger := vIDStatusType;
      FieldByName('ID_PaymentForm').AsInteger := vIDPaymentForm;
      FieldByName('ID_SignalType').AsInteger := vIDSignalType;
      FieldByName('ID_Reason').Value := NullIfZero(vIDReason);
      FieldByName('NeedCallDate').AsString := vNeedCallDate;
      FieldByName('StatusComment').AsString := vStatusComment;
      FieldByName('Payed').AsInteger := vPayed;
      FieldByName('CheckNumber').AsString := vCheckNumber;

      FieldByName('ID_Client').AsInteger := vIDClient;
      FieldByName('Phone').AsString := vPhone;
      FieldByName('Name').AsString := vName;
      FieldByName('Address').AsString := vAddress;
      FieldByName('FlatNumber').AsString := vFlatNumber;
      FieldByName('ID_District').Value := NullIfZero(vIDDistrict);
      FieldByName('ID_Metro').Value := NullIfZero(vIDMetro);
      FieldByName('IsClientDOMSPB').AsInteger := vClientDomSPB;
      FieldByName('ClientComment').AsString := vClientComment;

      FieldByName('RequestText').AsString := vRequestText;

      FieldByName('ClientDateTime').AsString := vClientDateTime;
      FieldByName('WorkDate').AsString := vWorkDate;
      FieldByName('WorkTime').AsString := vWorkTime;
      FieldByName('PLanTime').AsString := vPLanTime;
      FieldByName('ID_Worker').Value := NullIfZero(vIDWorker);

      if (FieldByName('ID_Worker').AsInteger <> 0) and (FieldByName('ID_Client').AsInteger <> 0) then
        FieldByName('OrderCategory').AsInteger := 1
      else
        FieldByName('OrderCategory').AsInteger := 0;

      FieldByName('WorkCost').AsFloat := vSum;

      if IsNull(Datas.ReadValues('StatusType', 'FinStatus', vIDStatusType)[0], 0) = 1 then FieldByName('Closed').AsInteger := 1
      else FieldByName('Closed').AsInteger := 0;

      FieldByName('ID_DiscountPromo').Value := NullIfZero(vIDDiscountTypePromo);

      Post;
      IDOrderLIst := FieldByName('ID').AsInteger;
      Close;

      SaveWorkList(IDOrderLIst, vWorkList);

      Query.Refresh;

      Query.Locate('ID', IDOrderLIst, []);

      //добавляем в шедулер
      AppendScheduleOrder(IDOrderLIst);
    end;
  end;

  vWorkList.Free;

  SetEnabledButtons;
end;

procedure TOrderListForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TOrderListForm.DeleteOrderLIstDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
  begin
    vRecNo := Query.RecNo;

    Table.Close;
    Table.ParamByName('ID').AsInteger := vID;
    Table.Open;
    Table.Edit;
    Table.FieldByName('ID_AssertUser').AsInteger := UserID;
    Table.FieldByName('Deleted').AsInteger := 1;
    Table.Post;
    Table.Close;

    Query.Refresh;

    if Query.RecordCount > 1 then
      Query.RecNo := vRecNo;

    //удаляем в шедулере
    DeleteScheduleOrder(vID);
  end;
  SetEnabledButtons;
end;

procedure TOrderListForm.DeleteScheduleOrder(AIDOrderList: integer);
begin
  if mdEvents.Locate('ID_OrderList', AIDOrderList, []) then
  begin
    mdEvents.Delete;

    UpdateResources;
  end;
end;

procedure TOrderListForm.DetailTimerTimer(Sender: TObject);
begin
  DetailTimer.Enabled := false;
  try
//    ShowWaiting('Получение данных по работам...');
    if qOrderWork.Active then
    begin
      if qOrderWork.ParamByName('ID').AsInteger = Query.FieldBYName('ID').AsInteger then
        qOrderWork.Refresh
      else
        qOrderWork.Close;
    end;

    if not qOrderWork.Active and Query.Active then
    begin
      qOrderWork.ParamByName('ID').AsInteger := Query.FieldBYName('ID').AsInteger;
      qOrderWork.Open;
    end;

  finally
//    Hidewaiting;
  end;
end;

procedure TOrderListForm.eDateChange(Sender: TObject);
  var
    vDate : TDate;
    vTime1, vTime2 : TTime;
    vIDWorker : integer;
    vRes : TcxSchedulerStorageREsourceItem;
begin
  //FillWorkList;
  UpdateWorkList;

  Scheduler.OnSelectionChanged := nil;

  if Assigned(Scheduler.SelResource) then
    vIDWorker := Scheduler.SelResource.ResourceID;

  vTime1 := TimeOf(Scheduler.SelStart);
  vTime2 := TimeOf(Scheduler.SelFinish);

  Scheduler.BeginUpdate;

  try
    UpdateResources;

    vDate := DateOf(eDate.Date);
    vRes := FindWorker(vIDWorker);

    Scheduler.GoToDate(vDate);

    if Assigned(vRes) then
      Scheduler.SelectTime(vDate + vTime1, vDate + vTime2, vRes)
    else
      Scheduler.SelectTime(vDate + vTime1, vDate + vTime2, Scheduler.SelResource);

  finally
    Scheduler.EndUpdate;
    Scheduler.CurrentView.Refresh;
  end;

  Scheduler.OnSelectionChanged := SchedulerSelectionChanged;
end;

function TOrderListForm.EditOrderLIstDialog: boolean;
  var
    vOrderNum, vOrderDate : string;
    vCheckNumber, vStatusComment, vOrderType, vAddTime : string;
    vIDReason, vPayed, vID, vIDClient, vIDSignalType, vIDSourceType, vIDStatusType, vIDPaymentForm, vIDDistrict, vIDMetro : integer;
    vClientComment, vPhone, vName, vAddress, vFlatNumber, vRequestText : string;
    vClientDomSPB : integer;
    vWorkList : TMemoryStream;
    vClientDateTime : string;
    vNeedCallDate, vWorkDate, vWorkTime, vPLanTime : string;
    vIDDiscountTypePromo, vIDWorker : integer;
    vSum : double;
begin
  vWorkList := TMemoryStream.Create;
  with Query do
  begin
    vOrderNum := FieldByName('OrderNumber').AsString;
    vOrderDate := FieldByName('OrderDate').AsString;
    vOrderType := FieldByName('OCInfo').AsString;
    vAddTime := FieldByName('AddTime').AsString;

    vIDSourceType := FieldByName('ID_SourceType').AsInteger;
    vIDStatusType := FieldByName('ID_StatusType').AsInteger;
    vIDPaymentForm := FieldByName('ID_PaymentForm').AsInteger;
    vIDSignalType := FieldByName('ID_SignalType').AsInteger;
    vIDReason := FieldByName('ID_Reason').AsInteger;
    vNeedCallDate := FieldByName('NeedCallDate').AsString;
    vStatusComment := FieldByName('StatusComment').AsString;
    vPayed := FieldByName('Payed').AsInteger;
    vCheckNumber := FieldByName('CheckNumber').AsString;

    vIDClient := FieldByName('ID_Client').AsInteger;
    vPhone := FieldByName('Phone').AsString;
    vName := FieldByName('Name').AsString;
    vAddress := FieldByName('Address').AsString;
    vFlatNumber := FieldByName('FlatNumber').AsString;
    vIDDistrict := FieldByName('ID_District').AsInteger;
    vIDMetro := FieldByName('ID_Metro').AsInteger;
    vClientDomSPB := FieldByName('IsClientDOMSPB').AsInteger;
    vClientComment := FieldByName('ClientComment').AsString;

    vRequestText := FieldByName('RequestText').AsString;

    vClientDateTime := FieldByName('ClientDateTime').AsString;

    vWorkDate := FieldByName('WorkDate').AsString;
    vWorkTime := FieldByName('WorkTime').AsString;
    vPLanTime := FieldByName('PLanTime').AsString;
    vIDWorker := FieldByName('ID_Worker').AsInteger;
    vIDDiscountTypePromo := FieldByName('ID_DiscountPromo').AsInteger;

    vID := FieldByName('ID').AsInteger;

    LoadWorkList(vID, vWorkList);
    vSum := 0;
  end;

  Result :=
    GetOrderLIstParams(
      IntToStr(vID), vAddTime,  vOrderNum, vOrderDate, vOrderType,
      vIDSourceType, vIDStatusType, vIDPaymentForm, vIDSignalType, vIDReason,
      vNeedCallDate, vStatusComment, vPayed, vCheckNumber,
      vIDClient, vPhone, vName, vAddress, vFlatNumber, vIDDistrict, vIDMetro,
      vClientDOMSPB, vClientComment, vRequestText,
      vClientDateTime, vWorkDate, vWorkTime, vPLanTime, vIDWorker,
      vWorkList, vSum,
      vIDDiscountTypePromo,
      False
      );

  if Result then
  begin
    //добавляем клиента
{    tClient.Close;
    tClient.ParamByName('P').AsString := vPhone;
    tClient.Open;
    if tClient.RecordCount = 0 then tClient.Append
    else tClient.Edit;
    tClient.FieldByName('Phone').AsString := vPhone;
    tClient.FieldByName('Name').AsString := vName;
    tClient.FieldByName('Address').AsString := vAddress;
    tClient.FieldByName('FlatNumber').AsString := vFlatNumber;
    tClient.FieldByName('ID_District').Value := NullIfZero(vIDDistrict);
    tClient.FieldByName('ID_Metro').Value := NullIfZero(vIDMetro);
    tClient.FieldByName('IsClientDOMSPB').AsInteger := vClientDOMSPB;
    tClient.FieldByName('Comment').AsString := vClientComment;
    tClient.Post;
    vIDClient := tClient.FieldByName('ID').AsInteger;}

    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('OrderNumber').AsString := vOrderNum;
      FieldByName('OrderDate').AsString := vOrderDate;
      FieldByName('ID_SourceType').AsInteger := vIDSourceType;
      FieldByName('ID_StatusType').AsInteger := vIDStatusType;
      FieldByName('ID_PaymentForm').AsInteger := vIDPaymentForm;
      FieldByName('ID_SignalType').AsInteger := vIDSignalType;
      FieldByName('ID_Reason').Value := NullIfZero(vIDReason);
      FieldByName('NeedCallDate').AsString := vNeedCallDate;
      FieldByName('StatusComment').AsString := vStatusComment;
      FieldByName('Payed').AsInteger := vPayed;
      FieldByName('CheckNumber').AsString := vCheckNumber;

      FieldByName('ID_Client').AsInteger := vIDClient;
      FieldByName('Phone').AsString := vPhone;
      FieldByName('Name').AsString := vName;
      FieldByName('Address').AsString := vAddress;
      FieldByName('FlatNumber').AsString := vFlatNumber;
      FieldByName('ID_District').Value := NullIfZero(vIDDistrict);
      FieldByName('ID_Metro').Value := NullIfZero(vIDMetro);
      FieldByName('IsClientDOMSPB').AsInteger := vClientDomSPB;
      FieldByName('ClientComment').AsString := vClientComment;

      FieldByName('RequestText').AsString := vRequestText;

      FieldByName('ClientDateTime').AsString := vClientDateTime;
      FieldByName('WorkDate').AsString := vWorkDate;
      FieldByName('WorkTime').AsString := vWorkTime;
      FieldByName('PLanTime').AsString := vPLanTime;
      FieldByName('ID_Worker').Value := NullIfZero(vIDWorker);

      if (FieldByName('ID_Worker').AsInteger <> 0) and (FieldByName('ID_Client').AsInteger <> 0) then
        FieldByName('OrderCategory').AsInteger := 1
      else
        FieldByName('OrderCategory').AsInteger := 0;

      FieldByName('WorkCost').AsFloat := vSum;

      if IsNull(Datas.ReadValues('StatusType', 'FinStatus', vIDStatusType)[0], 0) = 1 then FieldByName('Closed').AsInteger := 1
      else FieldByName('Closed').AsInteger := 0;

      FieldByName('ID_DiscountPromo').Value := NullIfZero(vIDDiscountTypePromo);

      Post;
      Close;

      SaveWorkList(vID, vWorkList);

      Query.Refresh;

      Query.Locate('ID', vID, []);

      //обновляем в шедулере
      UpdateScheduleOrder(vID);
    end;
  end;

  vWorkList.Free;

  SetEnabledButtons;
end;

function TOrderListForm.ExistsOrderLIst(AName: string; AIDWorkType, AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('W').AsInteger := AIDWorkType;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TOrderListForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
  UpdateDetailData;
end;

procedure TOrderListForm.SchedulerInitEventImages(Sender: TcxCustomScheduler;
  AEvent: TcxSchedulerControlEvent; AImages: TcxSchedulerEventImages);
var
  AValue: Variant;
begin
  AValue := AEvent.GetCustomFieldValueByName('ImageIndex');
  if VarIsNull(AValue) or VarIsEmpty(AValue) or (AValue = -1) then Exit;
  AImages.Add(AValue, False);
end;

procedure TOrderListForm.SchedulerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    vHitTest : TcxSchedulerTimeGridViewHitTest;
    vForm : TSchedulerWorkerHintForm;
    vHeader : TcxSchedulerHeaderCellViewInfo;
    vIDWorker : integer;
    vBounds : TRect;
begin
{  vHitTest := Scheduler.ActiveHitTest as TcxSchedulerTimeGridViewHitTest;
  if not vHitTest.HitAtResourceHeader then Exit;
  vHeader := vHitTest.HeaderCell;
  vIDWorker := vHeader.Resource.ResourceID;
  vBounds := vHeader.Bounds;

  vForm := TSchedulerWorkerHintForm.Create(Application);
  vForm.IDWorker := vIDWorker;
  vForm.FillWorker;
  CalloutPopup.PopupControl := vForm;

  CalloutPopup.Popup(Scheduler, vBounds);}
end;

procedure TOrderListForm.SchedulerMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  HideWorkerHint;
end;

initialization
  ABitmap := TBitmap.Create;
  ABitmap.PixelFormat := pf32bit;
end.
