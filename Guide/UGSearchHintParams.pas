//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры поисковой подсказки
//
//------------------------------------------------------------------------------
unit UGSearchHintParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, dxCore, dxColorEdit;

type
  TGSearchHintParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eHintText: TcxTextEdit;
    cxLabel3: TcxLabel;
    cbActive: TcxCheckBox;
    cxLabel1: TcxLabel;
    cbWorkClass: TcxComboBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetSearchHintParams(
  var AActive : integer;
  var AHintText : string;
  var AIDWorkClass : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetSearchHintParams(
  var AActive : integer;
  var AHintText : string;
  var AIDWorkClass : integer) : boolean;
begin
  with TGSearchHintParamForm.Create(nil) do
    try
      cbActive.Checked := AActive = 1;
      eHintText.Text := AHintText;
      FillComboBoxExSQL(cbWorkClass, 'select ID, Name from WorkClass order by Name', 'Name', 'ID');
      SetItemIndexByID(cbWorkClass, AIDWorkClass);

      Result := ShowModal = mrOK;

      if Result then
      begin
        AActive := BooleanToInt(cbActive.Checked);
        AHintText := eHintText.Text;
        AIDWorkClass := GetIDByItemIndex(cbWorkClass);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGSearchHintParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGSearchHintParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eHintText.Text) <> '');
end;

procedure TGSearchHintParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGSearchHintParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
