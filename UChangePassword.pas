//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Смена пароля 
//
//------------------------------------------------------------------------------
unit UChangePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, dxSkinsCore, dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels;

type
  TChangePasswordForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eOldPassword: TcxTextEdit;
    eNewPassword: TcxTextEdit;
    eConfirm: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure eOldPasswordChange(Sender: TObject);
    procedure eNewPasswordChange(Sender: TObject);
    procedure eConfirmChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function ChangePasswordDialog(var AOldPassword, ANewPassword : string) : boolean;

implementation

{$R *.dfm}

uses
  UUtil;

function ChangePasswordDialog(var AOldPassword, ANewPassword : string) : boolean;
begin
  with TChangePasswordForm.Create(nil) do
    try
      Result := ShowModal = mrOK;
      if Result then
      begin
        AOldPassword := eOldPassword.Text;
        ANewPassword := eNewPassword.Text;
      end;
    finally
      Free;
    end;
end;

{ TChangePasswordForm }

procedure TChangePasswordForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (eOldPassword.Text <> '') and
    (eNewPassword.Text <> '') and
    (eConfirm.Text = eNewPassword.Text);
end;

procedure TChangePasswordForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TChangePasswordForm.eOldPasswordChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TChangePasswordForm.eKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TChangePasswordForm.eNewPasswordChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TChangePasswordForm.eConfirmChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
