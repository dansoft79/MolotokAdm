//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ������ � ����������� �������
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
  ccReportDir = '������\';
  ccImportDir = '������\';
  ccExportDir = '�������\';
  ccDotDir = '�������\';
  ccBackupDir = 'Backup\';
  ccFileDir = '�����\';
  ccPluginDir = '����������\';

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

  //�����
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

  { ��������� }
  Server : string = '10.50.0.16';//��� �������
  Database : string = 'portalpro';//��� ���� ������
  Port : string = '3306';//����
  Protocol : string = 'mysql-5';//��������
  User : string = 'portalpro';//������������
  Password : string = 'gCttEW7b6yzYMetu';//������
  Params : string = 'codepage=utf8mb4';//���������

  SilentRun : boolean = false;{ ����� ������ }

  AutoUpdateInterval : integer = 1;{ �������� ���������� }
  DetailUpdateTime : integer = 500;{ ���������� ��������� ���������� � ������������ }

  DeletedRecordColor : TColor = $00CACAFF;{ ���� ��������� ������ ������� }

  ColorScheme : integer = 2;       //�������� �����
  NativeStyle : boolean = false;   //������ �����
  UseSkins : boolean = true;       //������������ �����
  CurrentSkin : string = 'Caramel';//������� �����
  OneWindow : boolean = true;      //����������� ���������

  ReportCreateTime : boolean = false;//���������� ����� �������� �������

  MinimizeToTray : boolean = false;//����������� � ����
  SavePassword : boolean = false;//��������� ������

  //��������� �����������
  cMySQLUtilPath : string = 'mysql.exe';
  cMySQLDumpUtilPath : string = 'mysqldump.exe';
  cMySQLIniFileName : string = '';
  cMySQLCharsetDir : string = 'charsets';

  //������ ���������
  UseBarcodeScanner : boolean = false;//������������ ������ �����-����
  ComPortName : string = 'COM1';//����
  BaudRate : integer = 9600;//�������� ������
  ScanTimeOut : integer = 100;//������� � ������������ ����� ������� ������

  //���������
  InterfaceType : string = '�������';

  //���������� ������
  CallToCommandLine : string = cDefCallToCommandLine;
  CallToParams : string = '';

procedure LoadOptions;{ ������ �������� }
procedure SaveOptions;{ ���������� �������� }

implementation

{$R *.dfm}

procedure LoadOptions;
  var
    vIniFile : TIniFile;
begin
  { ������ ���������� �� ��������� �� Ini-����� }
  vIniFile := TIniFile.Create(cIniFileNameSetup);
  with vIniFile do
  begin
    { ������ ���������� �� ini }
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

    { ���� }
    cSQLDir := ReadString('Setup', 'SQLDir', cSQLDir);
    cReportDir := ReadString('Setup', 'ReportDir', cReportDir);
    cImportDir := ReadString('Setup', 'ImportDir', cImportDir);
    cExportDir := ReadString('Setup', 'ExportDir', cExportDir);
    cDotDir := ReadString('Setup', 'DotDir', cDotDir);
    cBackupDir := ReadString('Setup', 'BackupDir', cBackupDir);
    cFileDir := ReadString('Setup', 'FileDir', cFileDir);
    cPluginDir := ReadString('Setup', 'PluginBPLDir', cPluginDir);

    //��������� �����������
    cMySQLUtilPath := ReadString('Setup', 'MySQLUtilPath', cMySQLUtilPath);
    cMySQLDumpUtilPath := ReadString('Setup', 'MySQLDumpUtilPath', cMySQLDumpUtilPath);
    cMySQLIniFileName := ReadString('Setup', 'MySQLIniFileName', cMySQLIniFileName);
    cMySQLCharsetDir := ReadString('Setup', 'MySQLCharsetDir', cMySQLCharsetDir);

    //������ ���������
    ComPortName := ReadString('Setup', 'ComPortName', ComPortName);
    BaudRate := ReadInteger('Setup', 'BaudRate', BaudRate);
    ScanTimeOut := ReadInteger('Setup', 'ScanTimeOut', ScanTimeOut);
    UseBarcodeScanner := ReadBool('Setup', 'UseBarcodeScanner', UseBarcodeScanner);

    //���������
    InterfaceType := ReadString('Setup', 'InterfaceType', InterfaceType);

    //�������������
    CallToCommandLine := ReadString('Setup', 'CallToCommandLine', CallToCommandLine);
    CallToParams := ReadString('Setup', 'CallToParams', CallToParams);
  end;
  vIniFile.Free;
end;

procedure SaveOptions;
  var
    vIniFile : TIniFile;
begin
  { ���������� ���������� �� ��������� �� Ini-����� }
  vIniFile := TIniFile.Create(cIniFileNameSetup);
  with vIniFile do
  begin
    { ������ ���������� � ini }
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

    { ���� }
    WriteString('Setup', 'SQLDir', cSQLDir);
    WriteString('Setup', 'ReportDir', cReportDir);
    WriteString('Setup', 'ImportDir', cImportDir);
    WriteString('Setup', 'ExportDir', cExportDir);
    WriteString('Setup', 'DotDir', cDotDir);
    WriteString('Setup', 'BackupDir', cBackupDir);
    WriteString('Setup', 'FileDir', cFileDir);
    WriteString('Setup', 'PluginDir', cPluginDir);

    //�����
    WriteBool('Setup', 'NativeStyle', NativeStyle);
    WriteBool('Setup', 'UseSkins', UseSkins);
    WriteString('Setup', 'CurrentSkin', CurrentSkin);

    //��������� �����������
    WriteString('Setup', 'MySQLUtilPath', cMySQLUtilPath);
    WriteString('Setup', 'MySQLDumpUtilPath', cMySQLDumpUtilPath);
    WriteString('Setup', 'MySQLIniFileName', cMySQLIniFileName);
    WriteString('Setup', 'MySQLCharsetDir', cMySQLCharsetDir);

    //������ ���������
    WriteBool('Setup', 'UseBarcodeScanner', UseBarcodeScanner);
    WriteString('Setup', 'ComPortName', ComPortName);
    WriteInteger('Setup', 'BaudRate', BaudRate);
    WriteInteger('Setup', 'ScanTimeOut', ScanTimeOut);

    //���������
    WriteString('Setup', 'InterfaceType', InterfaceType);

    //�������������
    WriteString('Setup', 'CallToCommandLine', CallToCommandLine);
    WriteString('Setup', 'CallToParams', CallToParams);
  end;
  vIniFile.Free;
end;

end.
