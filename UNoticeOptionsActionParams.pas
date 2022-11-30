//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры точки отсчета для настройки уведомлений
//
//------------------------------------------------------------------------------
unit UNoticeOptionsActionParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxButtons, cxGraphics,
  cxLookAndFeels, cxMaskEdit, cxDropDownEdit, cxSpinEdit, cxCheckBox;

type
  TNoticeOptionsActionParamsForm = class(TForm)
    pBottom: TPanel;
    cxLabel1: TcxLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel2: TcxLabel;
    ldadata: TcxLabel;
    eOrderFieldCaption: TcxTextEdit;
    cbCondEqual: TcxCheckBox;
    cbCondNotEqual: TcxCheckBox;
    cxLabel3: TcxLabel;
    eOrderFieldName: TcxComboBox;
    cbCanSetNull: TcxCheckBox;
    cbCanSetValue: TcxCheckBox;
    eOrderFieldValue: TcxTextEdit;
    cxLabel4: TcxLabel;
    eTableName: TcxTextEdit;
    cxLabel5: TcxLabel;
    eTableCaption: TcxTextEdit;
    cxLabel6: TcxLabel;
    eFieldName: TcxTextEdit;
    eFieldCaption: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    eOrderFieldValueCaption: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure SetOKEnabled;
    procedure FillFields;
  end;

function GetNoticeOptionsActionParams(
  var AOrderFieldName, AOrderFieldCaption, AOrderFieldValue, AOrderFieldValueCaption : string;
  var ATableName, ATableCaption, AFieldName, AFieldCaption : string;
  var ACondEqual, ACondNotEqual, ACanSetNull, ACanSetValue : boolean) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, UDadataUtils, UDadataAddressParams;

function GetNoticeOptionsActionParams(
  var AOrderFieldName, AOrderFieldCaption, AOrderFieldValue, AOrderFieldValueCaption : string;
  var ATableName, ATableCaption, AFieldName, AFieldCaption : string;
  var ACondEqual, ACondNotEqual, ACanSetNull, ACanSetValue : boolean) : boolean;
begin
  with TNoticeOptionsActionParamsForm.Create(nil) do
    try
      FillFields;
      eOrderFieldName.Text := AOrderFieldName;
      eOrderFieldCaption.Text := AOrderFieldCaption;
      eOrderFieldValue.Text := AOrderFieldValue;
      eOrderFieldValueCaption.Text := AOrderFieldValueCaption;
      eTableName.Text := ATableName;
      eTableCaption.Text := ATableCaption;
      eFieldName.Text := AFieldName;
      eFieldCaption.Text := AFieldCaption;
      cbCondEqual.Checked := ACondEqual;
      cbCondNotEqual.Checked := ACondNotEqual;
      cbCanSetNull.Checked := ACanSetNull;
      cbCanSetValue.Checked := ACanSetValue;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AOrderFieldName := Trim(eOrderFieldName.Text);
        AOrderFieldCaption := Trim(eOrderFieldCaption.Text);
        AOrderFieldValue := eOrderFieldValue.Text;//может быть пробел
        AOrderFieldValueCaption := Trim(eOrderFieldValueCaption.Text);
        ATableName := Trim(eTableName.Text);
        ATableCaption := Trim(eTableCaption.Text);
        AFieldName := Trim(eFieldName.Text);
        AFieldCaption := Trim(eFieldCaption.Text);
        ACondEqual := cbCondEqual.Checked;
        ACondNotEqual := cbCondNotEqual.Checked;
        ACanSetNull := cbCanSetNull.Checked;
        ACanSetValue := cbCanSetValue.Checked;
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TNoticeOptionsActionParamsForm.SetOKEnabled;
begin
  bOK.Enabled := (Trim(eOrderFieldName.Text) <> '');
end;

procedure TNoticeOptionsActionParamsForm.FillFields;
begin
  eOrderFieldName.Properties.Items.Clear;
  try
    FillComboBoxExSQL(eOrderFieldName, 'SHOW COLUMNS FROM orderlist', 'field', '');
  except
  end;
end;

procedure TNoticeOptionsActionParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TNoticeOptionsActionParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TNoticeOptionsActionParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

end.