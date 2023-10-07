//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно опроса
//
//------------------------------------------------------------------------------
unit UQualityControlSurvey;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxSpinEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxImage, cxGridLevel, cxGridDBTableView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  cxGroupBox, System.Actions, Vcl.ActnList, dxBar, dxStatusBar, cxButtonEdit,
  cxSplitter, cxInplaceContainer, cxVGrid, cxDBVGrid, cxPropertiesStore,
  dxmdaset, Vcl.Grids, Vcl.DBGrids, cxBarEditItem, cxProgressBar;

type
  TQualityControlSurveyForm = class(TForm)
    GridSurvey: TcxGrid;
    ViewSurvey: TcxGridDBTableView;
    ViewSurveyAnswerExists: TcxGridDBColumn;
    ViewSurveyQuestionText: TcxGridDBColumn;
    LevelSurvey: TcxGridLevel;
    LevelAnswer: TcxGridLevel;
    dsSurvey: TDataSource;
    qSurvey: TZQuery;
    qSurveyID: TIntegerField;
    qSurveyID_AssertUser: TSmallintField;
    qSurveyAssertTime: TDateTimeField;
    qSurveyID_OrderList: TIntegerField;
    qSurveyID_OrderQualityControl: TIntegerField;
    qSurveyAnswerType: TSmallintField;
    qSurveyAnswerRequired: TSmallintField;
    qSurveyQuestionPosition: TIntegerField;
    qSurveyQuestionText: TWideStringField;
    qSurveyAnswerExists: TSmallintField;
    qSurveyUAssert: TWideStringField;
    qSurveyAnswInfo: TWideStringField;
    qSurveyID_Survey: TSmallintField;
    qSurveyQuestionVisibility: TSmallintField;
    qAnswer: TZQuery;
    IntegerField1: TIntegerField;
    SmallintField1: TSmallintField;
    DateTimeField1: TDateTimeField;
    qAnswerID_OrderList: TIntegerField;
    qAnswerID_OrderQualityControl: TIntegerField;
    qAnswerID_OrderListSurvey: TIntegerField;
    qAnswerAnswerPosition: TIntegerField;
    qAnswerAnswerText: TWideStringField;
    qAnswerAnswerChecked: TSmallintField;
    qAnswerAnswerEdit: TSmallintField;
    qAnswerUAssert: TWideStringField;
    qAnswerID_Survey: TSmallintField;
    qAnswerID_SurveyAnswer: TSmallintField;
    dsAnswer: TDataSource;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    dxBarButton2: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    ActionList: TActionList;
    aUpdate: TAction;
    aCancel: TAction;
    aExpand: TAction;
    aCollapse: TAction;
    StatusBar: TdxStatusBar;
    StyleRepository: TcxStyleRepository;
    StyleQuestion: TcxStyle;
    StyleAnswer: TcxStyle;
    StyleQuestionReady: TcxStyle;
    StyleAnswerReady: TcxStyle;
    ViewAnswer: TcxGridDBTableView;
    ViewAnswerAnswerText: TcxGridDBColumn;
    ViewAnswerAnswerChecked: TcxGridDBColumn;
    ViewAnswerAnswerEdit: TcxGridDBColumn;
    aCheck: TAction;
    StyleAnswerEdit: TcxStyle;
    VerticalGrid: TcxDBVerticalGrid;
    Splitter: TcxSplitter;
    Query: TZQuery;
    QueryID: TIntegerField;
    QueryDeleted: TSmallintField;
    QueryID_AddUser: TSmallintField;
    QueryAddUser: TWideStringField;
    QueryAddTime: TDateTimeField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertEmployee: TWideStringField;
    QueryAssertTime: TDateTimeField;
    QueryRequestText: TWideStringField;
    QueryOrderNUmber: TWideStringField;
    QueryOrderDate: TDateTimeField;
    QueryOrderCategory: TSmallintField;
    QueryClosed: TSmallintField;
    QueryID_Client: TIntegerField;
    QueryPhone: TWideStringField;
    QueryAddress: TWideStringField;
    QueryID_StatusType: TSmallintField;
    QueryID_SignalType: TSmallintField;
    QueryID_SourceType: TSmallintField;
    QueryID_Distrinct: TSmallintField;
    QueryID_Metro: TSmallintField;
    QueryFiles: TSmallintField;
    QueryID_PaymentForm: TSmallintField;
    QueryID_Worker: TSmallintField;
    QueryWorkDate: TDateTimeField;
    QueryWorkTime: TDateTimeField;
    QueryPlanTime: TFloatField;
    QueryWorkCost: TFloatField;
    QueryWInfo: TWideStringField;
    QueryOCInfo: TWideStringField;
    QueryFlatNumber: TWideStringField;
    QueryName: TWideStringField;
    QueryIsClientDOMSPB: TSmallintField;
    QueryClientComment: TWideStringField;
    QueryClientDateTime: TDateTimeField;
    QueryStatusComment: TWideStringField;
    QueryPayed: TSmallintField;
    QueryStatusInfo: TWideStringField;
    QuerySignalInfo: TWideStringField;
    QueryPFInfo: TWideStringField;
    QuerySourceInfo: TWideStringField;
    QueryID_Reason: TSmallintField;
    QueryReasonInfo: TWideStringField;
    QueryHideTime: TDateTimeField;
    QueryCloseTime: TDateTimeField;
    QueryNeedCallDate: TDateTimeField;
    QueryUid: TWideStringField;
    QueryCheckNumber: TWideStringField;
    QueryWorkDateTime: TDateTimeField;
    QueryID_DiscountPromo: TSmallintField;
    QueryOrderNumberExt: TWideStringField;
    QueryPersonalAccount: TWideStringField;
    DataSource: TDataSource;
    VerticalGridDeleted: TcxDBEditorRow;
    VerticalGridAddUser: TcxDBEditorRow;
    VerticalGridAddTime: TcxDBEditorRow;
    VerticalGridAssertUser: TcxDBEditorRow;
    VerticalGridAssertTime: TcxDBEditorRow;
    VerticalGridRequestText: TcxDBEditorRow;
    VerticalGridOrderNUmber: TcxDBEditorRow;
    VerticalGridOrderDate: TcxDBEditorRow;
    VerticalGridClosed: TcxDBEditorRow;
    VerticalGridPhone: TcxDBEditorRow;
    VerticalGridAddress: TcxDBEditorRow;
    VerticalGridOCInfo: TcxDBEditorRow;
    VerticalGridFlatNumber: TcxDBEditorRow;
    VerticalGridName: TcxDBEditorRow;
    VerticalGridIsClientDOMSPB: TcxDBEditorRow;
    VerticalGridClientComment: TcxDBEditorRow;
    VerticalGridClientDateTime: TcxDBEditorRow;
    VerticalGridStatusComment: TcxDBEditorRow;
    VerticalGridPayed: TcxDBEditorRow;
    VerticalGridStatusInfo: TcxDBEditorRow;
    VerticalGridSignalInfo: TcxDBEditorRow;
    VerticalGridPFInfo: TcxDBEditorRow;
    VerticalGridSourceInfo: TcxDBEditorRow;
    VerticalGridCloseTime: TcxDBEditorRow;
    VerticalGridOrderNumberExt: TcxDBEditorRow;
    VerticalGridPersonalAccount: TcxDBEditorRow;
    VerticalGridWorkDate: TcxDBEditorRow;
    VerticalGridWorkTime: TcxDBEditorRow;
    aUncheck: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton6: TdxBarButton;
    ViewSurveyID: TcxGridDBColumn;
    ViewAnswerID: TcxGridDBColumn;
    PropertiesStore: TcxPropertiesStore;
    mdSurvey: TdxMemData;
    mdSurveyID: TIntegerField;
    mdSurveyID_AssertUser: TSmallintField;
    mdSurveyAssertTime: TDateTimeField;
    mdSurveyID_OrderList: TIntegerField;
    mdSurveyID_OrderQualityControl: TIntegerField;
    mdSurveyAnswerType: TSmallintField;
    mdSurveyAnswerRequired: TSmallintField;
    mdSurveyQuestionPosition: TIntegerField;
    mdSurveyQuestionText: TWideStringField;
    mdSurveyAnswerExists: TSmallintField;
    mdSurveyUAssert: TWideStringField;
    mdSurveyAnswInfo: TWideStringField;
    mdSurveyID_Survey: TSmallintField;
    mdSurveyQuestionVisibility: TSmallintField;
    mdAnswer: TdxMemData;
    mdAnswerID: TIntegerField;
    mdAnswerID_AssertUser: TSmallintField;
    mdAnswerAssertTime: TDateTimeField;
    mdAnswerID_OrderList: TIntegerField;
    mdAnswerID_OrderQualityControl: TIntegerField;
    mdAnswerID_OrderListSurvey: TIntegerField;
    mdAnswerAnswerPosition: TIntegerField;
    mdAnswerAnswerText: TWideStringField;
    mdAnswerAnswerChecked: TSmallintField;
    mdAnswerAnswerEdit: TSmallintField;
    mdAnswerUAssert: TWideStringField;
    mdAnswerID_Survey: TSmallintField;
    mdAnswerID_SurveyAnswer: TSmallintField;
    aOK: TAction;
    dxBarButton7: TdxBarButton;
    cbOpenAnswer: TcxBarEditItem;
    ViewSurveyQuestionPosition: TcxGridDBColumn;
    ViewAnswerAnswerPosition: TcxGridDBColumn;
    mdAnswerEdited: TIntegerField;
    StatusBarContainer0: TdxStatusBarContainerControl;
    ProgressBar: TcxProgressBar;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eCommentPropertiesChange(Sender: TObject);
    procedure aExpandExecute(Sender: TObject);
    procedure aCollapseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure ViewSurveyStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure aCancelExecute(Sender: TObject);
    procedure ViewAnswerFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewAnswerStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure aCheckExecute(Sender: TObject);
    procedure aUncheckExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure ViewSurveyFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewSurveyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ViewSurveyKeyPress(Sender: TObject; var Key: Char);
    procedure ViewAnswerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mdAnswerAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FID : integer;
    FIDOrderList : integer;
    FSurveyFocusedRecord : pointer;
    FAnswerFocusedRecord : pointer;
    FIDList : TStringList;
    FAnswerCount : integer;
  public
    { Public declarations }
    procedure LoadSurvey;
    procedure SaveSurvey;

    procedure UpdateProgress;

    procedure SetOKEnabled;
    function CheckSurvey: boolean;
  end;

function RunQualityControlSurvey(AIDOrderQualityControl : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, UOptions, cxDataUtils, MainUnit, mesdlg;

function RunQualityControlSurvey(AIDOrderQualityControl : integer) : boolean;
begin
  with TQualityControlSurveyForm.Create(nil) do
    try
      FIDList := TStringList.Create;
      FID := AIDOrderQualityControl;
      FIDOrderList := IsNull(Datas.ReadValues('OrderQualityControl', 'ID_OrderList', AIDOrderQualityControl)[0], 0);
      Query.ParamByName('ID').AsInteger := FIDOrderList;
      Query.Open;

      LoadSurvey;
      UpdateProgress;

      Result := ShowModal = mrOK;

      if Result then
      begin
        SaveSurvey;
      end;
      FIDList.Free;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TQualityControlSurveyForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TQualityControlSurveyForm.aCheckExecute(Sender: TObject);
  var
    i : integer;
begin
  ViewSurvey.DataController.SaveDataSetPos;

  for i := 0 to ViewSurvey.Controller.SelectedRecordCount - 1 do
    if ViewSurvey.Controller.SelectedRecords[i].IsData then
    begin
      if mdSurvey.Locate('ID', IsNull(ViewSurvey.Controller.SelectedRecords[i].Values[ViewSurveyID.Index], 0), []) then
      begin
        mdSurvey.Edit;
        mdSurvey.FieldByName('AnswerExists').AsInteger := 1;
        mdSurvey.Post;
      end;
    end;

  ViewSurvey.DataController.RestoreDataSetPos;
end;

procedure TQualityControlSurveyForm.aCollapseExecute(Sender: TObject);
begin
  ViewSurvey.ViewData.Collapse(false);
end;

procedure TQualityControlSurveyForm.aExpandExecute(Sender: TObject);
begin
  ViewSurvey.ViewData.Expand(false);
end;

procedure TQualityControlSurveyForm.aOKExecute(Sender: TObject);
begin
  if CheckSurvey then
    ModalResult := mrOK;
end;

procedure TQualityControlSurveyForm.aUncheckExecute(Sender: TObject);
  var
    i : integer;
begin
  ViewSurvey.DataController.SaveDataSetPos;

  for i := 0 to ViewSurvey.Controller.SelectedRecordCount - 1 do
    if ViewSurvey.Controller.SelectedRecords[i].IsData then
    begin
      if mdSurvey.Locate('ID', IsNull(ViewSurvey.Controller.SelectedRecords[i].Values[ViewSurveyID.Index], 0), []) then
      begin
        mdSurvey.Edit;
        mdSurvey.FieldByName('AnswerExists').AsInteger := 0;
        mdSurvey.Post;
      end;
    end;

  ViewSurvey.DataController.RestoreDataSetPos;
end;

procedure TQualityControlSurveyForm.aUpdateExecute(Sender: TObject);
begin
  qAnswer.Close;
  qSurvey.Close;

  qSurvey.Open;
  qAnswer.Open;

  ViewSurvey.ViewData.Expand(false);

  ViewSurvey.DataController.GotoFirst;
end;

function TQualityControlSurveyForm.CheckSurvey: boolean;
  var
    at : integer;
    vIDS : integer;
    vCount : integer;
    vRequired, vChecked, vOK : boolean;
    t : string;
begin
  vOK := true;
  t := '';
//  mdAnswer.DisableControls;
//  mdSurvey.DisableControls;
  mdSurvey.First;
  while vOK and not mdSurvey.Eof do
  begin
    vCount := 0;
    vChecked := FIDList.IndexOf(mdSurvey.FieldByName('ID').AsString) >= 0;
    vRequired := mdSurvey.FieldByName('AnswerRequired').AsInteger = 1;
    vIDS := mdSurvey.FieldByName('ID').AsInteger;
    mdAnswer.First;
    while not mdAnswer.eof do
    begin
      if (mdAnswer.FieldByName('ID_OrderListSurvey').AsInteger = vIDS) and (mdAnswer.FieldByName('AnswerChecked').AsInteger = 1) then inc(vCount);
      mdAnswer.Next;
    end;

    mdSurvey.Locate('ID', vIDS, []);

    if vChecked then
      if vRequired and (vCount = 0) then
      begin
        vOK := false;
        t := 'Ответ на вопрос является обязательным!';
      end
      else
        if (mdSurvey.FieldByName('AnswerType').AsInteger in [0..1]) and (vCount > 1) then
        begin
          vOK := false;
          t := 'Нужно отметить только один ответ!';
        end;

    if vOK then mdSurvey.Next;
  end;

//  mdAnswer.EnableControls;

//  qSurvey.Locate('ID', vIDS, []);
//  mdSurvey.EnableControls;

  if not vOK then
  begin
    ViewAnswer.Controller.ClearSelection;
    ShowMsg(t, smtWarning);
  end;

  Result := vOK;
end;

procedure TQualityControlSurveyForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TQualityControlSurveyForm.SaveSurvey;
begin
  if dsEdit = mdSurvey.State then
    mdSurvey.Post;

  if dsEdit = mdAnswer.State then
    mdAnswer.Post;

  qSurvey.Open;
  qAnswer.Open;

  mdSurvey.First;
  while not mdSurvey.eof do
  begin
    if qSurvey.Locate('ID', mdSurvey.FieldByName('ID').AsInteger, []) then
    begin
      if (FIDList.IndexOf(qSurvey.FieldByName('ID').AsString) <> -1) and (qSurvey.FieldByName('AnswerExists').AsInteger = 0) then
      begin
        qSurvey.Edit;
        qSurvey.FieldByName('AnswerExists').AsInteger := 1;
        qSurvey.FieldByName('ID_AssertUser').AsInteger := UserID;
        qSurvey.Post;
      end;
    end;
    mdSurvey.Next;
  end;

  mdAnswer.First;
  while not mdAnswer.eof do
  begin
    if qAnswer.Locate('ID', mdAnswer.FieldByName('ID').AsInteger, []) then
    begin
      if (qAnswer.FieldByName('AnswerChecked').AsInteger <> mdAnswer.FieldByName('AnswerChecked').AsInteger) or
         (qAnswer.FieldByName('AnswerText').AsString <> mdAnswer.FieldByName('AnswerText').AsString)
      then
      begin
        qAnswer.Edit;
        qAnswer.FieldByName('AnswerChecked').AsInteger := mdAnswer.FieldByName('AnswerChecked').AsInteger;
        qAnswer.FieldByName('AnswerText').AsString := mdAnswer.FieldByName('AnswerText').AsString;
        qAnswer.FieldByName('ID_AssertUser').AsInteger := UserID;
        qAnswer.Post;
      end;
    end;
    mdAnswer.Next;
  end;

  qSurvey.Close;
  qAnswer.Close;
end;

procedure TQualityControlSurveyForm.SetOKEnabled;
begin
  aOK.Enabled := CanEditInActionByAction(mainForm.aaQualityControl);
end;

procedure TQualityControlSurveyForm.UpdateProgress;
begin
  ProgressBar.Properties.Max := FAnswerCount;
  ProgressBar.Position := FIDList.Count;
end;

procedure TQualityControlSurveyForm.ViewAnswerFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if Assigned(AFocusedRecord) then
  begin
    FAnswerFocusedRecord := AFocusedRecord;

    if IsNull(AFocusedRecord.Values[ViewAnswerAnswerEdit.Index], 0) = 1 then
    begin
      ViewAnswerAnswerText.Options.Editing := true;
      ViewAnswerAnswerText.Properties.ReadOnly := false;
    end
    else
    begin
      ViewAnswerAnswerText.Options.Editing := false;
      ViewAnswerAnswerText.Properties.ReadOnly := true;
    end;
  end;
end;

procedure TQualityControlSurveyForm.ViewAnswerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13 :
    begin
      mdAnswer.Edit;
      mdAnswer.FieldByName('AnswerChecked').AsInteger := BooleanToInt(not IntToBoolean(mdAnswer.FieldByName('AnswerChecked').AsInteger));
      mdAnswer.Post;

      Key := 0;
    end;
  end;
end;

procedure TQualityControlSurveyForm.ViewAnswerStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  var
    vEdit : boolean;
begin
  if AREcord = nil then Exit;

  vEdit := IsNull(ARecord.Values[ViewAnswerAnswerEdit.Index], 0) = 1;

  if vEdit then AStyle := StyleAnswerEdit
  else AStyle := StyleAnswer;
end;

procedure TQualityControlSurveyForm.ViewSurveyFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord = nil then Exit;

  FSurveyFocusedRecord := AFocusedRecord;

  if cbOpenAnswer.EditValue then
    if Assigned(ViewSurvey.Controller.FocusedRecord) then
      ViewSurvey.Controller.FocusedRecord.Expanded := true;
end;

procedure TQualityControlSurveyForm.ViewSurveyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13 :
    begin
      mdSurvey.Edit;
      mdSurvey.FieldByName('AnswerExists').AsInteger := BooleanToInt(not IntToBoolean(mdSurvey.FieldByName('AnswerExists').AsInteger));
      mdSurvey.Post;

      Key := 0;
    end;
  end;
end;

procedure TQualityControlSurveyForm.ViewSurveyKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    ' ' :
    begin
      mdSurvey.Edit;
      mdSurvey.FieldByName('AnswerExists').AsInteger := BooleanToInt(not IntToBoolean(mdSurvey.FieldByName('AnswerExists').AsInteger));
      mdSurvey.Post;

      Key := #0;
    end;
  end;
end;

procedure TQualityControlSurveyForm.ViewSurveyStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  var
    vChecked : boolean;
    vID : integer;
begin
  if AREcord = nil then Exit;

//  vChecked := IsNull(ARecord.Values[ViewSurveyAnswerExists.Index], 0) = 1;
  vID := IsNull(ARecord.Values[ViewSurveyID.Index], 0);
  vChecked := FIDList.IndexOf(IntToStr(vID)) >= 0;

  if vChecked then
    AStyle := StyleQuestionReady
  else
    AStyle := StyleQuestion;
end;

procedure TQualityControlSurveyForm.eCommentPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TQualityControlSurveyForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TQualityControlSurveyForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PrepareFormName(self);
  PropertiesStore.StoreTo(false);

  BarManager.SaveToIniFile(cIniFileName);
end;

procedure TQualityControlSurveyForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TQualityControlSurveyForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;

  ViewSurvey.ViewData.Expand(false);

  GridSurvey.SetFocus;
  ViewSurvey.Controller.FocusedRecord.Selected := true;
end;

procedure TQualityControlSurveyForm.LoadSurvey;
  var
    v : variant;
    vTime : TDateTime;
    FCount : integer;
begin
  v := Datas.ReadValuesSQL('select id from orderlistsurveyanswer where id_orderqualitycontrol = ' + IntToStr(FID) + ' limit 1', 'ID');
  vTime := ServerTime;
  if IsNull(v[0], 0) = 0 then
  begin
    ExecSQL('call FillSurveyAnswer(' + IntToStr(FID) + ',' + IntToStr(UserID) + ')');
  end;

  qSurvey.ParamByName('ID').AsInteger := FID;
  qSurvey.Open;

  FAnswerCount := qSurvey.RecordCount;

  qSurvey.First;
  FIDList.Clear;
  while not qSurvey.Eof do
  begin
    if qSurvey.FieldByName('AnswerExists').AsInteger = 1 then
      FIDList.Add(qSurvey.FieldByName('ID').AsString);
    qSurvey.Next;
  end;
  qSurvey.First;

  qAnswer.ParamByName('ID').AsInteger := FID;
  qAnswer.Open;

  mdAnswer.AfterPost := nil;

  mdAnswer.CopyFromDataSet(qAnswer);
  mdSurvey.CopyFromDataSet(qSurvey);

  ViewSurvey.ViewData.Expand(false);

  qSurvey.Close;
  qAnswer.Close;

  mdSurvey.First;

  mdAnswer.AfterPost := mdAnswerAfterPost;
end;

procedure TQualityControlSurveyForm.mdAnswerAfterPost(DataSet: TDataSet);
  var
    vID : string;
begin
  vID := Dataset.FieldByName('ID_OrderListSurvey').AsString;
  if FIDList.IndexOf(vID) = -1 then
  begin
    FIDList.Add(vID);
    GridSurvey.Invalidate(true);

  end;

  UpdateProgress;
end;

end.
