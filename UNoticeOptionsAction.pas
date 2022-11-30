//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Условия для уведомлений
//
//------------------------------------------------------------------------------
unit UNoticeOptionsAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxBarBuiltInMenu,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxBar, cxPropertiesStore,
  System.Actions, Vcl.ActnList, cxClasses, cxGridCustomPopupMenu,
  cxGridPopupMenu, dxPSCore, dxPScxCommon, dxPSFileBasedXplorer, dxStatusBar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid;

type
  TNoticeOptionsActionForm = class(TForm)
    DataSource: TDataSource;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    Level: TcxGridLevel;
    StatusBar: TdxStatusBar;
    PSFileBasedExplorer: TdxPSFileBasedExplorer;
    ComponentPrinter: TdxComponentPrinter;
    ComponentPrinterLink1: TdxGridReportLink;
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
    aCancel: TAction;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    Table: TZQuery;
    Query: TZQuery;
    TableViewFieldName: TcxGridDBColumn;
    TableViewFieldCaption: TcxGridDBColumn;
    QueryID: TIntegerField;
    QueryTableName: TWideStringField;
    QueryTableCaption: TWideStringField;
    QueryFieldName: TWideStringField;
    QueryFieldCaption: TWideStringField;
    QueryOrderFieldName: TWideStringField;
    QueryOrderFieldCaption: TWideStringField;
    QueryOrderFieldValue: TWideStringField;
    QueryCondEqual: TSmallintField;
    QueryCondNotEqual: TSmallintField;
    QueryCanSetValue: TSmallintField;
    QueryCanSetNull: TSmallintField;
    TableViewTableName: TcxGridDBColumn;
    TableViewOrderFieldName: TcxGridDBColumn;
    TableViewOrderFieldCaption: TcxGridDBColumn;
    TableViewOrderFieldValue: TcxGridDBColumn;
    TableViewCondEqual: TcxGridDBColumn;
    TableViewCondNotEqual: TcxGridDBColumn;
    TableViewCanSetValue: TcxGridDBColumn;
    TableViewCanSetNull: TcxGridDBColumn;
    QueryOrderFieldValueCaption: TWideStringField;
    TableViewID: TcxGridDBColumn;
    TableViewTableCaption: TcxGridDBColumn;
    TableViewOrderFieldValueCaption: TcxGridDBColumn;
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
    procedure TableViewFocusedRecChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddNoticeOptionsActionDialog(var IDNoticeOptionsAction : integer) : boolean;
    function EditNoticeOptionsActionDialog : boolean;
    function DeleteNoticeOptionsActionDialog : boolean;
  public
    { Public declarations }
    function ExistsNoticeOptionsAction(AOrderFieldName : string; ATableName : string; AIDExclude : integer) : boolean;
  end;

//отображение окна справочника
function ShowNoticeOptionsAction(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddNoticeOptionsAction(var AIDNoticeOptionsAction : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditNoticeOptionsAction(AIDNoticeOptionsAction : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteNoticeOptionsAction(AIDNoticeOptionsAction : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UNoticeOptionsActionParams, mesdlg, UUtil, UWaiting, UConsts,
  MainUnit;

function DoAction(var AIDNoticeOptionsAction : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TNoticeOptionsActionForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TNoticeOptionsActionForm) then
  begin
    with FindForm(TNoticeOptionsActionForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TNoticeOptionsActionForm.Create(Application);
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
        Result := AddNoticeOptionsActionDialog(AIDNoticeOptionsAction);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDNoticeOptionsAction, []);
          Result := EditNoticeOptionsActionDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDNoticeOptionsAction, []);
            Result := DeleteNoticeOptionsActionDialog;
            Close;
          end;
  end;
end;

function ShowNoticeOptionsAction(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddNoticeOptionsAction(var AIDNoticeOptionsAction : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeOptionsAction, cAddAction, nil);
end;

function EditNoticeOptionsAction(AIDNoticeOptionsAction : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeOptionsAction, cEditAction, nil);
end;

function DeleteNoticeOptionsAction(AIDNoticeOptionsAction : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeOptionsAction, cDeleteAction, nil);
end;

procedure TNoticeOptionsActionForm.SetEnabledButtons;
  var
    ce, e : boolean;
begin
  with TableView.Controller do e := Assigned(FocusedRecord) and FocusedRecord.IsData;
  ce := CanEditInActionByAction(MainForm.aaNoticeOptionsAction);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce;
  aEdit.Enabled := e and ce;
end;

procedure TNoticeOptionsActionForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TNoticeOptionsActionForm.TableViewFocusedRecChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TNoticeOptionsActionForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TNoticeOptionsActionForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TNoticeOptionsActionForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteNoticeOptionsActionDialog or FModified;
  SetEnabledButtons;
end;

procedure TNoticeOptionsActionForm.aEditExecute(Sender: TObject);
begin
  FModified := EditNoticeOptionsActionDialog or FModified;
  SetEnabledButtons;
end;

procedure TNoticeOptionsActionForm.aPrintExecute(Sender: TObject);
begin
  ComponentPrinter.Preview(true);
end;

procedure TNoticeOptionsActionForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TNoticeOptionsActionForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TNoticeOptionsActionForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TNoticeOptionsActionForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TNoticeOptionsActionForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddNoticeOptionsActionDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TNoticeOptionsActionForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TNoticeOptionsActionForm.AddNoticeOptionsActionDialog(var IDNoticeOptionsAction: integer): boolean;
  var
    vOrderFieldName, vOrderFieldCaption, vOrderFieldValue, vOrderFieldValueCaption : string;
    vTableName, vTableCaption, vFieldName, vFieldCaption : string;
    vCondEqual, vCondNotEqual, vCanSetNull, vCanSetValue : boolean;
begin
  vOrderFieldName := '';
  vOrderFieldCaption := '';
  vOrderFieldValue := '';
  vOrderFieldValueCaption := '';
  vTableName := '';
  vTableCaption := '';
  vFieldName := '';
  vFieldCaption := '';
  vCondEqual := false;
  vCondNotEqual := false;
  vCanSetNull := false;
  vCanSetValue := false;

  Result := GetNoticeOptionsActionParams(
    vOrderFieldName, vOrderFieldCaption, vOrderFieldValue, vOrderFieldValueCaption,
    vTableName, vTableCaption, vFieldName, vFieldCaption,
    vCondEqual, vCondNotEqual, vCanSetNull, vCanSetValue);

  if Result then
  begin
    with Table do
      if not ExistsNoticeOptionsAction(vOrderFieldName, vTableName, 0) then
      begin
        Close;
        ParamByName('ID').AsInteger := 0;
        Open;
        Append;
        FieldByName('OrderFieldName').AsString := vOrderFieldName;
        FieldByName('OrderFieldCaption').AsString := vOrderFieldCaption;
        FieldByName('OrderFieldValue').AsString := vOrderFieldValue;
        FieldByName('OrderFieldValueCaption').AsString := vOrderFieldValueCaption;
        FieldByName('TableName').AsString := vTableName;
        FieldByName('TableCaption').AsString := vTableCaption;
        FieldByName('FieldName').AsString := vFieldName;
        FieldByName('FieldCaption').AsString := vFieldCaption;
        FieldByName('CondEqual').AsInteger := BooleanToInt(vCondEqual);
        FieldByName('CondNotEqual').AsInteger := BooleanToInt(vCondNotEqual);
        FieldByName('CanSetNull').AsInteger := BooleanToInt(vCanSetNull);
        FieldByName('CanSetValue').AsInteger := BooleanToInt(vCanSetValue);
        Post;
        IDNoticeOptionsAction := FieldByName('ID').AsInteger;
        Close;
        Query.Close;
        Query.Open;
        Query.Locate('ID', IDNoticeOptionsAction, []);
      end;
  end;
  SetEnabledButtons;
end;

function TNoticeOptionsActionForm.DeleteNoticeOptionsActionDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
    if DeleteRecSimple('NoticeOptionsAction', vID) then
    begin
      vRecNo := Query.RecNo;
      Query.Close;
      Query.Open;
      if Query.RecordCount > 1 then
        Query.RecNo := vRecNo;
    end;
  SetEnabledButtons;
end;

function TNoticeOptionsActionForm.EditNoticeOptionsActionDialog: boolean;
  var
    vOrderFieldName, vOrderFieldCaption, vOrderFieldValue, vOrderFieldValueCaption : string;
    vTableName, vTableCaption, vFieldName, vFieldCaption : string;
    vCondEqual, vCondNotEqual, vCanSetNull, vCanSetValue : boolean;
    vID : integer;
begin
  with Query do
  begin
    vOrderFieldName := FieldByName('OrderFieldName').AsString;
    vOrderFieldCaption := FieldByName('OrderFieldCaption').AsString;
    vOrderFieldValue := FieldByName('OrderFieldValue').AsString;
    vOrderFieldValueCaption := FieldByName('OrderFieldValueCaption').AsString;
    vTableName := FieldByName('TableName').AsString;
    vTableCaption := FieldByName('TableCaption').AsString;
    vFieldName := FieldByName('FieldName').AsString;
    vFieldCaption := FieldByName('FieldCaption').AsString;
    vCondEqual := FieldByName('CondEqual').AsInteger = 1;
    vCondNotEqual := FieldByName('CondNotEqual').AsInteger = 1;
    vCanSetNull := FieldByName('CanSetNull').AsInteger = 1;
    vCanSetValue := FieldByName('CanSetValue').AsInteger = 1;
    vID := FieldByName('ID').AsInteger;
  end;

  Result := GetNoticeOptionsActionParams(
    vOrderFieldName, vOrderFieldCaption,
    vOrderFieldValue, vOrderFieldValueCaption,
    vTableName, vTableCaption, vFieldName, vFieldCaption,
    vCondEqual, vCondNotEqual, vCanSetNull, vCanSetValue);

  if Result then
  begin
    with Table do
      if not ExistsNoticeOptionsAction(vOrderFieldName, vTableName, vID) then
      begin
        Close;
        ParamByName('ID').AsInteger := vID;
        Open;
        if Locate('ID', vID, []) then
        begin
          Edit;
          FieldByName('OrderFieldName').AsString := vOrderFieldName;
          FieldByName('OrderFieldCaption').AsString := vOrderFieldCaption;
          FieldByName('OrderFieldValue').AsString := vOrderFieldValue;
          FieldByName('OrderFieldValueCaption').AsString := vOrderFieldValueCaption;
          FieldByName('TableName').AsString := vTableName;
          FieldByName('TableCaption').AsString := vTableCaption;
          FieldByName('FieldName').AsString := vFieldName;
          FieldByName('FieldCaption').AsString := vFieldCaption;
          FieldByName('CondEqual').AsInteger := BooleanToInt(vCondEqual);
          FieldByName('CondNotEqual').AsInteger := BooleanToInt(vCondNotEqual);
          FieldByName('CanSetNull').AsInteger := BooleanToInt(vCanSetNull);
          FieldByName('CanSetValue').AsInteger := BooleanToInt(vCanSetValue);
          Post;
        end;
        Close;

        Query.Close;
        Query.Open;
        Query.Locate('ID', vID, []);
      end;
  end;
  SetEnabledButtons;
end;

function TNoticeOptionsActionForm.ExistsNoticeOptionsAction(AOrderFieldName,
  ATableName: string; AIDExclude : integer): boolean;
begin
  Result := false;
  if (ATableName <> '') then
  begin
   if IfNull(Datas.ReadValuesSQL('select id from noticeoptionsaction where OrderFieldName = ''' + AOrderFieldName + ''' and TableName <> '''' and ID <> ' + IntToStr(AIDExclude) + ' limit 1', 'ID')[0], 0) > 0 then
   begin
     ShowMsg('Для поля ' + AOrderFieldName + ' уже существует настройка работы со справочником');
     Result := true;
   end
   else
     if IfNull(Datas.ReadValuesSQL('select id from noticeoptionsaction where OrderFieldName = ''' + AOrderFieldName + ''' and TableName = '''' and ID <> ' + IntToStr(AIDExclude) + ' limit 1', 'ID')[0], 0) > 0 then
     begin
       ShowMsg('Для поля ' + AOrderFieldName + ' уже существует настройка работы с простыми значениями');
       Result := true;
     end
  end
  else
    if ATableName = '' then
    begin
      if IfNull(Datas.ReadValuesSQL('select id from noticeoptionsaction where OrderFieldName = ''' + AOrderFieldName + ''' and TableName <> '''' and ID <> ' + IntToStr(AIDExclude) + ' limit 1', 'ID')[0], 0) > 0 then
      begin
        ShowMsg('Для поля ' + AOrderFieldName + ' существует настройка работы со справочником');
        Result := true;
      end;
    end;
end;

procedure TNoticeOptionsActionForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
