//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ���� �������������
//
//------------------------------------------------------------------------------
unit UGUserRole;

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
  TGUserRoleForm = class(TForm)
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
    aPermTool: TAction;
    dxBarButton6: TdxBarButton;
    Query: TZQuery;
    QueryName: TWideStringField;
    Table: TZQuery;
    QueryID: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryDeleted: TSmallintField;
    QueryActive: TSmallintField;
    QueryAssertEmployee: TWideStringField;
    QueryPermTool: TWideMemoField;
    QueryPermData: TWideMemoField;
    QueryRoleType: TSmallintField;
    QueryRoleCreator: TSmallintField;
    QueryComment: TWideStringField;
    aPermData: TAction;
    QueryID_AssertUser: TSmallintField;
    QueryRTInfo: TWideStringField;
    QueryUTInfo: TWideStringField;
    dxBarButton7: TdxBarButton;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewName: TcxGridDBColumn;
    Level: TcxGridLevel;
    TableViewID: TcxGridDBColumn;
    TableViewAssertTime: TcxGridDBColumn;
    TableViewDeleted: TcxGridDBColumn;
    TableViewAssertUser: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    TableViewRTInfo: TcxGridDBColumn;
    TableViewUTInfo: TcxGridDBColumn;
    PopupMenu: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
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
    procedure aPermToolExecute(Sender: TObject);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DBGridDblClick(Sender: TObject);
    procedure aPermDataExecute(Sender: TObject);
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
    function AddUserROleDialog(var IDUserROle : integer) : boolean;
    function EditUserROleDialog : boolean;
    function DeleteUserROleDialog : boolean;
    function UndoDeleteUserROleDialog : boolean;
    function ExistsUserRole(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//����������� ���� �����������
function ShowUserROle(AParentAction : TAction) : boolean;

//����� ���� ���������� ������ � ����������
function AddUserROle(var AIDUserROle : integer; AParentAction : TAction) : boolean;

//����� ���� ��������� ������ �����������
function EditUserROle(AIDUserROle : integer; AParentAction : TAction) : boolean;

//�������� ��������� ������ �����������
function DeleteUserROle(AIDUserROle : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGUserROleParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree;

function DoAction(var AIDUserROle : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGUserROleForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGUserROleForm) then
  begin
    with FindForm(TGUserROleForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGUserROleForm.Create(Application);
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
        Result := AddUserROleDialog(AIDUserROle);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDUserROle, []);
          Result := EditUserROleDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDUserROle, []);
            Result := DeleteUserROleDialog;
            Close;
          end;
  end;
end;

function ShowUserROle(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddUserROle(var AIDUserROle : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDUserROle, cAddAction, nil);
end;

function EditUserROle(AIDUserROle : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDUserROle, cEditAction, nil);
end;

function DeleteUserROle(AIDUserROle : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDUserROle, cDeleteAction, nil);
end;

procedure TGUserRoleForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agUserROle);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  aPermTool.Enabled := e and ce and not del;
  aPermData.Enabled := e and ce and not del;

  //------------------------------------------
  //���������
  //------------------------------------------
  md := cbDel.ItemIndex in [1, 2];
  mnd := cbDel.ItemIndex in [0, 2];
  aAdd.Visible := mnd;
  aDelete.Visible := mnd;
  aUndoDelete.Visible := md;
  aEdit.Visible := mnd;

  aPermTool.Visible := mnd;
  aPermData.Visible := mnd;
end;

procedure TGUserRoleForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGUserRoleForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGUserRoleForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGUserRoleForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGUserRoleForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteUserROleDialog or FModified;
  SetEnabledButtons;
end;

procedure TGUserRoleForm.aEditExecute(Sender: TObject);
begin
  FModified := EditUserROleDialog or FModified;
  SetEnabledButtons;
end;

procedure TGUserRoleForm.aPermDataExecute(Sender: TObject);
begin
  ShowUnderConstruction;
end;

procedure TGUserRoleForm.aPermToolExecute(Sender: TObject);
  var
    vPermissions : TStringList;
    s : string;
    vID : integer;
begin
  vPermissions := TStringList.Create;
  s := '���� ' + Query.FieldByName('Name').AsString;
  vPermissions.Text := Query.FieldByName('PermTool').AsString;
  vID := Query.FieldByName('ID').AsInteger;
  if EditPermitTree(s, vPermissions) then
  begin
    Table.Close;
    Table.ParamByName('ID').AsInteger:= vID;
    Table.Open;
    Table.Edit;
    Table.FieldByName('PermTool').AsString := vPermissions.Text;
    Table.Post;
    Table.Close;
    Query.Close;
    Query.Open;
    Query.Locate('ID', vID, []);
  end;
  vPermissions.Free;
end;

procedure TGUserRoleForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGUserRoleForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteUserROleDialog or FModified;
  SetEnabledButtons;
end;

procedure TGUserRoleForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGUserRoleForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGUserRoleForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGUserRoleForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGUserRoleForm.TableViewStylesGetContentStyle(
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

function TGUserRoleForm.UndoDeleteUserROleDialog: boolean;
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

procedure TGUserRoleForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGUserRoleForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGUserRoleForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddUserROleDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGUserRoleForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGUserRoleForm.AddUserROleDialog(var IDUserROle: integer): boolean;
  var
    vName, vComment : string;
    vActive, vRoleType : integer;
begin
  vActive := 1;
  vName := '';
  vRoleType := 0;
  vComment := '';

  Result :=
    GetUserRoleParams(
      vActive,
      vName,
      vComment,
      vRoleType
      );

  if Result then
  begin
    if ExistsUserRole(vName, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('Name').AsString := vName;
      FieldByName('RoleType').AsINteger := vRoleType;
      FieldByName('Comment').AsString := vComment;
      FieldByName('RoleCreator').AsINteger := 0;
      Post;
      IDUserROle := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDUserROle, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGUserRoleForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGUserRoleForm.DeleteUserROleDialog: boolean;
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

function TGUserRoleForm.EditUserROleDialog: boolean;
  var
    vName, vComment : string;
    vActive, vRoleType, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vName := FieldByName('Name').AsString;
    vRoleType := FieldByName('RoleType').AsINteger;
    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetUserRoleParams(
      vActive,
      vName,
      vComment,
      vRoleType);

  if Result then
  begin
    if ExistsUserRole(vName, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('RoleType').AsInteger := vRoleType;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGUserRoleForm.ExistsUserRole(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGUserRoleForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
