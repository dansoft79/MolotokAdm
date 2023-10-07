//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Материалы
//
//------------------------------------------------------------------------------
unit UGMaterialType;

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
  PropFilerEh, PropStorageEh, dxColorEdit, dxScrollbarAnnotations;

type
  TGMaterialTypeForm = class(TForm)
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
    TableViewCode: TcxGridDBColumn;
    QueryID: TSmallintField;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryName: TWideStringField;
    QueryCode: TWideStringField;
    QueryComment: TWideStringField;
    QueryAssertUser: TWideStringField;
    QueryCategory: TWideStringField;
    QueryAmount: TFloatField;
    QueryUnit: TWideStringField;
    QueryPrice: TFloatField;
    TableViewCategory: TcxGridDBColumn;
    TableViewAmount: TcxGridDBColumn;
    TableViewUnit: TcxGridDBColumn;
    TableViewPrice: TcxGridDBColumn;
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
    procedure TableViewPriceGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddMaterialTypeDialog(var IDMaterialType : integer) : boolean;
    function EditMaterialTypeDialog : boolean;
    function DeleteMaterialTypeDialog : boolean;
    function UndoDeleteMaterialTypeDialog : boolean;
    function ExistsMaterialType(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowMaterialType(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddMaterialType(var AIDMaterialType : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditMaterialType(AIDMaterialType : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteMaterialType(AIDMaterialType : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGMaterialTypeParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree;

function DoAction(var AIDMaterialType : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGMaterialTypeForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGMaterialTypeForm) then
  begin
    with FindForm(TGMaterialTypeForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGMaterialTypeForm.Create(Application);
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
        Result := AddMaterialTypeDialog(AIDMaterialType);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDMaterialType, []);
          Result := EditMaterialTypeDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDMaterialType, []);
            Result := DeleteMaterialTypeDialog;
            Close;
          end;
  end;
end;

function ShowMaterialType(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddMaterialType(var AIDMaterialType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDMaterialType, cAddAction, nil);
end;

function EditMaterialType(AIDMaterialType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDMaterialType, cEditAction, nil);
end;

function DeleteMaterialType(AIDMaterialType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDMaterialType, cDeleteAction, nil);
end;

procedure TGMaterialTypeForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agMaterialType);

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

procedure TGMaterialTypeForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGMaterialTypeForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGMaterialTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGMaterialTypeForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGMaterialTypeForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteMaterialTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGMaterialTypeForm.aEditExecute(Sender: TObject);
begin
  FModified := EditMaterialTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGMaterialTypeForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGMaterialTypeForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteMaterialTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGMaterialTypeForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGMaterialTypeForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGMaterialTypeForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGMaterialTypeForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGMaterialTypeForm.TableViewPriceGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then AText := '';

end;

procedure TGMaterialTypeForm.TableViewStylesGetContentStyle(
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

function TGMaterialTypeForm.UndoDeleteMaterialTypeDialog: boolean;
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

procedure TGMaterialTypeForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGMaterialTypeForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGMaterialTypeForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddMaterialTypeDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGMaterialTypeForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGMaterialTypeForm.AddMaterialTypeDialog(var IDMaterialType: integer): boolean;
  var
    vCategory, vCode, vName, vUnit, vComment : string;
    vActive : integer;
    vPrice, vAmount : double;
begin
  vActive := 1;
  vCategory := '';
  vCode := '';
  vName := '';

  vAmount := 1;
  vUnit := '';
  vPrice := 0;

  vComment := '';

  Result :=
    GetMaterialTypeParams(
      vActive,
      vCode,
      vCategory,
      vName,
      vUnit,
      vAmount,
      vPrice,
      vComment
      );

  if Result then
  begin
    if ExistsMaterialType(vName, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('Category').AsString := vCategory;
      FieldByName('Code').AsString := vCode;
      FieldByName('Name').AsString := vName;
      FieldByName('Unit').AsString := vUnit;

      FieldByName('Amount').AsFloat := vAmount;
      FieldByName('Price').AsFloat := vPrice;

      FieldByName('Comment').AsString := vComment;
      Post;
      IDMaterialType := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDMaterialType, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGMaterialTypeForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGMaterialTypeForm.DeleteMaterialTypeDialog: boolean;
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

function TGMaterialTypeForm.EditMaterialTypeDialog: boolean;
  var
    vCategory, vCode, vName, vUnit, vComment : string;
    vActive : integer;
    vPrice, vAmount : double;
    vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;

    vCategory := FieldByName('Category').AsString;
    vCode := FieldByName('Code').AsString;
    vName := FieldByName('Name').AsString;
    vUnit := FieldByName('Unit').AsString;

    vAmount := FieldByName('Amount').AsFloat;
    vPrice := FieldByName('Price').AsFloat;

    vComment := FieldByName('Comment').AsString;

    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetMaterialTypeParams(
      vActive,
      vCode,
      vCategory,
      vName,
      vUnit,
      vAmount,
      vPrice,
      vComment
      );

  if Result then
  begin
    if ExistsMaterialType(vName, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;

      FieldByName('Category').AsString := vCategory;
      FieldByName('Code').AsString := vCode;
      FieldByName('Name').AsString := vName;
      FieldByName('Unit').AsString := vUnit;

      FieldByName('Amount').AsFloat := vAmount;
      FieldByName('Price').AsFloat := vPrice;

      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGMaterialTypeForm.ExistsMaterialType(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString:= AName;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGMaterialTypeForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
