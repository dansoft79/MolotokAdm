//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Виды работ
//
//------------------------------------------------------------------------------
unit UGWorkType;

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
  PropFilerEh, PropStorageEh, cxGroupBox, cxSplitter, cxCurrencyEdit,
  dxScrollbarAnnotations;

type
  TGWorkTypeForm = class(TForm)
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
    QueryID_WorkClass: TSmallintField;
    QueryPrice: TFloatField;
    QueryNorm: TFloatField;
    QueryAmount: TFloatField;
    QueryUnitName: TWideStringField;
    QueryWarrantyTime: TIntegerField;
    QueryWarrantyType: TSmallintField;
    QueryFrequentWork: TSmallintField;
    QueryPublicWork: TSmallintField;
    QueryWCInfo: TWideStringField;
    TableViewPrice: TcxGridDBColumn;
    TableViewNorm: TcxGridDBColumn;
    TableViewAmount: TcxGridDBColumn;
    TableViewUnitName: TcxGridDBColumn;
    TableViewWorkerClass: TcxGridDBColumn;
    TableViewWarrantyTime: TcxGridDBColumn;
    TableViewWarrantyType: TcxGridDBColumn;
    TableViewFrequentWork: TcxGridDBColumn;
    TableViewPublicWork: TcxGridDBColumn;
    TableViewWCInfo: TcxGridDBColumn;
    QueryWTInfo: TWideStringField;
    QueryCode: TWideStringField;
    QueryID_WorkerClass: TSmallintField;
    QueryWCLInfo: TWideStringField;
    pRight: TPanel;
    gbAdd: TcxGroupBox;
    dsWorkAdd: TDataSource;
    qWorkAdd: TZQuery;
    tWorkAdd: TZQuery;
    dxBarDockControl1: TdxBarDockControl;
    BarManagerBar2: TdxBar;
    aAddWork: TAction;
    aDelWork: TAction;
    dxBarButton7: TdxBarButton;
    dxBarButton9: TdxBarButton;
    GridAdd: TcxGrid;
    ViewAdd: TcxGridDBTableView;
    LevelAdd: TcxGridLevel;
    qWorkAddID: TSmallintField;
    qWorkAddID_WorkType: TSmallintField;
    qWorkAddID_WorkTypeAdd: TSmallintField;
    Splitter: TcxSplitter;
    gbDescription: TcxGroupBox;
    mDescr: TcxDBMemo;
    QueryDescription: TWideStringField;
    TableViewCode: TcxGridDBColumn;
    TableViewDescription: TcxGridDBColumn;
    qWorkAddPublicWork: TSmallintField;
    qWorkAddName: TWideStringField;
    qWorkAddUnitName: TWideStringField;
    qWorkAddPrice: TFloatField;
    qWorkAddAmount: TFloatField;
    ViewAddPublicWork: TcxGridDBColumn;
    ViewAddName: TcxGridDBColumn;
    ViewAddUnitName: TcxGridDBColumn;
    ViewAddPrice: TcxGridDBColumn;
    ViewAddAmount: TcxGridDBColumn;
    qWorkAddDeleted: TSmallintField;
    ViewAddID: TcxGridDBColumn;
    ViewAddDeleted: TcxGridDBColumn;
    TableViewWarranty: TcxGridDBColumn;
    QueryWTShortInfo: TWideStringField;
    aImport: TAction;
    TableAll: TZQuery;
    dxBarButton6: TdxBarButton;
    qWorkClass: TZQuery;
    qWorkerClassName: TZQuery;
    pmWorkAdd: TcxGridPopupMenu;
    QueryWarranty: TWideStringField;
    qWorkerClassTag: TZQuery;
    QueryPictureType: TWideStringField;
    TableViewPicture: TcxGridDBColumn;
    TableViewPictureType: TcxGridDBColumn;
    QueryPicture: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
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
    procedure aAddWorkClassExecute(Sender: TObject);
    procedure aAddWorkExecute(Sender: TObject);
    procedure aDelWorkExecute(Sender: TObject);
    procedure ViewAddStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure QueryCalcFields(DataSet: TDataSet);
    procedure aImportExecute(Sender: TObject);
    procedure ViewAddFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
    FModified : boolean;
    function ImportProc(AValue : string) : string;
    procedure SetEnabledButtons;
    function AddWorkTypeDialog(var IDWorkType : integer) : boolean;
    function EditWorkTypeDialog : boolean;
    function DeleteWorkTypeDialog : boolean;
    function UndoDeleteWorkTypeDialog : boolean;
    function ExistsWorkType(AName : string; AIDWorkClass : integer; AIDExclude : integer) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowWorkType(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddWorkType(var AIDWorkType : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditWorkType(AIDWorkType : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteWorkType(AIDWorkType : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses types,
  UOptions, UDatas, UGWorkTypeParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, USelectWorkClass, USelectWorkTypeMulti, UImportXLS;

function DoAction(var AIDWorkType : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGWorkTypeForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGWorkTypeForm) then
  begin
    with FindForm(TGWorkTypeForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGWorkTypeForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    Query.Open;
    TableView.DataController.GotoFirst;
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
        Result := AddWorkTypeDialog(AIDWorkType);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDWorkType, []);
          Result := EditWorkTypeDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDWorkType, []);
            Result := DeleteWorkTypeDialog;
            Close;
          end;
  end;
end;

function ShowWorkType(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddWorkType(var AIDWorkType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkType, cAddAction, nil);
end;

function EditWorkType(AIDWorkType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkType, cEditAction, nil);
end;

function DeleteWorkType(AIDWorkType : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDWorkType, cDeleteAction, nil);
end;

procedure TGWorkTypeForm.SetEnabledButtons;
  var
    ewa, ce, e, del : boolean;
    md, mnd : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  del := e and (Query.FieldByName('Deleted').AsINteger = 1);

  ce := CanEditInActionByAction(MainForm.agWorkType);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  with ViewAdd.Controller do
    ewa :=
      qWorkAdd.Active and
      not qWorkAdd.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aAddWork.Enabled := e and ce and not del;
  aDelWork.Enabled := ewa and ce and not del;

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

  aImport.Visible := mnd;
end;

procedure TGWorkTypeForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGWorkTypeForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  qWorkAdd.Close;
  qWorkAdd.Open;

  SetEnabledButtons;
end;

procedure TGWorkTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);

  TableView.StoreToIniFile(cIniFileName, false);
  ViewAdd.StoreToIniFile(cIniFileName, false);

  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGWorkTypeForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableView.RestoreFromIniFile(cIniFileName);
  ViewAdd.RestoreFromIniFile(cIniFileName);

  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGWorkTypeForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteWorkTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkTypeForm.aDelWorkExecute(Sender: TObject);
  var
    vID, vRecNo : integer;
begin
  vRecNo := qWorkAdd.RecNo;

  vID := qWorkAdd.FieldByName('ID').AsInteger;

  tWorkAdd.Close;
  tWorkAdd.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
  tWorkAdd.Open;
  if tWorkAdd.Locate('ID', vID, []) then
    tWorkAdd.Delete;
  tWorkAdd.Close;

  qWorkAdd.Refresh;

  if qWorkAdd.RecordCount <> 0 then
    qWorkAdd.RecNo := vRecNo;
end;

procedure TGWorkTypeForm.aEditExecute(Sender: TObject);
begin
  FModified := EditWorkTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkTypeForm.aImportExecute(Sender: TObject);
begin
  ShowWaiting(cDataGetting);
  TableAll.Open;
  HideWaiting;

  ImportXLS(
    'WorkClass=Тип работы;' +
    'WorkerClass=Категория исполнителя;' +
    'Name=Название;' +
    'Code=Код;' +
    'Description=Описание;' +
    'Amount=Количество;' +
    'UnitName=Единица измерения;' +
    'Price=Цена;' +
    'Norm=Норма (мин.);' +
    'WarrantyTime=Срок гарантии;' +
    'WarrantyType=Вид гарантии;' +
    'FrequentWork=Частая;' +
    'PublicWork=Публичная;' +
    'Comment=Комментарий',
    'WorkClass;WorkerClass;Name;Code;Amount;UnitName;Price;Norm', '|', ';', '/', ',',
    'ImportWorkTypeProc',
    ImportProc);

  TableAll.Close;

  Query.Close;
  Query.Open;
end;

procedure TGWorkTypeForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGWorkTypeForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteWorkTypeDialog or FModified;
  SetEnabledButtons;
end;

procedure TGWorkTypeForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TGWorkTypeForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TGWorkTypeForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkTypeForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGWorkTypeForm.TableViewStylesGetContentStyle(
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

function TGWorkTypeForm.UndoDeleteWorkTypeDialog: boolean;
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

procedure TGWorkTypeForm.ViewAddFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGWorkTypeForm.ViewAddStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  vDeleted : boolean;
  vID : integer;
begin
  if not ARecord.IsData then Exit;

  Datas.DeletedRecordStyle.Color := DeletedRecordColor;

  vID := IsNull(ARecord.Values[ViewAddID.Index], 0);
  vDeleted := IsNull(ARecord.Values[ViewAddDeleted.Index], 0) = 1;

  if vDeleted then AStyle := Datas.DeletedRecordStyle;
end;

procedure TGWorkTypeForm.QueryCalcFields(DataSet: TDataSet);
begin
{  Dataset.FieldByName('Warranty').AsString :=
    Dataset.FieldByName('WarrantyTime').AsString + ' ' + Dataset.FieldByName('WTShortInfo').AsString;}
end;

procedure TGWorkTypeForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

function TGWorkTypeForm.ImportProc(AValue: string): string;
  var
    vStrings : TStringList;
    s, vWorkClass, vWorkerClass, vName, vCode, vPrice, vAmount, vUnitName, vNorm : string;
    vIDWorkerClass, vIDWorkClass : integer;
  const
    cQuota : char = '|';
begin
  vStrings := TStringList.Create;
  vStrings.Delimiter := ';';
  vStrings.StrictDelimiter := true;
  vStrings.QuoteChar := '|';
  vStrings.DelimitedText := AValue;

  vName := Trim(AnsiDequotedStr(vStrings.Values['Name'], '|'));
  vWorkClass := Trim(AnsiDequotedStr(vStrings.Values['WorkClass'], '|'));
  vWorkerClass := Trim(AnsiDequotedStr(vStrings.Values['WorkerClass'], '|'));
  vCode := Trim(AnsiDequotedStr(vStrings.Values['Code'], '|'));

  vPrice := Trim(AnsiDequotedStr(vStrings.Values['Price'], '|'));
  vPrice := StringReplace(vPrice, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  vPrice := StringReplace(vPrice, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  vNorm := Trim(AnsiDequotedStr(vStrings.Values['Norm'], '|'));
  vNorm := StringReplace(vNorm, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  vNorm := StringReplace(vNorm, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  vAmount := Trim(AnsiDequotedStr(vStrings.Values['Amount'], '|'));
  vAmount := StringReplace(vAmount, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  vAmount := StringReplace(vAmount, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  vUnitName := Trim(AnsiDequotedStr(vStrings.Values['UnitName'], '|'));

  if (vWorkClass = '') then
  begin
    Result := 'Не указан тип работы'
  end
  else
  if (vCode = '') then
  begin
    Result := 'Не указан код работы'
  end
  else
  if (vName = '') then
  begin
    Result := 'Не указано название работы'
  end
  else
  if (vWorkerClass = '') then
  begin
    Result := 'Не указана категория исполнителя'
  end
  else
  begin
    qWorkClass.Close;
    qWorkClass.ParamByName('N').AsString := vWorkClass;
    qWorkClass.Open;
    vIDWorkClass := qWorkClass.FieldBYName('ID').AsInteger;
    qWorkClass.Close;

    qWorkerClassName.Close;
    qWorkerClassName.ParamByName('N').AsString := vWorkerClass;
    qWorkerClassName.Open;
    vIDWorkerClass := qWorkerClassName.FieldBYName('ID').AsInteger;
    qWorkerClassName.Close;
    if vIDWorkerClass = 0 then
    begin
      qWorkerClassTag.Close;
      qWorkerClassTag.ParamByName('T').AsString := vWorkerClass;
      qWorkerClassTag.Open;
      vIDWorkerClass := qWorkerClassTag.FieldBYName('ID').AsInteger;
      qWorkerClassTag.Close;
    end;

    if vIDWorkerClass = 0 then
    begin
      Result := 'Не найдена категория исполнителя'
    end
    else
    if vIDWorkClass = 0 then
    begin
      Result := 'Не найден тип работы'
    end
    else
    begin
      if TableAll.Locate('ID_WorkClass;Name', VarArrayOf([vIDWorkClass, vName]), []) then
      begin
        Result := 'Вид работы уже есть'
      end
      else
      if TableAll.Locate('Code', vCode, []) then
      begin
        Result := 'Код работы уже есть'
      end
      else
      if not IsFloat(vPrice) then
      begin
        Result := 'Неверно указана цена'
      end
      else
      if not IsFloat(vAmount) then
      begin
        Result := 'Неверно указано количество'
      end
      else
      if not IsFloat(vNorm) then
      begin
        Result := 'Неверно указана норма'
      end
      else
      if vUnitName = '' then
      begin
        Result := 'Не указана единица измерения'
      end
      else
      begin
        TableAll.Append;
        TableAll.FieldByName('ID_AssertUser').AsInteger := UserID;
        TableAll.FieldByName('Active').AsInteger := 1;
        TableAll.FieldByName('Deleted').AsInteger := 0;

        TableAll.FieldByName('ID_WorkClass').AsInteger := vIDWorkClass;
        TableAll.FieldByName('ID_WorkerClass').Value := NullIfZero(vIDWorkerClass);

        TableAll.FieldByName('Name').AsString := vName;
        TableAll.FieldByName('Code').AsString := vCode;

        s := vPrice; //Trim(AnsiDequotedStr(vStrings.Values['Price'], '|'));
        if IsFloat(s) then TableAll.FieldByName('Price').AsFloat := StrToFloat(s);

        s := vAmount; //Trim(AnsiDequotedStr(vStrings.Values['Amount'], '|'));
        if IsFloat(s) then TableAll.FieldByName('Amount').AsFloat := StrToFloat(s);

        s := vNorm; //Trim(AnsiDequotedStr(vStrings.Values['Norm'], '|'));
        if IsFloat(s) then TableAll.FieldByName('Norm').AsFloat := StrToFloat(s);

        TableAll.FieldByName('UnitName').AsString := vUnitName;

        s := Trim(AnsiDequotedStr(vStrings.Values['FrequentWork'], '|'));
        if (s = '1') or (AnsiLowerCase(s) = 'true') or (AnsiLowerCase(s) = 'да') or (AnsiLowerCase(Copy(s, 1, 1)) = 'ч') then TableAll.FieldByName('FrequentWork').AsInteger := 1
        else TableAll.FieldByName('FrequentWork').AsInteger := 0;

        s := Trim(AnsiDequotedStr(vStrings.Values['PublicWork'], '|'));
        if (s = '1') or (AnsiLowerCase(s) = 'true') or (AnsiLowerCase(s) = 'да') or (AnsiLowerCase(Copy(s, 1, 1)) = 'п') then TableAll.FieldByName('PublicWork').AsInteger := 1
        else TableAll.FieldByName('PublicWork').AsInteger := 0;

        s := Trim(AnsiDequotedStr(vStrings.Values['WarrantyType'], '|'));
        if s = '' then TableAll.FieldByName('WarrantyType').Value := null
        else
          if (s = '1') or (AnsiLowerCase(s) = 'true') or (AnsiLowerCase(s) = 'да') or (AnsiLowerCase(Copy(s, 1, 1)) = 'м') then TableAll.FieldByName('WarrantyType').AsInteger := 1
          else TableAll.FieldByName('WarrantyType').AsInteger := 0;

        if TableAll.FieldByName('WarrantyType').Value = null then TableAll.FieldByName('WarrantyTime').Value := null
        else
        begin
          s := Trim(AnsiDequotedStr(vStrings.Values['WarrantyTime'], '|'));
          if IsInteger(s) then TableAll.FieldByName('WarrantyTime').AsFloat := StrToInt(s);
        end;

        ReadImportData(TableAll, 'Description;Comment', AValue, cQuota);
        TableAll.Post;

        Result := 'Вид работы добавлен'
      end;
    end
  end;

  vStrings.Free;
end;

procedure TGWorkTypeForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddWorkTypeDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGWorkTypeForm.aAddWorkClassExecute(Sender: TObject);
  var
    vIDR, vID : integer;
begin
  vID := 0;
  if SelectWorkClass(vID) then
  begin
    if not qWorkAdd.Locate('ID_WorkClassAdd;ID_WorkTypeAdd', VarArrayOf([vID, null]), []) then
    begin
      tWorkAdd.Close;
      tWorkAdd.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
      tWorkAdd.Open;

      tWorkAdd.Append;
      tWorkAdd.FieldByName('ID_WorkType').AsInteger := Query.FieldByName('ID').AsInteger;
      tWorkAdd.FieldByName('ID_WorkClassAdd').AsInteger := vID;
      tWorkAdd.Post;

      vIDR := tWorkAdd.FieldByName('ID').AsInteger;

      tWorkAdd.Close;

      qWorkAdd.Close;
      qWorkAdd.Open;

      qWorkAdd.Locate('ID', vIDR, []);
    end;
  end;
end;

procedure TGWorkTypeForm.aAddWorkExecute(Sender: TObject);
  var
    i, vIDR : integer;
    vID : TIntegerDynArray;
begin
  vIDR := qWorkAdd.FieldByName('ID').AsInteger;

  if SelectWorkTypeMulti(vID) then
  begin
    tWorkAdd.Close;
    tWorkAdd.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
    tWorkAdd.Open;
    for i := 0 to Length(vID) - 1 do
    begin
      if not tWorkAdd.Locate('ID_WorkTypeAdd', vID[i], []) then
      begin
        tWorkAdd.Append;
        tWorkAdd.FieldByName('ID_WorkType').AsInteger := Query.FieldByName('ID').AsInteger;
        tWorkAdd.FieldByName('ID_WorkTypeAdd').AsInteger := vID[i];
//        tWorkAdd.FieldByName('ID_WorkClassAdd').Value := Datas.ReadValues('worktype', 'ID_WorkClass', vID[i])[0];
        tWorkAdd.Post;
      end;
    end;
    tWorkAdd.Close;

    qWorkAdd.Close;
    qWorkAdd.Open;

    if Length(vID) > 0 then
      qWorkAdd.Locate('ID_WorkTypeAdd', vID[0], [])
    else
      qWorkAdd.Locate('ID', vIDR, [])
  end;
end;

procedure TGWorkTypeForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGWorkTypeForm.AddWorkTypeDialog(var IDWorkType: integer): boolean;
  var
    vName, vDescription, vComment : string;
    vActive : integer;
    vIDWorkClass : integer;
    vPrice, vNorm, vAmount : double;
    vUnitName, vWorkCode : string;
    vIDWorkerClass, vWarrantyType, vWarrantyTime, vFrequentWork, vPublicWork : integer;
    vPicture : TMemoryStream;
    vPictureType : string;
begin
  vActive := 1;
  vIDWorkClass := 0;
  vName := '';
  vDescription := '';
  vPrice := 0;
  vNorm := 0;
  vAmount := 1;
  vUnitName := 'шт';
  vWorkCode := '';
  vIDWorkerClass := 0;
  vWarrantyType := -1;
  vWarrantyTime := 0;
  vFrequentWork := 0;
  vPublicWork := 1;
  vPicture := TMemoryStream.Create;
  vPictureType := '';
  vComment := '';

  Result :=
    GetWorkTypeParams(
      vActive,
      vIDWorkClass,
      vName,
      vDescription,
      vUnitName,
      vWorkCode,
      vComment,

      vPrice,
      vNorm,
      vAmount,

      vIDWorkerClass,

      vWarrantyType,
      vWarrantyTime,

      vFrequentWork,
      vPublicWork,

      vPictureType,
      vPicture,

      0
      );

  if Result then
  begin
    if ExistsWorkType(vName, vIDWorkClass, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('ID_WorkClass').AsInteger := vIDWorkClass;
      FieldByName('ID_WorkerClass').Value := NullIfZero(vIDWorkerClass);

      FieldByName('Name').AsString := vName;
      FieldByName('Description').AsString := vDescription;
      FieldByName('Comment').AsString := vComment;
      FieldByName('UnitName').AsString := vUnitName;
      FieldByName('Code').AsString := vWorkCode;

      FieldByName('Price').AsFloat := vPrice;
      FieldByName('Amount').AsFloat := vAmount;
      FieldByName('Norm').Value := NullIfZero(vNorm);

      FieldByName('WarrantyType').Value := NullIf(vWarrantyType, -1);
      if FieldByName('WarrantyType').Value = null then FieldByName('WarrantyTime').Value := null
      else FieldByName('WarrantyTime').AsInteger := vWarrantyTime;

      FieldByName('FrequentWork').AsInteger := vFrequentWork;
      FieldByName('PublicWork').AsInteger := vPublicWork;

      vPicture.Position := 0;
      TBlobField(FieldByName('Picture')).LoadFromStream(vPicture);
      FieldByName('PictureType').AsString := vPictureType;

      Post;
      IDWorkType := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDWorkType, []);
    end;
  end;

  vPicture.Free;

  SetEnabledButtons;
end;

procedure TGWorkTypeForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGWorkTypeForm.DeleteWorkTypeDialog: boolean;
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

function TGWorkTypeForm.EditWorkTypeDialog: boolean;
  var
    vName, vDescription, vComment : string;
    vActive : integer;
    vIDWorkClass : integer;
    vPrice, vNorm, vAmount : double;
    vWorkCode, vUnitName : string;
    vIDWorkerClass, vWarrantyType, vWarrantyTime, vFrequentWork, vPublicWork : integer;
    vPicture : TMemoryStream;
    vPictureType : string;
    vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vName := FieldByName('Name').AsString;
    vDescription := FieldByName('Description').AsString;
    vComment := FieldByName('Comment').AsString;
    vUnitName := FieldByName('UnitName').AsString;
    vWorkCode := FieldByName('Code').AsString;

    vIDWorkClass := FieldByName('ID_WorkClass').AsInteger;
    vIDWorkerClass := FieldByName('ID_WorkerClass').AsInteger;

    vPrice := FieldByName('Price').AsFloat;
    vAmount := FieldByName('Amount').AsFloat;
    vNorm := FieldByName('Norm').AsFloat;

    if FieldByName('WarrantyType').AsString = '' then vWarrantyType := -1
    else vWarrantyType := FieldByName('WarrantyType').AsInteger;
    vWarrantyTime := FieldByName('WarrantyTime').AsInteger;

    vFrequentWork := FieldByName('FrequentWork').AsInteger;
    vPublicWork := FieldByName('PublicWork').AsInteger;

    vPicture := TMemoryStream.Create;
    TBlobField(FieldByName('Picture')).SaveToStream(vPicture);
    vPictureType := FieldByName('PictureType').AsString;

    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetWorkTypeParams(
      vActive,
      vIDWorkClass,
      vName,
      vDescription,
      vUnitName,
      vWorkCode,
      vComment,

      vPrice,
      vNorm,
      vAmount,

      vIDWorkerClass,

      vWarrantyType,
      vWarrantyTime,

      vFrequentWork,
      vPublicWork,

      vPictureType,
      vPicture,

      vID
      );

  if Result then
  begin
    if ExistsWorkType(vName, vIDWorkClass, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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
      FieldByName('Description').AsString := vDescription;
      FieldByName('Comment').AsString := vComment;
      FieldByName('UnitName').AsString := vUnitName;
      FieldByName('Code').AsString := vWorkCode;

      FieldByName('ID_WorkClass').AsInteger := vIDWorkClass;
      FieldByName('ID_WorkerClass').Value := NullIfZero(vIDWorkerClass);

      FieldByName('Price').AsFloat := vPrice;
      FieldByName('Amount').AsFloat := vAmount;
      FieldByName('Norm').Value := NullIfZero(vNorm);

      FieldByName('WarrantyType').Value := NullIf(vWarrantyType, -1);
      if FieldByName('WarrantyType').Value = null then FieldByName('WarrantyTime').Value := null
      else FieldByName('WarrantyTime').AsInteger := vWarrantyTime;

      FieldByName('FrequentWork').AsInteger := vFrequentWork;
      FieldByName('PublicWork').AsInteger := vPublicWork;

      vPicture.Position := 0;
      TBlobField(FieldByName('Picture')).LoadFromStream(vPicture);
      FieldByName('PictureType').AsString := vPictureType;

      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;

  vPicture.Free;

  SetEnabledButtons;
end;

function TGWorkTypeForm.ExistsWorkType(AName: string; AIDWorkClass : integer; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString := AName;
  qExists.ParamByName('C').AsInteger := AIDWorkClass;
  qExists.ParamByName('IDE').AsInteger := AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

end.
