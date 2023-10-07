//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры контроля качества
//
//------------------------------------------------------------------------------
unit UQualityControlParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, cxLookAndFeelPainters,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxSpinEdit, cxButtonEdit, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TQualityControlParamForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cbActive: TcxCheckBox;
    cxLabel6: TcxLabel;
    cbStatusTypeQC: TcxComboBox;
    cbOrderList: TcxLabel;
    eOrderList: TcxButtonEdit;
    qStatus: TZQuery;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eCommentPropertiesChange(Sender: TObject);
    procedure eWorkerCompanyPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eOrderListDblClick(Sender: TObject);
  private
    { Private declarations }
    FID : integer;
    FIDOrderList : integer;
    FIDStatusTypeQC : integer;
    procedure FillOrderList;
    procedure FillStatusType;
  public
    { Public declarations }
    procedure SetOKEnabled;
  end;

function GetQualityControlParams(
  var AActive, AIDOrderList, AIDDistrict, AIDStatusType, AIDStatusTypeQC : integer;
  var AOrderCloseTime, AOrderAddress : string;
      AID : integer
  ) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, UConsts, USelectOrderList, DateUtils, mesdlg;

function GetQualityControlParams(
  var AActive, AIDOrderList, AIDDistrict, AIDStatusType, AIDStatusTypeQC : integer;
  var AOrderCloseTime, AOrderAddress : string;
      AID : integer
  ) : boolean;
  var
    v : variant;
begin
  with TQualityControlParamForm.Create(nil) do
    try
      FID := AID;
      cbActive.Checked := AActive = 1;

      FIDOrderList := AIDOrderList;
      FillOrderList;

      FIDStatusTypeQC := AIDStatusTypeQC;
      FillStatusType;
      SetItemIndexByID(cbStatusTypeQC, AIDStatusTypeQC);

      Result := ShowModal = mrOK;

      if Result then
      begin
        AActive := BooleanToInt(cbActive.Checked);

        AIDOrderList := FIDOrderList;
        v := Datas.ReadValuesSQl('select ID_StatusType, ID_District, Date_Format(CloseTime, ''%d.%m.%Y'') as CloseTime, Address from orderlist where ID = ' + IntToStr(AIDOrderList), 'ID_StatusType;ID_District;CloseTime;Address');

        AIDStatusType := IsNull(v[0], 0);
        AIDDistrict := IsNull(v[1], 0);
        AIDStatusTypeQC := GetIDByItemIndex(cbStatusTypeQC);
        AOrderCloseTime := IsNull(v[2], '');
        AOrderAddress := IsNull(v[3], '');
      end;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TQualityControlParamForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TQualityControlParamForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (FIDOrderList <> 0) and
    (cbStatusTypeQC.ItemIndex >= 0)
end;

procedure TQualityControlParamForm.eCommentPropertiesChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TQualityControlParamForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TQualityControlParamForm.eOrderListDblClick(Sender: TObject);
begin
  eWorkerCompanyPropertiesButtonClick(nil, 0);
end;

procedure TQualityControlParamForm.eWorkerCompanyPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
    vID: integer;
    v : variant;
begin
  v := Datas.ReadValuesSQL('select count(id) as cid from orderlistsurvey where ID_OrderQualityControl = ' + IntToStr(FID), 'CID');
  if IsNull(v[0], 0) > 0 then
  begin
    ShowMsg('Нельзя изменить или удалить ссылку на заказ, так как уже есть ответы!', smtInformation);
    Exit;
  end;

  if AButtonIndex = 0 then
  begin
    vID := FIDOrderList;
    if SelectOrderList(vID) then
    begin
      FIDOrderList := vID;
      FillOrderList;
    end;
  end
  else
    if AButtonIndex = 1 then
    begin
      FIDOrderList := 0;
      FillOrderList;
    end;

  SetOKEnabled;
end;

procedure TQualityControlParamForm.FillOrderList;
begin
  if FIDOrderList = 0 then eOrderList.Text := ''
  else eOrderList.Text := GetOrderListInfo(FIDOrderList);
end;

procedure TQualityControlParamForm.FillStatusType;
begin
  qStatus.Close;
  qStatus.ParamByName('ID1').AsInteger := FIDStatusTypeQC;
  qStatus.ParamByName('ID2').AsInteger := FIDStatusTypeQC;
  qStatus.ParamByName('ID3').AsInteger := FIDStatusTypeQC;
  qStatus.Open;
  FillComboBox(qStatus, cbStatusTypeQC, 'Name', 'ID');
end;

procedure TQualityControlParamForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
