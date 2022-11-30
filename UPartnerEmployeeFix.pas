//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Мастер привязки контрагентов и сотрудников 
//
//------------------------------------------------------------------------------
unit UPartnerEmployeeFix;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  Grids, DB,
  ADODB, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxSplitter, cxContainer,
  cxGroupBox, Menus, cxLookAndFeelPainters, cxButtons, dxBar, cxPropertiesStore,
  ActnList, dxStatusBar, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter, cxCheckBox, cxLookAndFeels,
  System.Actions, cxNavigator, dxDateRanges;

type
  TPartnerFixForm = class(TForm)
    dsQueryEmployee: TDataSource;
    dsPartner: TDataSource;
    pRight: TPanel;
    gbEmployee: TcxGroupBox;
    dsEmployee: TDataSource;
    pLeft: TPanel;
    gbPartner: TcxGroupBox;
    gbManagerList: TcxGroupBox;
    gbPartnerList: TcxGroupBox;
    dsQueryPartner: TDataSource;
    DBGridPartner: TcxGrid;
    DBGridPartnerDBTableView: TcxGridDBTableView;
    DBGridPartnerLevel: TcxGridLevel;
    DBGridPartnerDBTableViewName: TcxGridDBColumn;
    DBGridPartnerDBTableViewShortName: TcxGridDBColumn;
    DBGridPartnerDBTableViewAddress: TcxGridDBColumn;
    DBGridPartnerDBTableViewPhone: TcxGridDBColumn;
    DBGridPartnerDBTableViewCPerson: TcxGridDBColumn;
    DBGridEmployee: TcxGrid;
    DBGridEmployeeDBTableView: TcxGridDBTableView;
    DBGridEmployeeLevel: TcxGridLevel;
    DBGridEmployeeDBTableViewName: TcxGridDBColumn;
    DBGridEmployeeDBTableViewESurname: TcxGridDBColumn;
    DBGridEmployeeDBTableViewEName: TcxGridDBColumn;
    DBGridEmployeeDBTableViewEPatro: TcxGridDBColumn;
    SplitterLeft: TcxSplitter;
    Splitter1: TcxSplitter;
    Splitter: TcxSplitter;
    BarManager: TdxBarManager;
    ActionList: TActionList;
    aAddNE: TAction;
    aAddE: TAction;
    aCancel: TAction;
    PropertiesStore: TcxPropertiesStore;
    StatusBar: TdxStatusBar;
    dxBarButton: TdxBarButton;
    aDeleteE: TAction;
    aClearE: TAction;
    aAddNC: TAction;
    aAddC: TAction;
    aDeleteC: TAction;
    aClearC: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    GridFixE: TcxGrid;
    TableViewSnapEmployee: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    GridFixP: TcxGrid;
    TableViewSnapPartner: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    dxBarDockControl2: TdxBarDockControl;
    qPartner: TZQuery;
    qPartnerName: TWideStringField;
    qPartnerShortName: TWideStringField;
    qPartnerAddress: TWideStringField;
    qPartnerPhone: TWideStringField;
    qPartnerCPerson: TWideStringField;
    qEmployee: TZQuery;
    qEmployeeName: TWideStringField;
    qEmployeeESurname: TWideStringField;
    qEmployeeEName: TWideStringField;
    qEmployeeEPatro: TWideStringField;
    QueryEmployee: TZQuery;
    QueryEmployeeName: TWideStringField;
    QueryEmployeeESurname: TWideStringField;
    QueryEmployeeEName: TWideStringField;
    QueryEmployeeEPatro: TWideStringField;
    qClearE: TZQuery;
    Table: TZQuery;
    QueryPartner: TZQuery;
    QueryPartnerName: TWideStringField;
    QueryPartnerShortName: TWideStringField;
    QueryPartnerAddress: TWideStringField;
    QueryPartnerPhone: TWideStringField;
    QueryPartnerCPerson: TWideStringField;
    qClearC: TZQuery;
    qPartnerID: TIntegerField;
    qEmployeeID: TSmallintField;
    QueryEmployeeID: TIntegerField;
    QueryEmployeeID_Partner: TIntegerField;
    QueryEmployeeID_Employee: TSmallintField;
    QueryPartnerID_Partner: TIntegerField;
    QueryPartnerID_Employee: TSmallintField;
    QueryPartnerID: TIntegerField;
    DBGridEmployeeDBTableViewID: TcxGridDBColumn;
    DBGridPartnerDBTableViewID: TcxGridDBColumn;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    aCopyEmployee: TAction;
    aCopyPartner: TAction;
    qEmployeeFrom: TZQuery;
    StringField1: TWideStringField;
    StringField2: TWideStringField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    SmallintField1: TSmallintField;
    qPartnerFrom: TZQuery;
    StringField5: TWideStringField;
    StringField6: TWideStringField;
    StringField7: TWideStringField;
    StringField8: TWideStringField;
    StringField9: TWideStringField;
    IntegerField3: TIntegerField;
    SmallintField2: TSmallintField;
    IntegerField4: TIntegerField;
    qPartnerIsCarrier: TSmallintField;
    qPartnerIsClient: TSmallintField;
    qPartnerIsBuyer: TSmallintField;
    qPartnerIsSeller: TSmallintField;
    DBGridPartnerDBTableViewIsCarrier: TcxGridDBColumn;
    DBGridPartnerDBTableViewIsClient: TcxGridDBColumn;
    DBGridPartnerDBTableViewIsBuyer: TcxGridDBColumn;
    DBGridPartnerDBTableViewIsSeller: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure QueryEmployeeAfterScroll(DataSet: TDataSet);
    procedure qPartnerAfterScroll(DataSet: TDataSet);
    procedure qEmployeeAfterScroll(DataSet: TDataSet);
    procedure DBGridPartnerDblClick(Sender: TObject);
    procedure DBGridEmployee1DblClick(Sender: TObject);
    procedure GridFixEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridFixEKeyPress(Sender: TObject; var Key: Char);
    procedure QueryEmployeeAfterOpen(DataSet: TDataSet);
    procedure QueryPartnerAfterOpen(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aAddNEExecute(Sender: TObject);
    procedure aAddEExecute(Sender: TObject);
    procedure aDeleteEExecute(Sender: TObject);
    procedure aClearEExecute(Sender: TObject);
    procedure aAddNCExecute(Sender: TObject);
    procedure aAddCExecute(Sender: TObject);
    procedure aDeleteCExecute(Sender: TObject);
    procedure aClearCExecute(Sender: TObject);
    procedure TableViewSnapPartnerEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure TableViewSnapPartnerEditKeyPress(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridPartnerDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DBGridEmployeeDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableViewSnapEmployeeFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableViewSnapPartnerFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableViewSnapEmployeeEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure TableViewSnapEmployeeEditKeyPress(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
    procedure aCopyEmployeeExecute(Sender: TObject);
    procedure aCopyPartnerExecute(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
  public
    { Public declarations }
    procedure SetEnabledButtons;
    //привязки сотрудников
    function AddNEFixDialog : boolean;
    function AddEFix(var IDFix : integer) : boolean;
    function DeleteEFixDialog : boolean;
    function ClearEFixDialog : boolean;
    //привязки
    function AddNCFixDialog : boolean;
    function AddCFix(var IDFix : integer) : boolean;
    function DeleteCFixDialog : boolean;
    function ClearCFixDialog : boolean;
  end;

procedure ShowPartnerEmployeeFix(AParentAction : TAction; AIDPartner : integer = 0; AIDEmployee : integer = 0);

implementation

{$R *.dfm}

uses
  UDatas, UOptions, UUtil, DTKUtils, UWaiting,
  MainUnit, mesdlg, UProgress, UConsts, USelectPartner, USelectEmployee;

procedure ShowPartnerEmployeeFix(AParentAction : TAction; AIDPartner : integer = 0; AIDEmployee : integer = 0);
  var
    vForm : TPartnerFixForm;
begin
  vForm := TPartnerFixForm.Create(nil);
  with vForm do
    begin
      qEmployee.Open;
      qEmployee.Locate('ID', AIDEmployee, []);
      Table.Open;
      QueryPartner.Open;
      QueryEmployee.Open;
      qPartner.Open;
      qPartner.Locate('ID', AIDPartner, []);

      Tag := MaxMDITag(ClassType) + 1;
      Caption := Format('%s-%d', [Caption, Tag]);
      Name := Name + IntToStr(Tag);

      RegisterFloatingForm(vForm, AParentAction, Caption);

      Show;
    end;
end;

procedure TPartnerFixForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);

  DBGridPartnerDBTableView.StoreToIniFile(cIniFileName, false);
  DBGridEmployeeDBTableView.StoreToIniFile(cIniFileName, false);
  TableViewSnapPartner.StoreToIniFile(cIniFileName, false);
  TableViewSnapEmployee.StoreToIniFile(cIniFileName, false);

  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TPartnerFixForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  DBGridPartnerDBTableView.RestoreFromIniFile(cIniFileName);
  DBGridEmployeeDBTableView.RestoreFromIniFile(cIniFileName);
  TableViewSnapPartner.RestoreFromIniFile(cIniFileName);
  TableViewSnapEmployee.RestoreFromIniFile(cIniFileName);

  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TPartnerFixForm.SetEnabledButtons;
  var
    bp, ce, ep, bc, ec : boolean;
begin
  ce := CanEditInActionByAction(MainForm.aaPartnerEmployeeFix);

  bp := qPartner.Active and (qPartner.RecordCount > 0);
  ep := not QueryEmployee.IsEmpty;

  bc := qEmployee.Active and (qEmployee.RecordCount > 0);
  ec := not QueryPartner.IsEmpty;

  aAddNE.Enabled := ce and bp and bc;
  aAddE.Enabled := ce and bp and bc;
  aDeleteE.Enabled := ep and ce;
  aClearE.Enabled := ep and ce;
  aCopyEmployee.Enabled := ce and bp and bc;

  aAddNC.Enabled := ce and bc and bp;
  aAddC.Enabled := ce and bc and bp;
  aDeleteC.Enabled := ec and ce;
  aClearC.Enabled := ec and ce;
  aCopyPartner.Enabled := ce and bc and bp;  
end;

function TPartnerFixForm.DeleteEFixDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := QueryEmployee.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDeleteRecord, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
    if DeleteRec('PartnerFix', vID) then
    begin
      vRecNo := QueryEmployee.RecNo;

      Table.Close;
      Table.Open;

      QueryEmployee.Close;
      QueryEmployee.Open;

      if QueryEmployee.RecordCount > 1 then
        QueryEmployee.RecNo := vRecNo;

      QueryPartner.Close;
      QueryPartner.Open;              
    end;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.QueryEmployeeAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TPartnerFixForm.qPartnerAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

function TPartnerFixForm.AddNEFixDialog: boolean;
  var
    vIDEmployee : integer;
    vRecNo, i : integer;
begin
  Result := false;
  if DBGridEmployeeDBTableView.Controller.SelectedRecordCount = 0 then
  begin
    ShowMsg('Нет выделенных сотрудников!', smtInformation, [smbOK], smbOK, smbOK);
    Exit;
  end;
  ShowProgress(cDataSaving);
  vRecNo := qEmployee.RecNo;

  for i := 0 to DBGridEmployeeDBTableView.Controller.SelectedRecordCount - 1 do
  begin
    ChangeProgress(i / DBGridEmployeeDBTableView.Controller.SelectedRecordCount * 100, '');
    if DBGridEmployeeDBTableView.Controller.SelectedRecords[i].IsData then
    begin
      vIDEmployee := IsNull(DBGridEmployeeDBTableView.Controller.SelectedRecords[i].Values[DBGridEmployeeDBTableViewID.Index], 0);
      if not QueryEmployee.Locate('ID_Employee', vIDEmployee, []) then
        with Table do
        begin
          Append;
          FieldByName('ID_Partner').AsInteger := qPartner.FieldByname('ID').AsInteger;
          FieldByName('ID_Employee').AsInteger := vIDEmployee;
          Post;
        end;
    end;
  end;
  ChangeProgress(100);
  qEmployee.RecNo := vRecNo;

  QueryPartner.Close;
  QueryPartner.Open;
  QueryEmployee.Close;
  QueryEmployee.Open;

  HideProgress;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aDeleteCExecute(Sender: TObject);
begin
  FModified := DeleteCFixDialog or FModified;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aDeleteEExecute(Sender: TObject);
begin
  FModified := DeleteEFixDialog or FModified;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.qEmployeeAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

function TPartnerFixForm.AddEFix(var IDFix: integer): boolean;
  var
    vIDEmployee : integer;
    vIDPartner : integer;
begin
  Result := false;
  vIDEmployee := qEmployee.FieldByName('ID').AsInteger;
  vIDPartner := qPartner.FieldByName('ID').AsInteger;
  with Table do
    if QueryEmployee.Locate('ID_Employee', vIDEmployee, []) then ShowMsg('Сотрудник уже привязан к котрагенту', smtInformation, [smbOK], smbOK, smbOK)
    else
    begin
      Append;
      FieldByName('ID_Partner').AsInteger := vIDPartner;
      FieldByName('ID_Employee').AsInteger := vIDEmployee;
      Post;
      IDFix := FieldByName('ID').AsInteger;

      QueryEmployee.Close;
      QueryEmployee.Open;

      QueryEmployee.Locate('ID', IDFix, []);

      QueryPartner.Close;
      QueryPartner.Open;

      Result := true;
    end;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.DBGridPartnerDblClick(Sender: TObject);
  var
    vID : integer;
begin
  if aAddE.Enabled then
  begin
    FModified := AddEFix(vID) or FModified;
    SetEnabledButtons;
  end;
end;

procedure TPartnerFixForm.DBGridPartnerDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TPartnerFixForm.DBGridEmployee1DblClick(Sender: TObject);
  var
    vID : integer;
begin
  if aAddC.Enabled then
  begin
    FModified := AddCFix(vID) or FModified;
    SetEnabledButtons;
  end;
end;

procedure TPartnerFixForm.DBGridEmployeeDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TPartnerFixForm.GridFixEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAddE.Enabled then aAddE.Execute;
  46 : if aDeleteE.Enabled then aDeleteE.Execute;
  end;
end;

procedure TPartnerFixForm.GridFixEKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAddE.Enabled then aAddE.Execute;
  '-' : if aDeleteE.Enabled then aDeleteE.Execute;
  end;
end;

function TPartnerFixForm.ClearEFixDialog: boolean;
begin
  Result := ShowMsg('Действительно убрать все записи?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;
  if Result then
  begin
    qClearE.ParamByName('ID').Value := qPartner.FieldByName('ID').AsInteger;
    qClearE.ExecSQL;
    QueryEmployee.Close;
    QueryEmployee.Open;

    QueryPartner.Close;
    QueryPartner.Open;
  end;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.TableViewSnapEmployeeEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  case Key of
  45 : if aAddE.Enabled then aAddE.Execute;
  46 : if aDeleteE.Enabled then aDeleteE.Execute;
  end;
end;

procedure TPartnerFixForm.TableViewSnapEmployeeEditKeyPress(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
  case Key of
  '+' : if aAddE.Enabled then aAddE.Execute;
  '-' : if aDeleteE.Enabled then aDeleteE.Execute;
  end;
end;

procedure TPartnerFixForm.TableViewSnapEmployeeFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TPartnerFixForm.TableViewSnapPartnerEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  case Key of
  45 : if aAddC.Enabled then aAddC.Execute;
  46 : if aDeleteC.Enabled then aDeleteC.Execute;
  end;
end;

procedure TPartnerFixForm.TableViewSnapPartnerEditKeyPress(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
  case Key of
  '+' : if aAddC.Enabled then aAddC.Execute;
  '-' : if aDeleteC.Enabled then aDeleteC.Execute;
  end;
end;

procedure TPartnerFixForm.TableViewSnapPartnerFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TPartnerFixForm.QueryEmployeeAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TPartnerFixForm.QueryPartnerAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

function TPartnerFixForm.AddNCFixDialog: boolean;
  var
    vIDPartner : integer;
    vRecNo, i : integer;
begin
  Result := false;
  if DBGridPartnerDBTableView.Controller.SelectedRecordCount = 0 then
  begin
    ShowMsg('Нет выделенных контрагентов!', smtInformation, [smbOK], smbOK, smbOK);
    Exit;
  end;
  ShowProgress(cDataSaving);
  vRecNo := qPartner.RecNo;

  for i := 0 to DBGridPartnerDBTableView.Controller.SelectedRecordCount - 1 do
  begin
    ChangeProgress(i / DBGridPartnerDBTableView.Controller.SelectedRecordCount * 100, '');

    if DBGridPartnerDBTableView.Controller.SelectedRecords[i].IsData then
    begin
      vIDPartner := IsNull(DBGridPartnerDBTableView.Controller.SelectedRecords[i].Values[DBGridPartnerDBTableViewID.Index], 0);

      if not QueryPartner.Locate('ID_Partner', vIDPartner, []) then
        with Table do
        begin
          Append;
          FieldByName('ID_Partner').AsInteger := vIDPartner;
          FieldByName('ID_Employee').AsInteger := qEmployee.FieldByname('ID').AsInteger;
          Post;
        end;
    end;
  end;
  ChangeProgress(100);
  qPartner.RecNo := vRecNo;

  QueryPartner.Close;
  QueryPartner.Open;

  QueryEmployee.Close;
  QueryEmployee.Open;
  
  HideProgress;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aAddCExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddCFix(vID) or FModified;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aAddEExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddEFix(vID) or FModified;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aAddNCExecute(Sender: TObject);
begin
  FModified := AddNCFixDialog or FModified;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aAddNEExecute(Sender: TObject);
begin
  FModified := AddNEFixDialog or FModified;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TPartnerFixForm.aClearCExecute(Sender: TObject);
begin
  FModified := ClearCFixDialog or FModified;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aClearEExecute(Sender: TObject);
begin
  FModified := ClearEFixDialog or FModified;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.aCopyEmployeeExecute(Sender: TObject);
  var
    vIDP, vIDE : integer;
begin
  vIDP := 0;
  if SelectPartner(vIDP, ptAll, asActive) then
  begin
    ShowWaiting(cDataProcessing);
    try
      Table.Close;
      Table.Open;
      qEmployeeFrom.Close;
      qEmployeeFrom.ParamByName('ID').AsInteger := vIDP;      
      qEmployeeFrom.Open;
      vIDP := qPartner.FieldByName('ID').AsInteger;
      qEmployeeFrom.First;
      while not qEmployeeFrom.eof do
      begin
        vIDE := qEmployeeFrom.FieldByName('ID_Employee').AsInteger;
        if not Table.Locate('ID_Partner;ID_Employee', VarArrayOf([vIDP, vIDE]), []) then
        begin
          Table.Append;
          Table.FieldByName('ID_Partner').AsInteger := vIDP;
          Table.FieldByName('ID_Employee').AsInteger := vIDE;
          Table.Post;
        end;
        qEmployeeFrom.Next;
      end;
      qEmployeeFrom.Close;
      
      QueryEmployee.Close;
      QueryEmployee.Open;

      QueryPartner.Close;
      QueryPartner.Open;
    finally
      HideWaiting;
    end;
  end;
end;

procedure TPartnerFixForm.aCopyPartnerExecute(Sender: TObject);
  var
    vIDP, vIDE : integer;
begin
  vIDE := 0;                                              
  if SelectEmployee(vIDE) then
  begin
    ShowWaiting(cDataProcessing);
    try
      Table.Close;
      Table.Open;
      qPartnerFrom.ParamByName('ID').AsInteger := vIDE;
      qPartnerFrom.Close;
      vIDE := qEmployee.FieldByName('ID').AsInteger;      
      qPartnerFrom.Open;
      qPartnerFrom.First;
      while not qPartnerFrom.eof do
      begin
        vIDP := qPartnerFrom.FieldByName('ID_Partner').AsInteger;
        if not Table.Locate('ID_Partner;ID_Employee', VarArrayOf([vIDP, vIDE]), []) then
        begin
          Table.Append;
          Table.FieldByName('ID_Partner').AsInteger := vIDP;
          Table.FieldByName('ID_Employee').AsInteger := vIDE;
          Table.Post;
        end;
        qPartnerFrom.Next;
      end;
      qPartnerFrom.Close;

      QueryPartner.Close;
      QueryPartner.Open;

      QueryEmployee.Close;
      QueryEmployee.Open;      
    finally
      HideWaiting;
    end;
  end;
end;

function TPartnerFixForm.AddCFix(var IDFix: integer): boolean;
  var
    vIDEmployee : integer;
    vIDPartner : integer;
begin
  Result := false;
  vIDEmployee := qEmployee.FieldByName('ID').AsInteger;
  vIDPartner := qPartner.FieldByName('ID').AsInteger;
  with Table do
    if QueryPartner.Locate('ID_Partner', vIDPartner, []) then ShowMsg('Контрагент уже привязан к сотруднику', smtInformation, [smbOK], smbOK, smbOK)
    else
    begin
      Append;
      FieldByName('ID_Partner').AsInteger := vIDPartner;
      FieldByName('ID_Employee').AsInteger := vIDEmployee;
      Post;
      IDFix := FieldByName('ID').AsInteger;
      QueryPartner.Close;
      QueryPartner.Open;
      QueryPartner.Locate('ID', IDFix, []);

      QueryEmployee.Close;
      QueryEmployee.Open;
      Result := true;
    end;
  SetEnabledButtons;
end;

function TPartnerFixForm.DeleteCFixDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := QueryPartner.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDeleteRecord, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
    if DeleteRec('PartnerFix', vID) then
    begin
      vRecNo := QueryPartner.RecNo;
      Table.Close;
      Table.Open;
      QueryPartner.Close;
      QueryPartner.Open;

      if QueryPartner.RecordCount > 1 then
        QueryPartner.RecNo := vRecNo;

      QueryEmployee.Close;
      QueryEmployee.Open;
    end;
  SetEnabledButtons;
end;

function TPartnerFixForm.ClearCFixDialog: boolean;
begin
  Result := ShowMsg('Действительно убрать все записи?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;
  if Result then
  begin
    qClearC.ParamByName('ID').Value := qEmployee.FieldByName('ID').AsInteger;
    qClearC.ExecSQL;
    QueryPartner.Close;
    QueryPartner.Open;
    QueryEmployee.Close;
    QueryEmployee.Open;
  end;
  SetEnabledButtons;
end;

procedure TPartnerFixForm.FormResize(Sender: TObject);
begin
  pLeft.Width := ClientWidth div 2;
end;

end.
