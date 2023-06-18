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
  cxNavigator, dxDateRanges, dxBarBuiltInMenu, cxSplitter,
  dxScrollbarAnnotations, dxmdaset;

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
    aEdit: TAction;
    aUndoDelete: TAction;
    Table: TZQuery;
    qWork: TZQuery;
    mdWork: TdxMemData;
    mdWorkID: TLargeintField;
    mdWorkID_WorkType: TIntegerField;
    mdWorkID_WorkerClass: TIntegerField;
    mdWorkWorkType: TStringField;
    mdWorkPrice: TFloatField;
    mdWorkAmount: TFloatField;
    mdWorkWorkSum: TFloatField;
    mdWorkUnitName: TStringField;
    mdWorkNorm: TFloatField;
    mdWorkWorkWarrantyType: TIntegerField;
    mdWorkWorkWarrantyTime: TIntegerField;
    mdWorkWorkerClassTag: TStringField;
    mdWorkEdited: TSmallintField;
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
    dxBarButton1: TdxBarButton;
    dxBarButton3: TdxBarButton;
    QueryWorkDateTime: TDateTimeField;
    QueryNeedCallDate: TDateTimeField;
    QueryCheckNumber: TWideStringField;
    QueryID_DiscountPromo: TSmallintField;
    QueryUid: TWideStringField;
    QueryOrderNumberExt: TWideStringField;
    QueryPersonalAccount: TWideStringField;
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
    qOrderWorkDiscountMinOrderSum: TFloatField;
    qOrderWorkDiscountPromoDebtType: TSmallintField;
    qOrderWorkDiscountPromoSubType: TSmallintField;
    qOrderWorkDiscountPromoCanAdd: TSmallintField;
    qOrderWorkDiscountPromoMinOrderSum: TFloatField;
    qMaterial: TZQuery;
    mdMaterial: TdxMemData;
    LargeintField1: TLargeintField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    SmallintField5: TSmallintField;
    pBottom: TPanel;
    gbWorks: TcxGroupBox;
    GridWork: TcxGrid;
    ViewWork: TcxGridDBTableView;
    ViewWorkWorkCode: TcxGridDBColumn;
    ViewWorkWCTag: TcxGridDBColumn;
    ViewWorkWorkName: TcxGridDBColumn;
    ViewWorkWorkAmount: TcxGridDBColumn;
    ViewWorkWorkPrice: TcxGridDBColumn;
    ViewWorkWorkCost: TcxGridDBColumn;
    ViewWorkWarranty: TcxGridDBColumn;
    LevelWork: TcxGridLevel;
    gbMaterial: TcxGroupBox;
    GridMaterial: TcxGrid;
    ViewMaterial: TcxGridDBTableView;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridDBColumn37: TcxGridDBColumn;
    cxGridDBColumn38: TcxGridDBColumn;
    cxGridDBColumn39: TcxGridDBColumn;
    cxGridDBColumn40: TcxGridDBColumn;
    cxGridDBColumn41: TcxGridDBColumn;
    LevelMaterial: TcxGridLevel;
    qOrderMaterial: TZQuery;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    WideStringField1: TWideStringField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    SmallintField4: TSmallintField;
    WideStringField2: TWideStringField;
    FloatField1: TFloatField;
    FloatField3: TFloatField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    FloatField4: TFloatField;
    WideStringField10: TWideStringField;
    FloatField5: TFloatField;
    qOrderMaterialMTInfo: TWideStringField;
    qOrderMaterialCategory: TWideStringField;
    dsOrderMaterial: TDataSource;
    QueryCancelled: TSmallintField;
    QueryMaterialCost: TFloatField;
    QueryFullCost: TFloatField;
    TableViewCancelled: TcxGridDBColumn;
    TableViewMaterialCost: TcxGridDBColumn;
    TableViewFullCost: TcxGridDBColumn;
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
    procedure aEditExecute(Sender: TObject);
    procedure aUndoDeleteExecute(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
    procedure pBottomResize(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;

    procedure SaveWorkList(AIDOrderList : integer; AMemoryStream : TMemoryStream);
    procedure LoadWorkList(AIDOrderList : integer; AMemoryStream : TMemoryStream);

    procedure SaveMaterialList(AIDOrderList : integer; AMemoryStream : TMemoryStream);
    procedure LoadMaterialList(AIDOrderList : integer; AMemoryStream : TMemoryStream);

    function UndoDeleteOrderLIstDialog : boolean;
    function EditOrderLIstDialog : boolean;
  public
    { Public declarations }
    procedure SetEnabledButtons;
    procedure UpdateData;
  end;

procedure BrowseOrderArch(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');

implementation

{$R *.dfm}

uses
  MainUnit, UOptions, UDatas, UWaiting, UConsts, DTKUtils, UUtil,
  UOrderLIstParams, UOrderList;

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

    FModified := false;

    UpdateData;

    ShowWaiting(cDataGetting);
    Query.Open;
    HideWaiting;

    SetEnabledButtons;

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
  ViewWork.StoreToIniFile(cIniFileName, false);
  ViewMaterial.StoreToIniFile(cIniFileName, false);

  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TBrowseOrderArchForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableView.RestoreFromIniFile(cIniFileName);
  ViewWork.RestoreFromIniFile(cIniFileName);
  ViewMaterial.RestoreFromIniFile(cIniFileName);

  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TBrowseOrderArchForm.LoadMaterialList(AIDOrderList: integer;
  AMemoryStream: TMemoryStream);
  var
    v : variant;
begin
  mdMaterial.Close;
  mdMaterial.Open;

  qMaterial.Close;
  qMaterial.ParamByName('ID').AsInteger := AIDOrderList;
  qMaterial.Open;
  qMaterial.First;
  while not qMaterial.eof do
  begin
    mdMaterial.Append;
    mdMaterial.FieldByName('Edited').AsInteger := 0;
    mdMaterial.FieldByName('ID').AsInteger := qMaterial.FieldByName('ID').AsInteger;
    mdMaterial.FieldByName('ID_MaterialType').Value := qMaterial.FieldByName('ID_MaterialType').Value;
    mdMaterial.FieldByName('MaterialName').AsString := qMaterial.FieldByName('MaterialName').AsString;
    mdMaterial.FieldByName('MaterialPrice').AsFloat := qMaterial.FieldByName('MaterialPrice').AsFloat;
    mdMaterial.FieldByName('MaterialAmount').AsFloat := qMaterial.FieldByName('MaterialAmount').AsFloat;
    mdMaterial.FieldByName('MaterialUnitName').AsString := qMaterial.FieldByName('MaterialUnitName').AsString;
    mdMaterial.FieldByName('MaterialCode').AsString := qMaterial.FieldByName('MaterialCode').AsString;

    //добавляем все поля по скидкам
    mdMaterial.FieldByName('MaterialSum').Value := qMaterial.FieldByName('MaterialSum').Value;

    mdMaterial.Post;

    qMaterial.Next;
  end;
  qMaterial.Close;

  AMemoryStream.Clear;
  mdMaterial.SaveToStream(AMemoryStream);
end;

procedure TBrowseOrderArchForm.LoadWorkList(AIDOrderList: integer;
  AMemoryStream: TMemoryStream);
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

procedure TBrowseOrderArchForm.pBottomResize(Sender: TObject);
begin
  gbMaterial.Width := pBottom.Width div 2;
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

function TBrowseOrderArchForm.UndoDeleteOrderLIstDialog: boolean;
  var
    vRecNo, vID : integer;
    vType : integer;
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

  vType := Query.FieldByName('OrderCategory').AsInteger;

  Table.Close;

  Query.Refresh;

  if Query.RecordCount > 1 then
    Query.RecNo := vRecNo;

  SetEnabledButtons;

  if vType = 1 then
    UOrderList.EditOrderList(vID, MainForm.aaOrderList);
end;

procedure TBrowseOrderArchForm.UpdateData;
begin
  ShowWaiting(cDataGetting);
  if Query.Active then
  begin
    qOrderWork.Close;
    qOrderMaterial.Close;
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
  qOrderMaterial.Open;
  Query.Open;

  HideWaiting;
end;

procedure TBrowseOrderArchForm.ViewWorkFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseOrderArchForm.SaveMaterialList(AIDOrderList: integer;
  AMemoryStream: TMemoryStream);
begin
  qMaterial.Close;
  qMaterial.ParamByName('ID').AsInteger := AIDOrderList;
  qMaterial.Open;

  AMemoryStream.Position := 0;;
  mdMaterial.Close;
  mdMaterial.Open;
  mdMaterial.LoadFromStream(AMemoryStream);

  //удаляем записи, отсутствующие в мемдата
  qMaterial.First;
  while not qMaterial.eof do
  begin
    if not mdMaterial.Locate('ID', qMaterial.FieldByName('ID').AsInteger, []) then
    begin
      qMaterial.Edit;
      qMaterial.FieldByName('ID_AssertUser').AsInteger := UserID;
      qMaterial.FieldByName('Deleted').AsInteger := 1;
      qMaterial.Post;
    end;
    qMaterial.Next;
  end;

  qMaterial.Close;
  qMaterial.Open;

  //добавляем или обновляем
  mdMaterial.First;
  while not mdMaterial.eof do
  begin
    if mdMaterial.FieldByName('ID').AsInteger = 0 then
    begin
      //добавляем строку
      qMaterial.Append;
      qMaterial.FieldByName('ID_OrderList').AsInteger := AIDOrderList;
      qMaterial.FieldByName('ID_AssertUser').AsInteger := UserID;
      qMaterial.FieldByName('ID_MaterialType').Value := NullIfZero(mdMaterial.FieldByName('ID_MaterialType').AsINteger);
    end
    else
    begin
      //редактируем строку
      qMaterial.Locate('ID', mdMaterial.FieldByName('ID').AsInteger, []);
      qMaterial.Edit;

      if mdMaterial.FieldByName('Edited').AsInteger = 1 then
      begin
        qMaterial.FieldByName('ID_AssertUser').AsInteger := UserID;
      end;
    end;

    qMaterial.FieldByName('MaterialName').AsString := mdMaterial.FieldByName('MaterialName').AsString;
    qMaterial.FieldByName('MaterialPrice').AsFloat := mdMaterial.FieldByName('MaterialPrice').AsFloat;
    qMaterial.FieldByName('MaterialAmount').AsFloat := mdMaterial.FieldByName('MaterialAmount').AsFloat;
    qMaterial.FieldByName('MaterialUnitName').AsString := mdMaterial.FieldByName('MaterialUnitName').AsString;
    qMaterial.FieldByName('MaterialCode').AsString := mdMaterial.FieldByName('MaterialCode').AsString;

    //добавляем все поля по скидкам
    qMaterial.FieldByName('MaterialSum').Value := mdMaterial.FieldByName('MaterialSum').Value;

    qMaterial.Post;

    mdMaterial.Next;
  end;
  qMaterial.Close;
end;

procedure TBrowseOrderArchForm.SaveWorkList(AIDOrderList: integer;
  AMemoryStream: TMemoryStream);
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

procedure TBrowseOrderArchForm.SetEnabledButtons;
  var
    ce, e, del : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  ce := CanEditInActionByAction(MainForm.aaBrowseOrderArch);

  del := e and (Query.FieldByName('Deleted').AsINteger = 1);

  aUpdate.Enabled :=
    not IsDate(eFromDate.Text) or
    not IsDate(eToDate.Text) or
    (eFromDate.Date <= eToDate.Date);

  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;
end;

procedure TBrowseOrderArchForm.TableViewDblClick(Sender: TObject);
begin
  if aUndoDelete.Enabled then aUndoDelete.Execute
  else
    if aEdit.Enabled then aEdit.Execute;
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

procedure TBrowseOrderArchForm.aEditExecute(Sender: TObject);
begin
  FModified := EditOrderLIstDialog or FModified;
  SetEnabledButtons;
end;

procedure TBrowseOrderArchForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteOrderLIstDialog or FModified;
  SetEnabledButtons;
end;

procedure TBrowseOrderArchForm.aUpdateExecute(Sender: TObject);
begin
  UpdateData;
  Grid.SetFocus;
end;

function TBrowseOrderArchForm.EditOrderLIstDialog: boolean;
  var
    vOrderNum, vOrderDate : string;
    vCheckNumber, vStatusComment, vOrderType, vAddTime : string;
    vIDReason, vPayed, vID, vIDClient, vIDSignalType, vIDSourceType, vIDStatusType, vIDPaymentForm, vIDDistrict, vIDMetro : integer;
    vClientComment, vPhone, vName, vAddress, vFlatNumber, vRequestText : string;
    vClientDomSPB : integer;
    vWorkList, vMaterialList : TMemoryStream;
    vOrderNumberExt, vPersonalAccount, vClientDateTime : string;
    vNeedCallDate, vWorkDate, vWorkTime, vPLanTime : string;
    vIDDiscountTypePromo, vIDWorker : integer;
    vSumMaterial, vSum : double;
    vOldOrderCategory : integer;
begin
  vWorkList := TMemoryStream.Create;
  vMaterialList := TMemoryStream.Create;
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
    vOrderNumberExt := FieldByName('OrderNumberExt').AsString;
    vPersonalAccount := FieldByName('PersonalAccount').AsString;

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

    vOldOrderCategory := FieldByName('OrderCategory').AsInteger;

    LoadWorkList(vID, vWorkList);
    LoadMaterialList(vID, vMaterialList);

    vSum := 0;
    vSumMaterial := 0;
  end;

  Result :=
    GetOrderLIstParams(
      IntToStr(vID), vAddTime,  vOrderNum, vOrderDate, vOrderType,
      vIDSourceType, vIDStatusType, vIDPaymentForm, vIDSignalType, vIDReason,
      vNeedCallDate, vStatusComment, vPayed, vCheckNumber, vOrderNumberExt, vPersonalAccount,
      vIDClient, vPhone, vName, vAddress, vFlatNumber, vIDDistrict, vIDMetro,
      vClientDOMSPB, vClientComment, vRequestText,
      vClientDateTime, vWorkDate, vWorkTime, vPLanTime, vIDWorker,
      vWorkList, vMaterialList, vSum, vSumMaterial,
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
      FieldByName('OrderNumberExt').AsString := vOrderNumberExt;
      FieldByName('PersonalAccount').AsString := vPersonalAccount;

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

      //теперь лид или не лид решается только на основе присвоения статуса по ТЗ от 13.03.2023 п.14
{      if (FieldByName('ID_Worker').AsInteger <> 0) and (FieldByName('ID_Client').AsInteger <> 0) then
        FieldByName('OrderCategory').AsInteger := 1
      else
        FieldByName('OrderCategory').AsInteger := 0;}

      FieldByName('WorkCost').AsFloat := vSum;
      FieldByName('MaterialCost').AsFloat := vSumMaterial;
      FieldByName('FullCost').AsFloat := vSum + vSumMaterial;

      if IsNull(Datas.ReadValues('StatusType', 'FinStatus', vIDStatusType)[0], 0) = 1 then FieldByName('Closed').AsInteger := 1
      else FieldByName('Closed').AsInteger := 0;

      FieldByName('ID_DiscountPromo').Value := NullIfZero(vIDDiscountTypePromo);

      Post;
      Close;

      SaveWorkList(vID, vWorkList);
      SaveMaterialList(vID, vMaterialList);

      Query.Refresh;

      Query.Locate('ID', vID, []);

{      if (vOldOrderCategory = 0) and (Query.FieldByName('OrderCategory').AsInteger = 1) then AppendScheduleOrder(vID)
      else
        if (vOldOrderCategory = 1) and (Query.FieldByName('OrderCategory').AsInteger = 0) then DeleteScheduleOrder(vID);}

      //обновляем в шедулере
//      UpdateScheduleOrder(vID);
    end;
  end;

  vWorkList.Free;

  SetEnabledButtons;
end;

end.
