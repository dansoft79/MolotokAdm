//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Просмотр истории заказов
//
//------------------------------------------------------------------------------
unit UBrowseOrderHistory;

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
  cxNavigator, dxDateRanges, dxBarBuiltInMenu, cxSplitter,
  dxScrollbarAnnotations, dxmdaset, cxColorComboBox, cxBarEditItem,
  cxGridBandedTableView, cxGridDBBandedTableView, cxCheckComboBox;

type
  TBrowseOrderHistForm = class(TForm)
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
    dsOrderList: TDataSource;
    qOrderList: TZQuery;
    qOrderListDeleted: TSmallintField;
    qOrderListID_AddUser: TSmallintField;
    qOrderListAddUser: TWideStringField;
    qOrderListAddTime: TDateTimeField;
    qOrderListID_AssertUser: TSmallintField;
    qOrderListAssertEmployee: TWideStringField;
    qOrderListAssertTime: TDateTimeField;
    qOrderListRequestText: TWideStringField;
    qOrderListOrderNUmber: TWideStringField;
    qOrderListOrderDate: TDateTimeField;
    qOrderListOrderCategory: TSmallintField;
    qOrderListClosed: TSmallintField;
    qOrderListID_Client: TIntegerField;
    qOrderListPhone: TWideStringField;
    qOrderListAddress: TWideStringField;
    qOrderListID_StatusType: TSmallintField;
    qOrderListID_SignalType: TSmallintField;
    qOrderListID_SourceType: TSmallintField;
    qOrderListID_Distrinct: TSmallintField;
    qOrderListID_Metro: TSmallintField;
    qOrderListFiles: TSmallintField;
    qOrderListID_PaymentForm: TSmallintField;
    qOrderListID_Worker: TSmallintField;
    qOrderListWorkDate: TDateTimeField;
    qOrderListWorkTime: TDateTimeField;
    qOrderListPlanTime: TFloatField;
    qOrderListWorkCost: TFloatField;
    qOrderListWInfo: TWideStringField;
    qOrderListOCInfo: TWideStringField;
    qOrderListFlatNumber: TWideStringField;
    qOrderListName: TWideStringField;
    qOrderListIsClientDOMSPB: TSmallintField;
    qOrderListClientComment: TWideStringField;
    qOrderListClientDateTime: TDateTimeField;
    qOrderListStatusComment: TWideStringField;
    qOrderListPayed: TSmallintField;
    qOrderListStatusInfo: TWideStringField;
    qOrderListSignalInfo: TWideStringField;
    qOrderListPFInfo: TWideStringField;
    qOrderListSourceInfo: TWideStringField;
    qOrderListID_Reason: TSmallintField;
    qOrderListReasonInfo: TWideStringField;
    qOrderListHideTime: TDateTimeField;
    qOrderListCloseTime: TDateTimeField;
    PopupMenu: TcxGridPopupMenu;
    dxBarStatic1: TdxBarStatic;
    StyleRepository: TcxStyleRepository;
    StyleChanged: TcxStyle;
    aEdit: TAction;
    aUndoDelete: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton3: TdxBarButton;
    qOrderListWorkDateTime: TDateTimeField;
    qOrderListNeedCallDate: TDateTimeField;
    qOrderListCheckNumber: TWideStringField;
    qOrderListID_DiscountPromo: TSmallintField;
    qOrderListUid: TWideStringField;
    qOrderListOrderNumberExt: TWideStringField;
    qOrderListPersonalAccount: TWideStringField;
    eHistoryColor: TcxBarEditItem;
    pOrder: TPanel;
    qOrderListID: TLargeintField;
    qOrderListActionDateTime: TDateTimeField;
    qOrderListID_OrderList: TIntegerField;
    Grid: TcxGrid;
    TableView: TcxGridDBBandedTableView;
    TableViewActionDateTime: TcxGridDBBandedColumn;
    TableViewID: TcxGridDBBandedColumn;
    TableViewID_OrderList: TcxGridDBBandedColumn;
    TableViewDeleted: TcxGridDBBandedColumn;
    TableViewClosed: TcxGridDBBandedColumn;
    TableViewOCInfo: TcxGridDBBandedColumn;
    TableViewAddTime: TcxGridDBBandedColumn;
    TableViewAddUser: TcxGridDBBandedColumn;
    TableViewAssertTime: TcxGridDBBandedColumn;
    TableViewAssertUser: TcxGridDBBandedColumn;
    TableViewRequestText: TcxGridDBBandedColumn;
    TableViewName: TcxGridDBBandedColumn;
    TableViewIsClientDOMSPB: TcxGridDBBandedColumn;
    TableViewPhone: TcxGridDBBandedColumn;
    TableViewAddress: TcxGridDBBandedColumn;
    TableViewFlatNumber: TcxGridDBBandedColumn;
    TableViewClientDateTime: TcxGridDBBandedColumn;
    TableViewClientComment: TcxGridDBBandedColumn;
    TableViewWInfo: TcxGridDBBandedColumn;
    TableViewWorkDate: TcxGridDBBandedColumn;
    TableViewWorkTime: TcxGridDBBandedColumn;
    TableViewPlanTime: TcxGridDBBandedColumn;
    TableViewWorkCost: TcxGridDBBandedColumn;
    TableViewSourceInfo: TcxGridDBBandedColumn;
    TableViewSignalInfo: TcxGridDBBandedColumn;
    TableViewStatusInfo: TcxGridDBBandedColumn;
    TableViewStatusComment: TcxGridDBBandedColumn;
    TableViewReasonInfo: TcxGridDBBandedColumn;
    TableViewPayed: TcxGridDBBandedColumn;
    TableViewPFInfo: TcxGridDBBandedColumn;
    TableViewCloseTime: TcxGridDBBandedColumn;
    TableViewCheckNumber: TcxGridDBBandedColumn;
    TableViewOrderNumberExt: TcxGridDBBandedColumn;
    TableViewPersonalAccount: TcxGridDBBandedColumn;
    Level: TcxGridLevel;
    qOne: TZQuery;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    WideStringField1: TWideStringField;
    DateTimeField1: TDateTimeField;
    SmallintField3: TSmallintField;
    WideStringField2: TWideStringField;
    DateTimeField2: TDateTimeField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    DateTimeField3: TDateTimeField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    IntegerField1: TIntegerField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    SmallintField8: TSmallintField;
    SmallintField9: TSmallintField;
    SmallintField10: TSmallintField;
    SmallintField11: TSmallintField;
    SmallintField12: TSmallintField;
    SmallintField13: TSmallintField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    WideStringField9: TWideStringField;
    WideStringField10: TWideStringField;
    SmallintField14: TSmallintField;
    WideStringField11: TWideStringField;
    DateTimeField6: TDateTimeField;
    WideStringField12: TWideStringField;
    SmallintField15: TSmallintField;
    WideStringField13: TWideStringField;
    WideStringField14: TWideStringField;
    WideStringField15: TWideStringField;
    WideStringField16: TWideStringField;
    SmallintField16: TSmallintField;
    WideStringField17: TWideStringField;
    DateTimeField7: TDateTimeField;
    DateTimeField8: TDateTimeField;
    DateTimeField9: TDateTimeField;
    DateTimeField10: TDateTimeField;
    WideStringField18: TWideStringField;
    SmallintField17: TSmallintField;
    WideStringField19: TWideStringField;
    WideStringField20: TWideStringField;
    WideStringField21: TWideStringField;
    LargeintField1: TLargeintField;
    DateTimeField11: TDateTimeField;
    IntegerField2: TIntegerField;
    dsOne: TDataSource;
    GridOne: TcxGrid;
    TableViewOne: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn11: TcxGridDBBandedColumn;
    cxGridDBBandedColumn12: TcxGridDBBandedColumn;
    cxGridDBBandedColumn13: TcxGridDBBandedColumn;
    cxGridDBBandedColumn14: TcxGridDBBandedColumn;
    cxGridDBBandedColumn15: TcxGridDBBandedColumn;
    cxGridDBBandedColumn16: TcxGridDBBandedColumn;
    cxGridDBBandedColumn18: TcxGridDBBandedColumn;
    cxGridDBBandedColumn19: TcxGridDBBandedColumn;
    cxGridDBBandedColumn20: TcxGridDBBandedColumn;
    cxGridDBBandedColumn21: TcxGridDBBandedColumn;
    cxGridDBBandedColumn22: TcxGridDBBandedColumn;
    cxGridDBBandedColumn23: TcxGridDBBandedColumn;
    cxGridDBBandedColumn24: TcxGridDBBandedColumn;
    cxGridDBBandedColumn25: TcxGridDBBandedColumn;
    cxGridDBBandedColumn26: TcxGridDBBandedColumn;
    cxGridDBBandedColumn27: TcxGridDBBandedColumn;
    cxGridDBBandedColumn28: TcxGridDBBandedColumn;
    cxGridDBBandedColumn29: TcxGridDBBandedColumn;
    cxGridDBBandedColumn30: TcxGridDBBandedColumn;
    cxGridDBBandedColumn31: TcxGridDBBandedColumn;
    cxGridDBBandedColumn32: TcxGridDBBandedColumn;
    cxGridDBBandedColumn33: TcxGridDBBandedColumn;
    cxGridDBBandedColumn34: TcxGridDBBandedColumn;
    cxGridDBBandedColumn35: TcxGridDBBandedColumn;
    LevelOne: TcxGridLevel;
    SplitterClient: TcxSplitter;
    qOrderListCancelled: TSmallintField;
    qOneCancelled: TSmallintField;
    TableViewCancelled: TcxGridDBBandedColumn;
    TableViewOneCancelled: TcxGridDBBandedColumn;
    qOrderListMaterialCost: TFloatField;
    qOrderListFullCost: TFloatField;
    qOneMaterialCost: TFloatField;
    qOneFullCost: TFloatField;
    TableViewMaterialCost: TcxGridDBBandedColumn;
    TableViewFullCost: TcxGridDBBandedColumn;
    TableViewOneMaterialCost: TcxGridDBBandedColumn;
    TableViewOneFullCost: TcxGridDBBandedColumn;
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
    procedure cxBarEditItem1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetEnabledButtons;
    procedure UpdateData;
  end;

procedure BrowseOrderHist(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');

implementation

{$R *.dfm}

uses
  MainUnit, UOptions, UDatas, UWaiting, UConsts, DTKUtils, UUtil,
  UOrderLIstParams, UOrderList;

procedure BrowseOrderHist(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');
  var
    vForm : TBrowseOrderHistForm;
begin
  if OneWindow and ExistsForm(TBrowseOrderHistForm) then
  begin
    with FindForm(TBrowseOrderHistForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TBrowseOrderHistForm.Create(nil);
  with vForm do
  begin
    eFromDate.Text := AFromDate;
    eToDate.Text := AToDate;

    UpdateData;

    ShowWaiting(cDataGetting);
    QOrderList.Open;
    HideWaiting;

    Tag := MaxMDITag(ClassType) + 1;
    if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);
    Show;
  end;
end;

procedure TBrowseOrderHistForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StyleChanged.Color := eHistoryColor.EditValue;

  PrepareFormName(self); PropertiesStore.StoreTo(false);

  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TBrowseOrderHistForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  BarManager.LoadFromIniFile(cIniFileName);

  eHistoryColor.EditValue := StyleChanged.Color;
end;

procedure TBrowseOrderHistForm.eFromDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseOrderHistForm.eKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(TWinControl(Sender), true, true);
  end;
end;

procedure TBrowseOrderHistForm.eToDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseOrderHistForm.UpdateData;
begin
  ShowWaiting(cDataGetting);
  if qOrderList.Active then
  begin
    qOne.Close;
    qOrderList.Close;
  end;
  with qOrderList do
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

  qOrderList.Open;
  qOne.Open;

  HideWaiting;
end;

procedure TBrowseOrderHistForm.ViewWorkFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseOrderHistForm.SetEnabledButtons;
  var
    e, ce : boolean;
begin
  with TableView.Controller do
    e :=
      qOrderList.Active and
      not qOrderList.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  ce := CanEditInActionByAction(MainForm.aaBrowseOrderArch);

  aUpdate.Enabled :=
    not IsDate(eFromDate.Text) or
    not IsDate(eToDate.Text) or
    (eFromDate.Date <= eToDate.Date);
end;

procedure TBrowseOrderHistForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseOrderHistForm.TableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  var
    n, m : integer;
    v1, v2 : variant;
begin
  if (ARecord = nil) or (AItem = nil) or not ARecord.IsData then Exit;
  n := ARecord.RecordIndex;
  if n = -1 then Exit;

  if n = 0 then
  begin
    AStyle := StyleChanged;
  end
  else
  begin
    m := AItem.Index;
    v1 := ARecord.Values[m];
    v2 := Sender.DataController.GetValue(n - 1, m);
    if v1 <> v2 then AStyle := StyleChanged;
  end;
end;

procedure TBrowseOrderHistForm.TableViewWorkCostGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then AText := '';
end;

procedure TBrowseOrderHistForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TBrowseOrderHistForm.aUpdateExecute(Sender: TObject);
begin
  UpdateData;
  Grid.SetFocus;
end;

procedure TBrowseOrderHistForm.cxBarEditItem1PropertiesChange(
  Sender: TObject);
begin
  StyleChanged.Color := eHistoryColor.EditValue;

  qOne.Close;
  qOne.Open;
end;

end.
