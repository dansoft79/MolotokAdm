//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Точки отсчета для уведомлений
//
//------------------------------------------------------------------------------
unit UNoticeOptionsTime;

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
  TNoticeOptionsTimeForm = class(TForm)
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
    QueryID: TIntegerField;
    QueryFieldName: TWideStringField;
    QueryFieldCaption: TWideStringField;
    QueryCondBefore: TSmallintField;
    QueryCondAfter: TSmallintField;
    QueryMinValue: TIntegerField;
    QueryMaxValue: TIntegerField;
    TableViewFieldName: TcxGridDBColumn;
    TableViewFieldCaption: TcxGridDBColumn;
    TableViewCondBefore: TcxGridDBColumn;
    TableViewCondAfter: TcxGridDBColumn;
    TableViewMinValue: TcxGridDBColumn;
    TableViewMaxValue: TcxGridDBColumn;
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
    function AddNoticeOptionsTimeDialog(var IDNoticeOptionsTime : integer) : boolean;
    function EditNoticeOptionsTimeDialog : boolean;
    function DeleteNoticeOptionsTimeDialog : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowNoticeOptionsTime(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddNoticeOptionsTime(var AIDNoticeOptionsTime : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditNoticeOptionsTime(AIDNoticeOptionsTime : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteNoticeOptionsTime(AIDNoticeOptionsTime : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UNoticeOptionsTimeParams, mesdlg, UUtil, UWaiting, UConsts,
  MainUnit;

function DoAction(var AIDNoticeOptionsTime : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TNoticeOptionsTimeForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TNoticeOptionsTimeForm) then
  begin
    with FindForm(TNoticeOptionsTimeForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TNoticeOptionsTimeForm.Create(Application);
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
        Result := AddNoticeOptionsTimeDialog(AIDNoticeOptionsTime);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDNoticeOptionsTime, []);
          Result := EditNoticeOptionsTimeDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDNoticeOptionsTime, []);
            Result := DeleteNoticeOptionsTimeDialog;
            Close;
          end;
  end;
end;

function ShowNoticeOptionsTime(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddNoticeOptionsTime(var AIDNoticeOptionsTime : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeOptionsTime, cAddAction, nil);
end;

function EditNoticeOptionsTime(AIDNoticeOptionsTime : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeOptionsTime, cEditAction, nil);
end;

function DeleteNoticeOptionsTime(AIDNoticeOptionsTime : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDNoticeOptionsTime, cDeleteAction, nil);
end;

procedure TNoticeOptionsTimeForm.SetEnabledButtons;
  var
    ce, e : boolean;
begin
  with TableView.Controller do e := Assigned(FocusedRecord) and FocusedRecord.IsData;
  ce := CanEditInActionByAction(MainForm.aaNoticeOptionsTime);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce;
  aEdit.Enabled := e and ce;
end;

procedure TNoticeOptionsTimeForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TNoticeOptionsTimeForm.TableViewFocusedRecChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TNoticeOptionsTimeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TNoticeOptionsTimeForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TNoticeOptionsTimeForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteNoticeOptionsTimeDialog or FModified;
  SetEnabledButtons;
end;

procedure TNoticeOptionsTimeForm.aEditExecute(Sender: TObject);
begin
  FModified := EditNoticeOptionsTimeDialog or FModified;
  SetEnabledButtons;
end;

procedure TNoticeOptionsTimeForm.aPrintExecute(Sender: TObject);
begin
  ComponentPrinter.Preview(true);
end;

procedure TNoticeOptionsTimeForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TNoticeOptionsTimeForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TNoticeOptionsTimeForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TNoticeOptionsTimeForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TNoticeOptionsTimeForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddNoticeOptionsTimeDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TNoticeOptionsTimeForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TNoticeOptionsTimeForm.AddNoticeOptionsTimeDialog(var IDNoticeOptionsTime: integer): boolean;
  var
    vFieldName, vFieldCaption : string;
    vMinValue, vMaxValue : integer;
    vCondBefore, vCondAfter : boolean;
begin
  vFieldName := '';
  vFieldCaption := '';
  vMinValue := 0;
  vMaxValue := 0;
  vCondBefore := false;
  vCondAfter := false;

  Result := GetNoticeOptionsTimeParams(
    vFieldName, vFieldCaption,
    vMinValue, vMaxValue,
    vCondBefore, vCondAfter);

  if Result then
  begin
    with Table do
      if Query.Locate('FieldName', vFieldName, []) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
      else
      begin
        Close;
        ParamByName('ID').AsInteger := 0;
        Open;
        Append;
        FieldByName('FieldName').AsString := vFieldName;
        FieldByName('FieldCaption').AsString := vFieldCaption;
        FieldByName('MinValue').AsInteger := vMinValue;
        FieldByName('MaxValue').AsInteger := vMaxValue;
        FieldByName('CondBefore').AsInteger := BooleanToInt(vCondBefore);
        FieldByName('CondAfter').AsInteger := BooleanToInt(vCondAfter);
        Post;
        IDNoticeOptionsTime := FieldByName('ID').AsInteger;
        Close;
        Query.Close;
        Query.Open;
        Query.Locate('ID', IDNoticeOptionsTime, []);
      end;
  end;
  SetEnabledButtons;
end;

function TNoticeOptionsTimeForm.DeleteNoticeOptionsTimeDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
    if DeleteRecSimple('NoticeOptionsTime', vID) then
    begin
      vRecNo := Query.RecNo;
      Query.Close;
      Query.Open;
      if Query.RecordCount > 1 then
        Query.RecNo := vRecNo;
    end;
  SetEnabledButtons;
end;

function TNoticeOptionsTimeForm.EditNoticeOptionsTimeDialog: boolean;
  var
    vFieldName, vFieldCaption : string;
    vMinValue, vMaxValue : integer;
    vCondBefore, vCondAfter : boolean;
    vID : integer;
begin
  with Query do
  begin
    vFieldName := FieldByName('FieldName').AsString;
    vFieldCaption := FieldByName('FieldCaption').AsString;
    vMinValue := FieldByName('MinValue').AsInteger;
    vMaxValue := FieldByName('MaxValue').AsInteger;
    vCondBefore := FieldByName('CondBefore').AsInteger = 1;
    vCondAfter := FieldByName('CondAfter').AsInteger = 1;
    vID := FieldByName('ID').AsInteger;
  end;

  Result := GetNoticeOptionsTimeParams(
    vFieldName, vFieldCaption,
    vMinValue, vMaxValue,
    vCondBefore, vCondAfter);

  if Result then
  begin
    with Table do
      if Query.Locate('FieldName', vFieldName, []) and (Query.FieldByName('ID').AsInteger <> vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
      else
      begin
        Close;
        ParamByName('ID').AsInteger := vID;
        Open;
        if Locate('ID', vID, []) then
        begin
          Edit;
          FieldByName('FieldName').AsString := vFieldName;
          FieldByName('FieldCaption').AsString := vFieldCaption;
          FieldByName('MinValue').AsInteger := vMinValue;
          FieldByName('MaxValue').AsInteger := vMaxValue;
          FieldByName('CondBefore').AsInteger := BooleanToInt(vCondBefore);
          FieldByName('CondAfter').AsInteger := BooleanToInt(vCondAfter);
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

procedure TNoticeOptionsTimeForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
