//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Фоормы оплаты
//
//------------------------------------------------------------------------------
unit UGPaymentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
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
  PropFilerEh, PropStorageEh, dxScrollbarAnnotations;

type
  TGPaymentFormForm = class(TForm)
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
    QueryName: TWideStringField;
    Table: TZQuery;
    QueryID: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryDeleted: TSmallintField;
    QueryActive: TSmallintField;
    QueryAssertEmployee: TWideStringField;
    QueryComment: TWideStringField;
    QueryID_AssertUser: TSmallintField;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewName: TcxGridDBColumn;
    Level: TcxGridLevel;
    TableViewID: TcxGridDBColumn;
    TableViewAssertTime: TcxGridDBColumn;
    TableViewDeleted: TcxGridDBColumn;
    TableViewAssertUser: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    PopupMenu: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
    QueryDefForm: TSmallintField;
    TableViewDefForm: TcxGridDBColumn;
    QueryShowOnClient: TSmallintField;
    QueryShowOnMaster: TSmallintField;
    QueryShowClientButton: TSmallintField;
    TableViewShowOnClient: TcxGridDBColumn;
    TableViewShowOnMaster: TcxGridDBColumn;
    TableViewShowClientButton: TcxGridDBColumn;
    QueryWorkerAppPayButton: TSmallintField;
    QueryPayStatus: TSmallintField;
    QueryPayStatusInfo: TWideStringField;
    QueryWorkerButtonInfo: TWideStringField;
    TableViewPayStatusInfo: TcxGridDBColumn;
    TableViewWorkerButtonInfo: TcxGridDBColumn;
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
    procedure TableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure cbDelChange(Sender: TObject);
    procedure cbActiveChange(Sender: TObject);
    procedure aUndoDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddPaymentFormDialog(var IDPaymentForm : integer) : boolean;
    function EditPaymentFormDialog : boolean;
    function DeletePaymentFormDialog : boolean;
    function UndoDeletePaymentFormDialog : boolean;
    function ExistsPaymentForm(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowPaymentForm(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddPaymentForm(var AIDPaymentForm : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditPaymentForm(AIDPaymentForm : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeletePaymentForm(AIDPaymentForm : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGPaymentFormParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree;

function DoAction(var AIDPaymentForm : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGPaymentFormForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGPaymentFormForm) then
  begin
    with FindForm(TGPaymentFormForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGPaymentFormForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
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
        Result := AddPaymentFormDialog(AIDPaymentForm);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDPaymentForm, []);
          Result := EditPaymentFormDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDPaymentForm, []);
            Result := DeletePaymentFormDialog;
            Close;
          end;
  end;
end;

function ShowPaymentForm(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddPaymentForm(var AIDPaymentForm : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDPaymentForm, cAddAction, nil);
end;

function EditPaymentForm(AIDPaymentForm : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDPaymentForm, cEditAction, nil);
end;

function DeletePaymentForm(AIDPaymentForm : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDPaymentForm, cDeleteAction, nil);
end;

procedure TGPaymentFormForm.SetEnabledButtons;
  var
    ce, e, del : boolean;
    md, mnd : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  del := e and (Query.FieldByName('Deleted').AsINteger = 1);

  ce := CanEditInActionByAction(MainForm.agPaymentForm);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

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

procedure TGPaymentFormForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGPaymentFormForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGPaymentFormForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGPaymentFormForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGPaymentFormForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeletePaymentFormDialog or FModified;
  SetEnabledButtons;
end;

procedure TGPaymentFormForm.aEditExecute(Sender: TObject);
begin
  FModified := EditPaymentFormDialog or FModified;
  SetEnabledButtons;
end;

procedure TGPaymentFormForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGPaymentFormForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeletePaymentFormDialog or FModified;
  SetEnabledButtons;
end;

procedure TGPaymentFormForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGPaymentFormForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGPaymentFormForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGPaymentFormForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGPaymentFormForm.TableViewStylesGetContentStyle(
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

function TGPaymentFormForm.UndoDeletePaymentFormDialog: boolean;
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

procedure TGPaymentFormForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGPaymentFormForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGPaymentFormForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddPaymentFormDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGPaymentFormForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGPaymentFormForm.AddPaymentFormDialog(var IDPaymentForm: integer): boolean;
  var
    vName, vComment : string;
    vActive, vDefForm : integer;
    vShowOnClient, vShowOnMaster, vShowClientButton : integer;
    vPayStatus, vWorkerAppPayButton : integer;
begin
  vActive := 1;
  vDefForm := 0;
  vName := '';

  vShowOnClient := 0;
  vShowOnMaster := 0;
  vShowClientButton := 0;

  vComment := '';

  vPayStatus := -1;
  vWorkerAppPayButton := -1;

  Result :=
    GetPaymentFormParams(
      vActive,
      vDefForm,
      vName,
      vComment,
      vShowOnClient,
      vShowOnMaster,
      vShowClientButton,
      vPayStatus,
      vWorkerAppPayButton
      );

  if Result then
  begin
    if ExistsPaymentForm(vName, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := 0;
      Open;
      Append;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('Deleted').AsInteger := 0;
      FieldByName('DefForm').AsInteger := vDefForm;
      FieldByName('Name').AsString := vName;
      FieldByName('ShowOnClient').AsInteger := vShowOnClient;
      FieldByName('ShowOnMaster').AsInteger := vShowOnMaster;
      FieldByName('ShowClientButton').AsInteger := vShowClientButton;
      FieldByName('Comment').AsString := vComment;

      FieldByName('PayStatus').AsInteger := vPayStatus;
      FieldByName('WorkerAppPayButton').AsInteger := vWorkerAppPayButton;

      Post;
      IDPaymentForm := FieldByName('ID').AsInteger;
      Close;

      if vDefForm = 1 then
        UDatas.ExecSQL('update paymentform set defform = 0 where ID <> ' + IntToStr(IDPaymentForm));

      Query.Refresh;

      Query.Locate('ID', IDPaymentForm, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGPaymentFormForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGPaymentFormForm.DeletePaymentFormDialog: boolean;
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
  end;
  SetEnabledButtons;
end;

function TGPaymentFormForm.EditPaymentFormDialog: boolean;
  var
    vName, vComment : string;
    vActive, vDefForm, vID : integer;
    vShowOnClient, vShowOnMaster, vShowClientButton : integer;
    vPayStatus, vWorkerAppPayButton : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vDefForm := FieldByName('DefForm').AsInteger;
    vName := FieldByName('Name').AsString;
    vShowOnClient := FieldByName('ShowOnClient').AsInteger;
    vShowOnMaster := FieldByName('ShowOnMaster').AsInteger;
    vShowClientButton := FieldByName('ShowClientButton').AsInteger;
    vComment := FieldByName('Comment').AsString;

    vPayStatus := FieldByName('PayStatus').AsInteger;
    vWorkerAppPayButton := FieldByName('WorkerAppPayButton').AsInteger;

    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetPaymentFormParams(
      vActive,
      vDefForm,
      vName,
      vComment,
      vShowOnClient,
      vShowOnMaster,
      vShowClientButton,
      vPayStatus,
      vWorkerAppPayButton
      );

  if Result then
  begin
    if ExistsPaymentForm(vName, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('DefForm').AsInteger := vDefForm;
      FieldByName('Name').AsString := vName;
      FieldByName('ShowOnClient').AsInteger := vShowOnClient;
      FieldByName('ShowOnMaster').AsInteger := vShowOnMaster;
      FieldByName('ShowClientButton').AsInteger := vShowClientButton;
      FieldByName('Comment').AsString := vComment;

      FieldByName('PayStatus').AsInteger := vPayStatus;
      FieldByName('WorkerAppPayButton').AsInteger := vWorkerAppPayButton;

      Post;
      Close;

      if vDefForm = 1 then
        UDatas.ExecSQL('update paymentform set defform = 0 where ID <> ' + IntToStr(vID));

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGPaymentFormForm.ExistsPaymentForm(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGPaymentFormForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
