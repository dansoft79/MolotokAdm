//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор нескольких отчетов
//
//------------------------------------------------------------------------------
unit USelectReportMulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  DB, ADODB, DBCtrls,
  Grids, DBGrids, Types, 
  cxGraphics, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, ActnList,
  dxBar, dxStatusBar, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, cxLookAndFeels,
  cxLookAndFeelPainters, System.Actions, cxNavigator, dxDateRanges,
  dxBarBuiltInMenu, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TSelectReportMultiForm = class(TForm)
    DataSource: TDataSource;
    StatusBar: TdxStatusBar;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    ActionList: TActionList;
    aOK: TAction;
    aCancel: TAction;
    DBGrid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewType: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewVersion: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    Query: TZQuery;
    QueryType: TWideStringField;
    QueryName: TWideStringField;
    QueryVersion: TWideStringField;
    QueryID: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QuerySize: TIntegerField;
    TableViewID: TcxGridDBColumn;
    QueryData: TBlobField;
    QueryComment: TWideStringField;
    aSelectAll: TAction;
    aUnselectAll: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    PopupMenu: TcxGridPopupMenu;
    procedure DBGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aUnselectAllExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function SelectReportMulti(var IDReport : TIntegerDynArray; var ReportName : TStringDynArray) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil;

function SelectReportMulti(var IDReport : TIntegerDynArray; var ReportName : TStringDynArray) : boolean;
  var
    i : integer;
begin
  with TSelectReportMultiForm.Create(nil) do
    try
      Query.Open;

      Result := ShowModal = mrOK;

      if Result then
      begin
        SetLength(IDReport, TableView.Controller.SelectedRecordCount);
        SetLength(ReportName, TableView.Controller.SelectedRecordCount);
        for i := 0 to TableView.Controller.SelectedRecordCount - 1 do
          if TableView.Controller.SelectedRecords[i].IsData then
          begin
            IDReport[i] := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewID.Index], 0);
            ReportName[i] :=
              IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewName.Index], '') + ', ' +
              IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewType.Index], '');
          end;
      end;
        
      Query.Close;
    finally
      Free;
    end;
end;

procedure TSelectReportMultiForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectReportMultiForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectReportMultiForm.aSelectAllExecute(Sender: TObject);
begin
  TableView.DataController.SelectAll;
end;

procedure TSelectReportMultiForm.aUnselectAllExecute(Sender: TObject);
begin
  TableView.DataController.ClearSelection;
end;

procedure TSelectReportMultiForm.DBGridDblClick(Sender: TObject);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectReportMultiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectReportMultiForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectReportMultiForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectReportMultiForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectReportMultiForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectReportMultiForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
