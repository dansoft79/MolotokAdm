//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор заказа
//
//------------------------------------------------------------------------------
unit USelectOrderList;

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
  dxColorEdit, dxBarBuiltInMenu, cxGridCustomPopupMenu, cxGridPopupMenu,
  dxScrollbarAnnotations;

type
  TSelectOrderListForm = class(TForm)
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
    TableViewOrderNUmber: TcxGridDBColumn;
    TableViewOrderDate: TcxGridDBColumn;
    TableViewClosed: TcxGridDBColumn;
    TableViewPhone: TcxGridDBColumn;
    TableViewAddress: TcxGridDBColumn;
    TableViewOCInfo: TcxGridDBColumn;
    TableViewFlatNumber: TcxGridDBColumn;
    TableViewStatusComment: TcxGridDBColumn;
    TableViewStatusInfo: TcxGridDBColumn;
    TableViewSignalInfo: TcxGridDBColumn;
    TableViewPFInfo: TcxGridDBColumn;
    TableViewSourceInfo: TcxGridDBColumn;
    TableViewCloseTime: TcxGridDBColumn;
    TableViewPersonalAccount: TcxGridDBColumn;
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

function SelectOrderList(var ID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectOrderList(var ID : integer) : boolean;
begin
  with TSelectOrderListForm.Create(nil) do
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

procedure TSelectOrderListForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectOrderListForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectOrderListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectOrderListForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectOrderListForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectOrderListForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectOrderListForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectOrderListForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectOrderListForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
