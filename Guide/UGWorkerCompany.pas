//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Подрядчики
//
//------------------------------------------------------------------------------
unit UGWorkerCompany;

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
  TGWorkerCompanyForm = class(TForm)
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
    QueryINN: TWideStringField;
    QueryKPP: TWideStringField;
    QueryOGRN: TWideStringField;
    QueryAddressJur: TWideStringField;
    QueryAddressFact: TWideStringField;
    QueryBank: TWideStringField;
    QueryBIK: TWideStringField;
    QueryKS: TWideStringField;
    QueryRS: TWideStringField;
    QueryComissionSize: TFloatField;
    TableViewOrgType: TcxGridDBColumn;
    TableViewINN: TcxGridDBColumn;
    TableViewKPP: TcxGridDBColumn;
    TableViewOGRN: TcxGridDBColumn;
    TableViewAddressJur: TcxGridDBColumn;
    TableViewAddressFact: TcxGridDBColumn;
    TableViewBank: TcxGridDBColumn;
    TableViewBIK: TcxGridDBColumn;
    TableViewKS: TcxGridDBColumn;
    TableViewRS: TcxGridDBColumn;
    TableViewComissionSize: TcxGridDBColumn;
    QueryOrgType: TWideStringField;
    QueryMasterPost: TWideStringField;
    QueryMasterName: TWideStringField;
    TableViewMasterPost: TcxGridDBColumn;
    TableViewMasterName: TcxGridDBColumn;
    QueryComissionDate: TDateTimeField;
    QueryComissionType: TSmallintField;
    QueryComTypeInfo: TWideStringField;
    TableViewComissionDate: TcxGridDBColumn;
    TableViewComTypeInfo: TcxGridDBColumn;
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
    function AddWorkerCompanyDialog(var IDWorkerCompany : integer) : boolean;
    function EditWorkerCompanyDialog : boolean;
    function DeleteWorkerCompanyDialog : boolean;
    function UndoDeleteWorkerCompanyDialog : boolean;
    function ExistsWorkerCompany(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowWorkerCompany(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddWorkerCompany(var AIDWorkerCompany : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditWorkerCompany(AIDWorkerCompany : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteWorkerCompany(AIDWorkerCompany : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGWorkerCompanyParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree;

function DoAction(var AIDWorkerCompany : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGWorkerCompanyForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGWorkerCompanyForm) then
  begin
    with FindForm(TGWorkerCompanyForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGWorkerCompanyForm.Create(Application);
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
        Result := AddWorkerCompanyDialog(AIDWorkerCompany);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDWorkerCompany, []);
          Result := EditWorkerCompanyDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDWorkerCompany, []);
            Result := DeleteWorkerCompanyDialog;
            Close;
          end;
  end;
end;

function ShowWorkerCompany(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddWorkerCompany(var AIDWorkerCompany : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkerCompany, cAddAction, nil);
end;

function EditWorkerCompany(AIDWorkerCompany : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkerCompany, cEditAction, nil);
end;

function DeleteWorkerCompany(AIDWorkerCompany : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkerCompany, cDeleteAction, nil);
end;

procedure TGWorkerCompanyForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agWorkerCompany);

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

procedure TGWorkerCompanyForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGWorkerCompanyForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGWorkerCompanyForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGWorkerCompanyForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGWorkerCompanyForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteWorkerCompanyDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkerCompanyForm.aEditExecute(Sender: TObject);
begin
  FModified := EditWorkerCompanyDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkerCompanyForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGWorkerCompanyForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteWorkerCompanyDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkerCompanyForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGWorkerCompanyForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGWorkerCompanyForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkerCompanyForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkerCompanyForm.TableViewStylesGetContentStyle(
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

function TGWorkerCompanyForm.UndoDeleteWorkerCompanyDialog: boolean;
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

procedure TGWorkerCompanyForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGWorkerCompanyForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGWorkerCompanyForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddWorkerCompanyDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGWorkerCompanyForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGWorkerCompanyForm.AddWorkerCompanyDialog(var IDWorkerCompany: integer): boolean;
  var
    vName, vComment, vOrgType, vINN, vKPP, vOGRN, vAddressJur, vAddressFact,
    vMasterPost, vMasterName,
    vBank, vBIK, vRS, vKS : string;
    vActive : integer;
    vComissionSize : double;
    vComissionDate : string;
    vComissionType : integer;
begin
  vActive := 1;
  vOrgType := '';
  vName := '';
  vINN := '';
  vKPP := '';
  vOGRN := '';
  vMasterPost := '';
  vMasterName := '';
  vAddressJur := '';
  vAddressFact := '';
  vBank := '';
  vBIK := '';
  vRS := '';
  vKS := '';
  vComment := '';
  vComissionType := 0;
  vComissionSize := 0;
  vComissionDate := DateToStr(Date);

  Result :=
    GetWorkerCompanyParams(
      vActive,
      vOrgType,
      vName,
      vINN,
      vKPP,
      vOGRN,
      vMasterPost,
      vMasterName,
      vAddressJur,
      vAddressFact,
      vBank,
      vBIK,
      vRS,
      vKS,
      vComment,
      vComissionType,
      vComissionSize,
      vComissionDate
      );

  if Result then
  begin
    if ExistsWorkerCompany(vName, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('OrgType').AsString := vOrgType;
      FieldByName('Name').AsString := vName;
      FieldByName('INN').AsString := vINN;
      FieldByName('KPP').AsString := vKPP;
      FieldByName('OGRN').AsString := vOGRN;
      FieldByName('MasterPost').AsString := vMasterPost;
      FieldByName('MasterName').AsString := vMasterName;
      FieldByName('AddressJur').AsString := vAddressJur;
      FieldByName('AddressFact').AsString := vAddressFact;
      FieldByName('Bank').AsString := vBank;
      FieldByName('BIK').AsString := vBIK;
      FieldByName('RS').AsString := vRS;
      FieldByName('KS').AsString := vKS;
      FieldByName('Comment').AsString := vComment;
      FieldByName('ComissionType').AsInteger := vComissionType;
      FieldByName('ComissionSize').AsFloat := vComissionSize;
      FieldByName('ComissionDate').AsString := vComissionDate;

      Post;
      IDWorkerCompany := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDWorkerCompany, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGWorkerCompanyForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGWorkerCompanyForm.DeleteWorkerCompanyDialog: boolean;
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

function TGWorkerCompanyForm.EditWorkerCompanyDialog: boolean;
  var
    vName, vOrgType, vComment, vINN, vKPP, vOGRN, vAddressJur, vAddressFact,
    vMasterPost, vMasterName, vBank, vBIK, vRS, vKS : string;
    vActive : integer;
    vComissionDate : string;
    vComissionType : integer;
    vComissionSize : double;
    vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vOrgType := FieldByName('OrgType').AsString;
    vName := FieldByName('Name').AsString;
    vINN := FieldByName('INN').AsString;
    vKPP := FieldByName('KPP').AsString;
    vOGRN := FieldByName('OGRN').AsString;
    vMasterPost := FieldByName('MasterPost').AsString;
    vMasterName := FieldByName('MasterName').AsString;
    vAddressJur := FieldByName('AddressJur').AsString;
    vAddressFact := FieldByName('AddressFact').AsString;
    vBank := FieldByName('Bank').AsString;
    vBIK := FieldByName('BIK').AsString;
    vRS := FieldByName('RS').AsString;
    vKS := FieldByName('KS').AsString;
    vComment := FieldByName('Comment').AsString;
    vComissionType := FieldByName('ComissionType').AsInteger;
    vComissionSize := FieldByName('ComissionSize').AsFloat;
    vComissionDate := FieldByName('ComissionDate').AsString;

    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetWorkerCompanyParams(
      vActive,
      vOrgType,
      vName,
      vINN,
      vKPP,
      vOGRN,
      vMasterPost,
      vMasterName,
      vAddressJur,
      vAddressFact,
      vBank,
      vBIK,
      vRS,
      vKS,
      vComment,
      vComissionType,
      vComissionSize,
      vComissionDate
      );

  if Result then
  begin
    if ExistsWorkerCompany(vName, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('OrgType').AsString := vOrgType;
      FieldByName('Name').AsString := vName;
      FieldByName('INN').AsString := vINN;
      FieldByName('KPP').AsString := vKPP;
      FieldByName('OGRN').AsString := vOGRN;
      FieldByName('MasterPost').AsString := vMasterPost;
      FieldByName('MasterName').AsString := vMasterName;
      FieldByName('AddressJur').AsString := vAddressJur;
      FieldByName('AddressFact').AsString := vAddressFact;
      FieldByName('Bank').AsString := vBank;
      FieldByName('BIK').AsString := vBIK;
      FieldByName('RS').AsString := vRS;
      FieldByName('KS').AsString := vKS;
      FieldByName('Comment').AsString := vComment;
      FieldByName('ComissionType').AsInteger := vComissionType;
      FieldByName('ComissionSize').AsFloat := vComissionSize;
      FieldByName('ComissionDate').AsString := vComissionDate;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGWorkerCompanyForm.ExistsWorkerCompany(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGWorkerCompanyForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
