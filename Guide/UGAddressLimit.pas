//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Справочник адресных ограничений
//
//------------------------------------------------------------------------------
unit UGAddressLimit;

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
  TGAddressLimitForm = class(TForm)
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
    QueryID: TSmallintField;
    QueryAddressType: TSmallintField;
    QueryAddressText: TWideStringField;
    QueryAddressTypeInfo: TWideStringField;
    TableViewAddressText: TcxGridDBColumn;
    TableViewAddressTypeInfo: TcxGridDBColumn;
    QueryAddressName: TWideStringField;
    TableViewAddressName: TcxGridDBColumn;
    QueryAssertDate: TDateTimeField;
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
    function AddAddressLimitDialog(var IDAddressLimit : integer) : boolean;
    function EditAddressLimitDialog : boolean;
    function DeleteAddressLimitDialog : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowAddressLimit(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddAddressLimit(var AIDAddressLimit : integer; AParentAction : TAction) : boolean;

//вызов окна изменения записи справочника
function EditAddressLimit(AIDAddressLimit : integer; AParentAction : TAction) : boolean;

//удаление указанной записи справочника
function DeleteAddressLimit(AIDAddressLimit : integer; AParentAction : TAction) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGAddressLimitParams, mesdlg, UUtil, UWaiting, UConsts,
  MainUnit;

function DoAction(var AIDAddressLimit : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGAddressLimitForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGAddressLimitForm) then
  begin
    with FindForm(TGAddressLimitForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGAddressLimitForm.Create(Application);
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
        Result := AddAddressLimitDialog(AIDAddressLimit);
        Close;
      end
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDAddressLimit, []);
          Result := EditAddressLimitDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDAddressLimit, []);
            Result := DeleteAddressLimitDialog;
            Close;
          end;
  end;
end;

function ShowAddressLimit(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddAddressLimit(var AIDAddressLimit : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDAddressLimit, cAddAction, nil);
end;

function EditAddressLimit(AIDAddressLimit : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDAddressLimit, cEditAction, nil);
end;

function DeleteAddressLimit(AIDAddressLimit : integer; AParentAction : TAction) : boolean;
begin
  Result := DoAction(AIDAddressLimit, cDeleteAction, nil);
end;

procedure TGAddressLimitForm.SetEnabledButtons;
  var
    ce, e : boolean;
begin
  with TableView.Controller do e := Assigned(FocusedRecord) and FocusedRecord.IsData;
  ce := CanEditInActionByAction(MainForm.agAddressLimit);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce;
  aEdit.Enabled := e and ce;
end;

procedure TGAddressLimitForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGAddressLimitForm.TableViewFocusedRecChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGAddressLimitForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileName);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGAddressLimitForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  BarManager.LoadFromIniFile(cIniFileName);
end;

procedure TGAddressLimitForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteAddressLimitDialog or FModified;
  SetEnabledButtons;
end;

procedure TGAddressLimitForm.aEditExecute(Sender: TObject);
begin
  FModified := EditAddressLimitDialog or FModified;
  SetEnabledButtons;
end;

procedure TGAddressLimitForm.aPrintExecute(Sender: TObject);
begin
  ComponentPrinter.Preview(true);
end;

procedure TGAddressLimitForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGAddressLimitForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGAddressLimitForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGAddressLimitForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGAddressLimitForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddAddressLimitDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGAddressLimitForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TGAddressLimitForm.AddAddressLimitDialog(var IDAddressLimit: integer): boolean;
  var
    vAddressText, vAddressName : string;
    vAddressType : integer;
begin
  vAddressType := 0;
  vAddressText := '';
  vAddressName := '';

  Result := GetAddressLimitParams(
    vAddressType,
    vAddressText,
    vAddressName);

  if Result then
  begin
    with Table do
      if Query.Locate('AddressType;AddressText', VarArrayOf([vAddressType, vAddressText]), []) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
      else
      begin
        Close;
        ParamByName('ID').AsInteger := 0;
        Open;
        Append;
        FieldByName('AddressType').AsInteger := vAddressType;
        FieldByName('AddressText').AsString := vAddressText;
        FieldByName('AddressName').AsString := vAddressName;
        Post;
        IDAddressLimit := FieldByName('ID').AsInteger;
        Close;
        Query.Close;
        Query.Open;
        Query.Locate('ID', IDAddressLimit, []);
      end;
  end;
  SetEnabledButtons;
end;

function TGAddressLimitForm.DeleteAddressLimitDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
    if DeleteRecSimple('AddressLimit', vID) then
    begin
      vRecNo := Query.RecNo;
      Query.Close;
      Query.Open;
      if Query.RecordCount > 1 then
        Query.RecNo := vRecNo;
    end;
  SetEnabledButtons;
end;

function TGAddressLimitForm.EditAddressLimitDialog: boolean;
  var
    vAddressText, vAddressName : string;
    vAddressType : integer;
    vID : integer;
begin
  with Query do
  begin
    vAddressType := FieldByName('AddressType').AsInteger;
    vAddressName := FieldByName('AddressName').AsString;
    vAddressText := FieldByName('AddressText').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result := GetAddressLimitParams(
    vAddressType,
    vAddressText,
    vAddressName);

  if Result then
  begin
    with Table do
      if Query.Locate('AddressType;AddressText', VarArrayOf([vAddressType, vAddressText]), []) and (Query.FieldByName('ID').AsInteger <> vID) then ShowMsg(cRecExists, smtInformation, [smbOK], smbOK, smbOK)
      else
      begin
        Close;
        ParamByName('ID').AsInteger := vID;
        Open;
        if Locate('ID', vID, []) then
        begin
          Edit;
          FieldByName('AddressType').AsInteger := vAddressType;
          FieldByName('AddressText').AsString := vAddressText;
          FieldByName('AddressName').AsString := vAddressName;
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

procedure TGAddressLimitForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
