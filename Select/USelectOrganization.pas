//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор организации
//
//------------------------------------------------------------------------------
unit USelectOrganization;

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
  dxSkinsdxBarPainter, cxLookAndFeels, System.Actions;

type
  TSelectOrganizationForm = class(TForm)
    DataSource: TDataSource;
    DBGrid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    ActionList: TActionList;
    BarManager: TdxBarManager;
    aOK: TAction;
    aCancel: TAction;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    StatusBar: TdxStatusBar;
    Query: TZQuery;
    QueryID: TSmallintField;
    QueryID_Partner: TIntegerField;
    QueryType: TWideStringField;
    QueryName: TWideStringField;
    QueryShortName: TWideStringField;
    QueryNameBank: TWideStringField;
    QueryMasterFIO: TWideStringField;
    QueryMasterPost: TWideStringField;
    QueryMasterFIORP: TWideStringField;
    QueryMasterPostRP: TWideStringField;
    QueryBasis: TWideStringField;
    QueryAccountant: TWideStringField;
    QueryPSer: TWideStringField;
    QueryPNum: TWideStringField;
    QueryPWho: TWideStringField;
    QueryPDate: TDateTimeField;
    QueryTown: TWideStringField;
    QueryAddress: TWideStringField;
    QueryJurAddress: TWideStringField;
    QueryPhone: TWideStringField;
    QueryFax: TWideStringField;
    QueryEMail: TWideStringField;
    QueryWebSite: TWideStringField;
    QueryINN: TWideStringField;
    QueryKPP: TWideStringField;
    QueryOKPO: TWideStringField;
    QueryRS: TWideStringField;
    QueryBIK: TWideStringField;
    QueryKS: TWideStringField;
    QueryBank: TWideStringField;
    QueryComment: TWideMemoField;
    QueryContractNumClient: TIntegerField;
    QueryContractYearClient: TIntegerField;
    QueryContractNumCarrier: TIntegerField;
    QueryContractYearCarrier: TIntegerField;
    QueryInvoicePayNum: TIntegerField;
    QueryInvoicePayYear: TIntegerField;
    QueryInvoiceNum: TIntegerField;
    QueryInvoiceYear: TIntegerField;
    QueryAssertTime: TDateTimeField;
    QueryID_AssertEmployee: TSmallintField;
    QueryActive: TSmallintField;
    QueryActYear: TIntegerField;
    QueryActNum: TIntegerField;
    QueryNameAct: TWideStringField;
    QueryNameInvoice: TWideStringField;
    QueryNameInvoicePay: TWideStringField;
    TableViewType: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewShortName: TcxGridDBColumn;
    TableViewNameBank: TcxGridDBColumn;
    TableViewMasterFIO: TcxGridDBColumn;
    TableViewMasterPost: TcxGridDBColumn;
    TableViewAddress: TcxGridDBColumn;
    TableViewJurAddress: TcxGridDBColumn;
    TableViewPhone: TcxGridDBColumn;
    TableViewFax: TcxGridDBColumn;
    TableViewEMail: TcxGridDBColumn;
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

function SelectOrganization(var ID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGRoute, MainUnit, UUtil, DTKUtils;

function SelectOrganization(var ID : integer) : boolean;
begin
  with TSelectOrganizationForm.Create(nil) do
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

procedure TSelectOrganizationForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectOrganizationForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectOrganizationForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectOrganizationForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectOrganizationForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectOrganizationForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectOrganizationForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;  
end;

procedure TSelectOrganizationForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectOrganizationForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
