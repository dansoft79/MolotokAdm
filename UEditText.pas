//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Редактор строки
//
//------------------------------------------------------------------------------
unit UEditText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, Menus, cxLookAndFeelPainters, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels;

type
  TEditTextForm = class(TForm)
    Memo: TcxMemo;
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    procedure MemoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditText(var vText : string; ACaption : string = ''; AHelpContext : integer = 0) : boolean;

implementation

{$R *.dfm}

function EditText(var vText : string; ACaption : string = ''; AHelpContext : integer = 0) : boolean;
begin
  with TEditTextForm.Create(nil) do
    try
      HelpContext := AHelpContext;
      Caption := ACaption;
      Memo.Lines.Text  := vText;
      Result := ShowModal = mrOK;
      if Result then
        vText := Memo.Text;
    finally
      Free;
    end;
end;

procedure TEditTextForm.MemoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Key := #0;
    ModalResult := mrCancel;
  end;
end;

end.
