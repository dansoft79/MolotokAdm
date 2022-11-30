//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор типа транспортного средства
//
//------------------------------------------------------------------------------
unit UReminder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  DB, ADODB, DBCtrls,
  Grids, DBGrids, DBGridEh, PropStorageEh, PropFilerEh, GridsEh,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, Menus,
  cxLookAndFeelPainters, cxButtons, ActnList, dxBar, dxStatusBar, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZStoredProcedure, cxPC, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems,
  cxCheckBox, cxPropertiesStore, cxLookAndFeels, cxPCdxBarPopupMenu,
  System.Actions;

type
  TRemiderForm = class(TForm)
    dsReminderClient: TDataSource;
    ActionList: TActionList;
    BarManager: TdxBarManager;
    aCancel: TAction;
    dxBarButton4: TdxBarButton;
    StatusBar: TdxStatusBar;
    dsReminderCarrier: TDataSource;
    qReminderClient: TZQuery;
    qReminderCarrier: TZQuery;
    PageControl: TcxPageControl;
    tsClient: TcxTabSheet;
    tsCarrier: TcxTabSheet;
    DBGridClient: TcxGrid;
    TableViewClient: TcxGridDBTableView;
    GridLevelClient: TcxGridLevel;
    qReminderClientID: TIntegerField;
    qReminderClientComment: TWideStringField;
    qReminderClientCargoName: TWideStringField;
    qReminderClientCLIName: TWideStringField;
    qReminderClientRInfo: TWideStringField;
    qReminderClientCARName: TWideStringField;
    qReminderClientTInfo: TWideStringField;
    qReminderClientTRInfo: TWideStringField;
    qReminderClientDInfo: TWideStringField;
    TableViewClientComment: TcxGridDBColumn;
    TableViewClientCLIName: TcxGridDBColumn;
    TableViewClientRInfo: TcxGridDBColumn;
    TableViewClientCargoName: TcxGridDBColumn;
    TableViewClientCARName: TcxGridDBColumn;
    TableViewClientTInfo: TcxGridDBColumn;
    TableViewClientTRInfo: TcxGridDBColumn;
    TableViewClientDInfo: TcxGridDBColumn;
    cbMode: TdxBarCombo;
    DBGridCarrier: TcxGrid;
    TableViewCarrier: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    GridLevelCarrier: TcxGridLevel;
    qReminderCarrierID: TIntegerField;
    qReminderCarrierComment: TWideStringField;
    qReminderCarrierCLIName: TWideStringField;
    qReminderCarrierRInfo: TWideStringField;
    qReminderCarrierCargoName: TWideStringField;
    qReminderCarrierCARName: TWideStringField;
    qReminderCarrierTInfo: TWideStringField;
    qReminderCarrierTRInfo: TWideStringField;
    qReminderCarrierDInfo: TWideStringField;
    qReminderClientFromDate: TDateTimeField;
    qReminderClientToDate: TDateTimeField;
    qReminderClientEInfo: TWideStringField;
    qReminderCarrierFromDate: TDateTimeField;
    qReminderCarrierToDate: TDateTimeField;
    qReminderCarrierEInfo: TWideStringField;
    GridClient: TcxGridPopupMenu;
    GridCarrier: TcxGridPopupMenu;
    qReminderClientID_Request: TIntegerField;
    qReminderCarrierID_Request: TIntegerField;
    TableViewClientFromDate: TcxGridDBColumn;
    TableViewClientToDate: TcxGridDBColumn;
    TableViewClientEInfo: TcxGridDBColumn;
    TableViewCarrierFromDate: TcxGridDBColumn;
    TableViewCarrierToDate: TcxGridDBColumn;
    TableViewCarrierEInfo: TcxGridDBColumn;
    qReminderClientInvoicePayDateClient: TDateTimeField;
    qReminderClientInvoicePayNumClient: TWideStringField;
    qReminderClientInvoicePayCliSend: TDateTimeField;
    qReminderClientInvoicePayCliReceive: TDateTimeField;
    qReminderClientCost: TFloatField;
    qReminderClientPaySum: TFloatField;
    qReminderCarrierInvoicePayDateCarrier: TDateTimeField;
    qReminderCarrierInvoicePayNumCarrier: TWideStringField;
    qReminderCarrierInvoicePayCarSend: TDateTimeField;
    qReminderCarrierInvoicePayCarReceive: TDateTimeField;
    qReminderCarrierCost: TFloatField;
    qReminderCarrierPaySum: TFloatField;
    TableViewClientInvoicePayDateClient: TcxGridDBColumn;
    TableViewClientInvoicePayNumClient: TcxGridDBColumn;
    TableViewClientInvoicePayCliSend: TcxGridDBColumn;
    TableViewClientInvoicePayCliReceive: TcxGridDBColumn;
    TableViewClientCost: TcxGridDBColumn;
    TableViewClientPaySum: TcxGridDBColumn;
    TableViewCarrierInvoicePayDateCarrier: TcxGridDBColumn;
    TableViewCarrierInvoicePayNumCarrier: TcxGridDBColumn;
    TableViewCarrierInvoicePayCarSend: TcxGridDBColumn;
    TableViewCarrierInvoicePayCarReceive: TcxGridDBColumn;
    TableViewCarrierCost: TcxGridDBColumn;
    TableViewCarrierPaySum: TcxGridDBColumn;
    eFrom: TdxBarDateCombo;
    eTo: TdxBarDateCombo;
    bUpdate: TdxBarButton;
    aUpdate: TAction;
    qReminderClientNumber: TIntegerField;
    qReminderCarrierNumber: TIntegerField;
    qReminderClientRealized: TSmallintField;
    qReminderClientRealizeDate: TDateTimeField;
    qReminderCarrierRealized: TSmallintField;
    qReminderCarrierRealizeDate: TDateTimeField;
    TableViewClientNumber: TcxGridDBColumn;
    TableViewClientRealized: TcxGridDBColumn;
    TableViewClientRealizeDate: TcxGridDBColumn;
    TableViewCarrierNumber: TcxGridDBColumn;
    TableViewCarrierRealized: TcxGridDBColumn;
    TableViewCarrierRealizeDate: TcxGridDBColumn;
    aDetail: TAction;
    dxBarButton1: TdxBarButton;
    TableViewClientID: TcxGridDBColumn;
    TableViewClientID_Request: TcxGridDBColumn;
    TableViewCarrierID: TcxGridDBColumn;
    TableViewCarrierID_Request: TcxGridDBColumn;
    qReminderClientContractnumClient: TIntegerField;
    qReminderClientContractDateClient: TDateTimeField;
    qReminderClientOrgInfo: TWideStringField;
    qReminderCarrierContractnumCarrier: TIntegerField;
    qReminderCarrierContractDateCarrier: TDateTimeField;
    qReminderCarrierOrgInfo: TWideStringField;
    TableViewClientContractnumClient: TcxGridDBColumn;
    TableViewClientContractDateClient: TcxGridDBColumn;
    TableViewClientOrgInfo: TcxGridDBColumn;
    TableViewCarrierContractnumCarrier: TcxGridDBColumn;
    TableViewCarrierContractDateCarrier: TcxGridDBColumn;
    TableViewCarrierOrgInfo: TcxGridDBColumn;
    PropertiesStore: TcxPropertiesStore;
    qReminderClientDocReady: TSmallintField;
    qReminderClientDocReadyDate: TDateTimeField;
    qReminderClientReturnBase: TWideStringField;
    qReminderClientReturnTime: TDateTimeField;
    qReminderCarrierDocReady: TSmallintField;
    qReminderCarrierDocReadyDate: TDateTimeField;
    qReminderCarrierReturnBase: TWideStringField;
    qReminderCarrierReturnTime: TDateTimeField;
    TableViewClientDocReady: TcxGridDBColumn;
    TableViewClientDocReadyDate: TcxGridDBColumn;
    TableViewClientReturnBase: TcxGridDBColumn;
    TableViewClientReturnTime: TcxGridDBColumn;
    TableViewCarrierDocReady: TcxGridDBColumn;
    TableViewCarrierDocReadyDate: TcxGridDBColumn;
    TableViewCarrierReturnBase: TcxGridDBColumn;
    TableViewCarrierReturnTime: TcxGridDBColumn;
    aPrint: TAction;
    dxBarButton2: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure TableViewClientCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TableViewCarrierCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aUpdateExecute(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aDetailExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateDatas;
  end;

procedure BrowseReminding(AParentAction : TAction);

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils, UWaiting, UConsts,
  mesdlg, UCarriageDetail;

procedure BrowseReminding(AParentAction : TAction);
  var
    vForm : TRemiderForm;
begin
  vForm := TRemiderForm.Create(Application);
  with vForm do
  begin
    Tag := MaxMDITag(ClassType) + 1;
    Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);

    UpdateDatas;

    Show;
  end;
end;

procedure TRemiderForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TRemiderForm.aDetailExecute(Sender: TObject);
  var
    vIDCA, vIDR : integer;
begin
  vIDCA := 0;
  vIDR := 0;

  if PageControl.ActivePageIndex = 0 then
  begin
    with TableViewClient.Controller do
      if Assigned(FocusedRecord) and FocusedRecord.IsData and not FocusedRow.IsFilterRow then
      begin
        vIDCA := FocusedRecord.Values[TableViewClientID.Index];
        vIDR := FocusedRecord.Values[TableViewClientID_Request.Index];
      end
  end
  else
  begin
    with TableViewCarrier.Controller do
      if Assigned(FocusedRecord) and FocusedRecord.IsData and not FocusedRow.IsFilterRow then
      begin
        vIDCA := FocusedRecord.Values[TableViewCarrierID.Index];
        vIDR := FocusedRecord.Values[TableViewCarrierID_Request.Index];
      end
  end;
  if vIDCA = 0 then ShowMsg('На текущей вкладке не выбрана перевозка!', smtInformation, [smbOK], smbOK, smbOK)
  else ShowCarriageDetail(vIDR, vIDCA);
end;

procedure TRemiderForm.aPrintExecute(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
  0 : PrintGuideGridDX(Caption, DBGridClient);
  1 : PrintGuideGridDX(Caption, DBGridCarrier);
  end;
end;

procedure TRemiderForm.aUpdateExecute(Sender: TObject);
begin
  UpdateDatas;
end;

procedure TRemiderForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TRemiderForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableViewClient.StoreToIniFile(cIniFileName, false);
  TableViewCarrier.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TRemiderForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableViewClient.RestoreFromIniFile(cIniFileName);
  TableViewCarrier.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TRemiderForm.TableViewCarrierCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  var
    vIDR, vIDCA : integer;
begin
  if Assigned(TableViewCarrier.Controller.FocusedRecord) and TableViewCarrier.Controller.FocusedRecord.IsData then
  begin
    vIDR := qReminderCarrier.FieldByName('ID_Request').AsInteger;
    vIDCA := qReminderCarrier.FieldByName('ID').AsInteger;

    if MainForm.Query.Locate('IDR', vIDR, []) then
    begin
      MainFOrm.DetailTimer.Enabled := false;
      MainFOrm.DetailTimer.OnTimer(MainForm.DetailTimer);
      if not MainForm.qCarriage.Locate('ID', vIDCA, []) then
        ShowMsg('Текйщая настройка фильтров по перевозкам не позволяет найти нужную перевозку!'#13#10 +
                'Необходимо сбросить все фильтры по перевозкам.', smtInformation, [smbOK], smbOK, smbOK);
    end
    else
      ShowMsg('Текйщая настройка фильтров по грузам не позволяет найти нужный груз!'#13#10 +
              'Необходимо сбросить все фильтры по грузам.', smtInformation, [smbOK], smbOK, smbOK);
  end;
end;

procedure TRemiderForm.TableViewClientCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
  var
    vIDR, vIDCA : integer;
begin
  if Assigned(TableViewClient.Controller.FocusedRecord) and TableViewClient.Controller.FocusedRecord.IsData then
  begin
    vIDR := qReminderClient.FieldByName('ID_Request').AsInteger;
    vIDCA := qReminderClient.FieldByName('ID').AsInteger;

    if MainForm.Query.Locate('IDR', vIDR, []) then
    begin
      MainFOrm.DetailTimer.Enabled := false;
      MainFOrm.DetailTimer.OnTimer(MainFOrm.DetailTimer);
      if not MainForm.qCarriage.Locate('ID', vIDCA, []) then
        ShowMsg('Текйщая настройка фильтров по перевозкам не позволяет найти нужную перевозку!'#13#10 +
                'Необходимо сбросить все фильтры по перевозкам.', smtInformation, [smbOK], smbOK, smbOK);
    end
    else
      ShowMsg('Текйщая настройка фильтров по грузам не позволяет найти нужный груз!'#13#10 +
              'Необходимо сбросить все фильтры по грузам.', smtInformation, [smbOK], smbOK, smbOK);
  end;
end;

procedure TRemiderForm.UpdateDatas;
begin
  if PageControl.ActivePageIndex = 0 then
  begin
    ShowWaiting(cDataGetting);
    try
      qReminderClient.Close;
      qReminderClient.ParamByname('IDEmployee').AsInteger := EmployeeID;
      qReminderClient.ParamByname('rem').AsInteger := cbMode.ItemIndex;
      if IsDate(eFrom.Text) then
        qReminderClient.ParamByname('FD').AsString := DateToSQLDate(eFrom.Date)
      else
        qReminderClient.ParamByname('FD').AsString := '';
      if IsDate(eTo.Text) then
        qReminderClient.ParamByname('TD').AsString := DateToSQLDate(eTo.Date)
      else
        qReminderClient.ParamByname('TD').AsString := '';
      qReminderClient.Open;
    finally
      HideWaiting;
    end;
  end
  else
  begin
    ShowWaiting(cDataGetting);
    try
      qReminderCarrier.Close;
      qReminderCarrier.ParamByname('IDEmployee').AsInteger := EmployeeID;
      qReminderCarrier.ParamByname('rem').AsInteger := cbMode.ItemIndex;
      if IsDate(eFrom.Text) then
        qReminderCarrier.ParamByname('FD').AsString := DateToSQLDate(eFrom.Date)
      else
        qReminderCarrier.ParamByname('FD').AsString := '';
      if IsDate(eTo.Text) then
        qReminderCarrier.ParamByname('TD').AsString := DateToSQLDate(eTo.Date)
      else
        qReminderCarrier.ParamByname('TD').AsString := '';
      qReminderCarrier.Open;
    finally
      HideWaiting;
    end;
  end;
end;

procedure TRemiderForm.FormShow(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
end;

end.
