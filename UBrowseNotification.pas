//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Просмотр ленты уведомлений
//
//------------------------------------------------------------------------------
unit UBrowseNotification;

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
  dxScreenTip, dxCustomHint, cxHint;

type
  TBrowseNotificationForm = class(TForm)
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
    QueryPicture: TBlobField;
    QueryPictureType: TWideStringField;
    QueryID: TLargeintField;
    QueryID_OrderList: TIntegerField;
    QueryID_NoticeTemplate: TSmallintField;
    QueryAppendTime: TDateTimeField;
    QueryHeader: TWideStringField;
    QueryText: TWideStringField;
    QueryColor: TIntegerField;
    QueryShowTime: TIntegerField;
    QueryOrderCloseTime: TDateTimeField;
    QueryOpenTime: TDateTimeField;
    QueryID_UserOpen: TSmallintField;
    aBrowse: TAction;
    dxBarButton1: TdxBarButton;
    Grid: TcxGrid;
    Level: TcxGridLevel;
    TableViewNN: TcxGridDBBandedTableView;
    TableViewNNPicture: TcxGridDBBandedColumn;
    TableViewNNHeader: TcxGridDBBandedColumn;
    TableViewNNText: TcxGridDBBandedColumn;
    TableViewNNColor: TcxGridDBBandedColumn;
    TableView: TcxGridDBTableView;
    TableViewPicture: TcxGridDBColumn;
    TableViewHeader: TcxGridDBColumn;
    TableViewText: TcxGridDBColumn;
    TableViewColor: TcxGridDBColumn;
    StyleBold: TcxStyle;
    TableViewAppendTime: TcxGridDBColumn;
    TableViewShowTime: TcxGridDBColumn;
    TableViewOrderCloseTime: TcxGridDBColumn;
    TableViewOpenTime: TcxGridDBColumn;
    QueryUOpen: TWideStringField;
    TableViewUOpen: TcxGridDBColumn;
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
    procedure aBrowseExecute(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
    procedure TableViewNNCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetEnabledButtons;
    procedure UpdateData;
  end;

procedure BrowseNotification(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');

implementation

{$R *.dfm}

uses
  MainUnit, UOptions, UDatas, UWaiting, UConsts, DTKUtils, UUtil;

procedure BrowseNotification(AParentAction : TAction; AFromDate : string = ''; AToDate : string = '');
  var
    vForm : TBrowseNotificationForm;
begin
  if OneWindow and ExistsForm(TBrowseNotificationForm) then
  begin
    with FindForm(TBrowseNotificationForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TBrowseNotificationForm.Create(nil);
  with vForm do
  begin
    if IsDate(AFromDate) then
      eFromDate.EditValue := StrToDate(AFromDate);

    if IsDateTime(AToDate) then
      eToDate.EditValue := StrToDate(AToDate);

    UpdateData;

    ShowWaiting(cDataGetting);
    Query.Open;
    HideWaiting;

    Tag := MaxMDITag(ClassType) + 1;
    if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);
    Show;
  end;
end;

procedure TBrowseNotificationForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TBrowseNotificationForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TBrowseNotificationForm.eFromDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseNotificationForm.eKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(TWinControl(Sender), true, true);
  end;
end;

procedure TBrowseNotificationForm.eToDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TBrowseNotificationForm.UpdateData;
begin
  ShowWaiting(cDataGetting);
  if Query.Active then
  begin
    Query.Close;
  end;
  with Query do
  begin
    ParamByName('IDU').AsInteger := UserID;

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

  HideWaiting;
end;

procedure TBrowseNotificationForm.ViewWorkFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseNotificationForm.SetEnabledButtons;
  var
    e : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  aBrowse.Enabled := e;

  aUpdate.Enabled :=
    (eFromDate.EditValue = null) or
    (eToDate.EditValue = null) or
    (eFromDate.EditValue <= eToDate.EditValue);
end;

procedure TBrowseNotificationForm.TableViewDblClick(Sender: TObject);
begin
  if aBrowse.Enabled then aBrowse.Execute;
end;

procedure TBrowseNotificationForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TBrowseNotificationForm.TableViewNNCustomDrawCell(
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

procedure TBrowseNotificationForm.aBrowseExecute(Sender: TObject);
  var
    vImageIndex, vColor, vShowTime, vIDN, vIDOL, vIDNT : integer;
    vHeader, vText : string;
begin
  with Query do
  begin
    vIDN := FieldByName('ID').AsInteger;
    vIDNT := FieldByName('ID_NoticeTemplate').AsInteger;

    if Datas.AlertImageID.Strings.IndexOfName(IntToStr(vIDNT)) = -1 then
      MainForm.UpdateNotificationImages;

    vImageIndex := StrToInt(Datas.AlertImageID.Strings.Values[IntToStr(vIDNT)]);

    vIDOL := FieldByName('ID_OrderList').AsInteger;

    vHeader := '(' + FieldBYName('ID').AsString + ') ' + FieldByName('Header').AsString;
    vText := FieldByName('Text').AsString;
    vColor := FieldByName('Color').AsInteger;
    vShowTime := FieldByName('ShowTime').AsInteger;

    ShowNotification(vIDN, vIDOL, vHeader, vText, vColor, vShowTime, vImageIndex, 'fixed');
  end;
end;

procedure TBrowseNotificationForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TBrowseNotificationForm.aUpdateExecute(Sender: TObject);
begin
  UpdateData;
  Grid.SetFocus;
end;

end.
