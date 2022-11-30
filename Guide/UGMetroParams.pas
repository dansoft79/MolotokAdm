//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры станции метро
//
//------------------------------------------------------------------------------
unit UGMetroParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, dxCore, dxColorEdit;

type
  TGMetroParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cbDistrict: TcxComboBox;
    lDepartment: TcxLabel;
    cbColor: TcxLabel;
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

function GetMetroParams(
  var AActive, AIDDistrict, AColor : integer;
  var AName, ATag, AComment : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetMetroParams(
  var AActive, AIDDistrict, AColor : integer;
  var AName, ATag, AComment : string) : boolean;
begin
  with TGMetroParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;

      FillComboBoxExSQL(cbDistrict, 'select Name, ID from DistrictView order by Name', 'Name', 'ID');
      SetItemIndexByID(cbDistrict, AIDDistrict);

      eName.Text := AName;
      eComment.Text := AComment;

      eTag.Text := ATag;
      eColor.EditValue := AColor;

      eColor.OnKeyDown := eKeyDown;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AIDDistrict := GetIDByItemIndex(cbDistrict);
        AName := eName.Text;
        AComment := eComment.Text;

        ATag := Trim(eTag.Text);
        AColor := eColor.EditValue;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGMetroParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGMetroParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbDistrict.ItemIndex <> -1) and
    (Trim(eName.Text) <> '') and
    (Trim(eTag.Text) <> '');
end;

procedure TGMetroParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGMetroParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
