//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор скидок
//
//------------------------------------------------------------------------------
unit USelectDiscount;

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
  TSelectDiscountForm = class(TForm)
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
    TableViewComment: TcxGridDBColumn;
    PopupMenu: TcxGridPopupMenu;
    QueryFromDate: TDateTimeField;
    QueryToDate: TDateTimeField;
    QueryPromocode: TWideStringField;
    QueryType: TSmallintField;
    QuerySize: TFloatField;
    QueryMinOrderSum: TFloatField;
    QueryDebtType: TSmallintField;
    QuerySubType: TIntegerField;
    QueryCanAdd: TSmallintField;
    QueryAllWorkType: TSmallintField;
    TableViewFromDate: TcxGridDBColumn;
    TableViewToDate: TcxGridDBColumn;
    TableViewPromocode: TcxGridDBColumn;
    TableViewMinOrderSum: TcxGridDBColumn;
    TableViewCanAdd: TcxGridDBColumn;
    QueryDiscountText: TStringField;
    TableViewDiscountText: TcxGridDBColumn;
    QueryDTInfo: TWideStringField;
    QueryDDTInfo: TWideStringField;
    QueryDSTInfo: TWideStringField;
    TableViewDDTInfo: TcxGridDBColumn;
    TableViewDSTInfo: TcxGridDBColumn;
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
    procedure QueryCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function SelectDiscount(var ID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectDiscount(var ID : integer) : boolean;
begin
  with TSelectDiscountForm.Create(nil) do
    try
      Query.Close;
      Query.ParamByName('DT').AsString := DateToSQLDate(Date);
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

procedure TSelectDiscountForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectDiscountForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectDiscountForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectDiscountForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectDiscountForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectDiscountForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectDiscountForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectDiscountForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectDiscountForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

procedure TSelectDiscountForm.QueryCalcFields(DataSet: TDataSet);
  var
    s : string;
begin
  s := Dataset.FieldByName('Size').AsString;
  case Dataset.FieldByName('Type').AsInteger of
    0 : s := s + ' %';
    1 : s := s + ' р.';
  end;

  Dataset.FieldByName('DiscountText').AsString := s;
end;

end.
