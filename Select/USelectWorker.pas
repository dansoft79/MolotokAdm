//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор мастера
//
//------------------------------------------------------------------------------
unit USelectWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  DB, ADODB, DBCtrls,
  Grids, DBGrids, 
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, Menus,
  cxLookAndFeelPainters, cxButtons, ActnList, dxBar, dxStatusBar,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, cxLookAndFeels, System.Actions, cxNavigator, dxDateRanges,
  dxBarBuiltInMenu, cxGridCustomPopupMenu, cxGridPopupMenu, cxPropertiesStore,
  cxDropDownEdit, cxBarEditItem;

type
  TSelectWorkerForm = class(TForm)
    DataSource: TDataSource;
    DBGrid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    ActionList: TActionList;
    BarManager: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    aOK: TAction;
    aCancel: TAction;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    StatusBar: TdxStatusBar;
    PopupMenu: TcxGridPopupMenu;
    Query: TZQuery;
    QueryAssertUser: TWideStringField;
    QueryID: TSmallintField;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QuerySurname: TWideStringField;
    QueryName: TWideStringField;
    QueryPatro: TWideStringField;
    QueryComment: TWideStringField;
    QueryPhone: TWideStringField;
    QueryWCInfo: TWideStringField;
    QueryID_WorkerCompany: TSmallintField;
    QueryID_UserRole: TSmallintField;
    QueryEmail: TWideStringField;
    QueryPassword: TWideStringField;
    QueryURInfo: TWideStringField;
    TableViewSurname: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewPatro: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    TableViewPhone: TcxGridDBColumn;
    TableViewWCInfo: TcxGridDBColumn;
    TableViewEmail: TcxGridDBColumn;
    QueryCatList: TWideStringField;
    TableViewCatList: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
    StyleBold: TcxStyle;
    QueryTagList: TWideStringField;
    TableViewTagList: TcxGridDBColumn;
    PropertiesStore: TcxPropertiesStore;
    cbDistrict: TdxBarCombo;
    cbCategory: TdxBarCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure TableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cbDistrictChange(Sender: TObject);
    procedure cbCategoryChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
    procedure FillDistrict;
    procedure FillCategory;
    procedure UpdateSQL;
  end;

function SelectWorker(var ID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectWorker(var ID : integer) : boolean;
begin
  with TSelectWorkerForm.Create(nil) do
    try
      FillDistrict;
      FillCategory;

      Query.Open;
      Query.Locate('ID', ID, []);

      Result := ShowModal = mrOK;

      if Result then
        ID := Query.FieldByName('ID').AsInteger;

      Query.Close;
    finally
      Free;
    end;
end;

procedure TSelectWorkerForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectWorkerForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectWorkerForm.cbCategoryChange(Sender: TObject);
begin
  UpdateSQL;
end;

procedure TSelectWorkerForm.cbDistrictChange(Sender: TObject);
begin
  UpdateSQL;
end;

procedure TSelectWorkerForm.FillCategory;
begin
  FillBarComboBoxExSQL(cbCategory, 'select Tag, ID from WorkerClass order by Tag', 'Tag', 'ID');
  cbCategory.Items.AddObject('(ничего не выбрано)', pointer(0));
  SetBarItemIndexByID(cbCategory, 0);
end;

procedure TSelectWorkerForm.FillDistrict;
begin
  FillBarComboBoxExSQL(cbDistrict, 'select Name, ID from District order by Name', 'Name', 'ID');
  cbDistrict.Items.AddObject('(ничего не выбрано)', pointer(0));
  SetBarItemIndexByID(cbDistrict, 0);
end;

procedure TSelectWorkerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self);
  PropertiesStore.StoreTo(false);

  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectWorkerForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectWorkerForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectWorkerForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectWorkerForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectWorkerForm.UpdateSQL;
  var
    vID : integer;
begin
  vID := Query.FieldBYName('ID').AsInteger;

  Query.Close;
  Query.ParamByName('IDD1').AsInteger := GetBarIDByItemIndex(cbDistrict);
  Query.ParamByName('IDD2').AsInteger := GetBarIDByItemIndex(cbDistrict);
  Query.ParamByName('IDC1').AsInteger := GetBarIDByItemIndex(cbCategory);
  Query.ParamByName('IDC2').AsInteger := GetBarIDByItemIndex(cbCategory);
  Query.Open;

  Query.Locate('ID', vID, []);
end;

procedure TSelectWorkerForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectWorkerForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
