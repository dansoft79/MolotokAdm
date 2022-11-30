//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор категории исполнителя
//
//------------------------------------------------------------------------------
unit USelectWorkerClass;

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
  TSelectWorkerClassForm = class(TForm)
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
    TableViewName: TcxGridDBColumn;
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
    QueryColor: TLargeintField;
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

function SelectWorkerClass(AIDWorkClass : integer; var ID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectWorkerClass(AIDWorkClass : integer; var ID : integer) : boolean;
begin
  with TSelectWorkerClassForm.Create(nil) do
    try
      Query.ParamByName('IDWC').AsInteger := AIDWorkClass;
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

procedure TSelectWorkerClassForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectWorkerClassForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectWorkerClassForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectWorkerClassForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectWorkerClassForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectWorkerClassForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectWorkerClassForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectWorkerClassForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectWorkerClassForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
