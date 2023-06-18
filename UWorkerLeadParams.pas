//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ��������� ���� �����������
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
    eFIO: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel12: TcxLabel;
    bInput: TcxButton;
    cbWorkClass: TcxComboBox;
    lDepartment: TcxLabel;
    eComment: TcxMemo;
    ePhone: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    eInfo: TcxMemo;
    cbStatusTypeLead: TcxComboBox;
    cxLabel6: TcxLabel;
    cbDistrict: TcxComboBox;
    cxLabel2: TcxLabel;
    eLeadDateTime: TcxDateEdit;
    cxLabel4: TcxLabel;
    eLeadDateTimeComment: TcxTextEdit;
    cxLabel5: TcxLabel;
    cbActive: TcxCheckBox;
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
    procedure FillDistrict;
    procedure FillStatusTypeLead;
    procedure SetOKEnabled;
  end;

function GetWorkerLeadParams(
  var AActive, AIDStatusTypeLead, AIDWorkClass, AIDDistrict : integer;
  var AFIO, APhone, ALeadDateTime, ALeadDateTimeComment, AInfo, AComment : string;
      AID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UConsts, DTKUtils, UUtil, JPEG, mesdlg, URTFEditor, UWaiting,
  UDadataUtils, UDadataPhisParams, StrUtils;

function GetWorkerLeadParams(
  var AActive, AIDStatusTypeLead, AIDWorkClass, AIDDistrict : integer;
  var AFIO, APhone, ALeadDateTime, ALeadDateTimeComment, AInfo, AComment : string;
      AID : integer) : boolean;
  var
    s : string;
begin
  with TWorkerLeadParamForm.Create(nil) do
    try
      FID := AID;

      cbActive.Checked := AActive = 1;

      FillStatusTypelead;
      SetItemIndexByID(cbStatusTypeLead, AIDStatusTypeLead);

      FillWorkClass;
      SetItemIndexByID(cbWorkClass, AIDWorkClass);

      FillDistrict;
      SetItemIndexByID(cbDistrict, AIDDistrict);

      eFIO.Text := AFIO;
      ePhone.Text := APhone;

      eLeadDateTime.Text := ALeadDateTime;
      eLeadDateTimeComment.Text := ALeadDateTimeComment;

      eInfo.Lines.Text := AInfo;
      eComment.Lines.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AActive := BooleanToInt(cbActive.Checked);

        AIDStatusTypeLead := GetIDByItemIndex(cbStatusTypeLead);
        AIDWorkClass := GetIDByItemIndex(cbWorkClass);
        AIDDistrict := GetIDByItemIndex(cbDistrict);

        AFIO := Trim(eFIO.Text);
        APhone := Trim(ePhone.Text);

        if IsDateTime(eLeadDateTime.Text) then ALeadDateTime := eLeadDateTime.Text
        else ALeadDateTime := '';

        ALeadDateTimeComment := Trim(eLeadDateTimeComment.Text);

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

procedure TWorkerLeadParamForm.FillDistrict;
begin
  cbDistrict.Properties.Items.Clear;
  FillComboBoxExSQL(cbDistrict, 'select ID, Name from District order by Name', 'Name', 'ID')
end;

procedure TWorkerLeadParamForm.FillPhis(AProp: string);
  var
    s : string;
begin
//  eSurname.Text := GetParamValue(AProp, 'surname');
//  eName.Text := GetParamValue(AProp, 'name');
//  ePatro.Text := GetParamValue(AProp, 'patronymic');

  eFIO.Text := Trim(GetParamValue(AProp, 'surname') + ' ' + GetParamValue(AProp, 'name') + ' ' + GetParamValue(AProp, 'patronymic'));

  s := GetParamValue(AProp, 'gender');
  if s = 'MALE' then s := '�������'
  else
    if s = 'FEMALE' then s := '�������'
    else s := '����������';
//  cbSex.Text := s;
end;


procedure TWorkerLeadParamForm.FillStatusTypeLead;
begin
  cbStatusTypeLead.Properties.Items.Clear;
  FillComboBoxExSQL(cbStatusTypeLead, 'select ID, Name from StatusTypeLead order by Name', 'Name', 'ID')
end;

procedure TWorkerLeadParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TWorkerLeadParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbStatusTypeLead.ItemIndex <> -1) and
    (cbDistrict.ItemIndex <> -1) and
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
      '��� ������ ������ ������� ���������� � �����������'#13#10 +
      '"��������� �����������" ������� API ���� ������� DaData!')
  else
  begin
    ShowWaiting('��������� ������� � ������� �������� ������...');
    s := CheckDaDataService(vKey);
    HideWaiting;

    if s <> '' then
    begin
      ShowMsg(
        '�� ����� ��������� ������� � ������� ��� ������� �����:'#13#10 + s, smtWarning);
    end
    else
      if DaDataPhisParams(vKey, s, eFIO.Text) then
      begin
        FillPhis(s);
        if eFIO.Enabled then eFIO.SetFocus;
      end;
  end;
  SetOKEnabled;
end;

end.
