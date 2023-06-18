//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Мастера
//
//------------------------------------------------------------------------------
unit UGWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  DB,  ADODB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxMemo, dxStatusBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ActnList, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxPropertiesStore,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, cxLookAndFeelPainters, cxTextEdit, cxRichEdit,
  cxDBRichEdit, cxImage, cxDBEdit, cxContainer, cxGroupBox, cxSplitter,
  cxLookAndFeels, System.Actions, cxNavigator, dxDateRanges, dxBarBuiltInMenu,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, PropFilerEh, PropStorageEh, cxPC,
  cxDBLookupComboBox, cxMaskEdit, dxLayoutContainer, cxGridViewLayoutContainer,
  cxGridLayoutView, cxGridDBLayoutView, cxGridCustomLayoutView,
  dxScrollbarAnnotations;

type
  TGWorkerForm = class(TForm)
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
    PropertiesStore: TcxPropertiesStore;
    PopupMenu: TcxGridPopupMenu;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewID: TcxGridDBColumn;
    TableViewAssertTime: TcxGridDBColumn;
    TableViewAssertUser: TcxGridDBColumn;
    TableViewDeleted: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    Level: TcxGridLevel;
    QueryAssertUser: TWideStringField;
    QueryID: TSmallintField;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QuerySurname: TWideStringField;
    QueryName: TWideStringField;
    QueryPatro: TWideStringField;
    QueryComment: TWideStringField;
    TableViewSurname: TcxGridDBColumn;
    TableViewPatro: TcxGridDBColumn;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    dxBarPopupMenu: TdxBarPopupMenu;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
    QueryPhone: TWideStringField;
    QueryWCInfo: TWideStringField;
    TableViewPhone: TcxGridDBColumn;
    TableViewWCInfo: TcxGridDBColumn;
    QueryID_WorkerCompany: TSmallintField;
    QueryID_UserRole: TSmallintField;
    QueryEmail: TWideStringField;
    QueryPassword: TWideStringField;
    QueryURInfo: TWideStringField;
    TableViewEmail: TcxGridDBColumn;
    TableViewURInfo: TcxGridDBColumn;
    pRight: TPanel;
    Splitter: TcxSplitter;
    PageControl: TcxPageControl;
    tsCategory: TcxTabSheet;
    tsDistict: TcxTabSheet;
    tsTag: TcxTabSheet;
    GridCategory: TcxGrid;
    ViewCategory: TcxGridDBTableView;
    LevelCategory: TcxGridLevel;
    GridDistrict: TcxGrid;
    ViewDistrict: TcxGridDBTableView;
    LevelDistrict: TcxGridLevel;
    GridTag: TcxGrid;
    ViewTag: TcxGridDBTableView;
    LevelTag: TcxGridLevel;
    DockCategory: TdxBarDockControl;
    DockDistrict: TdxBarDockControl;
    DockTag: TdxBarDockControl;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    aAddCategory: TAction;
    aDelCategory: TAction;
    aAddDistrict: TAction;
    aDelDistrict: TAction;
    aAddTag: TAction;
    aDelTag: TAction;
    qCategory: TZQuery;
    SmallintField1: TSmallintField;
    dsCategory: TDataSource;
    qCategoryID_Worker: TSmallintField;
    qCategoryID_WorkClass: TSmallintField;
    qCategoryID_WorkerClass: TSmallintField;
    qCategoryWorkerInfo: TWideStringField;
    qCategoryWorkInfo: TWideStringField;
    ViewCategoryAssertUser: TcxGridDBColumn;
    ViewCategoryAssertTime: TcxGridDBColumn;
    ViewCategoryWorkerInfo: TcxGridDBColumn;
    ViewCategoryWorkInfo: TcxGridDBColumn;
    pmGridCategory: TcxGridPopupMenu;
    BarManagerBar2: TdxBar;
    BarManagerBar4: TdxBar;
    BarManagerBar5: TdxBar;
    tCategory: TZQuery;
    qCategoryColor: TLargeintField;
    ViewCategoryColor: TcxGridDBColumn;
    tDistrict: TZQuery;
    qDistrict: TZQuery;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    dsDistrict: TDataSource;
    pmDistrict: TcxGridPopupMenu;
    qDistrictID_District: TSmallintField;
    qDistrictDInfo: TWideStringField;
    ViewDistrictDInfo: TcxGridDBColumn;
    pmTag: TcxGridPopupMenu;
    qTag: TZQuery;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    dsTag: TDataSource;
    tTag: TZQuery;
    ViewDistrictID: TcxGridDBColumn;
    qTagID_OrderTag: TSmallintField;
    qTagOTInfo: TWideStringField;
    ViewTagID: TcxGridDBColumn;
    ViewTagOTInfo: TcxGridDBColumn;
    tsSchedule: TcxTabSheet;
    GridTiming: TcxGrid;
    ViewTiming: TcxGridDBTableView;
    LevelTiming: TcxGridLevel;
    DockTiming: TdxBarDockControl;
    BarManagerBar6: TdxBar;
    qTiming: TZQuery;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    dsTiming: TDataSource;
    pmTiming: TcxGridPopupMenu;
    tTiming: TZQuery;
    qTimingDay1: TWideStringField;
    qTimingDay2: TWideStringField;
    qTimingDay3: TWideStringField;
    qTimingDay4: TWideStringField;
    qTimingDay5: TWideStringField;
    qTimingDay6: TWideStringField;
    qTimingDay7: TWideStringField;
    qTimingComment: TWideStringField;
    ViewTimingID: TcxGridDBColumn;
    ViewTimingDay1: TcxGridDBColumn;
    ViewTimingDay2: TcxGridDBColumn;
    ViewTimingDay3: TcxGridDBColumn;
    ViewTimingDay4: TcxGridDBColumn;
    ViewTimingDay5: TcxGridDBColumn;
    ViewTimingDay6: TcxGridDBColumn;
    ViewTimingDay7: TcxGridDBColumn;
    ViewTimingComment: TcxGridDBColumn;
    ViewTimingFree: TcxGridDBColumn;
    ViewTimeWeekGroup_Root: TdxLayoutGroup;
    ViewTimeWeek: TcxGridDBLayoutView;
    ViewTimeWeekLayoutItem3: TcxGridLayoutItem;
    ViewTimeWeekDay1: TcxGridDBLayoutViewItem;
    ViewTimeWeekLayoutItem4: TcxGridLayoutItem;
    ViewTimeWeekDay2: TcxGridDBLayoutViewItem;
    ViewTimeWeekLayoutItem5: TcxGridLayoutItem;
    ViewTimeWeekDay3: TcxGridDBLayoutViewItem;
    ViewTimeWeekLayoutItem6: TcxGridLayoutItem;
    ViewTimeWeekDay4: TcxGridDBLayoutViewItem;
    ViewTimeWeekLayoutItem7: TcxGridLayoutItem;
    ViewTimeWeekDay5: TcxGridDBLayoutViewItem;
    ViewTimeWeekLayoutItem8: TcxGridLayoutItem;
    ViewTimeWeekDay6: TcxGridDBLayoutViewItem;
    ViewTimeWeekLayoutItem9: TcxGridLayoutItem;
    ViewTimeWeekDay7: TcxGridDBLayoutViewItem;
    ViewTimeWeekLayoutItem10: TcxGridLayoutItem;
    ViewTimeWeekComment: TcxGridDBLayoutViewItem;
    StyleRepository: TcxStyleRepository;
    StyleTiming: TcxStyle;
    aEditTiming: TAction;
    dxBarButton18: TdxBarButton;
    StyleTimingWork: TcxStyle;
    StyleTimingHoliday: TcxStyle;
    qCategoryPriority: TSmallintField;
    qCategoryTag: TWideStringField;
    ViewCategoryPriority: TcxGridDBColumn;
    ViewCategoryTag: TcxGridDBColumn;
    aDayType: TAction;
    dxBarButton9: TdxBarButton;
    qTimingTimingType: TSmallintField;
    qTimingFromDate: TDateTimeField;
    qTimingToDate: TDateTimeField;
    qTimingWorkdayCount: TSmallintField;
    qTimingRestdayCount: TSmallintField;
    qTimingWorkTime: TWideStringField;
    qTimingCommentDay: TWideStringField;
    ViewTimeDayGroup_Root: TdxLayoutGroup;
    ViewTimeDay: TcxGridDBLayoutView;
    ViewTimeDayLayoutItem13: TcxGridLayoutItem;
    ViewTimeDayFromDate: TcxGridDBLayoutViewItem;
    ViewTimeDayLayoutItem14: TcxGridLayoutItem;
    ViewTimeDayToDate: TcxGridDBLayoutViewItem;
    ViewTimeDayLayoutItem15: TcxGridLayoutItem;
    ViewTimeDayWorkdayCount: TcxGridDBLayoutViewItem;
    ViewTimeDayLayoutItem16: TcxGridLayoutItem;
    ViewTimeDayRestdayCount: TcxGridDBLayoutViewItem;
    ViewTimeDayLayoutItem17: TcxGridLayoutItem;
    ViewTimeDayWorkTime: TcxGridDBLayoutViewItem;
    ViewTimeDayLayoutItem18: TcxGridLayoutItem;
    ViewTimeDayCommentDay: TcxGridDBLayoutViewItem;
    GridWorkRest: TcxGrid;
    ViewWorkRest: TcxGridDBTableView;
    LevelWorkRest: TcxGridLevel;
    qWorkRest: TZQuery;
    dsWorkRest: TDataSource;
    qWorkRestID: TIntegerField;
    qWorkRestActive: TSmallintField;
    qWorkRestDeleted: TSmallintField;
    qWorkRestID_AssertUser: TSmallintField;
    qWorkRestAssertTime: TDateTimeField;
    qWorkRestID_Worker: TSmallintField;
    qWorkRestDateType: TSmallintField;
    qWorkRestFromDate: TDateTimeField;
    qWorkRestToDate: TDateTimeField;
    qWorkRestWorkTime: TWideStringField;
    qWorkRestComment: TWideStringField;
    qWorkRestDTInfo: TWideStringField;
    ViewWorkRestFromDate: TcxGridDBColumn;
    ViewWorkRestToDate: TcxGridDBColumn;
    ViewWorkRestWorkTime: TcxGridDBColumn;
    ViewWorkRestDTInfo: TcxGridDBColumn;
    aAddWorkRest: TAction;
    aDelWorkRest: TAction;
    dxBarButton10: TdxBarButton;
    dxBarButton15: TdxBarButton;
    tWorkRest: TZQuery;
    pmWorkRest: TcxGridPopupMenu;
    ViewWorkRestID: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
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
    procedure cbDelChange(Sender: TObject);
    procedure cbActiveChange(Sender: TObject);
    procedure TableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure aUndoDeleteExecute(Sender: TObject);
    procedure aAddCategoryExecute(Sender: TObject);
    procedure aDelCategoryExecute(Sender: TObject);
    procedure ViewCategoryCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure aAddDistrictExecute(Sender: TObject);
    procedure aDelDistrictExecute(Sender: TObject);
    procedure aAddTagExecute(Sender: TObject);
    procedure aDelTagExecute(Sender: TObject);
    procedure qTimingAfterOpen(DataSet: TDataSet);
    procedure aEditTimingExecute(Sender: TObject);
    procedure ViewTimeDay1StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ViewTimeStylesGetItemStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure TableViewPhoneGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure aDayTypeExecute(Sender: TObject);
    procedure aAddWorkRestExecute(Sender: TObject);
    procedure aDelWorkRestExecute(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddWorkerDialog(var IDWorker : integer) : boolean;
    function EditWorkerDialog : boolean;
    function DeleteWorkerDialog : boolean;
    function UndoDeleteWorkerDialog : boolean;

    function IDExists(AID: integer): boolean;

    function ExistsRecord(APhone : string; AIDExclude : integer) : boolean;

    procedure UpdateTimingVisible;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowWorker(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddWorker(var AIDWorker : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditWorker(AIDWorker : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteWorker(AIDWorker : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses Types,
  UOptions, UDatas, UGWorkerParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree, Jpeg,
  USelectWorkClass, USelectWorkerClassMulti, USelectWorkType, USelectWorkTypeMulti,
  USelectDistrict, USelectDistrictMulti, USelectOrderTagMulti,
  UScheduleParams, UShowTextModal, UGWorkRestDay, UGWorkRestDayParams;

function DoAction(var AIDWorker : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGWorkerForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGWorkerForm) then
  begin
    with FindForm(TGWorkerForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGWorkerForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    qWorkRest.Open;
    qDistrict.Open;
    qTiming.Open;
    qTag.Open;
    qCategory.Open;
    Query.Open;
    HideWaiting;

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
        Result := AddWorkerDialog(AIDWorker);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDWorker, []);
          Result := EditWorkerDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDWorker, []);
            Result := DeleteWorkerDialog;
            Close;
          end;
  end;
end;

function ShowWorker(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddWorker(var AIDWorker : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorker, cAddAction, nil);
end;

function EditWorker(AIDWorker : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorker, cEditAction, nil);
end;

function DeleteWorker(AIDWorker : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorker, cDeleteAction, nil);
end;

procedure TGWorkerForm.SetEnabledButtons;
  var
    ce, e, del : boolean;
    ec, es, ed, et, etm, etd : boolean;
    md, mnd : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  del := e and (Query.FieldByName('Deleted').AsINteger = 1);

  ce := CanEditInActionByAction(MainForm.agWorker);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  with ViewCategory.Controller do
    ec :=
      qCategory.Active and
      not qCategory.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aAddCategory.Enabled := e and ce and not del;
  aDelCategory.Enabled := ec and ce and not del;

  with ViewDistrict.Controller do
    ed :=
      qDistrict.Active and
      not qDistrict.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aAddDistrict.Enabled := e and ce and not del;
  aDelDistrict.Enabled := ed and ce and not del;

  with ViewTag.Controller do
    et :=
      qTag.Active and
      not qTag.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aAddTag.Enabled := e and ce and not del;
  aDelTag.Enabled := et and ce and not del;

  with ViewTiming.Controller do
    etm :=
      qTiming.Active and
      not qTiming.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aEditTiming.Enabled := e and ce and not del;
  aDayType.Enabled := e and ce and not del;


  with ViewWorkRest.Controller do
    etd :=
      qWorkRest.Active and
      not qWorkRest.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aAddWorkRest.Enabled := e and ce and not del;
  aDelWorkRest.Enabled := e and ce and not del and etd;

  //------------------------------------------
  //видимость
  //------------------------------------------
  md := cbDel.ItemIndex in [1, 2];
  mnd := cbDel.ItemIndex in [0, 2];
  aAdd.Visible := mnd;
  aDelete.Visible := mnd;
  aUndoDelete.Visible := md;
  aEdit.Visible := mnd;
end;

procedure TGWorkerForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGWorkerForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGWorkerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGWorkerForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableView.RestoreFromIniFile(cIniFileName);

  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;

  PageControl.ActivePageIndex := 0;
end;

procedure TGWorkerForm.aDelCategoryExecute(Sender: TObject);
  var
    vID : integer;
begin
  vID := qCategory.FieldByName('ID').AsInteger;
  tCategory.Close;
  tCategory.ParamByName('ID').AsInteger := vID;
  tCategory.Open;
  tCategory.Delete;
  tCategory.Close;

  qCategory.Refresh;
end;

procedure TGWorkerForm.aDelDistrictExecute(Sender: TObject);
  var
    vID, i : integer;
begin
  if ViewDistrict.Controller.SelectedRecordCount > 0 then
  begin
    for i := 0 to ViewDistrict.Controller.SelectedRecordCount - 1 do
      if ViewDistrict.Controller.SelectedRecords[i].IsData then
       begin
          vID := IsNull(ViewDistrict.Controller.SelectedRecords[i].Values[ViewDistrictID.Index], 0);
          tDistrict.Close;
          tDistrict.ParamByName('ID').AsINteger := vID;
          tDistrict.Open;
          tDistrict.Delete;
          tDistrict.Close;
       end;
  end
  else
  begin
    vID := qDistrict.FieldBYName('ID').AsInteger;

    tDistrict.Close;
    tDistrict.ParamByName('ID').AsINteger := vID;
    tDistrict.Open;
    tDistrict.Delete;
    tDistrict.Close;
  end;
  qDistrict.Close;
  qDistrict.Open;
end;

procedure TGWorkerForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteWorkerDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkerForm.aDelTagExecute(Sender: TObject);
  var
    vID, i : integer;
begin
  if ViewTag.Controller.SelectedRecordCount > 0 then
  begin
    for i := 0 to ViewTag.Controller.SelectedRecordCount - 1 do
      if ViewTag.Controller.SelectedRecords[i].IsData then
       begin
          vID := IsNull(ViewTag.Controller.SelectedRecords[i].Values[ViewTagID.Index], 0);
          tTag.Close;
          tTag.ParamByName('ID').AsINteger := vID;
          tTag.Open;
          tTag.Delete;
          tTag.Close;
       end;
  end
  else
  begin
    vID := qTag.FieldBYName('ID').AsInteger;

    tTag.Close;
    tTag.ParamByName('ID').AsINteger := vID;
    tTag.Open;
    tTag.Delete;
    tTag.Close;
  end;
  qTag.Close;
  qTag.Open;
end;

procedure TGWorkerForm.aDelWorkRestExecute(Sender: TObject);
  var
    vID, i : integer;
begin
  if ViewWorkRest.Controller.SelectedRecordCount > 0 then
  begin
    for i := 0 to ViewWorkRest.Controller.SelectedRecordCount - 1 do
      if ViewWorkRest.Controller.SelectedRecords[i].IsData then
       begin
          vID := IsNull(ViewWorkRest.Controller.SelectedRecords[i].Values[ViewWorkRestID.Index], 0);
          tWorkRest.Close;
          tWorkRest.ParamByName('ID').AsINteger := vID;
          tWorkRest.Open;
          tWorkRest.Delete;
          tWorkRest.Close;
       end;
  end
  else
  begin
    vID := qWorkRest.FieldBYName('ID').AsInteger;

    tWorkRest.Close;
    tWorkRest.ParamByName('ID').AsINteger := vID;
    tWorkRest.Open;
    tWorkRest.Delete;
    tWorkRest.Close;
  end;
  qWorkRest.Close;
  qWorkRest.Open;
end;

procedure TGWorkerForm.aEditExecute(Sender: TObject);
begin
  FModified := EditWorkerDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkerForm.aEditTimingExecute(Sender: TObject);
  var
    vTimingType : integer;
    vFromDate, vToDate, vWorkTime, vWorkdayCount, vRestdayCount, vCommentDay : string;
    vIDR : integer;
    d1, d2, d3, d4, d5, d6, d7, vComment : string;
begin
  if qTiming.RecordCount = 0 then
  begin
    vTimingType := 1;

    vIDR := 0;
    d1 := '';
    d2 := '';
    d3 := '';
    d4 := '';
    d5 := '';
    d6 := '';
    d7 := '';
    vComment := '';

    vFromDate := '';
    vToDate := '';
    vWorkdayCount := '1';
    vRestdayCount := '1';
    vWorkTime := '';
    vCommentDay := '';

    tTiming.Close;
    tTiming.ParamByName('ID').AsInteger := 0;
    tTiming.Open;
    tTiming.Append;
    tTiming.FieldByName('ID_Worker').AsInteger := Query.FieldByName('ID').AsInteger;
    tTiming.FieldByName('Day1').AsString := d1;
    tTiming.FieldByName('Day2').AsString := d2;
    tTiming.FieldByName('Day3').AsString := d3;
    tTiming.FieldByName('Day4').AsString := d4;
    tTiming.FieldByName('Day5').AsString := d5;
    tTiming.FieldByName('Day6').AsString := d6;
    tTiming.FieldByName('Day7').AsString := d7;

    tTiming.FieldByName('TimingType').AsInteger := vTimingType;
    tTiming.FieldByName('FromDate').AsString := vFromDate;
    tTiming.FieldByName('ToDate').AsString := vToDate;
    tTiming.FieldByName('WorkdayCount').AsString := vWorkdayCount;
    tTiming.FieldByName('RestdayCount').AsString := vRestdayCount;
    tTiming.FieldByName('WorkTime').AsString := vWorkTime;

    tTiming.Post;
    vIDR := tTiming.FieldByName('ID').AsINteger;
    tTiming.Close;
  end
  else
  begin
    vIDR := qTiming.FieldByName('ID').AsInteger;

    vTimingType := qTiming.FieldByName('TimingType').AsInteger;

    d1 := qTiming.FieldByName('Day1').AsString;
    d2 := qTiming.FieldByName('Day2').AsString;
    d3 := qTiming.FieldByName('Day3').AsString;
    d4 := qTiming.FieldByName('Day4').AsString;
    d5 := qTiming.FieldByName('Day5').AsString;
    d6 := qTiming.FieldByName('Day6').AsString;
    d7 := qTiming.FieldByName('Day7').AsString;
    vComment := qTiming.FieldByName('Comment').AsString;

    vFromDate := qTiming.FieldByName('FromDate').AsString;
    vToDate := qTiming.FieldByName('ToDate').AsString;
    vWorkdayCount := qTiming.FieldByName('WorkdayCount').AsString;
    vRestdayCount := qTiming.FieldByName('RestdayCount').AsString;
    vWorkTime := qTiming.FieldByName('WorkTime').AsString;
    vCommentDay := qTiming.FieldByName('CommentDay').AsString;
  end;

  if GetScheduleParams(vTimingType, d1, d2, d3, d4, d5, d6, d7, vComment, vFromDate, vToDate, vWorkdayCount, vRestdayCount, vWorkTime, vCommentDay) then
  begin
    tTiming.Close;
    tTiming.ParamByName('ID').AsInteger := vIDR;
    tTiming.Open;
    tTiming.Edit;

    tTiming.FieldByName('TimingType').AsInteger := vTimingType;

    tTiming.FieldByName('Day1').AsString := d1;
    tTiming.FieldByName('Day2').AsString := d2;
    tTiming.FieldByName('Day3').AsString := d3;
    tTiming.FieldByName('Day4').AsString := d4;
    tTiming.FieldByName('Day5').AsString := d5;
    tTiming.FieldByName('Day6').AsString := d6;
    tTiming.FieldByName('Day7').AsString := d7;
    tTiming.FieldByName('Comment').AsString := vComment;

    tTiming.FieldByName('TimingType').AsInteger := vTimingType;
    tTiming.FieldByName('FromDate').AsString := vFromDate;
    tTiming.FieldByName('ToDate').AsString := vToDate;
    tTiming.FieldByName('WorkdayCount').AsString := vWorkdayCount;
    tTiming.FieldByName('RestdayCount').AsString := vRestdayCount;
    tTiming.FieldByName('WorkTime').AsString := vWorkTime;
    tTiming.FieldByName('CommentDay').AsString := vCommentDay;

    tTiming.Post;
    tTiming.Close;
  end;

  qTiming.Refresh;
  UpdateTimingVisible;
end;

procedure TGWorkerForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGWorkerForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteWorkerDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkerForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGWorkerForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGWorkerForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkerForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkerForm.TableViewPhoneGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
  if AText <> '' then
  begin
    AText := '(' + Copy(AText, 1, 3) + ') ' + Copy(AText, 4, 3) + '-' + Copy(AText, 7, 4);
  end;
end;

procedure TGWorkerForm.TableViewStylesGetContentStyle(
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

function TGWorkerForm.UndoDeleteWorkerDialog: boolean;
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

procedure TGWorkerForm.UpdateTimingVisible;
begin
{  ViewTimeDay1.Visible := qTiming.FieldByName('Day1').AsString <> '';
  ViewTimeDay2.Visible := qTiming.FieldByName('Day2').AsString <> '';
  ViewTimeDay3.Visible := qTiming.FieldByName('Day3').AsString <> '';
  ViewTimeDay4.Visible := qTiming.FieldByName('Day4').AsString <> '';
  ViewTimeDay5.Visible := qTiming.FieldByName('Day5').AsString <> '';
  ViewTimeDay6.Visible := qTiming.FieldByName('Day6').AsString <> '';
  ViewTimeDay7.Visible := qTiming.FieldByName('Day7').AsString <> '';


  ViewTimeComment.Visible := false;
  ViewTimeComment.Visible := true;}

  if not qTiming.Active or (qTIming.REcordCount = 0) then
  begin
    GridTIming.Visible := false;
  end
  else
  begin
    GridTIming.Visible := true;
    if qTIming.FieldByName('TimingType').AsInteger = 1 then LevelTiming.GridView := ViewTimeWeek
    else LevelTiming.GridView := ViewTimeDay;
  end;
end;

procedure TGWorkerForm.ViewCategoryCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var
    vColor : TColor;
begin
{  With AViewInfo, ACanvas do
    if GridRecord.ViewData.RecordCount > 0 then
    begin
      if not Selected then
      begin
       vColor := IsNull(RecordViewInfo.GridRecord.Values[ViewCategoryColor.Index], 0);
       if vColor <> 0 then  ACanvas.Brush.Color := vColor;
      end;
    end;}
end;

procedure TGWorkerForm.ViewTimeDay1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if IsNUll(ARecord.Values[AItem.Index], '') = '' then AStyle := StyleTimingHoliday
  else AStyle := StyleTimingWork;
end;

procedure TGWorkerForm.ViewTimeStylesGetItemStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if not Assigned(AItem) then Exit;

  if AItem.Caption = 'Комментарий' then Exit;

  if IsNUll(ARecord.Values[AItem.Index], '') = '' then AStyle := StyleTimingHoliDay
  else AStyle := StyleTimingWork;
end;

procedure TGWorkerForm.QueryAfterScroll(DataSet: TDataSet);
begin
  UpdateTimingVisible;
  SetEnabledButtons;
end;

procedure TGWorkerForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

function TGWorkerForm.IDExists(AID: integer): boolean;
begin
  ShowWaiting(cDataGetting);
  try
    Result := false//Datas.UsedData('Worker', AID);
  finally
    HideWaiting;
  end;
end;

procedure TGWorkerForm.qTimingAfterOpen(DataSet: TDataSet);
begin
  //прячем элементы расписания
  UpdateTimingVisible;
end;

procedure TGWorkerForm.aAddCategoryExecute(Sender: TObject);
  var
    vID : TIntegerDynArray;
    vIDR, i, vIDWorkClass, vIDWorkerClass, vPriority : integer;
    v : variant;
begin
  if SelectWorkerClassMulti(vID, 0) then
  begin
    for i := 0 to Length(vID) - 1 do
    begin
      vIDWorkerClass := vID[i];
      v := Datas.ReadValues('workerclass', 'ID_WorkClass;Priority', vIDWorkerClass);
      vIDWorkClass := IsNull(v[0], 0);
      vPriority := IsNull(v[1], 0);

      if not qCategory.Locate('ID_WorkClass', vIDWorkClass, []) then
      begin
        tCategory.Close;
        tCategory.ParamByName('ID').AsInteger := 0;
        tCategory.Open;
        tCategory.Append;
        tCategory.FieldByName('ID_Worker').AsInteger := Query.FieldByName('ID').AsInteger;
        tCategory.FieldByName('ID_WorkClass').AsInteger := vIDWorkClass;
        tCategory.FieldByName('ID_WorkerClass').AsInteger := vIDWorkerClass;
        tCategory.Post;
        tCategory.Close;
        qCategory.Refresh;
      end
      else
      begin
        if qCategory.FieldByName('Priority').AsInteger < vPriority then
        begin
          vIDR := qCategory.FieldByName('ID').AsInteger;
          tCategory.Close;
          tCategory.ParamByName('ID').AsInteger := vIDR;
          tCategory.Open;
          tCategory.Edit;
          tCategory.FieldByName('ID_WorkerClass').AsInteger := vIDWorkerClass;
          tCategory.Post;
          tCategory.Close;
        end;
      end;
    end;

    qCategory.Close;
    qCategory.Open;
    qCategory.Locate('ID', vIDR, []);
  end;
end;

procedure TGWorkerForm.aAddDistrictExecute(Sender: TObject);
  var
{    vID, vIDR : integer;}
    vIDR, i : integer;
    vID : TIntegerDynArray;
begin
{  vID := 0;
  if SelectDistrict(vID) then
  begin
    if not qDistrict.Locate('ID_District', vID, []) then
    begin
      tDistrict.Close;
      tDistrict.ParamByName('ID').AsInteger := 0;
      tDistrict.Open;
      tDistrict.Append;
      tDistrict.FieldByName('ID_Worker').AsInteger := Query.FieldByName('ID').AsInteger;
      tDistrict.FieldByName('ID_WorkerClass').AsInteger := vID;
      tDistrict.Post;
      vIDR := tDistrict.FieldByName('ID').AsINteger;
      tDistrict.Close;

      qDistrict.Close;
      qDistrict.Open;
      qDistrict.Locate('ID', vIDR, []);
    end
  end;}
  vIDR := 0;
  if SelectDistrictMulti(vID) then
  begin
    for i := 0 to Length(vID) - 1 do
    begin
      if not qDistrict.Locate('ID_District', vID[i], []) then
      begin
        tDistrict.Close;
        tDistrict.ParamByName('ID').AsInteger := 0;
        tDistrict.Open;
        tDistrict.Append;
        tDistrict.FieldByName('ID_Worker').AsInteger := Query.FieldByName('ID').AsInteger;
        tDistrict.FieldByName('ID_District').AsInteger := vID[i];
        tDistrict.Post;
        if vIDR = 0 then vIDR := tDistrict.FieldByName('ID').AsINteger;
        tDistrict.Close;
      end;
    end;
    if vIDR <> 0 then
    begin
      qDistrict.Close;
      qDistrict.Open;
      qDistrict.Locate('ID', vIDR, []);
    end;
  end;
end;

procedure TGWorkerForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddWorkerDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGWorkerForm.aAddTagExecute(Sender: TObject);
  var
    vIDR, i : integer;
    vID : TIntegerDynArray;
begin
  vIDR := 0;
  if SelectOrderTagMulti(vID) then
  begin
    for i := 0 to Length(vID) - 1 do
    begin
      if not qTag.Locate('ID_OrderTag', vID[i], []) then
      begin
        tTag.Close;
        tTag.ParamByName('ID').AsInteger := 0;
        tTag.Open;
        tTag.Append;
        tTag.FieldByName('ID_Worker').AsInteger := Query.FieldByName('ID').AsInteger;
        tTag.FieldByName('ID_OrderTag').AsInteger := vID[i];
        tTag.Post;
        if vIDR = 0 then vIDR := tTag.FieldByName('ID').AsINteger;
        tTag.Close;
      end;
    end;
    if vIDR <> 0 then
    begin
      qTag.Close;
      qTag.Open;
      qTag.Locate('ID', vIDR, []);
    end;
  end;
end;

procedure TGWorkerForm.aAddWorkRestExecute(Sender: TObject);
  var
    vFromDate, vToDate, vWorkTime, vComment : string;
    vID, vIDW, vDateType, vActive : integer;
    vResult : boolean;
begin
  vIDW := Query.FieldBYName('ID').AsInteger;
  vActive := 1;
  vDateType := 1;
  vFromDate := DateToStr(Date);
  vToDate := DateToStr(Date);;
  vWorkTime := '';
  vComment := '';

  vResult :=
    GetWorkRestDayParams(
      vActive,
      vDateType,
      vFromDate,
      vToDate,
      vWorkTime,
      vComment
      );

  if vResult then
  begin
    with tWorkRest do
    begin
      Close;
      ParamByName('ID').AsInteger := 0;
      Open;
      Append;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('Deleted').AsInteger := 0;

      FieldByName('ID_Worker').AsInteger := vIDW;
      FieldByName('DateType').AsInteger := vDateType;
      FieldByName('FromDate').AsString := vFromDate;
      FieldByName('ToDate').AsString := vToDate;
      FieldByName('WorkTime').AsString := vWorkTime;
      FieldByName('Comment').AsString := vComment;
      Post;
      vID := FieldByName('ID').AsInteger;
      Close;

      qWorkRest.Refresh;
      qWorkRest.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGWorkerForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TGWorkerForm.aDayTypeExecute(Sender: TObject);
  var
    vIDWorker : integer;
begin
  vIDWorker := Query.FieldByName('ID').AsInteger;
  ShowWorkRestDay(vIDWorker, MainForm.agWorkRestDay);
end;

function TGWorkerForm.AddWorkerDialog(var IDWorker: integer): boolean;
  var
    vEMail, vPhone, vSurname, vName, vPatro, vPassword, vComment : string;
    vActive, vIDUserROle, vIDWorkerCompany : integer;
begin
  vActive := 1;
  vIDWorkerCompany := 0;
  vIDUserROle := 0;
  vSurname := '';
  vName := '';
  vPatro := '';
  vPhone := '';
  vPassword := '';
  vEMail := '';
  vComment := '';

  Result :=
    GetWorkerParams(
      vActive,
      vIDWorkerCompany,
      vIDUserROle,
      vSurname,
      vName,
      vPatro,
      vPhone,
      vPassword,
      vEMail,
      vComment,
      0
      );

  if Result then
  begin
    if ExistsRecord(vLogin, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := 0;
      Open;
      Append;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Deleted').AsInteger := 0;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('ID_WorkerCompany').AsInteger := vIDWorkerCompany;
      FieldByName('ID_UserROle').AsInteger := vIDUserROle;
      FieldByName('Surname').AsString := vSurname;
      FieldByName('Name').AsString := vName;
      FieldByName('Patro').AsString := vPatro;
      FieldByName('Phone').AsString := vPhone;
      FieldByName('Password').AsString := vPassword;
      FieldByName('EMail').AsString := vEMail;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDWorker := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDWorker, []);
    end;
  end;

  SetEnabledButtons;
end;

procedure TGWorkerForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGWorkerForm.DeleteWorkerDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
//    if DeleteRec('Worker', vID) then
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
    end;
  SetEnabledButtons;
end;

function TGWorkerForm.EditWorkerDialog: boolean;
  var
    vEMail, vPhone, vPassword, vSurname, vName, vPatro, vComment : string;
    vActive, vIDWorkerCompany, vIDUserROle : integer;
    vID: integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vIDWorkerCompany := FieldByName('ID_WorkerCompany').AsInteger;
    vIDUserROle := FieldByName('ID_UserROle').AsInteger;
    vSurname := FieldByName('Surname').AsString;
    vName := FieldByName('Name').AsString;
    vPatro := FieldByName('Patro').AsString;
    vPhone := FieldByName('Phone').AsString;
    vPassword := FieldByName('Password').AsString;
    vEMail := FieldByName('EMail').AsString;
    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetWorkerParams(
      vActive,
      vIDWorkerCompany,
      vIDUserROle,
      vSurname,
      vName,
      vPatro,
      vPhone,
      vPassword,
      vEMail,
      vComment,
      vID);

  if Result then
  begin
    if ExistsRecord(vPhone, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('ID_WorkerCompany').AsInteger := vIDWorkerCompany;
      FieldByName('ID_UserROle').AsInteger := vIDUserROle;
      FieldByName('Surname').AsString := vSurname;
      FieldByName('Name').AsString := vName;
      FieldByName('Patro').AsString := vPatro;
      FieldByName('Phone').AsString := vPhone;
      FieldByName('Password').AsString := vPassword;
      FieldByName('EMail').AsString := vEMail;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;
      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;

  SetEnabledButtons;
end;

function TGWorkerForm.ExistsRecord(APhone: string; AIDExclude: integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= APhone;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGWorkerForm.QueryAfterOpen(DataSet: TDataSet);
begin
  UpdateTimingVisible;
  SetEnabledButtons;
end;

end.
