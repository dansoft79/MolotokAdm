//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры скидки
//
//------------------------------------------------------------------------------
unit UGDiscountTypeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxSpinEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar;

type
  TGDiscountTypeParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    eComment: TcxMemo;
    cbActive: TcxCheckBox;
    cxLabel1: TcxLabel;
    eFromDate: TcxDateEdit;
    cxLabel4: TcxLabel;
    eToDate: TcxDateEdit;
    ePromocode: TcxTextEdit;
    cxLabel5: TcxLabel;
    cbType: TcxComboBox;
    cxLabel6: TcxLabel;
    eSize: TcxSpinEdit;
    cxLabel7: TcxLabel;
    eMinOrderSum: TcxSpinEdit;
    cxLabel8: TcxLabel;
    cbDebtType: TcxComboBox;
    cxLabel9: TcxLabel;
    cbSubType: TcxComboBox;
    cxLabel10: TcxLabel;
    cbCanAdd: TcxCheckBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eCommentPropertiesChange(Sender: TObject);
    procedure cbTypePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FID : integer;
    FSubTypeEdit : boolean;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetDiscountTypeParams(
  var AActive : integer;
  var AName, AComment : string;
  var AFromDate, AToDate : string;
  var APromocode : string;
  var AType : integer;
  var ASize, AMinOrderSum : double;
  var ADebtType, ASubType : integer;
  var ACanAdd : integer;
      AID : integer
  ) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, DTKUtils;

function GetDiscountTypeParams(
  var AActive : integer;
  var AName, AComment : string;
  var AFromDate, AToDate : string;
  var APromocode : string;
  var AType : integer;
  var ASize, AMinOrderSum : double;
  var ADebtType, ASubType : integer;
  var ACanAdd : integer;
      AID : integer
  ) : boolean;
begin
  with TGDiscountTypeParamForm.Create(nil) do
    try
      FID := AID;
      FSubTypeEdit := Datas.ReadValuesSQL('select Count(ID) as CID from discountworktype where ID_DiscountType = ' + IntToStr(FID), 'CID')[0] = 0;

      cbActive.Checked := AActive = 1;

      eName.Text := AName;
      eComment.Text := AComment;

      eFromDate.Text := AFromDate;
      eToDate.Text := AToDate;
      ePromocode.Text := APromocode;

      cbType.ItemIndex := AType;
      eSize.Value := ASize;
      eMinOrderSum.Value := AMinOrderSum;
      cbSubType.ItemIndex := ASubType;
      cbDebtType.ItemIndex := ADebtType;

      cbCanAdd.Checked := ACanAdd = 1;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AActive := BooleanToInt(cbActive.Checked);

        AName := eName.Text;
        AComment := eComment.Text;

        if IsDate(eFromDate.Text) then
          AFromDate := eFromDate.Text
        else
          AFromDate := '';

        if IsDate(eToDate.Text) then
          AToDate := eToDate.Text
        else
          AToDate := '';

        APromocode := Trim(ePromocode.Text);

        AType := cbType.ItemIndex;
        ASize := eSize.Value;
        AMinOrderSum := eMinOrderSum.Value;
        ASubType := cbSubType.ItemIndex;
        ADebtType := cbDebtType.ItemIndex;

        ACanAdd := BooleanToInt(cbCanAdd.Checked);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TGDiscountTypeParamForm.cbTypePropertiesChange(Sender: TObject);
  var
    f : string;
begin
  case cbType.ItemIndex of
    0 : f := '0 ''%''';
    1 : f := '0 ''р.''';
    else f := '0';
  end;

  if cbType.ItemIndex = 0 then
  begin
    eSize.Properties.MaxValue := IfNull(Datas.ReadOptions('maxdiscount')[0], 0);
    eSize.Properties.AssignedValues.MaxValue := true;
  end
  else
  begin
    eSize.Properties.MaxValue := 0;
    eSize.Properties.AssignedValues.MaxValue := false;
  end;

  eSize.Properties.DisplayFormat := f;
//  eSize.Properties.EditFormat := f;
  SetOKEnabled;
end;

procedure TGDiscountTypeParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGDiscountTypeParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (eSize.Value > 0) and
    (cbDebtType.ItemIndex >= 0) and
    (cbSubType.ItemIndex >= 0) and
    (cbType.ItemIndex >= 0);

  cbSubType.Enabled := FSubTypeEdit;
end;

procedure TGDiscountTypeParamForm.eCommentPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGDiscountTypeParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGDiscountTypeParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
