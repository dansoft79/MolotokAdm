//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Инструмент ввода даты
//
//------------------------------------------------------------------------------
unit UDateParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  MonthEdit, 
  Menus, cxLookAndFeelPainters, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxLabel,
  dxSkinsCore, dxSkinsDefaultPainters;

type
  TDateForm = class(TForm)
    pBottom: TPanel;
    Label1: TcxLabel;
    eDate: TcxDateEdit;
    bOK: TcxButton;
    bCancel: TcxButton;
    procedure eChange(Sender: TObject);
    procedure eDateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function EditDate(var ADate : String; ACaption : string = 'Ввод даты'; AHelpContext : integer = 0) : boolean;

implementation

{$R *.dfm}

uses
  UUtil, DTKUtils;

function EditDate(var ADate : String; ACaption : string = 'Ввод даты'; AHelpContext : integer = 0) : boolean;
begin
  with TDateForm.Create(nil) do
    try
      HelpContext := AHelpContext;
      Caption := ACaption;
      eDate.Text := ADate;
      Result := ShowModal = mrOK;
      if Result then
        ADate := eDate.Text;
    finally
      Free;
    end;
end;

procedure TDateForm.bOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TDateForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDateForm.eDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDateForm.SetOKEnabled;
begin
  bOK.Enabled :=
    IsDate(eDate.Text);
end;

end.
