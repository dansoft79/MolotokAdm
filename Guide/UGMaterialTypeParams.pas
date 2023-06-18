//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры материала
//
//------------------------------------------------------------------------------
unit UGMaterialTypeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, dxCore, dxColorEdit, cxCalc;

type
  TGMaterialTypeParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    eCode: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel10: TcxLabel;
    cbCategory: TcxComboBox;
    cxLabel4: TcxLabel;
    cbUnit: TcxComboBox;
    cxLabel5: TcxLabel;
    eAmount: TcxCalcEdit;
    cxLabel6: TcxLabel;
    ePrice: TcxCalcEdit;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetMaterialTypeParams(
  var AActive : integer;
  var ACode, ACategory, AName, AUnit : string;
  var AAmount, APrice : double;
  var AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, math;

function GetMaterialTypeParams(
  var AActive : integer;
  var ACode, ACategory, AName, AUnit : string;
  var AAmount, APrice : double;
  var AComment : string) : boolean;
begin
  with TGMaterialTypeParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      eCode.Text := ACode;

      FillComboBoxExSQL(cbCategory, 'select distinct Category from MaterialType where deleted = 0', 'Category', '');
      cbCategory.Text := ACategory;
      eName.Text := AName;

      eAmount.Value := AAmount;
      ePrice.Value := APrice;

      cbUnit.Text := AUnit;
      FillComboBoxExSQL(cbUnit, 'select distinct Unit from MaterialType where deleted = 0', 'Unit', '');

      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        ACode := eCode.Text;
        ACategory := cbCategory.Text;
        AName := eName.Text;

        AAmount := RoundTo(eAmount.Value, -6);
        AUnit := cbUnit.Text;
        APrice := RoundTo(ePrice.Value, -2);

        AComment := eComment.Text;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGMaterialTypeParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGMaterialTypeParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (Trim(cbUnit.Text) <> '') and
    (eAmount.Value >= 0) and
    (ePrice.Value >= 0);
end;

procedure TGMaterialTypeParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGMaterialTypeParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
