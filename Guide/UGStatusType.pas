//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Статусы заявок
//
//------------------------------------------------------------------------------
unit UGStatusType;

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
  dxDockControl, dxDockPanel, cxCustomListBox, cxListBox;

type
  TGStatusTypeForm = class(TForm)
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
    QueryNamePublic: TWideStringField;
    QueryStatusOrder: TIntegerField;
    QueryDefStatus: TSmallintField;
    QueryFinStatus: TSmallintField;
    TableViewNamePublic: TcxGridDBColumn;
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
    QueryWorkerVisible: TSmallintField;
    QueryWorkerSetup: TSmallintField;
    TableViewWorkerVisible: TcxGridDBColumn;
    TableViewWorkerSetup: TcxGridDBColumn;
    pmFrom: TcxGridPopupMenu;
    pmTo: TcxGridPopupMenu;
    QueryTrimTime: TSmallintField;
    QueryShowCancelButton: TSmallintField;
    QueryShowPayButton: TSmallintField;
    QueryShowWarrantyButton: TSmallintField;
    TableViewTrimTime: TcxGridDBColumn;
    TableViewShowCancelButton: TcxGridDBColumn;
    TableViewShowPayButton: TcxGridDBColumn;
    TableViewShowWarrantyButton: TcxGridDBColumn;
    QueryNeedCall: TSmallintField;
    TableViewNeedCall: TcxGridDBColumn;
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
function ShowStatusType(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddStatusType(var AIDStatusType : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditStatusType(AIDStatusType : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteStatusType(AIDStatusType : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses types,
  UOptions, UDatas, UGStatusTypeParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree, USelectStatusTypeMulti;

function DoAction(var AIDStatusType : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGStatusTypeForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGStatusTypeForm) then
  begin
    with FindForm(TGStatusTypeForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGStatusTypeForm.Create(Application);
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
        Result := AddStatusTypeDialog(AIDStatusType);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDStatusType, []);
          Result := EditStatusTypeDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDStatusType, []);
            Result := DeleteStatusTypeDialog;
            Close;
          end;
  end;
end;

function ShowStatusType(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddStatusType(var AIDStatusType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusType, cAddAction, nil);
end;

function EditStatusType(AIDStatusType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusType, cEditAction, nil);
end;

function DeleteStatusType(AIDStatusType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDStatusType, cDeleteAction, nil);
end;

procedure TGStatusTypeForm.SetEnabledButtons;
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

procedure TGStatusTypeForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGStatusTypeForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGStatusTypeForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGStatusTypeForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteStatusTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeForm.aDelFromExecute(Sender: TObject);
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

procedure TGStatusTypeForm.aDelToExecute(Sender: TObject);
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

procedure TGStatusTypeForm.aEditExecute(Sender: TObject);
begin
  FModified := EditStatusTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGStatusTypeForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteStatusTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGStatusTypeForm.cbDelChange(Sender: TObject);
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

procedure TGStatusTypeForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGStatusTypeForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGStatusTypeForm.TableViewStylesGetContentStyle(
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

function TGStatusTypeForm.UndoDeleteStatusTypeDialog: boolean;
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

procedure TGStatusTypeForm.ViewFromStylesGetContentStyle(
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

procedure TGStatusTypeForm.ViewToStylesGetContentStyle(
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

procedure TGStatusTypeForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGStatusTypeForm.pRightResize(Sender: TObject);
begin
  gbTop.Height := pRight.Height div 2;
end;

procedure TGStatusTypeForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddStatusTypeDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGStatusTypeForm.aAddFromExecute(Sender: TObject);
  var
    vID : TIntegerDynArray;
    vIDR, i : integer;
begin
  vIDR := qFrom.FieldByName('ID').AsInteger;

  if SelectStatusTypeMulti(vID) then
  begin
    qStatusTypeFrom.Close;
    qStatusTypeFrom.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
    qStatusTypeFrom.Open;
    for i := 0 to Length(vID) - 1 do
    begin
      if not qStatusTypeFrom.Locate('ID_StatusTypeFrom;ID_StatusTypeTo', VarArrayOf([vID[i], Query.FieldByName('ID').AsInteger]), []) then
      begin
        qStatusTypeFrom.Append;
        qStatusTypeFrom.FieldByName('ID_StatusTypeTo').AsInteger := Query.FieldByName('ID').AsInteger;
        qStatusTypeFrom.FieldByName('ID_StatusTypeFrom').AsInteger := vID[i];
        qStatusTypeFrom.Post;
      end;
    end;
    qStatusTypeFrom.Close;

    qFrom.Close;
    qFrom.Open;
    if Length(vID) > 0 then
      qFrom.Locate('ID_StatusTypeFrom', vID[0], [])
    else
      qFrom.Locate('ID', vIDR, []);

    qTo.Refresh;
  end;
end;

procedure TGStatusTypeForm.aAddToExecute(Sender: TObject);
  var
    vID : TIntegerDynArray;
    i, vIDR : integer;
begin
  vIDR := qTo.FieldByName('ID').AsInteger;
  if SelectStatusTypeMulti(vID) then
  begin
    qStatusTypeTo.Close;
    qStatusTypeTo.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
    qStatusTypeTo.Open;
    for i := 0 to Length(vID) - 1 do
    begin
      if not qStatusTypeTo.Locate('ID_StatusTypeTo', vID[i], []) then
      begin
        qStatusTypeTo.Append;
        qStatusTypeTo.FieldByName('ID_StatusTypeTo').AsInteger := vID[i];
        qStatusTypeTo.FieldByName('ID_StatusTypeFrom').AsInteger := Query.FieldByName('ID').AsInteger;
        qStatusTypeTo.Post;
      end;
    end;
    qStatusTypeTo.Close;

    qTo.Close;
    qTo.Open;
    if Length(vID) > 0 then
      qTo.Locate('ID_StatusTypeTo', vID[0], [])
    else
      qTo.Locate('ID', vIDR, []);

    qFrom.Refresh;
  end;
end;

procedure TGStatusTypeForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGStatusTypeForm.AddStatusTypeDialog(var IDStatusType: integer): boolean;
  var
    vName, vNamePublic, vComment : string;
    vColor, vStatusOrder, vDefStatus, vFinStatus, vWorkerVisible, vWorkerSetup, vActive : integer;
    vTrimTime, vShowCancelButton, vShowPayButton, vShowWarrantyButton : integer;
    vNeedCall : integer;
begin
  vActive := 1;
  vName := '';
  vNamePublic := '';
  vStatusOrder := 0;
  vColor := clNone;
  vDefStatus := 0;
  vFinStatus := 0;
  vWorkerVisible := 0;
  vWorkerSetup := 0;
  vTrimTime := 0;
  vShowCancelButton := 0;
  vShowPayButton := 0;
  vShowWarrantyButton := 0;
  vNeedCall := 0;
  vComment := '';

  Result :=
    GetStatusTypeParams(
      vActive,
      vName,
      vNamePublic,
      vColor,
      vStatusOrder,
      vDefStatus,
      vFinStatus,
      vWorkerVisible,
      vWorkerSetup,
      vTrimTime,
      vShowCancelButton,
      vShowPayButton,
      vShowWarrantyButton,
      vNeedCall,
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
      FieldByName('NamePublic').AsString := vNamePublic;
      FieldByName('StatusOrder').AsInteger := vStatusOrder;
      FieldByName('Color').AsInteger := vColor;
      FieldByName('DefStatus').AsInteger := vDefStatus;
      FieldByName('FinStatus').AsInteger := vFinStatus;

      FieldByName('WorkerVisible').AsInteger := vWorkerVisible;
      FieldByName('WorkerSetup').AsInteger := vWorkerSetup;

      FieldByName('TrimTime').AsInteger := vTrimTime;
      FieldByName('ShowCancelButton').AsInteger := vShowCancelButton;
      FieldByName('ShowPayButton').AsInteger := vShowPayButton;
      FieldByName('ShowWarrantyButton').AsInteger := vShowWarrantyButton;
      FieldByName('NeedCall').AsInteger := vNeedCall;

      vShowPayButton := 0;
      vShowWarrantyButton := 0;

      FieldByName('Comment').AsString := vComment;
      Post;
      IDStatusType := FieldByName('ID').AsInteger;
      Close;

      if vDefStatus = 1 then
        UDatas.ExecSQL('update StatusType set defStatus = 0 where ID <> ' + IntToStr(IDStatusType));

      if vFinStatus = 1 then
        UDatas.ExecSQL('update StatusType set finStatus = 0 where ID <> ' + IntToStr(IDStatusType));

      Query.Refresh;

      Query.Locate('ID', IDStatusType, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGStatusTypeForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGStatusTypeForm.DeleteStatusTypeDialog: boolean;
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

function TGStatusTypeForm.EditStatusTypeDialog: boolean;
  var
    vName, vNamePublic, vComment : string;
    vColor, vStatusOrder, vDefStatus, vFinStatus, vWorkerVisible, vWorkerSetup, vActive, vID : integer;
    vTrimTime, vShowCancelButton, vShowPayButton, vShowWarrantyButton : integer;
    vNeedCall : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vName := FieldByName('Name').AsString;
    vNamePublic := FieldByName('NamePublic').AsString;
    vStatusOrder := FieldByName('StatusOrder').AsInteger;
    vColor := FieldByName('Color').AsInteger;
    vDefStatus := FieldByName('DefStatus').AsInteger;
    vFinStatus := FieldByName('FinStatus').AsInteger;
    vWorkerVisible := FieldByName('WorkerVisible').AsInteger;
    vWorkerSetup := FieldByName('WorkerSetup').AsInteger;

    vTrimTime := FieldByName('TrimTime').AsInteger;
    vShowCancelButton := FieldByName('ShowCancelButton').AsInteger;
    vShowPayButton := FieldByName('ShowPayButton').AsInteger;
    vShowWarrantyButton := FieldByName('ShowWarrantyButton').AsInteger;
    vNeedCall := FieldByName('NeedCall').AsInteger;

    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetStatusTypeParams(
      vActive,
      vName,
      vNamePublic,
      vColor,
      vStatusOrder,
      vDefStatus,
      vFinStatus,
      vWorkerVisible,
      vWorkerSetup,
      vTrimTime,
      vShowCancelButton,
      vShowPayButton,
      vShowWarrantyButton,
      vNeedCall,
      vComment);

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
      FieldByName('NamePublic').AsString := vNamePublic;
      FieldByName('StatusOrder').AsInteger := vStatusOrder;
      FieldByName('Color').AsInteger := vColor;
      FieldByName('DefStatus').AsInteger := vDefStatus;
      FieldByName('FinStatus').AsInteger := vFinStatus;
      FieldByName('WorkerVisible').AsInteger := vWorkerVisible;
      FieldByName('WorkerSetup').AsInteger := vWorkerSetup;

      FieldByName('TrimTime').AsInteger := vTrimTime;
      FieldByName('ShowCancelButton').AsInteger := vShowCancelButton;
      FieldByName('ShowPayButton').AsInteger := vShowPayButton;
      FieldByName('ShowWarrantyButton').AsInteger := vShowWarrantyButton;

      FieldByName('NeedCall').AsInteger := vNeedCall;

      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      if vDefStatus = 1 then
        UDatas.ExecSQL('update StatusType set defStatus = 0 where ID <> ' + IntToStr(vID));

      if vFinStatus = 1 then
        UDatas.ExecSQL('update StatusType set finStatus = 0 where ID <> ' + IntToStr(vID));

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGStatusTypeForm.ExistsStatusType(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGStatusTypeForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
