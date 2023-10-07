//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры отпуска/отгула/рабочих дней
//
//------------------------------------------------------------------------------
unit UGWorkRestDayParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxSpinEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTimeEdit, cxCalendar;

type
  TGWorkRestDayParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cbActive: TcxCheckBox;
    cxLabel12: TcxLabel;
    eFromDate: TcxDateEdit;
    cxLabel13: TcxLabel;
    eToDate: TcxDateEdit;
    cxLabel14: TcxLabel;
    f0: TcxTimeEdit;
    cxLabel15: TcxLabel;
    t0: TcxTimeEdit;
    d0: TcxCheckBox;
    cxLabel1: TcxLabel;
    cbDateType: TcxComboBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eCommentPropertiesChange(Sender: TObject);
    procedure cbDateTypePropertiesChange(Sender: TObject);
    procedure d0PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetWorkRestDayParams(
  var AActive, ADateType : integer;
  var AFromDate, AToDate, AWorkTime, AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  DTKUtils, UDatas, UUtil, UConsts, StrUtils;

function GetWorkRestDayParams(
  var AActive, ADateType : integer;
  var AFromDate, AToDate, AWorkTime, AComment : string) : boolean;
  procedure SetFT(ATime : string; ACB : TcxCheckBox; AFrom, ATo : TcxTimeEdit);
  begin
    ACB.Checked := ATime <> '';
    if ACB.Checked then
    begin
      AFrom.Text := Copy(ATime, 1, Pos('-', ATime) - 1);
      ATo.Text := RightStr(ATime, Length(ATime) - Length(AFrom.Text) - 1);
    end
    else
    begin
      AFrom.Text := '';
      ATo.Text := '';
    end;
  end;
  procedure SetEnabledTime(ACB : TcxCheckBox; AFrom, ATo : TcxTimeEdit);
  begin
    AFrom.Enabled := ACB.Checked;
    ATo.Enabled := ACB.Checked;
  end;
  procedure GetFT(var ATime : string; ACB : TcxCheckBox; AFrom, ATo : TcxTimeEdit);
  begin
    if ACB.Checked then
    begin
      ATime := AFrom.Text + '-' + ATo.Text;
    end
    else ATime := '';
  end;
begin
  with TGWorkRestDayParamForm.Create(nil) do
    try
      cbActive.Checked := AActive = 1;

      cbDateType.ItemIndex := ADateType - 1;
      eFromDate.Text := AFromDate;
      eToDate.Text := AToDate;

      SetFT(AWorkTime, d0, f0, t0);
      SetEnabledTime(d0, f0, t0);

      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AActive := BooleanToInt(cbActive.Checked);

        ADateType := cbDateType.ItemIndex + 1;

        AFromDate := eFromDate.Text;
        AToDate := eToDate.Text;

        GetFT(AWorkTime, d0, f0, t0);

        AComment := eComment.Text;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGWorkRestDayParamForm.cbDateTypePropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkRestDayParamForm.d0PropertiesChange(Sender: TObject);
  var
    vCheckBox : TcxCheckBox;
    vFromTime : TcxTimeEdit;
    vToTime : TcxTimeEdit;
begin
  vCheckBox := TcxCheckBox(Sender);
  vFromTime := TcxTimeEdit(FindComponent('f' + IntToStr(vCheckBox.Tag)));
  vToTime := TcxTimeEdit(FindComponent('t' + IntToStr(vCheckBox.Tag)));

  if vFromTime.Enabled and vToTime.Enabled then
  if vCheckBox.Checked then
  begin
    vFromTime.Text := Copy(WorkTime, 1, 5);
    vToTime.Text := Copy(WorkTime, 7, 5);
  end
  else
  begin
    vFromTime.Text := '00:00';
    vToTime.Text := '00:00';
  end;

  vFromTime.Enabled := vCheckBox.Checked;
  vToTime.Enabled := vCheckBox.Checked;

  SetOKEnabled;
end;

procedure TGWorkRestDayParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;

  if True then

end;

procedure TGWorkRestDayParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (not d0.Checked or (f0.Time <= t0.Time)) and
    IsDate(eFromDate.Text) and
    IsDate(eToDate.Text) and
    (eFromDate.Date >= Date) and
    (eToDate.Date >= Date) and
    (eFromDate.Date <= eToDate.Date);


  if cbDateType.ItemIndex in [0, 1] then d0.Checked := false;

end;

procedure TGWorkRestDayParamForm.eCommentPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkRestDayParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGWorkRestDayParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
