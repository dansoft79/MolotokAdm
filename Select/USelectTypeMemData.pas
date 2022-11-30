//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор типа из MemData
//
//------------------------------------------------------------------------------
unit USelectTypeMemData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxListBox,
  cxGraphics, cxLookAndFeels, cxEdit, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  dxmdaset;

type
  TSelectTypeMemDataForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    DataSource: TDataSource;
    DBGrid: TcxGrid;
    TableView: TcxGridDBTableView;
    DBGridLevel: TcxGridLevel;
    MemData: TdxMemData;
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

//выбор строки из сохраненного файла, по уумолчанию создаются все колонки, колонка ID прячется
//возвращается значение ID колонки

function SelectTypeMemData(ACaption : string; AFileName : string; AFieldCaption : string; AHelpContext : integer) : string;

implementation

{$R *.dfm}

function SelectTypeMemData(ACaption : string; AFileName : string; AFieldCaption : string; AHelpContext : integer) : string;
  var
    i : integer;
    vFC : TStringList;
    s : string;
begin
  with TSelectTypeMemDataForm.Create(nil) do
    try
      Caption := ACaption;
      HelpContext := AHelpContext;

      MemData.Close;

      vFC := TStringList.Create;
      vFC.Delimiter := ';';
      vFC.StrictDelimiter := true;
      vFC.DelimitedText := AFieldCaption;

      TableView.ClearItems;

      TableView.DataController.DataSource := nil;

      MemData.Open;

      if FileExists(AFileName) then
      begin
        MemData.CreateFieldsFromBinaryFile(AFileName);
        MemData.LoadFromBinaryFile(AFileName);
      end;

      for i := 0 to MemData.Fields.Count - 1 do
      begin
        s := MemData.Fields[i].DisplayLabel;
        if vFC.IndexOfName(s) = -1 then MemData.Fields[i].Visible := false
        else MemData.Fields[i].DisplayLabel := vFC.Values[s];
      end;

      TableView.DataController.DataSource := DataSource;

      TableView.DataController.CreateAllItems;

      TableView.ApplyBestFit;

      if ShowModal = mrOK then
      begin
        Result := '';
        for i := 0 to MemData.Fields.Count - 1 do
        begin
          Result := Result + MemData.Fields[i].FieldName + '=' + MemData.Fields[i].AsString + ';';
        end;
      end
      else
      begin
        Result := '';
      end;

      MemData.Close;

      vFC.Free;
    finally
      Free;
    end;
end;

procedure TSelectTypeMemDataForm.TableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if bOK.Enabled then ModalResult := mrOK;
end;

procedure TSelectTypeMemDataForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  with TableView do
    bOK.Enabled := Assigned(Controller.FocusedRecord) and Controller.FocusedRecord.IsData;
end;

end.
