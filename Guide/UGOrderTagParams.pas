//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры тэга
//
//------------------------------------------------------------------------------
unit UGOrderTagParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, cxImageComboBox, cxImage, dxCore,
  dxColorEdit;

type
  TGOrderTagParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    cbColor: TcxLabel;
    eTag: TcxMaskEdit;
    cxLabel5: TcxLabel;
    cxLabel2: TcxLabel;
    Image: TcxImage;
    eColor: TdxColorEdit;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetOrderTagParams(
  var AActive : integer;
  var AName : string;
  var ATag : string;
  var AColor : integer;
  var AComment : string;
      AIcon : TMemoryStream) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetOrderTagParams(
  var AActive : integer;
  var AName : string;
  var ATag : string;
  var AColor : integer;
  var AComment : string;
      AIcon : TMemoryStream) : boolean;
begin
  with TGOrderTagParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      eName.Text := AName;
      eTag.Text := ATag;
      eColor.EditValue := AColor;
      eComment.Text := AComment;
      if Assigned(AICon) and (AICon.Size > 0) then
      begin
        AIcon.Position := 0;
        Image.Picture.LoadFromStream(AIcon);
      end;

      eColor.OnKeyDown := eKeyDown;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AName := Trim(eName.Text);
        ATag := Trim(eTag.Text);
        AColor := eColor.EditValue;
        AComment := Trim(eComment.Text);
        if Assigned(AICon) then
        begin
          AIcon.Clear;
          Image.Picture.SaveToStream(AIcon);
        end;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGOrderTagParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGOrderTagParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (Trim(eTag.Text) <> '');
end;

procedure TGOrderTagParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGOrderTagParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
