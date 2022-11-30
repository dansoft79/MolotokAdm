//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Скидки
//
//------------------------------------------------------------------------------
unit UGDiscountType;

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
  TGDiscountTypeForm = class(TForm)
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
    TableViewActive: TcxGridDBColumn;
    QueryComment: TWideStringField;
    QueryFromDate: TDateTimeField;
    QueryToDate: TDateTimeField;
    QueryPromocode: TWideStringField;
    QueryDiscountType: TSmallintField;
    QueryDiscountSize: TFloatField;
    QueryMinOrderSum: TFloatField;
    QueryDebtType: TSmallintField;
    QuerySubType: TIntegerField;
    QueryCanAdd: TSmallintField;
    TableViewFromDate: TcxGridDBColumn;
    TableViewToDate: TcxGridDBColumn;
    TableViewPromocode: TcxGridDBColumn;
    TableViewMinOrderSum: TcxGridDBColumn;
    TableViewDebtType: TcxGridDBColumn;
    TableViewSubType: TcxGridDBColumn;
    TableViewCanAdd: TcxGridDBColumn;
    QueryDiscountInfo: TStringField;
    TableViewDiscountInfo: TcxGridDBColumn;
    QueryDTInfo: TWideStringField;
    QueryDDTInfo: TWideStringField;
    QueryDSTInfo: TWideStringField;
    gbEmployee: TcxGroupBox;
    GridWorkType: TcxGrid;
    ViewWorkType: TcxGridDBTableView;
    LevelWorkType: TcxGridLevel;
    BarDockControlSnap: TdxBarDockControl;
    Splitter: TcxSplitter;
    qDiscountWorkType: TZQuery;
    dsDiscountWorkType: TDataSource;
    tDiscountWorkType: TZQuery;
    BarManagerBar2: TdxBar;
    aAddWorkType: TAction;
    aDelWorkType: TAction;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    aSelectAll: TAction;
    aClearSelection: TAction;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    qDiscountWorkTypeWTInfo: TWideStringField;
    qDiscountWorkTypeWCInfo: TWideStringField;
    qDiscountWorkTypeID: TIntegerField;
    ViewWorkTypeWTInfo: TcxGridDBColumn;
    ViewWorkTypeWCInfo: TcxGridDBColumn;
    ViewWorkTypeID: TcxGridDBColumn;
    qDiscountWorkTypeID_DiscountType: TSmallintField;
    qDiscountWorkTypeID_WorkType: TSmallintField;
    QueryAllWorkType: TSmallintField;
    TableViewAllWorkType: TcxGridDBColumn;
    qDiscountWorkTypeWCTag: TWideStringField;
    qDiscountWorkTypeCode: TWideStringField;
    qDiscountWorkTypePrice: TFloatField;
    ViewWorkTypeWCTag: TcxGridDBColumn;
    ViewWorkTypeCode: TcxGridDBColumn;
    ViewWorkTypePrice: TcxGridDBColumn;
    PopupMenuWork: TcxGridPopupMenu;
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
    procedure aAddWorkTypeExecute(Sender: TObject);
    procedure aDelWorkTypeExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aClearSelectionExecute(Sender: TObject);
    procedure QueryCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddDiscountTypeDialog(var IDDiscountType : integer) : boolean;
    function EditDiscountTypeDialog : boolean;
    function DeleteDiscountTypeDialog : boolean;
    function UndoDeleteDiscountTypeDialog : boolean;
    function ExistsDiscountType(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowDiscountType(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddDiscountType(var AIDDiscountType : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditDiscountType(AIDDiscountType : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteDiscountType(AIDDiscountType : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  types, UOptions, UDatas, UGDiscountTypeParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree, USelectWorkTypeMulti;

function DoAction(var AIDDiscountType : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGDiscountTypeForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGDiscountTypeForm) then
  begin
    with FindForm(TGDiscountTypeForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGDiscountTypeForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    qDiscountWorkType.Open;
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
        Result := AddDiscountTypeDialog(AIDDiscountType);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDDiscountType, []);
          Result := EditDiscountTypeDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDDiscountType, []);
            Result := DeleteDiscountTypeDialog;
            Close;
          end;
  end;
end;

function ShowDiscountType(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddDiscountType(var AIDDiscountType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDDiscountType, cAddAction, nil);
end;

function EditDiscountType(AIDDiscountType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDDiscountType, cEditAction, nil);
end;

function DeleteDiscountType(AIDDiscountType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDDiscountType, cDeleteAction, nil);
end;

procedure TGDiscountTypeForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agDiscountType);

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

procedure TGDiscountTypeForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGDiscountTypeForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGDiscountTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);

  TableView.StoreToIniFile(cIniFileName, false);
  ViewWorkType.StoreToIniFile(cIniFileName, false);

  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGDiscountTypeForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableView.RestoreFromIniFile(cIniFileName);
  ViewWorkType.RestoreFromIniFile(cIniFileName);

  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGDiscountTypeForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteDiscountTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGDiscountTypeForm.aDelWorkTypeExecute(Sender: TObject);
  var
    vID, i : integer;
begin
  for i := 0 to ViewWorkType.Controller.SelectedRecordCount - 1 do
    if ViewWorkType.Controller.SelectedRecords[i].IsData then
    begin
      vID := IsNull(ViewWorkType.Controller.SelectedRecords[i].Values[ViewWorkTypeID.Index], 0);
      tDiscountWorkType.Close;
      tDiscountWorkType.ParamByName('ID').AsInteger := vID;
      tDiscountWorkType.Open;
      if tDiscountWorkType.RecordCount = 1 then
          tDiscountWorkType.Delete;
      tDiscountWorkType.Close;
    end;

  Query.Refresh;

  ViewWorkType.DataController.ClearSelection;

  qDiscountWorkType.Refresh;
end;

procedure TGDiscountTypeForm.aEditExecute(Sender: TObject);
begin
  FModified := EditDiscountTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGDiscountTypeForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGDiscountTypeForm.aSelectAllExecute(Sender: TObject);
begin
  ViewWorkType.DataController.SelectAll;
end;

procedure TGDiscountTypeForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteDiscountTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGDiscountTypeForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGDiscountTypeForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGDiscountTypeForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGDiscountTypeForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGDiscountTypeForm.TableViewStylesGetContentStyle(
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

function TGDiscountTypeForm.UndoDeleteDiscountTypeDialog: boolean;
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

procedure TGDiscountTypeForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGDiscountTypeForm.QueryCalcFields(DataSet: TDataSet);
  var
    s : string;
begin
  s := Dataset.FieldByName('Size').AsString;
  case Dataset.FieldByName('Type').AsInteger of
    0 : s := s + ' %';
    1 : s := s + ' р.';
  end;

  Dataset.FieldByName('DiscountInfo').AsString := s;
end;

procedure TGDiscountTypeForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGDiscountTypeForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddDiscountTypeDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGDiscountTypeForm.aAddWorkTypeExecute(Sender: TObject);
  var
    vID : TIntegerDynArray;
    v : variant;
    vIDWorkerClass, i : integer;
begin
  if SelectWorkTypeMulti(vID) then
  begin
    for i := 0 to Length(vID) - 1 do
    begin
      if not qDiscountWorkType.Locate('ID_WorkType', vID[i], []) then
      begin
        tDiscountWorkType.Close;
        tDiscountWorkType.Open;
        tDiscountWorkType.Append;
        tDiscountWorkType.FieldByName('ID_WorkType').AsInteger := vID[i];
        tDiscountWorkType.FieldByName('ID_DiscountType').AsInteger := Query.FieldByName('ID').AsInteger;
        tDiscountWorkType.Post;
        tDiscountWorkType.Close;
      end;
    end;

    Query.Refresh;
    qDiscountWorkType.Refresh;
  end;
end;

procedure TGDiscountTypeForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TGDiscountTypeForm.aClearSelectionExecute(Sender: TObject);
begin
  ViewWorkType.DataController.ClearSelection;
end;

function TGDiscountTypeForm.AddDiscountTypeDialog(var IDDiscountType: integer): boolean;
  var
    vName, vComment : string;
    vCanAdd, vSubType, vDebtType, vType, vActive : integer;
    vPromocode, vFromDate, vToDate : string;
    vSize, vMinOrderSum : double;
begin
  vActive := 1;
  vName := '';
  vComment := '';
  vFromDate := '';
  vToDate := '';
  vPromocode := '';
  vType := -1;
  vSize := 0;
  vMinOrderSum := 0;
  vDebtType := -1;
  vSubType := -1;
  vCanAdd := 0;


  Result :=
    GetDiscountTypeParams(
      vActive,
      vName,
      vComment,
      vFromDate,
      vToDate,
      vPromocode,
      vType,
      vSize,
      vMinOrderSum,
      vDebtType,
      vSubType,
      vCanAdd,
      0
      );

  if Result then
  begin
    if ExistsDiscountType(vName, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('Comment').AsString := vComment;

      FieldByName('FromDate').AsString := vFromDate;
      FieldByName('ToDate').AsString := vToDate;
      FieldByName('Promocode').AsString := vPromocode;
      FieldByName('Type').AsInteger := vType;
      FieldByName('Size').AsFloat := vSize;
      FieldByName('MinOrderSum').AsFloat := vMinOrderSum;
      FieldByName('DebtType').AsInteger := vDebtType;
      FieldByName('SubType').AsInteger := vSubType;
      FieldByName('CanAdd').AsInteger := vCanAdd;

      Post;
      IDDiscountType := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDDiscountType, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGDiscountTypeForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGDiscountTypeForm.DeleteDiscountTypeDialog: boolean;
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

function TGDiscountTypeForm.EditDiscountTypeDialog: boolean;
  var
    vName, vComment : string;
    vActive, vID : integer;
    vCanAdd, vSubType, vDebtType, vType : integer;
    vPromocode, vFromDate, vToDate : string;
    vSize, vMinOrderSum : double;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vName := FieldByName('Name').AsString;
    vComment := FieldByName('Comment').AsString;

    vFromDate := FieldByName('FromDate').AsString;
    vToDate := FieldByName('ToDate').AsString;
    vPromocode := FieldByName('Promocode').AsString;
    vType := FieldByName('Type').AsInteger;
    vSize := FieldByName('Size').AsFloat;
    vMinOrderSum := FieldByName('MinOrderSum').AsFloat;
    vDebtType := FieldByName('DebtType').AsInteger;
    vSubType := FieldByName('SubType').AsInteger;
    vCanAdd := FieldByName('CanAdd').AsInteger;

    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetDiscountTypeParams(
      vActive,
      vName,
      vComment,
      vFromDate,
      vToDate,
      vPromocode,
      vType,
      vSize,
      vMinOrderSum,
      vDebtType,
      vSubType,
      vCanAdd,
      vID
      );

  if Result then
  begin
    if ExistsDiscountType(vName, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID').Value := FieldByName('ID').Value;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;

      FieldByName('Name').AsString := vName;
      FieldByName('Comment').AsString := vComment;

      FieldByName('FromDate').AsString := vFromDate;
      FieldByName('ToDate').AsString := vToDate;
      FieldByName('Promocode').AsString := vPromocode;
      FieldByName('Type').AsInteger := vType;
      FieldByName('Size').AsFloat := vSize;
      FieldByName('MinOrderSum').AsFloat := vMinOrderSum;
      FieldByName('DebtType').AsInteger := vDebtType;
      FieldByName('SubType').AsInteger := vSubType;
      FieldByName('CanAdd').AsInteger := vCanAdd;

      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGDiscountTypeForm.ExistsDiscountType(AName: string; AIDExclude : integer): boolean;
begin
  Result := False;
{  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;}
end;

procedure TGDiscountTypeForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
