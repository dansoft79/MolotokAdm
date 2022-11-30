//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Модуль настройки юрлица для DaData
//
//------------------------------------------------------------------------------
unit UDaDataJurParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, JvSpin, Vcl.ComCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  cxButtons, cxControls, cxContainer, cxEdit, cxListView, cxTextEdit, cxListBox,
  dxSkinLilian, dxSkinLondonLiquidSky, cxCustomListBox;

type
  TDaDataJurForm = class(TForm)
    pBottom: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    bOK: TcxButton;
    bCancel: TcxButton;
    ListVariant: TcxListBox;
    eText: TcxTextEdit;
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
    procedure ListVariantClick(Sender: TObject);
    procedure ListVariantExit(Sender: TObject);
  private
    { Private declarations }
    FAPIKey : string;
    FXML : string;
    FJSON : string;
    FProp : string;
    procedure DoRequestJurXML;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

//возвращает список параметров и их значений через знак равенства, разделенных точкой с запятой
function DaDataJurParams(APIKey : string; var AProperties : string; AText : string = '') : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, UDadataUtils;

function DaDataJurParams(APIKey : string; var AProperties : string; AText : string = '') : boolean;
  var
    i : integer;
begin
  with TDaDataJurForm.Create(nil) do
    try
      FAPIKey := APIKey;
      FXML := '';
      eText.Text := AText;

      for i := 0 to ListBox.Items.Count - 1 do
        ListBox.Items[i].SubItems.Add('');

      Result := ShowModal = mrOK;
      if Result then
      begin
        AProperties := FProp;
      end;
    finally
      Free;
    end;
end;

procedure TDaDataJurForm.DoRequestJurXML;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/party';
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

procedure TDaDataJurForm.SetOKEnabled;
begin
  bOK.Enabled := ListVariant.ItemIndex >= 0;
end;

procedure TDaDataJurForm.eKeyPress(Sender: TObject; var Key: Char);
begin
{  if Key = #13 then
  begin
    Key := #0;
    FindNextControl(TWinControl(Sender), true, true, false).SetFocus;
  end;}
end;

procedure TDaDataJurForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDaDataJurForm.ListBoxEnter(Sender: TObject);
begin
  if ListBox.ItemIndex = -1 then ListBox.ItemIndex := 0;
end;

procedure TDaDataJurForm.ListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDaDataJurForm.ListVariantClick(Sender: TObject);
begin
  eTextClick(nil);
  SetOKEnabled;
end;

procedure TDaDataJurForm.ListVariantEnter(Sender: TObject);
begin
  if ListVariant.ItemIndex = -1 then
  begin
    if ListVariant.Items.Count > 0 then
      ListVariant.ItemIndex := 0;
    eTextClick(nil);
  end;
  SetOKEnabled;
end;

procedure TDaDataJurForm.ListVariantExit(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDaDataJurForm.ListVariantKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDaDataJurForm.eTextChange(Sender: TObject);
begin
  if Length(eText.Text) > 2 then
    DoRequestJurXML;

  SetOKEnabled;
end;

procedure TDaDataJurForm.eTextClick(Sender: TObject);
  var
    t : integer;
    s, s1, s2, s3, s4 : string;
begin
  t := ListVariant.ItemIndex;
  if t = -1 then Exit;

  FProp := XMLReadParams(FXML, 'data', t);

  ListBox.Items.BeginUpdate;

  s := GetParamValue(FProp, 'name');
  s := GetParamValue(s, 'short_with_opf', '|');

  ListBox.Items[0].SubItems[0] := s;
  s := GetParamValue(FProp, 'management');
  s1 := GetParamValue(s, 'name', '|');
  s2 := GetParamValue(s, 'post', '|');
  ListBox.Items[1].SubItems[0] := s1;
  ListBox.Items[2].SubItems[0] := s2;

  ListBox.Items[3].SubItems[0] := GetParamValue(FProp, 'inn');
  ListBox.Items[4].SubItems[0] := GetParamValue(FProp, 'kpp');
  ListBox.Items[5].SubItems[0] := GetParamValue(FProp, 'ogrn');

  s := GetParamValue(FProp, 'address');
  s1 := GetParamValue(s, 'value', '|');
  ListBox.Items[6].SubItems[0] := s1;

  ListBox.Items[7].SubItems[0] := GetParamValue(FProp, 'okved');
  ListBox.Items[8].SubItems[0] := GetParamValue(FProp, 'okpo');

  {
  ACTIVE       — действующая
  LIQUIDATING  — ликвидируется
  LIQUIDATED   — ликвидирована
  REORGANIZING — в процессе присоединения к другому юрлицу,
                 с последующей ликвидацией
  }

  s := GetParamValue(FProp, 'state');
  s1 := GetParamValue(s, 'status', '|');
  s2 := GetParamValue(s, 'registration_date', '|');
  s3 := GetParamValue(s, 'liquidation_date', '|');
  s4 := GetParamValue(s, 'actuality_date', '|');

  if s = '' then ListBox.Items[9].SubItems[0] := ''
  else
  begin
    if s1 = 'ACTIVE' then s1 := 'действующая'
    else
      if s1 = 'LIQUIDATING' then s1 := 'ликвидируется'
      else
        if s1 = 'LIQUIDATED' then s1 := 'ликвидирована'
        else
          if s1 = 'REORGANIZING' then s1 := 'в процессе присоединения, с последующей ликвидацией';

    if s2 <> '' then s1 := s1 + ', регистрация ' +  DateToStr(DaDataStrToDate(s2));
    if s3 <> '' then s1 := s1 + ', ликвидация ' +   DateToStr(DaDataStrToDate(s3));
    if s4 <> '' then s1 := s1 + ', актуально на ' + DateToStr(DaDataStrToDate(s4));

    ListBox.Items[9].SubItems[0] := s1;
  end;

  ListBox.Items.EndUpdate;
end;

procedure TDaDataJurForm.eTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDaDataJurForm.ePriorityChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDaDataJurForm.eDefaultValueChange(Sender: TObject);
begin
  SetOKENabled;
end;

end.
