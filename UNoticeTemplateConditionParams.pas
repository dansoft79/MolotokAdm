//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры условия уведомления
//
//------------------------------------------------------------------------------
unit UNoticeTemplateConditionParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, dxCore, dxColorEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TNoticeTEmplateConditionParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel1: TcxLabel;
    qOrderFieldName: TZQuery;
    cbOrderFieldName: TcxLookupComboBox;
    dsOrderFieldName: TDataSource;
    cxLabel2: TcxLabel;
    cbConditionType: TcxLookupComboBox;
    qConditionType: TZQuery;
    dsConditionType: TDataSource;
    cxLabel3: TcxLabel;
    qConditionTypeid: TLargeintField;
    qConditionTypeConditionType: TWideStringField;
    qConditionTypeConditionCaption: TWideStringField;
    qConditionTypeOrderFieldName: TWideStringField;
    qConditionTypeTableName: TWideStringField;
    qConditionTypeFieldName: TWideStringField;
    qConditionTypeTableCaption: TWideStringField;
    qConditionTypeFieldCaption: TWideStringField;
    qOrderFieldNameOrderFieldName: TWideStringField;
    qOrderFieldNameOrderFieldCaption: TWideStringField;
    qConditionTypeOrderFieldCaption: TWideStringField;
    qValue: TZQuery;
    cbOrderFieldValue: TcxComboBox;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eValueKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbConditionTypePropertiesChange(Sender: TObject);
    procedure cbOrderFieldNamePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FPosNum : integer;
    FTableName, FFieldName : string;
  public
    { Public declarations }
    procedure FillValues;
    procedure SetOKEnabled;
  end;

function GetNoticeTemplateConditionParam(
  var APosNum : integer;
  var AOrderFieldName, AOrderFieldCaption : string;
  var AConditionType, AConditionTypeCaption : string;
  var ATableName, ATableCaption : string;
  var AFieldName, AFieldCaption : string;
  var AOrderFieldValue, AOrderFieldValueCaption : string
  ) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, UShowDatasetModal;

function GetNoticeTemplateConditionParam(
  var APosNum : integer;
  var AOrderFieldName, AOrderFieldCaption : string;
  var AConditionType, AConditionTypeCaption : string;
  var ATableName, ATableCaption : string;
  var AFieldName, AFieldCaption : string;
  var AOrderFieldValue, AOrderFieldValueCaption : string
  ) : boolean;
begin
  with TNoticeTEmplateConditionParamForm.Create(nil) do
    try
      qOrderFIeldName.Open;
      qConditionType.Open;

      FPosNum := APosNum;
      FTableName := ATableName;
      FFieldName := AFieldName;

      if qOrderFieldName.Locate('OrderFieldName', AOrderFieldName, []) then
        cbOrderFieldName.EditValue := AOrderFieldName;

      if qConditionType.Locate('ConditionType', AConditionType, []) then
        cbConditionType.EditValue := qConditionType.FieldByName('ID').AsInteger;

      cbOrderFieldValue.Text := AOrderFieldValueCaption;

      Result := ShowModal = mrOK;

      if Result then
      begin
        APosNum := FPosNum;
        AOrderFieldName := IsNull(cbOrderFieldName.EditValue, '');
        AOrderFieldCaption := cbOrderFieldName.Text;
        AConditionType := qConditionType.FieldBYName('ConditionType').AsString;
        AConditionTypeCaption := cbConditionType.Text;

        if qConditionType.FieldByName('TableName').AsString <> '' then
        begin
          ATableName := qConditionType.FieldByName('TableName').AsString;
          ATableCaption := qConditionType.FieldBYName('TableCaption').AsString;

          AFieldName := qConditionType.FieldByName('FieldName').AsString;
          AFieldCaption := qConditionType.FieldByName('FieldCaption').AsString;

          qValue.Locate('NM', cbOrderFieldValue.Text, []);

          AOrderFieldValue := qValue.FieldByName('ID').AsString;
          AOrderFieldValueCaption := qValue.FieldByName('NM').AsString;
        end
        else
        begin
          ATableName := '';
          ATableCaption := '';

          AFieldName := '';
          AFieldCaption := '';

          qValue.Locate('NM', cbOrderFieldValue.Text, []);

          AOrderFieldValue := qValue.FieldByName('ID').AsString;
          AOrderFieldValueCaption := qValue.FieldByName('NM').AsString;
        end;
      end;

      cbOrderFieldName.Properties.OnChange := nil;
      cbConditionType.Properties.OnChange := nil;
      cbOrderFieldValue.Properties.OnChange := nil;

      qConditionType.Close;
      qOrderFIeldName.Close;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TNoticeTEmplateConditionParamForm.cbConditionTypePropertiesChange(
  Sender: TObject);
begin
  FillValues;
  SetOKEnabled;
end;

procedure TNoticeTEmplateConditionParamForm.cbOrderFieldNamePropertiesChange(
  Sender: TObject);
begin

{  if qConditionType.RecordCount = 1 then
  begin
    cbConditionType.EditValue := qConditionType.FieldBYName('id').AsInteger;
  end;}
  cbConditionType.EditValue := null;
  FillValues;
  SetOKEnabled;
end;

procedure TNoticeTEmplateConditionParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TNoticeTEmplateConditionParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(cbOrderFieldName.Text) <> '') and
    (Trim(cbConditionType.Text) <> '') and
    (Trim(cbOrderFieldValue.Text) <> '');
end;

procedure TNoticeTEmplateConditionParamForm.eValueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TNoticeTEmplateConditionParamForm.FillValues;
  var
    vSQL, s : string;
    tn, fn, ofc, ofn, ct : string;
begin
//  cbOrderFieldValue.Properties.Items.Clear;

  if qConditionType.FieldByName('TableName').AsString <> '' then
  begin
    //заполняем значениями справочника
    s := cbOrderFieldValue.Text;
    tn := qConditionType.FieldByName('TableName').AsString;
    fn := qConditionType.FieldByName('FieldName').AsString;

    vSQL := 'select ID, ' + fn + ' as NM from ' + tn + ' order by ' + fn;

    qValue.Close;
    qValue.SQL.Text := vSQL;
    qValue.Open;

    cbOrderFieldValue.Properties.Items.Clear;
    FillComboBox(qValue, cbOrderFieldValue, 'NM', 'ID');

    cbOrderFieldValue.Text := s;
  end
  else
  begin
    //заполняем допустимыми значениями
    s := cbOrderFieldValue.Text;

    tn := qConditionType.FieldByName('TableName').AsString;
    fn := qConditionType.FieldByName('FieldName').AsString;
    ofn := qConditionType.FieldByName('OrderFieldName').AsString;
    ofc := qConditionType.FieldByName('OrderFieldCaption').AsString;
    ct := qConditionType.FieldByName('ConditionType').AsString;

    vSQL := 'select OrderFieldValue as ID, OrderFieldValueCaption as NM from noticeoptionsaction ' +
            'where OrderFieldName = :OFN and OrderFieldCaption = :OFC and ((:CT = ''='' and CondEqual = 1) or (:CT = ''<>'' and CondNotEqual = 1)) order by OrderFieldValueCaption';
    qValue.Close;
    qValue.SQL.Text := vSQL;
    qValue.ParamByName('OFN').AsString := ofn;
    qValue.ParamByName('OFC').AsString := ofc;
    qValue.ParamByName('CT').AsString := ct;
    qValue.Open;

//    ShowDatasetModal(qValue);

    cbOrderFieldValue.Properties.Items.Clear;
    FillComboBox(qValue, cbOrderFieldValue, 'NM', '');

    cbOrderFieldValue.Text := s;
  end;
end;

procedure TNoticeTEmplateConditionParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
