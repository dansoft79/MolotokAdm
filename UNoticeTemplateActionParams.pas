//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры действия уведомления
//
//------------------------------------------------------------------------------
unit UNoticeTemplateActionParams;

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
  TNoticeTEmplateActionParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxLabel1: TcxLabel;
    qOrderFieldName: TZQuery;
    cbOrderFieldName: TcxLookupComboBox;
    dsOrderFieldName: TDataSource;
    cxLabel2: TcxLabel;
    cbActionType: TcxLookupComboBox;
    qActionType: TZQuery;
    dsActionType: TDataSource;
    cxLabel3: TcxLabel;
    qActionTypeid: TLargeintField;
    qActionTypeConditionType: TWideStringField;
    qActionTypeConditionCaption: TWideStringField;
    qActionTypeOrderFieldName: TWideStringField;
    qActionTypeTableName: TWideStringField;
    qActionTypeFieldName: TWideStringField;
    qActionTypeTableCaption: TWideStringField;
    qActionTypeFieldCaption: TWideStringField;
    qOrderFieldNameOrderFieldName: TWideStringField;
    qOrderFieldNameOrderFieldCaption: TWideStringField;
    qActionTypeOrderFieldCaption: TWideStringField;
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

function GetNoticeTemplateActionParam(
  var APosNum : integer;
  var AOrderFieldName, AOrderFieldCaption : string;
  var AActionType, AActionTypeCaption : string;
  var ATableName, ATableCaption : string;
  var AFieldName, AFieldCaption : string;
  var AOrderFieldValue, AOrderFieldValueCaption : string
  ) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, UShowDatasetModal;

function GetNoticeTemplateActionParam(
  var APosNum : integer;
  var AOrderFieldName, AOrderFieldCaption : string;
  var AActionType, AActionTypeCaption : string;
  var ATableName, ATableCaption : string;
  var AFieldName, AFieldCaption : string;
  var AOrderFieldValue, AOrderFieldValueCaption : string
  ) : boolean;
begin
  with TNoticeTEmplateActionParamForm.Create(nil) do
    try
      qOrderFIeldName.Open;
      qActionType.Open;

      FPosNum := APosNum;
      FTableName := ATableName;
      FFieldName := AFieldName;

      if qOrderFieldName.Locate('OrderFieldName', AOrderFieldName, []) then
        cbOrderFieldName.EditValue := AOrderFieldName;

      if qActionType.Locate('ActionType', AActionType, []) then
        cbActionType.EditValue := qActionType.FieldByName('ID').AsInteger;

      cbOrderFieldValue.Text := AOrderFieldValueCaption;

      Result := ShowModal = mrOK;

      if Result then
      begin
        APosNum := FPosNum;
        AOrderFieldName := IsNull(cbOrderFieldName.EditValue, '');
        AOrderFieldCaption := cbOrderFieldName.Text;
        AActionType := qActionType.FieldBYName('ActionType').AsString;
        AActionTypeCaption := cbActionType.Text;

        if AActionType = 'null' then
        begin
          ATableName := '';
          ATableCaption := '';

          AFieldName := '';
          AFieldCaption := '';

          AOrderFieldValue := 'null';
          AOrderFieldValueCaption := 'null';
        end
        else
          if AActionType = 'value' then
          begin
            if qActionType.FieldByName('TableName').AsString <> '' then
            begin
              ATableName := qActionType.FieldByName('TableName').AsString;
              ATableCaption := qActionType.FieldBYName('TableCaption').AsString;

              AFieldName := qActionType.FieldByName('FieldName').AsString;
              AFieldCaption := qActionType.FieldByName('FieldCaption').AsString;

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
      end;

      cbOrderFieldName.Properties.OnChange := nil;
      cbActionType.Properties.OnChange := nil;
      cbOrderFieldValue.Properties.OnChange := nil;

      qActionType.Close;
      qOrderFIeldName.Close;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TNoticeTEmplateActionParamForm.cbConditionTypePropertiesChange(
  Sender: TObject);
begin
  FillValues;
  SetOKEnabled;
end;

procedure TNoticeTEmplateActionParamForm.cbOrderFieldNamePropertiesChange(
  Sender: TObject);
begin
  cbActionType.EditValue := null;
  FillValues;
  SetOKEnabled;
{  if qActionType.RecordCount = 1 then
  begin
    cbActionType.EditValue := qActionType.FieldBYName('id').AsInteger;
  end;}
end;

procedure TNoticeTEmplateActionParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TNoticeTEmplateActionParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(cbOrderFieldName.Text) <> '') and
    (Trim(cbActionType.Text) <> '') and
    (Trim(cbOrderFieldValue.Text) <> '');
end;

procedure TNoticeTEmplateActionParamForm.eValueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TNoticeTEmplateActionParamForm.FillValues;
  var
    vSQL, s : string;
    tn, fn, ofc, ofn, at : string;
begin
  if cbActionType.EditValue = null then
  begin
    cbOrderFieldValue.Properties.Items.Clear;
    Exit;
  end;

  if qActionType.FieldByName('ActionType').AsString = 'null' then
  begin
    vSQL := 'select 0 as ID , ''null'' as NM';

    qValue.Close;
    qValue.SQL.Text := vSQL;
    qValue.Open;

    cbOrderFieldValue.Properties.Items.Clear;
    FillComboBox(qValue, cbOrderFieldValue, 'NM', 'ID');

    cbOrderFieldValue.Text := 'null';
  end
  else
    if qActionType.FieldByName('ActionType').AsString = 'value' then
    begin

      if qActionType.FieldByName('TableName').AsString <> '' then
      begin
        //заполняем значениями справочника
        s := cbOrderFieldValue.Text;
        tn := qActionType.FieldByName('TableName').AsString;
        fn := qActionType.FieldByName('FieldName').AsString;

        vSQL := 'select ID, ' + fn + ' as NM from ' + tn + ' order by NM';

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

        ofn := qActionType.FieldByName('OrderFieldName').AsString;
        ofc := qActionType.FieldByName('OrderFieldCaption').AsString;
        at := qActionType.FieldByName('ActionType').AsString;

        vSQL := 'select OrderFieldValue as ID, OrderFieldValueCaption as NM from noticeoptionsaction ' +
                'where OrderFieldName = :OFN and OrderFieldCaption = :OFC and ((:AT = ''null'' and CanSetNull = 1) or (:AT = ''value'' and CanSetValue = 1)) ' +
                'order by NM';
        qValue.Close;
        qValue.SQL.Text := vSQL;
        qValue.ParamByName('OFN').AsString := ofn;
        qValue.ParamByName('OFC').AsString := ofc;
        qValue.ParamByName('AT').AsString := at;
        qValue.Open;

//        ShowDatasetModal(qValue);

        cbOrderFieldValue.Properties.Items.Clear;
        FillComboBox(qValue, cbOrderFieldValue, 'NM', '');

        cbOrderFieldValue.Text := s;
      end;
    end;
end;

procedure TNoticeTEmplateActionParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
