//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры роли
//
//------------------------------------------------------------------------------
unit UGUserRoleParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox;

type
  TDepartmentParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetUserROleParams(
  var AActive : integer;
  var AName, AComment : string;
  var ARoleType : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts;

function GetUserRoleParams(
  var AActive : integer;
  var AName, AComment : string;
  var ARoleType : integer) : boolean;
begin
  with TDepartmentParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      eName.Text := AName;
//      eRoleType.ItemIndex := ARoleType;
      eComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AName := eName.Text;
//        ARoleType := eRoleType.ItemIndex;
        AComment := eComment.Text;
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TDepartmentParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TDepartmentParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '');
end;

procedure TDepartmentParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TDepartmentParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
