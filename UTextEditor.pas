//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Текстовый редактор
//
//------------------------------------------------------------------------------
unit UTextEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  cxControls, cxContainer, cxEdit, dxSkinsdxBarPainter, dxBar, System.Actions,
  Vcl.ActnList, cxPropertiesStore, cxSplitter, cxListBox, cxTextEdit, cxMemo,
  cxRichEdit, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls;

type
  TTextEditorForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    PropertiesStore: TcxPropertiesStore;
    ActionList: TActionList;
    BarManager: TdxBarManager;
    aExit: TAction;
    mText: TcxRichEdit;
    lbTag: TcxListBox;
    Splitter: TcxSplitter;
    PopupMenu: TdxBarPopupMenu;
    aCopyTag: TAction;
    dxBarButton1: TdxBarButton;
    aPasteTag: TAction;
    dxBarButton2: TdxBarButton;
    procedure FormShow(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure eEMAILKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aExitExecute(Sender: TObject);
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
  end;

function TextEdit(var ARTFText: string; ATagList : string = ''; AValues : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  types, UDatas, DTKUtils, UConsts, UOptions, UUtil, mesdlg, clipbrd;

function TextEdit(var ARTFText : string; ATagList : string = ''; AValues : boolean = false) : boolean;
  var
    vStringStream : TStringStream;
    vStringList : TStringList;
    s : string;
begin
with TTextEditorForm.Create(nil) do
    try
      PropertiesStore.StorageName := cIniFileName;
      PropertiesStore.RestoreFrom;

      vStringStream := TStringStream.Create(ARTFText);
      vStringStream.Position := 0;

      mText.Lines.LoadFromStream(vStringStream);

      vStringStream.Free;

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

procedure TTextEditorForm.SetOKEnabled;
begin
  bOK.Enabled := true;
end;

procedure TTextEditorForm.aCopyTagExecute(Sender: TObject);
begin
  if not FValues then
    ClipBoard.AsText := '[' + lbTag.Items.ValueFromIndex[lbTag.ItemIndex] + ']'
  else
    ClipBoard.AsText := lbTag.Items.ValueFromIndex[lbTag.ItemIndex];

  mText.SetFocus;
end;

procedure TTextEditorForm.aExitExecute(Sender: TObject);
begin
  if ShowMsg('Действительно закрыть окно редактора?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
    Close;
end;

procedure TTextEditorForm.aPasteTagExecute(Sender: TObject);
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

procedure TTextEditorForm.eEMAILKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TTextEditorForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TTextEditorForm.lbTagDblClick(Sender: TObject);
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

procedure TTextEditorForm.eNameChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
