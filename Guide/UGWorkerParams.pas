//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры мастера
//
//------------------------------------------------------------------------------
unit UGWorkerParams;
                                       
interface                                

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Mask,  
  Menus, cxLookAndFeelPainters, cxButtons, cxGraphics, cxDropDownEdit,
  cxCalendar, cxSpinEdit, cxCheckBox, cxLabel, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, dxSkinsCore, dxSkinsDefaultPainters, cxMemo, cxRichEdit, cxImage,
  ActnList, cxLookAndFeels, Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit;

type
  TGWorkerParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eSurname: TcxTextEdit;
    eName: TcxTextEdit;
    ePatro: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel12: TcxLabel;
    bInput: TcxButton;
    lDepartment: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    ePassword: TcxTextEdit;
    cxLabel2: TcxLabel;
    cbUserRole: TcxComboBox;
    cxLabel6: TcxLabel;
    eWorkerCompany: TcxButtonEdit;
    eEmail: TcxTextEdit;
    eEmail1: TcxLabel;
    ePhone: TcxMaskEdit;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bInputClick(Sender: TObject);
    procedure eWorkerCompanyDblClick(Sender: TObject);
    procedure ButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ePasswordPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FID, FIDWorkerCompany : integer;
    FPhone, FPassword : string;
    procedure FillPhis(AProp : string);
  public
    { Public declarations }
    procedure UpdateWorkerCompany;
    procedure FillUserROle;
    procedure SetOKEnabled;
  end;

function GetWorkerParams(
  var AActive, AIDWorkerCompany, AIDUserRole : integer;
  var ASurname, AName, APatro, APhone, APassword, AEMail, AComment : string;
      AID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UConsts, DTKUtils, UUtil, JPEG, mesdlg, URTFEditor, UWaiting,
  UDadataUtils, UDadataPhisParams, USelectWorkerCompany, StrUtils, ubcrypt;

function GetWorkerParams(
  var AActive, AIDWorkerCompany, AIDUserRole : integer;
  var ASurname, AName, APatro, APhone, APassword, AEMail, AComment : string;
      AID : integer) : boolean;
  var
    s : string;
begin
  with TGWorkerParamForm.Create(nil) do
    try
      FID := AID;
      FPhone := APhone;
      FPassword := APassword;

//      cbActive.Checked := AActive = 1;

      FIDWorkerCompany := AIDWorkerCompany;
      UpdateWorkerCompany;

      FillUserRole;
      SetItemIndexByID(cbUserROle, AIDUserRole);

      eSurname.Text := ASurname;
      eName.Text := AName;
      ePatro.Text := APatro;

      ePhone.Text := APhone;
      ePassword.Text := APassword;
      if (AID = 0) or (FPassword = '') then ePassword.Properties.EchoMode := eemNormal
      else ePassword.Properties.EchoMode := eemPassword;

      eEmail.Text := AEMail;
      eComment.Lines.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AIDWorkerCompany := FIDWorkerCompany;
        AIDUserROle := GetIDByItemIndex(cbUserROle);

        ASurname := Trim(eSurname.Text);
        AName := Trim(eName.Text);
        APatro := Trim(ePatro.Text);

        APhone := Preparephone(ePhone.Text);

        if (FPassword <> Trim(ePassword.Text)) then
        begin
          s := Trim(ePassword.Text);
          APassword := TBcrypt.HashPassword(s); //GetHashStr(s);
        end;

        AEMail := Trim(eEmail.Text);

        AComment := Trim(eComment.Lines.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGWorkerParamForm.FillUserROle;
begin
  cbUserROle.Properties.Items.Clear;
  FillComboBoxExSQL(cbUserROle, 'select ID, Name from UserROle where RoleType = 1 order by Name', 'Name', 'ID')
end;

procedure TGWorkerParamForm.FillPhis(AProp: string);
  var
    s : string;
begin
  eSurname.Text := GetParamValue(AProp, 'surname');
  eName.Text := GetParamValue(AProp, 'name');
  ePatro.Text := GetParamValue(AProp, 'patronymic');

  s := GetParamValue(AProp, 'gender');
  if s = 'MALE' then s := 'мужской'
  else
    if s = 'FEMALE' then s := 'женский'
    else s := 'неизвестно';
//  cbSex.Text := s;
end;


procedure TGWorkerParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkerParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (FIDWorkerCompany <> 0) and
    (cbUserRole.ItemIndex <> -1) and
    (Trim(eSurname.Text) <> '') and
    (Trim(eName.Text) <> '') and
//    (Trim(ePatro.Text) <> '') and
    (Trim(ePhone.Text) <> '') and
    (Trim(ePassword.Text) <> '');
end;

procedure TGWorkerParamForm.UpdateWorkerCompany;
  var
    v : variant;
begin
  if FIDWorkerCompany <> 0 then
  begin
    v := Datas.ReadValuesSQL('select Name, INN, KPP, OGRN from WorkerCompany where ID = ' + IntToStr(FIDWorkerCompany), 'Name;INN;KPP;OGRN');

    eWorkerCompany.Text := IsNull(v[0], '') + '. ИНН ' + IsNull(v[1], '') + ', КПП ' + IsNull(v[2], '') + ', ОГРН ' + IsNull(v[3], '');
  end
  else
    eWorkerCompany.Text := '';
end;

procedure TGWorkerParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkerParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGWorkerParamForm.ePasswordPropertiesChange(Sender: TObject);
begin
  ePassword.Properties.EchoMode := eemNormal;
  ePassword.SelStart := Length(ePassword.Text);
  ePassword.SelLength := 0;

  SetOKEnabled;
end;

procedure TGWorkerParamForm.eWorkerCompanyDblClick(Sender: TObject);
begin
  ButtonClick(eWorkerCompany, 0);
end;

procedure TGWorkerParamForm.ButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if SelectWorkerCompany(FIDWorkerCompany) then
  begin
    UpdateWorkerCompany;
  end;
  SetOKEnabled;
end;

procedure TGWorkerParamForm.bInputClick(Sender: TObject);
  var
    s, vKey, vSecret : string;
    vID : integer;
begin
  vKey := IsNull(Datas.ReadOptions('ApiKeyDaData')[0], '');
  vSecret := IsNull(Datas.ReadOptions('SecretKeyDaData')[0], '');

  if vKey = '' then
    ShowMsg(
      'Для работы данной функции необходимо в справочнике'#13#10 +
      '"Параметры организации" указать API ключ сервиса DaData!')
  else
  begin
    ShowWaiting('Получение доступа к сервису проверки данных...');
    s := CheckDaDataService(vKey);
    HideWaiting;

    if s <> '' then
    begin
      ShowMsg(
        'Во время получения доступа к сервису был получен ответ:'#13#10 + s, smtWarning);
    end
    else
      if DaDataPhisParams(vKey, s, eSurname.Text + ' ' + eName.Text + ' ' + ePatro.Text) then
      begin
        FillPhis(s);
        if eSurname.Enabled then eSurname.SetFocus;
      end;
  end;
  SetOKEnabled;
end;

end.
