//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно параметров взаимодействия с клиентом
//
//------------------------------------------------------------------------------
unit UPartnerInteractionParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxButtons, cxGraphics,
  cxMemo, cxSpinEdit, cxTimeEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, DB,
  ADODB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids,
  dxSkinsCore, dxSkinsDefaultPainters;

type
  TPartnerInteractionParamsForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    Label6: TcxLabel;
    Label7: TcxLabel;
    Label8: TcxLabel;
    cbPartner: TcxComboBox;
    cbPartnerContact: TcxComboBox;
    cbActionType: TcxComboBox;
    eActionDate: TcxDateEdit;
    eActionTime: TcxTimeEdit;
    eSubject: TcxTextEdit;
    eResult: TcxTextEdit;
    mComment: TcxMemo;
    qPartner: TZQuery;
    qPartnerContact: TZQuery;
    qActionType: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbPartnerPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FID : integer;
  public
    { Public declarations }
    procedure FillPartner;
    procedure FillPartnerContact;
    procedure FillActionType;

    procedure SetOKEnabled;
  end;

function GetPartnerInteractionParams(
  var AIDPartner, AIDPartnerContact : integer;
  var AActionType : string;
  var AActionDate : TDate;
  var AActionTime : TTime;
  var ASubject, AResult, AComment : string;
  AID : integer
  ) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, DateUtils;

function GetPartnerInteractionParams(
  var AIDPartner, AIDPartnerContact : integer;
  var AActionType : string;
  var AActionDate : TDate;
  var AActionTime : TTime;
  var ASubject, AResult, AComment : string;
  AID : integer
  ) : boolean;
begin
  with TPartnerInteractionParamsForm.Create(nil) do
    try
      FID := AID;

      FillPartner;
      SetItemIndexByID(cbPartner, AIDPartner);

      FillPartnerContact;
      SetItemIndexByID(cbPartnerContact, AIDPartnerContact);

      FillActionType;
      cbActionType.Text := AActionType;

      eActionDate.Date := DateOf(AActionDate);
      eActionTime.Time := TimeOf(AActionTime);
      eSubject.Text := ASubject;
      eResult.Text := AResult;
      mComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AIDPartner := GetIDByItemIndex(cbPartner);
        AIDPartnerContact := GetIDByItemIndex(cbPartnerContact);
        AActionType := Trim(cbActionType.Text);
        AActionDate := DateOf(eActionDate.Date);
        AActionTime := TimeOf(eActionTime.Time);
        ASubject := Trim(eSubject.Text);
        AResult := Trim(eResult.Text);
        AComment := Trim(mComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TPartnerInteractionParamsForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbPartner.ItemIndex <> -1) and
    (Trim(eSubject.Text) <> '');
end;

procedure TPartnerInteractionParamsForm.FillActionType;
begin
  qActionType.Open;
  FillCOmboBox(qActionType, cbActionType, 'ActionType', '');
  qActionType.Close;
end;

procedure TPartnerInteractionParamsForm.FillPartner;
begin
  qPartner.ParamByName('ID1').Value := EmployeeID;
  qPartner.ParamByName('ID2').Value := EmployeeID;
  qPartner.Open;
  FillCOmboBox(qPartner, cbPartner, 'ShortName', 'ID');
  qPartner.Close;
end;

procedure TPartnerInteractionParamsForm.FillPartnerContact;
begin
  cbPartnerContact.Properties.Items.Clear;
  qPartnerContact.ParamByName('IDC').Value := GetIDByItemIndex(cbPartner);
  qPartnerContact.Open;
  FillCOmboBox(qPartnerContact, cbPartnerContact, 'CCName', 'ID');
  qPartnerContact.Close;
end;

procedure TPartnerInteractionParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TPartnerInteractionParamsForm.cbPartnerPropertiesChange(Sender: TObject);
begin
  FillPartnerContact;
  SetOKEnabled;
end;

procedure TPartnerInteractionParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TPartnerInteractionParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

end.
