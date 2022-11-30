//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Инструмент ввода диапазона дат
//
//------------------------------------------------------------------------------
unit UDateRangeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  MonthEdit, 
  Menus, cxLookAndFeelPainters, cxButtons, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, dxSkinsCore,
  dxSkinsDefaultPainters;

type
  TDateRangeForm = class(TForm)
    pBottom: TPanel;
    eDate: TcxDateEdit;
    eDate1: TcxDateEdit;
    Label1: TcxLabel;
    Label2: TcxLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    procedure eChange(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure eDateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function EditDateRange(var ADate1, ADate2 : String; ACaption : string = 'Ввод даты'; AHelpContext : integer = 0) : boolean;

implementation

{$R *.dfm}

uses
  UUtil, DTKUtils;

function EditDateRange(var ADate1, ADate2 : String; ACaption : string = 'Ввод даты'; AHelpContext : integer = 0) : boolean;
begin
  with TDateRangeForm.Create(nil) do
    try
      HelpContext := AHelpContext;
      Caption := ACaption;
      eDate.Text := ADate1;
      eDate1.Text := ADate2;
      Result := ShowModal = mrOK;
      if Result then
        ADate1 := eDate.Text;
        ADate2 := eDate1.Text;
    finally
      Free;
    end;
end;

procedure TDateRangeForm.bOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TDateRangeForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDateRangeForm.eDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDateRangeForm.SetOKEnabled;
begin
  bOK.Enabled :=
    IsDate(eDate.Text) And IsDate(eDate1.Text) And (eDate.Date < eDate1.Date);
end;

end.
