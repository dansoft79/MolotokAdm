//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Запросы клиентов
//
//------------------------------------------------------------------------------
unit UClientRequest;

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
  PropFilerEh, PropStorageEh;

type
  TClientRequestForm = class(TForm)
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
    QueryID: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryDeleted: TSmallintField;
    QueryActive: TSmallintField;
    QueryAssertEmployee: TWideStringField;
    QueryID_AssertUser: TSmallintField;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    Level: TcxGridLevel;
    TableViewID: TcxGridDBColumn;
    TableViewAssertTime: TcxGridDBColumn;
    TableViewDeleted: TcxGridDBColumn;
    TableViewAssertUser: TcxGridDBColumn;
    PopupMenu: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
    QueryRequestText: TWideStringField;
    QueryProcessed: TSmallintField;
    QueryID_WorkType: TSmallintField;
    QueryClientSession: TWideStringField;
    QueryWTInfo: TWideStringField;
    QueryWCInfo: TWideStringField;
    TableViewRequestText: TcxGridDBColumn;
    TableViewProcessed: TcxGridDBColumn;
    TableViewClientSession: TcxGridDBColumn;
    TableViewWTInfo: TcxGridDBColumn;
    TableViewWCInfo: TcxGridDBColumn;
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
    function AddClientRequestDialog(var IDClientRequest : integer) : boolean;
    function EditClientRequestDialog : boolean;
    function DeleteClientRequestDialog : boolean;
    function UndoDeleteClientRequestDialog : boolean;
    function ExistsClientRequest(AName : string; AIDWorkType, AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowClientRequest(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddClientRequest(var AIDClientRequest : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditClientRequest(AIDClientRequest : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteClientRequest(AIDClientRequest : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UClientRequestParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit;

function DoAction(var AIDClientRequest : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TClientRequestForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TClientRequestForm) then
  begin
    with FindForm(TClientRequestForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TClientRequestForm.Create(Application);
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
        Result := AddClientRequestDialog(AIDClientRequest);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDClientRequest, []);
          Result := EditClientRequestDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDClientRequest, []);
            Result := DeleteClientRequestDialog;
            Close;
          end;
  end;
end;

function ShowClientRequest(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddClientRequest(var AIDClientRequest : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDClientRequest, cAddAction, nil);
end;

function EditClientRequest(AIDClientRequest : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDClientRequest, cEditAction, nil);
end;

function DeleteClientRequest(AIDClientRequest : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDClientRequest, cDeleteAction, nil);
end;

procedure TClientRequestForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.aaClientRequest);

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

procedure TClientRequestForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TClientRequestForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TClientRequestForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TClientRequestForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TClientRequestForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteClientRequestDialog or FModified;
  SetEnabledButtons;
end;

procedure TClientRequestForm.aEditExecute(Sender: TObject);
begin
  FModified := EditClientRequestDialog or FModified;
  SetEnabledButtons;
end;

procedure TClientRequestForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TClientRequestForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteClientRequestDialog or FModified;
  SetEnabledButtons;
end;

procedure TClientRequestForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TClientRequestForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TClientRequestForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TClientRequestForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TClientRequestForm.TableViewStylesGetContentStyle(
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

function TClientRequestForm.UndoDeleteClientRequestDialog: boolean;
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

procedure TClientRequestForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TClientRequestForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TClientRequestForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddClientRequestDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TClientRequestForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TClientRequestForm.AddClientRequestDialog(var IDClientRequest: integer): boolean;
  var
    vRequestText, vClientSession : string;
    vActive, vProcessed, vIDWorkType : integer;
begin
  vActive := 1;
  vProcessed := 0;
  vIDWorkType := 0;
  vRequestText := '';
  vClientSession := '';

  Result :=
    GetClientRequestParams(
      vActive,
      vProcessed, vIDWorkType,
      vRequestText, vClientSession
      );

  if Result then
  begin
    if ExistsClientRequest(vRequestText, vIDWorkType, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('Processed').AsInteger := vProcessed;

      FieldByName('ID_WorkType').AsInteger := vIDWorkType;

      FieldByName('RequestText').AsString := vRequestText;
      FieldByName('ClientSession').AsString := vClientSession;
      Post;
      IDClientRequest := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDClientRequest, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TClientRequestForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TClientRequestForm.DeleteClientRequestDialog: boolean;
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

function TClientRequestForm.EditClientRequestDialog: boolean;
  var
    vRequestText, vClientSession : string;
    vID, vActive, vProcessed, vIDWorkType : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vProcessed := FieldByName('Processed').AsInteger;
    vIDWorkType := FieldByName('ID_WorkType').AsInteger;
    vRequestText := FieldByName('RequestText').AsString;
    vClientSession := FieldByName('ClientSession').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetClientRequestParams(
      vActive,
      vProcessed, vIDWorkType,
      vRequestText, vClientSession
      );

  if Result then
  begin
    if ExistsClientRequest(vRequestText, vIDWorkType, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('Processed').AsInteger := vProcessed;
      FieldByName('ID_WorkType').AsInteger := vIDWorkType;
      FieldByName('RequestText').AsString := vRequestText;
      FieldByName('ClientSession').AsString := vClientSession;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TClientRequestForm.ExistsClientRequest(AName: string; AIDWorkType, AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('W').AsInteger := AIDWorkType;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TClientRequestForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
