//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Типы работ
//
//------------------------------------------------------------------------------
unit UGWorkClass;

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
  PropFilerEh, PropStorageEh, cxSplitter, cxGroupBox;

type
  TGWorkClassForm = class(TForm)
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
    QueryNamePublic: TWideStringField;
    TableViewNamePublic: TcxGridDBColumn;
    pRight: TPanel;
    gbAdd: TcxGroupBox;
    DockAdd: TdxBarDockControl;
    GridAdd: TcxGrid;
    ViewAdd: TcxGridDBTableView;
    LevelAdd: TcxGridLevel;
    Splitter: TcxSplitter;
    aDelWork: TAction;
    BarManagerBar2: TdxBar;
    aAddWork: TAction;
    qWorkAdd: TZQuery;
    qWorkAddID: TSmallintField;
    qWorkAddID_WorkTypeAdd: TSmallintField;
    dsWorkAdd: TDataSource;
    tWorkAdd: TZQuery;
    dxBarButton7: TdxBarButton;
    dxBarButton9: TdxBarButton;
    gbDescription: TcxGroupBox;
    QueryDescription: TWideStringField;
    mDescr: TcxDBMemo;
    qWorkAddID_WorkClass: TSmallintField;
    qWorkAddPublicWork: TSmallintField;
    qWorkAddName: TWideStringField;
    qWorkAddUnitName: TWideStringField;
    qWorkAddPrice: TFloatField;
    qWorkAddAmount: TFloatField;
    ViewAddPublicWork: TcxGridDBColumn;
    ViewAddName: TcxGridDBColumn;
    ViewAddUnitName: TcxGridDBColumn;
    ViewAddPrice: TcxGridDBColumn;
    ViewAddAmount: TcxGridDBColumn;
    qWorkAddDeleted: TSmallintField;
    ViewAddID: TcxGridDBColumn;
    ViewAddDeleted: TcxGridDBColumn;
    pmAddWork: TcxGridPopupMenu;
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
    procedure aDelWorkExecute(Sender: TObject);
    procedure aAddWorkExecute(Sender: TObject);
    procedure ViewAddStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddWorkClassDialog(var IDWorkClass : integer) : boolean;
    function EditWorkClassDialog : boolean;
    function DeleteWorkClassDialog : boolean;
    function UndoDeleteWorkClassDialog : boolean;
    function ExistsWorkClass(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowWorkClass(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddWorkClass(var AIDWorkClass : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditWorkClass(AIDWorkClass : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteWorkClass(AIDWorkClass : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses types,
  UOptions, UDatas, UGWorkClassParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, USelectWorkClass, USelectWorkTypeMulti;

function DoAction(var AIDWorkClass : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGWorkClassForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGWorkClassForm) then
  begin
    with FindForm(TGWorkClassForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGWorkClassForm.Create(Application);
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
        Result := AddWorkClassDialog(AIDWorkClass);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDWorkClass, []);
          Result := EditWorkClassDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDWorkClass, []);
            Result := DeleteWorkClassDialog;
            Close;
          end;
  end;
end;

function ShowWorkClass(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddWorkClass(var AIDWorkClass : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkClass, cAddAction, nil);
end;

function EditWorkClass(AIDWorkClass : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkClass, cEditAction, nil);
end;

function DeleteWorkClass(AIDWorkClass : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkClass, cDeleteAction, nil);
end;

procedure TGWorkClassForm.SetEnabledButtons;
  var
    ewa, ce, e, del : boolean;
    md, mnd : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  del := e and (Query.FieldByName('Deleted').AsINteger = 1);

  ce := CanEditInActionByAction(MainForm.agWorkClass);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  with ViewAdd.Controller do
    ewa :=
      qWorkAdd.Active and
      not qWorkAdd.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aAddWork.Enabled := e and ce and not del;
  aDelWork.Enabled := ewa and ce and not del;

  //------------------------------------------
  //видимость
  //------------------------------------------
  md := cbDel.ItemIndex in [1, 2];
  mnd := cbDel.ItemIndex in [0, 2];
  aAdd.Visible := mnd;
  aDelete.Visible := mnd;
  aUndoDelete.Visible := md;
  aEdit.Visible := mnd;

  aAddWork.Enabled := e and ce and not del;
  aDelWork.Enabled := ewa and ce and not del;
end;

procedure TGWorkClassForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGWorkClassForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGWorkClassForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);

  TableView.StoreToIniFile(cIniFileName, false);
  ViewAdd.StoreToIniFile(cIniFileName, false);

  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGWorkClassForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;

  TableView.RestoreFromIniFile(cIniFileName);
  ViewAdd.RestoreFromIniFile(cIniFileName);
end;

procedure TGWorkClassForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteWorkClassDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkClassForm.aDelWorkExecute(Sender: TObject);
  var
    vID, vRecNo : integer;
begin
  vRecNo := qWorkAdd.RecNo;

  vID := qWorkAdd.FieldByName('ID').AsInteger;

  tWorkAdd.Close;
  tWorkAdd.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
  tWorkAdd.Open;
  if tWorkAdd.Locate('ID', vID, []) then
    tWorkAdd.Delete;
  tWorkAdd.Close;

  qWorkAdd.Refresh;

  if qWorkAdd.RecordCount <> 0 then
    qWorkAdd.RecNo := vRecNo;
end;

procedure TGWorkClassForm.aEditExecute(Sender: TObject);
begin
  FModified := EditWorkClassDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkClassForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGWorkClassForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteWorkClassDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkClassForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGWorkClassForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;

  qWorkAdd.Close;
  qWorkAdd.ParamByName('D').AsInteger := cbDel.ItemIndex;
  qWorkAdd.Open;
end;

procedure TGWorkClassForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkClassForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkClassForm.TableViewStylesGetContentStyle(
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

function TGWorkClassForm.UndoDeleteWorkClassDialog: boolean;
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

procedure TGWorkClassForm.ViewAddStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  vDeleted : boolean;
  vID : integer;
begin
  if not ARecord.IsData then Exit;

  Datas.DeletedRecordStyle.Color := DeletedRecordColor;

  vID := IsNull(ARecord.Values[ViewAddID.Index], 0);
  vDeleted := IsNull(ARecord.Values[ViewAddDeleted.Index], 0) = 1;

  if vDeleted then AStyle := Datas.DeletedRecordStyle;
end;

procedure TGWorkClassForm.QueryAfterScroll(DataSet: TDataSet);
begin
  qWorkAdd.Close;
  qWorkAdd.Open;

  SetEnabledButtons;
end;

procedure TGWorkClassForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGWorkClassForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddWorkClassDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGWorkClassForm.aAddWorkExecute(Sender: TObject);
  var
    vIDR, i : integer;
    vID : TIntegerDynArray;
begin
  vIDR := 0;
  if SelectWorkTypeMulti(vID) then
  begin
    tWorkAdd.Close;
    tWorkAdd.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
    tWorkAdd.Open;
    for i := 0 to Length(vID) - 1 do
    begin
      if not tWorkAdd.Locate('ID_WorkTypeAdd', vID[i], []) then
      begin
        tWorkAdd.Append;
        tWorkAdd.FieldByName('ID_WorkClass').AsInteger := Query.FieldByName('ID').AsInteger;
        tWorkAdd.FieldByName('ID_WorkTypeAdd').AsInteger := vID[i];
//        tWorkAdd.FieldByName('ID_WorkClassAdd').Value := Datas.ReadValues('worktype', 'ID_WorkClass', vID[i])[0];
        tWorkAdd.Post;
      end;
    end;
    tWorkAdd.Close;

    qWorkAdd.Close;
    qWorkAdd.Open;

    if Length(vID) > 0 then
      qWorkAdd.Locate('ID_WorkTypeAdd', vID[0], [])
    else
      qWorkAdd.Locate('ID', vIDR, []);
  end;
end;

procedure TGWorkClassForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGWorkClassForm.AddWorkClassDialog(var IDWorkClass: integer): boolean;
  var
    vName, vNamePublic, vDescription, vComment : string;
    vActive : integer;
begin
  vActive := 1;
  vName := '';
  vNamePublic := '';
  vDescription := '';
  vComment := '';

  Result :=
    GetWorkClassParams(
      vActive,
      vName,
      vNamePublic,
      vDescription,
      vComment
      );

  if Result then
  begin
    if ExistsWorkClass(vName, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('NamePublic').AsString := vNamePublic;
      FieldByName('Name').AsString := vName;
      FieldByName('Description').AsString := vDescription;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDWorkClass := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDWorkClass, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGWorkClassForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGWorkClassForm.DeleteWorkClassDialog: boolean;
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

function TGWorkClassForm.EditWorkClassDialog: boolean;
  var
    vName, vNamePublic, vDescription, vComment : string;
    vActive, vRoleType, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vName := FieldByName('Name').AsString;
    vNamePublic := FieldByName('NamePublic').AsString;
    vDescription := FieldByName('Description').AsString;
    vComment := FieldByName('Comment').AsString;

    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetWorkClassParams(
      vActive,
      vName,
      vNamePublic,
      vDescription,
      vComment);

  if Result then
  begin
    if ExistsWorkClass(vName, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('Name').AsString := vName;
      FieldByName('NamePublic').AsString := vNamePublic;
      FieldByName('Description').AsString := vDescription;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGWorkClassForm.ExistsWorkClass(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGWorkClassForm.QueryAfterOpen(DataSet: TDataSet);
begin
  qWorkAdd.Close;
  qWorkAdd.Open;

  SetEnabledButtons;
end;

end.
