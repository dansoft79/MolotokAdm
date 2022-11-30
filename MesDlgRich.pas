//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Диалоговое окно
//
//------------------------------------------------------------------------------
unit MesDlgRich;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, StdCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  UConsts, JvExControls, JvLabel, cxGraphics, cxControls, cxLookAndFeels,
  cxContainer, cxEdit, dxSkinsCore, cxImage, cxLabel, cxTextEdit, cxMemo,
  cxRichEdit;

type
  TShowMsgRichButton = (
    smbrNone,
    smbrYes,
    smbrNo,
    smbrOK,
    smbrCancel,
    smbrAbort,
    smbrRetry,
    smbrIgnore,
    smbrAll,
    smbrNoToAll,
    smbrYesToAll);

  TShowMsgRichButtons = set of TShowMsgRichButton;

  TURLProc = procedure (Sender: TcxCustomRichEdit; const URLText: string; Button: TMouseButton) of object;

  TShowMsgRichForm = class(TForm)
    pButtons: TPanel;
    lText: TcxRichEdit;
    procedure FormShow(Sender: TObject);
    procedure lTextPropertiesURLClick(Sender: TcxCustomRichEdit;
      const URLText: string; Button: TMouseButton);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FFileName, FCaption, FText : string;
    FButtons : TShowMsgRichButtons;
    FDefaultButton, FCancelButton : TShowMsgRichButton;
    procedure Initialize(ACaption, AText : string; AButtons : TShowMsgRichButtons; ADefaultButton, ACancelButton : TShowMsgRichButton);
  public
    { Public declarations }
  end;

const
  ADefHeight : integer = 400;
  ADefWidth : integer = 600;
  ADefFontSize : integer = 12;

function ShowMsgRich(ACaption, AText : string; AButtons : TShowMsgRichButtons = [smbrOK]; ADefaultButton : TShowMsgRichButton = smbrOK; ACancelButton : TShowMsgRichButton = smbrOK; AURLProc : TURLProc = nil) : integer;

function ShowMsgRichFile(ACaption, AFileName : string; AButtons : TShowMsgRichButtons = [smbrOK]; ADefaultButton : TShowMsgRichButton = smbrOK; ACancelButton : TShowMsgRichButton = smbrOK; AURLProc : TURLProc = nil) : integer;

const
  TextDX = 10;
  TextDY = 10;
  ButtonDX = 2;
  ButtonWidth = 75;

implementation

{$R *.DFM}

uses
  mainunit, Math, UUtil, ShellAPI;

type
  TButtonInfo =
  record
    Result : integer;
    Caption : string;
    Name : string;
  end;

const
  cButtonInfos : array [TShowMsgRichButton] of TButtonInfo = (
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

function ShowMsgRich(ACaption, AText : string; AButtons : TShowMsgRichButtons = [smbrOK]; ADefaultButton : TShowMsgRichButton = smbrOK; ACancelButton : TShowMsgRichButton = smbrOK; AURLProc : TURLProc = nil) : integer;
begin
  with TShowMsgRichForm.Create(nil) do
    try
      FCaption := ACaption;
      FText := AText;
      FFileName := '';
      FButtons := AButtons;
      FDefaultButton := ADefaultButton;
      FCancelButton := ACancelButton;

      if Assigned(AURLProc) then lText.Properties.OnURLClick := AURLProc;

      Result := ShowModal;
    finally
      Free;
    end;
end;

function ShowMsgRichFile(ACaption, AFileName : string; AButtons : TShowMsgRichButtons = [smbrOK]; ADefaultButton : TShowMsgRichButton = smbrOK; ACancelButton : TShowMsgRichButton = smbrOK; AURLProc : TURLProc = nil) : integer;
begin
  with TShowMsgRichForm.Create(nil) do
    try
      FCaption := ACaption;
      FText := '';
      FFileName := AFileName;
      FButtons := AButtons;
      FDefaultButton := ADefaultButton;
      FCancelButton := ACancelButton;

      if Assigned(AURLProc) then lText.Properties.OnURLClick := AURLProc;

      Result := ShowModal;
    finally
      Free;
    end;
end;

{ TShowMsgForm }

procedure TShowMsgRichForm.Initialize(ACaption, AText : string; AButtons: TShowMsgRichButtons; ADefaultButton, ACancelButton : TShowMsgRichButton);
  var
    i : TShowMsgRichButton;
    dx, n, l : integer;
begin
  if AButtons = [] then AButtons := [smbrOK];
  Caption := ACaption;

  if FFileName <> '' then
  begin
    lText.Lines.LoadFromFile(FFileName);
//    ReplaceTrialInfo;
    try
      DeleteFile(FFilename);
    except
    end;
  end
  else lText.Lines.Text := AText;

  n := 0;
  for i := smbrYes to smbrYesToAll do
    if i in AButtons then Inc(n);

  l := ButtonWidth * n + (n + 1) * ButtonDX;
//  ClientWidth := Max(Image.Width + lText.Width + TextDX, l);
  dx := ClientWidth div 2 - l div 2 + ButtonDX;
  for i := smbrYes to smbrYesToAll do
    if i in AButtons then
    begin
      with TcxButton.Create(pButtons) do
      begin
        Parent := pButtons;
        Left := dx;
        Top := 8;
        Width := ButtonWidth;
        Height := 25;
        Caption := cButtonInfos[i].Caption;
        Name := cButtonInfos[i].Name;
        ModalResult := cButtonInfos[i].Result;
        if ADefaultButton = i then 
        begin
          Default := true;
          SetFocus;
        end;
        if ACancelButton = i then Cancel := true;
      end;
      dx := dx + ButtonWidth + ButtonDX;
    end;

//  ClientHeight := Max(Image.Height, lText.Height + 2 * TextDY) + pButtons.Height;

//  lText.Top := TextDY;
//  lText.Left := Image.Width;

end;

procedure TShowMsgRichForm.lTextPropertiesURLClick(Sender: TcxCustomRichEdit;
  const URLText: string; Button: TMouseButton);
begin
  ShellExecute(0,'open', PChar(URLText),'','',SW_SHOW);
end;

procedure TShowMsgRichForm.FormCreate(Sender: TObject);
begin
  Width := ADefWidth;
  Height := ADefHeight;
  lText.Style.Font.Size := ADefFontSize;
end;

procedure TShowMsgRichForm.FormShow(Sender: TObject);
begin
  Initialize(FCaption, FText, FButtons, FDefaultButton, FCancelButton);
end;

end.
