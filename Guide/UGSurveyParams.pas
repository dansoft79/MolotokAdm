//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры вопроса
//
//------------------------------------------------------------------------------
unit UGSurveyParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxSpinEdit;

type
  TGSurveyParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    ePosition: TcxSpinEdit;
    cbActive: TcxCheckBox;
    cxLabel4: TcxLabel;
    cbVisibility: TcxComboBox;
    eQuestion: TcxMemo;
    cxLabel5: TcxLabel;
    cbAnswerType: TcxComboBox;
    cbAnswerRequired: TcxCheckBox;
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

function GetSurveyParams(
  var AActive, APosition : integer;
  var AVisibility, AAnswerType, AAnswerRequired : integer;
  var AQuestion, AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetSurveyParams(
  var AActive, APosition : integer;
  var AVisibility, AAnswerType, AAnswerRequired : integer;
  var AQuestion, AComment : string) : boolean;
begin
  with TGSurveyParamForm.Create(nil) do
    try
      cbActive.Checked := AActive = 1;

      ePosition.Value := APosition;
      cbVisibility.ItemIndex := AVisibility;
      cbAnswerType.ItemIndex := AAnswerType;
      cbAnswerRequired.Checked := AAnswerRequired = 1;
      eQuestion.Text := AQuestion;
      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AActive := BooleanToInt(cbActive.Checked);

        APosition := ePosition.Value;
        AVisibility := cbVisibility.ItemIndex;
        AAnswerType := cbAnswerType.ItemIndex;
        AAnswerRequired := BooleanToInt(cbAnswerRequired.Checked);
        AQuestion := Trim(eQuestion.Text);
        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGSurveyParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGSurveyParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eQuestion.Text) <> '');
end;

procedure TGSurveyParamForm.eCommentPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGSurveyParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGSurveyParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
