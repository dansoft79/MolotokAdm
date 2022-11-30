//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры активации
//
//------------------------------------------------------------------------------
unit UActivateParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxPropertiesStore, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxButtons,
  dxSkinsCore, dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxClasses;

type
  TActivateParamsForm = class(TForm)
    pBottom: TPanel;
    eEMail: TcxTextEdit;
    eActivateKey: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    eID: TcxTextEdit;
    cxLabel3: TcxLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    PropertiesStore: TcxPropertiesStore;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eEMailKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetActivateParams(
  var AEMail, AActivateKey : string;
      AID : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil;

function GetActivateParams(
  var AEMail, AActivateKey : string;
      AID : string) : boolean;
begin
  with TActivateParamsForm.Create(nil) do
    try
      PropertiesStore.StorageName := CurrentDir + ChangeFileExt(ExtractFileName(Application.ExeName), '') + PropertiesStore.StorageName;
      PropertiesStore.RestoreFrom;

      eID.Text := AID;
      
      Result := ShowModal = mrOK;

      if Result then
      begin
        AEMail := Trim(eEMail.Text);
        AActivateKey := Trim(eActivateKey.Text);

        PropertiesStore.StoreTo(false);
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TActivateParamsForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eEMail.Text) <> '') and
    (Trim(eActivateKey.Text) <> '');
end;

procedure TActivateParamsForm.eEMailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then key := vk_tab;
end;

procedure TActivateParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TActivateParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
