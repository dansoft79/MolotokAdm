//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор адресов
//
//------------------------------------------------------------------------------
unit USelectEMail;

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
  dxSkinsdxBarPainter, cxCheckBox, cxLookAndFeels, System.Actions;

type
  TSelectClientForm1 = class(TForm)
    DataSource: TDataSource;
    DBGrid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    ActionList: TActionList;
    aAdd: TAction;
    BarManager: TdxBarManager;
    dxBarButton1: TdxBarButton;
    aOK: TAction;
    aCancel: TAction;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    StatusBar: TdxStatusBar;
    TableViewName: TcxGridDBColumn;
    TableViewShortName: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    TableViewType: TcxGridDBColumn;
    Query: TZQuery;
    QueryName: TWideStringField;
    QueryShortName: TWideStringField;
    QueryComment: TWideMemoField;
    QueryType: TWideStringField;
    QueryID: TIntegerField;
    QueryAppendDate: TDateTimeField;
    QueryID_Employee: TSmallintField;
    QueryMasterFIO: TWideStringField;
    QueryMasterPost: TWideStringField;
    QueryMasterFIORP: TWideStringField;
    QueryMasterPostRP: TWideStringField;
    QueryBasis: TWideStringField;
    QueryPSer: TWideStringField;
    QueryPNum: TWideStringField;
    QueryPWho: TWideStringField;
    QueryPDate: TDateTimeField;
    QueryCPerson: TWideStringField;
    QueryTown: TWideStringField;
    QueryAddress: TWideStringField;
    QueryJurAddress: TWideStringField;
    QueryPhone: TWideStringField;
    QueryFax: TWideStringField;
    QueryEMail: TWideStringField;
    QueryWebSite: TWideStringField;
    QueryINN: TWideStringField;
    QueryKPP: TWideStringField;
    QueryOKPO: TWideStringField;
    QueryRS: TWideStringField;
    QueryBIK: TWideStringField;
    QueryKS: TWideStringField;
    QueryBank: TWideStringField;
    QueryWithNDS: TSmallintField;
    QueryRegion: TWideStringField;
    QueryLine: TWideStringField;
    QueryProduction: TWideStringField;
    QueryIsCarrier: TSmallintField;
    QueryIsClient: TSmallintField;
    ableViewColumn1: TcxGridDBColumn;
    ableViewColumn2: TcxGridDBColumn;
    QueryPayDayCountClient: TSmallintField;
    QueryPayStartDateClient: TSmallintField;
    QueryPayDayCountCarrier: TSmallintField;
    QueryPayStartDateCarrier: TSmallintField;
    QueryContractNumClient: TWideStringField;
    QueryContractDateClient: TDateTimeField;
    QueryID_OrganizationClient: TSmallintField;
    QueryContractNumCarrier: TWideStringField;
    QueryContractDateCarrier: TDateTimeField;
    QueryID_OrganizationCarrier: TSmallintField;
    QueryNameBank: TWideStringField;
    QueryAccountant: TWideStringField;
    QueryIsBuyer: TSmallintField;
    QueryIsSeller: TSmallintField;
    QueryLastClientLoadDate: TDateTimeField;
    QueryLastCarrierLoadDate: TDateTimeField;
    ableViewColumn3: TcxGridDBColumn;
    ableViewColumn4: TcxGridDBColumn;
    QueryID_EmployeeAppend: TSmallintField;
    QueryContractCarrierKind: TSmallintField;
    QueryContractCarrierReturnDate: TDateTimeField;
    QueryContractCarrierReceiveDate: TDateTimeField;
    QueryContractCarrierSendDate: TDateTimeField;
    QueryContractClientKind: TSmallintField;
    QueryContractClientReturnDate: TDateTimeField;
    QueryContractClientReceiveDate: TDateTimeField;
    QueryContractClientSendDate: TDateTimeField;
    QueryActive: TSmallintField;
    QueryAssertDate: TDateTimeField;
    TableViewINN: TcxGridDBColumn;
    TableViewKPP: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure aAddExecute(Sender: TObject);
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

  TPartnerType = (ptAll, ptClient, ptCarrier, ptBuyer, ptSeller, ptOrganization);
  TActiveStatus = (asAll, asNotActive, asActive);

function SelectPartner(var ID : integer; AType : TPartnerType = ptAll; AActiveStatus : TActiveStatus = asAll) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGPartner, MainUnit, UUtil, DTKUtils;

function SelectPartner(var ID : integer; AType : TPartnerType = ptAll; AActiveStatus : TActiveStatus = asAll) : boolean;
begin
  with TSelectClientForm.Create(nil) do
    try
      aAdd.Enabled := CanEditInActionByAction(MainForm.agPartner);

      Query.ParamByName('ID1').Value := EmployeeID;
      Query.ParamByName('ID2').Value := EmployeeID;

      case AType of
        ptAll : Query.SQL[5] := '';
        ptClient :
        begin
          Query.SQL[2] := ' (select AccessAllClient from Employee where ID = ' + IntToStr(EmployeeID) + ') or ';
          Query.SQL[5] := ' and IsClient = 1';
        end;
        ptCarrier :
        begin
          Query.SQL[2] := ' (select AccessAllCarrier from Employee where ID = ' + IntToStr(EmployeeID) + ') or ';
          Query.SQL[5] := ' and IsCarrier = 1';
        end;
        ptBuyer :
        begin
          Query.SQL[5] := ' and IsBuyer = 1';
        end;
        ptSeller :
        begin
          Query.SQL[5] := ' and IsSeller = 1';
        end;
        ptOrganization :
        begin
          Query.SQL[5] := ' and ID in (select ID_Partner from Organization)';
        end;
      end;

      case AActiveStatus of
        asNotActive : Query.SQL[5] := Query.SQL[5] + ' and Active = 0';
        asActive : Query.SQL[5] := Query.SQL[5] + ' and Active = 1';          
      end;

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

procedure TSelectClientForm1.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  if AddPartner(vID, nil) then
  begin
    TableView.DataController.Filter.Active := false;

    Query.Close;
    Query.Open;

    Query.Locate('ID', vID, []);
  end;
  SetOKEnabled;
end;

procedure TSelectClientForm1.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectClientForm1.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelectClientForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TSelectClientForm1.FormCreate(Sender: TObject);
begin
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TSelectClientForm1.SetOKEnabled;
begin
  with TableView do aOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

procedure TSelectClientForm1.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectClientForm1.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetOKEnabled;
end;

procedure TSelectClientForm1.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSelectClientForm1.QueryAfterScroll(DataSet: TDataSet);
begin
  SetOKEnabled;
end;

end.
