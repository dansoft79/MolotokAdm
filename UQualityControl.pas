//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Просмотр контроля качества
//
//------------------------------------------------------------------------------
unit UQualityControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  DB, ADODB, DBCtrls,
  Grids, DBGrids, Mask,  cxGraphics, cxControls, dxStatusBar,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxBar, dxBarExtItems,
  cxClasses, ActnList, cxPropertiesStore, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxLabel,
  cxContainer, cxTextEdit, cxGroupBox, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, cxLookAndFeelPainters, cxCheckBox,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxLookAndFeels, System.Actions,
  cxNavigator, dxDateRanges, dxBarBuiltInMenu, cxSplitter, cxCalendar,
  cxBarEditItem, cxImage, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView, cxGridBandedTableView, cxGridDBBandedTableView, cxMemo,
  dxScreenTip, dxCustomHint, cxHint, dxScrollbarAnnotations;

type
  TBrowseQualityControlForm = class(TForm)
    StatusBar: TdxStatusBar;
    PropertiesStore: TcxPropertiesStore;
    ActionList: TActionList;
    aCancel: TAction;
    aUpdate: TAction;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    dxBarButton5: TdxBarButton;
    dxBarButton2: TdxBarButton;
    DataSource: TDataSource;
    Query: TZQuery;
    PopupMenu: TcxGridPopupMenu;
    dxBarStatic1: TdxBarStatic;
    StyleRepository: TcxStyleRepository;
    StyleDeleted: TcxStyle;
    eFromDate: TcxBarEditItem;
    eToDate: TcxBarEditItem;
    Grid: TcxGrid;
    Level: TcxGridLevel;
    TableView: TcxGridDBTableView;
    StyleBold: TcxStyle;
    QueryUAdd: TWideStringField;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AppendUser: TSmallintField;
    QueryAppendTime: TDateTimeField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryID_OrderList: TIntegerField;
    QueryID_StatusType: TSmallintField;
    QueryID_StatusTypeQC: TSmallintField;
    QueryID_District: TSmallintField;
    QueryOrderCloseTime: TDateTimeField;
    QueryOrderAddress: TWideStringField;
    QueryUAssert: TWideStringField;
    QueryDInfo: TWideStringField;
    TableViewUAdd: TcxGridDBColumn;
    TableViewID: TcxGridDBColumn;
    TableViewActive: TcxGridDBColumn;
    TableViewDeleted: TcxGridDBColumn;
    TableViewAppendTime: TcxGridDBColumn;
    TableViewAssertTime: TcxGridDBColumn;
    TableViewOrderCloseTime: TcxGridDBColumn;
    TableViewOrderAddress: TcxGridDBColumn;
    TableViewSurveyCount: TcxGridDBColumn;
    TableViewSurveyReady: TcxGridDBColumn;
    TableViewUAssert: TcxGridDBColumn;
    TableViewDInfo: TcxGridDBColumn;
    QuerySTInfo: TWideStringField;
    QuerySTQCInfo: TWideStringField;
    TableViewSTInfo: TcxGridDBColumn;
    TableViewSTQCInfo: TcxGridDBColumn;
    QuerySurveyCount: TLargeintField;
    QuerySurveyReady: TLargeintField;
    TableViewID_OrderList: TcxGridDBColumn;
    gbRes: TcxGroupBox;
    SplitterRes: TcxSplitter;
    GridSurvey: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    ViewSurvey: TcxGridDBTableView;
    LevelSurvey: TcxGridLevel;
    qSurvey: TZQuery;
    dsSurvey: TDataSource;
    LevelAnswer: TcxGridLevel;
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
    ViewSurveyQuestionText: TcxGridDBColumn;
    qSurveyAnswInfo: TWideStringField;
    ViewAnswer: TcxGridDBTableView;
    qAnswer: TZQuery;
    IntegerField1: TIntegerField;
    SmallintField1: TSmallintField;
    DateTimeField1: TDateTimeField;
    dsAnswer: TDataSource;
    qAnswerID_OrderList: TIntegerField;
    qAnswerID_OrderQualityControl: TIntegerField;
    qAnswerID_OrderListSurvey: TIntegerField;
    qAnswerAnswerPosition: TIntegerField;
    qAnswerAnswerText: TWideStringField;
    qAnswerAnswerChecked: TSmallintField;
    qAnswerAnswerEdit: TSmallintField;
    qAnswerUAssert: TWideStringField;
    aRunSurvey: TAction;
    dxBarButton1: TdxBarButton;
    qSurveyID_Survey: TSmallintField;
    qSurveyQuestionVisibility: TSmallintField;
    QueryID: TIntegerField;
    qAnswerID_Survey: TSmallintField;
    qAnswerID_SurveyAnswer: TSmallintField;
    ViewAnswerAnswerText: TcxGridDBColumn;
    ViewAnswerAnswerChecked: TcxGridDBColumn;
    ViewSurveyAnswerChecked: TcxGridDBColumn;
    ZQuery1: TZQuery;
    IntegerField2: TIntegerField;
    SmallintField2: TSmallintField;
    DateTimeField2: TDateTimeField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    IntegerField5: TIntegerField;
    WideStringField1: TWideStringField;
    SmallintField5: TSmallintField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    WideStringField4: TWideStringField;
    SmallintField8: TSmallintField;
    DataSource1: TDataSource;
    StyleQuestion: TcxStyle;
    StyleAnswer: TcxStyle;
    aExpand: TAction;
    aCollapse: TAction;
    DockControlAnswer: TdxBarDockControl;
    BarManagerBar2: TdxBar;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    StyleQuestionReady: TcxStyle;
    StyleAnswerReady: TcxStyle;
    aAdd: TAction;
    aDelete: TAction;
    aEdit: TAction;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    cbDel: TdxBarCombo;
    aUndoDelete: TAction;
    aPrint: TAction;
    Table: TZQuery;
    dxBarButton9: TdxBarButton;
    ViewSurveyID: TcxGridDBColumn;
    ViewAnswerID: TcxGridDBColumn;
    QueryColor: TLargeintField;
    TableViewColor: TcxGridDBColumn;
    cbOpenAnswer: TcxBarEditItem;
    procedure FormCreate(Sender: TObject);
    procedure eKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aUpdateExecute(Sender: TObject);
    procedure eFromDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eToDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aCancelExecute(Sender: TObject);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewWorkFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableViewNNCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure aRunSurveyExecute(Sender: TObject);
    procedure aExpandExecute(Sender: TObject);
    procedure aCollapseExecute(Sender: TObject);
    procedure ViewSurveyStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure qSurveyBeforePost(DataSet: TDataSet);
    procedure qAnswerBeforePost(DataSet: TDataSet);
    procedure ViewAnswerStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure aAddExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aUndoDeleteExecute(Sender: TObject);
    procedure cbDelChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure TableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ViewSurveyFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewAnswerFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
    FIDAnswerLast : integer;
    FIDSurveyLast : integer;
    FModified : boolean;
  public
    { Public declarations }
    procedure SetEnabledButtons;

    function AddDialog(var IDFAQ : integer) : boolean;
    function EditDialog : boolean;
    function DeleteDialog : boolean;
    function UndoDeleteDialog : boolean;

    procedure UpdateData;
    procedure UpdateDetailFull;
  end;

procedure QualityControl(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');

implementation

{$R *.dfm}

uses
  MainUnit, UOptions, UDatas, UWaiting, UConsts, DTKUtils, UUtil, mesdlg,
  UQualityControlParams, UQualityControlSurvey;

procedure QualityControl(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');
  var
    vForm : TBrowseQualityControlForm;
begin
  if OneWindow and ExistsForm(TBrowseQualityControlForm) then
  begin
    with FindForm(TBrowseQualityControlForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TBrowseQualityControlForm.Create(nil);
  with vForm do
  begin
    if IsDate(AFromDate) then
      eFromDate.EditValue := StrToDate(AFromDate);

    if IsDateTime(AToDate) then
      eToDate.EditValue := StrToDate(AToDate);

    UpdateData;

    Tag := MaxMDITag(ClassType) + 1;
    if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);
    Show;
  end;
end;

procedure TBrowseQualityControlForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TBrowseQualityControlForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TBrowseQualityControlForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.qAnswerBeforePost(DataSet: TDataSet);
begin
  Dataset.FieldByName('ID_AssertUser').AsInteger := UserID;
end;

procedure TBrowseQualityControlForm.qSurveyBeforePost(DataSet: TDataSet);
begin
  Dataset.FieldByName('ID_AssertUser').AsInteger := UserID;
end;

procedure TBrowseQualityControlForm.eFromDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseQualityControlForm.eKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(TWinControl(Sender), true, true);
  end;
end;

procedure TBrowseQualityControlForm.eToDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

function TBrowseQualityControlForm.UndoDeleteDialog: boolean;
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

procedure TBrowseQualityControlForm.UpdateData;
  var
    vID : integer;
begin
  if Query.Active then
    vID := Query.FieldByName('ID').AsInteger
  else
    vID := 0;

  ShowWaiting(cDataGetting);
  if Query.Active then
  begin
    qAnswer.Close;
    qSurvey.Close;
    Query.Close;
  end;
  with Query do
  begin

    if eFromDate.EditValue <> null then
      ParamByname('FD').AsString := DateToSQLDate(eFromDate.EditValue)
    else
      ParamByname('FD').AsString := '';

    if eToDate.EditValue <> null then
      ParamByname('TD').AsString := DateToSQLDate(eToDate.EditValue)
    else
      ParamByname('TD').AsString := '';
  end;

  Query.Open;
  if vID <> 0 then
    Query.Locate('ID', vID, []);

  HideWaiting;
end;

procedure TBrowseQualityControlForm.UpdateDetailFull;
  var
    vIDS, n : integer;
begin
  ViewAnswer.DataController.SaveDataSetPos;

  if ViewSurvey.Controller.FocusedRecordIndex >= 0 then
    vIDS := ViewSurvey.DataController.GetValue(ViewSurvey.Controller.FocusedRecordIndex, ViewSurveyID.Index)
  else
    vIDS := FIDSurveyLast;

  qSurvey.Close;
  qAnswer.Close;
  qSurvey.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
  qAnswer.ParamByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
  qAnswer.Open;
  qSurvey.Open;


  if cbOpenAnswer.EditValue then
    ViewSurvey.ViewData.Expand(false);

  n := ViewSurvey.DataController.FindRecordIndexByKey(vIDS);
  if n >= 0 then
    ViewSurvey.DataController.FocusedRecordIndex := n;

end;

procedure TBrowseQualityControlForm.ViewAnswerFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if Assigned(AFocusedRecord) then
    FIDAnswerLast := AFocusedRecord.Values[ViewAnswerID.Index];

  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.ViewAnswerStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  var
    vChecked : boolean;
begin
  vChecked := IsNull(ViewSurvey.Controller.FocusedRecord.Values[ViewSurveyAnswerChecked.Index], 0) = 1;

  if vChecked then AStyle := StyleAnswerReady
  else AStyle := StyleAnswer;
end;

procedure TBrowseQualityControlForm.ViewSurveyFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if Assigned(AFocusedRecord) then
    FIDSurveyLast := AFocusedRecord.Values[ViewSurveyID.Index];

  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.ViewSurveyStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  var
    vChecked : boolean;
begin
  vChecked := IsNull(ARecord.Values[ViewSurveyAnswerChecked.Index], 0) = 1;

  if vChecked then AStyle := StyleQuestionReady
  else AStyle := StyleQuestion;
end;

procedure TBrowseQualityControlForm.ViewWorkFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.SetEnabledButtons;
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

  ce := CanEditInActionByAction(MainForm.aaQualityControl);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce and not del;
  aUndoDelete.Enabled := e and ce and del;
  aEdit.Enabled := e and ce and not del;

  aRunSurvey.Enabled := e and ce and not del;

  aUpdate.Enabled :=
    (eFromDate.EditValue = null) or
    (eToDate.EditValue = null) or
    (eFromDate.EditValue <= eToDate.EditValue);

  //------------------------------------------
  //видимость
  //------------------------------------------
  md := cbDel.ItemIndex in [1, 2];
  mnd := cbDel.ItemIndex in [0, 2];
  aAdd.Visible := mnd;
  aDelete.Visible := mnd;
  aUndoDelete.Visible := md;
  aEdit.Visible := mnd;

  aRunSurvey.Visible := mnd;
end;

procedure TBrowseQualityControlForm.TableViewDblClick(Sender: TObject);
begin
//  if aEdit.Enabled then aEdit.Execute;
  if aRunSurvey.Enabled then aRunSurvey.Execute;
end;

procedure TBrowseQualityControlForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  UpdateDetailFull;
  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.TableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TBrowseQualityControlForm.TableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TBrowseQualityControlForm.TableViewNNCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var
    vColor : integer;
begin
  if not Assigned(AViewInfo.GridRecord) then Exit;
  if AViewInfo.GridRecord Is TcxGridFilterRow then Exit;

  vColor := AViewInfo.GridRecord.Values[TableViewColor.Index];

  ACanvas.Brush.Color := vCOlor;

  ACanvas.Font.Color := clBlack;
end;

procedure TBrowseQualityControlForm.TableViewStylesGetContentStyle(
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

procedure TBrowseQualityControlForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TBrowseQualityControlForm.aCollapseExecute(Sender: TObject);
begin
  ViewSurvey.ViewData.Collapse(false);
end;

function TBrowseQualityControlForm.AddDialog(var IDFAQ: integer): boolean;
  var
    vIDOrderList, vIDDistrict, vIDStatusType, vIDStatusTypeQC, vActive : integer;
    vOrderCloseTime, vOrderAddress : string;
begin
  vActive := 1;
  vIDOrderList := Query.FieldByName('ID_OrderList').AsInteger;
  vIDDistrict := 0;
  vIDStatusType := 0;
  vIDStatusTypeQC := 0;
  vOrderCloseTime := '';
  vOrderAddress := '';

  Result :=
    GetQualityControlParams(
      vActive,
      vIDOrderList,
      vIDDistrict,
      vIDStatusType,
      vIDStatusTypeQC,
      vOrderCloseTime,
      vOrderAddress,
      0
      );

  if Result then
  begin
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := 0;
      Open;
      Append;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('Deleted').AsInteger := 0;

      FieldByName('ID_OrderList').AsInteger := vIDOrderList;
      FieldByName('ID_District').Value := NullIfZero(vIDDistrict);
      FieldByName('ID_StatusType').AsInteger := vIDStatusType;
      FieldByName('ID_StatusTypeQC').AsInteger := vIDStatusTypeQC;

      FieldByName('OrderCloseTime').AsString := vOrderCloseTime;
      FieldByName('OrderAddress').AsString := vOrderAddress;

      Post;
      IDFAQ := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDFAQ, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteDialog or FModified;
  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.aEditExecute(Sender: TObject);
begin
  FModified := EditDialog or FModified;
  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.aExpandExecute(Sender: TObject);
begin
  ViewSurvey.ViewData.Expand(false);
end;

procedure TBrowseQualityControlForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TBrowseQualityControlForm.aRunSurveyExecute(Sender: TObject);
  var
    vID : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  RunQualityControlSurvey(vID);

//  UpdateDetailFull;
  UpdateData;
end;

procedure TBrowseQualityControlForm.aUndoDeleteExecute(Sender: TObject);
begin
  FModified := UndoDeleteDialog or FModified;
  SetEnabledButtons;
end;

procedure TBrowseQualityControlForm.aUpdateExecute(Sender: TObject);
begin
  UpdateData;
  Grid.SetFocus;
end;

procedure TBrowseQualityControlForm.cbDelChange(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('D').AsInteger := cbDel.ItemIndex;
  Query.Open;
end;

function TBrowseQualityControlForm.DeleteDialog: boolean;
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

function TBrowseQualityControlForm.EditDialog: boolean;
 var
    vIDOrderList, vIDDistrict, vIDStatusType, vIDStatusTypeQC, vActive : integer;
    vOrderCloseTime, vOrderAddress : string;
    vID : integer;
begin
  with Query do
  begin
    vActive := FieldByName('Active').AsInteger;
    vIDOrderList := FieldByName('ID_OrderList').AsInteger;
    vIDDistrict := FieldByName('ID_District').AsInteger;
    vIDStatusType := FieldByName('ID_StatusType').AsInteger;
    vIDStatusTypeQC := FieldByName('ID_StatusTypeQC').AsInteger;
    vOrderCloseTime := FieldByName('OrderCloseTime').AsString;
    vOrderAddress := FieldByName('OrderAddress').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetQualityControlParams(
      vActive,
      vIDOrderList,
      vIDDistrict,
      vIDStatusType,
      vIDStatusTypeQC,
      vOrderCloseTime,
      vOrderAddress,
      vID
    );

  if Result then
  begin
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID').Value := FieldByName('ID').Value;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Active').AsInteger := vActive;
      FieldByName('ID_OrderList').AsInteger := vIDOrderList;
      FieldByName('ID_District').Value := NullIfZero(vIDDistrict);
      FieldByName('ID_StatusType').AsInteger := vIDStatusType;
      FieldByName('ID_StatusTypeQC').AsInteger := vIDStatusTypeQC;
      FieldByName('OrderCloseTime').AsString := vOrderCloseTime;
      FieldByName('OrderAddress').AsString := vOrderAddress;

      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

end.
