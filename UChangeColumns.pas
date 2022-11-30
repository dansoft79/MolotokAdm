//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Настройка колонок
//
//------------------------------------------------------------------------------
unit UChangeColumns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UFrColumns, DBGrids, DBGridEh;

type
  TFormChangeColumns = class(TForm)
    pBottom: TPanel;
    bOK: TBitBtn;
    BitBtn1: TBitBtn;
    ColumnsFrame: TColumnsFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
             
function ChangeColumns(ADBGrid : TDBGridEh) : boolean;

implementation

{$R *.dfm}

function ChangeColumns(ADBGrid : TDBGridEh) : boolean;
begin
  with TFormChangeColumns.Create(nil) do
    try
      ColumnsFrame.InitColumns(ADBGrid);
      Result := ShowModal = mrOK;
      if Result then
        ColumnsFrame.SaveColumns;
    finally
      Free;
    end;
end;

end.
