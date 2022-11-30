//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры района
//
//------------------------------------------------------------------------------
unit UGDistrictParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox;

type
  TGDistrictParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    eTag: TcxMaskEdit;
    cxLabel5: TcxLabel;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetDistrictParams(
  var AActive : integer;
  var AName, ATag, AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetDistrictParams(
  var AActive : integer;
  var AName, ATag, AComment : string) : boolean;
begin
  with TGDistrictParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      eName.Text := AName;
      eTag.Text := ATag;
      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AName := eName.Text;
        ATag := eTag.Text;
        AComment := eComment.Text;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGDistrictParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGDistrictParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (Trim(eTag.Text) <> '');
end;

procedure TGDistrictParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGDistrictParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
