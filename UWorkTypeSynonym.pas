//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Синонимы видов работ
//
//------------------------------------------------------------------------------
unit UWorkTypeSynonym;

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
  TWorkTypeSynonymForm = class(TForm)
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
    QueryID_WorkType: TSmallintField;
    QueryWTInfo: TWideStringField;
    QueryWCInfo: TWideStringField;
    TableViewWTInfo: TcxGridDBColumn;
    TableViewWCInfo: TcxGridDBColumn;
    QueryName: TWideStringField;
    TableViewName: TcxGridDBColumn;
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
    function AddWorkTypeSynonymDialog(var IDWorkTypeSynonym : integer) : boolean;
    function EditWorkTypeSynonymDialog : boolean;
    function DeleteWorkTypeSynonymDialog : boolean;
    function UndoDeleteWorkTypeSynonymDialog : boolean;
    function ExistsWorkTypeSynonym(AName : string; AIDWorkType, AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowWorkTypeSynonym(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddWorkTypeSynonym(var AIDWorkTypeSynonym : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditWorkTypeSynonym(AIDWorkTypeSynonym : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteWorkTypeSynonym(AIDWorkTypeSynonym : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UWorkTypeSynonymParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit;

function DoAction(var AIDWorkTypeSynonym : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TWorkTypeSynonymForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TWorkTypeSynonymForm) then
  begin
    with FindForm(TWorkTypeSynonymForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TWorkTypeSynonymForm.Create(Application);
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
        Result := AddWorkTypeSynonymDialog(AIDWorkTypeSynonym);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDWorkTypeSynonym, []);
          Result := EditWorkTypeSynonymDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDWorkTypeSynonym, []);
            Result := DeleteWorkTypeSynonymDialog;
            Close;
          end;
  end;
end;

function ShowWorkTypeSynonym(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddWorkTypeSynonym(var AIDWorkTypeSynonym : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkTypeSynonym, cAddAction, nil);
end;

function EditWorkTypeSynonym(AIDWorkTypeSynonym : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkTypeSynonym, cEditAction, nil);
end;

function DeleteWorkTypeSynonym(AIDWorkTypeSynonym : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkTypeSynonym, cDeleteAction, nil);
end;

procedure TWorkTypeSynonymForm.SetEnabledButtons;
  var
    ce, e, del : boolean;
    mnd, md : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  del := e and (Query.FieldByName('Deleted').AsINteger = 1);

  ce := CanEditInActionByAction(MainForm.aaWorkTypeSynonym);

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

procedure TWorkTypeSynonymForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TWorkTypeSynonymForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TWorkTypeSynonymForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TWorkTypeSynonymForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TWorkTypeSynonymForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteWorkTypeSynonymDialog or FModified;
  SetEnabledButtons;
end;

procedure TWorkTypeSynonymForm.aEditExecute(Sender: TObject);
begin
  FModified := EditWorkTypeSynonymDialog or FModified;
  SetEnabledButtons;
end;

procedure TWorkTypeSynonymForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TWorkTypeSynonymForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteWorkTypeSynonymDialog or FModified;
  SetEnabledButtons;
end;

procedure TWorkTypeSynonymForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TWorkTypeSynonymForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TWorkTypeSynonymForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TWorkTypeSynonymForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TWorkTypeSynonymForm.TableViewStylesGetContentStyle(
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

function TWorkTypeSynonymForm.UndoDeleteWorkTypeSynonymDialog: boolean;
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

procedure TWorkTypeSynonymForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TWorkTypeSynonymForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TWorkTypeSynonymForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddWorkTypeSynonymDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TWorkTypeSynonymForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TWorkTypeSynonymForm.AddWorkTypeSynonymDialog(var IDWorkTypeSynonym: integer): boolean;
  var
    vName: string;
    vActive, vIDWorkType : integer;
begin
  vActive := 1;
  vIDWorkType := 0;
  vName := '';

  Result :=
    GetWorkTypeSynonymParams(
      vActive,
      vIDWorkType,
      vName
      );

  if Result then
  begin
    if ExistsWorkTypeSynonym(vName, vIDWorkType, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('ID_WorkType').AsInteger := vIDWorkType;
      FieldByName('Name').AsString := vName;
      Post;
      IDWorkTypeSynonym := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDWorkTypeSynonym, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TWorkTypeSynonymForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TWorkTypeSynonymForm.DeleteWorkTypeSynonymDialog: boolean;
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

function TWorkTypeSynonymForm.EditWorkTypeSynonymDialog: boolean;
  var
    vName : string;
    vID, vActive, vIDWorkType : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vIDWorkType := FieldByName('ID_WorkType').AsInteger;
    vName := FieldByName('Name').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetWorkTypeSynonymParams(
      vActive,
      vIDWorkType,
      vName
      );

  if Result then
  begin
    if ExistsWorkTypeSynonym(vName, vIDWorkType, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('ID_WorkType').AsInteger := vIDWorkType;
      FieldByName('Name').AsString := vName;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TWorkTypeSynonymForm.ExistsWorkTypeSynonym(AName: string; AIDWorkType, AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('W').AsInteger := AIDWorkType;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TWorkTypeSynonymForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
