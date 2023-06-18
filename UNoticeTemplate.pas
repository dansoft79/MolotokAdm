//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Шаблоны уведомлений
//
//------------------------------------------------------------------------------
unit UNoticeTemplate;

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
  PropFilerEh, PropStorageEh, dxColorEdit, dxmdaset, cxGroupBox, cxSplitter,
  dxScrollbarAnnotations;

type
  TNoticeTemplateForm = class(TForm)
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
    PopupMenu: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
    TableViewDInfo: TcxGridDBColumn;
    QueryColor: TIntegerField;
    TableViewTag: TcxGridDBColumn;
    TableViewColor: TcxGridDBColumn;
    QueryHeader: TWideStringField;
    QueryText: TWideStringField;
    QueryComment: TWideStringField;
    QueryPicture: TBlobField;
    QueryPictureType: TWideStringField;
    QueryShowTime: TIntegerField;
    QueryTimeFieldName: TWideStringField;
    QueryTimeCondition: TSmallintField;
    QueryTimeValue: TIntegerField;
    aAddNotificationManual: TAction;
    dxBarButton6: TdxBarButton;
    QueryTimeFieldCaption: TWideStringField;
    qAction: TZQuery;
    qCondition: TZQuery;
    mdCondition: TdxMemData;
    mdConditionID_NoticeTemplate: TIntegerField;
    mdConditionPosNum: TIntegerField;
    mdConditionOrderFieldName: TStringField;
    mdConditionOrderFieldCaption: TStringField;
    mdConditionConditionType: TStringField;
    mdConditionConditionTypeCaption: TStringField;
    mdConditionTableName: TStringField;
    mdConditionTableCaption: TStringField;
    mdConditionFieldName: TStringField;
    mdConditionFieldCaption: TStringField;
    mdConditionOrderFieldValue: TStringField;
    mdConditionOrderFieldValueCaption: TStringField;
    mdConditionEdited: TBooleanField;
    mdConditionID: TIntegerField;
    mdAction: TdxMemData;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    BooleanField1: TBooleanField;
    gbEmployee: TcxGroupBox;
    GridSnap: TcxGrid;
    ViewSnap: TcxGridDBTableView;
    LevelSnap: TcxGridLevel;
    BarManagerBar2: TdxBar;
    BarDockControlSnap: TdxBarDockControl;
    aAddSnap: TAction;
    aDelSnap: TAction;
    dxBarButton7: TdxBarButton;
    dxBarButton9: TdxBarButton;
    qNoticeSnap: TZQuery;
    dsNoticeSnap: TDataSource;
    qNoticeSnapUInfo: TWideStringField;
    qNoticeSnapLogin: TWideStringField;
    ViewSnapUInfo: TcxGridDBColumn;
    ViewSnapLogin: TcxGridDBColumn;
    ViewSnapID: TcxGridDBColumn;
    Splitter: TcxSplitter;
    tNoticeSnap: TZQuery;
    qNoticeSnapID_User: TSmallintField;
    qNoticeSnapID: TIntegerField;
    aSelectSnap: TAction;
    aClearSnap: TAction;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    qNoticeSnapURName: TWideStringField;
    ViewSnapURName: TcxGridDBColumn;
    aAddNotificationAuto: TAction;
    dxBarButton12: TdxBarButton;
    qTemp: TZQuery;
    qCond: TZQuery;
    qAct: TZQuery;
    qOrder: TZQuery;
    qTempList: TZQuery;
    qNotification: TZQuery;
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
    procedure aAddNotificationManualExecute(Sender: TObject);
    procedure aAddSnapExecute(Sender: TObject);
    procedure aDelSnapExecute(Sender: TObject);
    procedure aSelectSnapExecute(Sender: TObject);
    procedure aClearSnapExecute(Sender: TObject);
    procedure aAddNotificationAutoExecute(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddNoticeTemplateDialog(var IDNoticeTemplate : integer) : boolean;
    function EditNoticeTemplateDialog : boolean;
    function DeleteNoticeTemplateDialog : boolean;
    function UndoDeleteNoticeTemplateDialog : boolean;
    function ExistsNoticeTemplate(AName : string; AIDExclude : integer) : boolean;
  public
    { Public declarations }
    procedure SaveCondition(AIDNoticeTemplate : integer; AMemoryStream : TMemoryStream);
    procedure LoadCondition(AIDNoticeTemplate : integer; AMemoryStream : TMemoryStream);
    procedure SaveAction(AIDNoticeTemplate : integer; AMemoryStream : TMemoryStream);
    procedure LoadAction(AIDNoticeTemplate : integer; AMemoryStream : TMemoryStream);

    procedure ExecuteNotificationList;
    procedure ExecuteNotification(AID : integer);
  end;

//отображение окна справочника
function ShowNoticeTemplate(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddNoticeTemplate(var AIDNoticeTemplate : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditNoticeTemplate(AIDNoticeTemplate : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteNoticeTemplate(AIDNoticeTemplate : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  types, UOptions, UDatas, UNoticeTemplateParams, mesdlg, UUtil, DTKUtils,
  UWaiting, UConsts, MainUnit, USelectUser, USelectUserMulti;

function DoAction(var AIDNoticeTemplate : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TNoticeTemplateForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TNoticeTemplateForm) then
  begin
    with FindForm(TNoticeTemplateForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TNoticeTemplateForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    Query.Open;
    qNoticeSnap.Open;
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
        Result := AddNoticeTemplateDialog(AIDNoticeTemplate);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDNoticeTemplate, []);
          Result := EditNoticeTemplateDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDNoticeTemplate, []);
            Result := DeleteNoticeTemplateDialog;
            Close;
          end;
  end;
end;

function ShowNoticeTemplate(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddNoticeTemplate(var AIDNoticeTemplate : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeTemplate, cAddAction, nil);
end;

function EditNoticeTemplate(AIDNoticeTemplate : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeTemplate, cEditAction, nil);
end;

function DeleteNoticeTemplate(AIDNoticeTemplate : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeTemplate, cDeleteAction, nil);
end;

procedure TNoticeTemplateForm.SaveAction(AIDNoticeTemplate: integer;
  AMemoryStream: TMemoryStream);
begin
  qAction.Close;
  qAction.ParamByName('ID').AsInteger := AIDNoticeTemplate;
  qAction.Open;

  AMemoryStream.Position := 0;
  mdAction.Close;
  mdAction.Open;
  mdAction.LoadFromStream(AMemoryStream);

  //удаляем записи, отсутствующие в мемдата
  qAction.First;
  while not qAction.eof do
  begin
    if not mdAction.Locate('ID', qAction.FieldByName('ID').AsInteger, []) then
    begin
      qAction.Delete
    end
    else qAction.Next;
  end;

  qAction.Close;
  qAction.Open;

  //добавляем или обновляем
  mdAction.First;
  while not mdAction.eof do
  begin
    if mdAction.FieldByName('ID').AsInteger = 0 then
    begin
      //добавляем строку
      qAction.Append;
      qAction.FieldByName('ID_NoticeTemplate').AsInteger := AIDNoticeTemplate;
    end
    else
    begin
      //редактируем строку
      qAction.Locate('ID', mdAction.FieldByName('ID').AsInteger, []);
      qAction.Edit;

      if mdAction.FieldByName('Edited').AsBoolean then
      begin
      end;
    end;

    with mdAction do
    begin
      qAction.FieldByName('PosNum').Value := FieldByName('PosNum').Value;
      qAction.FieldByName('OrderFieldName').AsString := FieldByName('OrderFieldName').AsString;
      qAction.FieldByName('OrderFieldCaption').AsString := FieldByName('OrderFieldCaption').AsString;
      qAction.FieldByName('ActionType').AsString := FieldByName('ActionType').AsString;
      qAction.FieldByName('ActionTypeCaption').AsString := FieldByName('ActionTypeCaption').AsString;
      qAction.FieldByName('TableName').AsString := FieldByName('TableName').AsString;
      qAction.FieldByName('TableCaption').AsString := FieldByName('TableCaption').AsString;
      qAction.FieldByName('FieldName').AsString := FieldByName('FieldName').AsString;
      qAction.FieldByName('FieldCaption').AsString := FieldByName('FieldCaption').AsString;
      qAction.FieldByName('OrderFieldValue').AsString := FieldByName('OrderFieldValue').AsString;
      qAction.FieldByName('OrderFieldValueCaption').AsString := FieldByName('OrderFieldValueCaption').AsString;
      qAction.Post;
    end;

    mdAction.Next;
  end;
  qAction.Close;
end;

procedure TNoticeTemplateForm.SaveCondition(AIDNoticeTemplate: integer;
  AMemoryStream: TMemoryStream);
begin
  qCondition.Close;
  qCondition.ParamByName('ID').AsInteger := AIDNoticeTemplate;
  qCondition.Open;

  AMemoryStream.Position := 0;
  mdCondition.Close;
  mdCondition.Open;
  mdCondition.LoadFromStream(AMemoryStream);

  //удаляем записи, отсутствующие в мемдата
  qCondition.First;
  while not qCondition.eof do
  begin
    if not mdCondition.Locate('ID', qCondition.FieldByName('ID').AsInteger, []) then
    begin
      qCondition.Delete
    end
    else qCondition.Next;
  end;

  qCondition.Close;
  qCondition.Open;

  //добавляем или обновляем
  mdCondition.First;
  while not mdCondition.eof do
  begin
    if mdCondition.FieldByName('ID').AsInteger = 0 then
    begin
      //добавляем строку
      qCondition.Append;
      qCondition.FieldByName('ID_NoticeTemplate').AsInteger := AIDNoticeTemplate;
    end
    else
    begin
      //редактируем строку
      qCondition.Locate('ID', mdCondition.FieldByName('ID').AsInteger, []);
      qCondition.Edit;

      if mdCondition.FieldByName('Edited').AsBoolean then
      begin
      end;
    end;

    with mdCondition do
    begin
      qCondition.FieldByName('PosNum').Value := FieldByName('PosNum').Value;
      qCondition.FieldByName('OrderFieldName').AsString := FieldByName('OrderFieldName').AsString;
      qCondition.FieldByName('OrderFieldCaption').AsString := FieldByName('OrderFieldCaption').AsString;
      qCondition.FieldByName('ConditionType').AsString := FieldByName('ConditionType').AsString;
      qCondition.FieldByName('ConditionTypeCaption').AsString := FieldByName('ConditionTypeCaption').AsString;
      qCondition.FieldByName('TableName').AsString := FieldByName('TableName').AsString;
      qCondition.FieldByName('TableCaption').AsString := FieldByName('TableCaption').AsString;
      qCondition.FieldByName('FieldName').AsString := FieldByName('FieldName').AsString;
      qCondition.FieldByName('FieldCaption').AsString := FieldByName('FieldCaption').AsString;
      qCondition.FieldByName('OrderFieldValue').AsString := FieldByName('OrderFieldValue').AsString;
      qCondition.FieldByName('OrderFieldValueCaption').AsString := FieldByName('OrderFieldValueCaption').AsString;
      qCondition.Post;
    end;

    mdCondition.Next;
  end;
  qCondition.Close;
end;

procedure TNoticeTemplateForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.anTemplateEditor);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  aAddNotificationManual.Enabled := e;
  aAddNotificationAuto.Enabled := e;

  //------------------------------------------
  //видимость
  //------------------------------------------
  md := cbDel.ItemIndex in [1, 2];
  mnd := cbDel.ItemIndex in [0, 2];
  aAdd.Visible := mnd;
  aDelete.Visible := mnd;
  aUndoDelete.Visible := md;
  aEdit.Visible := mnd;

  aAddNotificationManual.Visible := mnd;
  aAddNotificationAuto.Visible := mnd;
end;

procedure TNoticeTemplateForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TNoticeTemplateForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TNoticeTemplateForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TNoticeTemplateForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteNoticeTemplateDialog or FModified;
  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.aDelSnapExecute(Sender: TObject);
  var
    vID, i : integer;
begin
  for i := 0 to ViewSnap.Controller.SelectedRecordCount - 1 do
    if ViewSnap.Controller.SelectedRecords[i].IsData then
    begin
      vID := IsNull(ViewSnap.Controller.SelectedRecords[i].Values[ViewSnapID.Index], 0);
      tNoticeSnap.Close;
      tNoticeSnap.ParamByName('ID').AsInteger := vID;
      tNoticeSnap.Open;
      if tNoticeSnap.RecordCount = 1 then
          tNoticeSnap.Delete;
      tNoticeSnap.Close;
    end;
  qNoticeSnap.Close;
  qNoticeSnap.Open;
end;

procedure TNoticeTemplateForm.aEditExecute(Sender: TObject);
begin
  FModified := EditNoticeTemplateDialog or FModified;
  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.aAddNotificationAutoExecute(Sender: TObject);
  var
    vID : integer;
begin
//  ExecuteNotificationList;

  vID := Query.FieldByName('ID').AsInteger;

  ExecuteNotification(vID);
end;

procedure TNoticeTemplateForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TNoticeTemplateForm.aSelectSnapExecute(Sender: TObject);
begin
  ViewSnap.DataController.SelectAll;
end;

procedure TNoticeTemplateForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteNoticeTemplateDialog or FModified;
  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;
end;

procedure TNoticeTemplateForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

procedure TNoticeTemplateForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TNoticeTemplateForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TNoticeTemplateForm.TableViewStylesGetContentStyle(
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

function TNoticeTemplateForm.UndoDeleteNoticeTemplateDialog: boolean;
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

procedure TNoticeTemplateForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.LoadAction(AIDNoticeTemplate: integer;
  AMemoryStream: TMemoryStream);
  var
    v : variant;
begin
  mdAction.Close;
  mdAction.Open;

  qAction.Close;
  qAction.ParamByName('ID').AsInteger := AIDNoticeTemplate;
  qAction.Open;
  qAction.First;
  while not qAction.eof do
    with mdAction do
    begin
      Append;
      FieldByName('Edited').AsBoolean := false;
      FieldByName('ID').AsInteger := qAction.FieldByName('ID').AsInteger;
      FieldByName('ID_NoticeTemplate').Value := qAction.FieldByName('ID_NoticeTemplate').Value;
      FieldByName('PosNum').Value := qAction.FieldByName('PosNum').Value;
      FieldByName('OrderFieldName').AsString := qAction.FieldByName('OrderFieldName').AsString;
      FieldByName('OrderFieldCaption').AsString := qAction.FieldByName('OrderFieldCaption').AsString;
      FieldByName('ActionType').AsString := qAction.FieldByName('ActionType').AsString;
      FieldByName('ActionTypeCaption').AsString := qAction.FieldByName('ActionTypeCaption').AsString;
      FieldByName('TableName').AsString := qAction.FieldByName('TableName').AsString;
      FieldByName('TableCaption').AsString := qAction.FieldByName('TableCaption').AsString;
      FieldByName('FieldName').AsString := qAction.FieldByName('FieldName').AsString;
      FieldByName('FieldCaption').AsString := qAction.FieldByName('FieldCaption').AsString;
      FieldByName('OrderFieldValue').AsString := qAction.FieldByName('OrderFieldValue').AsString;
      FieldByName('OrderFieldValueCaption').AsString := qAction.FieldByName('OrderFieldValueCaption').AsString;
      Post;

      qAction.Next;
    end;
  qAction.Close;

  AMemoryStream.Clear;
  mdAction.SaveToStream(AMemoryStream);
end;


procedure TNoticeTemplateForm.LoadCondition(AIDNoticeTemplate: integer;
  AMemoryStream: TMemoryStream);
  var
    v : variant;
begin
  mdCondition.Close;
  mdCondition.Open;

  qCondition.Close;
  qCondition.ParamByName('ID').AsInteger := AIDNoticeTemplate;
  qCondition.Open;
  qCondition.First;
  while not qCondition.eof do
    with mdCondition do
    begin
      Append;
      FieldByName('Edited').AsBoolean := false;
      FieldByName('ID').AsInteger := qCondition.FieldByName('ID').AsInteger;
      FieldByName('ID_NoticeTemplate').Value := qCondition.FieldByName('ID_NoticeTemplate').Value;
      FieldByName('PosNum').Value := qCondition.FieldByName('PosNum').Value;
      FieldByName('OrderFieldName').AsString := qCondition.FieldByName('OrderFieldName').AsString;
      FieldByName('OrderFieldCaption').AsString := qCondition.FieldByName('OrderFieldCaption').AsString;
      FieldByName('ConditionType').AsString := qCondition.FieldByName('ConditionType').AsString;
      FieldByName('ConditionTypeCaption').AsString := qCondition.FieldByName('ConditionTypeCaption').AsString;
      FieldByName('TableName').AsString := qCondition.FieldByName('TableName').AsString;
      FieldByName('TableCaption').AsString := qCondition.FieldByName('TableCaption').AsString;
      FieldByName('FieldName').AsString := qCondition.FieldByName('FieldName').AsString;
      FieldByName('FieldCaption').AsString := qCondition.FieldByName('FieldCaption').AsString;
      FieldByName('OrderFieldValue').AsString := qCondition.FieldByName('OrderFieldValue').AsString;
      FieldByName('OrderFieldValueCaption').AsString := qCondition.FieldByName('OrderFieldValueCaption').AsString;
      Post;

      qCondition.Next;
    end;
  qCondition.Close;

  AMemoryStream.Clear;
  mdCondition.SaveToStream(AMemoryStream);
end;

procedure TNoticeTemplateForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddNoticeTemplateDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.aAddNotificationManualExecute(Sender: TObject);
  var
    vID, vShowTime, vColor : integer;
    vText, vHeader : string;
    vIDUser : integer;
begin
  vIDUser := UserID;
  if SelectUser(vIDUser) then
  begin
    vID := Query.FieldByName('ID').AsInteger;
    vHeader := Query.FieldByName('Header').AsString;
    vText := Query.FieldByName('Text').AsString;
    vColor := Query.FieldByName('Color').AsInteger;
    vShowTime := Query.FieldByName('ShowTime').AsInteger;

    AddNotificationManual(IDOrderList, vID, vIDUser, vHeader, vText, vColor, vShowTime);
  end;
end;

procedure TNoticeTemplateForm.aAddSnapExecute(Sender: TObject);
  var
    vID : TIntegerDynArray;
    vName : TStringDynArray;
    i : integer;
begin
  SetLength(vID, 0);
  SetLength(vName, 0);
  if SelectUserMulti(vID, vName) then
  begin
    for i := 0 to Length(vID) - 1 do
      if not qNoticeSnap.Locate('ID_User', vID[i], []) then
      begin
        tNoticeSnap.Close;
        tNoticeSnap.ParamByName('ID').AsInteger := 0;
        tNoticeSnap.Open;
        tNoticeSnap.Append;
        tNoticeSnap.FieldByName('ID_User').AsInteger := vID[i];
        tNoticeSnap.FieldByName('ID_NoticeTemplate').AsInteger := Query.FieldByName('ID').AsInteger;
        tNoticeSnap.Post;
      end;
  end;
  qNoticeSnap.Close;
  qNoticeSnap.Open;
end;

procedure TNoticeTemplateForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TNoticeTemplateForm.aClearSnapExecute(Sender: TObject);
begin
  ViewSnap.DataController.ClearSelection;
end;

function TNoticeTemplateForm.AddNoticeTemplateDialog(var IDNoticeTemplate: integer): boolean;
  var
    vHeader, vComment, vText : string;
    vActive, vColor, vShowTime : integer;
    vCond, vAct, vPicture : TMemoryStream;
    vPictureType : string;
    vTimeFieldName, vTimeFieldCaption : string;
    vTimeCondition, vTimeValue : integer;
begin
  vActive := 1;
  vHeader := '';
  vText := '';
  vComment := '';
  vColor := clNone;
  vShowTime := 0;
  vPicture := TMemoryStream.Create;
  vPictureType := '';
  vTimeFieldName := '';
  vTimeFieldCaption := '';
  vTimeCondition := 1;
  vTimeValue := 0;

  vCond := TMemoryStream.Create;
  vAct := TMemoryStream.Create;

  Result :=
    GetNoticeTemplateParams(
      vActive,
      vColor,
      vShowTime,
      vHeader,
      vText,
      vComment,
      vPictureType,
      vPicture,
      vTimeFieldName, vTimeFieldCaption,
      vTimeCondition, vTimeValue,
      vCond, vAct,
      0
      );

  if Result then
  begin
    if ExistsNoticeTemplate(vHeader, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('Color').AsInteger := vColor;
      FieldByName('ShowTime').AsInteger := vShowTime;

      FieldByName('Header').AsString := vHeader;
      FieldByName('Text').AsString := vText;
      FieldByName('Comment').AsString := vComment;

      vPicture.Position := 0;
      TBlobField(FieldByName('Picture')).LoadFromStream(vPicture);
      FieldByName('PictureType').AsString := vPictureType;

      FieldByName('TimeFieldName').AsString := vTimeFieldName;
      FieldByName('TimeFieldCaption').AsString := vTimeFieldCaption;
      FieldByName('TimeCondition').AsInteger := vTimeCondition;
      FieldByName('TimeValue').AsInteger := vTimeValue;

      Post;
      IDNoticeTemplate := FieldByName('ID').AsInteger;
      Close;

      SaveCondition(IDNoticeTemplate, vCond);
      SaveAction(IDNoticeTemplate, vAct);

      Query.Refresh;

      Query.Locate('ID', IDNoticeTemplate, []);
    end;
  end;

  vPicture.Free;
  vCond.Free;
  vAct.Free;

  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TNoticeTemplateForm.DeleteNoticeTemplateDialog: boolean;
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

function TNoticeTemplateForm.EditNoticeTemplateDialog: boolean;
  var
    vHeader, vComment, vText : string;
    vID, vActive, vColor, vShowTime : integer;
    vAct, vCond, vPicture : TMemoryStream;
    vPictureType : string;
    vTimeFieldName, vTimeFieldCaption : string;
    vTimeCondition, vTimeValue : integer;
begin
  vPicture := TMemoryStream.Create;
  vCond := TMemoryStream.Create;
  vAct := TMemoryStream.Create;

  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;

    vColor := FieldByName('Color').AsInteger;
    vShowTime := FieldByName('ShowTime').AsInteger;

    vHeader := FieldByName('Header').AsString;
    vText := FieldByName('Text').AsString;
    vComment := FieldByName('Comment').AsString;

    TBlobField(FieldByName('Picture')).SaveToStream(vPicture);
    vPictureType := FieldByName('PictureType').AsString;

    vTimeFieldName := FieldByName('TimeFieldName').AsString;
    vTimeFieldCaption := FieldByName('TimeFieldCaption').AsString;
    vTimeCondition := FieldByName('TimeCondition').AsInteger;
    vTimeValue := FieldByName('TimeValue').AsInteger;

    vID := FieldByName('ID').AsInteger;

    LoadCondition(vID, vCond);
    LoadAction(vID, vAct);
  end;

  Result :=
    GetNoticeTemplateParams(
      vActive,
      vColor,
      vShowTime,
      vHeader,
      vText,
      vComment,
      vPictureType,
      vPicture,
      vTimeFieldName, vTimeFieldCaption,
      vTimeCondition, vTimeValue,
      vCond, vAct,
      vID);

  if Result then
  begin
    if ExistsNoticeTemplate(vHeader, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;

      FieldByName('Color').AsInteger := vColor;
      FieldByName('ShowTime').AsInteger := vShowTime;

      FieldByName('Header').AsString := vHeader;
      FieldByName('Text').AsString := vText;
      FieldByName('Comment').AsString := vComment;

      vPicture.Position := 0;
      TBlobField(FieldByName('Picture')).LoadFromStream(vPicture);
      FieldByName('PictureType').AsString := vPictureType;

      FieldByName('TimeFieldName').AsString := vTimeFieldName;
      FieldByName('TimeFieldCaption').AsString := vTimeFieldCaption;
      FieldByName('TimeCondition').AsInteger := vTimeCondition;
      FieldByName('TimeValue').AsInteger := vTimeValue;

      Post;
      Close;

      SaveCondition(vID, vCond);
      SaveAction(vID, vAct);

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TNoticeTemplateForm.ExecuteNotification(AID: integer);
  var
    vSQLOrder : string;
    vTimeField : string;
    vTimeCond, vTimeValue : integer;
    vSQLTime, vSQLFunc : string;
    vCondType, vSQLCond : string;
    vActType, vSQLAct : string;
begin
  qTemp.Close;
  qTemp.ParamByName('ID').AsInteger := AID;
  qTemp.Open;

  //формируем SQL точки отсчета
  vTimeField := qTemp.FIeldByName('TimeFieldName').AsString;
  vTimeCond := qTemp.FIeldByName('TimeCondition').AsInteger;
  vTimeValue := qTemp.FIeldByName('TimeValue').AsInteger;
  if vTimeCond = 1 then vSQLFunc := 'date_add'
  else vSQLFunc := 'date_sub';

  if vTimeValue > 0 then
  begin
    vSQLTime := vSQLFunc + '(' + vTimeField + ', interval ' + IntToStr(vTimeValue) + ' minute) <= now()';
    vSQLTime := vSQLTime + ' and Extract(hour from TimeDiff(now(), ' + vSQLFunc + '(' + vTimeField + ', interval ' + IntToStr(vTimeValue) + ' minute))) < 24'
  end
  else
  begin
    vSQLTime := vTimeField + ' <= now()';
    vSQLTime := vSQLTime + ' and Extract(hour from TimeDiff(now(), ' + vTimeField + ')) < 24';
  end;

  //формируем SQL условия
  qCond.Close;
  qCond.ParamByName('ID').AsInteger := qTemp.FieldByName('ID').AsInteger;
  qCond.Open;
  qCond.First;
  vSQLCond := '';
  while not qCond.eof do
  begin
    vCOndType := qCond.FieldByName('ConditionType').AsString;
    if qCond.FieldByName('TableName').AsString <> '' then
    begin
      vSQLCond := vSQLCond + ' and ' + qCond.FieldByName('OrderFieldName').AsString;
      vSQLCond := vSQLCond + ' ' + vCondType;
      vSQLCond := vSQLCond + ' ' + qCond.FieldByName('OrderFieldValue').AsString;
    end
    else
    begin
      if qCond.FieldByName('OrderFieldValue').AsString = 'null' then
      begin
        vSQLCond := vSQLCond + ' and ' + qCond.FieldByName('OrderFieldName').AsString;
        if vCondType = '=' then vSQLCond := vSQLCond + ' is null'
        else
          if vCondType = '<>' then vSQLCond := vSQLCond + ' is not null'
          else vSQLCond := vSQLCond + vCondType + ' null';
      end
      else
      begin
        vSQLCond := vSQLCond + ' and ' + qCond.FieldByName('OrderFieldName').AsString;
        vSQLCond := vSQLCond + ' ' + vCondType;
        vSQLCond := vSQLCond + ' ' + qCond.FieldByName('OrderFieldValue').AsString;
      end;
    end;
    qCond.Next;
  end;
  qCond.Close;

  //формируем SQL действий
  qAct.Close;
  qAct.ParamByName('ID').AsInteger := qTemp.FieldByName('ID').AsInteger;
  qAct.Open;
  qAct.First;
  vSQLAct := '';
  while not qAct.eof do
  begin
    vActType := qAct.FieldByName('ActionType').AsString;
    if vActType = 'null' then
    begin
      if vSQLAct <> '' then vSQLAct := vSQLAct + ', ';
      vSQLAct := vSQLAct + qAct.FieldByName('OrderFieldName').AsString;
      vSQLAct := vSQLAct + ' = null';
    end
    else
      if vActType = 'value' then
      begin
        if vSQLAct <> '' then vSQLAct := vSQLAct + ', ';
        vSQLAct := vSQLAct + qAct.FieldByName('OrderFieldName').AsString;
        vSQLAct := vSQLAct + '=';
        vSQLAct := vSQLAct + '''' + qAct.FieldByName('OrderFieldValue').AsString + '''';
      end;
    qAct.Next;
  end;
  if vSQLAct <> '' then
  begin
    vSQLAct := 'update orderlist set ' + vSQLAct;
  end;

  qAct.Close;

  //выбираем все заказы, для которых наступил момент c выполнением условий
  //и по которым не было создано уведомления данного типа
  vSQLOrder := 'select * from orderlist where ' +
    vSQLTime +
    vSQLCond +
    ' and not id in (select id_orderlist from notificationorderlist where ID_NoticeTemplate = ' + IntToStr(AID) + ')';
  qOrder.Close;
  qOrder.SQL.Text := vSQLOrder;
  qOrder.Open;
  qOrder.First;
  while not qOrder.eof do
  begin
    qNotification.Close;
    qNotification.ParamByName('ID').AsInteger := 0;
    qNotification.Open;
    qNotification.Append;
    qNotification.FieldBYName('ID_OrderList').AsInteger := qOrder.FIeldByName('ID').AsInteger;
    qNotification.FieldBYName('ID_NoticeTemplate').AsInteger := AID;
    qNotification.FieldBYName('Header').AsString := qTemp.FieldBYName('Header').AsString;
    qNotification.FieldBYName('Text').AsString := qTemp.FieldBYName('Text').AsString;
    qNotification.FieldBYName('Color').AsInteger := qTemp.FieldBYName('Color').AsInteger;
    qNotification.FieldBYName('ShowTime').AsInteger := qTemp.FieldBYName('ShowTime').AsInteger;
    qNotification.FieldByName('Manual').AsInteger := 0;
    qNotification.Post;
    qNotification.Close;
    //пользователи добавляется по триггеру
    //также по триггеру добавляется в историю отработка уведомления

    //сейчас приделываем действия
    if vSQLAct <> '' then
      ExecSQL(vSQLAct + ' where ID = ' + qOrder.FIeldByName('ID').AsString);

    qOrder.Next;
  end;
  qOrder.Close;

  qTemp.Close;
end;

procedure TNoticeTemplateForm.ExecuteNotificationList;
  var
    vID : integer;
begin
  qTempList.Close;
  qTempList.Open;
  qTempList.First;
  while not qTempList.eof do
  begin
    vID := qTempList.FieldByName('ID').AsInteger;

    ExecuteNotification(vID);

    qTempList.Next;
  end;
  qTempList.Close;
end;

function TNoticeTemplateForm.ExistsNoticeTemplate(AName: string; AIDExclude : integer): boolean;
begin
  qExists.Close;
  qExists.ParamByName('N').AsString := AName;
  qExists.ParamByName('IDE').AsInteger := AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

procedure TNoticeTemplateForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
