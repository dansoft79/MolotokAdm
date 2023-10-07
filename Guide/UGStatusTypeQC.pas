//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Статусы контроля качества
//
//------------------------------------------------------------------------------
unit UGStatusTypeQC;

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
  TGStatusTypeQCForm = class(TForm)
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
    QueryColor: TLargeintField;
    TableViewColor: TcxGridDBColumn;
    TableViewDefSource: TcxGridDBColumn;
    pRight: TPanel;
    SplitterBottom: TcxSplitter;
    gbRight: TcxGroupBox;
    gbTop: TcxGroupBox;
    QueryStatusOrder: TIntegerField;
    QueryDefStatus: TSmallintField;
    QueryFinStatus: TSmallintField;
    TableViewStatusOrder: TcxGridDBColumn;
    TableViewFinStatus: TcxGridDBColumn;
    qFrom: TZQuery;
    dsFrom: TDataSource;
    dsTo: TDataSource;
    qTo: TZQuery;
    qFromID: TIntegerField;
    qFromSTInfo: TWideStringField;
    qToID: TIntegerField;
    qToSTInfo: TWideStringField;
    dxBarDockControl1: TdxBarDockControl;
    dxBarDockControl2: TdxBarDockControl;
    BarManagerBar2: TdxBar;
    BarManagerBar3: TdxBar;
    aAddFrom: TAction;
    aDelFrom: TAction;
    aAddTo: TAction;
    aDelTo: TAction;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    qFromID_StatusTypeFrom: TSmallintField;
    qFromID_StatusTypeTo: TSmallintField;
    qToID_StatusTypeFrom: TSmallintField;
    qToID_StatusTypeTo: TSmallintField;
    qStatusTypeFrom: TZQuery;
    qStatusTypeTo: TZQuery;
    DBGridFrom: TcxGrid;
    ViewFrom: TcxGridDBTableView;
    LevelFrom: TcxGridLevel;
    ViewFromID: TcxGridDBColumn;
    ViewFromSTInfo: TcxGridDBColumn;
    DBGridTo: TcxGrid;
    ViewTo: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    LevelTo: TcxGridLevel;
    qFromDeleted: TSmallintField;
    ViewFromDeleted: TcxGridDBColumn;
    qToDeleted: TSmallintField;
    ViewToDeleted: TcxGridDBColumn;
    pmFrom: TcxGridPopupMenu;
    pmTo: TcxGridPopupMenu;
    TableViewEndStatus: TcxGridDBColumn;
    QueryEndStatus: TSmallintField;
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
    procedure pRightResize(Sender: TObject);
    procedure aAddFromExecute(Sender: TObject);
    procedure aDelFromExecute(Sender: TObject);
    procedure aAddToExecute(Sender: TObject);
    procedure aDelToExecute(Sender: TObject);
    procedure ViewFromStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ViewToStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddStatusTypeDialog(var IDStatusType : integer) : boolean;
    function EditStatusTypeDialog : boolean;
    function DeleteStatusTypeDialog : boolean;
    function UndoDeleteStatusTypeDialog : boolean;
    function ExistsStatusType(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowStatusTypeQC(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddStatusTypeQC(var AIDStatusTypeQC : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditStatusTypeQC(AIDStatusTypeQC : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteStatusTypeQC(AIDStatusTypeQC : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses types,
  UOptions, UDatas, UGStatusTypeQCParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree, USelectStatusTypeQCMulti;

function DoAction(var AIDStatusTypeQC : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGStatusTypeQCForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGStatusTypeQCForm) then
  begin
    with FindForm(TGStatusTypeQCForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGStatusTypeQCForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    qFrom.Open;
    qTo.Open;

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
        Result := AddStatusTypeDialog(AIDStatusTypeQC);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDStatusTypeQC, []);
          Result := EditStatusTypeDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDStatusTypeQC, []);
            Result := DeleteStatusTypeDialog;
            Close;
          end;
  end;
end;

function ShowStatusTypeQC(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddStatusTypeQC(var AIDStatusTypeQC : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusTypeQC, cAddAction, nil);
end;

function EditStatusTypeQC(AIDStatusTypeQC : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusTypeQC, cEditAction, nil);
end;

function DeleteStatusTypeQC(AIDStatusTypeQC : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusTypeQC, cDeleteAction, nil);
end;

procedure TGStatusTypeQCForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agStatusType);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  with ViewFrom.Controller do
    ef :=
      qFrom.Active and
      not qFrom.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aAddFrom.Enabled := e and ce and not del;
  aDelFrom.Enabled := ef and ce and not del;

  with ViewTo.Controller do
    et :=
      qTo.Active and
      not qTo.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aAddTo.Enabled := e and ce and not del;
  aDelTo.Enabled := et and ce and not del;

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

procedure TGStatusTypeQCForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGStatusTypeQCForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeQCForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGStatusTypeQCForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGStatusTypeQCForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteStatusTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeQCForm.aDelFromExecute(Sender: TObject);
  var
    vID, vRecNo : integer;
begin
  vRecNo := qFrom.RecNo;

  vID := qFrom.FieldByName('ID').AsInteger;

  qStatusTypeFrom.Close;
  qStatusTypeFrom.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
  qStatusTypeFrom.Open;
  if qStatusTypeFrom.Locate('ID', vID, []) then
    qStatusTypeFrom.Delete;
  qStatusTypeFrom.Close;

  qFrom.Refresh;
  qTo.Refresh;

  if qFrom.RecordCount <> 0 then
    qFrom.RecNo := vRecNo;
end;

procedure TGStatusTypeQCForm.aDelToExecute(Sender: TObject);
  var
    vID, vRecNo : integer;
begin
  vRecNo := qTo.RecNo;

  vID := qTo.FieldByName('ID').AsInteger;

  qStatusTypeTo.Close;
  qStatusTypeTo.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
  qStatusTypeTo.Open;
  if qStatusTypeTo.Locate('ID', vID, []) then
    qStatusTypeTo.Delete;
  qStatusTypeTo.Close;

  qTo.Refresh;
  qFrom.Refresh;

  if qTo.RecordCount <> 0 then
    qTo.RecNo := vRecNo;
end;

procedure TGStatusTypeQCForm.aEditExecute(Sender: TObject);
begin
  FModified := EditStatusTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeQCForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGStatusTypeQCForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteStatusTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeQCForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGStatusTypeQCForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;

  qFrom.Close;
  qFrom.ParamByName('D').AsInteger := cbDel.ItemIndex;
  qFrom.Open;

  qTo.Close;
  qTo.ParamByName('D').AsInteger := cbDel.ItemIndex;
  qTo.Open;
end;

procedure TGStatusTypeQCForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGStatusTypeQCForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGStatusTypeQCForm.TableViewStylesGetContentStyle(
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

function TGStatusTypeQCForm.UndoDeleteStatusTypeDialog: boolean;
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

procedure TGStatusTypeQCForm.ViewFromStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  vDeleted : boolean;
begin
  if not ARecord.IsData then Exit;

  Datas.DeletedRecordStyle.Color := DeletedRecordColor;

  vDeleted := IsNull(ARecord.Values[ViewFromDeleted.Index], 0) = 1;

  if vDeleted then AStyle := Datas.DeletedRecordStyle;
end;

procedure TGStatusTypeQCForm.ViewToStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  vDeleted : boolean;
begin
  if not ARecord.IsData then Exit;

  Datas.DeletedRecordStyle.Color := DeletedRecordColor;

  vDeleted := IsNull(ARecord.Values[ViewToDeleted.Index], 0) = 1;

  if vDeleted then AStyle := Datas.DeletedRecordStyle;
end;

procedure TGStatusTypeQCForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeQCForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeQCForm.pRightResize(Sender: TObject);
begin
  gbTop.Height := pRight.Height div 2;
end;

procedure TGStatusTypeQCForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddStatusTypeDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeQCForm.aAddFromExecute(Sender: TObject);
  var
    vID : TIntegerDynArray;
    vIDR, i : integer;
begin
  vIDR := qFrom.FieldByName('ID').AsInteger;

  if SelectStatusTypeQCMulti(vID) then
  begin
    qStatusTypeFrom.Close;
    qStatusTypeFrom.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
    qStatusTypeFrom.Open;
    for i := 0 to Length(vID) - 1 do
    begin
      if not qStatusTypeFrom.Locate('ID_StatusTypeQCFrom;ID_StatusTypeQCTo', VarArrayOf([vID[i], Query.FieldByName('ID').AsInteger]), []) then
      begin
        qStatusTypeFrom.Append;
        qStatusTypeFrom.FieldByName('ID_StatusTypeQCTo').AsInteger := Query.FieldByName('ID').AsInteger;
        qStatusTypeFrom.FieldByName('ID_StatusTypeQCFrom').AsInteger := vID[i];
        qStatusTypeFrom.Post;
      end;
    end;
    qStatusTypeFrom.Close;

    qFrom.Close;
    qFrom.Open;
    if Length(vID) > 0 then
      qFrom.Locate('ID_StatusTypeQCFrom', vID[0], [])
    else
      qFrom.Locate('ID', vIDR, []);

    qTo.Refresh;
  end;
end;

procedure TGStatusTypeQCForm.aAddToExecute(Sender: TObject);
  var
    vID : TIntegerDynArray;
    i, vIDR : integer;
begin
  vIDR := qTo.FieldByName('ID').AsInteger;
  if SelectStatusTypeQCMulti(vID) then
  begin
    qStatusTypeTo.Close;
    qStatusTypeTo.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
    qStatusTypeTo.Open;
    for i := 0 to Length(vID) - 1 do
    begin
      if not qStatusTypeTo.Locate('ID_StatusTypeQCTo', vID[i], []) then
      begin
        qStatusTypeTo.Append;
        qStatusTypeTo.FieldByName('ID_StatusTypeQCTo').AsInteger := vID[i];
        qStatusTypeTo.FieldByName('ID_StatusTypeQCFrom').AsInteger := Query.FieldByName('ID').AsInteger;
        qStatusTypeTo.Post;
      end;
    end;
    qStatusTypeTo.Close;

    qTo.Close;
    qTo.Open;
    if Length(vID) > 0 then
      qTo.Locate('ID_StatusTypeQCTo', vID[0], [])
    else
      qTo.Locate('ID', vIDR, []);

    qFrom.Refresh;
  end;
end;

procedure TGStatusTypeQCForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGStatusTypeQCForm.AddStatusTypeDialog(var IDStatusType: integer): boolean;
  var
    vName, vComment : string;
    vColor, vStatusOrder, vDefStatus, vFinStatus, vEndStatus, vActive : integer;
begin
  vActive := 1;
  vName := '';
  vStatusOrder := 0;
  vColor := clNone;
  vDefStatus := 0;
  vFinStatus := 0;
  vEndStatus := 0;
  vComment := '';

  Result :=
    GetStatusTypeQCParams(
      vActive,
      vName,
      vColor,
      vStatusOrder,
      vDefStatus,
      vFinStatus,
      vEndStatus,
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
      FieldByName('StatusOrder').AsInteger := vStatusOrder;
      FieldByName('Color').AsInteger := vColor;
      FieldByName('DefStatus').AsInteger := vDefStatus;
      FieldByName('FinStatus').AsInteger := vFinStatus;
      FieldByName('EndStatus').AsInteger := vEndStatus;

      FieldByName('Comment').AsString := vComment;

      Post;
      IDStatusType := FieldByName('ID').AsInteger;
      Close;

      if vDefStatus = 1 then
        UDatas.ExecSQL('update StatusTypeQC set defStatus = 0 where ID <> ' + IntToStr(IDStatusType));

      Query.Refresh;

      Query.Locate('ID', IDStatusType, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGStatusTypeQCForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGStatusTypeQCForm.DeleteStatusTypeDialog: boolean;
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

function TGStatusTypeQCForm.EditStatusTypeDialog: boolean;
  var
    vName, vComment : string;
    vColor, vStatusOrder, vDefStatus, vFinStatus, vEndStatus, vActive, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vName := FieldByName('Name').AsString;
    vStatusOrder := FieldByName('StatusOrder').AsInteger;
    vColor := FieldByName('Color').AsInteger;
    vDefStatus := FieldByName('DefStatus').AsInteger;
    vFinStatus := FieldByName('FinStatus').AsInteger;
    vEndStatus := FieldByName('EndStatus').AsInteger;
    vComment := FieldByName('Comment').AsString;

    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetStatusTypeQCParams(
      vActive,
      vName,
      vColor,
      vStatusOrder,
      vDefStatus,
      vFinStatus,
      vEndStatus,
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
      FieldByName('StatusOrder').AsInteger := vStatusOrder;
      FieldByName('Color').AsInteger := vColor;
      FieldByName('DefStatus').AsInteger := vDefStatus;
      FieldByName('FinStatus').AsInteger := vFinStatus;
      FieldByName('EndStatus').AsInteger := vEndStatus;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      if vDefStatus = 1 then
        UDatas.ExecSQL('update StatusTypeQC set defStatus = 0 where ID <> ' + IntToStr(vID));

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGStatusTypeQCForm.ExistsStatusType(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGStatusTypeQCForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
