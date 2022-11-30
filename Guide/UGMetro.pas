//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Станции метро
//
//------------------------------------------------------------------------------
unit UGMetro;

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
  PropFilerEh, PropStorageEh, dxColorEdit;

type
  TGMetroForm = class(TForm)
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
    QueryID_District: TSmallintField;
    QueryDInfo: TWideStringField;
    TableViewDInfo: TcxGridDBColumn;
    QueryTag: TWideStringField;
    QueryColor: TIntegerField;
    TableViewTag: TcxGridDBColumn;
    TableViewColor: TcxGridDBColumn;
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
    function AddMetroDialog(var IDMetro : integer) : boolean;
    function EditMetroDialog : boolean;
    function DeleteMetroDialog : boolean;
    function UndoDeleteMetroDialog : boolean;
    function ExistsMetro(AName : string; AIDDistrict : integer; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowMetro(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddMetro(var AIDMetro : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditMetro(AIDMetro : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteMetro(AIDMetro : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGMetroParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree;

function DoAction(var AIDMetro : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGMetroForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGMetroForm) then
  begin
    with FindForm(TGMetroForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGMetroForm.Create(Application);
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
        Result := AddMetroDialog(AIDMetro);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDMetro, []);
          Result := EditMetroDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDMetro, []);
            Result := DeleteMetroDialog;
            Close;
          end;
  end;
end;

function ShowMetro(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddMetro(var AIDMetro : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDMetro, cAddAction, nil);
end;

function EditMetro(AIDMetro : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDMetro, cEditAction, nil);
end;

function DeleteMetro(AIDMetro : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDMetro, cDeleteAction, nil);
end;

procedure TGMetroForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agMetro);

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

procedure TGMetroForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGMetroForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGMetroForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGMetroForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGMetroForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteMetroDialog or FModified;
  SetEnabledButtons;
end;

procedure TGMetroForm.aEditExecute(Sender: TObject);
begin
  FModified := EditMetroDialog or FModified;
  SetEnabledButtons;
end;

procedure TGMetroForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGMetroForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteMetroDialog or FModified;
  SetEnabledButtons;
end;

procedure TGMetroForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGMetroForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGMetroForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGMetroForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGMetroForm.TableViewStylesGetContentStyle(
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

function TGMetroForm.UndoDeleteMetroDialog: boolean;
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

procedure TGMetroForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGMetroForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGMetroForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddMetroDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGMetroForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGMetroForm.AddMetroDialog(var IDMetro: integer): boolean;
  var
    vName, vComment, vTag : string;
    vIDDistrict, vActive, vColor : integer;
begin
  vActive := 1;
  vIDDistrict := 0;
  vName := '';
  vTag := '';
  vColor := clNone;
  vComment := '';

  Result :=
    GetMetroParams(
      vActive,
      vIDDistrict,
      vColor,
      vName,
      vTag,
      vComment
      );

  if Result then
  begin
    if ExistsMetro(vName, vIDDistrict, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('ID_District').AsInteger := vIDDistrict;
      FieldByName('Name').AsString := vName;
      FieldByName('Tag').AsString := vTag;
      FieldByName('Color').AsInteger := vColor;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDMetro := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDMetro, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGMetroForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGMetroForm.DeleteMetroDialog: boolean;
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

function TGMetroForm.EditMetroDialog: boolean;
  var
    vTag, vName, vComment : string;
    vColor, vActive, vIDDistrict, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vIDDistrict := FieldByName('ID_District').AsInteger;
    vName := FieldByName('Name').AsString;
    vComment := FieldByName('Comment').AsString;
    vTag := FieldByName('Tag').AsString;
    vColor := FieldByName('Color').AsInteger;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetMetroParams(
      vActive,
      vIDDistrict,
      vColor,
      vName,
      vTag,
      vComment);

  if Result then
  begin
    if ExistsMetro(vName, vIDDistrict, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('ID_District').AsInteger := vIDDistrict;
      FieldByName('Name').AsString := vName;
      FieldByName('Tag').AsString := vTag;
      FieldByName('Color').AsInteger := vColor;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGMetroForm.ExistsMetro(AName: string; AIDDistrict : integer; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString := AName;
  qExists.ParamByName('D').AsINteger := AIDDistrict;
  qExists.ParamByName('IDE').AsInteger := AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGMetroForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
