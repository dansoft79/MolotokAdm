//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры запроса клиентов
//
//------------------------------------------------------------------------------
unit UClientRequestParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxButtonEdit;

type
  TClientRequestParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eClientSession: TcxMemo;
    cxLabel1: TcxLabel;
    cbProcessed: TcxCheckBox;
    eWorkType: TcxButtonEdit;
    eRequestText: TcxMemo;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eRequestTextPropertiesChange(Sender: TObject);
    procedure eWorkTypeDblClick(Sender: TObject);
  private
    { Private declarations }
    FIDWorkType : integer;
  public
    { Public declarations }
    procedure SetOKEnabled;
    procedure UpdateWorkType;
  end;

function GetClientRequestParams(
  var AActive : integer;
  var AProcessed, AIDWorkType : integer;
  var ARequestText, AClientSession : string) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, USelectWorkType;

function GetClientRequestParams(
  var AActive : integer;
  var AProcessed, AIDWorkType : integer;
  var ARequestText, AClientSession : string) : boolean;
begin
  with TClientRequestParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      cbProcessed.Checked := AProcessed = 1;
      FIDWorkType := AIDWorkType;
      UpdateWorkType;

      eRequestText.Text := ARequestText;
      eClientSession.Text := AClientSession;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AProcessed := BooleanToInt(cbProcessed.Checked);
        AIDWorkType := FIDWorkType;
        ARequestText := Trim(eRequestText.Text);
        AClientSession := Trim(eClientSession.Text);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TClientRequestParamForm.ButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if SelectWorkType(FIDWorkType) then
  begin
    UpdateWorkType;
  end;
  SetOKEnabled;
end;

procedure TClientRequestParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TClientRequestParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (FIDWorkType <> 0) and
    (Trim(eRequestText.Text) <> '');
end;

procedure TClientRequestParamForm.UpdateWorkType;
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

procedure TClientRequestParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TClientRequestParamForm.eRequestTextPropertiesChange(
  Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TClientRequestParamForm.eWorkTypeDblClick(Sender: TObject);
begin
  ButtonClick(eWorkType, 0);
end;

procedure TClientRequestParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
