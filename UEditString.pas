//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Ввод строки
//
//------------------------------------------------------------------------------
unit UEditString;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit;

type
  TEditStringForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eString: TcxTextEdit;
    EditLabel: TcxLabel;
    procedure eStringKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditString(var AText : string; ACaption : string = 'Ввод текста'; ALabel : string = 'Введите текст:'; AHelpContext : integer = 0) : boolean;

implementation

{$R *.dfm}

function EditString(var AText : string; ACaption : string = 'Ввод текста'; ALabel : string = 'Введите текст:'; AHelpContext : integer = 0) : boolean;
begin
  with TEditStringForm.Create(nil) do
    try
      HelpContext := AHelpContext;
      Caption := ACaption;
      EditLabel.Caption := ALabel;

      eString.Text := AText;

      Result := ShowModal = mrOK;

      AText := eString.Text;
    finally
      Free;
    end;
end;

procedure TEditStringForm.eStringKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

end.
