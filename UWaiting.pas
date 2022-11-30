//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно ожидания
//
//------------------------------------------------------------------------------
unit UWaiting;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel,
  dxSkinsCore, dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TWaitingForm = class(TForm)
    lText: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  end;

const
  WaitingForm : TWaitingForm = nil;

procedure ShowWaiting(AText : ansistring);

procedure ChangeWaiting(AText : ansistring);

procedure HideWaiting;

implementation

{$R *.DFM}

uses
  USplash, MainUnit, UOptions;

procedure ShowWaiting(AText : ansistring);
  var
    v : boolean;
    X, Y : integer;
begin
  if AppLoading and SilentRun then Exit;

  if Assigned(Application.MainForm) then
    Application.MainForm.Update;

  if (SplashForm = nil) then
  begin
{    v := Application.Active;
    if v then
    begin}
      if WaitingForm <> nil then WaitingForm.Free;
      WaitingForm := TWaitingForm.Create(Application);
      WaitingForm.lText.Caption := AText;

      X := (Screen.Width - WaitingForm.Width) div 2;
      Y := (Screen.Height - WaitingForm.Height) div 2;

      if X < Screen.DesktopLeft then
        X := Screen.DesktopLeft;
      if Y < Screen.DesktopTop then
        Y := Screen.DesktopTop;

      WaitingForm.SetBounds(X, Y, WaitingForm.Width, WaitingForm.Height);

      ShowWindow(WaitingForm.Handle, SW_SHOWNOACTIVATE);
      ShowWindow(WaitingForm.lText.Handle, SW_SHOWNOACTIVATE);
      UpdateWindow(WaitingForm.lText.Handle);
//    end;
  end
  else
  begin
    SplashForm.lInfo.Caption := AText;
    SplashForm.Update;
  end;
end;

procedure ChangeWaiting(AText : ansistring);
  var
    v : boolean;
begin
  if AppLoading and SilentRun then Exit;

  if Assigned(Application.MainForm) then
    Application.MainForm.Update;

  if SplashForm = nil then
  begin
    v := Application.Active;
    if v then
    begin
      if (WaitingForm = nil) then ShowWaiting(AText)
      else
        with WaitingForm do
        begin
          lText.Caption := AText;
          UpdateWindow(WaitingForm.lText.Handle);
        end;
    end;
  end
  else
  begin
    SplashForm.lInfo.Caption := AText;
    SplashForm.Update;
  end;
end;

procedure HideWaiting;
begin
  if SplashForm = nil then
  begin
    if WaitingForm <> nil then
    begin
      WaitingForm.Free;
      WaitingForm := nil;
    end;
  end
  else
  begin
    SplashForm.lInfo.Caption := '';
    SplashForm.Update;
  end;

  if Assigned(Application.MainForm) then
    Application.MainForm.Update;
end;

{ TWaitingForm }

procedure TWaitingForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
  begin
    Style := WS_POPUP or WS_DISABLED;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST or WS_EX_NOACTIVATE;
  end;
end;

end.
