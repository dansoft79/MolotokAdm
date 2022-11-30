//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Привязка уведомлений
//
//------------------------------------------------------------------------------
unit UNoticeTemplateSnap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  DB,  ADODB, dxBar, cxClasses, ActnList, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxGraphics, cxControls, dxStatusBar, cxSplitter, cxContainer,
  cxEdit, cxGroupBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxGrid, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, cxPropertiesStore, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  cxLookAndFeelPainters, cxLookAndFeels, System.Actions, cxNavigator,
  dxDateRanges, dxBarBuiltInMenu, dxColorEdit;

type
  TNoticeTemplateSnapForm = class(TForm)
    DataSource: TDataSource;
    dsUser: TDataSource;
    PopupMenu: TcxGridPopupMenu;
    ActionList: TActionList;
    aAdd: TAction;
    aDelete: TAction;
    aCancel: TAction;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    dxBarButton5: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    StatusBar: TdxStatusBar;
    gbEmployee: TcxGroupBox;
    gbReport: TcxGroupBox;
    Splitter: TcxSplitter;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    Level: TcxGridLevel;
    TableViewName: TcxGridDBColumn;
    TableViewESurname: TcxGridDBColumn;
    TableViewEName: TcxGridDBColumn;
    TableViewEPatro: TcxGridDBColumn;
    TableViewDName: TcxGridDBColumn;
    GridReport: TcxGrid;
    TableViewReport: TcxGridDBTableView;
    LevelReport: TcxGridLevel;
    qUser: TZQuery;
    qUserName: TWideStringField;
    qUserESurname: TWideStringField;
    qUserEName: TWideStringField;
    qUserEPatro: TWideStringField;
    qUserDName: TWideStringField;
    Query: TZQuery;
    Table: TZQuery;
    PropertiesStore: TcxPropertiesStore;
    QueryID: TIntegerField;
    TableViewIDE: TcxGridDBColumn;
    qUserID: TSmallintField;
    QueryID_User: TSmallintField;
    QueryHeader: TWideStringField;
    QueryText: TWideStringField;
    QueryColor: TIntegerField;
    QueryID_NoticeTemplate: TSmallintField;
    TableViewReportHeader: TcxGridDBColumn;
    TableViewReportText: TcxGridDBColumn;
    TableViewReportColor: TcxGridDBColumn;
    TableID: TIntegerField;
    TableID_User: TSmallintField;
    TableID_NoticeTemplate: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddReportSnapDialog : boolean;
    function DeleteReportSnapDialog : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
procedure ShowNoticeTempalteSnap(AParentAction : TAction);

implementation

{$R *.dfm}

uses
  UOptions, UDatas, mesdlg, UUtil, UWaiting, UConsts,
  MainUnit, types, USelectNoticeTemplateMulti;

procedure ShowNoticeTempalteSnap(AParentAction : TAction);
  var
    vForm : TNoticeTemplateSnapForm;
begin
  if OneWindow and ExistsForm(TNoticeTemplateSnapForm) then
  begin
    with FindForm(TNoticeTemplateSnapForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TNoticeTemplateSnapForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    qUser.Open;
    Query.Open;
    Table.Open;
    HideWaiting;

    Tag := MaxMDITag(ClassType) + 1;
    if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);

    Show;
  end;
end;

procedure TNoticeTemplateSnapForm.SetEnabledButtons;
  var
    ce : boolean;
begin
  ce := CanEditInActionByAction(MainForm.arReportSnap);
  aAdd.Enabled := ce;
  aDelete.Enabled := ce;
end;

procedure TNoticeTemplateSnapForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TNoticeTemplateSnapForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  TableViewReport.StoreToIniFile(cIniFileName, false);  
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TNoticeTemplateSnapForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  TableViewReport.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TNoticeTemplateSnapForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TNoticeTemplateSnapForm.aAddExecute(Sender: TObject);
begin
  FModified := AddReportSnapDialog or FModified;
  SetEnabledButtons;
end;

procedure TNoticeTemplateSnapForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TNoticeTemplateSnapForm.AddReportSnapDialog : boolean;
  var
    vID : TIntegerDynArray;
    vHeader : TStringDynArray;
    vIDE, vIDE0, i, j : integer;
begin
  Result := SelectNoticeTemplateMulti(vID, vHeader);
  if Result then
    Result := ShowMsg('Действительно добавить шаблоны каждому выделенному сотруднику?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;
  if Result then
  begin
    vIDE0 := qUser.FieldByName('ID').AsInteger;
    try
      for i := 0 to TableView.Controller.SelectedRecordCount - 1 do
        if TableView.Controller.SelectedRecords[i].IsData then
        begin
          vIDE := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewIDE.Index], 0);
          for j := 0 to Length(vID) - 1 do
            with Table do
              if not Locate('ID_User;ID_NoticeTemplate', VarArrayOf([vIDE, vID[j]]), []) then
              begin
                Append;
                FieldByName('ID_User').AsInteger := vIDE;
                FieldByName('ID_NoticeTemplate').AsInteger := vID[j];
                Post;
              end;
        end;
    finally
      qUser.Close;
      qUser.Open;
      qUser.Locate('ID', vIDE0, []);
      Query.Close;
      Query.Open;
    end;
  end;
  SetEnabledButtons;
end;

procedure TNoticeTemplateSnapForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteReportSnapDialog or FModified;
  SetEnabledButtons;
end;

function TNoticeTemplateSnapForm.DeleteReportSnapDialog: boolean;
  var
    vID : TIntegerDynArray;
    vHeader : TStringDynArray;
    vIDE, vIDE0, i, j : integer;
begin
  Result := SelectNoticeTemplateMulti(vID, vHeader);
  if Result then
    Result := ShowMsg('Действительно удалить указанные шаблоны у каждого выделенного сотрудника?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;
  if Result then
  begin
    vIDE0 := qUser.FieldByName('ID').AsInteger;
    try
      for i := 0 to TableView.Controller.SelectedRecordCount - 1 do
        if TableView.Controller.SelectedRecords[i].IsData then
        begin
          vIDE := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewIDE.Index], 0);
          for j := 0 to Length(vID) - 1 do
            if Table.Locate('ID_User;ID_NoticeTemplate', VarArrayOf([vIDE, vID[j]]), []) then
              Table.Delete;
        end;
    finally
      qUser.Close;
      qUser.Open;
      qUser.Locate('ID', vIDE0, []);

      Query.Close;
      Query.Open;
    end;
  end;
  SetEnabledButtons;
end;

end.
