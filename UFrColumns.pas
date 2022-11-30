//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Редатор списка колонок
//
//------------------------------------------------------------------------------
unit UFrColumns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBGrids, DBGridEh, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxListView;

type
  TColumnsFrame = class(TFrame)
    pColumns: TPanel;
    Columns: TcxListView;
  private
    { Private declarations }
    FDBGrid : TDBGridEh;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure InitColumns(ADBGrid : TDBGridEh);
    procedure SaveColumns;
  end;

implementation

{$R *.dfm}

uses
  db, UDatas;

{ TColumnsFrame }

constructor TColumnsFrame.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TColumnsFrame.InitColumns(ADBGrid : TDBGridEh);
  var
    i : integer;
    vColumnEh : TColumnEh;
begin
  FDBGrid := ADBGrid;
  Columns.Items.BeginUpdate;
  for i := 0 to FDBGrid.Columns.Count - 1 do
    with Columns.Items.Add do
    begin
      vColumnEh := FDBGrid.Columns[i];
      Data := pointer(vColumnEh);
      Caption := vColumnEh.Title.Caption;
      Checked := vColumnEh.Visible;
    end;
  Columns.Items.EndUpdate;
end;

procedure TColumnsFrame.SaveColumns;
  var
    i : integer;
    vChecked : boolean;
    vColumnEh : TColumnEh;
begin
  with Columns.Items do
    for i := 0 to Count - 1 do
      with Item[i] do
      begin
        vColumnEh := TColumnEh(Data);
        vChecked := Checked;
        vColumnEh.Visible := vChecked;
      end;
end;

end.
