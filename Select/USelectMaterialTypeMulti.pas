//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор нескольких видов материалов
//
//------------------------------------------------------------------------------
unit USelectMaterialTypeMulti;

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
  cxPropertiesStore, dxScrollbarAnnotations;

type
  TSelectMaterialTypeMultiForm = class(TForm)
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
    TableViewName: TcxGridDBColumn;
    TableViewPrice: TcxGridDBColumn;
    TableViewAmount: TcxGridDBColumn;
    TableViewWorkerClass: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    Level: TcxGridLevel;
    QueryName: TWideStringField;
    QueryID: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryDeleted: TSmallintField;
    QueryActive: TSmallintField;
    QueryComment: TWideStringField;
    QueryID_AssertUser: TSmallintField;
    QueryPrice: TFloatField;
    QueryAmount: TFloatField;
    QueryUnitName: TWideStringField;
    QueryWorkCode: TWideStringField;
    QueryAssertUser: TWideStringField;
    TableViewID: TcxGridDBColumn;
    aSelectAll: TAction;
    aUnselectAll: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    PopupMenu: TcxGridPopupMenu;
    TableViewSelected: TcxGridDBColumn;
    MemData: TdxMemData;
    QuerySelected: TWideStringField;
    PropertiesStore: TcxPropertiesStore;
    QueryAmountText: TWideStringField;
    TableViewCode: TcxGridDBColumn;
    QueryCategory: TWideStringField;
    TableViewCategory: TcxGridDBColumn;
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

function SelectMaterialTypeMulti(var ID : TIntegerDynArray) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectMaterialTypeMulti(var ID : TIntegerDynArray) : boolean;
  var
    i, n : integer;
begin
  with TSelectMaterialTypeMultiForm.Create(nil) do
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

procedure TSelectMaterialTypeMultiForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectMaterialTypeMultiForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectMaterialTypeMultiForm.aSelectAllExecute(Sender: TObject);
  var
    i : integer;
begin
  for i := TableView.ViewData.RowCount - 1 downto 0 do
  begin
    TableView.ViewData.Rows[i].Focused := true;
    MemData.Edit;
    MemData.FieldByName('Selected').AsString := '1';
    MemData.Post;
  end;
end;

procedure TSelectMaterialTypeMultiForm.aUnselectAllExecute(Sender: TObject);
  var
    i : integer;
begin
    for i := TableView.ViewData.RowCount - 1 downto 0 do
    begin
      TableView.ViewData.Rows[i].Focused := true;
      MemData.Edit;
      MemData.FieldByName('Selected').AsString := '0';
      MemData.Post;
    end;
end;

procedure TSelectMaterialTypeMultiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PropertiesStore.StoreTo(false);

  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectMaterialTypeMultiForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;

  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectMaterialTypeMultiForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := true;//Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectMaterialTypeMultiForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectMaterialTypeMultiForm.TableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  if dsEdit = MemData.State then
    MemData.Post;
end;

procedure TSelectMaterialTypeMultiForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectMaterialTypeMultiForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectMaterialTypeMultiForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
