//------------------------------------------------------------------------------
//
// ћолоток јдминистратор
//
// (c) 2021-2023, ќќќ ѕќ–“јЋѕ–ќ
//
// ћодуль настройки адреса дл€ DaData
//
//------------------------------------------------------------------------------
unit UDaDataAddressParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, JvSpin, Vcl.ComCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  cxButtons, cxControls, cxContainer, cxEdit, cxListView, cxListBox, cxTextEdit,
  dxSkinLilian, dxSkinLondonLiquidSky, cxCustomListBox;

type
  TAddressDaDataForm = class(TForm)
    pBottom: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eText: TcxTextEdit;
    ListVariant: TcxListBox;
    ListBox: TcxListView;
    procedure eKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure eTextChange(Sender: TObject);
    procedure ePriorityChange(Sender: TObject);
    procedure eDefaultValueChange(Sender: TObject);
    procedure eTextClick(Sender: TObject);
    procedure ListVariantEnter(Sender: TObject);
    procedure ListBoxEnter(Sender: TObject);
    procedure eTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListVariantKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FAPIKey : string;
    FXML : string;
    FJSON : string;
    FProp : string;
    procedure DoRequestAddressJSon;
    procedure DoRequestAddressXML;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

//возвращает список параметров и их значений через знак равенства, разделенных точкой с зап€той
function DaDataAddressParams(APIKey : string; var AVariant : string; var AProperties : string; AText : string = '') : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, UDadataUtils;

function DaDataAddressParams(APIKey : string; var AVariant : string; var AProperties : string; AText : string = '') : boolean;
  var
    i : integer;
begin
  with TAddressDaDataForm.Create(nil) do
    try
      FAPIKey := APIKey;
      FXML := '';
      eText.Text := AText;

      for i := 0 to ListBox.Items.Count - 1 do
        ListBox.Items[i].SubItems.Add('');

      Result := ShowModal = mrOK;
      if Result then
      begin
        AVariant := ListVariant.Items[ListVariant.ItemIndex];
        AProperties := FProp;
      end;
    finally
      Free;
    end;
end;

procedure TAddressDaDataForm.DoRequestAddressJSon;
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
  Token := FAPIKEY;
  Body := '{ "query": "' + eText.Text + '" }';
  FJSON := GetDaData(URL, ContentType, Accept, Token, Body);
end;

procedure TAddressDaDataForm.DoRequestAddressXML;
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
  Token := FAPIKEY;
  Body := '<req><query>' + eText.Text + '</query></req>';
  FXML := GetDaData(URL, ContentType, Accept, Token, Body);

  n := XMLVariantCount(FXML);

  ListVariant.Items.BeginUpdate;
  ListVariant.Items.Clear;

  for i := 0 to n - 1 do
  begin
    v := XMLVariantName(FXML, i);
    ListVariant.Items.Add(v);
  end;

  ListVariant.Items.EndUpdate;
end;

{ TGuideParamsForm }

procedure TAddressDaDataForm.SetOKEnabled;
begin
  bOK.Enabled := ListVariant.Items.Count > 0;
end;

procedure TAddressDaDataForm.eKeyPress(Sender: TObject; var Key: Char);
begin
{  if Key = #13 then
  begin
    Key := #0;
    FindNextControl(TWinControl(Sender), true, true, false).SetFocus;
  end;}
end;

procedure TAddressDaDataForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TAddressDaDataForm.ListBoxEnter(Sender: TObject);
begin
  if ListBox.ItemIndex = -1 then ListBox.ItemIndex := 0;
end;

procedure TAddressDaDataForm.ListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TAddressDaDataForm.ListVariantEnter(Sender: TObject);
begin
  if ListVariant.ItemIndex = -1 then
  begin
    if ListVariant.Items.Count > 0 then
      ListVariant.ItemIndex := 0;
    eTextClick(nil);
  end;
end;

procedure TAddressDaDataForm.ListVariantKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TAddressDaDataForm.eTextChange(Sender: TObject);
begin
  if Length(eText.Text) > 2 then
    DoRequestAddressXML;

  SetOKEnabled;
end;

procedure TAddressDaDataForm.eTextClick(Sender: TObject);
  var
    t : integer;
    a : string;
begin
  t := ListVariant.ItemIndex;
  if t = -1 then Exit;

  FProp := XMLReadParams(FXML, 'data', t);

  ListBox.Items.BeginUpdate;

  ListBox.Items[0].SubItems[0] := GetParamValue(FProp, 'region_with_type');
  ListBox.Items[1].SubItems[0] := GetParamValue(FProp, 'area_with_type');
  ListBox.Items[2].SubItems[0] := GetParamValue(FProp, 'city_with_type') + GetParamValue(FProp, 'settlement_with_type');
  ListBox.Items[3].SubItems[0] := GetParamValue(FProp, 'street_with_type');
  ListBox.Items[4].SubItems[0] := GetParamValue(FProp, 'house');
  ListBox.Items[5].SubItems[0] := GetParamValue(FProp, 'flat');

  ListBox.Items[6].SubItems[0] := GetParamValue(FProp, 'city_kladr_id') + GetParamValue(FProp, 'settlement_kladr_id');
  ListBox.Items[7].SubItems[0] := GetParamValue(FProp, 'street_kladr_id');
  ListBox.Items[8].SubItems[0] := GetParamValue(FProp, 'house_kladr_id');

  ListBox.Items[9].SubItems[0] := GetParamValue(FProp, 'postal_code');

  {
    0    Ч актуальный
    1Ц50 Ч переименован
    51   Ч переподчинен
    99   Ч удален
  }

  a := GetParamValue(FProp, 'fias_actuality_state');

  if a = '' then ListBox.Items[10].SubItems[0] := ''
  else
  begin
    case StrToInt(a) of
      0 : a := 'актуальный';
      1..50 : a := 'переименован';
      51 : a := 'переподчинен';
      99 : a := 'удален';
    end;

    ListBox.Items[10].SubItems[0] := a;
  end;

  ListBox.Items.EndUpdate;
end;

procedure TAddressDaDataForm.eTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TAddressDaDataForm.ePriorityChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TAddressDaDataForm.eDefaultValueChange(Sender: TObject);
begin
  SetOKENabled;
end;

end.