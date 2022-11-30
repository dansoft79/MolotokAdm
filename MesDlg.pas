//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Диалоговое окно
//
//------------------------------------------------------------------------------
unit MesDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, StdCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  UConsts, JvExControls, JvLabel, cxGraphics, cxControls, cxLookAndFeels,
  cxContainer, cxEdit, dxSkinsCore, cxImage, cxLabel, System.ImageList,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, cxImageList;

type
  TShowMsgType = (
    smtWarning,        { предупреждение }
    smtError,          { ошибка }
    smtInformation,    { информация }
    smtConfirmation,   { подтверждение }
    smtForbidden);     { запрет }

  TShowMsgButton = (
    smbNone,
    smbYes,
    smbNo,
    smbOK,
    smbCancel,
    smbAbort,
    smbRetry,
    smbIgnore,
    smbAll,
    smbNoToAll,
    smbYesToAll);

  TShowMsgButtons = set of TShowMsgButton;

  TShowMsgForm = class(TForm)
    pButtons: TPanel;
    TypeImageList: TcxImageList;
    Image: TcxImage;
    lText: TcxLabel;
    Timer: TTimer;
    lTime: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    FText : string;
    FMsgType : TShowMsgType;
    FButtons : TShowMsgButtons;
    FDefaultButton, FCancelButton : TShowMsgButton;
    FDefButton : TcxButton;
    FTime : integer;
    procedure Initialize(AText : string; AMsgType : TShowMsgType; AButtons : TShowMsgButtons; ADefaultButton, ACancelButton : TShowMsgButton);
  public
    { Public declarations }
  end;

function ShowMsg(AText : string; AMsgType : TShowMsgType = smtInformation; AButtons : TShowMsgButtons = [smbOK]; ADefaultButton : TShowMsgButton = smbOK; ACancelButton : TShowMsgButton = smbOK; ATime : integer = 0) : integer;

const
  TextDX = 10;
  TextDY = 10;
  ButtonDX = 2;
  ButtonWidth = 75;

implementation

{$R *.DFM}

uses
  Math, UUtil, USplash;

type
  TButtonInfo =
  record
    Result : integer;
    Caption : string;
    Name : string;
  end;

const
  cButtonInfos : array [TShowMsgButton] of TButtonInfo = (
    (Result : mrNone; Caption : ''; Name : ''),
    (Result : mrYes; Caption : cDYes; Name : 'bYes'),
    (Result : mrNo; Caption : cDNo; Name : 'bNo'),
    (Result : mrOK; Caption : cDOK; Name : 'bOK'),
    (Result : mrCancel; Caption : cDCancel; Name : 'bCancel'),
    (Result : mrAbort; Caption : cDAbort; Name : 'bAbort'),
    (Result : mrRetry; Caption : cDRetry; Name : 'bRetry'),
    (Result : mrIgnore; Caption : cDIgnore; Name : 'bIgnore'),
    (Result : mrAll; Caption : cDAll; Name : 'bAll'),
    (Result : mrNoToAll; Caption : cDNoForAll; Name : 'bNoToAll'),
    (Result : mrYesToAll; Caption : cDYesForAll; Name : 'bYesToAll')
  );

type
  TShowMsgInfo =
  record
    Caption : string;
  end;

const
  cShowMsgInfos : array [TShowMsgType] of TShowMsgInfo = (
    (Caption : 'Предупреждение'),
    (Caption : 'Ошибка'),
    (Caption : 'Информация'),
    (Caption : 'Подтверждение'),
    (Caption : 'Запрет')
  );

function ShowMsg(AText : string; AMsgType : TShowMsgType = smtInformation; AButtons : TShowMsgButtons = [smbOK]; ADefaultButton : TShowMsgButton = smbOK; ACancelButton : TShowMsgButton = smbOK; ATime : integer = 0) : integer;
begin
  HideSplash;

  with TShowMsgForm.Create(nil) do
    try
      FText := AText;
      FMsgType := AMsgType;
      FButtons := AButtons;
      FDefaultButton := ADefaultButton;
      FCancelButton := ACancelButton;

      Timer.Enabled := false;
      FTime := ATime;
      lTime.Caption := '';
      if ATime > 0 then
      begin
        lTime.Caption := IntToStr(FTime) + ' сек.';
        Timer.Interval := 1000;
        Timer.Enabled := true;
      end;

      Result := ShowModal;
    finally
      Free;
    end;
end;

{ TShowMsgForm }

procedure TShowMsgForm.Initialize(AText : string; AMsgType: TShowMsgType;
  AButtons: TShowMsgButtons; ADefaultButton, ACancelButton : TShowMsgButton);
  var
    i : TShowMsgButton;
    dx, n, l : integer;
    vBitmap: TBitmap;
    vBtn : TcxButton;
begin
  if AButtons = [] then AButtons := [smbOK];
  Caption := cShowMsgInfos[AMsgType].Caption;

  vBitmap:= TBitmap.Create;
  vBitmap.PixelFormat := pf32bit;
  vBitmap.AlphaFormat := afPremultiplied;
  TypeImageList.GetImage(Integer(AMsgType), vBitmap);

  Image.Picture.Bitmap.Assign(vBitmap);

  vBitmap.Free;

  lText.Caption := AText;
  n := 0;
  for i := smbYes to smbYesToAll do
    if i in AButtons then Inc(n);
  l := ButtonWidth * n + (n + 1) * ButtonDX;
  ClientWidth := Max(Image.Width + lText.Width + TextDX, l);
  dx := ClientWidth div 2 - l div 2 + ButtonDX;
  for i := smbYes to smbYesToAll do
    if i in AButtons then
    begin
      vBtn := TcxButton.Create(pButtons);
      with vBtn do
      begin
        Parent := pButtons;
        Left := dx;
        Top := 0;
        Width := ButtonWidth;
        Height := 25;
        Caption := cButtonInfos[i].Caption;
        Name := cButtonInfos[i].Name;
        ModalResult := cButtonInfos[i].Result;
        if ADefaultButton = i then
        begin
          Default := true;
          SetFocus;
          FDefButton := vBtn;
        end;
        if ACancelButton = i then Cancel := true;
      end;
      dx := dx + ButtonWidth + ButtonDX;
    end;

  ClientHeight := Max(Image.Height, lText.Height + 2 * TextDY) + pButtons.Height;

  lText.Top := TextDY;
  lText.Left := Image.Width;

end;

procedure TShowMsgForm.TimerTimer(Sender: TObject);
begin
  if FTime > 0 then
  begin
    FTime := FTime - 1;
    lTime.Caption := IntToStr(FTime) + ' сек.';
    Timer.Enabled := true;
  end
  else
  begin
    Timer.Enabled := false;
    lTime.Caption := '';
    FDefButton.Click;
  end;
end;

procedure TShowMsgForm.FormShow(Sender: TObject);
begin
  Initialize(FText, FMsgType, FButtons, FDefaultButton, FCancelButton);
end;

end.
