//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры статуса лидов
//
//------------------------------------------------------------------------------
unit UGStatusTypeLeadParams;

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
  TGStatusTypeLeadParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    cbDef: TcxCheckBox;
    cbFin: TcxCheckBox;
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

function GetStatusTypeLeadParams(
  var AActive : integer;
  var AName : string;
  var ADef, AFin : integer;
  var AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, mesdlg;

function GetStatusTypeLeadParams(
  var AActive : integer;
  var AName : string;
  var ADef, AFin : integer;
  var AComment : string) : boolean;
begin
  with TGStatusTypeLeadParamForm.Create(nil) do
    try

//      cbActive.Checked := AActive = 1;
      cbDef.Checked := ADef = 1;
      cbFin.Checked := AFin = 1;
      eName.Text := AName;
      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        ADef := BooleanToInt(cbDef.Checked);
        AFin := BooleanToInt(cbFin.Checked);
        AName := Trim(eName.Text);
        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGStatusTypeLeadParamForm.bOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TGStatusTypeLeadParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGStatusTypeLeadParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '');
end;

procedure TGStatusTypeLeadParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGStatusTypeLeadParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGStatusTypeLeadParamForm.mMasterNotifyTextPropertiesChange(
  Sender: TObject);
begin
  SetOKENabled;
end;

end.
