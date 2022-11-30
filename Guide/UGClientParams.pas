//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры клиента
//
//------------------------------------------------------------------------------
unit UGClientParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TGClientParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    eAddress: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    eFlatNumber: TcxTextEdit;
    cxLabel6: TcxLabel;
    cbDistrict: TcxComboBox;
    cxLabel7: TcxLabel;
    cbMetro: TcxComboBox;
    ePhone: TcxMaskEdit;
    qMetro: TZQuery;
    cbClientDomSPB: TcxCheckBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbMetroPropertiesPopup(Sender: TObject);
    procedure cbDistrictPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
    procedure FillDistrict;
    procedure FillMetro;
  end;

function GetClientParams(
  var AActive, AClientDomSPB : integer;
  var AName, APhone, AAddress, AFlatNumber : string;
  var AIDDistrict, AIDMetro : integer;
  var AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetClientParams(
  var AActive, AClientDomSPB : integer;
  var AName, APhone, AAddress, AFlatNumber : string;
  var AIDDistrict, AIDMetro : integer;
  var AComment : string) : boolean;
begin
  with TGClientParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      cbClientDomSPB.Checked := AClientDomSPB = 1;

      eName.Text := AName;
      ePhone.Text := APhone;
      eAddress.Text := AAddress;
      eFlatNumber.Text := AFlatNumber;
      FillDistrict;
      SetItemIndexByID(cbDistrict, AIDDistrict);
      FillMetro;
      SetItemIndexByID(cbMetro, AIDMetro);
      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);

        AClientDomSPB := BooleanToInt(cbClientDomSPB.Checked);

        AName := Trim(eName.Text);
        APhone := PreparePhone(ePhone.Text);
        AAddress := Trim(eAddress.Text);
        AFlatNumber := Trim(eFlatNumber.Text);
        AIDDistrict := GetIDByItemIndex(cbDistrict);
        AIDMetro := GetIDByItemIndex(cbMetro);
        if AIDMetro = -1 then AIDMetro := 0;
        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGClientParamForm.cbDistrictPropertiesChange(Sender: TObject);
begin
  FillMetro;
end;

procedure TGClientParamForm.cbMetroPropertiesPopup(Sender: TObject);
begin
  FillMetro;
end;

procedure TGClientParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGClientParamForm.SetOKEnabled;
  var
    s : string;
begin
  s := PreparePhone(ePhone.Text);
  bOK.Enabled := (Length(s) = 10);
end;

procedure TGClientParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGClientParamForm.FillDistrict;
begin
  cbDistrict.Properties.Items.Clear;
  FillComboBoxExSQL(cbDistrict, 'select ID, Name from DistrictView order by Name', 'Name', 'ID');
end;

procedure TGClientParamForm.FillMetro;
  var
    i, vID, vIDM : integer;
begin
  vIDM := GetIDByItemIndex(cbMetro);
  vID := GetIDByItemIndex(cbDistrict);
  cbMetro.Properties.Items.Clear;
  FillComboBoxExSQL(cbMetro, 'select ID, Name from MetroView where ID_District = ' + IntToStr(vID) + ' order by Name', 'Name', 'ID');

  if cbMetro.Properties.Items.Count > 0 then
     cbMetro.Properties.Items.AddObject('-----------------------------------', Pointer(-1));

  qMetro.Close;
  qMetro.ParamByName('IDD').AsInteger := vID;
  qMetro.Open;
  qMetro.First;
  while not qMetro.eof do
  begin
    cbMetro.Properties.Items.AddObject(qMetro.FieldByName('Name').AsString + ' (' + qMetro.FieldByName('DInfo').AsString + ')', Pointer(qMetro.FieldByName('ID').AsInteger));
    qMetro.Next;
  end;
  qMetro.Close;

  if vIDM <> 0 then SetItemIndexByID(cbMetro, vIDM);
end;

procedure TGClientParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
