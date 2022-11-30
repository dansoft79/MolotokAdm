//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор типа из базы данных
//
//------------------------------------------------------------------------------
unit USelectTypeDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxListBox,
  cxGraphics, cxLookAndFeels, cxEdit, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TSelectTypeDBForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    Query: TZQuery;
    DataSource: TDataSource;
    DBGrid: TcxGrid;
    TableView: TcxGridDBTableView;
    DBGridLevel: TcxGridLevel;
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//выбор строки из запроса, по уумолчанию создаются все колонки, колонка ID прячется
//возвращается значение ID колонки

function SelectTypeDB(ACaption : string; ASQL : string; AFieldCaption : string; AIDField : string; AHelpContext : integer) : string;

implementation

{$R *.dfm}

function SelectTypeDB(ACaption : string; ASQL : string; AFieldCaption : string; AIDField : string; AHelpContext : integer) : string;
  var
    i : integer;
    vFC : TStringList;
    s : string;
begin
  with TSelectTypeDBForm.Create(nil) do
    try
      Caption := ACaption;
      HelpContext := AHelpContext;

      Query.Close;

      if Query.Active then Query.Close;
      Query.SQL.Text := ASQL;

      vFC := TStringList.Create;
      vFC.Delimiter := ';';
      vFC.StrictDelimiter := true;
      vFC.DelimitedText := AFieldCaption;

      TableView.ClearItems;

      TableView.DataController.DataSource := nil;

      Query.Open;

      for i := 0 to Query.Fields.Count - 1 do
      begin
        s := Query.Fields[i].DisplayLabel;
        if vFC.IndexOfName(s) = -1 then Query.Fields[i].Visible := false
        else Query.Fields[i].DisplayLabel := vFC.Values[s];
      end;

      TableView.DataController.DataSource := DataSource;

      TableView.DataController.CreateAllItems;

      TableView.ApplyBestFit;

      if ShowModal = mrOK then
      begin
        Result := Query.FieldByname(AIDField).AsString;
      end
      else
      begin
        Result := '';
      end;

      Query.Close;

      vFC.Free;
    finally
      Free;
    end;
end;

procedure TSelectTypeDBForm.TableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if bOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectTypeDBForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  with TableView do
    bOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

end.
