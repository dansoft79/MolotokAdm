//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры источника заявок
//
//------------------------------------------------------------------------------
unit UGSourceTypeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, dxCore, dxColorEdit;

type
  TGSourceTypeParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    cbColor: TcxLabel;
    cbDef: TcxCheckBox;
    eColor: TdxColorEdit;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetSourceTypeParams(
  var AActive : integer;
  var AName : string;
  var AColor, ADef : integer;
  var AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetSourceTypeParams(
  var AActive : integer;
  var AName : string;
  var AColor, ADef : integer;
  var AComment : string) : boolean;
begin
  with TGSourceTypeParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      cbDef.Checked := ADef = 1;
      eName.Text := AName;
      eColor.EditValue := AColor;
      eComment.Text := AComment;

      eColor.OnKeyDown := eKeyDown;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        ADef := BooleanToInt(cbDef.Checked);
        AName := eName.Text;
        AColor := eColor.EditValue;
        AComment := eComment.Text;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGSourceTypeParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGSourceTypeParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '');
end;

procedure TGSourceTypeParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGSourceTypeParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
