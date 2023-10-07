//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры вопроса
//
//------------------------------------------------------------------------------
unit UGSurveyAnswerParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxSpinEdit;

type
  TGSurveyAnswerParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    ePosition: TcxSpinEdit;
    cbActive: TcxCheckBox;
    eAnswer: TcxMemo;
    cbEdit: TcxCheckBox;
    cbChecked: TcxCheckBox;
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

function GetSurveyAnswerParams(
  var AActive, AEdit, AChecked, APosition : integer;
  var AAnswer : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetSurveyAnswerParams(
  var AActive, AEdit, AChecked, APosition : integer;
  var AAnswer : string) : boolean;
begin
  with TGSurveyAnswerParamForm.Create(nil) do
    try
      cbActive.Checked := AActive = 1;
      cbEdit.Checked := AEdit = 1;
      cbChecked.Checked := AChecked = 1;

      ePosition.Value := APosition;
      eAnswer.Text := AAnswer;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AActive := BooleanToInt(cbActive.Checked);
        AEdit := BooleanToInt(cbEdit.Checked);
        AChecked := BooleanToInt(cbChecked.Checked);

        APosition := ePosition.Value;
        AAnswer := Trim(eAnswer.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGSurveyAnswerParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGSurveyAnswerParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eAnswer.Text) <> '');
end;

procedure TGSurveyAnswerParamForm.eCommentPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGSurveyAnswerParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGSurveyAnswerParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
