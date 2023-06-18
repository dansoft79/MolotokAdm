//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры вида материала справочника для добавления в заявку
//
//------------------------------------------------------------------------------
unit UOrderMaterialTypeGuideParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  Menus,
  cxLookAndFeelPainters, cxLabel, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxImage, cxCheckBox, cxMemo, cxRichEdit, cxColorComboBox, cxCalc,
  cxSpinEdit;

type
  TOrderListMaterialTypeGuideParamsForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    ePrice: TcxCalcEdit;
    cxLabel6: TcxLabel;
    eAmount: TcxCalcEdit;
    eUnit: TcxComboBox;
    bDel: TcxButton;
    eCode: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel10: TcxLabel;
    eComment: TcxMemo;
    cxLabel4: TcxLabel;
    eCategory: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbWorkerClassPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FIDMaterialType : integer;
    procedure FillUnit;
  public
    { Public declarations }
    procedure UpdateEnabled;
    procedure SetOKEnabled;
  end;

function GetOrderListMaterialTypeGuideParams(
  var
    ACategory, ACode, AName : string;
  var
    AAmount : double;
  var
    AUnit : string;
  var
    APrice : double;
  var
    AComment : string;
    AIDMaterialType : integer
    ) : integer;

implementation

{$R *.dfm}

uses
  math,
  UDatas, DTKUtils, UConsts, UOptions, UUtil;

function GetOrderListMaterialTypeGuideParams(
  var
    ACategory, ACode, AName : string;
  var
    AAmount : double;
  var
    AUnit : string;
  var
    APrice : double;
  var
    AComment : string;
    AIDMaterialType : integer
    ) : integer;
begin
  with TOrderListMaterialTypeGuideParamsForm.Create(nil) do
    try
      FIDMaterialType := AIDMaterialType;

      eCode.Text := ACode;
      eCategory.Text := ACategory;
      eComment.Text := AComment;

      eName.Text := AName;

      eAmount.Value := AAmount;

      FillUnit;
      eUnit.Text := AUnit;

      ePrice.Value := APrice;

      UpdateEnabled;

      Result := ShowModal;

      if Result = mrOK then
      begin
        AName := Trim(eName.Text);

        AAmount := eAmount.Value;

        AUnit := Trim(eUnit.Text);

        APrice := ePrice.Value;
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TOrderListMaterialTypeGuideParamsForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (eAmount.Value > 0) and
    (eUnit.Text <> '') and
    (ePrice.Value > 0);
end;

procedure TOrderListMaterialTypeGuideParamsForm.UpdateEnabled;
begin
  eName.Enabled := FIDMaterialType = 0;
  eAmount.Enabled := true;
  eUnit.Enabled := FIDMaterialType = 0;
  ePrice.Enabled := FIDMaterialType = 0;

  eCode.Enabled := FIDMaterialType = 0;
  eComment.Enabled := FIDMaterialType = 0;
  eCategory.Enabled := FIDMaterialType = 0;
end;

procedure TOrderListMaterialTypeGuideParamsForm.FillUnit;
begin
  FillComboBoxExSQL(eUnit, 'select distinct Unit from MaterialType order by Unit', 'Unit', '');
end;

procedure TOrderListMaterialTypeGuideParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderListMaterialTypeGuideParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TOrderListMaterialTypeGuideParamsForm.cbWorkerClassPropertiesChange(Sender: TObject);
begin
  SetOKEnabled
end;

procedure TOrderListMaterialTypeGuideParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
