//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры вида работ для добавления в заявку
//
//------------------------------------------------------------------------------
unit UOrderWorkTypeParams;

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
  TOrderListWorkTypeParamsForm = class(TForm)
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
    cbWorkerClass: TcxComboBox;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    eNorm: TcxSpinEdit;
    bDel: TcxButton;
    cxLabel12: TcxLabel;
    eWarrantyTime: TcxSpinEdit;
    cbWarrantyType: TcxComboBox;
    cxLabel11: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbWorkerClassPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FIDWorkType : integer;
    procedure FillUnit;
    procedure FillWorkerClass;
  public
    { Public declarations }
    procedure UpdateEnabled;
    procedure SetOKEnabled;
  end;

function GetOrderListWorkTypeParams(
  var
    AIDWorkerClass : integer;
  var
    AName : string;
  var
    AAmount : double;
  var
    AUnit : string;
  var
    APrice, ANorm : double;
  var
    AWarrantyType, AWarrantyTime : integer;
    AIDWorkType : integer
    ) : integer;

implementation

{$R *.dfm}

uses
  math,
  UDatas, DTKUtils, UConsts, UOptions, UUtil;

function GetOrderListWorkTypeParams(
  var
    AIDWorkerClass : integer;
  var
    AName : string;
  var
    AAmount : double;
  var
    AUnit : string;
  var
    APrice, ANorm : double;
  var
    AWarrantyType, AWarrantyTime : integer;
    AIDWorkType : integer
    ) : integer;
begin
  with TOrderListWorkTypeParamsForm.Create(nil) do
    try
      FIDWorkType := AIDWorkType;

      FillWorkerClass;
      SetItemIndexByID(cbWorkerClass, AIDWorkerClass);

      eName.Text := AName;

      eAmount.Value := AAmount;

      FillUnit;
      eUnit.Text := AUnit;

      ePrice.Value := APrice;

      eNorm.Value := ANorm;

      cbWarrantyType.ItemIndex := AWarrantyType;

      eWarrantyTime.Value := AWarrantyTime;

      UpdateEnabled;

      Result := ShowModal;

      if Result = mrOK then
      begin
        AIDWorkerClass := GetIDByItemIndex(cbWorkerClass);

        AName := Trim(eName.Text);

        AAmount := eAmount.Value;

        AUnit := Trim(eUnit.Text);

        APrice := ePrice.Value;

        ANorm := eNorm.Value;

        AWarrantyType := cbWarrantyType.ItemIndex;

        AWarrantyTime := eWarrantyTime.Value;
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TOrderListWorkTypeParamsForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbWorkerClass.ItemIndex <> -1) and
    (Trim(eName.Text) <> '') and
    (eAmount.Value > 0) and
    (eUnit.Text <> '') and
    (ePrice.Value > 0) and
    (eNorm.Value > 0);
end;

procedure TOrderListWorkTypeParamsForm.UpdateEnabled;
begin
  cbWorkerClass.Enabled := FIDWorkType = 0;
  eName.Enabled := FIDWorkType = 0;
  eAmount.Enabled := true;
  eUnit.Enabled := FIDWorkType = 0;
  ePrice.Enabled := FIDWorkType = 0;
  eNorm.Enabled := FIDWorkType = 0;
end;

procedure TOrderListWorkTypeParamsForm.FillUnit;
begin
  FillComboBoxExSQL(eUnit, 'select distinct UnitName from WorkType order by UnitName', 'UnitName', '');
end;

procedure TOrderListWorkTypeParamsForm.FillWorkerClass;
begin
  FillComboBoxExSQL(cbWorkerClass, 'select Concat(Tag, '' - '', Name) as Name, ID from WorkerClass order by Name', 'Name', 'ID');
end;

procedure TOrderListWorkTypeParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderListWorkTypeParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TOrderListWorkTypeParamsForm.cbWorkerClassPropertiesChange(Sender: TObject);
begin
  SetOKEnabled
end;

procedure TOrderListWorkTypeParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
