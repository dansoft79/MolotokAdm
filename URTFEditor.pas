//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Редактор RTF
//
//------------------------------------------------------------------------------
unit URTFEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxPropertiesStore, cxMemo,
  cxMaskEdit, cxButtonEdit, Vcl.ComCtrls, JvComponentBase, JvRichEditToHtml,
  cxRichEdit, dxSkinsdxBarPainter, cxFontNameComboBox, cxSpinEdit,
  cxColorComboBox, cxCheckBox, dxBar, cxBarEditItem, cxClasses, System.Actions,
  Vcl.ActnList, cxGroupBox, cxListBox, cxSplitter, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxCustomListBox;

type
  TRTFEditorForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    PropertiesStore: TcxPropertiesStore;
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
    BarDockControlMessage: TdxBarDockControl;
    aExit: TAction;
    mText: TcxRichEdit;
    lbTag: TcxListBox;
    Splitter: TcxSplitter;
    PopupMenu: TdxBarPopupMenu;
    aCopyTag: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    aPasteTag: TAction;
    procedure FormShow(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure eEMAILKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FontSizePropertiesChange(Sender: TObject);
    procedure FontSizePropertiesEditValueChanged(Sender: TObject);
    procedure bBoldClick(Sender: TObject);
    procedure aBoldExecute(Sender: TObject);
    procedure aItalicExecute(Sender: TObject);
    procedure aUnderlineExecute(Sender: TObject);
    procedure aLeftExecute(Sender: TObject);
    procedure aCenterExecute(Sender: TObject);
    procedure aRightExecute(Sender: TObject);
    procedure FontColorChange(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure mTextSelectionChange(Sender: TObject);
    procedure lbTagDblClick(Sender: TObject);
    procedure aCopyTagExecute(Sender: TObject);
    procedure aPasteTagExecute(Sender: TObject);
  private
    { Private declarations }
    FValues : boolean;
    FUpdating : boolean;
  public
    { Public declarations }
    procedure SetOKEnabled;
    function CurrText: TTextAttributes;
  end;

function RTFEdit(var ARTFText: string; ATagList : string = ''; AValues : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  types, UDatas, DTKUtils, UConsts, UOptions, UUtil, mesdlg, clipbrd;

function RTFEdit(var ARTFText : string; ATagList : string = ''; AValues : boolean = false) : boolean;
  var
    vStringStream : TStringStream;
    vStringList : TStringList;
    s : string;
begin
  with TRTFEditorForm.Create(nil) do
    try
      PropertiesStore.StorageName := cIniFileName;
      PropertiesStore.RestoreFrom;

      vStringStream := TStringStream.Create(ARTFText);
      vStringStream.Position := 0;

      mText.Lines.LoadFromStream(vStringStream);

      vStringStream.Free;

      mTextSelectionChange(mText);

      lbTag.Items.Delimiter := ';';
      lbTag.Items.StrictDelimiter := true;
      lbTag.Items.DelimitedText := ATagList;

      lbTag.Visible := ATagList <> '';
      Splitter.Visible := ATagList <> '';

      FValues := AValues;

      Result := ShowModal = mrOK;

      if Result then
      begin
        vStringList := TStringList.Create;

        vStringStream := TStringStream.Create;

        mText.Lines.SaveToStream(vStringStream);

        vStringStream.Position := 0;

        ARTFText := vStringStream.DataString;

        vStringList.Free;

        PropertiesStore.StoreTo(false);
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TRTFEditorForm.SetOKEnabled;
begin
  bOK.Enabled := true;
end;

procedure TRTFEditorForm.aBoldExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  if bBold.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TRTFEditorForm.aCenterExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  mText.Paragraph.Alignment := TAlignment(2);
end;

procedure TRTFEditorForm.aCopyTagExecute(Sender: TObject);
begin
  if not FValues then
    ClipBoard.AsText := '[' + lbTag.Items.ValueFromIndex[lbTag.ItemIndex] + ']'
  else
    ClipBoard.AsText := lbTag.Items.ValueFromIndex[lbTag.ItemIndex];

  mText.SetFocus;
end;

procedure TRTFEditorForm.aExitExecute(Sender: TObject);
begin
  if ShowMsg('Действительно закрыть окно редактора?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
    Close;
end;

procedure TRTFEditorForm.aItalicExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  if bItalic.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TRTFEditorForm.aLeftExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  mText.Paragraph.Alignment := TAlignment(0);
end;

procedure TRTFEditorForm.aPasteTagExecute(Sender: TObject);
  var
    vClp, s : string;
begin
  s := lbTag.Items.ValueFromIndex[lbTag.Itemindex];

  vClp := ClipBoard.AsText;

  if not FValues then
    ClipBoard.AsText := '[' + lbTag.Items.ValueFromIndex[lbTag.ItemIndex] + ']'
  else
    ClipBoard.AsText := lbTag.Items.ValueFromIndex[lbTag.ItemIndex];

  mText.Perform(WM_PASTE, 0, 0);

  ClipBoard.AsText := vClp;

  mText.SetFocus;
end;

procedure TRTFEditorForm.aRightExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  mText.Paragraph.Alignment := TAlignment(1);
end;

procedure TRTFEditorForm.aUnderlineExecute(Sender: TObject);
begin
  if FUpdating then Exit;
  if bUnderline.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TRTFEditorForm.bBoldClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if bBold.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

function TRTFEditorForm.CurrText: TTextAttributes;
begin
  if mText.SelLength > 0 then Result := mText.SelAttributes
  else Result := mText.DefAttributes;
end;

procedure TRTFEditorForm.eEMAILKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TRTFEditorForm.mTextSelectionChange(Sender: TObject);
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

procedure TRTFEditorForm.FontColorChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Color := FontColor.EditValue;
end;

procedure TRTFEditorForm.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;

  CurrText.Name := FontName.EditValue;
end;

procedure TRTFEditorForm.FontSizePropertiesChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := FontSize.EditValue;
end;

procedure TRTFEditorForm.FontSizePropertiesEditValueChanged(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := FontSize.EditValue;
end;

procedure TRTFEditorForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TRTFEditorForm.lbTagDblClick(Sender: TObject);
  var
    vClp, s : string;
begin
  s := lbTag.Items.ValueFromIndex[lbTag.Itemindex];

  vClp := ClipBoard.AsText;

  if not FValues then
    ClipBoard.AsText := '[' + lbTag.Items.ValueFromIndex[lbTag.ItemIndex] + ']'
  else
    ClipBoard.AsText := lbTag.Items.ValueFromIndex[lbTag.ItemIndex];

  mText.Perform(WM_PASTE, 0, 0);

  ClipBoard.AsText := vClp;

  mText.SetFocus;
end;

procedure TRTFEditorForm.eNameChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
