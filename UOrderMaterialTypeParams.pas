//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры вида материала для добавления в заявку
//
//------------------------------------------------------------------------------
unit UOrderMaterialTypeParams;

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
  TOrderListMaterialTypeParamsForm = class(TForm)
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

function GetOrderListMaterialTypeParams(
  var
    AName : string;
  var
    AAmount : double;
  var
    AUnit : string;
  var
    APrice : double;
    AIDMaterialType : integer
    ) : integer;

implementation

{$R *.dfm}

uses
  math,
  UDatas, DTKUtils, UConsts, UOptions, UUtil;

function GetOrderListMaterialTypeParams(
  var
    AName : string;
  var
    AAmount : double;
  var
    AUnit : string;
  var
    APrice : double;
    AIDMaterialType : integer
    ) : integer;
begin
  with TOrderListMaterialTypeParamsForm.Create(nil) do
    try
      FIDMaterialType := AIDMaterialType;

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

procedure TOrderListMaterialTypeParamsForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (eAmount.Value > 0) and
    (eUnit.Text <> '') and
    (ePrice.Value > 0);
end;

procedure TOrderListMaterialTypeParamsForm.UpdateEnabled;
begin
  eName.Enabled := FIDMaterialType = 0;
  eAmount.Enabled := true;
  eUnit.Enabled := FIDMaterialType = 0;
  ePrice.Enabled := FIDMaterialType = 0;
end;

procedure TOrderListMaterialTypeParamsForm.FillUnit;
begin
  FillComboBoxExSQL(eUnit, 'select distinct Unit from MaterialType order by Unit', 'Unit', '');
end;

procedure TOrderListMaterialTypeParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderListMaterialTypeParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TOrderListMaterialTypeParamsForm.cbWorkerClassPropertiesChange(Sender: TObject);
begin
  SetOKEnabled
end;

procedure TOrderListMaterialTypeParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
