//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Изменение параметров записи справочника видов отчетных форм
//
//------------------------------------------------------------------------------
unit UGReportFormParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus,
  cxLookAndFeelPainters, cxGraphics, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxMemo, cxCheckBox, cxLookAndFeels, cxSpinEdit;

type
  TReportFormParamsForm = class(TForm)
    pBottom: TPanel;
    bEditForm: TcxButton;
    bDelForm: TcxButton;
    bOK: TcxButton;
    bCancel: TcxButton;
    eName: TcxTextEdit;
    eType: TcxComboBox;
    Label1: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    mComment: TcxMemo;
    eLastNumber: TcxSpinEdit;
    cxLabel3: TcxLabel;
    eLastYear: TcxSpinEdit;
    cxLabel4: TcxLabel;
    eNumPrefix: TcxTextEdit;
    cxLabel5: TcxLabel;
    eNumSuffix: TcxTextEdit;
    cxLabel6: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure eTypeChange(Sender: TObject);
    procedure bEditFormClick(Sender: TObject);
    procedure bDelFormClick(Sender: TObject);
    procedure eTypeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FForm : TMemoryStream;

  public
    { Public declarations }
    procedure SetEnabledControls;
    procedure SetOKEnabled;
    Procedure FillType;
  end;

function GetReportFormParams(
  var AType, AName : string;
  var ALastNumber, ALastYear : integer;
  var ANumPrefix, ANumSuffix, AComment : string;
      AForm : TMemoryStream) : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, mesdlg;

function GetReportFormParams(
  var AType, AName : string;
  var ALastNumber, ALastYear : integer;
  var ANumPrefix, ANumSuffix, AComment : string;
      AForm : TMemoryStream) : boolean;
begin
  with TReportFormParamsForm.Create(nil) do
    try
      FForm := AForm;
      FillType;
      eType.Text := AType;
      eName.Text := AName;

      eLastNumber.Value := ALastNumber;
      eLastYear.Value := ALastYear;
      eNumPrefix.Text := ANumPrefix;
      eNumSuffix.Text := ANumSuffix;

      mComment.Text := AComment;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AName := Trim(eName.Text);
        AType := Trim(eType.Text);
        AComment := Trim(mComment.Text);

        ALastNumber := eLastNumber.Value;
        ALastYear := eLastYear.Value;
        ANumPrefix := Trim(eNumPrefix.Text);
        ANumSuffix := Trim(eNumSuffix.Text);
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TReportFormParamsForm.SetOKEnabled;
begin
  bOK.Enabled := (Trim(eName.Text) <> '') And (Trim(eType.Text) <> '');
end;

procedure TReportFormParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
  SetEnabledControls;
end;

procedure TReportFormParamsForm.eNameChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TReportFormParamsForm.eTypeChange(Sender: TObject);
begin
  SetOkEnabled;
end;

procedure TReportFormParamsForm.eTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then Key := vk_Tab;
end;

procedure TReportFormParamsForm.bEditFormClick(Sender: TObject);
begin
  EditReport3(eName.Text, eType.Text + '. ' + eName.Text, FForm);
  SetEnabledControls;
end;

procedure TReportFormParamsForm.bDelFormClick(Sender: TObject);
begin
if ShowMsg('Действительно удалить шаблон документа?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
  begin
    FForm.Clear;
    FForm.Position := 0;
  end;
SetEnabledControls;  
end;

procedure TReportFormParamsForm.SetEnabledControls;
begin
  bDelForm.Enabled := FForm.Size > 0;
end;

procedure TReportFormParamsForm.FillType;
begin
  FillComboboxExSQL(eType, 'select distinct Type from ReportForm where deleted = 0 order by Type', 'Type','');
end;

end.
