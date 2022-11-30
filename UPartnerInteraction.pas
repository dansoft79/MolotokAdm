//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Список взаимодействия с клиентом
//
//------------------------------------------------------------------------------
unit UPartnerInteraction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  DB,  ADODB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxMemo, dxStatusBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid,
  ActnList, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, cxPropertiesStore,
  cxTextEdit, cxDBEdit, cxContainer, cxGroupBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter,
  cxCalendar, cxTimeEdit, cxLookAndFeels, cxLookAndFeelPainters, System.Actions;

type
  TPartnerInteractionForm = class(TForm)
    DataSource: TDataSource;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    Level: TcxGridLevel;
    StatusBar: TdxStatusBar;
    PopupMenu: TcxGridPopupMenu;
    BarManager: TdxBarManager;
    dxBarButton4: TdxBarButton;
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
    aOK: TAction;
    aCancel: TAction;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    TableViewShortName: TcxGridDBColumn;
    TableViewCCName: TcxGridDBColumn;
    TableViewEInfo: TcxGridDBColumn;
    TableViewActionType: TcxGridDBColumn;
    TableViewActionDate: TcxGridDBColumn;
    TableViewActionTime: TcxGridDBColumn;
    TableViewSubject: TcxGridDBColumn;
    TableViewResult: TcxGridDBColumn;
    Query: TZQuery;
    QueryShortName: TWideStringField;
    QueryCCName: TWideStringField;
    QueryEInfo: TWideStringField;
    QueryActionType: TWideStringField;
    QueryActionDate: TDateTimeField;
    QuerySubject: TWideStringField;
    QueryResult: TWideStringField;
    QueryComment: TWideMemoField;
    Table: TZQuery;
    DBMemo: TcxDBMemo;
    QueryID: TIntegerField;
    QueryID_Partner: TIntegerField;
    QueryID_PartnerContact: TIntegerField;
    QueryID_Employee: TSmallintField;
    QueryActionTime: TTimeField;
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
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddPartnerInteractionDialog(var IDPartnerInteraction : integer) : boolean;
    function EditPartnerInteractionDialog : boolean;
    function DeletePartnerInteractionDialog : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowPartnerInteraction(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddPartnerInteraction(var AIDPartnerInteraction : integer) : boolean;

//вызов окна изменения записи справочника
function EditPartnerInteraction(AIDPartnerInteraction : integer) : boolean;

//удаление указанной записи справочника
function DeletePartnerInteraction(AIDPartnerInteraction : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UPartnerInteractionParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts, 
  MainUnit;

function DoAction(var AIDPartnerInteraction : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TPartnerInteractionForm;
begin
  vForm := TPartnerInteractionForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    Query.ParamByName('IDE').AsInteger := EmployeeID;
    Query.Open;
    Table.Open;
    HideWaiting;

    FModified := false;
    Result := false;
    if AAction = cOpenAction then
    begin
      Tag := MaxMDITag(ClassType) + 1;
      Caption := Format('%s-%d', [Caption, Tag]);
      Name := Name + IntToStr(Tag);

      RegisterFloatingForm(vForm, AParentAction, Caption);
      Show;
    end
    else
      if AAction = cAddAction then
      begin
        Result := AddPartnerInteractionDialog(AIDPartnerInteraction);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDPartnerInteraction, []);
          Result := EditPartnerInteractionDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDPartnerInteraction, []);
            Result := DeletePartnerInteractionDialog;
            Close;
          end;
  end;
end;

function ShowPartnerInteraction(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddPartnerInteraction(var AIDPartnerInteraction : integer) : boolean;
begin
  Result := DoAction(AIDPartnerInteraction, cAddAction, nil);
end;

function EditPartnerInteraction(AIDPartnerInteraction : integer) : boolean;
begin
  Result := DoAction(AIDPartnerInteraction, cEditAction, nil);
end;

function DeletePartnerInteraction(AIDPartnerInteraction : integer) : boolean;
begin
  Result := DoAction(AIDPartnerInteraction, cDeleteAction, nil);
end;

procedure TPartnerInteractionForm.SetEnabledButtons;
  var
    ce, e : boolean;
begin
  with TableView.Controller do e := Assigned(FocusedRecord) and FocusedRecord.IsData and not FocusedRow.IsFilterRow;
  ce := CanEditInActionByAction(MainForm.aaPartnerInteraction);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce;
  aEdit.Enabled := e and ce;
end;

procedure TPartnerInteractionForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TPartnerInteractionForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TPartnerInteractionForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TPartnerInteractionForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TPartnerInteractionForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeletePartnerInteractionDialog or FModified;
  SetEnabledButtons;
end;

procedure TPartnerInteractionForm.aEditExecute(Sender: TObject);
begin
  FModified := EditPartnerInteractionDialog or FModified;
  SetEnabledButtons;
end;

procedure TPartnerInteractionForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TPartnerInteractionForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TPartnerInteractionForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TPartnerInteractionForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TPartnerInteractionForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TPartnerInteractionForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddPartnerInteractionDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TPartnerInteractionForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TPartnerInteractionForm.AddPartnerInteractionDialog(var IDPartnerInteraction: integer): boolean;
  var
    vIDPartner, vIDPartnerContact : integer;
    vActionType : string;
    vActionDate : TDate;
    vActionTime : TTime;
    vSubject, vResult, vComment : string;
begin
  vIDPartner := 0;
  vIDPartnerContact := 0;
  vActionType := '';
  GetServerTime(vActionDate, vActionTime);
  vSubject := '';
  vResult := '';
  vComment := '';

  Result :=
    GetPartnerInteractionParams(
    vIDPartner,
    vIDPartnerContact,
    vActionType,
    vActionDate,
    vActionTime,
    vSubject,
    vResult,
    vComment,
    0);

  if Result then
  begin
    with Table do
    begin
      Append;
      FieldByName('ID_Employee').AsInteger := EmployeeID;
      FieldByName('ID_Partner').AsInteger := vIDPartner;
      FieldByName('ID_PartnerContact').Value := NullIf(vIDPartnerContact, 0);
      FieldByName('ActionType').AsString := vActionType;
      FieldByName('ActionDate').AsDateTime := vActionDate;
      FieldByName('ActionTime').AsDateTime := vActionTime;
      FieldByName('Subject').AsString := vSubject;
      FieldByName('Result').AsString := vResult;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDPartnerInteraction := FieldByName('ID').AsInteger;

      Query.Close;
      Query.Open;

      Query.Locate('ID', IDPartnerInteraction, []);
    end;
  end;
  SetEnabledButtons;
end;

function TPartnerInteractionForm.DeletePartnerInteractionDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;
  
  if Result then
    if DeleteRec('PartnerInteraction', vID) then
    begin
      vRecNo := Query.RecNo;

      Table.Close;
      Table.Open;

      Query.Close;
      Query.Open;

      if Query.RecordCount > 1 then
        Query.RecNo := vRecNo;
    end;
  SetEnabledButtons;
end;

function TPartnerInteractionForm.EditPartnerInteractionDialog: boolean;
  var
    vIDPartner, vIDPartnerContact : integer;
    vActionType : string;
    vActionDate : TDate;
    vActionTime : TTime;
    vSubject, vResult, vComment : string;
    vID : integer;
begin
  with Query do
  begin
    vIDPartner := FieldByName('ID_Partner').AsInteger;
    vIDPartnerContact := FieldByName('ID_PartnerContact').AsInteger;
    vActionType := FieldByName('ActionType').AsString;
    vActionDate := FieldByName('ActionDate').AsDateTime;
    vActionTime := FieldByName('ActionTime').AsDateTime;
    vSubject := FieldByName('Subject').AsString;
    vResult := FieldByName('Result').AsString;
    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetPartnerInteractionParams(
    vIDPartner,
    vIDPartnerContact,
    vActionType,
    vActionDate,
    vActionTime,
    vSubject,
    vResult,
    vComment,
    vID);

  if Result then
  begin
    with Table do
    begin
      Locate('ID', vID, []);
      Edit;
      FieldByName('ID_Partner').AsInteger := vIDPartner;
      FieldByName('ID_PartnerContact').Value := NullIf(vIDPartnerContact, 0);
      FieldByName('ActionType').AsString := vActionType;
      FieldByName('ActionDate').AsDateTime := vActionDate;
      FieldByName('ActionTime').AsDateTime := vActionTime;
      FieldByName('Subject').AsString := vSubject;
      FieldByName('Result').AsString := vResult;
      FieldByName('Comment').AsString := vComment;
      Post;

      Query.Close;
      Query.Open;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TPartnerInteractionForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
