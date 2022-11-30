//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор района
//
//------------------------------------------------------------------------------
unit USelectDistrict;

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
  dxColorEdit, dxBarBuiltInMenu, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TSelectDistrictForm = class(TForm)
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
    Query: TZQuery;
    QueryID: TSmallintField;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryName: TWideStringField;
    QueryComment: TWideStringField;
    TableViewName: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    PopupMenu: TcxGridPopupMenu;
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function SelectDistrict(var ID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectDistrict(var ID : integer) : boolean;
begin
  with TSelectDistrictForm.Create(nil) do
    try
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

procedure TSelectDistrictForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectDistrictForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectDistrictForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectDistrictForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectDistrictForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectDistrictForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectDistrictForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectDistrictForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectDistrictForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
