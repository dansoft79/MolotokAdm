//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно прогресса выполнения операции
//
//------------------------------------------------------------------------------
unit UProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Gauges, StdCtrls, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxProgressBar, cxLabel, Menus, cxLookAndFeelPainters, cxButtons,
  dxSkinsCore, dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels;

type
  TProgressForm = class(TForm)
    pClient: TcxLabel;
    Gauge: TcxProgressBar;
    lText: TcxLabel;
    lTime: TcxLabel;
    lLast: TcxLabel;
    lAll: TcxLabel;
    stTime: TcxLabel;
    stLast: TcxLabel;
    stAll: TcxLabel;
    bCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
  private
    { Private declarations }
    FConfirmTerminate, FTerminated : boolean;
    FLastProgress : double;
  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  end;

const
  ProgressForm : TProgressForm = nil;
  ProgressDelimiter : string = ' - ';

procedure ShowProgress(ATitle : string; ACancelButton : boolean = false; AConfirmTerminate : boolean = true);

procedure ChangeProgress(AProgress : double; AText : string = '');

function TerminatedProgress : boolean;

procedure HideProgress;

implementation

{$R *.DFM}

uses
  UUtil, DateUtils, DTKUtils, MesDlg, MainUnit, UOptions;

procedure ShowProgress(ATitle : string; ACancelButton : boolean = false; AConfirmTerminate : boolean = true);
  var
    X, Y : integer;
begin
  if AppLoading and SilentRun then Exit;

  if ProgressForm = nil then ProgressForm := TProgressForm.Create(Application);
  ProgressForm.FConfirmTerminate := AConfirmTerminate;
  ProgressForm.FTerminated := false;
  ProgressForm.bCancel.Visible := ACancelButton;
  ProgressForm.Caption := ATitle;
  ProgressForm.Gauge.Position := 0;
  ProgressForm.lText.Caption := ATitle;

  X := (Screen.Width - ProgressForm.Width) div 2;
  Y := (Screen.Height - ProgressForm.Height) div 2;

  if X < Screen.DesktopLeft then
    X := Screen.DesktopLeft;
  if Y < Screen.DesktopTop then
    Y := Screen.DesktopTop;

  ProgressForm.SetBounds(X, Y, ProgressForm.Width, ProgressForm.Height);

  ShowWindow(ProgressForm.Handle, SW_SHOWNOACTIVATE);
  ShowWindow(ProgressForm.pClient.Handle, SW_SHOWNOACTIVATE);

  ShowWindow(ProgressForm.lText.Handle, SW_SHOWNOACTIVATE);
  ShowWindow(ProgressForm.Gauge.Handle, SW_SHOWNOACTIVATE);

  ShowWindow(ProgressForm.lTime.Handle, SW_SHOWNOACTIVATE);
  ShowWindow(ProgressForm.stTime.Handle, SW_SHOWNOACTIVATE);

  ShowWindow(ProgressForm.lLast.Handle, SW_SHOWNOACTIVATE);
  ShowWindow(ProgressForm.stLast.Handle, SW_SHOWNOACTIVATE);

  ShowWindow(ProgressForm.lAll.Handle, SW_SHOWNOACTIVATE);
  ShowWindow(ProgressForm.stAll.Handle, SW_SHOWNOACTIVATE);

  if ProgressForm.bCancel.Visible then
    ShowWindow(ProgressForm.bCancel.Handle, SW_SHOWNOACTIVATE);

  UpdateWindow(ProgressForm.lText.Handle);
  UpdateWindow(ProgressForm.Gauge.Handle);

  UpdateWindow(ProgressForm.lTime.Handle);
  UpdateWindow(ProgressForm.stTime.Handle);

  UpdateWindow(ProgressForm.lLast.Handle);
  UpdateWindow(ProgressForm.stLast.Handle);

  UpdateWindow(ProgressForm.lAll.Handle);
  UpdateWindow(ProgressForm.stAll.Handle);

  if ProgressForm.bCancel.Visible then
    UpdateWindow(ProgressForm.bCancel.Handle);

  PrepareNow;    
end;

procedure ChangeProgress(AProgress : double; AText : string = '');
  var
    vTime : TTime;
    vMS, vAllMS, vLast : Int64;
begin
  if AppLoading and SilentRun then Exit;

  if ProgressForm = nil then ShowProgress('');
  with ProgressForm do
  try
    if not FTerminated then
    begin
      lText.Caption := Caption;
      if (Trim(AText) <> '') and (Trim(Caption) <> '') then
        lText.Caption := lText.Caption + ProgressDelimiter;
      lText.Caption := lText.Caption + AText;
    end
    else
      lText.Caption := 'Прерываение операции...';
    Gauge.Position := trunc(Gauge.Properties.Max * AProgress / 100);
    if AProgress <> FLastProgress then
    begin
      try
        vTime := CurrentDateTime;
      except
        vTime := 0;
      end;
      stTime.Caption := TimeToStr(vTime);
      vMS := TimeToMSecs(vTime);
      if AProgress <> 0 then
      begin
        vAllMS := round(100 * vMS / AProgress);
        vLast := vAllMS - vMS;
      end
      else
      begin
        vAllMS := 0;
        vLast := 0;
      end;
      stLast.Caption := TimeToStr(MSecsToTime(vLast));
      stAll.Caption := TimeToStr(MSecsToTime(vAllMS));
      if Assigned(Application) then Application.MainForm.Update;
      FLastProgress := AProgress;
    end;

    UpdateWindow(ProgressForm.Handle);

    UpdateWindow(ProgressForm.pClient.Handle);

    UpdateWindow(ProgressForm.lText.Handle);
    UpdateWindow(ProgressForm.Gauge.Handle);

    UpdateWindow(ProgressForm.lTime.Handle);
    UpdateWindow(ProgressForm.stTime.Handle);

    UpdateWindow(ProgressForm.lLast.Handle);
    UpdateWindow(ProgressForm.stLast.Handle);

    UpdateWindow(ProgressForm.lAll.Handle);
    UpdateWindow(ProgressForm.stAll.Handle);

    if ProgressForm.bCancel.Visible then
      UpdateWindow(ProgressForm.bCancel.Handle);

    Application.ProcessMessages;
  except
  end;
end;

function TerminatedProgress : boolean;
begin
  if ProgressForm = nil then
    Result := false
  else
    Result := ProgressForm.FTerminated;
end;

procedure HideProgress;
begin
  if ProgressForm <> nil then
  begin
    ProgressForm.Free;
    ProgressForm := nil;
  end;
end;

procedure TProgressForm.bCancelClick(Sender: TObject);
begin
  if FConfirmTerminate and (ShowMsg('Действительно прервать операцию?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes) then
  begin
    FTerminated := true;
    lText.Caption := 'Прерываение операции...';
    bCancel.Enabled := false;

    UpdateWindow(ProgressForm.Handle);

    UpdateWindow(ProgressForm.pClient.Handle);

    UpdateWindow(ProgressForm.lText.Handle);
    UpdateWindow(ProgressForm.Gauge.Handle);

    UpdateWindow(ProgressForm.lTime.Handle);
    UpdateWindow(ProgressForm.stTime.Handle);

    UpdateWindow(ProgressForm.lLast.Handle);
    UpdateWindow(ProgressForm.stLast.Handle);

    UpdateWindow(ProgressForm.lAll.Handle);
    UpdateWindow(ProgressForm.stAll.Handle);
  end;
end;

procedure TProgressForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
  begin
    Style := WS_POPUP;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST or WS_EX_NOACTIVATE;
  end;
end;

procedure TProgressForm.FormCreate(Sender: TObject);
begin
  FLastProgress := -1;
  Gauge.Properties.Max := Gauge.Width;
end;

end.
