//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Отпуска/отгулы/рабочие дни
//
//------------------------------------------------------------------------------
unit UGWorkRestDay;

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
  TGWorkRestDayForm = class(TForm)
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
    TableViewComment: TcxGridDBColumn;
    PopupMenu: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
    TableViewActive: TcxGridDBColumn;
    QueryID_Worker: TSmallintField;
    QueryDateType: TSmallintField;
    QueryFromDate: TDateTimeField;
    QueryToDate: TDateTimeField;
    QueryWorkTime: TWideStringField;
    QueryWorkerInfo: TWideStringField;
    TableViewFromDate: TcxGridDBColumn;
    TableViewToDate: TcxGridDBColumn;
    TableViewWorkTime: TcxGridDBColumn;
    TableViewWorkerInfo: TcxGridDBColumn;
    QueryDTInfo: TWideStringField;
    TableViewDTInfo: TcxGridDBColumn;
    QueryID: TIntegerField;
    QueryComment: TWideStringField;
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
    FIDWorker : integer;
    procedure SetEnabledButtons;
    function AddWorkRestDayDialog(var IDWorkRestDay : integer) : boolean;
    function EditWorkRestDayDialog : boolean;
    function DeleteWorkRestDayDialog : boolean;
    function UndoDeleteWorkRestDayDialog : boolean;
    function ExistsWorkRestDay(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowWorkRestDay(AIDWorker : integer; AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddWorkRestDay(AIDWorker : integer; var AIDWorkRestDay : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditWorkRestDay(AIDWorker : integer; AIDWorkRestDay : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteWorkRestDay(AIDWorker : integer; AIDWorkRestDay : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGWorkRestDayParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  UGWorker, MainUnit, UPermitTree;

var
  vAction : string = '';

function DoAction(AIDWorker : integer; var AIDWorkRestDay : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGWorkRestDayForm;
begin
  vAction := AAction;
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGWorkRestDayForm) then
  begin
    with FindForm(TGWorkRestDayForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGWorkRestDayForm.Create(Application);
  with vForm do
  begin
    FIDWorker := AIDWorker;

    ShowWaiting(cDataGetting);
    Query.Close;
    Query.ParamByName('IDW').AsInteger := AIDWorker;
    Query.Open;
    HideWaiting;

    FModified := false;
    Result := false;
    if AAction = cOpenAction then
    begin
      Caption := Caption + ' (' + Datas.ReadValuesSQL('select workerinfo(' + IntToStr(AIDWorker) + ') as WInfo', 'WInfo')[0] + ')';
      Tag := MaxMDITag(ClassType) + 1;
      if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
      Name := Name + IntToStr(Tag);

      RegisterFloatingForm(vForm, AParentAction, Caption);
      Show;
    end
    else
      if AAction = cAddAction then
      begin
        Result := AddWorkRestDayDialog(AIDWorkRestDay);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDWorkRestDay, []);
          Result := EditWorkRestDayDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDWorkRestDay, []);
            Result := DeleteWorkRestDayDialog;
            Close;
          end;
  end;
end;

function ShowWorkRestDay(AIDWorker : integer; AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(AIDWorker, n, cOpenAction, AParentAction);
end;

function AddWorkRestDay(AIDWorker : integer; var AIDWorkRestDay : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorker, AIDWorkRestDay, cAddAction, nil);
end;

function EditWorkRestDay(AIDWorker : integer; AIDWorkRestDay : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorker, AIDWorkRestDay, cEditAction, nil);
end;

function DeleteWorkRestDay(AIDWorker : integer; AIDWorkRestDay : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorker, AIDWorkRestDay, cDeleteAction, nil);
end;

procedure TGWorkRestDayForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agWorkRestDay);

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

procedure TGWorkRestDayForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGWorkRestDayForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGWorkRestDayForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if vAction = cOpenAction then
  begin
    PrepareFormName(self); PropertiesStore.StoreTo(false);
    TableView.StoreToIniFile(cIniFileName, false);
    BarManager.SaveToIniFile(cIniFileNameToolbar);
  end;

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGWorkRestDayForm.FormCreate(Sender: TObject);
begin
  if vAction = cOpenAction then
  begin
    PropertiesStore.StorageName := cIniFileName;
    PropertiesStore.RestoreFrom;
    TableView.RestoreFromIniFile(cIniFileName);
    try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
  end
end;

procedure TGWorkRestDayForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteWorkRestDayDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkRestDayForm.aEditExecute(Sender: TObject);
begin
  FModified := EditWorkRestDayDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkRestDayForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGWorkRestDayForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteWorkRestDayDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkRestDayForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGWorkRestDayForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGWorkRestDayForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkRestDayForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkRestDayForm.TableViewStylesGetContentStyle(
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

function TGWorkRestDayForm.UndoDeleteWorkRestDayDialog: boolean;
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

procedure TGWorkRestDayForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGWorkRestDayForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGWorkRestDayForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddWorkRestDayDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGWorkRestDayForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGWorkRestDayForm.AddWorkRestDayDialog(var IDWorkRestDay: integer): boolean;
  var
    vFromDate, vToDate, vWorkTime, vComment : string;
    vDateType, vActive : integer;
begin
  vActive := 1;
  vDateType := 1;
  vFromDate := DateToStr(Date);
  vToDate := DateToStr(Date);;
  vWorkTime := '';
  vComment := '';

  Result :=
    GetWorkRestDayParams(
      vActive,
      vDateType,
      vFromDate,
      vToDate,
      vWorkTime,
      vComment
      );

  if Result then
  begin
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := 0;
      Open;
      Append;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('Deleted').AsInteger := 0;

      FieldByName('ID_Worker').AsInteger := FIDWorker;
      FieldByName('DateType').AsInteger := vDateType;
      FieldByName('FromDate').AsString := vFromDate;
      FieldByName('ToDate').AsString := vToDate;
      FieldByName('WorkTime').AsString := vWorkTime;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDWorkRestDay := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDWorkRestDay, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGWorkRestDayForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGWorkRestDayForm.DeleteWorkRestDayDialog: boolean;
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

function TGWorkRestDayForm.EditWorkRestDayDialog: boolean;
  var
    vFromDate, vToDate, vWorkTime, vComment : string;
    vDateType, vActive, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;

    vDateType := FieldByName('DateType').AsInteger;
    vFromDate := FieldByName('FromDate').AsString;
    vToDate := FieldByName('ToDate').AsString;
    vWorkTime := FieldByName('WorkTime').AsString;
    vComment := FieldByName('Comment').AsString;

    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetWorkRestDayParams(
      vActive,
      vDateType,
      vFromDate,
      vToDate,
      vWorkTime,
      vComment
      );

  if Result then
  begin
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID').Value := FieldByName('ID').Value;
      FieldByName('ID_AssertUser').AsInteger := UserID;

      FieldByName('Active').AsInteger := vActive;
      FieldByName('ID_Worker').AsInteger := FIDWorker;
      FieldByName('DateType').AsInteger := vDateType;
      FieldByName('FromDate').AsString := vFromDate;
      FieldByName('ToDate').AsString := vToDate;
      FieldByName('WorkTime').AsString := vWorkTime;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGWorkRestDayForm.ExistsWorkRestDay(AName: string; AIDExclude : integer): boolean;
begin
  Result := False;
{  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;}
end;

procedure TGWorkRestDayForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
