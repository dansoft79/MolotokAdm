//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Пользователи
//
//------------------------------------------------------------------------------
unit UGUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  DB,  ADODB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxMemo, dxStatusBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ActnList, dxBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxPropertiesStore,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, cxLookAndFeelPainters, cxTextEdit, cxRichEdit,
  cxDBRichEdit, cxImage, cxDBEdit, cxContainer, cxGroupBox, cxSplitter,
  cxLookAndFeels, System.Actions, cxNavigator, dxDateRanges, dxBarBuiltInMenu,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, PropFilerEh, PropStorageEh;

type
  TGUserForm = class(TForm)
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
    PropertiesStore: TcxPropertiesStore;
    PopupMenu: TcxGridPopupMenu;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewID: TcxGridDBColumn;
    TableViewAssertTime: TcxGridDBColumn;
    TableViewAssertUser: TcxGridDBColumn;
    TableViewDeleted: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    Level: TcxGridLevel;
    QueryAssertUser: TWideStringField;
    QueryID: TSmallintField;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QuerySurname: TWideStringField;
    QueryName: TWideStringField;
    QueryPatro: TWideStringField;
    QueryLogin: TWideStringField;
    QueryPassword: TWideStringField;
    QueryID_UserRole: TSmallintField;
    QueryComment: TWideStringField;
    QueryPermTool: TWideMemoField;
    QueryPermData: TWideMemoField;
    TableViewSurname: TcxGridDBColumn;
    TableViewPatro: TcxGridDBColumn;
    TableViewLogin: TcxGridDBColumn;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    dxBarPopupMenu: TdxBarPopupMenu;
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
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DBGridDblClick(Sender: TObject);
    procedure cbDelChange(Sender: TObject);
    procedure cbActiveChange(Sender: TObject);
    procedure TableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure aUndoDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddUserDialog(var IDUser : integer) : boolean;
    function EditUserDialog : boolean;
    function DeleteUserDialog : boolean;
    function UndoDeleteUserDialog : boolean;

    function IDExists(AID: integer): boolean;

    function ExistsRecord(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowUser(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddUser(var AIDUser : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditUser(AIDUser : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteUser(AIDUser : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGUserParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree, Jpeg;

function DoAction(var AIDUser : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGUserForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGUserForm) then
  begin
    with FindForm(TGUserForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGUserForm.Create(Application);
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
        Result := AddUserDialog(AIDUser);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDUser, []);
          Result := EditUserDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDUser, []);
            Result := DeleteUserDialog;
            Close;
          end;
  end;
end;

function ShowUser(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddUser(var AIDUser : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDUser, cAddAction, nil);
end;

function EditUser(AIDUser : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDUser, cEditAction, nil);
end;

function DeleteUser(AIDUser : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDUser, cDeleteAction, nil);
end;

procedure TGUserForm.SetEnabledButtons;
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

procedure TGUserForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGUserForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGUserForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGUserForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteUserDialog or FModified;
  SetEnabledButtons;
end;

procedure TGUserForm.aEditExecute(Sender: TObject);
begin
  FModified := EditUserDialog or FModified;
  SetEnabledButtons;
end;

procedure TGUserForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGUserForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteUserDialog or FModified;
  SetEnabledButtons;
end;

procedure TGUserForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGUserForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGUserForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGUserForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGUserForm.TableViewStylesGetContentStyle(
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

function TGUserForm.UndoDeleteUserDialog: boolean;
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

procedure TGUserForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGUserForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

function TGUserForm.IDExists(AID: integer): boolean;
begin
  ShowWaiting(cDataGetting);
  try
    Result := false//Datas.UsedData('User', AID);
  finally
    HideWaiting;
  end;
end;

procedure TGUserForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddUserDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGUserForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGUserForm.AddUserDialog(var IDUser: integer): boolean;
  var
    vLogin, vPassword, vSurname, vName, vPatro, vComment : string;
    vActive, vIDUserROle : integer;
begin
  vActive := 1;
  vIDUserROle := 0;
  vLogin := '';
  vPassword := '';
  vSurname := '';
  vName := '';
  vPatro := '';
  vComment := '';

  Result :=
    GetUserParams(
      vActive,
      vIDUserROle,
      vLogin,
      vPassword,
      vSurname,
      vName,
      vPatro,
      vComment,
      0
      );

  if Result then
  begin
    if ExistsRecord(vLogin, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('ID_UserRole').AsInteger := vIDUserRole;
      FieldByName('Login').AsString := vLogin;
      FieldByName('Password').AsString := vPassword;
      FieldByName('Surname').AsString := vSurname;
      FieldByName('Name').AsString := vName;
      FieldByName('Patro').AsString := vPatro;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDUser := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDUser, []);
    end;
  end;

  SetEnabledButtons;
end;

procedure TGUserForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGUserForm.DeleteUserDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
//    if DeleteRec('User', vID) then
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

function TGUserForm.EditUserDialog: boolean;
  var
    vLogin, vPassword, vSurname, vName, vPatro,
    vComment : string;
    vActive, vIDUserRole : integer;
    vID: integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vIDUserROle := FieldByName('ID_UserROle').AsInteger;
    vLogin := FieldByName('Login').AsString;
    vPassword := FieldByName('Password').AsString;
    vSurname := FieldByName('Surname').AsString;
    vName := FieldByName('Name').AsString;
    vPatro := FieldByName('Patro').AsString;
    vComment := FieldByname('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetUserParams(
      vActive,
      vIDUserROle,
      vLogin,
      vPassword,
      vSurname,
      vName,
      vPatro,
      vComment,
      vID);

  if Result then
  begin
    if ExistsRecord(vLogin, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('ID_UserROle').AsInteger := vIDUserROle;
      FieldByName('Login').AsString := vLogin;
      FieldByName('Password').AsString := vPassword;
      FieldByName('Surname').AsString := vSurname;
      FieldByName('Name').AsString := vName;
      FieldByName('Patro').AsString := vPatro;
      FieldByName('Comment').AsString := vComment;
      Post;

      if UserID = vID then
      begin
        UserName := FieldByName('Surname').AsString + ' ' +
                     Copy(FieldByName('Name').AsString, 1, 1) + '.';
        if FieldByName('Patro').AsString <> '' then
          UserName := UserName + ' ' + Copy(FieldByName('Patro').AsString, 1, 1) + '.';

        MainForm.UpdateStatus;
      end;

      Close;
      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;

  SetEnabledButtons;
end;

function TGUserForm.ExistsRecord(AName: string; AIDExclude: integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGUserForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
