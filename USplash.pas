//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Загрузочная картинка
//
//------------------------------------------------------------------------------
unit USplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg, JvExControls, JvLabel, dxGDIPlusClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxImage, JvExExtCtrls, JvImage;

type
  TSplashForm = class(TForm)
    Timer: TTimer;
    lInfo: TJvLabel;
    Image: TJvImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImageClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;
  CanShowSplash : boolean = true;

procedure ShowSplash;
procedure HideSplash;

implementation

{$R *.DFM}

uses
  JvVersionInfo, UOptions;

procedure ShowSplash;
begin
  if CanShowSplash and not SilentRun then
  begin
    SplashForm:= TSplashForm.Create(nil);
    with SplashForm do
    begin
      lInfo.Caption := '';
      Show;
      Update;
      while AlphaBlendValue < 240 do
        AlphaBlendValue := AlphaBlendValue + 10;
      AlphaBlendValue := 255;
    end;
  end;
end;

procedure HideSplash;
begin
  if Assigned(SplashForm) then SplashForm.Timer.Enabled := true;
end;

procedure TSplashForm.FormCreate(Sender: TObject);
begin
//  lProductName.Caption := AppVerInfo.ProductName;
//  lProdVersion.Caption := AppVerInfo.FileVersion;
end;

procedure TSplashForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) or (Key = #13) or (Key = ' ') then ModalResult := mrCancel;
end;

procedure TSplashForm.ImageClick(Sender: TObject);
begin
  Close;
end;

procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SplashForm := nil;
  Action := caFree;
end;

procedure TSplashForm.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := false;
  AlphaBlend := true;
  Update;
  while AlphaBlendValue > 5 do
    AlphaBlendValue := AlphaBlendValue - 5;
  Close;
end;

end.
