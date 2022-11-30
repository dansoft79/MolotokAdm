//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно ввода диапазона в месяцах 
//
//------------------------------------------------------------------------------
unit UMonthRangeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  MonthEdit, cxSpinEdit,
  cxSpinButton, cxTextEdit, cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel,
  Menus, cxLookAndFeelPainters, cxButtons, dxSkinsCore, dxSkinsDefaultPainters;

type
  TWorkMonthRangeForm = class(TForm)
    pBottom: TPanel;
    cxLabel1: TcxLabel;
    eMonthFrom: TcxMaskEdit;
    SpinButtonFrom: TcxSpinButton;
    cxLabel2: TcxLabel;
    eMonthTo: TcxMaskEdit;
    SpinButtonTo: TcxSpinButton;
    bOK: TcxButton;
    bCancel: TcxButton;
    procedure eChange(Sender: TObject);
    procedure cxMaskEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eMonthKeyPress(Sender: TObject; var Key: Char);
    procedure SpinButtonPropertiesChange(Sender: TObject);
    procedure eMonthToPropertiesChange(Sender: TObject);
    procedure eMonthFromPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function EditMonthRange(var AMonthFrom, AMonthTo : string; ACaption : string = 'Ввод месяца'; AHelpContext : integer = 0) : boolean;

implementation

{$R *.dfm}

uses
  UUtil, DTKUtils;

function EditMonthRange(var AMonthFrom, AMonthTo : string; ACaption : string = 'Ввод месяца'; AHelpContext : integer = 0) : boolean;
  var
    s : string;
begin
  with TWorkMonthRangeForm.Create(nil) do
    try
      HelpContext := AHelpContext;
      Caption := ACaption;

      eMonthFrom.Text := AmonthFrom;
      s := AmonthFrom;
      s := StringReplace(s, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
      s := StringReplace(s, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
      if IsWorkMonth(s) then SpinButtonFrom.Value := StrToFloat(s)
      else SpinButtonFrom.Value := GetWorkMonth(Date);

      eMonthTo.Text := AmonthTo;
      s := AmonthTo;
      s := StringReplace(s, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
      s := StringReplace(s, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
      if IsWorkMonth(s) then SpinButtonTo.Value := StrToFloat(s)
      else SpinButtonTo.Value := GetWorkMonth(Date);

      Result := ShowModal = mrOK;

      if Result then
        AMonthFrom := eMonthFrom.Text;
        AMonthTo := eMonthTo.Text;
    finally
      Free;
    end;
end;

procedure TWorkMonthRangeForm.cxMaskEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    eMonth : TcxMaskEdit;
    SpinButton : TcxSpinButton;
    s : string;
begin
  //sebBackward, sebForward, sebFastBackward, sebFastForward
  if TComponent(Sender).Tag = 1 then
  begin
    eMonth := eMonthFrom;
    SpinButton := SpinButtonFrom;
  end
  else
  begin
    eMonth := eMonthTo;
    SpinButton := SpinButtonTo;
  end;

  if key = vk_Return then
    key := vk_Tab
  else
    if IsWorkMonth(eMonth.Text) then
    begin
      s := eMonth.Text;
      s := StringReplace(s, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
      s := StringReplace(s, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
      SpinButton.Value := StrToFloat(s);

      case key of
        vk_UP : SpinButton.Increment(sebForward);
        vk_DOWN : SpinButton.Increment(sebBackward);
        vk_NEXT : SpinButton.Increment(sebFastBackward);
        vk_PRIOR : SpinButton.Increment(sebFastForward);
      end;
    end;
end;

procedure TWorkMonthRangeForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TWorkMonthRangeForm.eMonthFromPropertiesChange(Sender: TObject);
  var
    s : string;
begin
  if IsWorkMonth(eMonthFrom.Text) then
  begin
    s := eMonthFrom.Text;
    s := StringReplace(s, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
    s := StringReplace(s, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
    SpinButtonFrom.Value := StrToFloat(s);
  end;
  SetOKEnabled;  
end;

procedure TWorkMonthRangeForm.eMonthKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = ',') or (key = '.') then key := '.';
end;

procedure TWorkMonthRangeForm.eMonthToPropertiesChange(Sender: TObject);
  var
    s : string;
begin
  if IsWorkMonth(eMonthTo.Text) then
  begin
    s := eMonthTo.Text;
    s := StringReplace(s, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
    s := StringReplace(s, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
    SpinButtonTo.Value := StrToFloat(s);
  end;
  SetOKEnabled;
end;

procedure TWorkMonthRangeForm.SetOKEnabled;
begin
  bOK.Enabled :=
    IsWorkMonth(eMonthFrom.Text) And IsWorkMonth(eMonthTo.Text) And (eMonthFrom.Text <= eMonthTo.Text);
end;

procedure TWorkMonthRangeForm.SpinButtonPropertiesChange(Sender: TObject);
  var
    d : double;
    SpinButton : TcxSpinButton;
    eMonth : TcxMaskEdit;
    s : string;
begin
  //sebBackward, sebForward, sebFastBackward, sebFastForward
  if TComponent(Sender).Tag = 1 then
  begin
    eMonth := eMonthFrom;
    SpinButton := SpinButtonFrom;
  end
  else
  begin
    eMonth := eMonthTo;
    SpinButton := SpinButtonTo;
  end;

  d := SpinButton.Value;
  if GetDoubleToHoundredth(frac(d)) > GetDoubleToHoundredth(0.12) then
    d := trunc(d) + 1.01
  else
    if GetDoubleToHoundredth(frac(d)) = GetDoubleToHoundredth(0) then
      d := trunc(d) - 1 + 0.12;
  SpinButton.Value := d;
  s := StringReplace(FloatToStrF(d, ffFixed, 18, 2), ',', '.', [rfReplaceAll]);
  s := AlignString(s, taRightJustify, '0', 7);
  eMonth.Text := s;
end;

end.
