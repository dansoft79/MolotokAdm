//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры статуса заявок
//
//------------------------------------------------------------------------------
unit UGStatusTypeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, cxSpinEdit, dxCore, dxColorEdit;

type
  TGStatusTypeParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    cbColor: TcxLabel;
    cbDef: TcxCheckBox;
    cbFin: TcxCheckBox;
    eNamePublic: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    eStatusOrder: TcxSpinEdit;
    cbWorkerVisible: TcxCheckBox;
    cbWorkerSetup: TcxCheckBox;
    eColor: TdxColorEdit;
    cbTrimTime: TcxCheckBox;
    cbShowCancelButton: TcxCheckBox;
    cbShowPayButton: TcxCheckBox;
    cbShowWarrantyButton: TcxCheckBox;
    cbNeedCall: TcxCheckBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetStatusTypeParams(
  var AActive : integer;
  var AName, ANamePublic : string;
  var AColor, AOrder, ADef, AFin, AWorkerVisible, AWorkerSetup : integer;
  var ATrimTime, AShowCancelButton, AShowPayButton, AShowWarrantyButton : integer;
  var ANeedCall : integer;
  var AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetStatusTypeParams(
  var AActive : integer;
  var AName, ANamePublic : string;
  var AColor, AOrder, ADef, AFin, AWorkerVisible, AWorkerSetup : integer;
  var ATrimTime, AShowCancelButton, AShowPayButton, AShowWarrantyButton : integer;
  var ANeedCall : integer;
  var AComment : string) : boolean;
begin
  with TGStatusTypeParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      cbDef.Checked := ADef = 1;
      cbFin.Checked := AFin = 1;
      cbWorkerVisible.Checked := AWorkerVisible = 1;
      cbWorkerSetup.Checked := AWorkerSetup = 1;

      eName.Text := AName;
      eNamePublic.Text := ANamePublic;
      eStatusOrder.Value := AOrder;
      eColor.EditValue := AColor;

      cbTrimTime.Checked := ATrimTime = 1;
      cbShowCancelButton.Checked := AShowCancelButton = 1;
      cbShowPayButton.Checked := AShowPayButton = 1;
      cbShowWarrantyButton.Checked := AShowWarrantyButton = 1;

      cbNeedCall.Checked := ANeedCall = 1;

      eComment.Text := AComment;

      eColor.OnKeyDown := eKeyDown;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        ADef := BooleanToInt(cbDef.Checked);
        AFin := BooleanToInt(cbFin.Checked);
        AWorkerVisible := BooleanToInt(cbWorkerVisible.Checked);
        AWorkerSetup := BooleanToInt(cbWorkerSetup.Checked);

        ATrimTime := BooleanToInt(cbTrimTime.Checked);
        AShowCancelButton := BooleanToInt(cbShowCancelButton.Checked);
        AShowPayButton := BooleanToInt(cbShowPayButton.Checked);
        AShowWarrantyButton := BooleanToInt(cbShowWarrantyButton.Checked);

        ANeedCall := BooleanToInt(cbNeedCall.Checked);

        AName := Trim(eName.Text);
        ANamePublic := Trim(eNamePublic.Text);
        AOrder := eStatusOrder.Value;
        AColor := eColor.EditValue;
        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGStatusTypeParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGStatusTypeParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (Trim(eNamePublic.Text) <> '');
end;

procedure TGStatusTypeParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGStatusTypeParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
