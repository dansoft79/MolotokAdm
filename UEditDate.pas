//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Ввод даты
//
//------------------------------------------------------------------------------
unit UEditDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TEditDateForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    EditLabel: TcxLabel;
    eDate: TcxDateEdit;
    procedure eDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eDatePropertiesEditValueChanged(Sender: TObject);
    procedure eDatePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FCanEmpty : boolean;
  public
    { Public declarations }
  end;

function EditDate(var ADate : string; ACanEmpty : boolean = true; ACaption : string = 'Ввод даты'; ALabel : string = 'Введите дату:'; AHelpContext : integer = 0) : boolean;

implementation

{$R *.dfm}

uses
  DTKUtils;

function EditDate(var ADate : string; ACanEmpty : boolean = true; ACaption : string = 'Ввод даты'; ALabel : string = 'Введите дату:'; AHelpContext : integer = 0) : boolean;
begin
  with TEditDateForm.Create(nil) do
    try
      HelpContext := AHelpContext;
      FCanEmpty := ACanEmpty;

      Caption := ACaption;
      EditLabel.Caption := ALabel;

      eDate.Text := ADate;

      Result := ShowModal = mrOK;

      ADate := eDate.Text;
    finally
      Free;
    end;
end;

procedure TEditDateForm.eDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TEditDateForm.eDatePropertiesChange(Sender: TObject);
begin
  bOK.Enabled := FCanEmpty or IsDate(eDate.Text);
end;

procedure TEditDateForm.eDatePropertiesEditValueChanged(Sender: TObject);
begin
  bOK.Enabled := FCanEmpty or IsDate(eDate.Text);
end;

end.
