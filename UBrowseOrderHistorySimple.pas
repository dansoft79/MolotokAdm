//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Просмотр простой истории заявок
//
//------------------------------------------------------------------------------
unit UBrowseOrderHistorySimple;

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
  dxScrollbarAnnotations, dxmdaset, cxPC;

type
  TBrowseOrderHistorySimpleForm = class(TForm)
    StatusBar: TdxStatusBar;
    PropertiesStore: TcxPropertiesStore;
    ActionList: TActionList;
    aCancel: TAction;
    aUpdate: TAction;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    dxBarButton5: TdxBarButton;
    dsClient: TDataSource;
    qClient: TZQuery;
    qClientID: TIntegerField;
    qClientDeleted: TSmallintField;
    qClientID_AddUser: TSmallintField;
    qClientAddUser: TWideStringField;
    qClientAddTime: TDateTimeField;
    qClientID_AssertUser: TSmallintField;
    qClientAssertEmployee: TWideStringField;
    qClientAssertTime: TDateTimeField;
    qClientRequestText: TWideStringField;
    qClientOrderNUmber: TWideStringField;
    qClientOrderDate: TDateTimeField;
    qClientOrderCategory: TSmallintField;
    qClientClosed: TSmallintField;
    qClientID_Client: TIntegerField;
    qClientPhone: TWideStringField;
    qClientAddress: TWideStringField;
    qClientID_StatusType: TSmallintField;
    qClientID_SignalType: TSmallintField;
    qClientID_SourceType: TSmallintField;
    qClientID_Distrinct: TSmallintField;
    qClientID_Metro: TSmallintField;
    qClientFiles: TSmallintField;
    qClientID_PaymentForm: TSmallintField;
    qClientID_Worker: TSmallintField;
    qClientWorkDate: TDateTimeField;
    qClientWorkTime: TDateTimeField;
    qClientPlanTime: TFloatField;
    qClientWorkCost: TFloatField;
    qClientWInfo: TWideStringField;
    qClientOCInfo: TWideStringField;
    qClientFlatNumber: TWideStringField;
    qClientName: TWideStringField;
    qClientIsClientDOMSPB: TSmallintField;
    qClientClientComment: TWideStringField;
    qClientClientDateTime: TDateTimeField;
    qClientStatusComment: TWideStringField;
    qClientPayed: TSmallintField;
    qClientStatusInfo: TWideStringField;
    qClientSignalInfo: TWideStringField;
    qClientPFInfo: TWideStringField;
    qClientSourceInfo: TWideStringField;
    qClientID_Reason: TSmallintField;
    qClientReasonInfo: TWideStringField;
    qClientHideTime: TDateTimeField;
    qClientCloseTime: TDateTimeField;
    qOrderWorkClient: TZQuery;
    qOrderWorkClientID: TSmallintField;
    SmallintField15: TSmallintField;
    SmallintField17: TSmallintField;
    WideStringField13: TWideStringField;
    DateTimeField7: TDateTimeField;
    qOrderWorkClientID_OrderList: TIntegerField;
    qOrderWorkClientID_WorkType: TSmallintField;
    qOrderWorkClientID_WorkerClass: TSmallintField;
    qOrderWorkClientWorkName: TWideStringField;
    qOrderWorkClientWorkPrice: TFloatField;
    qOrderWorkClientWorkNorm: TFloatField;
    qOrderWorkClientWorkAmount: TFloatField;
    qOrderWorkClientWorkUnitName: TWideStringField;
    qOrderWorkClientWorkCode: TWideStringField;
    qOrderWorkClientWorkWarrantyType: TSmallintField;
    qOrderWorkClientWorkWarrantyTime: TIntegerField;
    qOrderWorkClientWTInfo: TWideStringField;
    qOrderWorkClientWTypeInfo: TWideStringField;
    qOrderWorkClientWTypeShortInfo: TWideStringField;
    dsOrderWorkClient: TDataSource;
    PopupMenuClient: TcxGridPopupMenu;
    PopupMenuClientWork: TcxGridPopupMenu;
    StyleRepository: TcxStyleRepository;
    StyleDeleted: TcxStyle;
    qOrderWorkClientWCTag: TWideStringField;
    qOrderWorkClientWarranty: TWideStringField;
    qOrderWorkClientWorkCost: TFloatField;
    qOrderWorkClientAmountText: TWideStringField;
    aEdit: TAction;
    aUndoDelete: TAction;
    qClientWorkDateTime: TDateTimeField;
    qClientNeedCallDate: TDateTimeField;
    qClientCheckNumber: TWideStringField;
    qClientID_DiscountPromo: TSmallintField;
    qClientUid: TWideStringField;
    qClientOrderNumberExt: TWideStringField;
    qClientPersonalAccount: TWideStringField;
    qOrderWorkClientWorkSum: TFloatField;
    qOrderWorkClientID_Discount: TSmallintField;
    qOrderWorkClientID_DiscountPromo: TSmallintField;
    qOrderWorkClientDiscountPercent: TFloatField;
    qOrderWorkClientDiscountSum: TFloatField;
    qOrderWorkClientDiscountPromoPercent: TFloatField;
    qOrderWorkClientDiscountPromoSum: TFloatField;
    qOrderWorkClientTotalPrice: TFloatField;
    qOrderWorkClientTotalSum: TFloatField;
    qOrderWorkClientDiscountDebtType: TSmallintField;
    qOrderWorkClientDiscountSubType: TSmallintField;
    qOrderWorkClientDiscountCanAdd: TSmallintField;
    qOrderWorkClientDiscountMinOrderSum: TFloatField;
    qOrderWorkClientDiscountPromoDebtType: TSmallintField;
    qOrderWorkClientDiscountPromoSubType: TSmallintField;
    qOrderWorkClientDiscountPromoCanAdd: TSmallintField;
    qOrderWorkClientDiscountPromoMinOrderSum: TFloatField;
    cxPageControl1: TcxPageControl;
    tsClient: TcxTabSheet;
    tsAddress: TcxTabSheet;
    GridClient: TcxGrid;
    TableViewClient: TcxGridDBTableView;
    TableViewClientDeleted: TcxGridDBColumn;
    TableViewClientClosed: TcxGridDBColumn;
    TableViewClientID: TcxGridDBColumn;
    TableViewClientStatusInfo: TcxGridDBColumn;
    TableViewClientAddTime: TcxGridDBColumn;
    TableViewClientAddUser: TcxGridDBColumn;
    TableViewClientAssertTime: TcxGridDBColumn;
    TableViewClientAssertUser: TcxGridDBColumn;
    TableViewClientOrderNUmber: TcxGridDBColumn;
    TableViewClientOrderDate: TcxGridDBColumn;
    TableViewClientOCInfo: TcxGridDBColumn;
    TableViewClientPhone: TcxGridDBColumn;
    TableViewClientRequestText: TcxGridDBColumn;
    TableViewClientName: TcxGridDBColumn;
    TableViewClientIsClientDOMSPB: TcxGridDBColumn;
    TableViewClientAddress: TcxGridDBColumn;
    TableViewClientWInfo: TcxGridDBColumn;
    TableViewClientWorkDate: TcxGridDBColumn;
    TableViewClientWorkTime: TcxGridDBColumn;
    TableViewClientFlatNumber: TcxGridDBColumn;
    TableViewClientClientComment: TcxGridDBColumn;
    TableViewClientFiles: TcxGridDBColumn;
    TableViewClientClientDateTime: TcxGridDBColumn;
    TableViewClientPlanTime: TcxGridDBColumn;
    TableViewClientWorkCost: TcxGridDBColumn;
    TableViewClientSignalInfo: TcxGridDBColumn;
    TableViewClientReasonInfo: TcxGridDBColumn;
    TableViewClientStatusComment: TcxGridDBColumn;
    TableViewClientSourceInfo: TcxGridDBColumn;
    TableViewClientPFInfo: TcxGridDBColumn;
    TableViewClientPayed: TcxGridDBColumn;
    TableViewClientHideTime: TcxGridDBColumn;
    TableViewClientCloseTime: TcxGridDBColumn;
    LevelClient: TcxGridLevel;
    SplitterWorks: TcxSplitter;
    gbWorksClient: TcxGroupBox;
    GridClientWork: TcxGrid;
    ViewClientWork: TcxGridDBTableView;
    ViewClientWorkWorkCode: TcxGridDBColumn;
    ViewClientWorkWCTag: TcxGridDBColumn;
    ViewClientWorkWorkName: TcxGridDBColumn;
    ViewClientWorkWorkAmount: TcxGridDBColumn;
    ViewClientWorkWorkPrice: TcxGridDBColumn;
    ViewClientWorkWorkCost: TcxGridDBColumn;
    ViewClientWorkWarranty: TcxGridDBColumn;
    LevelClientWork: TcxGridLevel;
    eClient: TdxBarEdit;
    eAddress: TdxBarEdit;
    qAddress: TZQuery;
    IntegerField1: TIntegerField;
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
    IntegerField2: TIntegerField;
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
    SmallintField16: TSmallintField;
    WideStringField14: TWideStringField;
    WideStringField15: TWideStringField;
    WideStringField16: TWideStringField;
    WideStringField17: TWideStringField;
    SmallintField18: TSmallintField;
    WideStringField18: TWideStringField;
    DateTimeField8: TDateTimeField;
    DateTimeField9: TDateTimeField;
    DateTimeField10: TDateTimeField;
    DateTimeField11: TDateTimeField;
    WideStringField19: TWideStringField;
    SmallintField19: TSmallintField;
    WideStringField20: TWideStringField;
    WideStringField21: TWideStringField;
    WideStringField22: TWideStringField;
    dsAddress: TDataSource;
    GridAddress: TcxGrid;
    TableViewAddress: TcxGridDBTableView;
    TableViewAddressDeleted: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
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
    LevelAddress: TcxGridLevel;
    gbWorksAddress: TcxGroupBox;
    GridAddressWork: TcxGrid;
    ViewAddressWork: TcxGridDBTableView;
    cxGridDBColumn34: TcxGridDBColumn;
    cxGridDBColumn35: TcxGridDBColumn;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridDBColumn37: TcxGridDBColumn;
    cxGridDBColumn38: TcxGridDBColumn;
    cxGridDBColumn39: TcxGridDBColumn;
    cxGridDBColumn40: TcxGridDBColumn;
    LevelAddressWork: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    qOrderWorkAddress: TZQuery;
    SmallintField20: TSmallintField;
    SmallintField21: TSmallintField;
    SmallintField22: TSmallintField;
    WideStringField23: TWideStringField;
    DateTimeField12: TDateTimeField;
    IntegerField3: TIntegerField;
    SmallintField23: TSmallintField;
    SmallintField24: TSmallintField;
    WideStringField24: TWideStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    WideStringField25: TWideStringField;
    WideStringField26: TWideStringField;
    SmallintField25: TSmallintField;
    IntegerField4: TIntegerField;
    WideStringField27: TWideStringField;
    WideStringField28: TWideStringField;
    WideStringField29: TWideStringField;
    WideStringField30: TWideStringField;
    FloatField6: TFloatField;
    WideStringField31: TWideStringField;
    WideStringField32: TWideStringField;
    FloatField7: TFloatField;
    SmallintField26: TSmallintField;
    SmallintField27: TSmallintField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    SmallintField28: TSmallintField;
    SmallintField29: TSmallintField;
    SmallintField30: TSmallintField;
    FloatField14: TFloatField;
    SmallintField31: TSmallintField;
    SmallintField32: TSmallintField;
    SmallintField33: TSmallintField;
    FloatField15: TFloatField;
    dsOrderWorkAddress: TDataSource;
    PopupMenuAddressWork: TcxGridPopupMenu;
    cxGridPopupAddress: TcxGridPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure eKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eFromDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eToDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aCancelExecute(Sender: TObject);
    procedure TableViewClientFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewClientWorkFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableViewClientWorkCostGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure TableViewAddressStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
    FModified : boolean;
    FClientPhone : string;
    FClientAddress : string;
  public
    { Public declarations }
    procedure SetEnabledButtons;
    procedure UpdateData;
  end;

procedure BrowseOrderHistorySimple(AClientPhone, AClientAddress : string);

implementation

{$R *.dfm}

uses
  MainUnit, UOptions, UDatas, UWaiting, UConsts, DTKUtils, UUtil,
  UOrderLIstParams, UOrderList;

procedure BrowseOrderHistorySimple(AClientPhone, AClientAddress : string);
  var
    vForm : TBrowseOrderHistorySimpleForm;
begin
  vForm := TBrowseOrderHistorySimpleForm.Create(nil);
  with vForm do
  begin
    FClientPhone := AClientPhone;
    FClientAddress := AClientAddress;

    if FClientPhone = '' then eClient.Text := 'Информация не заполнена'
    else eClient.Text := PhoneFormat(FClientPhone);

    if FClientAddress = '' then eAddress.Text := 'Информация не заполнена'
    else eAddress.Text := FClientAddress;

    FModified := false;

    ShowWaiting(cDataGetting);
    UpdateData;
    HideWaiting;

    ShowModal;
  end;
end;

procedure TBrowseOrderHistorySimpleForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);

  TableViewClient.StoreToIniFile(cIniFileName, false);
  TableViewAddress.StoreToIniFile(cIniFileName, false);
  ViewClientWork.StoreToIniFile(cIniFileName, false);
  ViewAddressWork.StoreToIniFile(cIniFileName, false);

  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TBrowseOrderHistorySimpleForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableViewClient.RestoreFromIniFile(cIniFileName);
  TableViewAddress.RestoreFromIniFile(cIniFileName);
  ViewClientWork.RestoreFromIniFile(cIniFileName);
  ViewAddressWork.RestoreFromIniFile(cIniFileName);

  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TBrowseOrderHistorySimpleForm.eFromDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseOrderHistorySimpleForm.eKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(TWinControl(Sender), true, true);
  end;
end;

procedure TBrowseOrderHistorySimpleForm.eToDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseOrderHistorySimpleForm.UpdateData;
begin
  ShowWaiting(cDataGetting);

  qOrderWorkClient.Close;
  qClient.Close;
  qOrderWorkAddress.Close;
  qAddress.Close;

  with qClient do
  begin
    ParamByname('PH').AsString := FClientPhone;
  end;
  with qAddress do
  begin
    ParamByname('Addr').AsString := FClientAddress;
  end;

  qOrderWorkClient.Open;
  qClient.Open;

  qOrderWorkAddress.Open;
  qAddress.Open;

  HideWaiting;
end;

procedure TBrowseOrderHistorySimpleForm.ViewClientWorkFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseOrderHistorySimpleForm.SetEnabledButtons;
  var
    ce, e : boolean;
begin
{  with TableViewClient.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  ce := CanEditInActionByAction(MainForm.aaBrowseOrderArch);}

end;

procedure TBrowseOrderHistorySimpleForm.TableViewAddressStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if AREcord = nil then Exit;

  if IsNUll(AREcord.Values[TableViewAddressDeleted.Index], 0) = 1 then AStyle := StyleDeleted;
end;

procedure TBrowseOrderHistorySimpleForm.TableViewClientFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseOrderHistorySimpleForm.TableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if AREcord = nil then Exit;

  if IsNUll(AREcord.Values[TableViewClientDeleted.Index], 0) = 1 then AStyle := StyleDeleted;
end;

procedure TBrowseOrderHistorySimpleForm.TableViewClientWorkCostGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then AText := '';
end;

procedure TBrowseOrderHistorySimpleForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

end.
