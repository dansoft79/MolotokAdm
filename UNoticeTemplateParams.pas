//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры шаблона уведомления
//
//------------------------------------------------------------------------------
unit UNoticeTemplateParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxColorComboBox, dxCore, dxColorEdit, cxSpinEdit,
  cxGroupBox, cxImage, Vcl.ExtDlgs, dxmdaset, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, dxDateRanges, cxDBData, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  System.Actions, Vcl.ActnList, dxBar, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TNoticeTemplateParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cxGroupBox1: TcxGroupBox;
    eHeader: TcxTextEdit;
    cxLabel3: TcxLabel;
    eText: TcxMemo;
    cbColor: TcxLabel;
    eColor: TdxColorEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    eShowTime: TcxSpinEdit;
    OpenDialog: TOpenPictureDialog;
    cxLabel13: TcxLabel;
    Image: TcxImage;
    cxGroupBox2: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cbTimeCondition: TcxComboBox;
    cxGroupBox3: TcxGroupBox;
    dsCond: TDataSource;
    mdCond: TdxMemData;
    GridCond: TcxGrid;
    ViewCond: TcxGridDBTableView;
    ViewWorkBanded: TcxGridDBBandedTableView;
    ViewWorkBandedWorkName: TcxGridDBBandedColumn;
    ViewWorkBandedWorkerClassTag: TcxGridDBBandedColumn;
    ViewWorkBandedPrice: TcxGridDBBandedColumn;
    ViewWorkBandedAmount: TcxGridDBBandedColumn;
    ViewWorkBandedSum: TcxGridDBBandedColumn;
    ViewWorkBandedUnitName: TcxGridDBBandedColumn;
    ViewWorkBandedNorm: TcxGridDBBandedColumn;
    ViewWorkBandedTimeSum: TcxGridDBBandedColumn;
    LevelCond: TcxGridLevel;
    bAddCond: TcxButton;
    bEditCond: TcxButton;
    bDelCond: TcxButton;
    BarMan: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    ActionList: TActionList;
    aAddCond: TAction;
    aEditCond: TAction;
    aDelCond: TAction;
    aAddAction: TAction;
    aEditAction: TAction;
    aDelAction: TAction;
    dsAction: TDataSource;
    cxGroupBox4: TcxGroupBox;
    GridAction: TcxGrid;
    ViewAction: TcxGridDBTableView;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    LevelAction: TcxGridLevel;
    bAddAction: TcxButton;
    bEditAction: TcxButton;
    bDelAction: TcxButton;
    bTest: TcxButton;
    qTimeOptions: TZQuery;
    dsTimeOptions: TDataSource;
    cbTimeFieldName: TcxLookupComboBox;
    qTimeOptionsID: TIntegerField;
    qTimeOptionsFieldName: TWideStringField;
    qTimeOptionsFieldCaption: TWideStringField;
    qTimeOptionsCondBefore: TSmallintField;
    qTimeOptionsCondAfter: TSmallintField;
    qTimeOptionsMinValue: TIntegerField;
    qTimeOptionsMaxValue: TIntegerField;
    eTimeValue: TcxSpinEdit;
    mdCondID_NoticeTemplate: TIntegerField;
    mdCondPosNum: TIntegerField;
    mdCondConditionType: TStringField;
    mdCondFieldName: TStringField;
    mdCondTableName: TStringField;
    mdCondOrderFieldName: TStringField;
    mdCondOrderFieldCaption: TStringField;
    mdCondOrderFieldValue: TStringField;
    mdCondOrderFieldValueCaption: TStringField;
    mdCondFieldCaption: TStringField;
    mdCondTableCaption: TStringField;
    mdCondConditionTypeCaption: TStringField;
    ViewCondOrderFieldCaption: TcxGridDBColumn;
    ViewCondConditionTypeCaption: TcxGridDBColumn;
    ViewCondOrderFieldValueCaption: TcxGridDBColumn;
    mdCondID: TIntegerField;
    mdCondEdited: TBooleanField;
    mdAction: TdxMemData;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    BooleanField1: TBooleanField;
    ViewActionOrderFieldCaption: TcxGridDBColumn;
    ViewActionActionTypeCaption: TcxGridDBColumn;
    ViewActionOrderFieldValueCaption: TcxGridDBColumn;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bLoadImageClick(Sender: TObject);
    procedure ImagePropertiesCustomClick(Sender: TObject);
    procedure bTestClick(Sender: TObject);
    procedure cbTimeFieldNamePropertiesChange(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure bAddCondClick(Sender: TObject);
    procedure bEditCondClick(Sender: TObject);
    procedure bDelCondClick(Sender: TObject);
    procedure bAddActionClick(Sender: TObject);
    procedure bEditActionClick(Sender: TObject);
    procedure bDelActionClick(Sender: TObject);
    procedure ViewCondDblClick(Sender: TObject);
    procedure ViewCondKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ViewCondKeyPress(Sender: TObject; var Key: Char);
    procedure ViewActionDblClick(Sender: TObject);
    procedure ViewActionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ViewActionKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FID : integer;
    FPictureType : string;
  public
    { Public declarations }
    function AddCondition : boolean;
    function EditCondition : boolean;
    function DelCondition : boolean;

    function AddAction : boolean;
    function EditAction : boolean;
    function DelAction : boolean;

    procedure UpdateTimeOptions;
    procedure SetOKEnabled;
  end;

function GetNoticeTemplateParams(
  var AActive, AColor, AShowTime : integer;
  var AHeader, AText, AComment : string;
  var
    APictureType : string;
    APicture : TMemoryStream;
  var
    ATimeFieldName, ATimeFieldCaption : string;
  var
    ATimeCondition, ATimeValue : integer;
    ACond, AAct : TMemoryStream;
    AID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, mesdlg, dxGDIPlusClasses,
  UNoticeTemplateConditionParams, UNoticeTemplateActionParams;

const
  vTest : integer = 0;

function GetNoticeTemplateParams(
  var AActive, AColor, AShowTime : integer;
  var AHeader, AText, AComment : string;
  var
    APictureType : string;
    APicture : TMemoryStream;
  var
    ATimeFieldName, ATimeFieldCaption : string;
  var
    ATimeCondition, ATimeValue : integer;
    ACond, AAct : TMemoryStream;
    AID : integer) : boolean;
begin
  with TNoticeTemplateParamForm.Create(nil) do
    try
//      cbActive.Checked := AActive = 1;
      FID := AID;

      eColor.EditValue := AColor;
      eColor.OnKeyDown := eKeyDown;

      eShowTime.Value := AShowTime;

      eHeader.Text := AHeader;
      eText.Text := AText;
//      eComment.Text := AComment;

      APicture.Position := 0;
      Image.Picture.LoadFromStream(APicture);
      FPictureType := APictureType;

      qTimeOptions.Open;
      cbTimeFieldName.EditValue := ATimeFieldName;
      if ATimeCondition = -1 then cbTimeCondition.Text := cBeforeTimeText
      else
        if ATimeCondition = 1 then cbTimeCondition.Text := cAfterTimeText;
      eTimeValue.Value := ATimeValue;

      eColor.OnKeyDown := eKeyDown;

      ACond.Position := 0;
      mdCond.Open;
      mdCond.LoadFromStream(ACond);

      AAct.Position := 0;
      mdAction.Open;
      mdAction.LoadFromStream(AAct);

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);

        AColor := eColor.EditValue;
        AShowTime := eShowTime.Value;

        AHeader := Trim(eHeader.Text);
        AText := Copy(Trim(eText.Text), 1, 150);
//        AComment := Trim(eComment.Text);

        APicture.Clear;
        Image.Picture.SaveToStream(APicture);

        if APicture.Size > 0 then
          APictureType := FPictureType
        else
          APictureType := '';

        ATimeFieldName := cbTimeFieldName.EditValue;
        ATimeFieldCaption := qTimeOptions.FieldByName('FieldCaption').AsString;

        if cbTimeCondition.Text = cBeforeTimeText then ATimeCondition := -1
        else
          if cbTimeCondition.Text = cAfterTimeText then ATimeCondition := 1;

        ATimeValue := eTImeValue.Value;

        qTimeOptions.Close;

        ACond.Clear;
        mdCond.First;
        mdCond.SaveToStream(ACond);

        AAct.Clear;
        mdAction.First;
        mdAction.SaveToStream(AAct);
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TNoticeTemplateParamForm.bOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TNoticeTemplateParamForm.bTestClick(Sender: TObject);
  var
    n : integer;
    vImage : TdxSmartImage;
    vStream : TMemoryStream;
    r : integer;
begin
  vStream := TMemoryStream.Create;
  Image.Picture.SaveToStream(vStream);
  vStream.Position := 0;

  vImage := TdxSmartImage.CreateFromStream(vStream);

  n := Datas.AlertImageList.Add(vImage);
  Datas.AlertImageID.Strings.Add(IntToStr(vTest) + '=' + IntToStr(n));
  Dec(vTest);

  vImage.Free;
  vStream.Free;

  ShowNotification(0, IDOrderList, eHeader.Text, eText.Text, eColor.ColorValue, eShowTime.Value, n);
end;

procedure TNoticeTemplateParamForm.cbTimeFieldNamePropertiesChange(
  Sender: TObject);
begin
  SetOKEnabled;
  UpdateTimeOptions;
end;

procedure TNoticeTemplateParamForm.bAddActionClick(Sender: TObject);
begin
  AddAction;
  SetOKEnabled;
end;

function TNoticeTemplateParamForm.DelAction: boolean;
begin
  mdAction.Delete;
end;

function TNoticeTemplateParamForm.DelCondition: boolean;
begin
  mdCond.Delete;
end;

procedure TNoticeTemplateParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

function TNoticeTemplateParamForm.EditAction: boolean;
  var
    vPosNum : integer;
    vOrderFieldName, vOrderFieldCaption : string;
    vAcionType, vAcionTypeCaption : string;
    vTableName, vTableCaption : string;
    vFieldName, vFieldCaption : string;
    vOrderFieldValue, vOrderFieldValueCaption : string;
begin
  with mdAction do
  begin
    vPosNum := FieldByName('PosNum').AsInteger;
    vOrderFieldName := FieldByName('OrderFieldName').AsString;
    vOrderFieldCaption := FieldByName('OrderFieldCaption').AsString;
    vAcionType := FieldByName('ActionType').AsString;
    vAcionTypeCaption := FieldByName('ActionTypeCaption').AsString;
    vTableName := FieldByName('TableName').AsString;
    vTableCaption := FieldByName('TableCaption').AsString;
    vTableName := FieldByName('FieldName').AsString;
    vTableCaption := FieldByName('FieldCaption').AsString;
    vOrderFieldValue := FieldByName('OrderFieldValue').AsString;
    vOrderFieldValueCaption := FieldByName('OrderFieldValueCaption').AsString;
  end;

  Result := GetNoticeTemplateActionParam(
    vPosNum,
    vOrderFieldName, vOrderFieldCaption,
    vAcionType, vAcionTypeCaption,
    vTableName, vTableCaption,
    vFieldName, vFieldCaption,
    vOrderFieldValue, vOrderFieldValueCaption
    );

  if Result then
  begin
    mdAction.Edit;
    mdAction.FieldByName('Edited').AsBoolean := true;
    mdAction.FieldByName('ID_NoticeTemplate').AsInteger := FID;
    mdAction.FieldByName('PosNum').AsInteger := vPosNum;
    mdAction.FieldByName('OrderFieldName').AsString := vOrderFieldName;
    mdAction.FieldByName('OrderFieldCaption').AsString := vOrderFieldCaption;
    mdAction.FieldByName('ActionType').AsString := vAcionType;
    mdAction.FieldByName('ActionTypeCaption').AsString := vAcionTypeCaption;
    mdAction.FieldByName('TableName').AsString := vTableName;
    mdAction.FieldByName('TableCaption').AsString := vTableCaption;
    mdAction.FieldByName('FieldName').AsString := vTableName;
    mdAction.FieldByName('FieldCaption').AsString := vTableCaption;
    mdAction.FieldByName('OrderFieldValue').AsString := vOrderFieldValue;
    mdAction.FieldByName('OrderFieldValueCaption').AsString := vOrderFieldValueCaption;
    mdAction.Post;
  end;
end;

function TNoticeTemplateParamForm.EditCondition: boolean;
  var
    vPosNum : integer;
    vOrderFieldName, vOrderFieldCaption : string;
    vConditionType, vConditionTypeCaption : string;
    vTableName, vTableCaption : string;
    vFieldName, vFieldCaption : string;
    vOrderFieldValue, vOrderFieldValueCaption : string;
begin
  with mdCond do
  begin
    vPosNum := FieldByName('PosNum').AsInteger;
    vOrderFieldName := FieldByName('OrderFieldName').AsString;
    vOrderFieldCaption := FieldByName('OrderFieldCaption').AsString;
    vConditionType := FieldByName('ConditionType').AsString;
    vConditionTypeCaption := FieldByName('ConditionTypeCaption').AsString;
    vTableName := FieldByName('TableName').AsString;
    vTableCaption := FieldByName('TableCaption').AsString;
    vTableName := FieldByName('FieldName').AsString;
    vTableCaption := FieldByName('FieldCaption').AsString;
    vOrderFieldValue := FieldByName('OrderFieldValue').AsString;
    vOrderFieldValueCaption := FieldByName('OrderFieldValueCaption').AsString;
  end;

  Result := GetNoticeTemplateConditionParam(
    vPosNum,
    vOrderFieldName, vOrderFieldCaption,
    vConditionType, vConditionTypeCaption,
    vTableName, vTableCaption,
    vFieldName, vFieldCaption,
    vOrderFieldValue, vOrderFieldValueCaption
    );

  if Result then
  begin
    mdCond.Edit;
    mdCond.FieldByName('Edited').AsBoolean := true;
    mdCond.FieldByName('ID_NoticeTemplate').AsInteger := FID;
    mdCond.FieldByName('PosNum').AsInteger := vPosNum;
    mdCond.FieldByName('OrderFieldName').AsString := vOrderFieldName;
    mdCond.FieldByName('OrderFieldCaption').AsString := vOrderFieldCaption;
    mdCond.FieldByName('ConditionType').AsString := vConditionType;
    mdCond.FieldByName('ConditionTypeCaption').AsString := vConditionTypeCaption;
    mdCond.FieldByName('TableName').AsString := vTableName;
    mdCond.FieldByName('TableCaption').AsString := vTableCaption;
    mdCond.FieldByName('FieldName').AsString := vTableName;
    mdCond.FieldByName('FieldCaption').AsString := vTableCaption;
    mdCond.FieldByName('OrderFieldValue').AsString := vOrderFieldValue;
    mdCond.FieldByName('OrderFieldValueCaption').AsString := vOrderFieldValueCaption;
    mdCond.Post;
  end;
end;

procedure TNoticeTemplateParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eHeader.Text) <> '') and
    (Trim(eText.Text) <> '') and
    (cbTimeFieldName.Text <> '') and
    (cbTimeCondition.ItemIndex <> -1) and
    (eTimeValue.Value >= 0 ) and
    (eTimeValue.Value >= qTimeOptions.FieldByName('MinValue').AsInteger) and
    (eTimeValue.Value <= qTimeOptions.FieldByName('MaxValue').AsInteger);

  aAddCond.Enabled := true;
  aEditCond.Enabled := mdCond.RecordCount > 0;
  aDelCond.Enabled := mdCond.RecordCount > 0;

  aAddAction.Enabled := true;
  aEditAction.Enabled := mdAction.RecordCount > 0;
  aDelAction.Enabled := mdAction.RecordCount > 0;
end;

procedure TNoticeTemplateParamForm.UpdateTimeOptions;
  var
    s : string;
begin
  if cbTimeFieldName.Text <> '' then
  begin
    s := cbTimeCondition.Text;
    cbTimeCondition.Properties.Items.Clear;
    if qTimeOptions.FieldByName('CondBefore').AsInteger = 1 then cbTimeCondition.Properties.Items.Add(cBeforeTimeText);
    if qTimeOptions.FieldByName('CondAfter').AsInteger = 1 then cbTimeCondition.Properties.Items.Add(cAfterTimeText);
    cbTimeCondition.Text := s;

    eTimeValue.Properties.MaxValue := qTimeOptions.FieldByName('MaxValue').AsInteger;
    eTimeValue.Properties.MinValue := qTimeOptions.FieldByName('MinValue').AsInteger;
  end
  else
  begin
    cbTimeCondition.Properties.Items.Clear;

    eTimeValue.Properties.MaxValue := 0;
    eTimeValue.Properties.MinValue := 0;
    eTimeValue.Properties.AssignedValues.MinValue := true;
    eTimeValue.Properties.AssignedValues.MaxValue := false;
  end;

  if (eTimeValue.Properties.MaxValue = 0) and (eTimeValue.Properties.MinValue = 0) then
  begin
    eTimeValue.Properties.AssignedValues.MinValue := true;
    eTimeValue.Properties.AssignedValues.MaxValue := false;
  end
  else
  begin
    eTimeValue.Properties.AssignedValues.MinValue := true;
    eTimeValue.Properties.AssignedValues.MaxValue := true;
  end;
end;

procedure TNoticeTemplateParamForm.ViewActionDblClick(Sender: TObject);
begin
  if aEditAction.Enabled then aEditAction.Execute;
end;

procedure TNoticeTemplateParamForm.ViewActionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  45 : if aAddAction.Enabled then aAddAction.Execute;
  46 : if aDelAction.Enabled then aDelAction.Execute;
  13 : if aEditAction.Enabled then aEditAction.Execute;
  end;
end;

procedure TNoticeTemplateParamForm.ViewActionKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
  '+' : if aAddAction.Enabled then aAddAction.Execute;
  '-' : if aDelAction.Enabled then aDelAction.Execute;
  end;
end;

procedure TNoticeTemplateParamForm.ViewCondDblClick(Sender: TObject);
begin
  if aEditCond.Enabled then aEditCond.Execute;
end;

procedure TNoticeTemplateParamForm.ViewCondKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  45 : if aAddCond.Enabled then aAddCond.Execute;
  46 : if aDelCond.Enabled then aDelCond.Execute;
  13 : if aEditCond.Enabled then aEditCond.Execute;
  end;
end;

procedure TNoticeTemplateParamForm.ViewCondKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
  '+' : if aAddCond.Enabled then aAddCond.Execute;
  '-' : if aDelCond.Enabled then aDelCond.Execute;
  end;
end;

procedure TNoticeTemplateParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TNoticeTemplateParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TNoticeTemplateParamForm.ImagePropertiesCustomClick(Sender: TObject);
begin
  bLoadImageClick(Sender);
end;

function TNoticeTemplateParamForm.AddAction: boolean;
  var
    vPosNum : integer;
    vOrderFieldName, vOrderFieldCaption : string;
    vActionType, vActionTypeCaption : string;
    vTableName, vTableCaption : string;
    vFieldName, vFieldCaption : string;
    vOrderFieldValue, vOrderFieldValueCaption : string;
begin
  vPosNum := 0;
  vOrderFieldName := '';
  vOrderFieldCaption := '';
  vActionType := '';
  vActionTypeCaption := '';
  vTableName := '';
  vTableCaption := '';
  vFieldName := '';
  vFieldCaption := '';
  vOrderFieldValue := '';
  vOrderFieldValueCaption := '';

  Result := GetNoticeTemplateActionParam(
    vPosNum,
    vOrderFieldName, vOrderFieldCaption,
    vActionType, vActionTypeCaption,
    vTableName, vTableCaption,
    vFieldName, vFieldCaption,
    vOrderFieldValue, vOrderFieldValueCaption
    );

  if Result then
  begin
    mdAction.Append;
    mdAction.FieldByName('ID_NoticeTemplate').AsInteger := FID;
    mdAction.FieldByName('POsNum').AsInteger := vPosNum;
    mdAction.FieldByName('OrderFieldName').AsString := vOrderFieldName;
    mdAction.FieldByName('OrderFieldCaption').AsString := vOrderFieldCaption;
    mdAction.FieldByName('ActionType').AsString := vActionType;
    mdAction.FieldByName('ActionTypeCaption').AsString := vActionTypeCaption;
    mdAction.FieldByName('TableName').AsString := vTableName;
    mdAction.FieldByName('TableCaption').AsString := vTableCaption;
    mdAction.FieldByName('FieldName').AsString := vFieldName;
    mdAction.FieldByName('FieldCaption').AsString := vFieldCaption;
    mdAction.FieldByName('OrderFieldValue').AsString := vOrderFieldValue;
    mdAction.FieldByName('OrderFieldValueCaption').AsString := vOrderFieldValueCaption;
    mdAction.Post;
  end;
end;

function TNoticeTemplateParamForm.AddCondition: boolean;
  var
    vPosNum : integer;
    vOrderFieldName, vOrderFieldCaption : string;
    vConditionType, vConditionTypeCaption : string;
    vTableName, vTableCaption : string;
    vFieldName, vFieldCaption : string;
    vOrderFieldValue, vOrderFieldValueCaption : string;
begin
  vPosNum := 0;
  vOrderFieldName := '';
  vOrderFieldCaption := '';
  vConditionType := '';
  vConditionTypeCaption := '';
  vTableName := '';
  vTableCaption := '';
  vFieldName := '';
  vFieldCaption := '';
  vOrderFieldValue := '';
  vOrderFieldValueCaption := '';

  Result := GetNoticeTemplateConditionParam(
    vPosNum,
    vOrderFieldName, vOrderFieldCaption,
    vConditionType, vConditionTypeCaption,
    vTableName, vTableCaption,
    vFieldName, vFieldCaption,
    vOrderFieldValue, vOrderFieldValueCaption
    );

  if Result then
  begin
    mdCond.Append;
    mdCond.FieldByName('ID_NoticeTemplate').AsInteger := FID;
    mdCond.FieldByName('POsNum').AsInteger := vPosNum;
    mdCond.FieldByName('OrderFieldName').AsString := vOrderFieldName;
    mdCond.FieldByName('OrderFieldCaption').AsString := vOrderFieldCaption;
    mdCond.FieldByName('ConditionType').AsString := vConditionType;
    mdCond.FieldByName('ConditionTypeCaption').AsString := vConditionTypeCaption;
    mdCond.FieldByName('TableName').AsString := vTableName;
    mdCond.FieldByName('TableCaption').AsString := vTableCaption;
    mdCond.FieldByName('FieldName').AsString := vFieldName;
    mdCond.FieldByName('FieldCaption').AsString := vFieldCaption;
    mdCond.FieldByName('OrderFieldValue').AsString := vOrderFieldValue;
    mdCond.FieldByName('OrderFieldValueCaption').AsString := vOrderFieldValueCaption;
    mdCond.Post;
  end;
end;

procedure TNoticeTemplateParamForm.bAddCondClick(Sender: TObject);
begin
  AddCondition;
  SetOKEnabled;
end;

procedure TNoticeTemplateParamForm.bDelActionClick(Sender: TObject);
begin
  DelAction;
  SetOKEnabled;
end;

procedure TNoticeTemplateParamForm.bDelCondClick(Sender: TObject);
begin
  DelCondition;
  SetOKEnabled;
end;

procedure TNoticeTemplateParamForm.bEditActionClick(Sender: TObject);
begin
  EditAction;
  SetOKEnabled;
end;

procedure TNoticeTemplateParamForm.bEditCondClick(Sender: TObject);
begin
  EditCondition;
  SetOKEnabled;
end;

procedure TNoticeTemplateParamForm.bLoadImageClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    Image.Picture.LoadFromFile(OpenDialog.FileName);
    FPictureType := ExtractFileExt(OpenDialog.FileName);
  end;
end;

end.
