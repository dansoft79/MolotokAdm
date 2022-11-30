//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры добавления файла
//
//------------------------------------------------------------------------------
unit UFileParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxMaskEdit, cxButtonEdit, cxMemo;

type
  TFileAddParamsForm = class(TForm)
    pBottom: TPanel;
    cxLabel1: TcxLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eFileName: TcxButtonEdit;
    OpenDialog: TOpenDialog;
    cxLabel2: TcxLabel;
    mComment: TcxMemo;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure mCommentPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FEdit : boolean;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetFileParams(
  var AFileName, AComment : string;
      AEdit : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil;

function GetFileParams(
  var AFileName, AComment : string;
      AEdit : boolean = false) : boolean;
begin
  with TFileAddParamsForm.Create(nil) do
    try
      FEdit := AEdit;
      eFileName.Properties.Buttons[0].Visible := not AEdit;
      eFileName.Text := AFileName;
      eFileName.Enabled := not FEdit;
      
      mComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
        if not AEdit then AFileName := Trim(eFileName.Text);
        AComment := Trim(mComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TFileAddParamsForm.SetOKEnabled;
begin
  bOK.Enabled := FileExists(eFileName.Text) or FEdit;
end;

procedure TFileAddParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TFileAddParamsForm.mCommentPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TFileAddParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TFileAddParamsForm.eFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  OpenDialog.FileName := eFileName.Text;
  if OpenDialog.Execute then
  begin
    eFileName.Text := OpenDialog.FileName;
  end;
end;

procedure TFileAddParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

end.
