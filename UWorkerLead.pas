//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Лиды исполнителей
//
//------------------------------------------------------------------------------
unit UWorkerLead;

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
  GridsEh, DBAxisGridsEh, DBGridEh, PropFilerEh, PropStorageEh,
  dxScrollbarAnnotations;

type
  TWorkerLeadForm = class(TForm)
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
    TableViewComment: TcxGridDBColumn;
    Level: TcxGridLevel;
    QueryAssertUser: TWideStringField;
    QueryID: TSmallintField;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryComment: TWideStringField;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    dxBarPopupMenu: TdxBarPopupMenu;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
    QueryID_WorkClass: TSmallintField;
    QueryPhone: TWideStringField;
    QueryInfo: TWideStringField;
    QueryWCInfo: TWideStringField;
    TableViewPhone: TcxGridDBColumn;
    TableViewInfo: TcxGridDBColumn;
    TableViewWCInfo: TcxGridDBColumn;
    aStatusTypeLead: TAction;
    dxBarButton6: TdxBarButton;
    QueryID_StatusTypeLead: TSmallintField;
    QueryFIO: TWideStringField;
    QueryID_DistrictLive: TSmallintField;
    QueryLeadDateTime: TDateTimeField;
    QueryLeadDateTimeComment: TWideStringField;
    QueryDistrInfo: TWideStringField;
    QueryStatusTypeInfo: TWideStringField;
    TableViewFIO: TcxGridDBColumn;
    TableViewLeadDateTime: TcxGridDBColumn;
    TableViewLeadDateTimeComment: TcxGridDBColumn;
    TableViewDistrInfo: TcxGridDBColumn;
    TableViewStatusTypeInfo: TcxGridDBColumn;
    TableViewActive: TcxGridDBColumn;
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
    procedure aStatusTypeLeadExecute(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddWorkerLeadDialog(var IDWorkerLead : integer) : boolean;
    function EditWorkerLeadDialog : boolean;
    function DeleteWorkerLeadDialog : boolean;
    function UndoDeleteWorkerLeadDialog : boolean;

    function IDExists(AID: integer): boolean;

    function ExistsRecord(APhone : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowWorkerLead(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddWorkerLead(var AIDWorkerLead : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditWorkerLead(AIDWorkerLead : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteWorkerLead(AIDWorkerLead : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UWorkerLeadParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, Jpeg, UGStatusTypeLead;

function DoAction(var AIDWorkerLead : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TWorkerLeadForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TWorkerLeadForm) then
  begin
    with FindForm(TWorkerLeadForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TWorkerLeadForm.Create(Application);
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
        Result := AddWorkerLeadDialog(AIDWorkerLead);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDWorkerLead, []);
          Result := EditWorkerLeadDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDWorkerLead, []);
            Result := DeleteWorkerLeadDialog;
            Close;
          end;
  end;
end;

function ShowWorkerLead(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddWorkerLead(var AIDWorkerLead : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkerLead, cAddAction, nil);
end;

function EditWorkerLead(AIDWorkerLead : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkerLead, cEditAction, nil);
end;

function DeleteWorkerLead(AIDWorkerLead : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkerLead, cDeleteAction, nil);
end;

procedure TWorkerLeadForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.aaWorkerLead);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  aStatusTypeLead.Enabled := true;

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

procedure TWorkerLeadForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TWorkerLeadForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TWorkerLeadForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TWorkerLeadForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TWorkerLeadForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteWorkerLeadDialog or FModified;
  SetEnabledButtons;
end;

procedure TWorkerLeadForm.aEditExecute(Sender: TObject);
begin
  FModified := EditWorkerLeadDialog or FModified;
  SetEnabledButtons;
end;

procedure TWorkerLeadForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TWorkerLeadForm.aStatusTypeLeadExecute(Sender: TObject);
begin
  ShowStatusTypeLead(aStatusTypeLead);
end;

procedure TWorkerLeadForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteWorkerLeadDialog or FModified;
  SetEnabledButtons;
end;

procedure TWorkerLeadForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TWorkerLeadForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TWorkerLeadForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TWorkerLeadForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TWorkerLeadForm.TableViewStylesGetContentStyle(
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

function TWorkerLeadForm.UndoDeleteWorkerLeadDialog: boolean;
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

procedure TWorkerLeadForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TWorkerLeadForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

function TWorkerLeadForm.IDExists(AID: integer): boolean;
begin
  ShowWaiting(cDataGetting);
  try
    Result := false//Datas.UsedData('WorkerLead', AID);
  finally
    HideWaiting;
  end;
end;

procedure TWorkerLeadForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddWorkerLeadDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TWorkerLeadForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TWorkerLeadForm.AddWorkerLeadDialog(var IDWorkerLead: integer): boolean;
  var
    vPhone, vInfo, vFIO, vComment, vLeadDateTime, vLeadDateTimeComment : string;
    vActive, vIDWorkClass, vIDDistrict, vIDStatusTypeLead : integer;
begin
  vActive := 1;

  vIDStatusTypeLEad := IsNUll(Datas.ReadValuesSQL('select ID from StatusTypeLead where DefStatus = 1 limit 1', 'ID')[0], 0);
  vIDWorkClass := 0;
  vIDDistrict := 0;

  vFIO := '';
  vPhone := '';

  vLeadDateTime := '';
  vLeadDateTimeComment := '';

  vInfo := '';
  vComment := '';

  Result :=
    GetWorkerLeadParams(
      vActive,
      vIDStatusTypeLead,
      vIDWorkClass,
      vIDDistrict,
      vFIO,
      vPhone,
      vLeadDateTime,
      vLeadDateTimeComment,
      vInfo,
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

      FieldByName('ID_StatusTypeLead').AsInteger := vIDStatusTypeLead;
      FieldByName('ID_WorkClass').AsInteger := vIDWorkClass;
      FieldByName('ID_DistrictLive').AsInteger := vIDDistrict;

      FieldByName('FIO').AsString := vFIO;
      FieldByName('Phone').AsString := vPhone;

      FieldByName('LeadDateTime').AsString := vLeadDateTime;
      FieldByName('LeadDateTimeComment').AsString := vLeadDateTimeComment;

      FieldByName('Info').AsString := vInfo;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDWorkerLead := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDWorkerLead, []);
    end;
  end;

  SetEnabledButtons;
end;

procedure TWorkerLeadForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TWorkerLeadForm.DeleteWorkerLeadDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
//    if DeleteRec('WorkerLead', vID) then
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

function TWorkerLeadForm.EditWorkerLeadDialog: boolean;
  var
    vPhone, vInfo, vFIO, vComment, vLeadDateTime, vLeadDateTimeComment : string;
    vActive, vIDWorkClass, vIDDistrict, vIDStatusTypeLead : integer;
    vID: integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vIDStatusTypeLead := FieldByName('ID_StatusTypeLead').AsInteger;
    vIDWorkClass := FieldByName('ID_WorkClass').AsInteger;
    vIDDistrict := FieldByName('ID_DistrictLive').AsInteger;
    vFIO := FieldByName('FIO').AsString;
    vPhone := FieldByName('Phone').AsString;
    vLeadDateTime := FieldByName('LeadDateTime').AsString;
    vLeadDateTimeComment := FieldByName('LeadDateTimeComment').AsString;
    vInfo := FieldByName('Info').AsString;
    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetWorkerLeadParams(
      vActive,
      vIDStatusTypeLead,
      vIDWorkClass,
      vIDDistrict,
      vFIO,
      vPhone,
      vLeadDateTime,
      vLeadDateTimeComment,
      vInfo,
      vComment,
      vID);

  if Result then
  begin
    if ExistsRecord(vPhone, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;

      FieldByName('ID_StatusTypeLead').AsInteger := vIDStatusTypeLead;
      FieldByName('ID_WorkClass').AsInteger := vIDWorkClass;
      FieldByName('ID_DistrictLive').AsInteger := vIDDistrict;

      FieldByName('FIO').AsString := vFIO;
      FieldByName('Phone').AsString := vPhone;

      FieldByName('LeadDateTime').AsString := vLeadDateTime;
      FieldByName('LeadDateTimeComment').AsString := vLeadDateTimeComment;

      FieldByName('Info').AsString := vInfo;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;
      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;

  SetEnabledButtons;
end;

function TWorkerLeadForm.ExistsRecord(APhone: string; AIDExclude: integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= APhone;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TWorkerLeadForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
