//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Статусы лидов
//
//------------------------------------------------------------------------------
unit UGStatusTypeLead;

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
  PropFilerEh, PropStorageEh, dxColorEdit, cxSplitter, cxGroupBox, cxPC,
  dxDockControl, dxDockPanel, cxCustomListBox, cxListBox, dxScrollbarAnnotations;

type
  TGStatusTypeLeadForm = class(TForm)
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
    TableViewDefSource: TcxGridDBColumn;
    QueryDefStatus: TSmallintField;
    QueryFinStatus: TSmallintField;
    TableViewFinStatus: TcxGridDBColumn;
    BarManagerBar2: TdxBar;
    BarManagerBar3: TdxBar;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
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
    function AddStatusTypeLeadDialog(var IDStatusType : integer) : boolean;
    function EditStatusTypeLeadDialog : boolean;
    function DeleteStatusTypeLeadDialog : boolean;
    function UndoDeleteStatusTypeLeadDialog : boolean;
    function ExistsStatusType(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowStatusTypeLead(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddStatusTypeLead(var AIDStatusType : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditStatusTypeLead(AIDStatusType : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteStatusTypeLead(AIDStatusType : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses types,
  UOptions, UDatas, UGStatusTypeLeadParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, USelectStatusTypeMulti;

function DoAction(var AIDStatusType : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGStatusTypeLeadForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGStatusTypeLeadForm) then
  begin
    with FindForm(TGStatusTypeLeadForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGStatusTypeLeadForm.Create(Application);
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
        Result := AddStatusTypeLeadDialog(AIDStatusType);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDStatusType, []);
          Result := EditStatusTypeLeadDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDStatusType, []);
            Result := DeleteStatusTypeLeadDialog;
            Close;
          end;
  end;
end;

function ShowStatusTypeLead(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddStatusTypeLead(var AIDStatusType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusType, cAddAction, nil);
end;

function EditStatusTypeLead(AIDStatusType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusType, cEditAction, nil);
end;

function DeleteStatusTypeLead(AIDStatusType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusType, cDeleteAction, nil);
end;

procedure TGStatusTypeLeadForm.SetEnabledButtons;
  var
    ef, et, ce, e, del : boolean;
    md, mnd : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  del := e and (Query.FieldByName('Deleted').AsINteger = 1);

  ce := CanEditInActionByAction(MainForm.aaWorkerLead);

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

procedure TGStatusTypeLeadForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGStatusTypeLeadForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeLeadForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGStatusTypeLeadForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGStatusTypeLeadForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteStatusTypeLeadDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeLeadForm.aEditExecute(Sender: TObject);
begin
  FModified := EditStatusTypeLeadDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeLeadForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGStatusTypeLeadForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteStatusTypeLeadDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeLeadForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGStatusTypeLeadForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGStatusTypeLeadForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGStatusTypeLeadForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGStatusTypeLeadForm.TableViewStylesGetContentStyle(
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

function TGStatusTypeLeadForm.UndoDeleteStatusTypeLeadDialog: boolean;
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

procedure TGStatusTypeLeadForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeLeadForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeLeadForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddStatusTypeLeadDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeLeadForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGStatusTypeLeadForm.AddStatusTypeLeadDialog(var IDStatusType: integer): boolean;
  var
    vName, vComment : string;
    vDefStatus, vFinStatus, vActive : integer;
begin
  vActive := 1;
  vName := '';
  vDefStatus := 0;
  vFinStatus := 0;
  vComment := '';

  Result :=
    GetStatusTypeLeadParams(
      vActive,
      vName,
      vDefStatus,
      vFinStatus,
      vComment
      );

  if Result then
  begin
    if ExistsStatusType(vName, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('DefStatus').AsInteger := vDefStatus;
      FieldByName('FinStatus').AsInteger := vFinStatus;

      FieldByName('Comment').AsString := vComment;

      Post;
      IDStatusType := FieldByName('ID').AsInteger;
      Close;

      if vDefStatus = 1 then
        UDatas.ExecSQL('update StatusTypeLead set defStatus = 0 where ID <> ' + IntToStr(IDStatusType));

{      if vFinStatus = 1 then
        UDatas.ExecSQL('update StatusType set finStatus = 0 where ID <> ' + IntToStr(IDStatusType));}

      Query.Refresh;

      Query.Locate('ID', IDStatusType, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGStatusTypeLeadForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGStatusTypeLeadForm.DeleteStatusTypeLeadDialog: boolean;
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

function TGStatusTypeLeadForm.EditStatusTypeLeadDialog: boolean;
  var
    vName, vComment : string;
    vActive, vDefStatus, vFinStatus, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vName := FieldByName('Name').AsString;
    vDefStatus := FieldByName('DefStatus').AsInteger;
    vFinStatus := FieldByName('FinStatus').AsInteger;
    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetStatusTypeLeadParams(
      vActive,
      vName,
      vDefStatus,
      vFinStatus,
      vComment
      );

  if Result then
  begin
    if ExistsStatusType(vName, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('DefStatus').AsInteger := vDefStatus;
      FieldByName('FinStatus').AsInteger := vFinStatus;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      if vDefStatus = 1 then
        UDatas.ExecSQL('update StatusTypeLead set defStatus = 0 where ID <> ' + IntToStr(vID));

{      if vFinStatus = 1 then
        UDatas.ExecSQL('update StatusType set finStatus = 0 where ID <> ' + IntToStr(vID));}

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGStatusTypeLeadForm.ExistsStatusType(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGStatusTypeLeadForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
