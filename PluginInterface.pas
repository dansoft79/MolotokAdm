//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Интерфейс для плагинов
//
//------------------------------------------------------------------------------
unit PluginInterface;

interface

uses
  Classes, Windows, SysUtils, Controls;

type
  TIShowMsgType = (
    ismtWarning,        { предупреждение }
    ismtError,          { ошибка }
    ismtInformation,    { информация }
    ismtConfirmation);  { подтверждение }

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

  //основной интерфейс
  IMainInterface = interface
  ['{D15B47BE-DC36-4B5A-8BC8-C95A8BA70E0A}']
    //получение подключения
    function Connected : boolean; stdcall;
    //строка подключения server="server";database="database"...
    function GetConnectionString : string; stdcall;

    //получение имени или файла программы
    function GetIniFileName : string; stdcall;

    //получение текущего рабочего месяца
    function GetCurrentWorkMonth : string; stdcall;

    //получение серверного времени
    function GetServerTime : TDateTime; stdcall;

    //получение директории для экспортируемых файлов
    function GetExportDir : string; stdcall;
    //получение директории для импортируемых файлов
    function GetImportDir : string; stdcall;

    //работа с окном ожидания
    procedure CallShowWaiting(AText : string); stdcall;
    procedure CallChangeWaiting(AText : string); stdcall;
    procedure CallHideWaiting; stdcall;

    //работа с прогрессом
    procedure CallShowProgress(ATitle : string; ACancelButton : boolean = false; AConfirmTerminate : boolean = true); stdcall;
    procedure CallChangeProgress(AProgress : double; AText : string = ''); stdcall;
    function CallTerminatedProgress : boolean; stdcall;
    procedure CallHideProgress; stdcall;

    //диалог
    function CallShowMsg(AText : string; AMsgType : TIShowMsgType; AButtons : TIShowMsgButtons; ADefaultButton, ACancelButton : TIShowMsgButton; ATime : integer) : integer; stdcall;

    //пользователь
    function GetUserID : integer; stdcall;
    function GetUserAdmin : boolean; stdcall;
    function GetUserName : string; stdcall;

    //показать текст
    procedure ShowText(AText : string; ACaption : string = ''); stdcall;

    //чтение данных запроса
    function CallReadValuesSQL(ASQL : string; ANames : string): variant; stdcall;
    //чтение полей таблицы
    function CallReadValues(ATableName : string; ANames : string; AID : integer = -1): variant; stdcall;
    //чтение таблицы настроек
    function CallReadOptions(ANames : string): variant; stdcall;
  end;

  IPluginInterface = interface
  ['{D55AE57A-3579-40F2-8FA4-6995E7280040}']
    //основной интерфейс
    procedure SetMainInterface(AMainInterface : IMainInterface); stdcall;

    //краткое описание
    function GetDescription : string; stdcall;

    //получение количества процедур в плагине
    function CommandCount : integer; stdcall;

    //получение текста команды
    function GetCommandCaption(ACommand : integer) : string; stdcall;

    //получение разрешенности команды
    function GetCommandEnabled(ACommand : integer) : boolean; stdcall;

    //получение картинки
    function GetCommandBitmap(ACommand : integer) : HBITMAP; stdcall;

    //получение картинки
    function GetCommandBitmapBig(ACommand : integer) : HBITMAP; stdcall;

    //получение тэга работы с разрешениями
    function GetCommandPermit(ACommand : integer) : integer; stdcall;

    //вызов окна плагина
    procedure Execute(ACommand : integer); stdcall;

    //открыть соединение с базой
    procedure OpenConnection; stdcall;

    //закрыть соединение с базой
    procedure CloseConnection; stdcall;

    //передача строки подключения
    procedure SetConnectionString(AConnectionString : string); stdcall;
  end;

implementation

end.

