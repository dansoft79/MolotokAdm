//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Модуль с глобальными опциями
//
//------------------------------------------------------------------------------
unit UOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles;

type
  TFormOptions = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  ccSQLDir = 'SQL\';
  ccReportDir = 'Отчеты\';
  ccImportDir = 'Импорт\';
  ccExportDir = 'Экспорт\';
  ccDotDir = 'Шаблоны\';
  ccBackupDir = 'Backup\';
  ccFileDir = 'Файлы\';
  ccPluginDir = 'Расширения\';

  cDefCallToCommandLine = 'tel:<phone>';

var
  FormOptions : TFormOptions = nil;

  CurrentDir : string = '';
  AppDir : string = '';
  MyDocDir : string = '';
  TempDir : string = '';

  cIniFileNameMainForm : string = '';
  cIniFileNameSetup : string = '';
  cIniFileName : string = '';
  cIniFileNameToolBar : string = '';
  cIniFileNameDatas : string = '';

  cMainDockIniFileName : string = '';

  //папки
  cSQLDir : string = ccSQLDir;
  cReportDir : string = ccReportDir;
  cImportDir : string = ccImportDir;
  cExportDir : string = ccExportDir;
  cDotDir : string = ccDotDir;
  cBackupDir : string = ccBackupDir;
  cFileDir : string = ccFileDir;
  cPluginDir : string = ccPluginDir;

  cABSSQLDir : string = '';
  cABSReportDir : string = '';
  cABSImportDir : string = '';
  cABSExportDir : string = '';
  cABSDotDir : string = '';
  cABSBackupDir : string = '';
  cABSFileDir : string = '';
  cABSFileTempDir : string = '';
  cABSFileEmailDir : string = '';
  cABSPluginDir : string = '';

  { настройки }
  Server : string = '10.50.0.16';//имя сервера
  Database : string = 'portalpro';//имя базы данных
  Port : string = '3306';//порт
  Protocol : string = 'mysql-5';//протокол
  User : string = 'portalpro';//пользователь
  Password : string = 'gCttEW7b6yzYMetu';//пароль
  Params : string = 'codepage=utf8mb4';//параметры

  SilentRun : boolean = false;{ тихий запуск }

  AutoUpdateInterval : integer = 1;{ интервал обновления }
  DetailUpdateTime : integer = 500;{ обновление детальной информации в милисекундах }

  DeletedRecordColor : TColor = $00CACAFF;{ цвет удаленной записи журнала }

  ColorScheme : integer = 2;       //цветовая схема
  NativeStyle : boolean = false;   //родной стиль
  UseSkins : boolean = true;       //использовать шкуры
  CurrentSkin : string = 'Caramel';//текущая шкура
  OneWindow : boolean = true;      //однооконный интерфейс

  ReportCreateTime : boolean = false;//показывать время создания отчетов

  MinimizeToTray : boolean = false;//сворачивать в трей
  SavePassword : boolean = false;//сохранить пароль

  //резервное копирование
  cMySQLUtilPath : string = 'mysql.exe';
  cMySQLDumpUtilPath : string = 'mysqldump.exe';
  cMySQLIniFileName : string = '';
  cMySQLCharsetDir : string = 'charsets';

  //сканер штрихкода
  UseBarcodeScanner : boolean = false;//использовать сканер штрих-кода
  ComPortName : string = 'COM1';//порт
  BaudRate : integer = 9600;//скорость обмена
  ScanTimeOut : integer = 100;//таймаут в милисекундах перед началом чтения

  //интерфейс
  InterfaceType : string = 'Эксперт';

  //телефонные звонки
  CallToCommandLine : string = cDefCallToCommandLine;
  CallToParams : string = '';

procedure LoadOptions;{ чтение настроек }
procedure SaveOptions;{ сохранение настроек }

implementation

{$R *.dfm}

procedure LoadOptions;
  var
    vIniFile : TIniFile;
begin
  { чтение переменных по умолчанию из Ini-файла }
  vIniFile := TIniFile.Create(cIniFileNameSetup);
  with vIniFile do
  begin
    { чтение параметров из ini }
    Server := ReadString('Setup', 'Server', Server);
    Database := ReadString('Setup', 'Database', Database);
    Port := ReadString('Setup', 'Port', Port);
    Protocol := ReadString('Setup', 'Protocol', Protocol);
    User := ReadString('Setup', 'User', User);
    Password := ReadString('Setup', 'Password', Password);
    Params := ReadString('Setup', 'Params', Params);

    AutoUpdateInterval := ReadInteger('Setup', 'AutoUpdateInterval', AutoUpdateInterval);
    if AutoUpdateInterval < 1 then AutoUpdateInterval := 1
    else
      if AutoUpdateInterval > 60 then AutoUpdateInterval := 60;

    DetailUpdateTime := ReadInteger('Setup', 'DetailUpdateTime', DetailUpdateTime);

    ReportCreateTime := ReadBool('Setup', 'ReportCreateTime', ReportCreateTime);

    SilentRun := ReadBool('Setup', 'SilentRun', SilentRun);
    OneWindow := ReadBool('Setup', 'OneWindow', OneWindow);

    DeletedRecordColor := ReadInteger('Setup', 'DeletedRecordColor', DeletedRecordColor);

    ColorScheme := ReadInteger('Setup', 'ColorScheme', ColorScheme);
    NativeStyle := ReadBool('Setup', 'NativeStyle', NativeStyle);
    UseSkins := ReadBool('Setup', 'UseSkins', UseSkins);
    CurrentSkin := ReadString('Setup', 'CurrentSkin', CurrentSkin);

    MinimizeToTray := ReadBool('Setup', 'MinimizeToTray', MinimizeToTray);
    SavePassword := ReadBool('Setup', 'SavePassword', SavePassword);

    { пути }
    cSQLDir := ReadString('Setup', 'SQLDir', cSQLDir);
    cReportDir := ReadString('Setup', 'ReportDir', cReportDir);
    cImportDir := ReadString('Setup', 'ImportDir', cImportDir);
    cExportDir := ReadString('Setup', 'ExportDir', cExportDir);
    cDotDir := ReadString('Setup', 'DotDir', cDotDir);
    cBackupDir := ReadString('Setup', 'BackupDir', cBackupDir);
    cFileDir := ReadString('Setup', 'FileDir', cFileDir);
    cPluginDir := ReadString('Setup', 'PluginBPLDir', cPluginDir);

    //резервное копирование
    cMySQLUtilPath := ReadString('Setup', 'MySQLUtilPath', cMySQLUtilPath);
    cMySQLDumpUtilPath := ReadString('Setup', 'MySQLDumpUtilPath', cMySQLDumpUtilPath);
    cMySQLIniFileName := ReadString('Setup', 'MySQLIniFileName', cMySQLIniFileName);
    cMySQLCharsetDir := ReadString('Setup', 'MySQLCharsetDir', cMySQLCharsetDir);

    //сканер штрихкода
    ComPortName := ReadString('Setup', 'ComPortName', ComPortName);
    BaudRate := ReadInteger('Setup', 'BaudRate', BaudRate);
    ScanTimeOut := ReadInteger('Setup', 'ScanTimeOut', ScanTimeOut);
    UseBarcodeScanner := ReadBool('Setup', 'UseBarcodeScanner', UseBarcodeScanner);

    //интерфейс
    InterfaceType := ReadString('Setup', 'InterfaceType', InterfaceType);

    //автоматизация
    CallToCommandLine := ReadString('Setup', 'CallToCommandLine', CallToCommandLine);
    CallToParams := ReadString('Setup', 'CallToParams', CallToParams);
  end;
  vIniFile.Free;
end;

procedure SaveOptions;
  var
    vIniFile : TIniFile;
begin
  { сохранение переменных по умолчанию из Ini-файла }
  vIniFile := TIniFile.Create(cIniFileNameSetup);
  with vIniFile do
  begin
    { запись параметров в ini }
    WriteString('Setup', 'Server', Server);
    WriteString('Setup', 'Database', Database);
    WriteString('Setup', 'Port', Port);
    WriteString('Setup', 'Protocol', Protocol);
    WriteString('Setup', 'User', User);
    WriteString('Setup', 'Password', Password);
    WriteString('Setup', 'Params', Params);

    WriteInteger('Setup', 'AutoUpdateInterval', AutoUpdateInterval);
    WriteInteger('Setup', 'DetailUpdateTime', DetailUpdateTime);
    WriteBool('Setup', 'ReportCreateTime', ReportCreateTime);

    WriteBool('Setup', 'SilentRun', SilentRun);
    WriteBool('Setup', 'OneWindow', OneWindow);

    WriteInteger('Setup', 'DeletedRecordColor', DeletedRecordColor);

    WriteInteger('Setup', 'ColorScheme', ColorScheme);

    WriteBool('Setup', 'MinimizeToTray', MinimizeToTray);
    WriteBool('Setup', 'SavePassword', SavePassword);

    { пути }
    WriteString('Setup', 'SQLDir', cSQLDir);
    WriteString('Setup', 'ReportDir', cReportDir);
    WriteString('Setup', 'ImportDir', cImportDir);
    WriteString('Setup', 'ExportDir', cExportDir);
    WriteString('Setup', 'DotDir', cDotDir);
    WriteString('Setup', 'BackupDir', cBackupDir);
    WriteString('Setup', 'FileDir', cFileDir);
    WriteString('Setup', 'PluginDir', cPluginDir);

    //шкуры
    WriteBool('Setup', 'NativeStyle', NativeStyle);
    WriteBool('Setup', 'UseSkins', UseSkins);
    WriteString('Setup', 'CurrentSkin', CurrentSkin);

    //резервное копирование
    WriteString('Setup', 'MySQLUtilPath', cMySQLUtilPath);
    WriteString('Setup', 'MySQLDumpUtilPath', cMySQLDumpUtilPath);
    WriteString('Setup', 'MySQLIniFileName', cMySQLIniFileName);
    WriteString('Setup', 'MySQLCharsetDir', cMySQLCharsetDir);

    //сканер штрихкода
    WriteBool('Setup', 'UseBarcodeScanner', UseBarcodeScanner);
    WriteString('Setup', 'ComPortName', ComPortName);
    WriteInteger('Setup', 'BaudRate', BaudRate);
    WriteInteger('Setup', 'ScanTimeOut', ScanTimeOut);

    //интерфейс
    WriteString('Setup', 'InterfaceType', InterfaceType);

    //автоматизация
    WriteString('Setup', 'CallToCommandLine', CallToCommandLine);
    WriteString('Setup', 'CallToParams', CallToParams);
  end;
  vIniFile.Free;
end;

end.
