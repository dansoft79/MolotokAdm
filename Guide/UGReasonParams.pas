//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры причины
//
//------------------------------------------------------------------------------
unit UGReasonParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox;

type
  TGReasonParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    cbStatusType: TcxComboBox;
    cbCommentRequired: TcxCheckBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetReasonParams(
  var AActive, AIDStatusType : integer;
  var AName, AComment : string;
  var ACommentRequired : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetReasonParams(
  var AActive, AIDStatusType : integer;
  var AName, AComment : string;
  var ACommentRequired : integer) : boolean;
begin
  with TGReasonParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      FillComboBoxExSQL(cbStatusType, 'select Name, ID from StatusTypeView order by Name', 'Name', 'ID');
      SetItemIndexByID(cbStatusType, AIDStatusType);

      eName.Text := AName;
      eComment.Text := AComment;

      cbCommentRequired.Checked := ACommentRequired = 1;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);

        AIDStatusType := GetIDByItemIndex(cbStatusType);
        AName := eName.Text;
        AComment := eComment.Text;

        ACommentRequired := BooleanToInt(cbCommentRequired.Checked);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGReasonParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGReasonParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbStatusType.ItemIndex <> -1) and
    (Trim(eName.Text) <> '');
end;

procedure TGReasonParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGReasonParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
