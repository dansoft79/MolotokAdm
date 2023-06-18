//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры формы оплаты
//
//------------------------------------------------------------------------------
unit UGPaymentFormParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox;

type
  TGPaymentFormParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cbDef: TcxCheckBox;
    cbShowOnClient: TcxCheckBox;
    cbShowClientButton: TcxCheckBox;
    cbShowOnMaster: TcxCheckBox;
    cxLabel1: TcxLabel;
    cbPayStatus: TcxComboBox;
    cxLabel4: TcxLabel;
    cbWorkerAppPayButton: TcxComboBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetPaymentFormParams(
  var AActive, ADefForm : integer;
  var AName, AComment : string;
  var AShowOnClient, AShowOnMaster, AShowClientButton : integer;
  var APayStatus, AWorkerAppPayButton : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetPaymentFormParams(
  var AActive, ADefForm : integer;
  var AName, AComment : string;
  var AShowOnClient, AShowOnMaster, AShowClientButton : integer;
  var APayStatus, AWorkerAppPayButton : integer) : boolean;
begin
  with TGPaymentFormParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      cbDef.Checked := ADefForm = 1;
      cbShowOnClient.Checked := AShowOnClient = 1;
      cbShowOnMaster.Checked := AShowOnMaster = 1;
      cbShowClientButton.Checked := AShowClientButton = 1;

      eName.Text := AName;
      eComment.Text := AComment;

      cbPayStatus.ItemIndex := APayStatus;
      cbWorkerAppPayButton.ItemIndex := AWorkerAppPayButton;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        ADefForm := BooleanToInt(cbDef.Checked);
        AShowOnClient := BooleanToInt(cbShowOnClient.Checked);
        AShowOnMaster  := BooleanToInt(cbShowOnMaster.Checked);
        AShowClientButton := BooleanToInt(cbShowClientButton.Checked);

        AName := eName.Text;
        AComment := eComment.Text;

        APayStatus := cbPayStatus.ItemIndex;
        AWorkerAppPayButton := cbWorkerAppPayButton.ItemIndex;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGPaymentFormParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGPaymentFormParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (cbPayStatus.ItemIndex <> -1) and
    (cbWorkerAppPayButton.ItemIndex <> -1);
end;

procedure TGPaymentFormParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGPaymentFormParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
