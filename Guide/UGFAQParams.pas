//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры вопроса
//
//------------------------------------------------------------------------------
unit UGFAQParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxSpinEdit;

type
  TGFAQParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    ePosition: TcxSpinEdit;
    cbActive: TcxCheckBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eCommentPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetFAQParams(
  var AActive, APosition : integer;
  var AName, AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetFAQParams(
  var AActive, APosition : integer;
  var AName, AComment : string) : boolean;
begin
  with TGFAQParamForm.Create(nil) do
    try
      cbActive.Checked := AActive = 1;

      ePosition.Value := APosition;
      eName.Text := AName;
      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AActive := BooleanToInt(cbActive.Checked);

        APosition := ePosition.Value;
        AName := eName.Text;
        AComment := eComment.Text;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGFAQParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGFAQParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (Trim(eComment.Text) <> '');
end;

procedure TGFAQParamForm.eCommentPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGFAQParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGFAQParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
