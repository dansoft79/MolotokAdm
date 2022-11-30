//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры пользователя
//
//------------------------------------------------------------------------------
unit UGUserParams;
                                       
interface                                

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Mask,  
  Menus, cxLookAndFeelPainters, cxButtons, cxGraphics, cxDropDownEdit,
  cxCalendar, cxSpinEdit, cxCheckBox, cxLabel, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, dxSkinsCore, dxSkinsDefaultPainters, cxMemo, cxRichEdit, cxImage,
  ActnList, cxLookAndFeels, Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TUserParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eLogin: TcxTextEdit;
    ePassword: TcxTextEdit;
    eSurname: TcxTextEdit;
    eName: TcxTextEdit;
    ePatro: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel12: TcxLabel;
    bInput: TcxButton;
    cbUserRole: TcxComboBox;
    lDepartment: TcxLabel;
    eComment: TcxMemo;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bInputClick(Sender: TObject);
  private
    { Private declarations }
    FID : integer;
    procedure FillPhis(AProp : string);
  public
    { Public declarations }
    FLogin, FPassword : string;
    procedure FillUserROle;
    procedure SetOKEnabled;
  end;

function GetUserParams(
  var AActive, AIDUserROle : integer;
  var ALogin, APassword,
      ASurname, AName, APatro,
      AComment : string;
      AID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UConsts, DTKUtils, UUtil, JPEG, mesdlg, URTFEditor, UWaiting,
  UDadataUtils, UDadataPhisParams, StrUtils;

function GetUserParams(
  var AActive, AIDUserROle : integer;
  var ALogin, APassword,
      ASurname, AName, APatro,
      AComment : string;
      AID : integer) : boolean;
  var
    s : string;
begin
  with TUserParamForm.Create(nil) do
    try
      FID := AID;
      FLogin := ALogin;
      FPassword := APassword;

//      cbActive.Checked := AActive = 1;

      FillUserROle;
      SetItemIndexByID(cbUSerROle, AIDUserROle);

      eLogin.Text := ALogin;
      ePassword.Text := APassword;

      eSurname.Text := ASurname;
      eName.Text := AName;
      ePatro.Text := APatro;

      eComment.Lines.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);

        AIDUserRole := GetIDByItemIndex(cbUserROle);
        ALogin := eLogin.Text;
        if (FPassword <> Trim(ePassword.Text)) then
        begin
          s := Trim(ePassword.Text);
          APassword := GetHashStr(s);
        end;

        ASurname := eSurname.Text;
        AName := eName.Text;
        APatro := ePatro.Text;

        AComment := Trim(eComment.Lines.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TUserParamForm.FillUserROle;
begin
  cbUserROle.Properties.Items.Clear;
  FillComboBoxExSQL(cbUserROle, 'select ID, Name from UserROle where RoleType = 0 order by Name', 'Name', 'ID')
end;

procedure TUserParamForm.FillPhis(AProp: string);
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


procedure TUserParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TUserParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbUserROle.ItemIndex <> -1) and
    (Trim(eLogin.Text) <> '') and
    (Trim(ePassword.Text) <> '')
end;

procedure TUserParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TUserParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TUserParamForm.bInputClick(Sender: TObject);
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
