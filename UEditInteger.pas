//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Ввод целого
//
//------------------------------------------------------------------------------
unit UEditInteger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit,  cxMaskEdit, cxSpinEdit;

type
  TEditIntegerForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    EditLabel: TcxLabel;
    eInt: TcxSpinEdit;
    procedure eStringKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditInteger(var AInteger : integer; ACaption : string = 'Ввод текста'; ALabel : string = 'Введите текст:'; AHelpContext : integer = 0) : boolean;

implementation

{$R *.dfm}

function EditInteger(var AInteger : integer; ACaption : string = 'Ввод текста'; ALabel : string = 'Введите текст:'; AHelpContext : integer = 0) : boolean;
begin
  with TEditIntegerForm.Create(nil) do
    try
      HelpContext := AHelpContext;
      Caption := ACaption;
      EditLabel.Caption := ALabel;

      eInt.Value := AInteger;

      Result := ShowModal = mrOK;

      if Result then
        AInteger := eInt.Value;
    finally
      Free;
    end;
end;

procedure TEditIntegerForm.eStringKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

end.
