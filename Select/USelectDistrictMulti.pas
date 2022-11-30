//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор районов
//
//------------------------------------------------------------------------------
unit USelectDistrictMulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  DB, ADODB, DBCtrls,
  Grids, DBGrids, Types,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, Menus,
  cxLookAndFeelPainters, cxButtons, ActnList, dxBar, dxStatusBar,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, cxLookAndFeels, System.Actions, cxNavigator, dxDateRanges,
  dxColorEdit, dxBarBuiltInMenu, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TSelectDistrictMultiForm = class(TForm)
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
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryName: TWideStringField;
    QueryComment: TWideStringField;
    TableViewName: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    TableViewID: TcxGridDBColumn;
    aSelectAll: TAction;
    aUnselectAll: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
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
    procedure aSelectAllExecute(Sender: TObject);
    procedure aUnselectAllExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function SelectDistrictMulti(var ID : TIntegerDynArray) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectDistrictMulti(var ID : TIntegerDynArray) : boolean;
  var
    i : integer;
begin
  with TSelectDistrictMultiForm.Create(nil) do
    try
      Query.Open;

      Result := ShowModal = mrOK;

      if Result then
      begin
        SetLength(ID, TableView.Controller.SelectedRecordCount);
        for i := 0 to TableView.Controller.SelectedRecordCount - 1 do
          if TableView.Controller.SelectedRecords[i].IsData then
          begin
            ID[i] := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewID.Index], 0);
          end;
      end;

      Query.Close;
    finally
      Free;
    end;
end;

procedure TSelectDistrictMultiForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectDistrictMultiForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectDistrictMultiForm.aSelectAllExecute(Sender: TObject);
begin
  TableView.DataController.SelectAll;
end;

procedure TSelectDistrictMultiForm.aUnselectAllExecute(Sender: TObject);
begin
  TableView.DataController.ClearSelection;
end;

procedure TSelectDistrictMultiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectDistrictMultiForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectDistrictMultiForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectDistrictMultiForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectDistrictMultiForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectDistrictMultiForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectDistrictMultiForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
