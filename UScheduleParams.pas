//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры расписания
//
//------------------------------------------------------------------------------
unit UScheduleParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, Vcl.CheckLst, cxSpinEdit, cxTimeEdit;

type
  TScheduleParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    f1: TcxTimeEdit;
    t1: TcxTimeEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    f2: TcxTimeEdit;
    t2: TcxTimeEdit;
    cxLabel6: TcxLabel;
    t3: TcxTimeEdit;
    cxLabel7: TcxLabel;
    f3: TcxTimeEdit;
    t4: TcxTimeEdit;
    cxLabel8: TcxLabel;
    f4: TcxTimeEdit;
    t5: TcxTimeEdit;
    cxLabel9: TcxLabel;
    f5: TcxTimeEdit;
    t6: TcxTimeEdit;
    cxLabel10: TcxLabel;
    f6: TcxTimeEdit;
    t7: TcxTimeEdit;
    cxLabel11: TcxLabel;
    f7: TcxTimeEdit;
    d1: TcxCheckBox;
    d2: TcxCheckBox;
    d3: TcxCheckBox;
    d4: TcxCheckBox;
    d5: TcxCheckBox;
    d6: TcxCheckBox;
    d7: TcxCheckBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetScheduleParams(
  var ADay1, ADay2, ADay3, ADay4, ADay5, ADay6, ADay7, AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, StrUtils;

function GetScheduleParams(
  var ADay1, ADay2, ADay3, ADay4, ADay5, ADay6, ADay7, AComment : string) : boolean;
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
  with TScheduleParamForm.Create(nil) do
    try
      SetFT(ADay1, d1, f1, t1);
      SetFT(ADay2, d2, f2, t2);
      SetFT(ADay3, d3, f3, t3);
      SetFT(ADay4, d4, f4, t4);
      SetFT(ADay5, d5, f5, t5);
      SetFT(ADay6, d6, f6, t6);
      SetFT(ADay7, d7, f7, t7);

      SetEnabledTime(d1, f1, t1);
      SetEnabledTime(d2, f2, t2);
      SetEnabledTime(d3, f3, t3);
      SetEnabledTime(d4, f4, t4);
      SetEnabledTime(d5, f5, t5);
      SetEnabledTime(d6, f6, t6);
      SetEnabledTime(d7, f7, t7);

      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin

        GetFT(ADay1, d1, f1, t1);
        GetFT(ADay2, d2, f2, t2);
        GetFT(ADay3, d3, f3, t3);
        GetFT(ADay4, d4, f4, t4);
        GetFT(ADay5, d5, f5, t5);
        GetFT(ADay6, d6, f6, t6);
        GetFT(ADay7, d7, f7, t7);

        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TScheduleParamForm.cbPropertiesChange(Sender: TObject);
  var
    vCheckBox : TcxCheckBox;
    vFromTime : TcxTimeEdit;
    vToTime : TcxTimeEdit;
begin
  vCheckBox := TcxCheckBox(Sender);
  vFromTime := TcxTimeEdit(FindComponent('f' + IntToStr(vCheckBox.Tag)));
  vToTime := TcxTimeEdit(FindComponent('t' + IntToStr(vCheckBox.Tag)));

  vFromTime.Enabled := vCheckBox.Checked;
  vToTime.Enabled := vCheckBox.Checked;

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

  SetOKEnabled;
end;

procedure TScheduleParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TScheduleParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (not d1.Checked or (f1.Time <= t1.Time)) and
    (not d2.Checked or (f2.Time <= t2.Time)) and
    (not d3.Checked or (f3.Time <= t3.Time)) and
    (not d4.Checked or (f4.Time <= t4.Time)) and
    (not d5.Checked or (f5.Time <= t5.Time)) and
    (not d6.Checked or (f6.Time <= t6.Time)) and
    (not d7.Checked or (f7.Time <= t7.Time));
end;

procedure TScheduleParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TScheduleParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
