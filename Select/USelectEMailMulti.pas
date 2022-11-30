//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Мультивыбор контрагентов
//
//------------------------------------------------------------------------------
unit USelectEMailMulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  DB, ADODB, DBCtrls,
  Grids, DBGrids, 
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, Menus,
  cxLookAndFeelPainters, cxButtons, ActnList, dxBar, dxStatusBar, types,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, cxCheckBox, cxLookAndFeels, System.Actions, cxBarEditItem,
  cxNavigator, dxDateRanges, dxBarBuiltInMenu, cxGridCustomPopupMenu,
  cxGridPopupMenu;

type
  TSelectEMailMultiForm = class(TForm)
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
    TableViewName: TcxGridDBColumn;
    TableViewShortName: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    TableViewType: TcxGridDBColumn;
    aSelectAll: TAction;
    aUnselectAll: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    Query: TZQuery;
    QueryName: TWideStringField;
    QueryShortName: TWideStringField;
    QueryComment: TWideMemoField;
    QueryType: TWideStringField;
    QueryID: TIntegerField;
    TableViewID: TcxGridDBColumn;
    QueryIsClient: TSmallintField;
    QueryIsCarrier: TSmallintField;
    TableViewIsClient: TcxGridDBColumn;
    TableViewIsCarrier: TcxGridDBColumn;
    QueryIsSeller: TSmallintField;
    QueryIsBuyer: TSmallintField;
    QueryINN: TWideStringField;
    QueryKPP: TWideStringField;
    TableViewIsSeller: TcxGridDBColumn;
    TableViewIsBuyer: TcxGridDBColumn;
    TableViewINN: TcxGridDBColumn;
    TableViewKPP: TcxGridDBColumn;
    QueryPCInfo: TWideStringField;
    QueryEMail: TWideStringField;
    cbPartner: TcxBarEditItem;
    cbContact: TcxBarEditItem;
    TableViewPCInfo: TcxGridDBColumn;
    TableViewEMail: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
    StyleEMail: TcxStyle;
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
    procedure aSelectAllExecute(Sender: TObject);
    procedure aUnselectAllExecute(Sender: TObject);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cbPartnerPropertiesChange(Sender: TObject);
    procedure cbContactPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateData;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

var
  DefEMailIDPartner : integer = 0;//контрагент по умолчанию для фильтра его в списке

function SelectEMailMulti(var EMAIL : string) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, MainUnit, UUtil, DTKUtils;

function SelectEMailMulti(var EMAIL : string) : boolean;
  var
    i : integer;
    s : string;
begin
  with TSelectEMailMultiForm.Create(nil) do
    try
      UpdateData;

      if DefEMailIDPartner <> 0 then
      begin
        TableView.DataController.Filter.AddItem(nil, TableViewID, foEqual, IntToStr(DefEMailIDPartner), IntToStr(DefEMailIDPartner));
        TableView.DataController.Filter.Active := true;
      end;

      Result := ShowModal = mrOK;

      if Result then
      begin
        EMail := '';
        for i := 0 to TableView.Controller.SelectedRecordCount - 1 do
          if TableView.Controller.SelectedRecords[i].IsData then
          begin
            s := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewEMail.Index], '');
            if Trim(s) <> '' then
            begin
              if EMail <> '' then
                EMail := EMail + ';';
              EMail := Email + s;
            end;
          end;
      end;

      Query.Close;
    finally
      Free;
    end;
end;

procedure TSelectEMailMultiForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectEMailMultiForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectEMailMultiForm.aSelectAllExecute(Sender: TObject);
begin
  TableView.DataController.SelectAll;
end;

procedure TSelectEMailMultiForm.aUnselectAllExecute(Sender: TObject);
begin
  TableView.DataController.ClearSelection;
end;

procedure TSelectEMailMultiForm.cbContactPropertiesChange(Sender: TObject);
begin
  UpdateData;
end;

procedure TSelectEMailMultiForm.cbPartnerPropertiesChange(Sender: TObject);
begin
  UpdateData;
end;

procedure TSelectEMailMultiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectEMailMultiForm.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectEMailMultiForm.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectEMailMultiForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectEMailMultiForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectEMailMultiForm.UpdateData;
begin
  Query.Close;
  Query.ParamByName('ID1').Value := UserID;
  Query.ParamByName('ID2').Value := UserID;
  Query.ParamByName('PE').Value := BooleanToInt(cbPartner.EditValue);
  Query.ParamByName('CE').Value := BooleanToInt(cbContact.EditValue);
  Query.Open;
end;

procedure TSelectEMailMultiForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectEMailMultiForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
