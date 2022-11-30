//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Причины
//
//------------------------------------------------------------------------------
unit UGReason;

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
  TGReasonForm = class(TForm)
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
    QueryID_StatusType: TIntegerField;
    QuerySTInfo: TWideStringField;
    TableViewSTInfo: TcxGridDBColumn;
    QueryCommentRequired: TSmallintField;
    TableViewCommentRequired: TcxGridDBColumn;
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
    function AddReasonDialog(var IDReason : integer) : boolean;
    function EditReasonDialog : boolean;
    function DeleteReasonDialog : boolean;
    function UndoDeleteReasonDialog : boolean;
    function ExistsReason(AName : string; AIDExclude : integer) : boolean;

    procedure ResetCommentRequired(AIDStatusType, AIDExclude : integer);
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowReason(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddReason(var AIDReason : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditReason(AIDReason : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteReason(AIDReason : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGReasonParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree;

function DoAction(var AIDReason : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGReasonForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGReasonForm) then
  begin
    with FindForm(TGReasonForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGReasonForm.Create(Application);
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
        Result := AddReasonDialog(AIDReason);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDReason, []);
          Result := EditReasonDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDReason, []);
            Result := DeleteReasonDialog;
            Close;
          end;
  end;
end;

function ShowReason(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddReason(var AIDReason : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDReason, cAddAction, nil);
end;

function EditReason(AIDReason : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDReason, cEditAction, nil);
end;

function DeleteReason(AIDReason : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDReason, cDeleteAction, nil);
end;

procedure TGReasonForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agReason);

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

procedure TGReasonForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGReasonForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGReasonForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGReasonForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGReasonForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteReasonDialog or FModified;
  SetEnabledButtons;
end;

procedure TGReasonForm.aEditExecute(Sender: TObject);
begin
  FModified := EditReasonDialog or FModified;
  SetEnabledButtons;
end;

procedure TGReasonForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGReasonForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteReasonDialog or FModified;
  SetEnabledButtons;
end;

procedure TGReasonForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGReasonForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGReasonForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGReasonForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGReasonForm.TableViewStylesGetContentStyle(
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

function TGReasonForm.UndoDeleteReasonDialog: boolean;
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

procedure TGReasonForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGReasonForm.ResetCommentRequired(AIDStatusType, AIDExclude: integer);
begin
  ExecSQL('update Reason set CommentRequired = 0 where ID_StatusType = ' + IntToStr(AIDStatusType) + ' and ID <> ' + IntToStr(AIDExclude));
end;

procedure TGReasonForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGReasonForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddReasonDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGReasonForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGReasonForm.AddReasonDialog(var IDReason: integer): boolean;
  var
    vName, vComment : string;
    vIDStatusType, vActive : integer;
    vCommentRequired : integer;
begin
  vActive := 1;
  vIDStatusType := 0;
  vName := '';
  vCommentRequired := 0;
  vComment := '';

  Result :=
    GetReasonParams(
      vActive,
      vIDStatusType,
      vName,
      vComment,
      vCommentRequired
      );

  if Result then
  begin
    if ExistsReason(vName, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('ID_StatusType').AsInteger := vIDStatusType;
      FieldByName('Name').AsString := vName;
      FieldByName('CommentRequired').AsInteger := vCommentRequired;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDReason := FieldByName('ID').AsInteger;
      Close;

      if vCommentRequired = 1 then
        ResetCommentRequired(vIDStatusType, IDReason);

      Query.Refresh;

      Query.Locate('ID', IDReason, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGReasonForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGReasonForm.DeleteReasonDialog: boolean;
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

function TGReasonForm.EditReasonDialog: boolean;
  var
    vName, vComment : string;
    vCommentRequired, vIDStatusType, vActive, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vIDStatusType := FieldByName('ID_StatusType').AsInteger;
    vName := FieldByName('Name').AsString;
    vCommentRequired := FieldByName('CommentRequired').AsInteger;
    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetReasonParams(
      vActive,
      vIDStatusType,
      vName,
      vComment,
      vCommentRequired);

  if Result then
  begin
    if ExistsReason(vName, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('ID_StatusType').AsInteger := vIDStatusType;
      FieldByName('Name').AsString := vName;
      FieldByName('CommentRequired').AsInteger := vCommentRequired;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      if vCommentRequired = 1 then
        ResetCommentRequired(vIDStatusType, vID);

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGReasonForm.ExistsReason(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGReasonForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
