//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры исполнителя
//
//------------------------------------------------------------------------------
unit UGWorkerCompanyParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxCalc, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar;

type
  TGWorkerCompanyParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    eOrgType: TcxComboBox;
    eINN: TcxTextEdit;
    cxLabel4: TcxLabel;
    eOGRN: TcxTextEdit;
    eKPP: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    eAddressJur: TcxTextEdit;
    cxLabel7: TcxLabel;
    eAddressFact: TcxTextEdit;
    cxLabel8: TcxLabel;
    eBank: TcxTextEdit;
    cxLabel9: TcxLabel;
    eBIK: TcxTextEdit;
    cxLabel10: TcxLabel;
    eKS: TcxTextEdit;
    cxLabel11: TcxLabel;
    eRS: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    eComissionSize: TcxCalcEdit;
    bInput: TcxButton;
    eMasterPost: TcxTextEdit;
    cxLabel14: TcxLabel;
    eMasterName: TcxTextEdit;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cbComissionType: TcxComboBox;
    cxLabel17: TcxLabel;
    eComissionDate: TcxTextEdit;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bInputClick(Sender: TObject);
    procedure eOrgTypePropertiesChange(Sender: TObject);
    procedure eComissionDatePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FOldComissionType : integer;
    FOldComissionSize : double;
  public
    { Public declarations }
    procedure SetOKEnabled;
    procedure FillJur(AProp : string);
  end;

function GetWorkerCompanyParams(
  var AActive : integer;
  var AOrgType,
      AName,
      AINN,
      AKPP,
      AOGRN,
      AMasterPost,
      AMasterName,
      AAddressJur,
      AAddressFact,
      ABank,
      ABIK,
      ARS,
      AKS,
      AComment : string;
  var AComissionType : integer;
  var AComissionSize : double;
  var AComissionDate : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, UWaiting, mesdlg, DTKUtils,
  UDadataUtils, UDaDataJurParams, UDaDataAddressParams, StrUtils;

function GetWorkerCompanyParams(
  var AActive : integer;
  var AOrgType,
      AName,
      AINN,
      AKPP,
      AOGRN,
      AMasterPost,
      AMasterName,
      AAddressJur,
      AAddressFact,
      ABank,
      ABIK,
      ARS,
      AKS,
      AComment : string;
  var AComissionType : integer;
  var AComissionSize : double;
  var AComissionDate : string) : boolean;
begin
  with TGWorkerCompanyParamForm.Create(nil) do
    try
      FOldComissionType := AComissionType;
      FOldComissionSize := AComissionSize;

//      cbActive.Checked := AActive = 1;
      eOrgType.Text := AOrgType;
      eName.Text := AName;
      eINN.Text := AINN;
      eKPP.Text := AKPP;
      eOGRN.Text := AOGRN;
      eMasterPost.Text := AMasterPost;
      eMasterName.Text := AMasterName;
      eAddressJur.Text := AAddressJur;
      eAddressFact.Text := AAddressFact;
      eBank.Text := ABank;
      eBIK.Text := ABIK;
      eKS.Text := AKS;
      eRS.Text := ARS;
      eComment.Text := AComment;

      cbComissionType.ItemIndex := AComissionType;
      eComissionSize.Value := AComissionSize;
      eComissionDate.Text := AComissionDate;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AOrgType := Trim(eOrgType.Text);
        AName := Trim(eName.Text);
        AINN := Trim(eINN.Text);
        AKPP := Trim(eKPP.Text);
        AOGRN := Trim(eOGRN.Text);
        AMasterPost := Trim(eMasterPost.Text);
        AMasterName := Trim(eMasterName.Text);
        AAddressJur := Trim(eAddressJur.Text);
        AAddressFact := Trim(eAddressFact.Text);
        ABank := Trim(eBank.Text);
        ABIK := Trim(eBIK.Text);
        AKS := Trim(eKS.Text);
        ARS := Trim(eRS.Text);

        AComissionSize := eComissionSize.Value;
        AComissionType := cbComissionType.ItemIndex;

        if (FOldComissionType <> AComissionType) or (FOldComissionSize <> AComissionSize) then
        begin
          AComissionDate := DateTimeToStr(ServerTime);
        end;

        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGWorkerCompanyParamForm.bInputClick(Sender: TObject);
  var
    s, vKey, vSecret : string;
    vID : integer;
begin
  vKey := IsNull(Datas.ReadOptions('ApiKeyDaData')[0], '');

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
      if DaDataJurParams(vKey, s) then
      begin
        FillJur(s);
        if eName.Enabled then eName.SetFocus;
      end;
  end;
  SetOKEnabled;
end;

procedure TGWorkerCompanyParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkerCompanyParamForm.eComissionDatePropertiesChange(
  Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkerCompanyParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and (Trim(eOrgType.Text) <> '') and
    IsDate(eComissionDate.Text);
end;

procedure TGWorkerCompanyParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGWorkerCompanyParamForm.eOrgTypePropertiesChange(Sender: TObject);
begin
  if
    (AnsiLowerCase(Trim(eOrgType.Text)) = AnsiLowerCase('СЗ')) or
    (AnsiLowerCase(Trim(eOrgType.Text)) = AnsiLowerCase('самозанятый')) or
    (AnsiLowerCase(Trim(eOrgType.Text)) = AnsiLowerCase('самозанятая'))
  then
  begin
    eMasterPost.Text := 'Руководитель';
    eMasterName.Text := eName.Text;
  end;

  SetOKEnabled;
end;

procedure TGWorkerCompanyParamForm.FillJur(AProp : string);
  var
    vIDOwner : integer;
    s, s1, s2, s3, vType, vName, vShortName : string;
    vAddress, vPhone, vEMail : string;
    vINN, vKPP, vOGRN : string;
    vOKVED, vOKPO : string;
    vMasterName, vMasterPost, vMasterNameRP, vMasterPostRP : string;
    vKey, vSecret : string;
begin
  if AProp <> '' then
  begin
    vIDOwner := 0;

    s := GetParamValue(AProp, 'opf');
    vType := GetParamValue(s, 'short', '|');

    s := GetParamValue(AProp, 'name');
    vName := GetParamValue(s, 'full_with_opf', '|');
    vShortName := GetParamValue(s, 'short_with_opf', '|');

    s := GetParamValue(AProp, 'address');
    s1 := GetParamValue(s, 'value', '|');
    if IsInteger(CorrectInteger(s1)) then
    begin
      s3 := s1;
    end
    else
    begin
      s2 := GetParamValue(s, 'unrestricted_value', '|');
      if IsInteger(CorrectInteger(s2)) then
        s3 := CorrectInteger(s2) + ' ' + s1
      else
        s3 := s1;
    end;

    if IsInteger(CorrectInteger(s3)) and (s3[7] = ',') then
    begin
      //убираем запятую
      s3 := CorrectInteger(s3) + ' ' + Trim(Copy(s3, 8, Length(s3) - 7));
    end;

    vAddress := s3;

    vPhone := GetParamValue(AProp, 'phones');
    vEMail := GetParamValue(AProp, 'emails');

    vINN := GetParamValue(AProp, 'inn');
    vKPP := GetParamValue(AProp, 'kpp');
    vOGRN := GetParamValue(AProp, 'ogrn');

    vOKVED := GetParamValue(AProp, 'okved');
    vOKPO:= GetParamValue(AProp, 'okpo');

    s := GetParamValue(AProp, 'management');
    vMasterName := GetParamValue(s, 'name', '|');
    vMasterPost := GetParamValue(s, 'post', '|');
    vMasterPost := AnsiLowerCase(vMasterPost);
    vMasterPostRP := vMasterPost;

    //попытка просклонять
    if (vType = 'ИП') and (vMasterName = '') then
    begin
      vMasterName := Trim(Copy(vShortName, 3, Length(vShortName)-2));
      vMasterNameRP := vMasterName;
    end;

    if vMasterName <> '' then
    begin
      vSecret := IsNull(Datas.ReadOptions('SecretKeyDaData')[0], '');
      vKey := IsNull(Datas.ReadOptions('ApiKeyDaData')[0], '');

      s := JSONFIOForm(vKey, vSecret, vMasterName);
      s := Trim(s);
      s := Copy(s, 2, Length(s) -2);//убираем ссылку на массив, чтоб осталась одна запись
      s := JSonReadParamsChild(s);
      s := GetParamValue(s, 'result_genitive', '|');
      vMasterNameRP := s;
    end;

    if GetTextWordCount(vMasterName) = 3 then
    begin
      vMasterName :=
        Trim(GetTextWordByIndex(vMasterName, 1)) + ' ' +
        LeftStr(Trim(GetTextWordByIndex(vMasterName, 2)), 1) + '.' +
        LeftStr(Trim(GetTextWordByIndex(vMasterName, 3)), 1) + '.';
    end;

    if GetTextWordCount(vMasterNameRP) = 3 then
    begin
      vMasterNameRP :=
        Trim(GetTextWordByIndex(vMasterNameRP, 1)) + ' ' +
        LeftStr(Trim(GetTextWordByIndex(vMasterNameRP, 2)), 1) + '.' +
        LeftStr(Trim(GetTextWordByIndex(vMasterNameRP, 3)), 1) + '.';
    end;

    vMasterPostRP := '';
    if vType = 'ИП' then
    begin
      vMasterPost := 'руководитель';
      vMasterPostRP := 'руководителя';
    end
    else
      if vMasterPost = 'директор' then vMasterPostRP := 'директора'
      else
        if vMasterPost = 'генеральный директор' then vMasterPostRP := 'генерального директора'
        else
          if vMasterPost = 'управляющий' then vMasterPostRP := 'управляющего'
          else
            if vMasterPost = 'председатель' then vMasterPostRP := 'председателя'
            else
              if vMasterPost = 'председатель правления' then vMasterPostRP := 'председателя правления';

    eName.Text := vName;
    eMasterName.Text:= vMasterName;
    eMasterPost.Text:= vMasterPost;
//    eMasterNameRP.Text:= vMasterNameRP;
//    eMasterPostRP.Text:= vMasterPostRP;

    if vAddress <> '' then
    begin
      eAddressFact.Text := vAddress;
      eAddressJur.Text := vAddress;
    end;

    eOrgType.Text := vType;

//    if vType = 'ИП' then eBasis.Text := 'на основании Свидетельства'
//    else eBasis.Text := 'на основании Устава';

{    if vEMail <> '' then
    begin
      eEMail.Text := vEMail;
      eEMailReg.Text := vEMail;
    end;}

{    if vPhone <> '' then
    begin
      ePhone.Text := vPhone;
    end;}

    eINN.Text := vINN;
    eKPP.Text := vKPP;
    eOGRN.Text := vOGRN;
//    eOKVED.Text := vOKVED;
//    eOKPO.Text := vOKPO;
  end;
end;

procedure TGWorkerCompanyParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
