//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Опросник
//
//------------------------------------------------------------------------------
unit UGSurvey;

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
  PropFilerEh, PropStorageEh, dxScrollbarAnnotations, cxSplitter;

type
  TGSurveyForm = class(TForm)
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
    TableViewComment: TcxGridDBColumn;
    PopupMenu: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    cbDel: TdxBarCombo;
    cbActive: TdxBarCombo;
    qExists: TZQuery;
    aUndoDelete: TAction;
    dxBarButton4: TdxBarButton;
    QueryPosition: TIntegerField;
    QueryComment: TWideMemoField;
    TableViewActive: TcxGridDBColumn;
    TableViewPosition: TcxGridDBColumn;
    QueryQuestion: TWideStringField;
    QueryVisibility: TSmallintField;
    QueryAnswerType: TSmallintField;
    QueryAnswerRequired: TSmallintField;
    QueryVisInfo: TWideStringField;
    QueryAnswType: TWideStringField;
    TableViewAnswerRequired: TcxGridDBColumn;
    TableViewVisInfo: TcxGridDBColumn;
    TableViewAnswType: TcxGridDBColumn;
    pRight: TPanel;
    SplitterBottom: TcxSplitter;
    GridAnswer: TcxGrid;
    ViewAnswer: TcxGridDBTableView;
    LevelAnswer: TcxGridLevel;
    BarManagerBar2: TdxBar;
    DockControlAnswer: TdxBarDockControl;
    aAddAnswer: TAction;
    aEditAnswer: TAction;
    aDeleteAnswer: TAction;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton9: TdxBarButton;
    qAnswer: TZQuery;
    SmallintField1: TSmallintField;
    DateTimeField1: TDateTimeField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    WideStringField1: TWideStringField;
    SmallintField4: TSmallintField;
    IntegerField1: TIntegerField;
    dsAnswer: TDataSource;
    ViewAnswerID: TcxGridDBColumn;
    ViewAnswerAssertTime: TcxGridDBColumn;
    ViewAnswerDeleted: TcxGridDBColumn;
    ViewAnswerActive: TcxGridDBColumn;
    ViewAnswerAssertUser: TcxGridDBColumn;
    ViewAnswerPosition: TcxGridDBColumn;
    qAnswerID_Survey: TSmallintField;
    qAnswerAnswer: TWideStringField;
    ViewAnswerAnswer: TcxGridDBColumn;
    tAnswer: TZQuery;
    qExistsAnswer: TZQuery;
    aUndoDeleteAnswer: TAction;
    dxBarButton10: TdxBarButton;
    qAnswerAnswerEdit: TSmallintField;
    qAnswerAnswerChecked: TSmallintField;
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
    procedure aAddAnswerExecute(Sender: TObject);
    procedure aDeleteAnswerExecute(Sender: TObject);
    procedure aEditAnswerExecute(Sender: TObject);
    procedure aUndoDeleteAnswerExecute(Sender: TObject);
    procedure ViewAnswerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ViewAnswerKeyPress(Sender: TObject; var Key: Char);
    procedure qAnswerAfterOpen(DataSet: TDataSet);
    procedure qAnswerAfterScroll(DataSet: TDataSet);
    procedure ViewAnswerDblClick(Sender: TObject);
    procedure ViewAnswerStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddSurveyDialog(var IDSurvey : integer) : boolean;
    function EditSurveyDialog : boolean;
    function DeleteSurveyDialog : boolean;
    function UndoDeleteSurveyDialog : boolean;

    function ExistsSurvey(AQuestion : string; AIDExclude : integer) : boolean;
    function ExistsSurveyAnswer(AIDSurvey : integer; AAnswer : string; AIDExclude : integer) : boolean;

    function AddSurveyAnswerDialog(var IDSurveyAnswer : integer) : boolean;
    function EditSurveyAnswerDialog : boolean;
    function DeleteSurveyAnswerDialog : boolean;
    function UndoDeleteSurveyAnswerDialog : boolean;

    //предзаполнение ответов для логического вопроса
    procedure InitAnswerBoolean;
    //предзаполнение ответов для свободного вопроса
    procedure InitAnswerFree;
    //предзаполнение ответов для вопроса с одним ответом
    procedure InitAnswerOne;

    //получение максимальной позиции вопросв
    function GetMaxSurveyPosition : integer;
    //получение максимальной позиции ответов
    function GetMaxSurveyAnswerPosition(AIDSurvey : integer) : integer;

  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowSurvey(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddSurvey(var AIDSurvey : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditSurvey(AIDSurvey : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteSurvey(AIDSurvey : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGSurveyParams, UGSurveyAnswerParams,
  mesdlg, UUtil, DTKUtils, UWaiting, UConsts, MainUnit;

function DoAction(var AIDSurvey : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGSurveyForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGSurveyForm) then
  begin
    with FindForm(TGSurveyForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGSurveyForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    Query.Open;
    qAnswer.Open;
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
        Result := AddSurveyDialog(AIDSurvey);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDSurvey, []);
          Result := EditSurveyDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDSurvey, []);
            Result := DeleteSurveyDialog;
            Close;
          end;
  end;
end;

function ShowSurvey(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddSurvey(var AIDSurvey : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDSurvey, cAddAction, nil);
end;

function EditSurvey(AIDSurvey : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDSurvey, cEditAction, nil);
end;

function DeleteSurvey(AIDSurvey : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDSurvey, cDeleteAction, nil);
end;

procedure TGSurveyForm.SetEnabledButtons;
  var
    ce, e, ea, del, dela : boolean;
    md, mnd : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  with ViewAnswer.Controller do
    ea :=
      qAnswer.Active and
      not qAnswer.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  del := e and Query.Active and (Query.FieldByName('Deleted').AsINteger = 1);

  dela := ea and qAnswer.Active and (qAnswer.FieldByName('Deleted').AsINteger = 1);

  ce := CanEditInActionByAction(MainForm.agSurvey);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  aAddAnswer.Enabled := e and ce;
  aDeleteAnswer.Enabled := ea and e and ce and not dela;
  aUndoDeleteAnswer.Enabled := ea and e and ce and dela;
  aEditAnswer.Enabled := ea and e and ce and not dela;

  //------------------------------------------
  //видимость
  //------------------------------------------
  md := cbDel.ItemIndex in [1, 2];
  mnd := cbDel.ItemIndex in [0, 2];
  aAdd.Visible := mnd;
  aDelete.Visible := mnd;
  aUndoDelete.Visible := md;
  aEdit.Visible := mnd;

  aAddAnswer.Visible := mnd;
  aDeleteAnswer.Visible := mnd;
  aUndoDeleteAnswer.Visible := md;
  aEditAnswer.Visible := mnd;
end;

procedure TGSurveyForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGSurveyForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGSurveyForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGSurveyForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGSurveyForm.aDeleteAnswerExecute(Sender: TObject);
begin
  FModified := DeleteSurveyAnswerDialog or FModified;
  SetEnabledButtons;
end;

procedure TGSurveyForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteSurveyDialog or FModified;
  SetEnabledButtons;
end;

procedure TGSurveyForm.aEditAnswerExecute(Sender: TObject);
begin
  FModified := EditSurveyAnswerDialog or FModified;
  SetEnabledButtons;
end;

procedure TGSurveyForm.aEditExecute(Sender: TObject);
begin
  FModified := EditSurveyDialog or FModified;
  SetEnabledButtons;
end;

procedure TGSurveyForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGSurveyForm.aUndoDeleteAnswerExecute(Sender: TObject);
begin
  FModified := UndoDeleteSurveyAnswerDialog or FModified;
  SetEnabledButtons;
end;

procedure TGSurveyForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteSurveyDialog or FModified;
  SetEnabledButtons;
end;

procedure TGSurveyForm.cbActiveChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('A').AsInteger := cbActive.ItemIndex;
  Query.Open;

  qAnswer.Close;
  qAnswer.ParamByName('A').AsInteger := cbActive.ItemIndex;
  qAnswer.Open;
end;

procedure TGSurveyForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;

  qAnswer.Close;
  qAnswer.ParamByName('D').AsInteger := cbDel.ItemIndex;
  qAnswer.Open;
end;

procedure TGSurveyForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGSurveyForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGSurveyForm.TableViewStylesGetContentStyle(
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

function TGSurveyForm.UndoDeleteSurveyAnswerDialog: boolean;
  var
    vRecNo, vID : integer;
begin
  vID := qAnswer.FieldByName('ID').AsInteger;

  vRecNo := qAnswer.RecNo;

  tAnswer.Close;
  tAnswer.ParamByName('ID').AsInteger := vID;
  tAnswer.Open;
  tAnswer.Edit;
  tAnswer.FieldByName('ID_AssertUser').AsInteger := UserID;
  tAnswer.FieldByName('Deleted').AsInteger := 0;
  tAnswer.Post;
  tAnswer.Close;

  qAnswer.Refresh;

  if qAnswer.RecordCount > 1 then
    qAnswer.RecNo := vRecNo;

  SetEnabledButtons;
end;

function TGSurveyForm.UndoDeleteSurveyDialog: boolean;
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

procedure TGSurveyForm.ViewAnswerDblClick(Sender: TObject);
begin
  if aEditAnswer.Enabled then aEditAnswer.Execute;
end;

procedure TGSurveyForm.ViewAnswerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAddAnswer.Enabled then aAddAnswer.Execute;
  46 : if aDeleteAnswer.Enabled then aDeleteAnswer.Execute;
  end;
end;

procedure TGSurveyForm.ViewAnswerKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAddAnswer.Enabled then aAddAnswer.Execute;
  '-' : if aDeleteAnswer.Enabled then aDeleteAnswer.Execute;
  end;
end;

procedure TGSurveyForm.ViewAnswerStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  vDeleted : boolean;
  vID : integer;
begin
  if not ARecord.IsData then Exit;

  Datas.DeletedRecordStyle.Color := DeletedRecordColor;

  vID := IsNull(ARecord.Values[ViewAnswerID.Index], 0);
  vDeleted := IsNull(ARecord.Values[ViewAnswerDeleted.Index], 0) = 1;

  if vDeleted then AStyle := Datas.DeletedRecordStyle;
end;

procedure TGSurveyForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGSurveyForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

function TGSurveyForm.GetMaxSurveyAnswerPosition(AIDSurvey: integer): integer;
  var
    v : variant;
begin
  v := Datas.ReadValuesSQL('select max(Position) as MP from SurveyAnswer where ID_Survey = ' + IntToStr(AIDSurvey), 'MP');
  Result := IsNull(v[0], 0);
end;

function TGSurveyForm.GetMaxSurveyPosition: integer;
  var
    v : variant;
begin
  v := Datas.ReadValuesSQL('select max(Position) as MP from Survey', 'MP');
  Result := IsNull(v[0], 0);
end;

procedure TGSurveyForm.InitAnswerBoolean;
begin
  with tAnswer do
  begin
    Close;
    ParamByName('ID').AsInteger := 0;
    Open;
    Append;
    FieldByName('ID_Survey').AsInteger := Query.FieldByName('ID').AsInteger;
    FieldByName('ID_AssertUser').AsInteger := UserID;
    FieldByName('Active').AsInteger := 1;
    FieldByName('Deleted').AsInteger := 0;
    FieldByName('Position').AsInteger := 10;
    FieldByName('Answer').AsString := 'Нет';
    FieldByName('AnswerEdit').AsInteger := 0;
    FieldByName('AnswerChecked').AsInteger := 0;
    Post;
    Append;
    FieldByName('ID_Survey').AsInteger := Query.FieldByName('ID').AsInteger;
    FieldByName('ID_AssertUser').AsInteger := UserID;
    FieldByName('Active').AsInteger := 1;
    FieldByName('Deleted').AsInteger := 0;
    FieldByName('Position').AsInteger := 20;
    FieldByName('Answer').AsString := 'Да';
    FieldByName('AnswerEdit').AsInteger := 0;
    FieldByName('AnswerChecked').AsInteger := 0;
    Post;
    Close;
  end;
end;

procedure TGSurveyForm.InitAnswerFree;
begin
  with tAnswer do
  begin
    Close;
    ParamByName('ID').AsInteger := 0;
    Open;
    Append;
    FieldByName('ID_Survey').AsInteger := Query.FieldByName('ID').AsInteger;
    FieldByName('ID_AssertUser').AsInteger := UserID;
    FieldByName('Active').AsInteger := 1;
    FieldByName('Deleted').AsInteger := 0;
    FieldByName('Position').AsInteger := 10;
    FieldByName('Answer').AsString := 'Введите текст ответа';
    FieldByName('AnswerEdit').AsInteger := 1;
    FieldByName('AnswerChecked').AsInteger := 1;
    Post;
    Close;
  end;
end;

procedure TGSurveyForm.InitAnswerOne;
begin
  with tAnswer do
  begin
    Close;
    ParamByName('ID').AsInteger := 0;
    Open;
    Append;
    FieldByName('ID_Survey').AsInteger := Query.FieldByName('ID').AsInteger;
    FieldByName('ID_AssertUser').AsInteger := UserID;
    FieldByName('Active').AsInteger := 1;
    FieldByName('Deleted').AsInteger := 0;
    FieldByName('Position').AsInteger := 10;
    FieldByName('Answer').AsString := 'Ответ №1';
    FieldByName('AnswerEdit').AsInteger := 0;
    FieldByName('AnswerChecked').AsInteger := 0;
    Post;
    Append;
    FieldByName('ID_Survey').AsInteger := Query.FieldByName('ID').AsInteger;
    FieldByName('ID_AssertUser').AsInteger := UserID;
    FieldByName('Active').AsInteger := 1;
    FieldByName('Deleted').AsInteger := 0;
    FieldByName('Position').AsInteger := 20;
    FieldByName('Answer').AsString := 'Ответ №2';
    FieldByName('AnswerEdit').AsInteger := 0;
    FieldByName('AnswerChecked').AsInteger := 0;
    Post;
    Append;
    FieldByName('ID_Survey').AsInteger := Query.FieldByName('ID').AsInteger;
    FieldByName('ID_AssertUser').AsInteger := UserID;
    FieldByName('Active').AsInteger := 1;
    FieldByName('Deleted').AsInteger := 0;
    FieldByName('Position').AsInteger := 30;
    FieldByName('Answer').AsString := 'Ответ №3';
    FieldByName('AnswerEdit').AsInteger := 0;
    FieldByName('AnswerChecked').AsInteger := 0;
    Post;
    Close;
  end;
end;

procedure TGSurveyForm.qAnswerAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGSurveyForm.qAnswerAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGSurveyForm.aAddAnswerExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddSurveyAnswerDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGSurveyForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddSurveyDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGSurveyForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGSurveyForm.AddSurveyAnswerDialog(
  var IDSurveyAnswer: integer): boolean;
  var
    vAnswer : string;
    vPosition, vActive, vEdit, vChecked : integer;
begin
{  if Query.FieldByName('AnswerType').AsInteger = 0 then
  begin
    ShowMsg('Для логического вопроса уже есть два ответа, '#13#10 +
            'можно только отредактировать тексты и положение ответов.');
    Exit;
  end;
  if Query.FieldByName('AnswerType').AsInteger = 3 then
  begin
    ShowMsg('Один ответ в свободной форме уже есть, '#13#10 +
            'можно только отредактировать заданный текст ответа.');
    Exit;
  end;}

  vActive := 1;
  vEdit := 0;
  vChecked := 0;
  vPosition := GetMaxSurveyAnswerPosition(qAnswer.FieldByName('ID_Survey').AsInteger) + 10;
  vAnswer := '';

  Result :=
    GetSurveyAnswerParams(
      vActive,
      vEdit,
      vChecked,
      vPosition,
      vAnswer
      );

  if Result then
  begin
    {if ExistsSurveyAnswer(Query.FieldByName('ID').AsInteger, vAnswer, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else}
    with tAnswer do
    begin
      Close;
      ParamByName('ID').AsInteger := 0;
      Open;
      Append;
      FieldByName('ID_Survey').AsInteger := Query.FieldByName('ID').AsInteger;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('Deleted').AsInteger := 0;
      FieldByName('Position').AsInteger := vPosition;
      FieldByName('Answer').AsString := vAnswer;
      FieldByName('AnswerEdit').AsInteger := vEdit;
      FieldByName('AnswerChecked').AsInteger := vChecked;
      Post;
      IDSurveyAnswer := FieldByName('ID').AsInteger;
      Close;

      qAnswer.Refresh;

      qAnswer.Locate('ID', IDSurveyAnswer, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGSurveyForm.AddSurveyDialog(var IDSurvey: integer): boolean;
  var
    vQuestion, vComment : string;
    vVisibility, vAnswerType, vAnswerRequired,
    vPosition, vActive : integer;
begin
  vActive := 1;
  vPosition := GetMaxSurveyPosition + 10;
  vVisibility := 0;
  vAnswerType := 0;
  vAnswerRequired := 1;
  vQuestion := '';
  vComment := '';

  Result :=
    GetSurveyParams(
      vActive,
      vPosition,
      vVisibility,
      vAnswerType,
      vAnswerRequired,
      vQuestion,
      vComment
      );

  if Result then
  begin
    if ExistsSurvey(vQuestion, 0) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
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

      FieldByName('Position').AsInteger := vPosition;
      FieldByName('Visibility').AsInteger := vVisibility;
      FieldByName('AnswerType').AsInteger := vAnswerType;
      FieldByName('AnswerRequired').AsInteger := vAnswerRequired;

      FieldByName('Question').AsString := vQuestion;
      FieldByName('Comment').AsString := vComment;
      Post;
      IDSurvey := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDSurvey, []);

      case vAnswerType of
        0: //логический
          InitAnswerBoolean;
        1: //один ответ
          InitAnswerOne;
        2: //несколько ответов
          InitAnswerOne;
        3: //свободный ответ
          InitAnswerFree;
      end;

      Query.Refresh;
    end;
  end;
  SetEnabledButtons;
end;

procedure TGSurveyForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGSurveyForm.DeleteSurveyAnswerDialog: boolean;
  var
    vID, vRecNo : integer;
begin
{  if Query.FieldByName('AnswerType').AsInteger = 0 then
  begin
    ShowMsg('Для логического вопроса нужно ровно два ответа, '#13#10 +
            'удаление запрещено.');
    Exit;
  end;
  if Query.FieldByName('AnswerType').AsInteger = 3 then
  begin
    ShowMsg('Нужен ровно один ответ в свободной форме, '#13#10 +
            'удаление запрещено.');
    Exit;
  end;

  if IsNull(Datas.ReadValuesSQL('select count(id) as cid from SurveyAnswer where active = 1 and deleted = 0 and ID_Survey = ' + Query.FieldByName('ID').AsString, 'CID')[0], 0) <= 1 then
  begin
    ShowMsg('Для данного типа вопроса нужен хотя бы один ответ,'#13#10 +
            'удаление запрещено.');
    Exit;
  end;}

  vID := qAnswer.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
  begin
    vRecNo := qAnswer.RecNo;

    tAnswer.Close;
    tAnswer.ParamByName('ID').AsInteger := vID;
    tAnswer.Open;
    tAnswer.Edit;
    tAnswer.FieldByName('ID_AssertUser').AsInteger := UserID;
    tAnswer.FieldByName('Deleted').AsInteger := 1;
    tAnswer.Post;
    tAnswer.Close;

    qAnswer.Refresh;

    if qAnswer.RecordCount > 1 then
      qAnswer.RecNo := vRecNo;
  end;
  SetEnabledButtons;
end;

function TGSurveyForm.DeleteSurveyDialog: boolean;
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

function TGSurveyForm.EditSurveyAnswerDialog: boolean;
  var
    vAnswer : string;
    vPosition, vActive, vEdit, vChecked, vID : integer;
begin
  with qAnswer do
  begin
    vActive := FieldByName('Active').AsInteger;
    vPosition := FieldByName('Position').AsInteger;
    vAnswer := FieldByName('Answer').AsString;
    vEdit := FieldByName('AnswerEdit').AsInteger;
    vChecked := FieldByName('AnswerChecked').AsInteger;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetSurveyAnswerParams(
      vActive,
      vEdit,
      vChecked,
      vPosition,
      vAnswer
      );

  if Result then
  begin
{    if ExistsSurveyAnswer(Query.FieldByName('ID').AsInteger, vAnswer, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else}
    with tAnswer do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID').Value := FieldByName('ID').Value;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('Position').AsInteger := vPosition;
      FieldByName('Answer').AsString := vAnswer;
      FieldByName('AnswerEdit').AsInteger := vEdit;
      FieldByName('AnswerChecked').AsInteger := vChecked;
      Post;
      Close;

      qAnswer.Refresh;

      qAnswer.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

function TGSurveyForm.EditSurveyDialog: boolean;
  var
    vQuestion, vComment : string;
    vVisibility, vAnswerType, vAnswerRequired,
    vPosition, vActive, vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vPosition := FieldByName('Position').AsInteger;
    vQuestion := FieldByName('Question').AsString;

    vVisibility := FieldByName('Visibility').AsInteger;
    vAnswerType := FieldByName('AnswerType').AsInteger;
    vAnswerRequired := FieldByName('AnswerRequired').AsInteger;

    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetSurveyParams(
      vActive,
      vPosition,
      vVisibility,
      vAnswerType,
      vAnswerRequired,
      vQuestion,
      vComment);

  if Result then
  begin
{    if ExistsSurvey(vQuestion, vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
    else}
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID').Value := FieldByName('ID').Value;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;

      FieldByName('Position').AsInteger := vPosition;
      FieldByName('Visibility').AsInteger := vVisibility;
      FieldByName('AnswerType').AsInteger := vAnswerType;
      FieldByName('AnswerRequired').AsInteger := vAnswerRequired;

      FieldByName('Question').AsString := vQuestion;
      FieldByName('Comment').AsString := vComment;
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);

      if IsNull(Datas.ReadValuesSQL('Select id from SurveyAnswer where ID_Survey = ' + IntToStr(vID) + ' limit 1', 'id')[0], 0) = 0 then
      case vAnswerType of
        0: //логический
          InitAnswerBoolean;
        1: //один ответ
          InitAnswerOne;
        2: //несколько ответов
          InitAnswerOne;
        3: //свободный ответ
          InitAnswerFree;
      end;

      Query.Refresh;
    end;
  end;
  SetEnabledButtons;
end;

function TGSurveyForm.ExistsSurvey(AQuestion: string; AIDExclude : integer): boolean;
begin
  Result := False;
  qExists.Close;
  qExists.ParamByName('Q').AsString:= AQuestion;
  qExists.ParamByName('IDE').AsInteger:= AIDExclude;
  qExists.Open;
  Result := qExists.RecordCount > 0;
  qExists.Close;
end;

function TGSurveyForm.ExistsSurveyAnswer(AIDSurvey : integer; AAnswer: string;
  AIDExclude: integer): boolean;
begin
  Result := False;
  qExistsAnswer.Close;
  qExistsAnswer.ParamByName('IDS').AsInteger := AIDSurvey;
  qExistsAnswer.ParamByName('A').AsString:= AAnswer;
  qExistsAnswer.ParamByName('IDE').AsInteger:= AIDExclude;
  qExistsAnswer.Open;
  Result := qExistsAnswer.RecordCount > 0;
  qExistsAnswer.Close;
end;

procedure TGSurveyForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
