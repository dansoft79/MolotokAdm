//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Модуль настройки физлица для DaData
//
//------------------------------------------------------------------------------
unit UDaDataPhisParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, JvSpin, Vcl.ComCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  cxButtons, cxControls, cxContainer, cxEdit, cxListView, cxTextEdit, cxListBox,
  dxSkinLilian, dxSkinLondonLiquidSky;

type
  TDaDataPhisForm = class(TForm)
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
    FProp : string;
    procedure DoRequestPhisXML;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

//возвращает список параметров и их значений через знак равенства, разделенных точкой с запятой
function DaDataPhisParams(APIKey : string; var AProperties : string; AText : string = '') : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, UDadataUtils;

function DaDataPhisParams(APIKey : string; var AProperties : string; AText : string = '') : boolean;
  var
    i : integer;
begin
  with TDaDataPhisForm.Create(nil) do
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

procedure TDaDataPhisForm.DoRequestPhisXML;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  URL := 'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/fio';
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

procedure TDaDataPhisForm.SetOKEnabled;
begin
  bOK.Enabled := ListVariant.ItemIndex >= 0;
end;

procedure TDaDataPhisForm.eKeyPress(Sender: TObject; var Key: Char);
begin
{  if Key = #13 then
  begin
    Key := #0;
    FindNextControl(TWinControl(Sender), true, true, false).SetFocus;
  end;}
end;

procedure TDaDataPhisForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDaDataPhisForm.ListBoxEnter(Sender: TObject);
begin
  if ListBox.ItemIndex = -1 then ListBox.ItemIndex := 0;
end;

procedure TDaDataPhisForm.ListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDaDataPhisForm.ListVariantClick(Sender: TObject);
begin
  eTextClick(nil);
  SetOKEnabled;
end;

procedure TDaDataPhisForm.ListVariantEnter(Sender: TObject);
begin
  if ListVariant.ItemIndex = -1 then
  begin
    if ListVariant.Items.Count > 0 then
      ListVariant.ItemIndex := 0;
    eTextClick(nil);
  end;
  SetOKEnabled;
end;

procedure TDaDataPhisForm.ListVariantExit(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDaDataPhisForm.ListVariantKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDaDataPhisForm.eTextChange(Sender: TObject);
begin
  if Length(eText.Text) > 2 then
    DoRequestPhisXML;

  SetOKEnabled;
end;

procedure TDaDataPhisForm.eTextClick(Sender: TObject);
  var
    t : integer;
    s, s1, s2, s3, s4 : string;
begin
  t := ListVariant.ItemIndex;
  if t = -1 then Exit;

  FProp := XMLReadParams(FXML, 'data', t);

  ListBox.Items.BeginUpdate;

  s := GetParamValue(FProp, 'surname');
  ListBox.Items[0].SubItems[0] := s;

  s := GetParamValue(FProp, 'name');
  ListBox.Items[1].SubItems[0] := s;

  s := GetParamValue(FProp, 'patronymic');
  ListBox.Items[2].SubItems[0] := s;

  s := GetParamValue(FProp, 'gender');
  if s = 'MALE' then s := 'мужской'
  else
    if s = 'FEMALE' then s := 'женский'
    else s := 'неизвестно';

  ListBox.Items[3].SubItems[0] := s;

  ListBox.Items.EndUpdate;
end;

procedure TDaDataPhisForm.eTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDaDataPhisForm.ePriorityChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDaDataPhisForm.eDefaultValueChange(Sender: TObject);
begin
  SetOKENabled;
end;

end.