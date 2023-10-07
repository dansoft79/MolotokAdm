//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры статуса контроля качества
//
//------------------------------------------------------------------------------
unit UGStatusTypeQCParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, cxSpinEdit, dxCore, dxColorEdit,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxDBLookupComboBox, dxmdaset;

type
  TGStatusTypeQCParamForm = class(TForm)
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
    cxLabel4: TcxLabel;
    eStatusOrder: TcxSpinEdit;
    eColor: TdxColorEdit;
    cbEnd: TcxCheckBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mMasterNotifyTextPropertiesChange(Sender: TObject);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetStatusTypeQCParams(
  var AActive : integer;
  var AName : string;
  var AColor, AOrder, ADef, AFin, AEnd : integer;
  var AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, mesdlg;

function GetStatusTypeQCParams(
  var AActive : integer;
  var AName : string;
  var AColor, AOrder, ADef, AFin, AEnd : integer;
  var AComment : string) : boolean;
begin
  with TGStatusTypeQCParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      cbDef.Checked := ADef = 1;
      cbFin.Checked := AFin = 1;
      cbEnd.Checked := AEnd = 1;

      eName.Text := AName;
      eStatusOrder.Value := AOrder;
      eColor.EditValue := AColor;

      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        ADef := BooleanToInt(cbDef.Checked);
        AFin := BooleanToInt(cbFin.Checked);
        AEnd := BooleanToInt(cbEnd.Checked);

        AName := Trim(eName.Text);
        AOrder := eStatusOrder.Value;
        AColor := eColor.EditValue;
        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGStatusTypeQCParamForm.bOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TGStatusTypeQCParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGStatusTypeQCParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '');
end;

procedure TGStatusTypeQCParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGStatusTypeQCParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGStatusTypeQCParamForm.mMasterNotifyTextPropertiesChange(
  Sender: TObject);
begin
  SetOKENabled;
end;

end.
