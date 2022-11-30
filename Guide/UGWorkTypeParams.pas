//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры вида работ
//
//------------------------------------------------------------------------------
unit UGWorkTypeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  Menus,
  cxLookAndFeelPainters, cxLabel, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxImage, cxCheckBox, cxMemo, cxRichEdit, cxColorComboBox, cxCalc,
  cxSpinEdit, Vcl.ExtDlgs;

type
  TGWorkTypeParamsForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cbWorkClass: TcxComboBox;
    cxLabel3: TcxLabel;
    eCode: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    ePrice: TcxCalcEdit;
    cxLabel6: TcxLabel;
    eAmount: TcxCalcEdit;
    cxLabel8: TcxLabel;
    eNorm: TcxCalcEdit;
    eComment: TcxMemo;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cbWarrantyType: TcxComboBox;
    eWarrantyTime: TcxSpinEdit;
    cbFreqWork: TcxCheckBox;
    cbPublicWork: TcxCheckBox;
    cbWorkerClass: TcxComboBox;
    cxLabel7: TcxLabel;
    eDescription: TcxMemo;
    eUnit: TcxComboBox;
    cxLabel13: TcxLabel;
    Image: TcxImage;
    bLoadImage: TcxButton;
    OpenDialog: TOpenPictureDialog;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbServiceClassPropertiesChange(Sender: TObject);
    procedure cbWorkerClassPropertiesChange(Sender: TObject);
    procedure eNameExit(Sender: TObject);
    procedure eCalcExit(Sender: TObject);
    procedure cbWarrantyTypeExit(Sender: TObject);
    procedure bLoadImageClick(Sender: TObject);
    procedure ImagePropertiesCustomClick(Sender: TObject);
  private
    { Private declarations }
    FID : integer;
    FPictureType : string;
    procedure FillWorkClass;
    procedure FillWorkerClass;
    procedure FillUnit;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetWorkTypeParams(
  var
    AActive, AIDWorkClass : integer;
  var
    AName, ADescription, AUnit, ACode, AComment : string;
  var
    APrice, ANorm, AAmount : double;
  var
    AIDWorkerClass, AWarrantyType, AWarrantyTime, AFrequencyWork, APublicWork : integer;
  var
    APictureType : string;
    APicture : TMemoryStream;
    AID : integer) : boolean;

implementation

{$R *.dfm}

uses
  math,
  UDatas, DTKUtils, UConsts, UOptions, UUtil;

function GetWorkTypeParams(
  var
    AActive, AIDWorkClass : integer;
  var
    AName, ADescription, AUnit, ACode, AComment : string;
  var
    APrice, ANorm, AAmount : double;
  var
    AIDWorkerClass, AWarrantyType, AWarrantyTime, AFrequencyWork, APublicWork : integer;
  var
    APictureType : string;
    APicture : TMemoryStream;
    AID : integer) : boolean;
begin
  with TGWorkTypeParamsForm.Create(nil) do
    try
      FID := AID;

//      cbActive.Checked := AActive = 1;
      cbFreqWork.Checked := AFrequencyWork = 1;
      cbPublicWork.Checked := APublicWork = 1;

      FillWorkClass;
      SetItemIndexByID(cbWorkClass, AIDWorkClass);

      FillWorkerClass;
      SetItemIndexByID(cbWorkerClass, AIDWorkerClass);

      eName.Text := AName;
      eDescription.Text := ADescription;

      FillUnit;
      eUnit.Text := AUnit;
      eCode.Text := ACode;
      eComment.Text := AComment;

      ePrice.Value := APrice;
      eAmount.Value := AAmount;

      eNorm.Value := ANorm;

      cbWarrantyType.ItemIndex := AWarrantyType;
      eWarrantyTime.Value := AWarrantyTime;

      APicture.Position := 0;
      Image.Picture.LoadFromStream(APicture);
      FPictureType := APictureType;

      Result := ShowModal = mrOK;

      if Result then
      begin
//        AActive := BooleanToInt(cbActive.Checked);
        AFrequencyWork := BooleanToInt(cbFreqWork.Checked);
        APublicWork := BooleanToInt(cbPublicWork.Checked);

        AIDWorkClass := GetIDByItemIndex(cbWorkClass);
        AIDWorkerClass := GetIDByItemIndex(cbWorkerClass);

        AName := Trim(eName.Text);
        ADescription := Trim(eDescription.Text);
        ACode := Trim(eCode.Text);
        AUnit := Trim(eUnit.Text);
        AComment := Trim(eComment.Text);

        APrice := ePrice.Value;
        AAmount := eAmount.Value;

        ANorm := eNorm.Value;

        AWarrantyType := cbWarrantyType.ItemIndex;
        AWarrantyTime := eWarrantyTime.Value;

        APicture.Clear;
        Image.Picture.SaveToStream(APicture);

        if APicture.Size > 0 then
          APictureType := FPictureType
        else
          APictureType := '';
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TGWorkTypeParamsForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (cbWorkClass.ItemIndex <> -1) and
    (cbWorkerClass.ItemIndex <> -1) and
    (Trim(eName.Text) <> '') and
    (Trim(eCode.Text) <> '') and
    (eAmount.Value > 0) and
    (Trim(eUnit.Text) <> '') and
    (ePrice.Value > 0) and
    (eNorm.Value > 0);
end;

procedure TGWorkTypeParamsForm.FillUnit;
begin
  FillComboBoxExSQL(eUnit, 'select distinct UnitName from WorkType order by UnitName', 'UnitName', '');
end;

procedure TGWorkTypeParamsForm.FillWorkClass;
begin
  FillComboBoxExSQL(cbWorkClass, 'select ID, Name from WorkClass order by Name', 'Name', 'ID');
end;

procedure TGWorkTypeParamsForm.FillWorkerClass;
  var
    n, m : integer;
begin
  n := GetIDByItemIndex(cbWorkClass);
  m := GetIDByItemIndex(cbWorkerClass);

  cbWorkerClass.Properties.Items.Clear;
  FillComboBoxExSQL(cbWorkerClass, 'select ID, Name from WorkerClass where deleted = 0 and ID_WorkClass = ' + IntToStr(n) + ' order by Name', 'Name', 'ID');

  SetItemIndexByID(cbWorkerClass, m);
end;

procedure TGWorkTypeParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkTypeParamsForm.ImagePropertiesCustomClick(Sender: TObject);
begin
  bLoadImageClick(Sender);
end;

procedure TGWorkTypeParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TGWorkTypeParamsForm.eNameExit(Sender: TObject);
begin
  if (FID = 0) and (eDescription.Text = '') then
  begin
    eDescription.Text := eName.Text;
  end;
end;

procedure TGWorkTypeParamsForm.bLoadImageClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    Image.Picture.LoadFromFile(OpenDialog.FileName);
    FPictureType := ExtractFileExt(OpenDialog.FileName);
  end;
end;

procedure TGWorkTypeParamsForm.cbServiceClassPropertiesChange(
  Sender: TObject);
begin
  FillWorkerClass;
  SetOKEnabled;
end;

procedure TGWorkTypeParamsForm.cbWarrantyTypeExit(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGWorkTypeParamsForm.cbWorkerClassPropertiesChange(Sender: TObject);
begin
  SetOKEnabled
end;

procedure TGWorkTypeParamsForm.eCalcExit(Sender: TObject);
begin
  TcxCalcEdit(Sender).Value := Sign(TcxCalcEdit(Sender).Value) * TcxCalcEdit(Sender).Value;

  SetOKEnabled;
end;

procedure TGWorkTypeParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
