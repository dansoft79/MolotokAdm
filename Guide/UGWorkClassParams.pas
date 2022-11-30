//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры типа работ
//
//------------------------------------------------------------------------------
unit UGWorkClassParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox;

type
  TGWorkClassParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    eNamePublic: TcxTextEdit;
    cxLabel1: TcxLabel;
    eDescription: TcxMemo;
    cxLabel4: TcxLabel;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eNameExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetWorkClassParams(
  var AActive : integer;
  var AName, ANamePublic, ADescription, AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetWorkClassParams(
  var AActive : integer;
  var AName, ANamePublic, ADescription, AComment : string) : boolean;
begin
  with TGWorkClassParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      eName.Text := AName;
      eNamePublic.Text := ANamePublic;
      eDescription.Text := ADescription;
      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AName := Trim(eName.Text);
        ANamePublic := Trim(eNamePublic.Text);
        ADescription := Trim(eDescription.Text);
        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGWorkClassParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkClassParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (Trim(eNamePublic.Text) <> '');
end;

procedure TGWorkClassParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGWorkClassParamForm.eNameExit(Sender: TObject);
begin
  if eNamePublic.Text = '' then eNamePublic.Text := eName.Text;

end;

procedure TGWorkClassParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
