//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно ввода месяца 
//
//------------------------------------------------------------------------------
unit UMonthParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  MonthEdit, Menus,
  cxLookAndFeelPainters, cxSpinEdit, cxSpinButton, cxTextEdit, cxMaskEdit,
  cxButtons, cxControls, cxContainer, cxEdit, cxLabel, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels;

type
  TWorkMonthForm = class(TForm)
    pBottom: TPanel;
    Label1: TcxLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eMonth: TcxMaskEdit;
    SpinButton: TcxSpinButton;
    procedure eChange(Sender: TObject);
    procedure SpinButtonPropertiesChange(Sender: TObject);
    procedure eMonthPropertiesChange(Sender: TObject);
    procedure eMonthKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bOKClick(Sender: TObject);
    procedure eMonthKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function EditMonth(var AMonth : string; ACaption : string = 'Ввод месяца'; AHelpContext : integer = 0) : boolean;

implementation

{$R *.dfm}

uses
  UUtil, DTKUtils;

function EditMonth(var AMonth : string; ACaption : string = 'Ввод месяца'; AHelpContext : integer = 0) : boolean;
  var
    s : string;
begin
  with TWorkMonthForm.Create(nil) do
    try
      HelpContext := AHelpContext;
      Caption := ACaption;
      eMonth.Text := Amonth;
      s := Amonth;
      s := StringReplace(s, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
      s := StringReplace(s, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
      if IsWorkMonth(s) then SpinButton.Value := StrToFloat(s)
      else SpinButton.Value := GetWorkMonth(Date);

      Result := ShowModal = mrOK;

      if Result then
        AMonth := eMonth.Text;
    finally
      Free;
    end;
end;

procedure TWorkMonthForm.eMonthKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    s : string;
begin
  //sebBackward, sebForward, sebFastBackward, sebFastForward
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

procedure TWorkMonthForm.eMonthKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = ',') or (key = '.') then key := '.';
end;

procedure TWorkMonthForm.eMonthPropertiesChange(Sender: TObject);
  var
    s : string;
begin
  if IsWorkMonth(eMonth.Text) then
  begin
    s := eMonth.Text;
    s := StringReplace(s, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
    s := StringReplace(s, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
    SpinButton.Value := StrToFloat(s);
  end;
  SetOKEnabled;
end;

procedure TWorkMonthForm.bOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TWorkMonthForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TWorkMonthForm.SetOKEnabled;
begin
  bOK.Enabled :=
    IsWorkMonth(eMonth.Text);
end;

procedure TWorkMonthForm.SpinButtonPropertiesChange(Sender: TObject);
  var
    d : double;
    s : string;
begin
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
