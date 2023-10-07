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
  cxDropDownEdit, cxCheckBox, cxColorComboBox, cxSpinEdit, dxCore, dxColorEdit,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxDBLookupComboBox, dxmdaset;

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
    cbMasterNotify: TcxCheckBox;
    mMasterNotifyText: TcxMemo;
    lMasterNotifyText: TcxLabel;
    cxLabel5: TcxLabel;
    qList: TZQuery;
    dsList: TDataSource;
    eCode: TcxDBLookupComboBox;
    mdHandler: TdxMemData;
    mdHandlerHandler: TStringField;
    dsHandler: TDataSource;
    cbFinCancel: TcxCheckBox;
    cbQualityCOntrol: TcxCheckBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mMasterNotifyTextPropertiesChange(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure cbFinCancelPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
    function ClearPushText : string;
  end;

function GetStatusTypeParams(
  var AActive : integer;
  var AName, ANamePublic : string;
  var AColor, AOrder, ADef, AFin, AFinCancel, AWorkerVisible, AWorkerSetup : integer;
  var ATrimTime, AShowCancelButton, AShowPayButton, AShowWarrantyButton : integer;
  var ANeedCall, AQualityControl, AMasterNotify : integer;
  var AMasterNotifyText, AComment, ACode : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, mesdlg;

function GetStatusTypeParams(
  var AActive : integer;
  var AName, ANamePublic : string;
  var AColor, AOrder, ADef, AFin, AFinCancel, AWorkerVisible, AWorkerSetup : integer;
  var ATrimTime, AShowCancelButton, AShowPayButton, AShowWarrantyButton : integer;
  var ANeedCall, AQualityControl, AMasterNotify : integer;
  var AMasterNotifyText, AComment, ACode : string) : boolean;
begin
  with TGStatusTypeParamForm.Create(nil) do
    try
      qList.Open;
      mdHandler.Open;
      mdHandler.Append;
      mdHandler.FieldBYName('Handler').AsString := ACode;

//      cbActive.Checked := AActive = 1;
      cbDef.Checked := ADef = 1;
      cbFin.Checked := AFin = 1;
      cbFinCancel.Checked := AFinCancel = 1;
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
      cbQualityControl.Checked := AQualityControl = 1;

      cbMasterNotify.Checked := AMasterNotify = 1;
      mMasterNotifyText.Text := AMasterNotifyText;

      eComment.Text := AComment;

      eColor.OnKeyDown := eKeyDown;

//      eCode.Text := ACode;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        ADef := BooleanToInt(cbDef.Checked);
        AFin := BooleanToInt(cbFin.Checked);
        AFinCancel := BooleanToInt(cbFinCancel.Checked);
        AWorkerVisible := BooleanToInt(cbWorkerVisible.Checked);
        AWorkerSetup := BooleanToInt(cbWorkerSetup.Checked);

        ATrimTime := BooleanToInt(cbTrimTime.Checked);
        AShowCancelButton := BooleanToInt(cbShowCancelButton.Checked);
        AShowPayButton := BooleanToInt(cbShowPayButton.Checked);
        AShowWarrantyButton := BooleanToInt(cbShowWarrantyButton.Checked);

        AMasterNotify := BooleanToInt(cbMasterNotify.Checked);
        AMasterNotifyText := Trim(mMasterNotifyText.Text);

        ANeedCall := BooleanToInt(cbNeedCall.Checked);
        AQualityControl := BooleanToInt(cbQualityControl.Checked);

        AName := Trim(eName.Text);
        ANamePublic := Trim(eNamePublic.Text);
        AOrder := eStatusOrder.Value;
        AColor := eColor.EditValue;
        AComment := Trim(eComment.Text);

        if dsEdit = mdHandler.State then mdHandler.Post;

        ACode := mdHandler.FieldBYName('Handler').AsString;
      end;

      qList.Close;
      mdHandler.Close;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGStatusTypeParamForm.bOKClick(Sender: TObject);
begin
  if Length(ClearPushText) > 150 then ShowMsg('Превышена допустимая длина текста PUSH уведомления!')
  else
    ModalResult := mrOK;
end;

procedure TGStatusTypeParamForm.cbFinCancelPropertiesEditValueChanged(
  Sender: TObject);
begin
  cbFinCancel.Enabled := cbFin.Checked;
  if not cbFinCancel.Enabled then cbFinCancel.Checked := false;
end;

function TGStatusTypeParamForm.ClearPushText: string;
  var
    s : string;
begin
  s := AnsiLowerCase(Trim(mMasterNotifyText.Text));
  s := StringReplace(s, '[номер]', '', [rfReplaceAll]);
  s := StringReplace(s, '[дата]', '', [rfReplaceAll]);
  s := StringReplace(s, '[время]', '', [rfReplaceAll]);
  s := StringReplace(s, '[статус]', '', [rfReplaceAll]);
  Result := s;
end;

procedure TGStatusTypeParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGStatusTypeParamForm.SetOKEnabled;
begin
  lMasterNotifyText.Caption := 'Текст PUSH уведомления мастера: (длина ' + IntToStr(Length(ClearPushText)) + ' сим., макс. 150 сим.)';

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

procedure TGStatusTypeParamForm.mMasterNotifyTextPropertiesChange(
  Sender: TObject);
begin
  SetOKENabled;
end;

end.
