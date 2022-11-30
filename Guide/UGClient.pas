//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Заказчики
//
//------------------------------------------------------------------------------
unit UGClient;

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
  PropFilerEh, PropStorageEh, cxMaskEdit;

type
  TGClientForm = class(TForm)
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
    QueryID: TIntegerField;
    QueryPhone: TWideStringField;
    TableViewPhone: TcxGridDBColumn;
    QueryAddress: TWideStringField;
    QueryFlatNumber: TWideStringField;
    TableViewAddress: TcxGridDBColumn;
    TableViewFlatNumber: TcxGridDBColumn;
    QueryID_District: TSmallintField;
    QueryID_Metro: TSmallintField;
    QueryDInfo: TWideStringField;
    QueryMInfo: TWideStringField;
    TableViewDInfo: TcxGridDBColumn;
    TableViewMInfo: TcxGridDBColumn;
    aImport: TAction;
    dxBarButton6: TdxBarButton;
    TableAll: TZQuery;
    qDistrict: TZQuery;
    qMetro: TZQuery;
    QueryIsClientDomSPB: TSmallintField;
    TableViewIsClientDomSPB: TcxGridDBColumn;
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
    procedure TableViewPhoneGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure aImportExecute(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;

    function ImportProc(AValue : string) : string;

    procedure SetEnabledButtons;
    function AddClientDialog(var IDClient : integer) : boolean;
    function EditClientDialog : boolean;
    function DeleteClientDialog : boolean;
    function UndoDeleteClientDialog : boolean;
    function ExistsClient(APhone : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

var
  DefPhone : string = '';

//отображение окна справочника
function ShowClient(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddClient(var AIDClient : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditClient(AIDClient : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteClient(AIDClient : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGClientParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UPermitTree, UImportXLS;

function DoAction(var AIDClient : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGClientForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGClientForm) then
  begin
    with FindForm(TGClientForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGClientForm.Create(Application);
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
        Result := AddClientDialog(AIDClient);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDClient, []);
          Result := EditClientDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDClient, []);
            Result := DeleteClientDialog;
            Close;
          end;
  end;
end;

function ShowClient(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddClient(var AIDClient : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDClient, cAddAction, nil);
end;

function EditClient(AIDClient : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDClient, cEditAction, nil);
end;

function DeleteClient(AIDClient : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDClient, cDeleteAction, nil);
end;

procedure TGClientForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.agClient);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  aImport.Enabled := ce;

  //------------------------------------------
  //видимость
  //------------------------------------------
  md := cbDel.ItemIndex in [1, 2];
  mnd := cbDel.ItemIndex in [0, 2];
  aAdd.Visible := mnd;
  aDelete.Visible := mnd;
  aUndoDelete.Visible := md;
  aEdit.Visible := mnd;

  aImport.Enabled := mnd;
end;

procedure TGClientForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGClientForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGClientForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGClientForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGClientForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteClientDialog or FModified;
  SetEnabledButtons;
end;

procedure TGClientForm.aEditExecute(Sender: TObject);
begin
  FModified := EditClientDialog or FModified;
  SetEnabledButtons;
end;

procedure TGClientForm.aImportExecute(Sender: TObject);
begin
  ShowWaiting(cDataGetting);
  TableAll.Open;
  HideWaiting;

  ImportXLS(
    'Phone=Телефон;' +
    'Name=Имя;' +
    'Address=Адрес;' +
    'FlatNumber=Квартира;' +
    'District=Район города;' +
    'Metro=Станция метро;' +
    'ClientDomSPB=Клиент ДОМ СПБ;' +
    'Comment=Комментарий',
    'Phone', '|', ';', '/', ',',
    'ImportClientProc',
    ImportProc);

  TableAll.Close;

  Query.Close;
  Query.Open;
end;

procedure TGClientForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGClientForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteClientDialog or FModified;
  SetEnabledButtons;
end;

procedure TGClientForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGClientForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGClientForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGClientForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGClientForm.TableViewPhoneGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
  if AText <> '' then
  begin
    AText := '(' + Copy(AText, 1, 3) + ') ' + Copy(AText, 4, 3) + '-' + Copy(AText, 7, 4);
  end;
end;

procedure TGClientForm.TableViewStylesGetContentStyle(
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

function TGClientForm.UndoDeleteClientDialog: boolean;
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

procedure TGClientForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGClientForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

function TGClientForm.ImportProc(AValue: string): string;
  var
    vStrings : TStringList;
    vPhone, s : string;
    vIDDistrict, vIDMetro : integer;
  const
    cQuota : char = '|';
begin
  Result := '';

  vStrings := TStringList.Create;
  vStrings.Delimiter := ';';
  vStrings.StrictDelimiter := true;
  vStrings.QuoteChar := '|';
  vStrings.DelimitedText := AValue;

  vPhone := Trim(AnsiDequotedStr(vStrings.Values['Phone'], '|'));
  vPhone := PreparePhone(vPhone);

  if (Length(vPhone) <> 10) or not IsIntegerByChar(vPhone) then Result := 'Не указан или неверно указан номер мобильного телефона'
  else
  if IsNUll(Datas.ReadValuesSQL('select ID from client where phone = ''' + vPhone + '''', 'ID')[0], 0) <> 0 then Result := 'Клиент с указанным номером мобильного телефона уже есть'
  else
  begin
    s := Trim(AnsiDequotedStr(vStrings.Values['District'], '|'));
    qDistrict.Close;
    qDistrict.ParamByName('N').AsString := s;
    qDistrict.Open;
    vIDDistrict := qDistrict.FieldBYName('ID').AsInteger;
    qDistrict.Close;
    if vIDDistrict = 0 then Result := Result + 'Не найден район. ';

    s := Trim(AnsiDequotedStr(vStrings.Values['Metro'], '|'));
    qMetro.Close;
    qMetro.ParamByName('N').AsString := s;
    qMetro.Open;
    vIDMetro := qMetro.FieldBYName('ID').AsInteger;
    qMetro.Close;
    if vIDMetro = 0 then Result := Result + 'Не найдено метро. ';

    TableAll.Append;
    TableAll.FieldByName('ID_AssertUser').AsInteger := UserID;
    TableAll.FieldByName('Active').AsInteger := 1;
    TableAll.FieldByName('Deleted').AsInteger := 0;

    TableAll.FieldByName('Phone').AsString := vPhone;

    s := Trim(AnsiDequotedStr(vStrings.Values['Name'], '|'));
    TableAll.FieldByName('Name').AsString := s;

    TableAll.FieldByName('ID_District').Value := NullIfZero(vIDDistrict);
    TableAll.FieldByName('ID_Metro').Value := NullIfZero(vIDMetro);

    s := Trim(AnsiDequotedStr(vStrings.Values['ClientDomSPB'], '|'));
    if (s = '1') or (AnsiLowerCase(s) = 'true') or (AnsiLowerCase(s) = 'да') or (AnsiLowerCase(Copy(s, 1, 1)) = 'к') then TableAll.FieldByName('IsClientDomSPB').AsInteger := 1
    else TableAll.FieldByName('IsClientDomSPB').AsInteger := 0;

    ReadImportData(TableAll, 'Address;FlatNumber;Comment', AValue, cQuota);

    TableAll.Post;

    Result := 'Клиент добавлен. ' + Result;
  end;

  vStrings.Free;
end;

procedure TGClientForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddClientDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGClientForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGClientForm.AddClientDialog(var IDClient: integer): boolean;
  var
    vName, vPhone, vComment : string;
    vAddress, vFlatNumber : string;
    vClientDOMSPB, vActive : integer;
    vIDDistrict, vIDMetro : integer;
begin
  vActive := 1;
  vClientDOMSPB := 0;
  vName := '';
  vPhone := DefPhone;
  vAddress := '';
  vFlatNumber := '';
  vIDDistrict := 0;
  vIDMetro := 0;
  vComment := '';

  Result :=
    GetClientParams(
      vActive,
      vClientDOMSPB,
      vName,
      vPhone,
      vAddress,
      vFlatNumber,
      vIDDistrict,
      vIDMetro,
      vComment
      );

  if Result then
  begin
    if ExistsClient(vPhone, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('IsClientDOMSPB').AsInteger := vClientDOMSPB;

      FieldByName('Name').AsString := vName;
      FieldByName('Phone').AsString := vPhone;
      FieldByName('Address').AsString := vAddress;
      FieldByName('FlatNUmber').AsString := vFlatNUmber;
      FieldByName('ID_District').value := NullIfZero(vIDDistrict);
      FieldByName('ID_Metro').Value := NullIfZero(vIDMetro);
      FieldByName('Comment').AsString := vComment;
      Post;
      IDClient := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDClient, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TGClientForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGClientForm.DeleteClientDialog: boolean;
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

function TGClientForm.EditClientDialog: boolean;
  var
    vName, vPhone, vComment : string;
    vAddress, vFlatNumber : string;
    vIDDistrict, vIDMetro : integer;
    vClientDomSPB, vActive, vRoleType, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vClientDOMSPB := FieldByName('IsClientDOMSPB').AsInteger;
    vName := FieldByName('Name').AsString;
    vPhone := FieldByName('Phone').AsString;
    vAddress := FieldByName('Address').AsString;
    vFlatNumber := FieldByName('FlatNumber').AsString;
    vIDDistrict := FieldByName('ID_District').AsInteger;
    vIDMetro := FieldByName('ID_Metro').AsInteger;
    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetClientParams(
      vActive,
      vClientDomSPB,
      vName,
      vPhone,
      vAddress,
      vFlatNumber,
      vIDDistrict,
      vIDMetro,
      vComment);

  if Result then
  begin
    if ExistsClient(vPhone, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;

      FieldByName('IsClientDOMSPB').AsInteger := vClientDOMSPB;

      FieldByName('Name').AsString := vName;
      FieldByName('Phone').AsString := vPhone;
      FieldByName('Address').AsString := vAddress;
      FieldByName('FlatNumber').AsString := vFlatNumber;
      FieldByName('ID_District').Value := NullIfZero(vIDDistrict);
      FieldByName('ID_Metro').Value := NullIfZero(vIDMetro);
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGClientForm.ExistsClient(APhone: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('P').AsString:= APhone;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TGClientForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
