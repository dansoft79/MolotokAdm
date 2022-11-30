//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры лида исполнителя
//
//------------------------------------------------------------------------------
unit UWorkerLeadParams;
                                       
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
  TWorkerLeadParamForm = class(TForm)
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
    cbWorkClass: TcxComboBox;
    lDepartment: TcxLabel;
    eComment: TcxMemo;
    cbProcessed: TcxCheckBox;
    ePhone: TcxTextEdit;
    cxLabel1: TcxLabel;
    eCity: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    eInfo: TcxMemo;
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
    procedure FillWorkClass;
    procedure SetOKEnabled;
  end;

function GetWorkerLeadParams(
  var AActive, AProcessed, AIDWorkClass : integer;
  var ASurname, AName, APatro, APhone, ACity,
      AInfo, AComment : string;
      AID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UConsts, DTKUtils, UUtil, JPEG, mesdlg, URTFEditor, UWaiting,
  UDadataUtils, UDadataPhisParams, StrUtils;

function GetWorkerLeadParams(
  var AActive, AProcessed, AIDWorkClass : integer;
  var ASurname, AName, APatro, APhone, ACity,
      AInfo, AComment : string;
      AID : integer) : boolean;
  var
    s : string;
begin
  with TWorkerLeadParamForm.Create(nil) do
    try
      FID := AID;

//      cbActive.Checked := AActive = 1;
      cbProcessed.Checked := AProcessed = 1;

      FillWorkClass;
      SetItemIndexByID(cbWorkClass, AIDWorkClass);

      eSurname.Text := ASurname;
      eName.Text := AName;
      ePatro.Text := APatro;

      eCity.Text := ACity;
      ePhone.Text := APhone;

      eInfo.Lines.Text := AInfo;
      eComment.Lines.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AProcessed := BooleanToInt(cbProcessed.Checked);
        AIDWorkClass := GetIDByItemIndex(cbWorkClass);

        ASurname := Trim(eSurname.Text);
        AName := Trim(eName.Text);
        APatro := Trim(ePatro.Text);

        ACity := Trim(eCity.Text);
        APhone := Trim(ePhone.Text);

        AInfo := Trim(eInfo.Lines.Text);
        AComment := Trim(eComment.Lines.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TWorkerLeadParamForm.FillWorkClass;
begin
  cbWorkClass.Properties.Items.Clear;
  FillComboBoxExSQL(cbWorkClass, 'select ID, Name from WorkClass order by Name', 'Name', 'ID')
end;

procedure TWorkerLeadParamForm.FillPhis(AProp: string);
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


procedure TWorkerLeadParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TWorkerLeadParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbWorkClass.ItemIndex <> -1) and
    (Trim(ePhone.Text) <> '');
end;

procedure TWorkerLeadParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TWorkerLeadParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TWorkerLeadParamForm.bInputClick(Sender: TObject);
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
