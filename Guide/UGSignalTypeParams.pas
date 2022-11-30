//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры сигнального состояния
//
//------------------------------------------------------------------------------
unit UGSignalTypeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, dxCore, dxColorEdit;

type
  TGSignalTypeParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    cbColor: TcxLabel;
    cbDef: TcxCheckBox;
    eCode: TcxTextEdit;
    cxLabel2: TcxLabel;
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

function GetSignalTypeParams(
  var AActive : integer;
  var AName, ACode : string;
  var AColor, ADef : integer;
  var AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetSignalTypeParams(
  var AActive : integer;
  var AName, ACode : string;
  var AColor, ADef : integer;
  var AComment : string) : boolean;
begin
  with TGSignalTypeParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      cbDef.Checked := ADef = 1;
      eName.Text := AName;
      eCode.Text := ACode;
      eColor.EditValue := AColor;
      eComment.Text := AComment;

      eColor.OnKeyDown := eKeyDown;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        ADef := BooleanToInt(cbDef.Checked);
        AName := eName.Text;
        ACode := eCode.Text;
        AColor := eColor.EditValue;
        AComment := eComment.Text;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGSignalTypeParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGSignalTypeParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '');
end;

procedure TGSignalTypeParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGSignalTypeParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
