//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры адресного ограничения
//
//------------------------------------------------------------------------------
unit UGAddressLimitParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxButtons, cxGraphics,
  cxLookAndFeels, cxMaskEdit, cxDropDownEdit;

type
  TRecordParamsForm = class(TForm)
    pBottom: TPanel;
    cxLabel1: TcxLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel2: TcxLabel;
    cbAddressType: TcxComboBox;
    eAddress: TcxComboBox;
    AddressTimer: TTimer;
    ldadata: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eAddressPropertiesChange(Sender: TObject);
    procedure AddressTimerTimer(Sender: TObject);
    procedure eAddressExit(Sender: TObject);
  private
    { Private declarations }
    FAddressName : string;
    FTest, FToken, FSecret : string;

    FJSON : string;
    FXML : string;
    FOldAddress : string;
  public
    { Public declarations }
    procedure StartAddressTimer;
    procedure SetOKEnabled;

    procedure DoRequestAddressJSon;
    procedure DoRequestAddressJSon1;

    procedure DoRequestAddressXML;
    procedure DoRequestAddressXML1;

    procedure FillInfoFromDadata;
  end;

function GetAddressLimitParams(
  var AAddressType : integer;
  var AAddressText, AAddressName : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, UDadataUtils, UDadataAddressParams;

function GetAddressLimitParams(
  var AAddressType : integer;
  var AAddressText, AAddressName : string) : boolean;
begin
  with TRecordParamsForm.Create(nil) do
    try
      FAddressName := AAddressName;
      cbAddressType.ItemIndex := AAddressType;
      eAddress.Text := AAddressText;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AAddressType := cbAddressType.ItemIndex;
        AAddressText := Trim(eAddress.Text);
        AAddressName := FAddressName;
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TRecordParamsForm.SetOKEnabled;
begin
  bOK.Enabled := Trim(eAddress.Text) <> '';
end;

procedure TRecordParamsForm.StartAddressTimer;
begin
  AddressTimer.Enabled := false;
  AddressTimer.Enabled := true;
end;

procedure TRecordParamsForm.FillInfoFromDadata;
  var
    s, m, t, a, p : string;
    vID : integer;
begin
  if FXML <> '' then
  begin
    //читаем правильный адрес, район и метро, стандартизируем

    a := XMLVariantName(FXML);

    //эта процедура срабатывает при выходе из поля ввода адреса, адрес не правим
{    eAddress.Properties.OnChange := nil;
    eAddress.Text := a;
    eAddress.Properties.OnChange := eAddressPropertiesChange;}

    p := XMLReadParams(FXML, 'data', 0);

    case cbAddressType.ItemIndex of
      0 : s := GetParamValue(p, 'region');
      1 : s := GetParamValue(p, 'city');
    end;
    FAddressName := s;
  end;
end;

procedure TRecordParamsForm.FormShow(Sender: TObject);
  var
    v : variant;
begin
  v := Datas.ReadOptions('APIKeyDadata;SecretKeyDadata');

  FToken := IsNull(v[0], '');
  FSecret := IsNull(v[1], '');

  if FToken <> '' then
  begin
    FTest := CheckDaDataService(FToken);
    ldadata.Caption := CheckDaDataService(FToken);
  end
  else
    FTest := 'no';

  SetOKEnabled;
end;

procedure TRecordParamsForm.AddressTimerTimer(Sender: TObject);
  var
    i, n : integer;
    v : string;
begin
  AddressTimer.Enabled := false;

  eAddress.Properties.OnChange := nil;

  DoRequestAddressJSON;

  n := JSONVariantCount(FJSON);

  eAddress.Properties.Items.BeginUpdate;
  eAddress.Properties.Items.Clear;

  for i := 0 to n - 1 do
  begin
    v := JSONVariantName(FJSON, i);
    eAddress.Properties.Items.Add(v);
  end;

  eAddress.Properties.Items.EndUpdate;

  if (FOldAddress <> eAddress.Text) and not eAddress.DroppedDown then
    eAddress.DroppedDown := true;

  FOldAddress := eAddress.Text;

  eAddress.Properties.OnChange := eAddressPropertiesChange;

  SetOKEnabled;
end;

procedure TRecordParamsForm.DoRequestAddressJSon;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/json';
  Accept := 'application/json';
  Token := FToken;
  Body := '"query": "' + eAddress.Text + '",';
  if cbAddressType.ItemIndex = 0 then
  begin
    Body := Body + '"from_bound": {"value" : "region"},';
    Body := Body + '"to_bound": {"value" : "region"}';
  end
  else
  begin
    Body := Body + '"from_bound": {"value" : "city"},';
    Body := Body + '"to_bound": {"value" : "city"}';
//    Body := Body + '"to_bound": {"value" : "settlement"}';
  end;
  Body := '{ ' + Body + ' }';

  FJSON := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TRecordParamsForm.DoRequestAddressJSon1;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/json';
  Accept := 'application/json';
  Token := FToken;
  Body := '"query": "' + eAddress.Text + '", "count" : 1, ';
  if cbAddressType.ItemIndex = 0 then
  begin
    Body := Body + '"from_bound": {"value" : "region"},';
    Body := Body + '"to_bound": {"value" : "region"}';
  end
  else
  begin
    Body := Body + '"from_bound": {"value" : "city"},';
    Body := Body + '"to_bound": {"value" : "city"}';
//    Body := Body + '"to_bound": {"value" : "settlement"}';
  end;
  Body := '{ ' + Body + ' }';

  FJSON := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TRecordParamsForm.DoRequestAddressXML;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/xml';
  Accept := 'application/xml';
  Token := FToken;
  Body := '<req><query>' + eAddress.Text + '</query></req>';
  FXML := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TRecordParamsForm.DoRequestAddressXML1;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/xml';
  Accept := 'application/xml';
  Token := FToken;
  Body := '<req><query>' + eAddress.Text + '</query><count>1</count></req>';
  FXML := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TRecordParamsForm.eAddressExit(Sender: TObject);
begin
  //чтение при выходе района и метро
  DoRequestAddressXML1;

  FillInfoFromDadata;
end;

procedure TRecordParamsForm.eAddressPropertiesChange(Sender: TObject);
begin
  if not eAddress.Focused then Exit;

  if Length(eAddress.Text) < 3 then Exit;

  if eAddress.Properties.Items.IndexOf(eAddress.Text) >= 0 then
  begin
    eAddress.SelLength := 0;
    eAddress.SelStart := Length(eAddress.Text);

    Exit;
  end;

  if eAddress.Text = '' then
  begin
    eAddress.Properties.Items.BeginUpdate;
    eAddress.Properties.Items.Clear;
    eAddress.Properties.Items.EndUpdate;

    Exit;
  end;

  StartAddressTimer;
end;

procedure TRecordParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TRecordParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

end.