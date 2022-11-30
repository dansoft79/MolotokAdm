//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор нескольких шаблонов уведомлений
//
//------------------------------------------------------------------------------
unit USelectNoticeTemplateMulti;

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
  TSelectNoticeMultiForm = class(TForm)
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
    GridLevel: TcxGridLevel;
    Query: TZQuery;
    aSelectAll: TAction;
    aUnselectAll: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    PopupMenu: TcxGridPopupMenu;
    QueryID: TSmallintField;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    QueryID_AssertUser: TSmallintField;
    QueryAssertTime: TDateTimeField;
    QueryHeader: TWideStringField;
    QueryText: TWideStringField;
    QueryColor: TIntegerField;
    QueryComment: TWideStringField;
    QueryPicture: TBlobField;
    QueryPictureType: TWideStringField;
    QueryShowTime: TIntegerField;
    QueryTimeFieldName: TWideStringField;
    QueryTimeConfition: TSmallintField;
    QueryTimeValue: TIntegerField;
    TableViewHeader: TcxGridDBColumn;
    TableViewText: TcxGridDBColumn;
    TableViewColor: TcxGridDBColumn;
    TableViewShowTime: TcxGridDBColumn;
    TableViewID: TcxGridDBColumn;
    QueryTimeFieldCaption: TWideStringField;
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

function SelectNoticeTemplateMulti(var ID : TIntegerDynArray; var Header : TStringDynArray) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil;

function SelectNoticeTemplateMulti(var ID : TIntegerDynArray; var Header : TStringDynArray) : boolean;
  var
    i : integer;
begin
  with TSelectNoticeMultiForm.Create(nil) do
    try
      Query.Open;

      Result := ShowModal = mrOK;

      if Result then
      begin
        SetLength(ID, TableView.Controller.SelectedRecordCount);
        SetLength(Header, TableView.Controller.SelectedRecordCount);
        for i := 0 to TableView.Controller.SelectedRecordCount - 1 do
          if TableView.Controller.SelectedRecords[i].IsData then
          begin
            ID[i] := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewID.Index], 0);
            Header[i] := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewHeader.Index], '');
          end;
      end;
        
      Query.Close;
    finally
      Free;
    end;
end;

procedure TSelectNoticeMultiForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectNoticeMultiForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectNoticeMultiForm.aSelectAllExecute(Sender: TObject);
begin
  TableView.DataController.SelectAll;
end;

procedure TSelectNoticeMultiForm.aUnselectAllExecute(Sender: TObject);
begin
  TableView.DataController.ClearSelection;
end;

procedure TSelectNoticeMultiForm.DBGridDblClick(Sender: TObject);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectNoticeMultiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectNoticeMultiForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectNoticeMultiForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectNoticeMultiForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectNoticeMultiForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectNoticeMultiForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
