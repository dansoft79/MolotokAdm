//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры точки отсчета для настройки уведомлений
//
//------------------------------------------------------------------------------
unit UNoticeOptionsTimeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxButtons, cxGraphics,
  cxLookAndFeels, cxMaskEdit, cxDropDownEdit, cxSpinEdit, cxCheckBox;

type
  TNoticeOptionsTimeParamsForm = class(TForm)
    pBottom: TPanel;
    cxLabel1: TcxLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel2: TcxLabel;
    ldadata: TcxLabel;
    eFieldCaption: TcxTextEdit;
    cbCondBefore: TcxCheckBox;
    cbCondAfter: TcxCheckBox;
    eMinValue: TcxSpinEdit;
    cxLabel3: TcxLabel;
    eMaxValue: TcxSpinEdit;
    cxLabel4: TcxLabel;
    eFieldName: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure SetOKEnabled;
    procedure FillTimeFields;
  end;

function GetNoticeOptionsTimeParams(
  var AFieldName, AFieldCaption : string;
  var AMinValue, AMaxValue : integer;
  var ACondBefore, ACondAfter : boolean) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, UDadataUtils, UDadataAddressParams;

function GetNoticeOptionsTimeParams(
  var AFieldName, AFieldCaption : string;
  var AMinValue, AMaxValue : integer;
  var ACondBefore, ACondAfter : boolean) : boolean;
begin
  with TNoticeOptionsTimeParamsForm.Create(nil) do
    try
      FillTimeFields;
      eFieldName.Text := AFieldName;
      eFieldCaption.Text := AFieldCaption;
      eMinValue.Value := AMinValue;
      eMaxValue.Value := AMaxValue;
      cbCondBefore.Checked := ACondBefore;
      cbCondAfter.Checked := ACondAfter;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AFieldName := Trim(eFieldName.Text);
        AFieldCaption := Trim(eFieldCaption.Text);
        AMinValue := eMinValue.Value;
        AMaxValue := eMaxValue.Value;
        ACondBefore := cbCondBefore.Checked;
        ACondAfter := cbCondAfter.Checked;
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TNoticeOptionsTimeParamsForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eFieldName.Text) <> '') and
    (eMinValue.Value <= eMaxValue.Value);
end;

procedure TNoticeOptionsTimeParamsForm.FillTimeFields;
begin
  eFieldName.Properties.Items.Clear;
  try
    FillComboBoxExSQL(eFieldName, 'SHOW COLUMNS FROM orderlist where type = ''datetime''', 'field', '');
  except
  end;
end;

procedure TNoticeOptionsTimeParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TNoticeOptionsTimeParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TNoticeOptionsTimeParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

end.