//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор нескольких статусов заявки
//
//------------------------------------------------------------------------------
unit USelectStatusTypeMulti;

interface

uses types,
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
  TSelectStatusTypeMultiForm = class(TForm)
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
    QueryNamePublic: TWideStringField;
    QueryColor: TLargeintField;
    QueryStatusOrder: TIntegerField;
    QueryDefStatus: TSmallintField;
    QueryFinStatus: TSmallintField;
    QueryComment: TWideStringField;
    TableViewName: TcxGridDBColumn;
    TableViewNamePublic: TcxGridDBColumn;
    TableViewColor: TcxGridDBColumn;
    TableViewStatusOrder: TcxGridDBColumn;
    TableViewDefStatus: TcxGridDBColumn;
    TableViewFinStatus: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    TableViewID: TcxGridDBColumn;
    PopupMenu: TcxGridPopupMenu;
    QueryWorkerVisible: TSmallintField;
    QueryWorkerSetup: TSmallintField;
    TableViewWorkerVisible: TcxGridDBColumn;
    TableViewWorkerSetup: TcxGridDBColumn;
    aSelectAll: TAction;
    aUnselectAll: TAction;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
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

function SelectStatusTypeMulti(var ID : TIntegerDynArray) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectStatusTypeMulti(var ID : TIntegerDynArray) : boolean;
  var
    i : integer;
begin
  with TSelectStatusTypeMultiForm.Create(nil) do
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

procedure TSelectStatusTypeMultiForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectStatusTypeMultiForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectStatusTypeMultiForm.aSelectAllExecute(Sender: TObject);
begin
  TableView.DataController.SelectAll;
end;

procedure TSelectStatusTypeMultiForm.aUnselectAllExecute(Sender: TObject);
begin
  TableView.DataController.ClearSelection;
end;

procedure TSelectStatusTypeMultiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectStatusTypeMultiForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectStatusTypeMultiForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectStatusTypeMultiForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectStatusTypeMultiForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectStatusTypeMultiForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectStatusTypeMultiForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
