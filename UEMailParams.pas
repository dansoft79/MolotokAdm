//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Редактор электронного сообщения
//
//------------------------------------------------------------------------------
unit UEMailParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxPropertiesStore, cxMemo,
  cxMaskEdit, cxButtonEdit, Vcl.ComCtrls, JvComponentBase, JvRichEditToHtml,
  cxRichEdit, dxSkinsdxBarPainter, cxFontNameComboBox, cxSpinEdit,
  cxColorComboBox, cxCheckBox, dxBar, cxBarEditItem, cxClasses, System.Actions,
  Vcl.ActnList, cxGroupBox, cxListBox, frxClass, cxCustomListBox;

type
  TEMailParamsForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel1: TcxLabel;
    PropertiesStore: TcxPropertiesStore;
    eSubject: TcxTextEdit;
    cxLabel3: TcxLabel;
    eEMAIL: TcxButtonEdit;
    gbMessge: TcxGroupBox;
    BarDockControlMessage: TdxBarDockControl;
    ActionList: TActionList;
    aBold: TAction;
    aItalic: TAction;
    aUnderline: TAction;
    aLeft: TAction;
    aCenter: TAction;
    aRight: TAction;
    BarManager: TdxBarManager;
    BarManagerBar4: TdxBar;
    FontName: TcxBarEditItem;
    FontSize: TcxBarEditItem;
    FontColor: TcxBarEditItem;
    bBold: TdxBarButton;
    bItalic: TdxBarButton;
    bUnderline: TdxBarButton;
    bLeft: TdxBarButton;
    bCenter: TdxBarButton;
    bRight: TdxBarButton;
    mConvert: TRichEdit;
    mText: TcxRichEdit;
    cxLabel2: TcxLabel;
    lbFiles: TcxListBox;
    Report: TfrxReport;
    bEdit: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure eEMAILKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eEMAILPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FontSizePropertiesChange(Sender: TObject);
    procedure FontSizePropertiesEditValueChanged(Sender: TObject);
    procedure bBoldClick(Sender: TObject);
    procedure aBoldExecute(Sender: TObject);
    procedure aItalicExecute(Sender: TObject);
    procedure aUnderlineExecute(Sender: TObject);
    procedure aLeftExecute(Sender: TObject);
    procedure aCenterExecute(Sender: TObject);
    procedure aRightExecute(Sender: TObject);
    procedure mTextSelectionChange(Sender: TObject);
    procedure FontColorChange(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure eEMAILDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbFilesDblClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
  private
    { Private declarations }
    FUpdating : boolean;
    FFiles : TStringList;
    FTagList : string;
  public
    { Public declarations }
    procedure SetOKEnabled;
    procedure FillFilesList;
    function CurrText: TTextAttributes;
  end;

function EditEMailParams(
  var AEMAIL, ASubject, AText: string; AFiles : string = ''; ATagList : string = '') : boolean;

implementation

{$R *.dfm}

uses
  types, shellapi, URTFEditor,
  UDatas, DTKUtils, UConsts, UOptions, UUtil, USelectEMailMulti;

function EditEMailParams(
  var AEMAIL, ASubject, AText : string; AFiles : string = ''; ATagList : string = '') : boolean;
  var
    vStringStream : TStringStream;
    vStringList : TStringList;
    s : string;
begin
  with TEMailParamsForm.Create(nil) do
    try
      PropertiesStore.StorageName := cIniFileName;
      PropertiesStore.RestoreFrom;

      FTagList := ATagList;
      bEdit.Visible := ATagList <> '';

      eEMail.Text := AEMAIL;
      eSubject.Text := ASubject;

      vStringStream := TStringStream.Create(AText);
      vStringStream.Position := 0;

      mText.Lines.LoadFromStream(vStringStream);

      vStringStream.Free;

      FFiles := TStringList.Create;
      FFiles.Delimiter := ';';
      FFiles.StrictDelimiter := true;
      FFiles.DelimitedText := AFiles;

      FillFilesList;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AEMAIL := Trim(eEMail.Text);
        ASubject := Trim(eSubject.Text);

        vStringStream := TStringStream.Create;
        mText.Lines.SaveToStream(vStringStream);
        vStringStream.Position := 0;
        mConvert.Lines.Clear;
        mConvert.Lines.LoadFromStream(vStringStream);
        vStringStream.Free;

        vStringList := TStringList.Create;

        Datas.RichEditToHtml.ConvertToHtmlStrings(mConvert, vStringList);

        AText := vStringList.Text;

        vStringList.Free;
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TEMailParamsForm.SetOKEnabled;
begin
  bOK.Enabled := Trim(eEMail.Text) <> '';
end;

procedure TEMailParamsForm.aBoldExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  if bBold.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TEMailParamsForm.aCenterExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  mText.Paragraph.Alignment := TAlignment(2);
end;

procedure TEMailParamsForm.aItalicExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  if bItalic.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TEMailParamsForm.aLeftExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  mText.Paragraph.Alignment := TAlignment(0);
end;

procedure TEMailParamsForm.aRightExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  mText.Paragraph.Alignment := TAlignment(1);
end;

procedure TEMailParamsForm.aUnderlineExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  if bUnderline.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TEMailParamsForm.bBoldClick(Sender: TObject);
begin
  if bBold.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TEMailParamsForm.bEditClick(Sender: TObject);
  var
    s : string;
    vStringStream : TStringStream;
begin
  vStringStream := TStringStream.Create;
  mText.Lines.SaveToStream(vStringStream);
  vStringStream.Position := 0;
  s := vStringStream.DataString;
  vStringStream.Free;

  if RTFEdit(s, FTagList, true) then
  begin
    vStringStream := TStringStream.Create(s);
    vStringStream.Position := 0;
    mText.Lines.Clear;
    mText.Lines.LoadFromStream(vStringStream);
    vStringStream.Free;
  end;

  mText.SetFocus;
end;

function TEMailParamsForm.CurrText: TTextAttributes;
begin
  if mText.SelLength > 0 then Result := mText.SelAttributes
  else Result := mText.DefAttributes;
end;

procedure TEMailParamsForm.eEMAILDblClick(Sender: TObject);
begin
  eEMAILPropertiesButtonClick(Sender, 0);
end;

procedure TEMailParamsForm.eEMAILKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TEMailParamsForm.FillFilesList;
  var
    i : integer;
    s : string;
begin
  lbFiles.Clear;
  for i := 0 to FFiles.Count - 1 do
  begin
    s := FFiles[i];
    lbFiles.Items.Add(ExtractFileName(s));
  end;
end;

procedure TEMailParamsForm.FontColorChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Color := FontColor.EditValue;
end;

procedure TEMailParamsForm.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;

  CurrText.Name := FontName.EditValue;
end;

procedure TEMailParamsForm.FontSizePropertiesChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := FontSize.EditValue;
end;

procedure TEMailParamsForm.FontSizePropertiesEditValueChanged(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := FontSize.EditValue;
end;

procedure TEMailParamsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PropertiesStore.StoreTo(false);
end;

procedure TEMailParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TEMailParamsForm.lbFilesDblClick(Sender: TObject);
  var
    f, e : string;
begin
  if lbFiles.ItemIndex < 0 then Exit;

  f := FFiles[lbFiles.ItemIndex];
  e := extractFileExt(f);
  if AnsiLowerCase(e) = '.fp3' then
  begin
    Report.PreviewPages.LoadFromFile(f);
    Report.ShowPreparedReport;
  end
  else
  begin
    ShellExecute(0,'open', PChar(f), '', '', SW_SHOW);
  end;
end;

procedure TEMailParamsForm.mTextSelectionChange(Sender: TObject);
begin
  if FUpdating then Exit;

  with mText.Paragraph do
  try
    FUpdating := True;

    bBold.Down := fsBold in mText.SelAttributes.Style;
    bItalic.Down := fsItalic in mText.SelAttributes.Style;
    bUnderline.Down := fsUnderline in mText.SelAttributes.Style;

    FontSize.EditValue := IntToStr(mText.SelAttributes.Size);
    FontName.EditValue := mText.SelAttributes.Name;
    FontColor.EditValue := mText.SelAttributes.Color;

    case Ord(Alignment) of
      0: bLeft.Down := True;
      1: bRight.Down := True;
      2: bCenter.Down := True;
    end;
  finally
    FUpdating := False;
  end;
end;

procedure TEMailParamsForm.eEMAILPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    s : string;
begin
  s := '';
  if SelectEMailMulti(s) then
  begin
    eEMail.Text := s;
  end;
end;

procedure TEMailParamsForm.eNameChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
