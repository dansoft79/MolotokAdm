//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Просмотр архива заявок
//
//------------------------------------------------------------------------------
unit UBrowseOrderArch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  DB, ADODB, DBCtrls,
  Grids, DBGrids, Mask,  cxGraphics, cxControls, dxStatusBar,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxBar, dxBarExtItems,
  cxClasses, ActnList, cxPropertiesStore, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxLabel,
  cxContainer, cxTextEdit, cxGroupBox, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, cxLookAndFeelPainters, cxCheckBox,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxLookAndFeels, System.Actions,
  cxNavigator, dxDateRanges, dxBarBuiltInMenu, cxSplitter;

type
  TBrowseOrderArchForm = class(TForm)
    StatusBar: TdxStatusBar;
    PropertiesStore: TcxPropertiesStore;
    ActionList: TActionList;
    aCancel: TAction;
    aUpdate: TAction;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    dxBarButton5: TdxBarButton;
    dxBarButton2: TdxBarButton;
    eToDate: TdxBarDateCombo;
    eFromDate: TdxBarDateCombo;
    DataSource: TDataSource;
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
    TableViewPhone: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewIsClientDOMSPB: TcxGridDBColumn;
    TableViewAddress: TcxGridDBColumn;
    TableViewFlatNumber: TcxGridDBColumn;
    TableViewClientComment: TcxGridDBColumn;
    TableViewRequestText: TcxGridDBColumn;
    TableViewFiles: TcxGridDBColumn;
    TableViewClientDateTime: TcxGridDBColumn;
    TableViewWorkDate: TcxGridDBColumn;
    TableViewWorkTime: TcxGridDBColumn;
    TableViewPlanTime: TcxGridDBColumn;
    TableViewWorkCost: TcxGridDBColumn;
    TableViewWInfo: TcxGridDBColumn;
    TableViewStatusInfo: TcxGridDBColumn;
    TableViewReasonInfo: TcxGridDBColumn;
    TableViewStatusComment: TcxGridDBColumn;
    TableViewSignalInfo: TcxGridDBColumn;
    TableViewSourceInfo: TcxGridDBColumn;
    TableViewPFInfo: TcxGridDBColumn;
    TableViewPayed: TcxGridDBColumn;
    TableViewHideTime: TcxGridDBColumn;
    TableViewCloseTime: TcxGridDBColumn;
    Level: TcxGridLevel;
    SplitterWorks: TcxSplitter;
    gbWorks: TcxGroupBox;
    GridWork: TcxGrid;
    ViewWork: TcxGridDBTableView;
    ViewWorkWorkName: TcxGridDBColumn;
    ViewWorkWorkCode: TcxGridDBColumn;
    ViewWorkWorkPrice: TcxGridDBColumn;
    ViewWorkWorkAmount: TcxGridDBColumn;
    LevelWork: TcxGridLevel;
    Query: TZQuery;
    QueryID: TIntegerField;
    QueryDeleted: TSmallintField;
    QueryID_AddUser: TSmallintField;
    QueryAddUser: TWideStringField;
    QueryAddTime: TDateTimeField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertEmployee: TWideStringField;
    QueryAssertTime: TDateTimeField;
    QueryRequestText: TWideStringField;
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
    QueryOCInfo: TWideStringField;
    QueryFlatNumber: TWideStringField;
    QueryName: TWideStringField;
    QueryIsClientDOMSPB: TSmallintField;
    QueryClientComment: TWideStringField;
    QueryClientDateTime: TDateTimeField;
    QueryStatusComment: TWideStringField;
    QueryPayed: TSmallintField;
    QueryStatusInfo: TWideStringField;
    QuerySignalInfo: TWideStringField;
    QueryPFInfo: TWideStringField;
    QuerySourceInfo: TWideStringField;
    QueryID_Reason: TSmallintField;
    QueryReasonInfo: TWideStringField;
    QueryHideTime: TDateTimeField;
    QueryCloseTime: TDateTimeField;
    qOrderWork: TZQuery;
    qOrderWorkID: TSmallintField;
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
    dsOrderWork: TDataSource;
    PopupMenu: TcxGridPopupMenu;
    PopupMenuWork: TcxGridPopupMenu;
    dxBarStatic1: TdxBarStatic;
    StyleRepository: TcxStyleRepository;
    StyleDeleted: TcxStyle;
    qOrderWorkWCTag: TWideStringField;
    qOrderWorkWarranty: TWideStringField;
    qOrderWorkWorkCost: TFloatField;
    qOrderWorkAmountText: TWideStringField;
    ViewWorkWorkCost: TcxGridDBColumn;
    ViewWorkWarranty: TcxGridDBColumn;
    ViewWorkWCTag: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure eKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aUpdateExecute(Sender: TObject);
    procedure eFromDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eToDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aCancelExecute(Sender: TObject);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewWorkFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableViewWorkCostGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetEnabledButtons;
    procedure UpdateData;
  end;

procedure BrowseOrderArch(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');

implementation

{$R *.dfm}

uses
  MainUnit, UOptions, UDatas, UWaiting, UConsts, DTKUtils, UUtil;

procedure BrowseOrderArch(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');
  var
    vForm : TBrowseOrderArchForm;
begin
  if OneWindow and ExistsForm(TBrowseOrderArchForm) then
  begin
    with FindForm(TBrowseOrderArchForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TBrowseOrderArchForm.Create(nil);
  with vForm do
  begin
    eFromDate.Text := AFromDate;
    eToDate.Text := AToDate;

    UpdateData;

    ShowWaiting(cDataGetting);
    Query.Open;
    HideWaiting;

    Tag := MaxMDITag(ClassType) + 1;
    if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);
    Show;
  end;
end;

procedure TBrowseOrderArchForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TBrowseOrderArchForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TBrowseOrderArchForm.eFromDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseOrderArchForm.eKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(TWinControl(Sender), true, true);
  end;
end;

procedure TBrowseOrderArchForm.eToDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseOrderArchForm.UpdateData;
begin
  ShowWaiting(cDataGetting);
  if Query.Active then
  begin
    qOrderWork.Close;
    Query.Close;
  end;
  with Query do
  begin
    if isDate(eFromDate.Text) then
      ParamByname('FD').AsString := DateToSQLDate(StrToDate(eFromDate.Text))
    else
      ParamByname('FD').AsString := '';

    if isDate(eToDate.Text) then
      ParamByname('TD').AsString := DateToSQLDate(StrToDate(eToDate.Text))
    else
      ParamByname('TD').AsString := '';
  end;

  qOrderWork.Open;
  Query.Open;

  HideWaiting;
end;

procedure TBrowseOrderArchForm.ViewWorkFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseOrderArchForm.SetEnabledButtons;
  var
    e : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aUpdate.Enabled :=
    not IsDate(eFromDate.Text) or
    not IsDate(eToDate.Text) or
    (eFromDate.Date <= eToDate.Date);
end;

procedure TBrowseOrderArchForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseOrderArchForm.TableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if AREcord = nil then Exit;

  if IsNUll(AREcord.Values[TableViewDeleted.Index], 0) = 1 then AStyle := StyleDeleted;
end;

procedure TBrowseOrderArchForm.TableViewWorkCostGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then AText := '';
end;

procedure TBrowseOrderArchForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TBrowseOrderArchForm.aUpdateExecute(Sender: TObject);
begin
  UpdateData;
  Grid.SetFocus;
end;

end.
