//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ��������� ��� ��������
//
//------------------------------------------------------------------------------
unit PluginInterface;

interface

uses
  Classes, Windows, SysUtils, Controls;

type
  TIShowMsgType = (
    ismtWarning,        { �������������� }
    ismtError,          { ������ }
    ismtInformation,    { ���������� }
    ismtConfirmation);  { ������������� }

  TIShowMsgButton = (
    ismbNone,
    ismbYes,
    ismbNo,
    ismbOK,
    ismbCancel,
    ismbAbort,
    ismbRetry,
    ismbIgnore,
    ismbAll,
    ismbNoToAll,
    ismbYesToAll);

  TIShowMsgButtons = set of TIShowMsgButton;

  //�������� ���������
  IMainInterface = interface
  ['{D15B47BE-DC36-4B5A-8BC8-C95A8BA70E0A}']
    //��������� �����������
    function Connected : boolean; stdcall;
    //������ ����������� server="server";database="database"...
    function GetConnectionString : string; stdcall;

    //��������� ����� ��� ����� ���������
    function GetIniFileName : string; stdcall;

    //��������� �������� �������� ������
    function GetCurrentWorkMonth : string; stdcall;

    //��������� ���������� �������
    function GetServerTime : TDateTime; stdcall;

    //��������� ���������� ��� �������������� ������
    function GetExportDir : string; stdcall;
    //��������� ���������� ��� ������������� ������
    function GetImportDir : string; stdcall;

    //������ � ����� ��������
    procedure CallShowWaiting(AText : string); stdcall;
    procedure CallChangeWaiting(AText : string); stdcall;
    procedure CallHideWaiting; stdcall;

    //������ � ����������
    procedure CallShowProgress(ATitle : string; ACancelButton : boolean = false; AConfirmTerminate : boolean = true); stdcall;
    procedure CallChangeProgress(AProgress : double; AText : string = ''); stdcall;
    function CallTerminatedProgress : boolean; stdcall;
    procedure CallHideProgress; stdcall;

    //������
    function CallShowMsg(AText : string; AMsgType : TIShowMsgType; AButtons : TIShowMsgButtons; ADefaultButton, ACancelButton : TIShowMsgButton; ATime : integer) : integer; stdcall;

    //������������
    function GetUserID : integer; stdcall;
    function GetUserAdmin : boolean; stdcall;
    function GetUserName : string; stdcall;

    //�������� �����
    procedure ShowText(AText : string; ACaption : string = ''); stdcall;

    //������ ������ �������
    function CallReadValuesSQL(ASQL : string; ANames : string): variant; stdcall;
    //������ ����� �������
    function CallReadValues(ATableName : string; ANames : string; AID : integer = -1): variant; stdcall;
    //������ ������� ��������
    function CallReadOptions(ANames : string): variant; stdcall;
  end;

  IPluginInterface = interface
  ['{D55AE57A-3579-40F2-8FA4-6995E7280040}']
    //�������� ���������
    procedure SetMainInterface(AMainInterface : IMainInterface); stdcall;

    //������� ��������
    function GetDescription : string; stdcall;

    //��������� ���������� �������� � �������
    function CommandCount : integer; stdcall;

    //��������� ������ �������
    function GetCommandCaption(ACommand : integer) : string; stdcall;

    //��������� ������������� �������
    function GetCommandEnabled(ACommand : integer) : boolean; stdcall;

    //��������� ��������
    function GetCommandBitmap(ACommand : integer) : HBITMAP; stdcall;

    //��������� ��������
    function GetCommandBitmapBig(ACommand : integer) : HBITMAP; stdcall;

    //��������� ���� ������ � ������������
    function GetCommandPermit(ACommand : integer) : integer; stdcall;

    //����� ���� �������
    procedure Execute(ACommand : integer); stdcall;

    //������� ���������� � �����
    procedure OpenConnection; stdcall;

    //������� ���������� � �����
    procedure CloseConnection; stdcall;

    //�������� ������ �����������
    procedure SetConnectionString(AConnectionString : string); stdcall;
  end;

implementation

end.

