//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор клиента
//
//------------------------------------------------------------------------------
unit USelectClient;

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
  TSelectClientForm = class(TForm)
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
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryName: TWideStringField;
    QueryComment: TWideStringField;
    TableViewName: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    ePhone: TdxBarEdit;
    QueryPhone: TWideStringField;
    QueryAddress: TWideStringField;
    TableViewPhone: TcxGridDBColumn;
    TableViewAddress: TcxGridDBColumn;
    QueryID: TIntegerField;
    QueryFlatNumber: TWideStringField;
    TableViewFlatNumber: TcxGridDBColumn;
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
    procedure ePhoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ePhoneExit(Sender: TObject);
    procedure TableViewPhoneGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function SelectClient(var ID : integer; APhone : string = '') : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectClient(var ID : integer; APhone : string = '') : boolean;
begin
  with TSelectClientForm.Create(nil) do
    try
      Query.Close;
      Query.ParamByName('P').AsString := '';
      Query.Open;
      Query.Locate('ID', ID, []);

      ePhone.Text := APhone;

//      if APhone <> '' then DBGrid.SetFocus;

      Result := ShowModal = mrOK;

      if Result then
        ID := Query.FieldByName('ID').AsInteger;

      Query.Close;
    finally
      Free;
    end;
end;

procedure TSelectClientForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectClientForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectClientForm.ePhoneExit(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('P').AsString := ePhone.Text;
  Query.Open;
end;

procedure TSelectClientForm.ePhoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TSelectClientForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectClientForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectClientForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectClientForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectClientForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectClientForm.TableViewPhoneGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText <> '' then
  begin
    AText := '(' + Copy(AText, 1, 3) + ') ' + Copy(AText, 4, 3) + '-' + Copy(AText, 7, 4);
  end;
end;

procedure TSelectClientForm.FormShow(Sender: TObject);
begin
  ePhone.SetFocus;
  SetOKEnabled;
end;

procedure TSelectClientForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
