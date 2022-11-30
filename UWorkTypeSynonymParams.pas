//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры синонима видов работ
//
//------------------------------------------------------------------------------
unit UWorkTypeSynonymParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxButtonEdit;

type
  TWorkTypeSynonymParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    eWorkType: TcxButtonEdit;
    eName: TcxTextEdit;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eRequestTextPropertiesChange(Sender: TObject);
    procedure eWorkTypeDblClick(Sender: TObject);
    procedure eNamePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FIDWorkType : integer;
  public
    { Public declarations }
    procedure SetOKEnabled;
    procedure UpdateWorkType;
  end;

function GetWorkTypeSynonymParams(
  var AActive : integer;
  var AIDWorkType : integer;
  var AName : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, USelectWorkType;

function GetWorkTypeSynonymParams(
  var AActive : integer;
  var AIDWorkType : integer;
  var AName : string) : boolean;
begin
  with TWorkTypeSynonymParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;

      FIDWorkType := AIDWorkType;
      UpdateWorkType;

      eName.Text := AName;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AIDWorkType := FIDWorkType;
        AName := Trim(eName.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TWorkTypeSynonymParamForm.ButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if SelectWorkType(FIDWorkType) then
  begin
    UpdateWorkType;
  end;
  SetOKEnabled;
end;

procedure TWorkTypeSynonymParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TWorkTypeSynonymParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (FIDWorkType <> 0) and
    (Trim(eName.Text) <> '');
end;

procedure TWorkTypeSynonymParamForm.UpdateWorkType;
  var
    v : variant;
begin
  if FIDWorkType <> 0 then
  begin
    v := Datas.ReadValuesSQL('select Name, WorkClassInfo(ID_WorkClass) as WCInfo from WorkType where ID = ' + IntToStr(FIDWorkType), 'Name;WCInfo');

    eWorkType.Text := IsNull(v[1], '') + '. ' + IsNull(v[0], '');
  end
  else
    eWorkType.Text := '';
end;

procedure TWorkTypeSynonymParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TWorkTypeSynonymParamForm.eNamePropertiesChange(Sender: TObject);
begin
  SetOKENabled;
end;

procedure TWorkTypeSynonymParamForm.eRequestTextPropertiesChange(
  Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TWorkTypeSynonymParamForm.eWorkTypeDblClick(Sender: TObject);
begin
  ButtonClick(eWorkType, 0);
end;

procedure TWorkTypeSynonymParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
