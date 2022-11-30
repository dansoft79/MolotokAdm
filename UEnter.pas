//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Инструмент авторизации
//
//------------------------------------------------------------------------------
unit UEnter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, dxSkinsCore,
  Menus, cxLookAndFeelPainters,
  cxPropertiesStore, cxTextEdit, cxCheckBox, cxButtons, cxControls, cxContainer,
  cxEdit, cxImage, cxGraphics, cxLookAndFeels, dxSkinsDefaultPainters, cxClasses,
  cxLabel;

type
  TEnterForm = class(TForm)
    Image: TcxImage;
    bOK: TcxButton;
    bCancel: TcxButton;
    cbSavePassword: TcxCheckBox;
    eName: TcxTextEdit;
    ePassword: TcxTextEdit;
    PropertiesStore: TcxPropertiesStore;
    Label1: TcxLabel;
    Label2: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure ePasswordChange(Sender: TObject);
    procedure eNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FPassword : string;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetEnterInfo(var AName, APassword : string; AUseSavePassword : boolean = true) : boolean;

implementation

{$R *.dfm}

uses
  UConsts, UDatas, UOptions, UUtil, DTKUtils, MainUnit, jclFileUtils;

function GetEnterInfo(var AName, APassword : string; AUseSavePassword : boolean = true) : boolean;
  var
    s : ansistring;
begin
  with TEnterForm.Create(nil) do
    try
      PropertiesStore.StorageName := CurrentDir + ChangeFileExt(ExtractFileName(Application.ExeName), '') + PropertiesStore.StorageName;
      PropertiesStore.RestoreFrom;

      if ePassword.Text <> '' then
        try
          s := ePassword.Text;
          s := DecodeBase64String(s);
          ePassword.Text := s;
        except
          ePassword.Text := '';
        end;

      cbSavePassword.Checked := SavePassword;

      if not SavePassword then ePassword.Text := '';

      if (Trim(ParamValue('login')) <> '') and (Trim(ParamValue('password')) <> '') then
      begin
        eName.Text := Trim(ParamValue('login'));
        ePassword.Text := Trim(ParamValue('password'));
      end
      else
        if (eName.Text = '') and (ePassword.Text = '') then
        begin
          eName.Text := 'Администратор';
          ePassword.Text := 'demo';
        end;

      if
        (AUseSavePassword and SavePassword or (Trim(ParamValue('login')) <> '') and (Trim(ParamValue('password')) <> '')) and
        (ePassword.Text <> '') and (eName.Text <> '') then Result := true
      else Result := ShowModal = mrOK;

      if Result then
      begin
        SavePassword := cbSavePassword.Checked;

        FPassword := ePassword.Text;
        if not cbSavePassword.Checked then ePassword.Text := ''
        else
        begin
          s := ePassword.Text;
          s := EnCodeBase64String(s);
          ePassword.Text := s;
        end;
        PropertiesStore.StoreTo(false);

        AName := AnsiLowerCase(Trim(eName.Text));
        APassword := Trim(FPassword);

        SaveOptions;
      end;
    finally
      Free;
    end;
end;

{ TEnterForm }

procedure TEnterForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
  if eName.Text = '' then eName.SetFocus
  else
    if ePassword.Text = '' then ePassword.SetFocus
    else bOK.SetFocus;

  BringToFront;
end;

procedure TEnterForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (ePassword.Text <> '');
end;

procedure TEnterForm.eNameChange(Sender: TObject);
begin
  SetOKEnabled
end;

procedure TEnterForm.eNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then key := vk_tab;
end;

procedure TEnterForm.ePasswordChange(Sender: TObject);
begin
  SetOKEnabled
end;

end.
