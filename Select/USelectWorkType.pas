//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор вида работ
//
//------------------------------------------------------------------------------
unit USelectWorkType;

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
  dxBarBuiltInMenu, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TSelectWorkTypeForm = class(TForm)
    DataSource: TDataSource;
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
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewWCInfo: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewWorkCode: TcxGridDBColumn;
    TableViewUnitName: TcxGridDBColumn;
    TableViewPrice: TcxGridDBColumn;
    TableViewNorm: TcxGridDBColumn;
    TableViewAmount: TcxGridDBColumn;
    TableViewWorkerClass: TcxGridDBColumn;
    TableViewWarrantyTime: TcxGridDBColumn;
    TableViewWarrantyType: TcxGridDBColumn;
    TableViewFrequentWork: TcxGridDBColumn;
    TableViewPublicWork: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    Level: TcxGridLevel;
    QueryName: TWideStringField;
    QueryID: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryDeleted: TSmallintField;
    QueryActive: TSmallintField;
    QueryComment: TWideStringField;
    QueryID_AssertUser: TSmallintField;
    QueryID_WorkClass: TSmallintField;
    QueryPrice: TFloatField;
    QueryNorm: TFloatField;
    QueryAmount: TFloatField;
    QueryUnitName: TWideStringField;
    QueryWarrantyTime: TIntegerField;
    QueryWarrantyType: TSmallintField;
    QueryFrequentWork: TSmallintField;
    QueryPublicWork: TSmallintField;
    QueryWCInfo: TWideStringField;
    QueryWTInfo: TWideStringField;
    QueryWorkCode: TWideStringField;
    QueryID_WorkerClass: TSmallintField;
    QueryWCLInfo: TWideStringField;
    QueryAssertUser: TWideStringField;
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

function SelectWorkType(var ID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectWorkType(var ID : integer) : boolean;
begin
  with TSelectWorkTypeForm.Create(nil) do
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

procedure TSelectWorkTypeForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectWorkTypeForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectWorkTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectWorkTypeForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectWorkTypeForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectWorkTypeForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectWorkTypeForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectWorkTypeForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectWorkTypeForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
