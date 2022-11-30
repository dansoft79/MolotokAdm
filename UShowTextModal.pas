//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно просмотра текста
//
//------------------------------------------------------------------------------
unit UShowTextModal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, cxGraphics, cxContainer,
  cxEdit, cxTextEdit, cxMemo, cxRichEdit, cxControls, dxStatusBar, dxBar,
  ActnList, cxClasses, cxLookAndFeels, dxSkinsCore,  
    dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter, cxLookAndFeelPainters,
  System.Actions;

type
  TModalTextForm = class(TForm)
    Panel: TPanel;
    FindDialog: TFindDialog;
    PrinterSetupDialog: TPrinterSetupDialog;
    SaveDialog: TSaveDialog;
    StatusBar: TdxStatusBar;
    Memo: TcxRichEdit;
    ActionList: TActionList;
    aOK: TAction;
    aSave: TAction;
    BarManager: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton4: TdxBarButton;
    aPrint: TAction;
    aFind: TAction;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    OpenDialog: TOpenDialog;
    ReplaceDialog: TReplaceDialog;
    dxBarButton5: TdxBarButton;
    aCancel: TAction;
    aReplace: TAction;
    aOpen: TAction;
    dxBarButton6: TdxBarButton;
    procedure MemoChange(Sender: TObject);
    procedure MemoSelectionChange(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemoPropertiesSelectionChange(Sender: TObject);
    procedure MemoPropertiesChange(Sender: TObject);
    procedure FindOne(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aReplaceExecute(Sender: TObject);
    procedure ReplaceDialogReplace(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateInfo;
  end;

function ShowTextModal(AText : string; ACaption : string = '') : integer;

implementation

{$R *.dfm}

uses
  UOptions, UUtil, mesdlg, MainUnit;

function ShowTextModal(AText : string; ACaption : string = '') : integer;
  var
    vForm : TModalTextForm;
begin
  vForm := TModalTextForm.Create(Application);
  with vForm do
  begin
    Caption := ACaption;
    Memo.Lines.Text := AText;

    Result := ShowModal;
  end;
end;

procedure TModalTextForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TModalTextForm.aFindExecute(Sender: TObject);
begin
  FindDialog.Execute;
end;

procedure TModalTextForm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TModalTextForm.aOpenExecute(Sender: TObject);
begin
  if OpenDialog.Execute then
    memo.Lines.LoadFromFile(OpenDialog.FileName);
end;

procedure TModalTextForm.aPrintExecute(Sender: TObject);
begin
  if PrinterSetupDialog.Execute then
  begin
    Memo.Print(Caption);
  end;
end;

procedure TModalTextForm.aReplaceExecute(Sender: TObject);
begin
  ReplaceDialog.Execute;
end;

procedure TModalTextForm.aSaveExecute(Sender: TObject);
begin
  if SaveDialog.Execute then
    memo.Lines.SaveToFile(SaveDialog.FileName);
end;

procedure TModalTextForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TModalTextForm.FormCreate(Sender: TObject);
begin
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TModalTextForm.MemoChange(Sender: TObject);
begin
  UpdateInfo;
end;

procedure TModalTextForm.MemoPropertiesChange(Sender: TObject);
begin
  UpdateInfo;
end;

procedure TModalTextForm.MemoPropertiesSelectionChange(Sender: TObject);
begin
  UpdateInfo;
end;

procedure TModalTextForm.UpdateInfo;
var
  CharPos: TPoint;
begin
  if not Active then Exit;  
  CharPos := Memo.CaretPos;
  StatusBar.Panels[1].Text := IntToStr(CharPos.Y + 1);
  StatusBar.Panels[3].Text := IntToStr(CharPos.X + 1);
  StatusBar.Panels[5].Text := IntToStr(Memo.Lines.Count);
end;

procedure TModalTextForm.MemoSelectionChange(Sender: TObject);
begin
  UpdateInfo;
end;

procedure TModalTextForm.ReplaceDialogReplace(Sender: TObject);
var
  ReplacedCount, OldSelStart, PrevSelStart: Integer;
  S: string;
begin
  with Memo, TReplaceDialog(Sender) do
  begin
    ReplacedCount := 0;
    OldSelStart := SelStart;
    if frReplaceAll in Options then
      Screen.Cursor := crHourglass;
    repeat
      if (SelLength > 0) and ((SelText = FindText) or
        (not (frMatchCase in Options) and
         (AnsiUpperCase(SelText) = AnsiUpperCase(FindText)))) then
      begin
        SelText := ReplaceText;
        Inc(ReplacedCount);
      end;
      PrevSelStart := SelStart;
      FindOne(Sender);
    until not (frReplaceAll in Options) or (SelStart = PrevSelStart);
    if frReplaceAll in Options then
    begin
      Screen.Cursor := crDefault;
      if ReplacedCount = 0 then S := 'Текст не найден!'
      else
      begin
        SelStart := OldSelStart;
        S := Format('Произведено замен: %d', [ReplacedCount]);
      end;
      ShowMsg(s, smtInformation, [smbOK], smbOK, smbOK);
    end;
  end;
end;

procedure TModalTextForm.FindOne(Sender: TObject);
var
  StartPos, FindLength, FoundAt: Integer;
  Flags: TSearchTypes;
  P: TPoint;
  CaretR, R, IntersectR: TRect;
begin
  with Memo, TFindDialog(Sender) do
  begin
    if frDown in Options then
    begin
      if SelLength = 0 then StartPos := SelStart
      else StartPos := SelStart + SelLength;
      FindLength := Length(Text) - StartPos;
    end
    else
    begin
      StartPos := SelStart;
      FindLength := -StartPos;
    end;
    Flags := [];
    if frMatchCase in Options then Include(Flags, stMatchCase);
    if frWholeWord in Options then Include(Flags, stWholeWord);
    Screen.Cursor := crHourglass;
    FoundAt := Memo.FindText(FindText, StartPos, FindLength, Flags);
    if not (frReplaceAll in Options) then Screen.Cursor := crDefault;
    if FoundAt > -1 then
      if frReplaceAll in Options then
      begin
        SelStart := FoundAt;
        SelLength := Length(FindText);
      end
      else
      begin
        SetFocus;
        SelStart := FoundAt;
        SelLength := Length(FindText);

        GetCaretPos(P);
        P := ClientToScreen(P);
        CaretR := Rect(P.X, P.Y, P.X + 2, P.Y + 20);
        GetWindowRect(Handle, R);
        if IntersectRect(IntersectR, CaretR, R) then
          if P.Y < Screen.Height div 2 then
            Top := P.Y + 40
          else
            Top := P.Y - (R.Bottom - R.Top + 20);
      end
    else
      if not (frReplaceAll in Options) then
        ShowMsg('Текст не найден!', smtInformation, [smbOK], smbOK, smbOK);
  end;
end;

end.
