//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры категории исполнителя
//
//------------------------------------------------------------------------------
unit UGWorkerClassParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, cxSpinEdit, dxCore, dxColorEdit;

type
  TGWorkerClassParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    eComment: TcxMemo;
    cxLabel1: TcxLabel;
    cbColor: TcxLabel;
    cbWorkClass: TcxComboBox;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    ePriority: TcxSpinEdit;
    eTag: TcxMaskEdit;
    cxLabel5: TcxLabel;
    eColor: TdxColorEdit;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetWorkerClassParams(
  var AActive, AIDWorkClass : integer;
  var AName : string;
  var ATag : string;
  var APriority : integer;
  var AColor : integer;
  var AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetWorkerClassParams(
  var AActive, AIDWorkClass : integer;
  var AName : string;
  var ATag : string;
  var APriority : integer;
  var AColor : integer;
  var AComment : string) : boolean;
begin
  with TGWorkerClassParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;

      FillComboBoxExSQL(cbWorkClass, 'select ID, Name from WorkClass order by Name', 'Name', 'ID');
      SetItemIndexByID(cbWorkClass, AIDWorkClass);

      eName.Text := AName;
      eTag.Text := ATag;
      ePriority.Value := APriority;
      eColor.EditValue := AColor;
      eComment.Text := AComment;

      eColor.OnKeyDown := eKeyDown;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AIDWorkClass := GetIDByItemIndex(cbWorkClass);
        APriority := ePriority.Value;
        AName := Trim(eName.Text);
        ATag := Trim(eTag.Text);
        AColor := eColor.EditValue;
        AComment := Trim(eComment.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGWorkerClassParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkerClassParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbWorkClass.ItemIndex <> -1) and
    (Trim(eName.Text) <> '') and
    (Trim(eTag.Text) <> '');
end;

procedure TGWorkerClassParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGWorkerClassParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
