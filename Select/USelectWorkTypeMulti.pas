//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор нескольких видов работ
//
//------------------------------------------------------------------------------
unit USelectWorkTypeMulti;

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
  dxBarBuiltInMenu, cxGridCustomPopupMenu, cxGridPopupMenu, dxmdaset,
  cxPropertiesStore;

type
  TSelectWorkTypeMultiForm = class(TForm)
    DataSource: TDataSource;
    ActionList: TActionList;
    BarManager: TdxBarManager;
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
    TableViewPrice: TcxGridDBColumn;
    TableViewNorm: TcxGridDBColumn;
    TableViewAmount: TcxGridDBColumn;
    TableViewWorkerClass: TcxGridDBColumn;
    TableViewWarranty: TcxGridDBColumn;
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
    TableViewID: TcxGridDBColumn;
    aSelectAll: TAction;
    aUnselectAll: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    PopupMenu: TcxGridPopupMenu;
    TableViewSelected: TcxGridDBColumn;
    MemData: TdxMemData;
    QueryDescription: TWideStringField;
    QuerySelected: TWideStringField;
    PropertiesStore: TcxPropertiesStore;
    QueryAmountText: TWideStringField;
    QueryWarrantyText: TWideStringField;
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
    procedure TableViewEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function SelectWorkTypeMulti(var ID : TIntegerDynArray) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectWorkTypeMulti(var ID : TIntegerDynArray) : boolean;
  var
    i, n : integer;
begin
  with TSelectWorkTypeMultiForm.Create(nil) do
    try
      Query.Open;

      MemData.LoadFromDataSet(Query);

      Datasource.DataSet := MemData;

      TableView.DataController.GotoFirst;

      Result := ShowModal = mrOK;

      if Result then
      begin
        n := 0;
        MemData.First;
        while not MemData.eof do
        begin
          if MemData.FieldByName('Selected').AsString = '1' then inc(n);
          MemData.Next;
        end;

        SetLength(ID, n);
        n := 0;
        MemData.First;
        while not MemData.eof do
        begin
          if MemData.FieldByName('Selected').AsString = '1' then
          begin
            ID[n] := MemData.FieldByName('ID').AsInteger;
            inc(n);
          end;
          MemData.Next;
        end;
      end;

      Query.Close;
    finally
      Free;
    end;
end;

procedure TSelectWorkTypeMultiForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectWorkTypeMultiForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectWorkTypeMultiForm.aSelectAllExecute(Sender: TObject);
begin
  TableView.DataController.SelectAll;
end;

procedure TSelectWorkTypeMultiForm.aUnselectAllExecute(Sender: TObject);
begin
  TableView.DataController.ClearSelection;
end;

procedure TSelectWorkTypeMultiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PropertiesStore.StoreTo(false);

  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectWorkTypeMultiForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectWorkTypeMultiForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectWorkTypeMultiForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectWorkTypeMultiForm.TableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  if dsEdit = MemData.State then
    MemData.Post;
end;

procedure TSelectWorkTypeMultiForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectWorkTypeMultiForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectWorkTypeMultiForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
