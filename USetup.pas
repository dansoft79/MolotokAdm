//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Настройка опций
//
//------------------------------------------------------------------------------
unit USetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls,
  Mask, ShellCtrls,  cxStyles, cxGraphics,
  cxEdit, cxTextEdit, cxSpinEdit, cxVGrid, cxControls,
  cxInplaceContainer, cxColorComboBox, cxExtEditRepositoryItems,
  cxShellEditRepositoryItems, Menus, cxLookAndFeelPainters, cxButtons,
  cxCheckBox, cxDropDownEdit, cxMRUEdit, cxPropertiesStore, 
  dxSkinsCore, dxSkinsDefaultPainters, ActnList, cxCalendar,
  cxShellBrowserDialog, cxEditRepositoryItems, cxButtonEdit, cxLookAndFeels,
  System.Actions, cxClasses;

type
  TFormSetup = class(TForm)
    VerticalGrid: TcxVerticalGrid;
    cMain: TcxCategoryRow;
    eServer: TcxEditorRow;
    eAutoUpdateInterval: TcxEditorRow;
    eDetailUpdateTime: TcxEditorRow;
    cHighlight: TcxCategoryRow;
    EditRepository: TcxEditRepository;
    ColorComboBox: TcxEditRepositoryColorComboBox;
    cDeleted: TcxEditorRow;
    cPath: TcxCategoryRow;
    eSQLDir: TcxEditorRow;
    eReportDir: TcxEditorRow;
    eImportDir: TcxEditorRow;
    eExportDir: TcxEditorRow;
    eDotDir: TcxEditorRow;
    cDataSorce: TcxCategoryRow;
    ePort: TcxEditorRow;
    eDatabase: TcxEditorRow;
    cColorScheme: TcxEditorRow;
    cNativeStyle: TcxEditorRow;
    PropertiesStore: TcxPropertiesStore;
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    ePassword: TcxEditorRow;
    eUser: TcxEditorRow;
    eProtocol: TcxEditorRow;
    eParams: TcxEditorRow;
    eReportCreateTime: TcxEditorRow;
    cUseSkins: TcxEditorRow;
    eSkin: TcxEditorRow;
    ActionList: TActionList;
    aOK: TAction;
    cbMinimizeToTray: TcxEditorRow;
    cbSavePassword: TcxEditorRow;
    eBackupDir: TcxEditorRow;
    cBackup: TcxCategoryRow;
    eMySQLUtilPath: TcxEditorRow;
    eMySQLDumpUtilPath: TcxEditorRow;
    eMySQLIniFileName: TcxEditorRow;
    eMySQLCharsetDir: TcxEditorRow;
    FolderDialog: TcxShellBrowserDialog;
    OpenDialog: TOpenDialog;
    DirButtonEdit: TcxEditRepositoryButtonItem;
    cBarcode: TcxCategoryRow;
    eComPortName: TcxEditorRow;
    eBaudRate: TcxEditorRow;
    eScanTimeOut: TcxEditorRow;
    eUseBarcodeScanner: TcxEditorRow;
    eSilentRun: TcxEditorRow;
    eFileDir: TcxEditorRow;
    eOneWindow: TcxEditorRow;
    eCallToCommandLine: TcxEditorRow;
    eCallToParams: TcxEditorRow;
    cAuto: TcxCategoryRow;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure DirButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eMySQLUtilPathEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eMySQLDumpUtilPathEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eMySQLIniFileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eServerEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eMySQLCharsetDirEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eCallToCommandLineEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FLastDir : string;
  public
    { Public declarations }
    procedure ReadOptions;{ инициализация настроек }
    procedure SaveOptions;{ сохранение настроек }

    procedure FillSkins;
  end;

function DoSetup : boolean;

implementation

{$R *.DFM}

uses
  db, UUtil, UOptions, UWaiting, MainUnit, strutils,
  USelectTypeMemData, UConnectionDatabase;

function DoSetup : boolean;
begin
  with TFormSetup.Create(Application) do
    try
      FLastDir := '';

      ReadOptions;

      Result := ShowModal = mrOK;

      Application.ProcessMessages;
      if Result then
      begin
        SaveOptions;
      end;
    finally
      Free;
    end;
end;

{ TFormSetup }

procedure TFormSetup.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFormSetup.DirButtonEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    s : string;
    vEditor : TcxEditorRow;
begin
  vEditor := TcxEditorRow(VerticalGrid.FocusedRow);
  s := vEditor.Properties.Value;

  if ExtractFileDrive(s) <> '' then FolderDialog.Path := s
  else FolderDialog.Path := MyDocDir + s;

  if FolderDialog.Execute then
  begin
    s := CorrectPath(FolderDialog.Path);

    if Pos(AnsiLowerCase(MyDocDir), Ansilowercase(s)) = 1 then s := RightStr(s, Length(s) - Length(MyDocDir));

    vEditor.Properties.Value := s;

    VerticalGrid.FocusedRow := nil;
    VerticalGrid.FocusedRow := vEditor;
  end;
end;

procedure TFormSetup.eCallToCommandLineEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0 :
    begin
      eCallToCommandLine.Properties.Value := cDefCallToCommandLine;
      eCallToParams.Properties.Value := '';
      VerticalGrid.FocusedRow := nil;
      VerticalGrid.FocusedRow := eCallToCommandLine;
    end;
    1:
    begin
      eCallToCommandLine.Properties.Value := '';
      eCallToParams.Properties.Value := '';
      VerticalGrid.FocusedRow := nil;
      VerticalGrid.FocusedRow := eCallToCommandLine;
    end;
  end;
end;

procedure TFormSetup.eMySQLCharsetDirEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    s : string;
    vEditor : TcxEditorRow;
begin
  vEditor := TcxEditorRow(VerticalGrid.FocusedRow);
  s := vEditor.Properties.Value;

  if ExtractFileDrive(s) <> '' then FolderDialog.Path := s
  else
    if FLastDir <> '' then FolderDialog.Path := FLastDir
    else FolderDialog.Path := ExtractFileDrive(Application.Exename) + '\';

  if FolderDialog.Execute then
  begin
    s := CorrectPath(FolderDialog.Path);

    vEditor.Properties.Value := s;
    FLastDir := ExtractFilePath(s);

    VerticalGrid.FocusedRow := nil;
    VerticalGrid.FocusedRow := vEditor;
  end;
end;

procedure TFormSetup.eMySQLDumpUtilPathEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
    vEditor : TcxEditorRow;
    s : string;
begin
  vEditor := TcxEditorRow(VerticalGrid.FocusedRow);
  s := vEditor.Properties.Value;
  OpenDialog.Filter := 'Утилита MySQLDump.exe|MySQLDump.exe';

  if s <> '' then OpenDialog.InitialDir := ExtractFilePath(s)
  else
    if FLastDir <> '' then OpenDialog.InitialDir := FLastDir
    else OpenDialog.InitialDir := ExtractFileDrive(Application.Exename);

  OpenDialog.FileName := ExtractFileName(s);
  if OpenDialog.Execute then
  begin
    vEditor.Properties.Value := OpenDialog.FileName;
    FLastDir := ExtractFilePath(OpenDialog.FileName);

    VerticalGrid.FocusedRow := nil;
    VerticalGrid.FocusedRow := vEditor;
  end;
end;

procedure TFormSetup.eMySQLIniFileNameEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    vEditor : TcxEditorRow;
    s : string;
begin
  vEditor := TcxEditorRow(VerticalGrid.FocusedRow);
  s := vEditor.Properties.Value;
  OpenDialog.Filter := 'Файл с настройками|*.ini';

  if s <> '' then OpenDialog.InitialDir := ExtractFilePath(s)
  else
    if FLastDir <> '' then OpenDialog.InitialDir := FLastDir
    else OpenDialog.InitialDir := ExtractFileDrive(Application.Exename);

  OpenDialog.FileName := ExtractFileName(s);
  if OpenDialog.Execute then
  begin
    vEditor.Properties.Value := OpenDialog.FileName;

    VerticalGrid.FocusedRow := nil;
    VerticalGrid.FocusedRow := vEditor;
  end;
end;

procedure TFormSetup.eMySQLUtilPathEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    vEditor : TcxEditorRow;
    s : string;
begin
  vEditor := TcxEditorRow(VerticalGrid.FocusedRow);
  s := vEditor.Properties.Value;
  OpenDialog.Filter := 'Утилита MySQL.exe|MySQL.exe';

  if s <> '' then OpenDialog.InitialDir := ExtractFilePath(s)
  else
    if FLastDir <> '' then OpenDialog.InitialDir := FLastDir
    else OpenDialog.InitialDir := ExtractFileDrive(Application.Exename);

  OpenDialog.FileName := ExtractFileName(s);
  if OpenDialog.Execute then
  begin
    vEditor.Properties.Value := OpenDialog.FileName;
    FLastDir := ExtractFilePath(OpenDialog.FileName);
           
    VerticalGrid.FocusedRow := nil;
    VerticalGrid.FocusedRow := vEditor;
  end;
end;

procedure TFormSetup.eServerEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    vFields : string;
    v : variant;
begin
  if AButtonIndex = 0 then
  begin
    vFields := SelectTypeMemData('Выбор сохраненного подключения', cIniFileNameDatas, 'server=Сервер;database=База данных;protocol=Протокол;port=Порт;user=Пользователь;password=Пароль;params=Параметры;comment=Комментарии', 788800);
    if vFields <> '' then
    begin
      eServer.Properties.Value := GetParamValue(vFields, 'server');
      eDatabase.Properties.Value := GetParamValue(vFields, 'database');
      eProtocol.Properties.Value := GetParamValue(vFields, 'protocol');
      ePort.Properties.Value := GetParamValue(vFields, 'port');
      eUser.Properties.Value := GetParamValue(vFields, 'user');
      ePassword.Properties.Value := GetParamValue(vFields, 'password');
      eParams.Properties.Value := GetParamValue(vFields, 'params');
    end;
  end
  else
    if AButtonIndex = 1 then
    begin
      //редактирование
      ConnectionDatabaseEditor;
    end
    else
      if AButtonIndex = 2 then
      begin
        //стираем
        eServer.Properties.Value := '';
        eDatabase.Properties.Value := '';
        eProtocol.Properties.Value := '';
        ePort.Properties.Value := '';
        eUser.Properties.Value := '';
        ePassword.Properties.Value := '';
        eParams.Properties.Value := '';
      end;
  VerticalGrid.FocusedRow := nil;
  VerticalGrid.FocusedRow := eServer;
end;

procedure TFormSetup.FillSkins;
  var
    i : integer;
begin
  for i := 0 to cxLookAndFeelPaintersManager.Count - 1 do
  begin
    if (cxLookAndFeelPaintersManager.Items[i].LookAndFeelStyle = lfsSkin) and
      (AnsiLowerCase(cxLookAndFeelPaintersManager.Items[i].LookAndFeelName) <> 'userskin')
    then
    begin
      TcxComboBoxProperties(eSkin.Properties.EditProperties).Items.Add(cxLookAndFeelPaintersManager.Items[i].LookAndFeelName);
    end;
  end;
end;

procedure TFormSetup.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFilename;
  PropertiesStore.RestoreFrom;
end;

procedure TFormSetup.FormDestroy(Sender: TObject);
begin
  with PropertiesStore do StoreTo(false);
end;

procedure TFormSetup.ReadOptions;
begin
  eServer.Properties.Value := Server;
  eDatabase.Properties.Value := Database;
  eProtocol.Properties.Value := Protocol;
  ePort.Properties.Value := Port;
  eUser.Properties.Value := User;
  ePassword.Properties.Value := Password;
  eParams.Properties.Value := Params;

  eAutoUpdateInterval.Properties.Value := AutoUpdateInterval;
  eDetailUpdateTime.Properties.Value := DetailUpdateTime;
  eReportCreateTime.Properties.Value := ReportCreateTime;

  cbMinimizeToTray.Properties.Value := MinimizeToTray;
  cbSavePassword.Properties.Value := SavePassword;
  eSilentRun.Properties.Value := SilentRun;
  eOneWindow.Properties.Value := OneWindow;

  { подсветка }
  FillSkins;
  SetItemIndex(cColorScheme.Properties, ColorScheme);
  cNativeStyle.Properties.Value := NativeStyle;
  cUseSkins.Properties.Value := UseSkins;
  eSkin.Properties.Value := CurrentSkin;

  cDeleted.Properties.Value := DeletedRecordColor;
  { пути }
  eSQLDir.Properties.Value := cSQLDir;
  eReportDir.Properties.Value := cReportDir;
  eImportDir.Properties.Value := cImportDir;
  eExportDir.Properties.Value := cExportDir;
  eDotDir.Properties.Value := cDotDir;
  eBackupDir.Properties.Value := cBackupDir;
  eFileDir.Properties.Value := cFileDir;

  { резервное копирование }
  eMySQLUtilPath.Properties.Value := cMySQLUtilPath;
  eMySQLDumpUtilPath.Properties.Value := cMySQLDumpUtilPath;
  eMySQLIniFileName.Properties.Value := cMySQLIniFileName;
  eMySQLCharsetDir.Properties.Value := cMySQLCharsetDir;

  //сканер штрихкода
  eUseBarcodeScanner.Properties.Value := UseBarcodeScanner;
  eComPortName.Properties.Value := ComPortName;
  eBaudRate.Properties.Value := BaudRate;
  eScanTimeOut.Properties.Value := ScanTimeout;

  { автоматизация }
  eCallToCommandLine.Properties.Value := CallToCommandLine;
  eCallToParams.Properties.Value := CallToParams;
end;

procedure TFormSetup.SaveOptions;
begin
  Server := IsNull(eServer.Properties.Value, '');
  Database := IsNull(eDatabase.Properties.Value, '');
  Protocol := IsNull(eProtocol.Properties.Value, '');
  Port := IsNull(ePort.Properties.Value, 0);
  User := IsNull(eUser.Properties.Value, '');
  Password := IsNull(ePassword.Properties.Value, '');
  Params := IsNull(eParams.Properties.Value, '');

  AutoUpdateInterval := eAutoUpdateInterval.Properties.Value;
  DetailUpdateTime := eDetailUpdateTime.Properties.Value;
  ReportCreateTime := eReportCreateTime.Properties.Value;

  SavePassword := cbSavePassword.Properties.Value;
  MinimizeToTray := cbMinimizeToTray.Properties.Value;
  SilentRun := eSilentRun.Properties.Value;
  OneWindow := eOneWindow.Properties.Value;

  { подсветка }
  ColorScheme := GetItemIndex(cColorScheme.Properties);
  NativeStyle := IsNull(cNativeStyle.Properties.Value, false);
  UseSkins := cUseSkins.Properties.Value;
  CurrentSkin := eSkin.Properties.Value;
  DeletedRecordColor := cDeleted.Properties.Value;

  { пути }
  cSQLDir := IsNull(eSQLDir.Properties.Value, '');
  cReportDir := IsNull(eReportDir.Properties.Value, '');
  cImportDir := IsNull(eImportDir.Properties.Value, '');
  cExportDir := IsNull(eExportDir.Properties.Value, '');
  cDotDir := IsNull(eDotDir.Properties.Value, '');
  cBackupDir := IsNull(eBackupDir.Properties.Value, '');
  cFileDir := IsNull(eFileDir.Properties.Value, '');

  { резервное копирование }
  cMySQLUtilPath := IsNull(eMySQLUtilPath.Properties.Value, '');
  cMySQLDumpUtilPath := IsNull(eMySQLDumpUtilPath.Properties.Value, '');
  cMySQLIniFileName := IsNull(eMySQLIniFileName.Properties.Value, '');
  cMySQLCharsetDir := IsNull(eMySQLCharsetDir.Properties.Value, '');

  //сканер штрихкода
  UseBarcodeScanner := eUseBarcodeScanner.Properties.Value;
  ComPortName := IsNull(eComPortName.Properties.Value, 'COM1');
  BaudRate := IsNull(eBaudRate.Properties.Value, 9600);
  ScanTimeout := IsNull(eScanTimeOut.Properties.Value, 100);

  { автоматизация }
  CallToCommandLine := IfNull(eCallToCommandLine.Properties.Value, '');
  CallToParams := IfNull(eCallToParams.Properties.Value, '');
end;

end.
