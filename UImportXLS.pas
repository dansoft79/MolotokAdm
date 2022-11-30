//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Модуль импорта табличных файлов
//
//------------------------------------------------------------------------------
unit UImportXLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, DBClient, Menus,
  dxSkinsCore, cxGraphics, dxSkinsdxStatusBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, dxSkinsdxBarPainter, ImgList, cxPropertiesStore, dxmdaset, dxBar,
  dxBarExtItems, cxClasses, ActnList, DTKPermissionActnList, cxSplitter,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar, cxLookAndFeels,
  cxLookAndFeelPainters, System.Actions, cxTextEdit, cxSpinEdit, dxCore,
  dxCoreClasses, dxHashUtils, dxSpreadSheetCore, dxSpreadSheetCoreHistory,
  dxSpreadSheetConditionalFormatting, dxSpreadSheetConditionalFormattingRules,
  dxSpreadSheetClasses, dxSpreadSheetContainers, dxSpreadSheetFormulas,
  dxSpreadSheetHyperlinks, dxSpreadSheetFunctions, dxSpreadSheetGraphics,
  dxSpreadSheetPrinting, dxSpreadSheetTypes, dxSpreadSheetUtils,
  dxBarBuiltInMenu, cxNavigator, System.ImageList, dxSpreadSheet,
  cxDropDownEdit, cxBarEditItem, TreeScan, dxSpreadSheetCoreFormulas,
  dxSpreadSheetCoreStyles, dxSpreadSheetCoreStrs, dxSpreadSheetStyles,
  dxSpreadSheetFormattedTextUtils, dxDateRanges;

type
  //процедура импорта строки
  TImportProcedure = function (AValues : string) : string of object;

  //класс чтения формата
  TFileReader = class
  public
    constructor Create; virtual; abstract;
    function ReadFile(AFileName : string; ASpreadSheet : TdxSpreadSheet) : boolean; virtual; abstract;
    function Caption : string; virtual;
    function Mask : string; virtual;
    function FieldMapping : string; virtual;
  end;
  TFileReaderClass = class of TFileReader;

  TImportDataForm = class(TForm)
    ActionList: TDataSetPrmActLst;
    aCancel: TAction;
    aOpenFile: TAction;
    BarManager: TdxBarManager;
    dxBarButton5: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    SpreadSheet: TdxSpreadSheet;
    StatusBar: TdxStatusBar;
    DBGrid: TcxGrid;
    DBGridDBTableView: TcxGridDBTableView;
    DBGridLevel: TcxGridLevel;
    Splitter: TcxSplitter;
    mdDatas: TdxMemData;
    DataSource: TDataSource;
    mdDatasFiledName: TStringField;
    mdDatasFieldCaption: TStringField;
    DBGridDBTableViewFieldCaption: TcxGridDBColumn;
    DBGridDBTableViewFieldColumn: TcxGridDBColumn;
    mdDatasFieldColumn: TIntegerField;
    PropertiesStore: TcxPropertiesStore;
    aImport: TAction;
    mdDatasRequired: TBooleanField;
    DBGridDBTableViewRequired: TcxGridDBColumn;
    aSaveFile: TAction;
    dxBarButton3: TdxBarButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    mdDatasDefaultValue: TStringField;
    DBGridDBTableViewDefaultValue: TcxGridDBColumn;
    dxBarButton4: TdxBarButton;
    aClearCol: TAction;
    TreeScanner: TTreeScanner;
    aDeleteFile: TAction;
    dxBarButton6: TdxBarButton;
    eFirst: TcxBarEditItem;
    eLast: TcxBarEditItem;
    eCaption: TcxBarEditItem;
    aGetCol: TAction;
    aSetCol: TAction;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aOpenFileExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aImportExecute(Sender: TObject);
    procedure DBGridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure DBGridDBTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure aSaveFileExecute(Sender: TObject);
    procedure SpreadSheetProgress(Sender: TObject; Percent: Integer);
    procedure eFirst_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridExit(Sender: TObject);
    procedure aClearColExecute(Sender: TObject);
    procedure TreeScannerFileFound(Sender: TObject);
    procedure aDeleteFileExecute(Sender: TObject);
    procedure aGetColExecute(Sender: TObject);
    procedure aSetColExecute(Sender: TObject);
    procedure eCaptionPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure SpreadSheetDblClick(Sender: TObject);
  private
    { Private declarations }
    FQuota : char;
    FDelimiter : char;
    FInsteadQuota : char;
    FInsteadDelimiter : char;

    FFilter : string;
    FFileName : string;
    FImportProc : TImportProcedure;
    FProcName : string;
  public
    { Public declarations }
    procedure SetOKEnabled;

    procedure FillFields(AFields, ARequired : string);

    procedure DoImport;

    function CheckData : boolean;

    //чтение фильтров для разных форматов файлов
    procedure UpdateFilter;

    //обновление связок колонок
    procedure UpdateMapping(AFieldMapping : string);

    //получение списка сохраненных настроек
    procedure FillCaption;
    //сохранение настроек
    procedure SaveFields(ACap : string);
    //чтение настроек
    procedure LoadFields(ACap : string);
  end;

  //обработчик файлов XLS
  TXLSFileReader = class(TFileReader)
  private
    procedure SpreadSheetProgress(Sender: TObject; Percent: integer);
  public
    constructor Create; override;
    destructor Destroy; override;
    function ReadFile(AFileName : string; ASpreadSheet : TdxSpreadSheet) : boolean; override;
    function Caption : string; override;
    function Mask : string; override;
  end;

  //обработчик всех файлов как файлов XLS
  TAllFileReader = class(TFileReader)
  private
    FMapping : string;
  public
    constructor Create; override;
    destructor Destroy; override;
    function FieldMapping : string; override;
    function ReadFile(AFileName : string; ASpreadSheet : TdxSpreadSheet) : boolean; override;
    function Caption : string; override;
    function Mask : string; override;
  end;

  //обработчик файлов DBF
  TDBFFileReader = class(TFileReader)
  private
  public
    constructor Create; override;
    destructor Destroy; override;
    function ReadFile(AFileName : string; ASpreadSheet : TdxSpreadSheet) : boolean; override;
    function Caption : string; override;
    function Mask : string; override;
  end;

  //обработчик файлов CSV
  TCSVFileReader = class(TFileReader)
  private
  public
    constructor Create; override;
    destructor Destroy; override;
    function ReadFile(AFileName : string; ASpreadSheet : TdxSpreadSheet) : boolean; override;
    function Caption : string; override;
    function Mask : string; override;
  end;

  //обработчик файлов txt
  TTXTFileReader = class(TCSVFileReader)
  private
  public
    function Caption : string; override;
    function Mask : string; override;
  end;

  //обработчик файлов XML
  TXMLFileReader = class(TFileReader)
  private
  public
    constructor Create; override;
    destructor Destroy; override;
    function ReadFile(AFileName : string; ASpreadSheet : TdxSpreadSheet) : boolean; override;
    function Caption : string; override;
    function Mask : string; override;
  end;

//регистрация класса чтения формата
procedure RegisterFileReaderClass(AFileReaderClass : TFileReaderClass);

//снятие с регистрации класса чтения формата
procedure UnRegisterFileReaderClass(AFileReaderClass : TFileReaderClass);

//поиск фильтра по маске
function FindFilterByMask(AMask : string) : TFileReader;

//поиск фильтра по надписи
function FindFilterByCaption(ACaption : string) : TFileReader;

//поиск фильтра по классу
function FindFilterByClass(AClass : TFileReaderClass) : TFileReader;

//получение количества фильтров по маске
function FilterCountByMask(AMask : string) : integer;

//AFields - список колонок: строка, поля разделяются символом ";", именем и названием знак "="
//Пример: Name=Название;Address=Адрес
//ARequiredFields - простой список обязательных полей, поля разделяются символом ";"

procedure ImportXLS(
      AFields, ARequiredFields : string;
      AQuota : char;
      ADelimiter : char;
      AInsteadQuota : char;
      AInsteadDelimiter : char;
      AProcName : string;
      AProc : TImportProcedure);

implementation

{$R *.dfm}

uses
  UDatas, UConsts, DTKUtils, UUtil, UWaiting, UProgress, mesdlg, UOptions,
  StrUtils, USelectType, MainUnit, DBF, JclAnsiStrings, JclSimpleXML,
  WideStrUtils;

var
  FilterList : TStringList = nil;

const
  cDigits : set of char = ['0'..'9'];

//регистрация класса чтения формата
procedure RegisterFileReaderClass(AFileReaderClass : TFileReaderClass);
  var
    i : integer;
    vFileReader : TFileReader;
begin
  i := 0;
  while (i <= (FilterList.Count - 1)) and not (FilterList.Objects[i].ClassType = AFileReaderClass) do
    inc(i);

  if i > (FilterList.Count - 1) then
  begin
    vFileReader := AFileReaderClass.Create;
    FilterList.AddObject(vFileReader.Caption + '|' + vFileReader.Mask, vFileReader);
  end;
end;

//снятие с регистрации класса чтения формата
procedure UnRegisterFileReaderClass(AFileReaderClass : TFileReaderClass);
  var
    i : integer;
    vFileReader : TFileReader;
begin
  i := 0;
  while (i <= (FilterList.Count - 1)) and not (FilterList.Objects[i].ClassType = AFileReaderClass) do
    inc(i);

  if i <= (FilterList.Count - 1) then
  begin
    vFileReader := TFileReader(FilterList.Objects[i]);
    FilterList.Delete(i);
    vFileReader.Destroy;
  end;
end;

//поиск фильтра по расширению
function FindFilterByMask(AMask : string) : TFileReader;
  var
    i : integer;
begin
  AMask := AnsiLowerCase(AMask);
  i := 0;
  Result := nil;
  while (i <= (FilterList.Count - 1)) and (AnsiLowerCase(TFileReader(FilterList.Objects[i]).Mask) <> AMask) do
  begin
    Inc(i);
  end;
  if i <= (FilterList.Count - 1) then
    Result := TFileReader(FilterList.Objects[i]);
end;

//поиск фильтра по надписи
function FindFilterByCaption(ACaption : string) : TFileReader;
  var
    i : integer;
begin
  ACaption := AnsiLowerCase(ACaption);
  i := 0;
  Result := nil;
  while (i <= (FilterList.Count - 1)) and (AnsiLowerCase(TFileReader(FilterList.Objects[i]).Caption) <> ACaption) do
  begin
    Inc(i);
  end;
  if i <= (FilterList.Count - 1) then
    Result := TFileReader(FilterList.Objects[i]);
end;

//поиск фильтра по классу
function FindFilterByClass(AClass : TFileReaderClass) : TFileReader;
  var
    i : integer;
begin
  i := 0;
  Result := nil;
  while (i <= (FilterList.Count - 1)) and (TFileReader(FilterList.Objects[i]).ClassType <> AClass) do
  begin
    Inc(i);
  end;
  if i <= (FilterList.Count - 1) then
    Result := TFileReader(FilterList.Objects[i]);
end;

//получение количества фильтров по маске
function FilterCountByMask(AMask : string) : integer;
  var
    i : integer;
begin
  AMask := AnsiLowerCase(AMask);
  i := 0;
  Result := 0;
  while (i <= (FilterList.Count - 1)) do
  begin
    if (AnsiLowerCase(TFileReader(FilterList.Objects[i]).Mask) = AMask) then Result := Result + 1;

    Inc(i);
  end;
end;

procedure ImportXLS(
      AFields, ARequiredFields : string;
      AQuota : char;
      ADelimiter : char;
      AInsteadQuota : char;
      AInsteadDelimiter : char;
      AProcName : string;
      AProc : TImportProcedure);
  var
    s : string;
begin
  with TImportDataForm.Create(nil) do
    try
      FImportProc := AProc;
      FProcName := AProcName;

      FQuota := AQuota;
      FDelimiter := ADelimiter;
      FInsteadQuota := AInsteadQuota;
      FInsteadDelimiter := AInsteadDelimiter;

      UpdateFilter;

      mdDatas.Open;

      FillFields(AFields, ARequiredFields);

      FillCaption;

      PropertiesStore.StorageName := cIniFileName;
      PropertiesStore.RestoreFrom;

      LoadFields('');

      ShowModal;

      SaveFields('');

      mdDatas.Close;
    finally
      Free;
    end;
end;

{ TEmployeeParamForm }

procedure TImportDataForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TImportDataForm.aCancelExecute(Sender: TObject);
begin
  if dsEdit = mdDatas.State then mdDatas.Post;

  ModalResult := mrCancel;
end;

procedure TImportDataForm.aClearColExecute(Sender: TObject);
  var
    r : integer;
begin
  r := mdDatas.RecNo;
  mdDatas.DisableControls;
  mdDatas.First;
  while not mdDatas.eof do
  begin
    mdDatas.Edit;
    mdDatas.FieldByName('FieldColumn').AsString := '';
    mdDatas.FieldByName('DefaultValue').AsString := '';
    mdDatas.Post;
    mdDatas.Next;
  end;
  mdDatas.RecNo := r;
  mdDatas.EnableControls;
end;

procedure TImportDataForm.aDeleteFileExecute(Sender: TObject);
  var
    s : string;
begin
  s := IsNull(eCaption.EditValue, '');
  if (s <> '') then
    if ShowMsg('Действительно удалить шаблон "' + s + '"?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
    begin
      s := FProcName + '(' + s + ').col';
      DeleteFile(CurrentDir + s);
      FillCaption;
      eCaption.EditValue := '';
    end;
end;

procedure TImportDataForm.aGetColExecute(Sender: TObject);
  var
    s : string;
begin
  s := IsNUll(eCaption.EditValue, '');
  if TcxComboBoxProperties(eCaption.Properties).Items.IndexOf(s) > -1 then
    LoadFields(s);
end;

procedure TImportDataForm.aImportExecute(Sender: TObject);
begin
  if CheckData then
  begin
    PrepareNow;
    SpreadSheet.BeginUpdate;
    try
      DoImport;
    finally
      SpreadSheet.EndUpdate;
    end;
    ShowMsg('Время импорта данных: ' + TimeToStr(CurrentDateTime), smtInformation, [smbOK], smbOK, smbOK);

    Application.Restore;
    Application.BringToFront;
  end;
end;

procedure TImportDataForm.aOpenFileExecute(Sender: TObject);
  var
    vFileReader : TFileReader;
    s, s1, s2 : string;
begin
  OpenDialog.InitialDir := cABSImportDir;

  if OpenDialog.Execute then
    if not FileExists(OpenDialog.FileName) then ShowMsg('Файл не существует!', smtInformation, [smbOK], smbOK, smbOK)
    else
    begin
      FFileName := OpenDialog.FileName;
      PrepareNow;

      Application.ProcessMessages;

      //определяем строку фильтра
      vFileReader := TFileReader(FilterList.Objects[OpenDialog.FilterIndex - 1]);

      try
        vFileReader.ReadFile(OpenDialog.FileName, SpreadSheet);
      except
        on e : exception do ShowMsg('Во время чтения файла возникла ошибка:'#13#10 + E.Message, smtError, [smbOK], smbOK, smbOK);
      end;

//      eFirst.Value := 1;
      eLast.EditValue :=  SpreadSheet.ActiveSheetAsTable.Rows.Count;

      //берем связываение колонки
      s := vFileReader.FieldMapping;
      mdDatas.ReadOnly := false;
      if s <> '' then
      begin
        UpdateMapping(vFileReader.FieldMapping);
        mdDatas.ReadOnly := true;
      end;

      //ShowMsg('Время чтения файла: ' + TimeToStr(CurrentDateTime), smtInformation, [smbOK], smbOK, smbOK);

      s1 := ExtractFilePath(OpenDialog.FileName);
      s1 := CorrectPath(s1);
      s2 := cABSImportDir;
      s2 := CorrectPath(s2);
      if s1 <> s2 then
        if ShowMsg('Запомнить путь для импорта данных?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
        begin
          cImportDir := s1;
          cABSImportDir := s1;
        end;

    end;
  SetOKEnabled;
end;

procedure TImportDataForm.aSaveFileExecute(Sender: TObject);
  var
    s1, s2 : string;
begin
  SaveDialog.InitialDir := cABSImportDir;

  if SaveDialog.Execute then
  begin
    FFileName := SaveDialog.FileName;
    PrepareNow;

    Application.ProcessMessages;

    ShowProgress('Запись файла...');
    try
      SpreadSheet.OnProgress := SpreadSheetProgress;
      SpreadSheet.SaveToFile(SaveDialog.FileName);
      SpreadSheet.OnProgress := nil;
    finally
      HideProgress;
    end;

    ShowMsg('Время записи файла: ' + TimeToStr(CurrentDateTime), smtInformation, [smbOK], smbOK, smbOK);

    s1 := ExtractFilePath(SaveDialog.FileName);
    s1 := CorrectPath(s1);
    s2 := cABSImportDir;
    s2 := CorrectPath(s2);
    if s1 <> s2 then
      if ShowMsg('Запомнить путь для импорта данных?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
      begin
        cImportDir := s1;
        cABSImportDir := s1;
      end;

  end;
  SetOKEnabled;
end;

procedure TImportDataForm.aSetColExecute(Sender: TObject);
  var
    s : string;
begin
  s := IsNUll(eCaption.EditValue, '');
  SaveFields(s);
  FillCaption;
end;

function TImportDataForm.CheckData: boolean;
  var
    vFieldName : string;
begin
  vFieldName := mdDatas.FieldByName('FieldName').AsString;
  mdDatas.DisableControls;
  mdDatas.First;
  Result := true;
  while not mdDatas.eof and Result do
  begin
    Result := not mdDatas.FieldByName('Required').AsBoolean or (mdDatas.FieldByName('FieldColumn').AsString <> '') or (mdDatas.FieldByName('DefaultValue').AsString <> '');;
    if Result then mdDatas.Next;
  end;
  if not Result then ShowMsg('Не указана колонка для поля "' + mdDatas.FieldByName('FieldCaption').AsString + '"!', smtInformation, [smbOK], smbOK, smbOK)
  else
  begin
    Result := eFirst.EditValue <= eLast.EditValue;
    if not Result then ShowMsg('Первая строка должна быть не больше последней!', smtInformation, [smbOK], smbOK, smbOK);
  end;
  mdDatas.EnableControls;
end;

procedure TImportDataForm.DBGridDBTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
{  if Key = #13 then
  begin
    if mdDatas.RecordCount = mdDatas.REcNo then mdDatas.First
    else mdDatas.Next;
  end;}
end;

procedure TImportDataForm.DBGridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  var
    v : variant;
begin
  v := ARecord.Values[2];
  if IsNull(v, false) = true then
  begin
    AStyle := TcxStyle.Create(self);
    AStyle.Font.Style := AStyle.Font.Style + [fsBold];
  end;
end;

procedure TImportDataForm.DBGridExit(Sender: TObject);
begin
  if dsEdit = mdDatas.State then mdDatas.Post;
end;

procedure TImportDataForm.DoImport;
  var
    i, n, f, l, rc : integer;
    r, s, t : string;
    vCell : TdxSpreadSheetCell;
begin
  ShowProgress(cDataImport, true);
  mdDatas.DisableControls;
  try
    f := Round(eFirst.EditValue);
    l := Round(eLast.EditValue);
    n := l - f + 1;
    if mdDatas.Locate('FieldName', 'ImportRes', []) then
      rc := mdDatas.FieldByName('FieldColumn').AsInteger
    else
      rc := 0;
    for i := f to l do
    begin
      ChangeProgress((i - f + 1) / n * 100, 'Строка №' + IntToStr(i));
      s := '';
      mdDatas.First;
      while not mdDatas.eof do
      begin
        if mdDatas.FieldByName('FieldColumn').Value = null then t := mdDatas.FieldByName('DefaultValue').AsString
        else
        begin
          vCell := SpreadSheet.ActiveSheetAsTable.Cells[i - 1, mdDatas.FieldByName('FieldColumn').AsInteger - 1];
          if Assigned(vCell) then t := vCell.AsString
          else t := '';
          if t = '' then t := mdDatas.FieldByName('DefaultValue').AsString;
        end;

        //подменяем кавычки и разделители, встретившиеся в тексте
        t := ReplaceStr(t, FQuota, FInsteadQuota);
        t := ReplaceStr(t, FDelimiter, FInsteadDelimiter);

        s := s +
          mdDatas.FieldByName('FieldName').AsString + '=' + FQuota + t + FQuota;

        mdDatas.Next;
        if not mdDatas.eof then s := s + FDelimiter;
      end;

      if Assigned(FImportProc) then
      begin
        r := FImportProc(s);
        if rc <> 0 then
        begin
          vCell := SpreadSheet.ActiveSheetAsTable.Cells[i - 1, rc - 1];
          if not Assigned(vCell) then vCell := SpreadSheet.ActiveSheetAsTable.CreateCell(i - 1, rc - 1);
          vCell.SetText(r);
        end;
      end;

      if TerminatedProgress then Break;

    end;
  finally
    mdDatas.EnableControls;
    HideProgress;
  end;
end;

procedure TImportDataForm.eCaptionPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  eCaption.EditValue := DisplayValue;
end;

procedure TImportDataForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TImportDataForm.eFirst_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then Key := vk_Tab;
end;

procedure TImportDataForm.SaveFields(ACap : string);
  var
    s : string;
    r : integer;
    vStringList : TStringList;
begin
  vStringList := TStringList.Create;
  r := mdDatas.RecNo;
  mdDatas.DisableControls;
  try
    mdDatas.First;
    while not mdDatas.eof do
    begin
      vStringList.Add(mdDatas.FieldByName('FieldName').AsString + '=' + mdDatas.FieldByName('FieldColumn').AsString + ',' + mdDatas.FieldByName('DefaultValue').AsString);
      mdDatas.Next;
    end;
  finally
    mdDatas.RecNo := r;
    mdDatas.EnableControls;
  end;

  vStringList.SaveToFile(CurrentDir + FProcName + '(' + ACap + ').col');

  vStringList.Free;
end;

procedure TImportDataForm.SetOKEnabled;
begin
  StatusBar.Panels[0].Text := FFileName;
end;

procedure TImportDataForm.SpreadSheetDblClick(Sender: TObject);
  var
    n : integer;
begin
  if DBGridDBTableView.Controller.FocusedColumn = DBGridDBTableViewFieldColumn then
  begin
    n := SpreadSheet.ActiveSheetAsTable.Selection.FocusedColumn;
    if mdDatas.State <> dsEdit then mdDatas.Edit;
    mdDatas.FieldByName('FieldColumn').AsInteger := n + 1;
    mdDatas.Post;
  end;
end;

procedure TImportDataForm.SpreadSheetProgress(Sender: TObject; Percent: Integer);
begin
  ChangeProgress(Percent);
end;

procedure TImportDataForm.TreeScannerFileFound(Sender: TObject);
  var
    s : string;
    p : integer;
begin
  s := TreeScanner.FileFound;
  p := Pos('(', s);
  if p > 0 then
  begin
    s := Copy(s, p + 1, Length(s) - p);
    p := Pos(')', s);
    if p > 0 then
    begin
      s := Copy(s, 1, p - 1);
      TcxComboBoxProperties(eCaption.Properties).Items.Add(s);
    end;
  end;
end;

procedure TImportDataForm.UpdateFilter;
  var
    i : integer;
    s : string;
begin
  s := '';
  for i := 0 to FilterList.Count - 1 do
  begin
    s := s + FilterList[i] + '|';
  end;
  s := LeftStr(s, Length(s) - 1);
  FFilter := s;
  OpenDialog.Filter := s;
end;

procedure TImportDataForm.UpdateMapping(AFieldMapping: string);
  var
    n, i : integer;
    vMapping, vFields : TStringList;
    s : string;
    vCell : TdxSpreadSheetCell;
begin
  vFields := TStringList.Create;
  vMapping := TStringList.Create;
  vMapping.Delimiter := ';';
  vMapping.StrictDelimiter := true;
  vMapping.DelimitedText := AFieldMapping;

  mdDatas.DisableControls;
  try
    i := 0;
    //читаем все колонки найденные в формате
    repeat
      vCell := SpreadSheet.ActiveSheetAsTable.Cells[0, i];
      if Assigned(vCell) then  s := vCell.DisplayText
      else s := '';
      if s <> '' then vFields.Add(s);
      inc(i);
    until s = '';

    //пробегаемся по таблице полей

    mdDatas.First;
    while not mdDatas.eof do
    begin
      s := mdDatas.FieldByName('FieldName').AsString;
      n := vMapping.IndexOfName(s);
      if n <> -1 then
      begin
        s := vMapping.ValueFromIndex[n];
        n := vFields.IndexOf(s);
        if n <> -1 then
        begin
          mdDatas.Edit;
          mdDatas.FieldByName('FieldColumn').AsInteger := n + 1;
          mdDatas.Post;
        end;
      end;
      mdDatas.Next;
    end;
  finally
    mdDatas.First;;
    mdDatas.EnableControls;
    vFields.Free;
    vMapping.Free;
  end;
end;

procedure TImportDataForm.FillFields(AFields, ARequired: string);
  var
    vRequired, vStrings : TStringList;
    i : integer;
begin
  vRequired := TStringList.Create;
  vRequired.Delimiter := ';';
  vRequired.StrictDelimiter := true;
  vRequired.DelimitedText := ARequired;

  vStrings := TStringList.Create;
  vStrings.Delimiter := ';';
  vStrings.QuoteChar := '"';
  vStrings.StrictDelimiter := true;
  vStrings.DelimitedText := AFields;
  for i := 0 to vStrings.Count - 1 do
  begin
    mdDatas.Append;
    mdDatas.FieldByName('FieldName').AsString := vStrings.Names[i];
    mdDatas.FieldByName('FieldCaption').AsString := vStrings.ValueFromIndex[i];
    mdDatas.FieldByName('FieldColumn').AsString := '';
    mdDatas.FieldByName('Required').AsBoolean := vRequired.IndexOf(vStrings.Names[i]) <> -1;
    mdDatas.Post;
  end;

  mdDatas.Append;
  mdDatas.FieldByName('FieldName').AsString := 'ImportRes';
  mdDatas.FieldByName('FieldCaption').AsString := 'Результат';
  mdDatas.FieldByName('FieldColumn').AsString := '';
  mdDatas.FieldByName('Required').AsBoolean := false;
  mdDatas.Post;

  vStrings.Free;
  vRequired.Free;

  mdDatas.First;
end;

procedure TImportDataForm.FillCaption;
  var
    s : string;
begin
  s := IsNUll(eCaption.EditValue, '');

  TcxComboBoxProperties(eCaption.Properties).Items.Clear;

  TreeScanner.InitialDirectory := CurrentDir;
  TreeScanner.FileMask := FProcName + '*.col';
  TreeScanner.ScanTree;

  eCaption.EditValue := s;
end;

procedure TImportDataForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PropertiesStore.StoreTo(false);
end;

procedure TImportDataForm.FormCreate(Sender: TObject);
begin
  FFileName := '';

  SpreadSheet.ClearAll;
  SpreadSheet.AddSheet;
end;

procedure TImportDataForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TImportDataForm.LoadFields(ACap : string);
  var
    s, f, v : string;
    r, i : integer;
    vStringList : TStringList;
begin
  f := CurrentDir + FProcName + '(' + ACap + ').col';

  if not FileExists(f) then Exit;

  vStringList := TStringList.Create;
  vStringList.LoadFromFile(f);
  r := mdDatas.RecNo;
  mdDatas.DisableControls;
  try
    for i := 0 to vStringList.Count - 1 do
    begin
      f := vStringList.Names[i];
      v := vStringList.Values[f];

      s := '';
      while (Length(v) >= 1) and (v[1] in cDigits) do
      begin
        s := s + v[1];
        Delete(v, 1, 1);
      end;

      if (Length(v) >= 1) and (v[1] = ',') then Delete(v, 1, 1);

      if (s <> '') or (v <> '') then
      begin
        if mdDatas.Locate('FieldName', f, []) then
        begin
          mdDatas.Edit;
          if IsIntegerByChar(s) then
            mdDatas.FieldByname('FieldColumn').AsInteger := StrToInt(s);
          mdDatas.FieldByname('DefaultValue').AsString := v;
          mdDatas.Post;
        end;
      end;
    end;
  finally
    mdDatas.RecNo := r;
    mdDatas.EnableControls;
  end;

  vStringList.Free;
end;

{ TFileReader }

function TFileReader.Caption: string;
begin
  Result := '';
end;

function TFileReader.FieldMapping: string;
begin
  Result := '';
end;

function TFileReader.Mask: string;
begin
  Result := '';
end;

{ TXLSFileReader }

function TXLSFileReader.Caption: string;
begin
  Result := 'Файл Excel';
end;

constructor TXLSFileReader.Create;
begin
  inherited;
end;

destructor TXLSFileReader.Destroy;
begin

  inherited;
end;

function TXLSFileReader.Mask: string;
begin
  Result := '*.xls;*.xlsx';
end;

function TXLSFileReader.ReadFile(AFileName: string;
  ASpreadSheet: TdxSpreadSheet): boolean;
begin
  ShowProgress('Чтение файла...');
  try
    ASpreadSheet.OnProgress := SpreadSheetProgress;
    ASpreadSheet.LoadFromFile(AFileName);
    ASpreadSheet.OnProgress := nil;
    Result := true;
  finally
    HideProgress;
  end;

  ASpreadSheet.OptionsView.R1C1Reference := true;
end;

procedure TXLSFileReader.SpreadSheetProgress(Sender: TObject; Percent: integer);
begin
  ChangeProgress(Percent);
end;

{ TAllFileReader }

function TAllFileReader.Caption: string;
begin
  Result := 'Все файлы';
end;

constructor TAllFileReader.Create;
begin
  FMapping := '';
end;

destructor TAllFileReader.Destroy;
begin

  inherited;
end;

function TAllFileReader.FieldMapping: string;
begin
  Result := FMapping;
end;

function TAllFileReader.Mask: string;
begin
  Result := '*.*';
end;

function TAllFileReader.ReadFile(AFileName: string;
  ASpreadSheet: TdxSpreadSheet): boolean;
  var
    vExt, s : string;
    n, i : integer;
    vFileReader : TFileReader;
begin
  //ищем подходящий тип файла среди фильтров
  vExt := '*' + ExtractFileExt(AFileName);

  if FindFilterByMask(vExt) = nil then
  begin
    //читаем Excel, т.к. нет подходящего фильтра по расширению
    vFileReader := FindFilterByClass(TXLSFileReader);
  end
  else
    if FilterCountByMask(vExt) = 1 then
    begin
      //если фильтр единственный
      vFileReader := FindFilterByMask(vExt);
    end
    else
    begin
      s := '';
      for i := 0 to FilterList.Count - 1 do
      begin
        if AnsiLowerCase(TFileReader(FilterList.Objects[i]).Mask) = AnsiLowerCase(vExt) then
          s := s + TFileReader(FilterList.Objects[i]).Caption + ';';
      end;
      s := LeftStr(s, Length(s) - 1);

      //если подходящих фильтров куча, спрашиваем пользователя
      n := SelectType('Выбор фильтра для чтения файла', s);

      if n = -1 then
        vFileReader := FindFilterByClass(TXLSFileReader)
      else
      begin
        s := StringByIndex(s, n);

        vFileReader := FindFilterByCaption(s);
      end;
    end;

  //нашли нужный тип
  FMapping := vFileReader.FieldMapping;
  Result := vFileReader.ReadFile(AFileName, ASpreadSheet);
end;

{ TDBFFileReader }

function TDBFFileReader.Caption: string;
begin
  Result := 'Файл DBF';
end;

constructor TDBFFileReader.Create;
begin

end;

destructor TDBFFileReader.Destroy;
begin

  inherited;
end;

function TDBFFileReader.Mask: string;
begin
  Result := '*.dbf';
end;

function TDBFFileReader.ReadFile(AFileName: string;
  ASpreadSheet: TdxSpreadSheet): boolean;
  var
    vDBF : TDBF;
    c, i, j : integer;
    vCell : TdxSpreadSheetCell;
    sf, st : ansistring;
    vOEM : boolean;
begin
  vDBF := TDBF.Create(nil);

  vOEM := false;

  if ShowMsg('Преобразовать кодировку?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
    vOEM := true;

  ASpreadSheet.BeginUpdate;
  ASpreadSheet.ClearAll;
  ASpreadSheet.AddSheet.CellStyles.Formats.DefaultFormat.FormatCode := '@';
  ShowProgress('Чтение файла...');

  try
    vDBF.FilePath := ExtractFilePath(AFileName);
    vDBF.TableName := ExtractFileName(AFileName);
    vDBF.Open;

    //добавляем заголовки
    for j := 0 to vDBF.Fields.Count - 1 do
    begin
      vCell := ASpreadSheet.ActiveSheetAsTable.Cells[0, j];
      if not Assigned(vCell) then vCell := ASpreadSheet.ActiveSheetAsTable.CreateCell(0, j);

      vCell.SetText(vDBF.Fields[j].FieldName);
    end;

    c := vDBF.RecordCount;
    i := 0;
    while not vDBF.eof do
    begin
      ChangeProgress(i / c * 100);
      //добавляем заголовки
      for j := 0 to vDBF.Fields.Count - 1 do
      begin
        vCell :=  ASpreadSheet.ActiveSheetAsTable.Cells[i + 1, j];
        if not Assigned(vCell) then vCell := ASpreadSheet.ActiveSheetAsTable.CreateCell(i + 1, j);

        if vOEM then
        begin
          sf := vDBF.Fields[j].AsAnsiString;
          st := StrOemToAnsi(sf);
        end
        else
        begin
          sf := vDBF.Fields[j].AsAnsiString;
          st := sf;
        end;

        vCell.SetText(st);
      end;
      inc(i);
      vDBF.Next;
    end;

    ChangeProgress(100);
    Result := true;

    vDBF.Close;
  finally
    vDBF.Free;
    ASpreadSheet.EndUpdate;
    HideProgress;
  end;

  ASpreadSheet.OptionsView.R1C1Reference := true;
end;

{ TCSVFileReader }

function TCSVFileReader.Caption: string;
begin
  Result := 'Файл CSV';
end;

constructor TCSVFileReader.Create;
begin

end;

destructor TCSVFileReader.Destroy;
begin

  inherited;
end;

function TCSVFileReader.Mask: string;
begin
  Result := '*.csv';
end;

function TCSVFileReader.ReadFile(AFileName: string;
  ASpreadSheet: TdxSpreadSheet): boolean;
  var
    vFile, vRecord : TStringList;
    i, j, n : integer;
    vCell : TdxSpreadSheetCell;
    vOEM : boolean;
    sf, st : ansistring;
begin
  Result := false;
  n := SelectType('Выбор вида разделителя', 'Точка с запятой;Запятая;Символ табуляции;Вертикальная черта;Пробел');
  if n = -1 then Exit;

  if ShowMsg('Преобразовать кодировку?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
    vOEM := true;

  vFile := TStringList.Create;
  vRecord := TStringList.Create;
  case n of
    0: vRecord.Delimiter := ';';
    1: vRecord.Delimiter := ',';
    2: vRecord.Delimiter := Char(vk_Tab);
    3: vRecord.Delimiter := '|';
    4: vRecord.Delimiter := ' ';
  end;

  vRecord.StrictDelimiter := true;
  ASpreadSheet.BeginUpdate;
  ASpreadSheet.ClearAll;
  ASpreadSheet.AddSheet.CellStyles.Formats.DefaultFormat.FormatCode := '@';
  ShowProgress('Чтение файла...');
  try
    vFile.LoadFromFile(AFileName);
    for i := 0 to vFile.Count - 1 do
    begin
      ChangeProgress(i / vFile.Count * 100);
      vRecord.DelimitedText := vFile[i];
      for j := 0 to vRecord.Count - 1 do
      begin
        vCell := ASpreadSheet.ActiveSheetAsTable.Cells[i, j];
        if not Assigned(vCell) then vCell := ASpreadSheet.ActiveSheetAsTable.CreateCell(i, j);

        if vOEM then
        begin
          sf := vRecord[j];
          st := StrOemToAnsi(sf);
        end
        else st := vRecord[j];

        vCell.AsString := st;
      end;
    end;
    ChangeProgress(100);
    Result := true;
  finally
    ASpreadSheet.EndUpdate;
    vRecord.Free;
    vFile.Free;
    HideProgress;
  end;

  ASpreadSheet.OptionsView.R1C1Reference := true;
end;

{ TTXTFileReader }

function TTXTFileReader.Caption: string;
begin
  Result := 'Текстовый файл';
end;

function TTXTFileReader.Mask: string;
begin
  Result := '*.txt';
end;

{ TXMLFileReader }

function TXMLFileReader.Caption: string;
begin
  Result := 'Файл XML';
end;

constructor TXMLFileReader.Create;
begin

end;

destructor TXMLFileReader.Destroy;
begin

  inherited;
end;

function TXMLFileReader.Mask: string;
begin
  Result := '*.xml';
end;

function TXMLFileReader.ReadFile(AFileName: string;
  ASpreadSheet: TdxSpreadSheet): boolean;
  var
    vCell : TdxSpreadSheetCell;
    i, c, n, j, k, m, l, vCount : integer;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    vXML : TJclSimpleXML;
    vOK : boolean;
    vFields, vFieldsRow : TStringList;
    v, s, f : string;
begin
  Result := false;

  vXML := TJclSimpleXML.Create;

  ShowWaiting('Открытие файла...');
  vOK := false;
  try
//    XMLDocument.Active := true;
    vXML.LoadFromFile(AFileName);
    HideWaiting;
    vOK := true;
  except
    on e : exception do
    begin
      HideWaiting;
      ShowMessage('Не удалось открыть файл!');
    end;
  end;

  if not vOK then
  begin
    vXML.Free;
    Exit;
  end;

  vRoot := vXML.Root;

  if (vRoot = nil) then ShowMessage('Не найден родительский узел!')
  else
  begin
    c := 0; // количество нужных элементов
    n := 0; // общее количество элементов

    vFields := TStringList.Create;
    vFieldsRow := TStringList.Create;

    ShowProgress('Проверка файла...', true);

    n := vRoot.ItemCount;

    for i := 0 to n - 1 do
    begin
      ChangeProgress(i / n * 100, 'Поиск полей - ' + IntToStr(i));

      if (i mod 1000) = 0 then
      begin
        Application.ProcessMessages;
      end;

      if TerminatedProgress then Break;

      vChild := vRoot.Items[i];

      k := vChild.ItemCount;

      vFieldsRow.Clear;

      for j := 0 to k - 1 do
      begin
        vData := vChild.Items[j];

        s := vData.Name;

        m := 0;
        f := s;
        while vFieldsRow.IndexOf(f) <> -1 do
        begin
          inc(m);
          f := s + IntToStr(m);
        end;

        vFieldsRow.Add(f);
        v := vData.Value;
        if IsUtf8String(v) then v := UTF8ToString(v);
        if vFields.IndexOfName(f) = -1 then
        begin
          vFields.Add(f + '=' + IntToStr(Length(v)));
        end
        else
        begin
          l := StrToInt(vFields.Values[f]);
          if Length(v) > l then
          vFields.Values[f] := IntToStr(Length(v));
        end;
      end;

      inc(c);

    end;
    if not TerminatedProgress then
    begin
      ChangeProgress(100);
      Sleep(500);
      HideProgress;
    end;

    if not TerminatedProgress  then
    begin
      ShowMsg('Найены информационные поля: '#13#10 + vFields.Text, smtInformation, [smbOK], smbOK, smbOK, 5);

      ASpreadSheet.BeginUpdate;
      ASpreadSheet.ClearAll;
      ASpreadSheet.AddSheet.CellStyles.Formats.DefaultFormat.FormatCode := '@';
      ShowProgress('Чтение файла...', true);
      try
        //добавляем заголовки
        for i := 0 to vFields.Count - 1 do
        begin
          v := vFields.Names[i];

          vCell := ASpreadSheet.ActiveSheetAsTable.CreateCell(0, i);

          vCell.SetText(v);
        end;

        for i := 0 to n - 1 do
        begin
          ChangeProgress(i / n * 100, 'Чтение данных - ' + IntToStr(i));

          if (i mod 1000) = 0 then
          begin
            Application.ProcessMessages;
          end;

          if TerminatedProgress then Break;

          vChild := vRoot.Items[i];

          //нашли узел подходящий, теперь смотрим колонки

          k := vChild.ItemCount;

          vFieldsRow.Clear;

          for j := 0 to k - 1 do
          begin
            vData := vChild.Items[j];

            s := vData.Name;

            m := 0;
            f := s;
            while vFieldsRow.IndexOf(f) <> -1 do
            begin
              inc(m);
              f := s + IntToStr(m);
            end;

            vFieldsRow.Add(f);

            v := vData.Value;
            if IsUtf8String(v) then v := UTF8ToString(v);

            //ищем номер колонки в эксель
            l := vFields.IndexOfName(f);

            vCell := ASpreadSheet.ActiveSheetAsTable.CreateCell(i + 1, l);

            vCell.SetText(v);
          end;
        end;

        ChangeProgress(100);
        Sleep(500);
      finally
        vFields.Free;
        vFieldsRow.Free;
        vXML.Free;
        ASpreadSheet.EndUpdate;
        HideProgress;
      end;
    end;
  end;

  HideProgress;

  ASpreadSheet.OptionsView.R1C1Reference := true;
end;

initialization
  FilterList := TStringList.Create;

  //Все файлы
  RegisterFileReaderClass(TAllFileReader);
  //XLS
  RegisterFileReaderClass(TXLSFileReader);
  //CSV
  RegisterFileReaderClass(TCSVFileReader);
  //DBF
  RegisterFileReaderClass(TDBFFileReader);
  //XML
  RegisterFileReaderClass(TXMLFileReader);
  //TXT
  RegisterFileReaderClass(TTXTFileReader);

finalization

  //Все файлы
  UnRegisterFileReaderClass(TAllFileReader);
  //XLS
  UnRegisterFileReaderClass(TXLSFileReader);
  //CSV
  UnRegisterFileReaderClass(TCSVFileReader);
  //DBF
  unRegisterFileReaderClass(TDBFFileReader);
  //XML
  UnRegisterFileReaderClass(TXMLFileReader);
  //TXT
  UnRegisterFileReaderClass(TTXTFileReader);

  FilterList.Free;
end.
