//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Модуль вспомогательных функций
//
//------------------------------------------------------------------------------
unit UUtil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, Grids, DBGrids, UConsts, StdCtrls, ActnList, RichEdit,
  ComCtrls, jvVersionInfo, Menus, Types, LbCipher,
  LbClass, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxStyles, cxCheckBox, cxInplaceContainer, cxVGrid, ImgList,
  DTKPermissionActnList, dxBar, dxBarExtItems, ZAbstractRODataset,
  cxBarEditItem, cxCheckComboBox,
  ZAbstractDataset, ZDataset, ZConnection, ExtCtrls, TeeProcs, TeEngine,
  BinaryFile, dxSkinsCore, dxSkinsdxBarPainter, cxMemo, cxRichEdit, cxClasses,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdMessage, IdAttachmentFile, IdCoderHeader, idtext,
  IdReplySMTP, IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent,
  IdHTTP, System.ImageList, cxImageList, cxGrid, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  cxDateUtils;

type
  TExecState = (esNormal, esMinimized, esMaximized, esHidden);
  TUtilForm = class(TForm)
    pmColumns: TPopupMenu;
    pmcDiv: TMenuItem;
    pmcCustom: TMenuItem;
    StyleRepositoryCarriage: TcxStyleRepository;
    bf7ZDLL: TBinaryFile;
    ImageList: TcxImageList;
    ImageListBig: TcxImageList;
    IdSMTP1: TIdSMTP;
    IdOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    il32x32: TcxImageList;
    il16x16: TcxImageList;
    bfBorlandmem: TBinaryFile;
    bfLibmysql: TBinaryFile;
    ImageListTag: TcxImageList;
    ImageListTagLarge: TcxImageList;
    procedure SevenZipListfile(Sender: TObject; Filename: WideString;
      Fileindex, FileSizeU, FileSizeP, Fileattr, Filecrc: Int64;
      Filemethod: WideString; FileTime: Double);
    procedure SevenZipPreProgress(Sender: TObject; MaxProgress: Int64);
    procedure SevenZipProgress(Sender: TObject; Filename: WideString;
      FilePosArc, FilePosFile: Int64);
    procedure pmColumnsPopup(Sender: TObject);
    procedure pmColumnClick(Sender: TObject);
    procedure pmcCustomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FMaxProgress : int64;
    FSQLFile : string;
    FSQLFileIndex : string;
    FCharset : string;
    procedure OnInitializeISO(var VHeaderEncoding: Char; var VCharSet: string);
  public
    { Public declarations }
    property EMAILCharset : string read FCharset write FCharset;
  end;

  TKeyProc = function : PChar;
  TEnumWindowProc = procedure (AForm : TForm) of object;

  TFormClass = class of TForm;

  TWinItem = class(TCollectionItem)
  private
    FForm: TForm;
    FCaption: string;
    FCategory: string;
    FImageIndex: integer;
    procedure SetCaption(const Value: string);
    procedure SetCategory(const Value: string);
    procedure SetForm(const Value: TForm);
    procedure SetImageIndex(const Value: integer);
  public
    property Form : TForm read FForm write SetForm;
    property Category : string read FCategory write SetCategory;
    property Caption : string read FCaption write SetCaption;
    property ImageIndex : integer read FImageIndex write SetImageIndex;
  end;

  TWinList = class(TCollection)
    function GetItem(Index: Integer): TWinItem;
    procedure SetItem(Index: Integer; const Value: TWinItem);
  private
    FActiveForm : TForm;
    FOnChange: TNotifyEvent;
    procedure SetOnChange(const Value: TNotifyEvent);
    function GetActiveForm: TForm;
  protected
    function GetOwner: TPersistent; override;
    procedure DoChanged;
  published
  public
    constructor Create; virtual;

    //проверка существования группы
    function GroupExists(AGroupName : string) : boolean;

    function FindByForm(AForm : TForm) : TWinItem;
    function FindByFormClass(AFormClass : TFormClass) : TWinItem;

    function ExistsFormClass(AFormClass : TFormClass) : boolean;

    function Insert(Index: Integer): TWinItem;
    function Add: TWinItem;
    procedure Remove(AWinItem : TWinItem);
    procedure Delete(AIndex : integer);
    property Items[Index: Integer]: TWinItem read GetItem write SetItem; default;

    procedure CloseAll;

    procedure SelectWin(AForm : TForm);

    property OnChange : TNotifyEvent read FOnChange write SetOnChange;

    property ActiveForm : TForm read GetActiveForm;

  end;

  TCategoryInfo = record
    Name : string;
    ImageIndex : integer;
  end;

  TBarManagerHelper = class helper for TdxBarManager
  public
    procedure LoadFromIniFile(const AFileName: string);
  end;

{  TFormHelper = class helper for TForm
  public
    constructor Create(AOwner: TComponent);
  end;}

  TFileScanner = class(TComponent)
  private
    { Private declarations }
    FOnFileFound: TNotifyEvent;          // where to notify for file found
    FOnDirectoryFound: TNotifyEvent;     // where to notify for start of directory
    FOnDirectoryDone: TNotifyEvent;      // where to notify for end of directory
    FFoundObject: String;                // full file or directory name
    FInitialDirectory: String;           // starting point in the tree
    FFileMask: String;                   // files to search for e.g. *.EXE
    FSearchInProgress: Boolean;          // true whilst searching
  protected
    { Protected declarations }
    procedure scan_directory (const dir: string);
  public
    { Public declarations }
    Continue: Boolean;                   // caller sets the false to interrupt
    constructor Create (AOwner: TComponent);  override;
    procedure ScanTree;                  // call here to scan tree
  published
    { Published declarations }
    property OnDirectoryFound: TNotifyEvent read FOnDirectoryFound write FOnDirectoryFound;
    property OnDirectoryDone: TNotifyEvent read FOnDirectoryDone write FOnDirectoryDone;
    property OnFileFound: TNotifyEvent read FOnFileFound write FOnFileFound;
    property FileFound: String read FFoundObject;
    property SearchInProgress: Boolean read FSearchInProgress;
    property InitialDirectory: String read FInitialDirectory write FInitialDirectory;
    property FileMask: String read FFileMask write FFileMask;
  end;

const
  ProgramID: TGUID = '{C994F01F-C82B-46E4-BD26-8DF7F89FFF4C}';

var
  UtilForm : TUtilForm = nil;

  WinList : TWinList = nil;

{  CurPainter: TcxCustomLookAndFeelPainterClass = nil;
  CurPainterInfo: TdxSkinLookAndFeelPainterInfo = nil;
  CurSkin: TdxSkin = nil;}

const
  cCategoryCount = 14;
  cCategories : array [0..cCategoryCount-1] Of TCategoryInfo = (
    (Name : 'Файл'; ImageIndex : -1),
    (Name : 'Грузы'; ImageIndex : 34),
    (Name : 'Перевозки'; ImageIndex : 130),
    (Name : 'Контрагенты'; ImageIndex : 204),
    (Name : 'Заказчики'; ImageIndex : 205),
    (Name : 'Исполнители'; ImageIndex : 206),
    (Name : 'Действия'; ImageIndex : 207),
    (Name : 'Отчеты'; ImageIndex : 208),
    (Name : 'Справочники'; ImageIndex : 117),
    (Name : 'Окно'; ImageIndex : 10),
    (Name : 'Помощь'; ImageIndex : 11),
    (Name : 'Покупатели'; ImageIndex : 204),
    (Name : 'Продавцы'; ImageIndex : 204),
    (Name : 'Дополнительно'; ImageIndex : -1)
  );
{ вещественное число, округленное до тысячных долей }
function GetDoubleToThousand(ADouble : double) : double;

{ получение списка разрешений }
procedure GetAllPermissions(APermissions : TStringList);

{ получение списка текстовых разрешений }
procedure GetAllTextPermissions(ATextPermissions : TStringList);

{ преобразование текста в разрешений }
procedure TextToPermissions(ATextPermission, APermission : TStringList);

{ преобразование разрешений в тестовые }
procedure PermissionsToText(APermission, ATextPermission : TStringList);

{ возвращает true, если редактирование в действии по указанному имени разрешено }
function CanEditInActionByName(AName : string) : boolean;

{ возвращает true, если редактирование в действии по указанному действию разрешено }
function CanEditInActionByAction(AAction : TAction) : boolean;

{ возвращает true, если показывать инструмент можно }
function CanShowAction(AAction : TAction) : boolean;

{ поиск колонки в DBGRID }
function FindColumn(ADBGrid : TDBGrid; AFieldName : string) : integer;

{ создание каталогов }
procedure CreateDirs;

{ запись информации из Rich2 в Rich1 }
procedure AssignRich(Rich1 : TRichEdit; Rich2: TRichEdit); overload;

{ корректировка имени папки }
function CorrectPath(APath : string) : string;

{ корректировка имени папки в Интернет }
function CorrectPathFTP(APath : string) : string;

{ получение строки в виде списка целых чисел }
function GetIntegerListString(AInteger : TIntegerDynArray) : string;

{ получение строки в виде списка строк }
function GetStringListString(AString : TStringDynArray) : string;

{ заполнение выпадающего списка значениями из набора данных }
procedure FillComboBox(ADataset : TDataset; AComboBox : TComboBox; ATextField, AIDField : string); overload;

{ заполнение списка строк значениями из набора данных }
procedure FillComboBox(ADataset : TDataset; AComboBox : TcxComboBox; ATextField, AIDField : string); overload;

//заполнение списка строк значениями из набора данных
procedure FillStrings(ADataset : TDataset; AStrings : TStrings; ATextField, AIDField : string); overload;

//продвинутая заливка комбобокса
function FillComboBoxExSQL(AComboBox: TComboBox; ASQL: string; ATextField, AIDField: string) : boolean; overload;

//продвинутая заливка комбобокса
function FillComboBoxExSQL(AComboBox: TcxComboBox; ASQL: string; ATextField, AIDField: string) : boolean; overload;

//заполнение списка строк значениями из набора данных
function FillStringsExSQL(ASQL : string; AStrings : TStrings; ATextField, AIDField : string) : boolean; overload;

//продвинутая заливка комбобокса
function FillComboBoxEx(AComboBox: TComboBox; ATableName : string; ATextField, AIDField: string) : boolean; overload;

//продвинутая заливка комбобокса
function FillComboBoxEx(AComboBox: TcxComboBox; ATableName : string; ATextField, AIDField: string) : boolean; overload;

//заполнение выпадающего списка значениями из набора данных
procedure FillPropComboBox(ADataset : TDataset; AComboBox : TcxEditorRowProperties; ATextField, AIDField : string);

//продвинутая заливка комбобокса
function FillPropComboBoxExSQL(AComboBox : TcxEditorRowProperties; ASQL: string; ATextField, AIDField: string) : boolean; overload;

//заполнение выпадающего списка значениями из набора данных
procedure FillBarComboBox(ADataset : TDataset; AComboBox : TdxBarCombo; ATextField, AIDField : string); overload;

//заполнение выпадающего списка значениями из набора данных
procedure FillBarComboBox(ADataset : TDataset; AComboBox : TcxBarEditItem; ATextField, AIDField : string); overload;

//заполнение выпадающего списка значениями из набора данных
procedure FillBarCheckComboBox(ADataset : TDataset; AComboBox : TcxBarEditItem; ATextField, AShortTextField, AIDField : string); overload;

//продвинутая заливка комбобокса
function FillBarComboBoxExSQL(AComboBox : TdxBarCombo; ASQL: string; ATextField, AIDField: string) : boolean; overload;

//продвинутая заливка чек-комбобокса
function FillBarCheckComboBoxExSQL(AComboBox : TcxBarEditItem; ASQL: string; ATextField, AShortText, AIDField: string) : boolean;

//продвинутая заливка комбобокса
function FillBarComboBoxExSQL(AComboBox : TcxBarEditItem; ASQL: string; ATextField, AIDField: string) : boolean; overload;

//получение списка идентификаторов для BarCheckCombo
function GetBarCheckComboboxIDList(AComboBox : TcxBarEditItem) : string;

//если Null, то возврат другого значения
function IsNull(AValue, ARes : variant) : variant;

//проверка на пустое значение
function IfNull(AValue : variant; ADefValue : variant) : variant;

//если значение равно нулю, то возврат Null
function NullIfZero(AValue : variant) : variant;

//получение зашифрованной строки
function GetCipherStr(AName, APass : string) : string;

//получение расшифрованной строки
function GetDeсipherStr(AName, APass : string) : string;

//получение хэша строки
function GetHashStr(AName : string) : string;

// установить ItemIndex по идентификатору
function SetItemIndexByID(AComboBox : TcxComboBox; AID : integer) : boolean; overload;

// получить идентификатор по ItemIndex
function GetIDByItemIndex(AComboBox : TcxComboBox) : integer; overload;

// установить ItemIndex по идентификатору
function SetItemIndexByID(AComboBox : TComboBox; AID : integer) : boolean; overload;

// получить идентификатор по ItemIndex
function GetIDByItemIndex(AComboBox : TComboBox) : integer; overload;

// установить ItemIndex по идентификатору
function SetPropItemIndexByID(AComboBox : TcxEditorRowProperties; AID : integer) : boolean;

// получить идентификатор по ItemIndex
function GetPropIDByItemIndex(AComboBox : TcxEditorRowProperties) : integer;

// установить ItemIndex по идентификатору
function SetBarItemIndexByID(AComboBox : TdxBarCombo; AID : integer) : boolean; overload;

// установить ItemIndex по идентификатору
function SetBarItemIndexByID(AComboBox : TcxBarEditItem; AID : integer) : boolean; overload;

// получить идентификатор по ItemIndex
function GetBarIDByItemIndex(AComboBox : TdxBarCombo) : integer; overload;

// получить идентификатор по ItemIndex
function GetBarIDByItemIndex(AComboBox : TcxBarEditItem) : integer; overload;

//получение индекса в свойстве VerticalGrid
function GetItemIndex(AComboBox : TcxEditorRowProperties) : integer;

//установка индекса в свойстве VerticalGrid
procedure SetItemIndex(AComboBox : TcxEditorRowProperties; AIndex : integer);

//перечисление всех окон
procedure EnumWindow(AEnumWindowProc : TEnumWindowProc);

//регистрация плавающего окна
procedure RegisterFloatingForm(AForm : TForm; AParentAction : TAction; ACaption : string);

//удаление плавающего окна
procedure UnregisterFloatingForm(AForm : TForm);

//получение максимального Тэга MDI-окна
function MaxMDITag(AClass : TClass) : integer;

//получение строки в Base64
function EncodeBase64String(AString : string) : string;

//декодирование строки в Base64
function DecodeBase64String(AString : string) : string;

//получение зашифрованной строки
function EncodeString(AString : ansistring) : ansistring;

//расшифровка строки
function DecodeString(AString : ansistring) : ansistring;

//корректировка даты для запросов
function StrDateToSQLDate(ADate : string) : string;

//корректировка даты и времени для запросов
function StrDateTimeToSQLDateTime(ADate : string) : string;

//получение даты по тексту
function CorrectDate(ADate : string) : string;

//подготовка имени формы перед сохранением
procedure PrepareFormName(AForm : TForm);

{ получение целого числа прописью }
function IntToWord(AInt : int64; AIPE, ARPE, ARPM : string; AGender : char) : string;
{ получение суммы прописью }
function SumToWord(ASum : double) : string;
{ получение суммы в виде 1234 руб. 32 коп. }
function SumToStr(ASum : double) : string;

//получение строки по индексу в списке строк, разделенном точкой с запятой
function StringByIndex(AStrings : string; AIndex : integer) : string;

//сжатие одного файла
function PackBackup(ASource, ADestination : string) : boolean;

//распаковка архива
function UnPackBackup(ASource : string; var ADestination : string) : boolean;

//полный сброс панелей инструментов
procedure ResetBarManager(ABarManager : TdxBarManager);

//null если указанное значение
function NullIf(AValue, ANullValue : variant) : variant;

//строка есть дата и время
function IsDateTime(AString : string) : boolean;

//существование каталога
function DirExists(Name: string): Boolean;

//размер файла
function GetFileSize(const FileName: string): Int64;

//запуск файла
function FileExecute(const FileName, Params, StartDir: string;
  InitialState: TExecState): THandle;

//запуск файла с ожиданием
function FileExecuteWait(const FileName, Params, StartDir: string;
  InitialState: TExecState): Integer;

//изменение размера JPEG картинки
procedure ResizeJPEG(AImage : TMemoryStream; AWidth, AHeight : integer);

//удаление слэша
function RemoveBackSlash(const DirName: string): string;

//преобразование ANSI в OEM
function StrToOem(const AnsiStr: ansistring): ansistring;

//преобразование OEM в ANSI
function OemToStr(const OemStr: ansistring): ansistring;

//отправка почты со вложенными файлами
procedure SendEMAIL(ToAddress, Subject, MessageBody, AFiles : string; AEMLFileName : string = '');

//отправка почты со вложенными файлами на несколько адресов
procedure SendEMAILMulti(AAddressList, Subject, MessageBody, AFiles : string);

//отправка почты со вложенными файлами с помощью стандартного функционала
procedure SendEMailClient(ToAddress, Subject, MessageBody : string; Attachs : array of string);

//открытие файла электронного письма стандартной почтовой программой
procedure OpenEMailClient(AEMLFileName : string);

//получение списка тэгов из полей набора данных
function GetTagList(ADataSet : TDataSet) : string;

//получение списка значений тэгов из полей набора данных
function GetTagValueList(ADataSet : TDataSet) : string;

//получение списка значений тэгов из полей набора данных
function GetTagValues(ADataSet : TDataSet) : string;

//замена тэгов значениями
function UpdateTagList(ARTF : TRichEdit; ATagValues : string) : boolean; overload;

//замена тэгов значениями
function UpdateTagList(var AText : string; ATagValues : string) : boolean; overload;

//получение значения параметра из строки в формате Имя1=Значение1;Имя2=Значение2 ...
function GetParamValue(AParams : string; AParamName : string; ADelimiter : char = ';') : string;

//строка состоит только из цифр
function IsIntegerByChar(AString : string) : boolean;

//получение количества подстрок в строке
function CountPos(const subtext: string; Text: string): Integer;

//получение имени параметра из строки в формате Имя=Значение
function GetParamOneName(AParams : string; AIndex : integer = 0; ADelimiter : char = ';') : string;

//получение имени параметра из строки в формате Имя=Значение
function GetParamOneValue(AParams : string; AIndex : integer = 0; ADelimiter : char = ';') : string;

//получение количества параметров в строке в формате Имя=Значение
function GetParamCount(AParams : string; ADelimiter : char = ';') : integer;

//получение количества слов в строке
function GetTextWordCount(AText : string) : integer;

//получение количества слов в строке
function GetTextWordByIndex(AText : string; AIndex : integer) : string;

//заполнение выпадающего списка колонками таблицы
function FillDBGridEhMenu(APopupMenu : TPopupMenu; ADBGridEh : TDBGridEh) : boolean;

//раскраска DbGridEh
procedure SetDBGridEhSkin(AGrid : TDBGridEh);

//показать сообщение "в разработке"
procedure ShowUnderConstruction;

//проверка окна с указанным типом
function FindForm(AType : TFormClass) : TForm;

//проверка существования окна с указанным типом
function ExistsForm(AType : TFormClass) : boolean;

//проверка родительского процесса
function ParentProcName: string;

// корректировка текста для получения только целого числа вначале строки
function CorrectInteger(AString : string) : string;

// корректировка текста для получения только целого числа по всей строке
function CorrectInteger2(AString : string) : string;

//удаление символов маски из текста с номером телефона
function PreparePhone(AString : string) : string;

//проверка на корректнсть рабочего времени
function IsWorkTime(AStr : string) : boolean;

//установка TDays из строки
procedure SetDaysFromStr(var ADays : TDays; AStr : ansistring);

//установка строки из TDays
procedure SetStrFromDays(var AStr : ansistring; ADays : TDays);

//округление до сотых
function RoundH(AFloat : double) : double;

//форматирование телефона
function PhoneFormat(AStr : string) : string;

//позвонить
procedure ExecPhone(APhone : string; AName : string);

implementation

{$R *.DFM}

uses
  JclFileUtils, JvJCLUtils, SevenZipVCL, frxMD5, Shlobj, ActiveX, ComObj,
  UProgress, cxLookAndFeels,
  MesDlg, DateUtils, UDatas, StrUtils, MainUnit,
  Variants, oleserver, UOptions,
  DTKUtils, DTKTypes, math, Gr32, GR32_Resamplers, JPEG,
  LbString, JvCipher, ehlibzeos, UChangeColumns,
  ShellAPI, TlHelp32, UOrderList;

const
  EIGHT_PLUS_THREE = 13;

const
  ShowCommands: array[TExecState] of Integer =
    (SW_SHOWNORMAL, SW_MINIMIZE, SW_SHOWMAXIMIZED, SW_HIDE);

{ вещественное число, округленное до тысячных долей }
function GetDoubleToThousand(ADouble : double) : double;
begin
  Result := Round(ADouble * 1000);
  Result := Result / 1000;
end;

{ получение списка редактируемых инструментов для разрешения }
procedure GetAllPermissions(APermissions : TStringList);
  var
    i : integer;
begin
  with MainForm.ActionList do
  begin
    APermissions.Clear;
    for i := 0 to ActionCount - 1 do
      if Actions[i].Tag <> 0 then
        APermissions.AddObject(TAction(Actions[i]).Caption, pointer(Actions[i].Tag));
  end;
end;

{ получение списка текстовых разрешений }
procedure GetAllTextPermissions(ATextPermissions : TStringList);
  var
    vPermissions : TStringList;
begin
  vPermissions := TStringList.Create;
  GetAllPermissions(vPermissions);
  PermissionsToText(vPermissions, ATextPermissions);
  vPermissions.Free;
end;

{ преобразование текста в разрешений }
procedure TextToPermissions(ATextPermission, APermission : TStringList);
  var
    i : integer;
    s, p : string;
begin
  APermission.Clear;
  for i := 0 to ATextPermission.Count - 1 do
  begin
    s := ATextPermission[i];
    p := RightStr(s, 2);
    if IsInteger(p) then
    begin
      s := LeftSTR(s, Length(s) - 3);
      APermission.AddObject(s, pointer(StrToInt(p)));
    end;
  end;
end;

{ преобразование разрешений в тестовые }
procedure PermissionsToText(APermission, ATextPermission : TStringList);
  var
    i : integer;
    s, p : string;
begin
  ATextPermission.Clear;
  for i := 0 to APermission.Count - 1 do
  begin
    s := APermission[i];
    p := IntToStrF(integer(APermission.Objects[i]), 2, '0');
    s := s + ',' + p;
    ATextPermission.Add(s);
  end;
end;

{ возвращает true, если редактирование в действии по указанному имени разрешено }
function CanEditInActionByName(AName : string) : boolean;
  var
    s, p : string;
    i : integer;
    vComponent : TComponent;
    vAction : TAction;
begin
  Result := false;
  vComponent := MainForm.FindComponent(AName);
  if (vComponent <> nil) and (vComponent is TAction) then
  begin
    vAction := vComponent as TAction;
    with vAction do
    begin
      s := Caption;
      for i := 0 to UserPermTool.Count - 1 do
      begin
        p := UserPermTool[i];
        if LeftStr(p, Length(p) - 3) = s then
        begin
          p := RightStr(p, 2);
          Result := (p[1] = '1') and (p[2] = '1');
        end;
      end;
    end;
  end;
end;

{ возвращает true, если редактирование в действии по указанному имени разрешено }
function CanEditInActionByAction(AAction : TAction) : boolean;
  var
    s, p : string;
    i : integer;
begin
  if UserID = 1 then
  begin
    Result := true;
  end
  else
  begin
    Result := false;
    with AAction do
    begin
      s := Caption;
      for i := 0 to UserPermTool.Count - 1 do
      begin
        p := UserPermTool[i];
        if LeftStr(p, Length(p) - 3) = s then
        begin
          p := RightStr(p, 2);
          Result := (p[1] = '1') and (p[2] = '1');
        end;
      end;
    end;
  end;
end;

{ возвращает true, если показывать инструмент можно }
function CanShowAction(AAction : TAction) : boolean;
  var
    s, p : string;
    i : integer;
begin
  Result := UserID = 1;
  if not Result then
    with AAction do
    begin
      s := Caption;
      for i := 0 to UserPermTOol.Count - 1 do
      begin
        p := UserPermTOol[i];
        if LeftStr(p, Length(p) - 3) = s then
        begin
          p := RightStr(p, 2);
          Result := p[1] = '1';
        end;
      end;
    end;
end;

{ поиск колонки в DBGRID }
function FindColumn(ADBGrid : TDBGrid; AFieldName : string) : integer;
  var
    i : integer;
begin
  Result := -1;
  with ADBGrid do
    for i := 0 to Columns.Count - 1 do
      if Columns[i].FieldName = AFieldName then
      begin
        Result := i;
        Exit;
      end;
end;

{ создание каталогов }
procedure CreateDirs;
begin
  //CurrentDir
  if not DirectoryExists(MyDocDir) then ForceDirectories(MyDocDir);
  if not DirectoryExists(CurrentDir) then ForceDirectories(CurrentDir);
  //SQL
  if not ValidFileName(cSQLDir) then cSQLDir := ccSQLDir;
  if ExtractFileDrive(cSQLDir) <> '' then cABSSQLDir := cSQLDir
  else cABSSQLDir := MyDocDir + cSQLDir;
  if not DirectoryExists(cABSSQLDir) then ForceDirectories(cABSSQLDir);
  //Отчеты
  if not ValidFileName(cReportDir) then cReportDir := ccReportDir;
  if ExtractFileDrive(cReportDir) <> '' then cABSReportDir := cReportDir
  else cABSReportDir := MyDocDir + cReportDir;
  if not DirectoryExists(cABSReportDir) then ForceDirectories(cABSReportDir);
  //Импорт
  if not ValidFileName(cImportDir) then cImportDir := ccImportDir;
  if ExtractFileDrive(cImportDir) <> '' then cABSImportDir := cImportDir
  else cABSImportDir := MyDocDir + cImportDir;
  if not DirectoryExists(cABSImportDir) then ForceDirectories(cABSImportDir);
  //Экспорт
  if not ValidFileName(cExportDir) then cExportDir := ccExportDir;
  if ExtractFileDrive(cExportDir) <> '' then cABSExportDir := cExportDir
  else cABSExportDir := MyDocDir + cExportDir;
  if not DirectoryExists(cABSExportDir) then ForceDirectories(cABSExportDir);
  //шаблоны
  if not ValidFileName(cDotDir) then cDotDir := ccDotDir;
  if ExtractFileDrive(cDotDir) <> '' then cABSDotDir := cDotDir
  else cABSDotDir := MyDocDir + cDotDir;
  if not DirectoryExists(cABSDotDir) then ForceDirectories(cABSDotDir);
  //Backup
  if not ValidFileName(cBackupDir) then cBackupDir := ccBackupDir;
  if ExtractFileDrive(cBackupDir) <> '' then cABSBackupDir := cBackupDir
  else cABSBackupDir := MyDocDir + cBackupDir;
  if not DirectoryExists(cABSBackupDir) then ForceDirectories(cABSBackupDir);
  //File
  if not ValidFileName(cFileDir) then cFileDir := ccFileDir;
  if ExtractFileDrive(cFileDir) <> '' then cABSFileDir := cFileDir
  else cABSFileDir := MyDocDir + cFileDir;
  if not DirectoryExists(cABSFileDir) then ForceDirectories(cABSFileDir);
  cABSFileTempDir := cABSFileDir + 'Temp\';
  if not DirectoryExists(cABSFileTempDir) then ForceDirectories(cABSFileTempDir);
  cABSFileEMailDir := cABSFileDir + 'EMail\';
  if not DirectoryExists(cABSFileEMailDir) then ForceDirectories(cABSFileEMailDir);


  //Plugin
  if not ValidFileName(cPluginDir) then cPluginDir := ccPluginDir;
  if ExtractFileDrive(cPluginDir) <> '' then cABSPluginDir := cPluginDir
  else cABSPluginDir := AppDir + cPluginDir;
  if not DirectoryExists(cABSPluginDir) then ForceDirectories(cABSPluginDir);
end;

{ запись информации из Rich2 в Rich1 }
procedure AssignRich(Rich1 : TRichEdit; Rich2: TRichEdit); overload;
var
  st: TMemoryStream;
begin
  st := TMemoryStream.Create;
  with Rich2 do
  begin
    SelStart := 0;
    SelLength := Length(Text);
    SelAttributes.Protected := False;
    Lines.SaveToStream(st);
  end;
  st.Position := 0;
  Rich1.Lines.LoadFromStream(st);
  st.Free;
end;

{ корректировка имени папки }
function CorrectPath(APath : string) : string;
begin
  Result := APath;
  if (Length(APath) > 0) and (Result[Length(Result)] <> '\') then Result := Result + '\';
end;

{ корректировка имени папки в Интернет }
function CorrectPathFTP(APath : string) : string;
begin
  Result := APath;
  if Result[Length(Result)] <> '/' then Result := Result + '/';
end;

{ получение строки в виде списка целых чисел }
function GetIntegerListString(AInteger : TIntegerDynArray) : string;
  var
    i : integer;
begin
  Result := '';
  for i := 1 to Length(AInteger) do
  begin
    Result := Result + IntToStr(AInteger[i - 1]);
    if i <> Length(AInteger) then Result := Result + ',';
  end;
end;

{ получение строки в виде списка строк }
function GetStringListString(AString : TStringDynArray) : string;
  var
    i : integer;
begin
  Result := '';
  for i := 1 to Length(AString) do
  begin
    Result := Result + AString[i - 1];
    if i <> Length(AString) then Result := Result + ',';
  end;
end;

{ заполнение выпадающего списка значениями из набора данных }
procedure FillComboBox(ADataset : TDataset; AComboBox : TComboBox; ATextField, AIDField : string); overload;
  var
    s : string;
    p : pointer;
begin
  with ADataset do
  begin
    s := AComboBox.Text;
    AComboBox.Clear;
    First;
    while not eof do
    begin
      if AIDField = '' then p := nil
      else p := pointer(FieldByName(AIDField).AsInteger);
      AComboBox.AddItem(FieldByName(ATextField).AsString, p);
      Next;
    end;
    AComboBox.ItemIndex := AComboBox.Items.IndexOf(s);
    if AComboBox.ItemIndex = -1 then AComboBox.Text := s;
    ACombobox.Update;
  end;
end;

{ заполнение списка строк значениями из набора данных }
procedure FillComboBox(ADataset : TDataset; AComboBox : TcxComboBox; ATextField, AIDField : string);
  var
    s : string;
    p : pointer;
begin
  with ADataset do
  begin
    s := AComboBox.Text;
    AComboBox.Clear;
    First;
    while not eof do
    begin
      if AIDField = '' then p := nil
      else p := pointer(FieldByName(AIDField).AsInteger);
      AComboBox.Properties.Items.AddObject(FieldByName(ATextField).AsString, p);
      Next;
    end;
    AComboBox.ItemIndex := AComboBox.Properties.Items.IndexOf(s);
    if AComboBox.ItemIndex = -1 then AComboBox.Text := s;
    ACombobox.Update;
  end;
end;

//заполнение списка строк значениями из набора данных
procedure FillStrings(ADataset : TDataset; AStrings : TStrings; ATextField, AIDField : string); overload;
  var
    p : pointer;
begin
  with ADataset do
  begin
    AStrings.BeginUpdate;
    AStrings.Clear;
    First;
    while not eof do
    begin
      if AIDField = '' then p := nil
      else p := pointer(FieldByName(AIDField).AsInteger);
      AStrings.AddObject(FieldByName(ATextField).AsString, p);
      Next;
    end;
    AStrings.EndUpdate;
  end;
end;

//продвинутая заливка комбобокса
function FillComboBoxExSQL(AComboBox: TComboBox; ASQL: string; ATextField, AIDField: string) : boolean;
  var
    vDataSet: TZQuery;
begin
  Result := true;
  ATextField := Trim(ATextField);
  AIDField := Trim(AIDField);
  vDataSet := TZQuery.Create(nil);
  with vDataSet do
  try
    Connection := Datas.ZConnection;
    SQL.Text := ASQL;
    Open;
    FillComboBox(vDataSet, AComboBox, ATextField, AIDField);

    Close;

  finally
    Free;
  end;
end;

//продвинутая заливка комбобокса
function FillComboBoxExSQL(AComboBox: TcxComboBox; ASQL: string; ATextField, AIDField: string) : boolean; overload;
  var
    vDataSet: TZQuery;
begin
  Result := true;
  ATextField := Trim(ATextField);
  AIDField := Trim(AIDField);
  vDataSet := TZQuery.Create(nil);
  with vDataSet do
  try
    Connection := Datas.ZConnection;
    SQL.Text := ASQL;
    Open;
    FillComboBox(vDataSet, AComboBox, ATextField, AIDField);
    Close;
  finally
    Free;
  end;
end;

//заполнение списка строк значениями из набора данных
function FillStringsExSQL(ASQL : string; AStrings : TStrings; ATextField, AIDField : string) : boolean; overload;
  var
    vDataSet: TZQuery;
begin
  Result := true;
  ATextField := Trim(ATextField);
  AIDField := Trim(AIDField);
  vDataSet := TZQuery.Create(nil);
  with vDataSet do
  try
    Connection := Datas.ZConnection;
    SQL.Text := ASQL;
    Open;
    FillStrings(vDataSet, AStrings, ATextField, AIDField);
    Close;
  finally
    Free;
  end;
end;

{ заполнение выпадающего списка значениями из набора данных }
procedure FillPropComboBox(ADataset : TDataset; AComboBox : TcxEditorRowProperties; ATextField, AIDField : string);
  var
    v : variant;
    p : pointer;
begin
  with ADataset do
  begin
    v := AComboBox.Value;
    TcxComboBoxProperties(AComboBox.EditProperties).BeginUpdate;
    try
      TcxComboBoxProperties(AComboBox.EditProperties).Items.Clear;
      First;
      while not eof do
      begin
        if AIDField = '' then p := nil
        else p := pointer(FieldByName(AIDField).AsInteger);
        TcxComboBoxProperties(AComboBox.EditProperties).Items.AddObject(FieldByName(ATextField).AsString, p);
        Next;
      end;
    finally
      TcxComboBoxProperties(AComboBox.EditProperties).EndUpdate(true);
    end;
    AComboBox.Value := v;
  end;
end;

//продвинутая заливка комбобокса
function FillPropComboBoxExSQL(AComboBox : TcxEditorRowProperties; ASQL: string; ATextField, AIDField: string) : boolean;
  var
    vDataSet: TZQuery;
begin
  Result := true;
  ATextField := Trim(ATextField);
  AIDField := Trim(AIDField);
  vDataSet := TZQuery.Create(nil);
  with vDataSet do
  try
    Connection := Datas.ZConnection;
    SQL.Text := ASQL;
    Open;
    FillPropComboBox(vDataSet, AComboBox, ATextField, AIDField);
    Close;
  finally
    Free;
  end;
end;

//заполнение выпадающего списка значениями из набора данных
procedure FillBarComboBox(ADataset : TDataset; AComboBox : TdxBarCombo; ATextField, AIDField : string);
  var
    v : variant;
    p : pointer;
begin
  with ADataset do
  begin
    v := AComboBox.Text;
    AComboBox.Items.Clear;
    First;
    while not eof do
    begin
      if AIDField = '' then p := nil
      else p := pointer(FieldByName(AIDField).AsInteger);
      AComboBox.Items.AddObject(FieldByName(ATextField).AsString, p);
      Next;
    end;
    AComboBox.Text := v;
  end;
end;

//заполнение выпадающего списка значениями из набора данных
procedure FillBarComboBox(ADataset : TDataset; AComboBox : TcxBarEditItem; ATextField, AIDField : string); overload;
  var
    v : variant;
    p : pointer;
begin
  with ADataset do
  begin
    v := AComboBox.Editvalue;
    TcxComboBoxProperties(AComboBox.Properties).Items.Clear;
    First;
    while not eof do
    begin
      if AIDField = '' then p := nil
      else p := pointer(FieldByName(AIDField).AsInteger);
      TcxComboBoxProperties(AComboBox.Properties).Items.AddObject(FieldByName(ATextField).AsString, p);
      Next;
    end;
    AComboBox.EditValue := v;
  end;
end;

//заполнение выпадающего списка значениями из набора данных
procedure FillBarCheckComboBox(ADataset : TDataset; AComboBox : TcxBarEditItem; ATextField, AShortTextField, AIDField : string); overload;
  var
    v : variant;
    p : integer;
begin
  with ADataset do
  begin
    v := AComboBox.Editvalue;
    TcxCheckComboBoxProperties(AComboBox.Properties).Items.Clear;
    First;
    while not eof do
    begin
      if AIDField = '' then p := 0
      else p := FieldByName(AIDField).AsInteger;
      with TcxCheckComboBoxProperties(AComboBox.Properties).Items.Add do
      begin
        Description := FieldByName(ATextField).AsString;
        ShortDescription := FieldByName(AShortTextField).AsString;
        Tag := p;
      end;
      Next;
    end;
    AComboBox.EditValue := v;
  end;
end;

//продвинутая заливка комбобокса
function FillBarComboBoxExSQL(AComboBox : TdxBarCombo; ASQL: string; ATextField, AIDField: string) : boolean;
  var
    vDataSet: TZQuery;
begin
  Result := true;
  ATextField := Trim(ATextField);
  AIDField := Trim(AIDField);
  vDataSet := TZQuery.Create(nil);
  with vDataSet do
  try
    Connection := Datas.ZConnection;
    SQL.Text := ASQL;
    Open;
    FillBarComboBox(vDataSet, AComboBox, ATextField, AIDField);
    Close;
  finally
    Free;
  end;
end;

function FillBarCheckComboBoxExSQL(AComboBox : TcxBarEditItem; ASQL: string; ATextField, AShortText, AIDField: string) : boolean;
  var
    vDataSet: TZQuery;
begin
  Result := true;
  ATextField := Trim(ATextField);
  AIDField := Trim(AIDField);
  vDataSet := TZQuery.Create(nil);
  with vDataSet do
  try
    Connection := Datas.ZConnection;
    SQL.Text := ASQL;
    Open;
    FillBarCheckComboBox(vDataSet, AComboBox, ATextField, AShortText, AIDField);
    Close;
  finally
    Free;
  end;
end;

//продвинутая заливка комбобокса
function FillBarComboBoxExSQL(AComboBox : TcxBarEditItem; ASQL: string; ATextField, AIDField: string) : boolean; overload;
  var
    vDataSet: TZQuery;
begin
  Result := true;
  ATextField := Trim(ATextField);
  AIDField := Trim(AIDField);
  vDataSet := TZQuery.Create(nil);
  with vDataSet do
  try
    Connection := Datas.ZConnection;
    SQL.Text := ASQL;
    Open;
    FillBarComboBox(vDataSet, AComboBox, ATextField, AIDField);
    Close;
  finally
    Free;
  end;
end;

//получение списка идентификаторов для BarCheckCombo
function GetBarCheckComboboxIDList(AComboBox : TcxBarEditItem) : string;
  var
    i : integer;
    s : string;
begin
  Result := '';
  s := IsNull(AComboBox.CurEditValue, '');
  with TcxCheckComboBoxProperties(AComboBox.Properties) do
  begin
    for i := 1 to Items.Count do
      if (Length(s) >= i) and (s[i] = '1') then
      Result := Result + IntToStr(Items[i - 1].Tag) + ',';
  end;
  if Result <> '' then
    Result := Copy(Result, 1, Length(Result) - 1);
end;

//продвинутая заливка комбобокса
function FillComboBoxEx(AComboBox: TComboBox; ATableName : string; ATextField, AIDField: string) : boolean;
begin
 Result :=
   FillComboBoxExSQL(
     AComboBox,
     Format('SELECT %s %s FROM %s', [
       IfThen(AIDField='', '', AIDField+', '),
       ATextField,
       ATableName
       ]),
     ATextField,
     AIDField);
end;

//продвинутая заливка комбобокса
function FillComboBoxEx(AComboBox: TcxComboBox; ATableName : string; ATextField, AIDField: string) : boolean; overload;
begin
 Result :=
   FillComboBoxExSQL(
     AComboBox,
     Format('SELECT %s %s FROM %s', [
       IfThen(AIDField='', '', AIDField+', '),
       ATextField,
       ATableName
       ]),
     ATextField,
     AIDField);
end;

//если Null, то возврат другого значения
function IsNull(AValue, ARes : variant) : variant;
begin
  if AValue = null then Result := ARes
  else Result := AValue;
end;

//проверка на пустое значение
function IfNull(AValue : variant; ADefValue : variant) : variant;
begin
  if AValue = null then Result := ADefValue
  else Result := AValue;
end;

//если значение равно нулю, то возврат Null
function NullIfZero(AValue : variant) : variant;
begin
  if AValue = 0 then Result := null
  else Result := AValue;
end;

//получение хэшированной зашифрованной строки
function GetCipherStr(AName, APass : string) : string;
begin
  with TLbRijndael.Create(nil) do
    try
      KeySize := ks256;
      GenerateKey(APass);
      Result := EncryptString(AName);
    finally
      Free;
    end;
end;

//получение расшифрованной строки
function GetDeсipherStr(AName, APass : string) : string;
begin
  with TLbRijndael.Create(nil) do
    try
      KeySize := ks256;
      GenerateKey(APass);
      Result := DecryptString(AName);
    finally
      Free;
    end;
end;

//получение хэша строки
function GetHashStr(AName : string) : string;
begin
  Result := '$' + frxMD5.MD5String(AName);
end;

{ установить ItemIndex по идентификатору }
function SetItemIndexByID(AComboBox : TcxComboBox; AID : integer) : boolean;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := AComboBox.Properties.Items.IndexOfObject(Pointer(AID));
    AComboBox.ItemIndex := n;
    Result := n <> -1;
  end;
end;

{ получить идентификатор по ItemIndex }
function GetIDByItemIndex(AComboBox : TcxComboBox) : integer;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := AComboBox.Properties.Items.IndexOf(AComboBox.Text);
    if n <> -1 then
      Result := integer(AComboBox.Properties.Items.Objects[n])
    else
      Result := 0;
  end;
end;

{ установить ItemIndex по идентификатору }
function SetItemIndexByID(AComboBox : TComboBox; AID : integer) : boolean;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := AComboBox.Items.IndexOfObject(Pointer(AID));
    AComboBox.ItemIndex := n;
    Result := n <> -1;
  end;
end;

// получить идентификатор по ItemIndex
function GetIDByItemIndex(AComboBox : TComboBox) : integer; overload;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := AComboBox.Items.IndexOf(AComboBox.Text);
    if n <> -1 then
      Result := integer(AComboBox.Items.Objects[n])
    else
      Result := 0;
  end;
end;

{ установить ItemIndex по идентификатору }
function SetPropItemIndexByID(AComboBox : TcxEditorRowProperties; AID : integer) : boolean;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := TcxComboBoxProperties(AComboBox.EditProperties).Items.IndexOfObject(Pointer(AID));
    if n = -1 then AComboBox.Value := ''
    else AComboBox.Value := TcxComboBoxProperties(AComboBox.EditProperties).Items[n];
    Result := n <> -1;
  end;
end;

{ получить идентификатор по ItemIndex }
function GetPropIDByItemIndex(AComboBox : TcxEditorRowProperties) : integer;
  var
    n : integer;
begin
  Result := 0;
  if AComboBox.Value <> null then
    with AComboBox do
    begin
      n := TcxComboBoxProperties(AComboBox.EditProperties).Items.IndexOf(AComboBox.Value);
      if n <> -1 then
        Result := integer(TcxComboBoxProperties(AComboBox.EditProperties).Items.Objects[n]);
    end;
end;

// установить ItemIndex по идентификатору
function SetBarItemIndexByID(AComboBox : TdxBarCombo; AID : integer) : boolean;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := AComboBox.Items.IndexOfObject(Pointer(AID));
    AComboBox.ItemIndex := n;
    Result := n <> -1;
  end;
end;

// установить ItemIndex по идентификатору
function SetBarItemIndexByID(AComboBox : TcxBarEditItem; AID : integer) : boolean; overload;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := TcxComboBoxProperties(AComboBox.Properties).Items.IndexOfObject(Pointer(AID));
    AComboBox.EditValue := TcxComboBoxProperties(AComboBox.Properties).Items[n];
    Result := n <> -1;
  end;
end;

// получить идентификатор по ItemIndex
function GetBarIDByItemIndex(AComboBox : TdxBarCombo) : integer;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := AComboBox.Items.IndexOf(AComboBox.Text);
    if n <> -1 then
      Result := integer(AComboBox.Items.Objects[n])
    else
      Result := 0;
  end;
end;

// получить идентификатор по ItemIndex
function GetBarIDByItemIndex(AComboBox : TcxBarEditItem) : integer; overload;
  var
    n : integer;
begin
  with AComboBox do
  begin
    n := TcxComboBoxProperties(AComboBox.Properties).Items.IndexOf(IsNull(AComboBox.EditValue, ''));
    if n <> -1 then
      Result := integer(TcxComboBoxProperties(AComboBox.Properties).Items.Objects[n])
    else
      Result := 0;
  end;
end;

//получение индекса в свойстве VerticalGrid
function GetItemIndex(AComboBox : TcxEditorRowProperties) : integer;
begin
  Result := TcxComboBoxProperties(AComboBox.EditProperties).Items.IndexOf(IsNull(AComboBox.Value, ''));
end;

//установка индекса в свойстве VerticalGrid
procedure SetItemIndex(AComboBox : TcxEditorRowProperties; AIndex : integer);
begin
  if AIndex <> -1 then
    AComboBox.Value := TcxComboBoxProperties(AComboBox.EditProperties).Items[AIndex];
end;

//перечисление всех окон
procedure EnumWindow(AEnumWindowProc : TEnumWindowProc);
  var
    i : integer;
begin
  for i := 0 to Screen.FormCount - 1 do
    try
      AEnumWindowProc(Screen.Forms[i]);
    except
    end;
end;

//регистрация плавающего окна
procedure RegisterFloatingForm(AForm : TForm; AParentAction : TAction; ACaption : string);
begin
  if Assigned(WinList.FindByForm(AForm)) then Exit;

  with WinList.Add do
  begin
    Caption := ACaption;
    Form := AForm;
    if Assigned(AParentAction) then
    begin
      if AParentAction.Category <> '' then Category := AParentAction.Category
      else Category := cCategories[cCategoryCount - 1].Name;
      ImageIndex := AParentAction.ImageIndex;
    end;
  end;
  WinList.DoChanged;
end;

//удаление плавающего окна
procedure UnregisterFloatingForm(AForm : TForm);
begin
  WinList.Remove(WinList.FindByForm(AForm));
  WinList.DoChanged;
end;

{ получение максимального Тэга MDI-окна }
function MaxMDITag(AClass : TClass) : integer;
  var
    i : integer;
begin
  Result := 0;
  for i := 0 to Screen.FormCount - 1 do
    with Screen.Forms[i] do
      if ClassType = AClass then
        Result := Max(Result, Tag);
end;

//получение строки в Base64
function EncodeBase64String(AString : string) : string;
  var
    vS, vD : TStringStream;
begin
  vS := TStringStream.Create(AString);
  vD := TStringStream.Create('');
  try
    LbEncodeBase64(vS, vD);
    Result := vD.DataString;
  finally
    vS.Free;
    vD.Free;
  end;
end;

//декодирование строки в Base64
function DecodeBase64String(AString : string) : string;
  var
    vS, vD : TStringStream;
begin
  vS := TStringStream.Create(AString);
  vD := TStringStream.Create('');
  try
    LbDecodeBase64(vS, vD);
    Result := vD.DataString;
  finally
    vS.Free;
    vD.Free;
  end;
end;

//получение зашифрованной строки
function EncodeString(AString : ansistring) : ansistring;
begin
  with TJvCaesarCipher.Create(nil) do
    try
      Decoded := AString;
      Result := Encoded;
    finally
      Free;
    end;
end;

//расшифровка строки
function DecodeString(AString : ansistring) : ansistring;
begin
  with TJvCaesarCipher.Create(nil) do
    try
      Encoded := AString;
      Result := Decoded;
    finally
      Free;
    end;
end;

{ TWinItem }

procedure TWinItem.SetCaption(const Value: string);
begin
  FCaption := Value;
//  TWinList(Collection).DoChanged;
end;

procedure TWinItem.SetCategory(const Value: string);
begin
  FCategory := Value;
//  TWinList(Collection).DoChanged;
end;

procedure TWinItem.SetForm(const Value: TForm);
begin
  FForm := Value;
//  TWinList(Collection).DoChanged;
end;

procedure TWinItem.SetImageIndex(const Value: integer);
begin
  FImageIndex := Value;
//  TWinList(Collection).DoChanged;
end;

{ TWinList }

function TWinList.Add: TWinItem;
  var
    vItem : TCollectionItem;
begin
  vItem := inherited Add;
  Result := TWinItem(vItem);
end;

procedure TWinList.CloseAll;
  var
    i : integer;
begin
  for i := Count - 1 downto 0 do
    if Assigned(Items[i].Form) {and (Items[i].Form <> CargoForm) } then
    begin
      if Assigned(Items[i].Form.Action) then
        Items[i].Form.Action := nil;

      Items[i].Form.Close;
    end;
end;

constructor TWinList.Create;
begin
  Inherited Create(TWinItem);

  OnChange := nil;
end;

procedure TWinList.Delete(AIndex: integer);
begin
  inherited Delete(AIndex);
end;

procedure TWinList.DoChanged;
begin
  if Assigned(FOnChange) then
    FOnChange(self);
end;

function TWinList.ExistsFormClass(AFormClass: TFormClass): boolean;
  var
    i : integer;
begin
  Result := false;
  for i := 0 to Pred(Count) do
    if Items[i].Form is AFormClass then
    begin
      Result := true;
      Exit;
    end;
end;

function TWinList.FindByForm(AForm: TForm): TWinItem;
  var
    i : integer;
begin
  Result := nil;
  for i := 0 to Pred(Count) do
    if AForm = Items[i].Form then
    begin
      Result := Items[i];
      Exit;
    end;
end;

function TWinList.FindByFormClass(AFormClass: TFormClass): TWinItem;
  var
    i : integer;
begin
  Result := nil;
  for i := 0 to Pred(Count) do
    if Items[i].Form is AFormClass then
    begin
      Result := Items[i];
      Exit;
    end;
end;

function TWinList.GetActiveForm: TForm;
begin
  Result := FActiveForm;
end;

function TWinList.GetItem(Index: Integer): TWinItem;
begin
  Result := TWinItem(inherited GetItem(Index));
end;

function TWinList.GetOwner: TPersistent;
begin
  Result := Application;
end;

function TWinList.GroupExists(AGroupName: string): boolean;
  var
    i : integer;
begin
  Result := false;
  for i := 0 to Count - 1 do
    if Trim(AnsilowerCase(Items[i].Category)) = Trim(AnsilowerCase(AGroupName)) then
    begin
      Result := True;
      Exit;
    end;
end;

function TWinList.Insert(Index: Integer): TWinItem;
begin
  Result := TWinItem(inherited Insert(Index));
end;

procedure TWinList.Remove(AWinItem: TWinItem);
  var
    i : integer;
begin
  for i := 0 to Pred(Count) do
    if AWinItem = Items[i] then
    begin
      Items[i].Free;
      Exit;
    end;
end;

procedure TWinList.SelectWin(AForm: TForm);
begin
  if AForm.FormStyle = fsMDIChild then
  begin
    FActiveForm := AForm;
    DoChanged;
  end;
end;

procedure TWinList.SetItem(Index: Integer; const Value: TWinItem);
begin
  inherited SetItem(Index, Value);
end;

procedure TWinList.SetOnChange(const Value: TNotifyEvent);
begin
  FOnChange := Value;
end;

//корректировка датя для запросов
function StrDateToSQLDate(ADate : string) : string;
begin
  if IsDate(ADate) then
  begin
    Result := '''' + DateToSQLDate(StrToDate(ADate)) + '''';
  end
  else Result := 'null';
end;

//корректировка датя для запросов
function StrDateTimeToSQLDateTime(ADate : string) : string;
begin
  if IsDateTime(ADate) then
  begin
    Result := '''' + DateToSQLDate(StrToDateTime(ADate)) + ' ' + TimeToStr(TimeOf(StrToDateTime(ADate))) + '''';
  end
  else Result := 'null';
end;

//получение даты по тексту
function CorrectDate(ADate : string) : string;
begin
  if IsDate(ADate) then Result := ADate
  else Result := '';
end;

//подготовка имени формы перед сохранением
procedure PrepareFormName(AForm : TForm);
  var
    s, t : string;
begin
  s := AForm.Name;
  t := AForm.Name;
  while (s <> '') and (RightStr(s, 1)[1] in ['0'..'9']) do
    s := LeftStr(s, Length(s) - 1);
  if s <> '' then
  begin
    try
      AForm.Name := s;
    except
      AForm.Name := t;
    end;
  end;
end;

{ получение целого числа прописью }
{ получение целого числа прописью }
function IntToWord(AInt : int64; AIPE, ARPE, ARPM : string; AGender : char) : string;
  type
    TWordRecord = Record
      IPE,{ иминительный падеж единственное число }
      RPE,{ родительный падеж единственное число }
      RPM { родительный падеж множественное число }
      : string
    end;
    TWordArray = array [1..5] of TWordRecord;
    TIntOrder = record
      H,{ сотни }
      D,{ десятки }
      UM, UG { единицы }
      : string
    end;
    TIntOrderArray = array [0..9] of TIntOrder;
  const
    AWordArray : TWordArray = (
      (IPE : ''; RPE : ''; RPM : ''),
      (IPE : 'тысяча'; RPE : 'тысячи'; RPM : 'тысяч'),
      (IPE : 'миллион'; RPE : 'миллиона'; RPM : 'миллионов'),
      (IPE : 'миллиард'; RPE : 'миллиарда'; RPM : 'миллиардов'),
      (IPE : 'трилион'; RPE : 'трилиона'; RPM : 'трилионов')
    );
    AIntOrderArray : TIntOrderArray = (
      (H : ''; D : ''; UM : ''; UG : ''),
      (H : 'сто'; D : 'десять'; UM : 'один'; UG : 'одна'),
      (H : 'двести'; D : 'двадцать'; UM : 'два'; UG : 'две'),
      (H : 'триста'; D : 'тридцать'; UM : 'три'; UG : 'три'),
      (H : 'четыреста'; D : 'сорок'; UM : 'четыре'; UG : 'четыре'),
      (H : 'пятьсот'; D : 'пятьдесят'; UM : 'пять'; UG : 'пять'),
      (H : 'шестьсот'; D : 'шестьдесят'; UM : 'шесть'; UG : 'шесть'),
      (H : 'семьсот'; D : 'семьдесят'; UM : 'семь'; UG : 'семь'),
      (H : 'восемьсот'; D : 'восемьдесят'; UM : 'восемь'; UG : 'восемь'),
      (H : 'девятьсот'; D : 'девяносто'; UM : 'девять'; UG : 'девять')
    );
    ADWords : array[1..9] of string = (
      'одиннадцать',
      'двенадцать',
      'тринадцать',
      'четырнадцать',
      'пятнадцать',
      'шестнадцать',
      'семнадцать',
      'восемнадцать',
      'девятнадцать'
    );
  var
    r, s, t, m : string;
    i : byte;
    w : TWordRecord;

  function PartToWord(APart : string; AWordRecord : TWordRecord; AGender : char) : string;
    var
      n : byte;
      s : string;
  begin
    if (APart[1] = '0') and (APart[2] = '0') and (APart[3] = '0') then Result := ''
    else
    begin
      if APart[1] <> '0' then
      begin
        n := byte(APart[1]) - byte('0');
        Result := AIntOrderArray[n].H;
        s := AWordRecord.RPM;
      end
      else Result := '';
      if APart[3] = '0' then
      begin
        if APart[2] <> '0' then
        begin
          n := byte(APart[2]) - byte('0');
          if Result <> '' then Result := Result + ' ';
          Result := Result + AIntOrderArray[n].D;
          s := AWordRecord.RPM;
        end;
      end
      else
        if APart[2] = '1' then
        begin
          n := byte(APart[3]) - byte('0');
          if Result <> '' then Result := Result + ' ';
          Result := Result + ADWords[n];
          s := AWordRecord.RPM;
        end
        else
        begin
          if APart[2] <> '0' then
          begin
            n := byte(APart[2]) - byte('0');
            if Result <> '' then Result := Result + ' ';
            Result := Result + AIntOrderArray[n].D;
            s := AWordRecord.RPM;
          end;
          if APart[3] <> '0' then
          begin
            n := byte(APart[3]) - byte('0');
            if Result <> '' then Result := Result + ' ';
            if AGender = 'M' then Result := Result + AIntOrderArray[n].UM
            else Result := Result + AIntOrderArray[n].UG;
            if n = 1 then s := AWordRecord.IPE
            else
              if n in [2..4] then s := AWordRecord.RPE
              else s := AWordRecord.RPM;
          end;
        end;
    end;
    if Result <> '' then Result := Result + ' ' + s;
  end;
begin
  AInt := ABS(AInt);
  s := IntToStr(AInt);
  if AInt = 0 then Result := 'ноль ' + ARPM
  else
    if Length(s) > 15 then Result := ''
    else
    begin
      s := StringOfChar('0', 15 - Length(s)) + s;//выравняли до 12 символов
      m := RightStr(s, 3);
      Result := '';

      //единицы
      w.IPE := AIPE;
      w.RPE := ARPE;
      w.RPM := ARPM;

      r := RightSTR(s, 3);
      t := PartToWord(r, w, AGender);
      if t <> '' then t := t + ' ';
      Result := t + Result;
      if Result = '' then Result := ARPM;
      s := LeftSTR(s, Length(s) - 3);

      for i := 2 to 5 do
      begin
        r := RightSTR(s, 3);
        if i = 2 then t := PartToWord(r, AWordArray[i], 'G')
        else t := PartToWord(r, AWordArray[i], 'M');
        if t <> '' then t := t + ' ';
        Result := t + Result;
        s := LeftSTR(s, Length(s) - 3);
      end;
      if (Trim(Result) = '') then Result := 'ноль ' + ARPM
      else Result := Trim(Result);
    end;
end;

{ получение суммы прописью }
function SumToWord(ASum : double) : string;
  var
    f : double;
    r, k : int64;
begin
  r := Trunc(ASum);
  f := ASum - r;
  k := Round(f * 100);
  Result :=
    IntToWord(r, 'рубль', 'рубля', 'рублей', 'M');
  if k <> 0 then Result := Result + ' ' + IntToWord(k, 'копейка', 'копейки', 'копеек', 'G');
  Result :=
    AnsiUpperCase(LeftStr(Result, 1)) +
    AnsiLowerCase(RightStr(Result, Length(Result) - 1));
end;

{ получение суммы в виде 1234 руб. 32 коп. }
function SumToStr(ASum : double) : string;
  var
    r, k : integer;
begin
  r := Trunc(ASum);
  k := round((ASum - r) * 100);
  Result := IntToStr(r) + ' руб. ' + IntToStr(k) + ' коп.';
end;

//получение строки по индексу в списке строк, разделенном точкой с запятой
function StringByIndex(AStrings : string; AIndex : integer) : string;
  var
    vStringList : TStringList;
begin
  vStringList := TStringList.Create;
  try
    vStringList.Delimiter := ';';
    vStringList.StrictDelimiter := true;
    vStringList.DelimitedText := AStrings;
    if (AIndex >= 0) and (AIndex <= (vStringList.Count - 1)) then
      Result := vStringList[AIndex]
    else
      Result := '';
  finally
    vStringList.Free;
  end;
end;

//сжатие одного файла
function PackBackup(ASource, ADestination : string) : boolean;
  var
    SevenZip : TSevenZip;
    n : integer;
begin
  if not FileExists(AppDir + c7ZDLL) then
    try
      UtilForm.bf7ZDLL. SaveToFile(AppDir + c7ZDLL);
    except
    end;

  Result := FileExists(AppDir + c7ZDLL);

  if Result then
  begin
    ShowProgress('Сжатие резервной копии...');
    SevenZip := nil;
    try
      SevenZip := TSevenZip.Create(nil);
      SevenZip.OnPreProgress := UtilForm.SevenZipPreProgress;
      SevenZip.OnProgress := UtilForm.SevenZipProgress;
      SevenZip.OnListfile := UtilForm.SevenZipListfile;

      SevenZip.AddOptions := SevenZip.AddOptions + [{AddSolid, }AddStoreOnlyFilename];
      SevenZip.LZMACompressStrength := FAST;//ULTRA;

      SevenZip.SZFileName := ADestination;
      SevenZip.Files.Clear;
      SevenZip.Files.AddString(ASource);
      n := SevenZip.Add;
      Result := n = 0;
    finally
      HideProgress;
      if Assigned(SevenZip) then SevenZip.Free;
    end;
  end;
end;

//распаковка архива
function UnPackBackup(ASource : string; var ADestination : string) : boolean;
  var
    n : integer;
    SevenZip : TSevenZip;
begin
  if not FileExists(AppDir + c7ZDLL) then
    try
      UtilForm.bf7ZDLL.SaveToFile(AppDir + c7ZDLL);
    except
    end;

  Result := FileExists(AppDir + c7ZDLL);

  if Result then
  begin
    ShowProgress('Распаковка резервной копии...');
    SevenZip := nil;
    try
      SevenZip := TSevenZip.Create(nil);
      SevenZip.OnPreProgress := UtilForm.SevenZipPreProgress;
      SevenZip.OnProgress := UtilForm.SevenZipProgress;
      SevenZip.OnListfile := UtilForm.SevenZipListfile;

      SevenZip.ExtractOptions := [ExtractOverwrite];

      UtilForm.FSQLFile := '';
      SevenZip.SZFileName := ASource;
      SevenZip.List;

      Result := UtilForm.FSQLFile <> '';
      if Result then
      begin
        SevenZip.ExtrBaseDir := ExtractFilePath(ASource);
        SevenZip.Files.Clear;
        SevenZip.Files.AddString(UtilForm.FSQLFileIndex);
        n := SevenZip.Extract;
        Result := n = 0;
        if Result then
          ADestination := CorrectPath(ExtractFilePath(ASource)) + UtilForm.FSQLFile;
      end;
    finally
      HideProgress;
      if Assigned(SevenZip) then SevenZip.Free;
    end;
  end;
end;

//полный сброс панелей инструментов
procedure ResetBarManager(ABarManager : TdxBarManager);
  var
    i : integer;
    vBar : TDXBar;
begin
  ABarManager.SaveToIniFile(cIniFileNameToolBar);
  ABarManager.LoadFromIniFile(cIniFileNameToolbar);

  for i := 0 to ABarManager.Bars.Count - 1 do
  begin
    vBar := ABarManager.Bars[i];
    vBar.Reset;
    vBar.Visible := true;
  end;
end;

//null если указанное значение
function NullIf(AValue, ANullValue : variant) : variant;
begin
  if AValue = ANullValue then Result := null
  else Result := AValue;
end;

//строка есть дата и время
function IsDateTime(AString : string) : boolean;
begin
  try
    StrToDateTime(AString);
    Result := true;
  except
    Result := false;
  end;
end;

function DirExists(Name: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Name));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

procedure TUtilForm.FormCreate(Sender: TObject);
  var
    p, f : string;
    vPath : array [0..max_path- 1] of char;

procedure CreateLink(const PathObj, PathLink, Desc, Param: string);
var
  IObject: IUnknown;
  SLink: IShellLink;
  PFile: IPersistFile;
begin
  IObject := CreateComObject(CLSID_ShellLink);
  SLink := IObject as IShellLink;
  PFile := IObject as IPersistFile;
  with SLink do
  begin
    SetArguments(PChar(Param));
    SetDescription(PChar(Desc));
    SetPath(PChar(PathObj));
  end;
  PFile.Save(PWChar(WideString(PathLink)), FALSE);
end;

begin
  //сохраняем DLL в каталог с программой, если их нет
  p := ExtractFilePath(Application.ExeName);
  p := CorrectPath(p);
  f := p + 'borlndmm.dll';
//  if not FileExists(f) then bfBorlandmem.SaveToFile(f);
  f := p + 'libmySQL.dll';
//  if not FileExists(f) then bfLibmysql.SaveToFile(f);

  FillChar(vPath, max_path, 0);
  if Succeeded(SHGetFolderPath(0, CSIDL_DESKTOPDIRECTORY, 0, 0, vPath)) then
  begin

    p := vPath;
    p := CorrectPath(p);
    f := p + 'ПорталПро Администратор.lnk';
{    if not FileExists(f) then
      CreateLink(Application.ExeName, f, '', '') ;}
  end;

end;

procedure TUtilForm.OnInitializeISO(var VHeaderEncoding: Char;
  var VCharSet: string);
begin
  Vcharset := FCharset;
end;

procedure TUtilForm.pmcCustomClick(Sender: TObject);
begin
  ChangeColumns(TDBGridEh(pmColumns.Tag));
end;

procedure TUtilForm.pmColumnClick(Sender: TObject);
begin
  TColumnEh(TMenuItem(Sender).Tag).Visible := not TMenuItem(Sender).Checked;
end;

procedure TUtilForm.pmColumnsPopup(Sender: TObject);
begin
  FillDBGridEhMenu(pmColumns, TDBGridEh(pmColumns.PopupComponent));
  pmColumns.Tag := integer(pmColumns.PopupComponent);
end;

procedure TUtilForm.SevenZipListfile(Sender: TObject; Filename: WideString;
  Fileindex, FileSizeU, FileSizeP, Fileattr, Filecrc: Int64;
  Filemethod: WideString; FileTime: Double);
begin
  if fileattr = fadirectory then exit;

  if (AnsiLowerCase(ExtractFileExt(Filename)) = '.sql') and (FSQLFile = '') then
  begin
    FSQLFile := Filename;
    FSQLFileIndex := IntToStr(FileIndex);
  end;
end;

procedure TUtilForm.SevenZipPreProgress(Sender: TObject; MaxProgress: Int64);
begin
  if Maxprogress > 0 then FMaxProgress := Maxprogress;
end;

procedure TUtilForm.SevenZipProgress(Sender: TObject; Filename: WideString;
  FilePosArc, FilePosFile: Int64);
begin
  ChangeProgress(FilePosArc / FMaxProgress * 100);
end;

function GetFileSize(const FileName: string): Int64;
var
  Handle: THandle;
  FindData: TWin32FindData;
begin
  Handle := FindFirstFile(PChar(FileName), FindData);
  if Handle <> INVALID_HANDLE_VALUE then begin
    Windows.FindClose(Handle);
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
      Int64Rec(Result).Lo := FindData.nFileSizeLow;
      Int64Rec(Result).Hi := FindData.nFileSizeHigh;
      Exit;
    end;
  end;
  Result := -1;
end;

function FileExecute(const FileName, Params, StartDir: string;
  InitialState: TExecState): THandle;

begin
  Result := ShellExecute(Application.Handle, nil, PChar(FileName),
    PChar(Params), PChar(StartDir), ShowCommands[InitialState]);
end;

function FileExecuteWait(const FileName, Params, StartDir: string;
  InitialState: TExecState): Integer;
var
  Info: TShellExecuteInfo;
  ExitCode: DWORD;
begin
  FillChar(Info, SizeOf(Info), 0);
  Info.cbSize := SizeOf(TShellExecuteInfo);
  with Info do begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(FileName);
    lpParameters := PChar(Params);
    lpDirectory := PChar(StartDir);
    nShow := ShowCommands[InitialState];
  end;
  if ShellExecuteEx(@Info) then begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(Info.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
    Result := ExitCode;
  end
  else Result := -1;
end;

//изменение размера JPEG картинки
procedure ResizeJPEG(AImage : TMemoryStream; AWidth, AHeight : integer);
  var
    vFrom, vTo : TBitmap32;
    vRes : TBitmap;
    vJPEGImage : TJPEGImage;
    r1, r2 : double;
begin
  if AImage.Size = 0 then Exit;

  AImage.Position := 0;
  vJPEGImage := TJPEGImage.Create;
  vJPEGImage.LoadFromStream(AImage);

  if (vJPEGImage.Width <= AWidth) and (vJPEGImage.Height <= AHeight) then
  begin
    //не надо ничего уменьшать
    vJPEGImage.Free;
    Exit;
  end;

  //пропорционально уменьшаем вписываемое изображение
  r1 := vJPEGImage.Height / vJPEGImage.Width;
  r2 := AHeight / AWidth;

  if r1 > r2 then
  begin
    AWidth := Trunc(AWidth / r1 * r2);
  end
  else
  begin
    AHeight := Trunc(AHeight / r2 * r1);
  end;

  vFrom := TBitmap32.Create;
  vFrom.Assign(vJPEGImage);
  vFrom.ResamplerClassName := 'TKernelResampler';
  TKernelResampler(vFrom.Resampler).KernelMode := kmDynamic;
  TKernelResampler(vFrom.Resampler).KernelClassName := 'TLanczosKernel';
  TLanczosKernel(TKernelResampler(vFrom.Resampler).Kernel).Width := 2;
  vFrom.DrawMode := dmBlend;

  vTo := TBitmap32.Create;
  vTo.SetSize(AWidth, AHeight);
  vTo.DrawMode := dmBlend;
  vFrom.DrawTo(vTo, Rect(0, 0, AWidth, AHeight));

  vRes := TBitmap.Create;
  vRes.PixelFormat := pf32bit;
  vRes.Width := AWidth;
  vRes.Height := AHeight;
  vRes.Assign(vTo);

  vJPEGImage.CompressionQuality := 80;
  vJPEGImage.Assign(vRes);
  AImage.Clear;
  vJPEGImage.SaveToStream(AImage);
  AImage.Position := 0;

  vFrom.Free;
  vTo.Free;
end;

function RemoveBackSlash(const DirName: string): string;
begin
  Result := DirName;
  if (Length(Result) > 1) and
    (AnsiLastChar(Result)^ = '\')
  then
    if not ((Length(Result) = 3) and CharInSet(Result[1], ['A'..'Z', 'a'..'z']) and
      (Result[2] = ':')) then
      Delete(Result, Length(Result), 1);
end;

function StrToOem(const AnsiStr: ansistring): ansistring;
begin
  SetLength(Result, Length(AnsiStr));
  if Result <> '' then
    CharToOemBuffA(PAnsiChar(AnsiStr), PAnsiChar(Result), Length(Result));
end;

function OemToStr(const OemStr: ansistring): ansistring;
begin
  SetLength(Result, Length(OemStr));
  if Length(Result) > 0 then
    OemToCharBuffA(PAnsiChar(OemStr), PAnsiChar(Result), Length(Result));
end;

//отправка почты со вложенными файлами
procedure SendEMAIL(ToAddress, Subject, MessageBody, AFiles: string; AEMLFileName : string = '');
  function AsHTML(InText: string): string;
  begin
    Result := Format(
      '<HTML><BODY>%s</BODY></HTML>',
      [InText]
    );
  end;

  var
    vFile : TIdAttachmentFile;
    SMTP: TidSMTP;
    OpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    EMessage: TidMessage;
    vOptions, vCharset: variant;
    I: Integer;
    vFiles: TStringList;
    vText : TIdText;
    vExt : string;
    v : variant;
    s, t, vEMLFileName : string;
    vNow : TDateTime;
begin
  vOptions := Datas.ReadOptions('EMailHost;EMailLogin;EMailPassword;FromEmail;EMailName;EMailAuthType;EMailTLSType;EMailPort;EMailNotification');
  vCharset := Datas.ReadOptions('EMailCharset')[0];

  EMessage := TidMessage.Create;
  EMessage.OnInitializeISO := UtilForm.OnInitializeISO;
  EMessage.CharSet := vCharset;
  UtilForm.EMAILCharset := vCharset;
  EMessage.Encoding := meMIME;
  EMessage.From.Name := vOptions[4];
  EMessage.From.Address:= vOptions[3];
  EMessage.Subject := Subject;
  EMessage.ContentType := 'multipart/mixed; charset=' + vCharset;

  //запрос уведомления о прочтении
  if IsNull(vOptions[8], 0) = 1 then
    EMessage.ReceiptRecipient.Address := vOptions[3];

  vText := TIdText.Create(EMessage.MessageParts);
  With vText do
  begin
    ContentType := 'text/html; charset=' + vCharset;
//    Body.Text := AsHTML(MessageBody);
    Body.Text := MessageBody;

//  EMessage.Body.Text := AsHTML(MessageBody);
  end;

  vFiles := TstringList.Create;
  vFiles.Delimiter := ';';
  vFiles.StrictDelimiter := true;
  vFiles.DelimitedText := AFiles;

  for i := 0 to vFiles.Count - 1 do
    if FileExists(vFiles[i]) then
    begin
      vFile := TIdAttachmentFile.Create(EMessage.MessageParts, vFiles[i]);

      vFile.FileName := vFiles[i];
    end;

  EMessage.Recipients.EMailAddresses := ToAddress;

  //отправка через почтового клиента или родная
  v := Datas.ReadOptions('EMailPreviewClient');
  if IsNull(v[0], 0) = 1 then
  begin
    //если имя не передано, формируем его сами
    if AEMLFileName = '' then
    begin
      vNow := Now;
      t := DateToSQLDAte(vNow);
      s := StringReplace(t, '.', '', [rfReplaceAll]);
      t := TimeToStr(vNow);
      s := s + StringReplace(t, ':', '', [rfReplaceAll]);
      AEMLFileName := cABSFileEMAilDir + 'EMailTemp' + s + '.eml';
    end;

    if AEMLFileName <> '' then
    begin
      vEMLFileName := AEMLFileName;
      EMessage.SaveToFile(vEMLFileName);

      OpenEMailClient(vEMLFileName);
    end;
  end
  else
  begin
    OpenSSL:= TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    SMTP := TidSMTP.Create(nil);

    try
      SMTP.Host := vOptions[0];
      SMTP.Port := vOptions[7];
      SMTP.Username := vOptions[1];
      SMTP.Password := vOptions[2];
      SMTP.AuthType := TIdSMTPAuthenticationType(vOptions[5]);

      OpenSSL.Destination := SMTP.Host + ':' + IntToStr(SMTP.Port);
      OpenSSL.Host := SMTP.Host;
      OpenSSL.Port := SMTP.Port;
      OpenSSL.DefaultPort := 0;
      OpenSSL.SSLOptions.Method := sslvTLSv1;
      OpenSSL.SSLOptions.Mode := sslmUnassigned;

      SMTP.IOHandler := OpenSSL;
      SMTP.UseTLS := TIdUseTLS(vOptions[6]);

      try
        SMTP.Connect;
        SMTP.Send(EMessage);
      finally
        SMTP.Disconnect;
      end;

    finally
      SMTP.Free;
      OpenSSL.Free;
    end;
  end;

  EMessage.Free;
  vFiles.Free;
end;

//отправка почты со вложенными файлами на несколько адресов
procedure SendEMAILMulti(AAddressList, Subject, MessageBody, AFiles : string);
  var
    i : integer;
    vEMail : TStringList;
    s : string;
begin
  vEMail := TStringList.Create;
  vEMail.Delimiter := ';';
  vEMail.StrictDelimiter := true;
  vEMail.DelimitedText := AAddressList;

  ShowProgress('Отправка электронной почты...');

  for i := 0 to vEMail.Count - 1 do
  begin
    ChangeProgress(i / vEMail.Count * 100);
    try
      s := vEMail[i];
      if s <> '' then  SendEMail(s, Subject, MessageBody, AFiles);
    except
      on e : exception do ShowMsg('Не удалось отправить почту на ' + vEMail[i] + ', возникла ошибка:'#13#10 + E.Message, smtWarning);
    end;
  end;

  ChangeProgress(100);
  Sleep(500);
  HideProgress;

  vEMail.Free;
end;

procedure SendEMailClient(ToAddress, Subject, MessageBody : string; Attachs : array of string);
 var
   MM, MS : Variant;
   i : integer;
 begin
   MS := CreateOleObject('MSMAPI.MAPISession');
   try
     MM := CreateOleObject('MSMAPI.MAPIMessages');
     try
       MS.DownLoadMail := False;
       MS.NewSession := False;
       MS.LogonUI := True;
       MS.SignOn;
       MM.SessionID := MS.SessionID;

       MM.Compose;

       MM.RecipIndex := 0;
       MM.RecipAddress := ToAddress;
       MM.MsgSubject := Subject;
       MM.MsgNoteText := MessageBody;

       for i := Low(Attachs) to High(Attachs) do
       begin
         MM.AttachmentIndex := i;
         MM.AttachmentPathName := Attachs[i];
       end;

       MM.Send(True);

       MS.SignOff;
     finally
       VarClear(MS);
     end;
   finally
     VarClear(MM);
   end;
 end;

//открытие файла электронного письма стандартной почтовой программой
procedure OpenEMailClient(AEMLFileName : string);
begin
  FileExecute(AEMLFileName, 'New', '', esNormal);
end;

//получение списка тэгов из полей набора данных
function GetTagList(ADataSet : TDataSet) : string;
  var
    s : string;
    i : integer;
begin
  s := '';
  for i := 0 to ADataSet.FieldList.Count - 1 do
  begin
    if s <> '' then s := s + ';';
    s := s + ADataset.Fields[i].DisplayLabel + '=' + ADataset.Fields[i].FieldName;
  end;
  Result := s;
end;

//получение списка значений тэгов из полей набора данных
function GetTagValueList(ADataSet : TDataSet) : string;
  var
    s : string;
    i : integer;
begin
  s := '';
  for i := 0 to ADataSet.FieldList.Count - 1 do
  begin
    if s <> '' then s := s + ';';
    s := s + ADataset.Fields[i].DisplayLabel + '=' + ADataset.Fields[i].AsString;
  end;
  Result := s;
end;

//получение списка значений тэгов из полей набора данных
function GetTagValues(ADataSet : TDataSet) : string;
  var
    v, s : string;
    i : integer;
begin
  s := '';
  for i := 0 to ADataSet.FieldList.Count - 1 do
  begin
    if s <> '' then s := s + ';';
    s := s + ADataset.Fields[i].FieldName + '=';
    v := ADataset.Fields[i].AsString;
    v := SysUtils.StringReplace(v, ';', '_', [rfReplaceAll]);
    s := s + v;
  end;
  Result := s;
end;

//замена тэгов значениями
function UpdateTagList(ARTF : TRichEdit; ATagValues : string) : boolean;
var
  OldSelStart, PrevSelStart: Integer;
  StartPos, FindLength, FoundAt: Integer;
  Flags: TSearchTypes;
  vTag, vValue : string;
  vStringList : TStringList;
  i : integer;
begin
  vStringList := TStringList.Create;
  vStringList.Delimiter := ';';
  vStringList.StrictDelimiter := true;
  vStringList.DelimitedText := ATagValues;

  for i := 0 to vStringList.Count - 1 do
    with ARTF do
    begin
      SelStart := 0;
      vTag := '[' + vStringList.Names[i] + ']';
      vValue := vStringList.ValueFromIndex[i];

      repeat
        if (SelLength > 0) and (AnsiLowerCase(SelText) = AnsiLowerCase(vTag)) then SelText := vValue;
        PrevSelStart := SelStart;

        if SelLength = 0 then StartPos := SelStart
        else StartPos := SelStart + SelLength;
        FindLength := Length(Text) - StartPos;

        Flags := [];

        FoundAt := ARTF.FindText(vTag, StartPos, FindLength, Flags);

        if FoundAt > -1 then
        begin
          SelStart := FoundAt;
          SelLength := Length(vTag);
        end

      until (SelStart = PrevSelStart);
    end;
  vStringList.Free;
end;

//замена тэгов значениями
function UpdateTagList(var AText : string; ATagValues : string) : boolean; overload;
var
  OldSelStart, PrevSelStart: Integer;
  StartPos, FindLength, FoundAt: Integer;
  Flags: TSearchTypes;
  vTag, vValue : string;
  vStringList : TStringList;
  i : integer;
begin
  vStringList := TStringList.Create;
  vStringList.Delimiter := ';';
  vStringList.StrictDelimiter := true;
  vStringList.DelimitedText := ATagValues;

  for i := 0 to vStringList.Count - 1 do
  begin
    vTag := '[' + vStringList.Names[i] + ']';
    vValue := vStringList.ValueFromIndex[i];

    AText := StringReplace(AText, vTag, vValue, [rfReplaceAll]);
  end;

  vStringList.Free;
end;

//получение значения параметра из строки в формате Имя1=Значение1;Имя2=Значение2 ...
function GetParamValue(AParams : string; AParamName : string; ADelimiter : char = ';') : string;
  var
    vStringList : TStringList;
begin
  vStringList := TStringList.Create;
  vStringList.Delimiter := ADelimiter;
  vStringList.StrictDelimiter := true;
  vStringList.DelimitedText := AParams;
  if vStringList.IndexOfName(AParamName) <> -1 then Result := vStringList.Values[AParamName]
  else Result := '';
end;

function IsIntegerByChar(AString : string) : boolean;
  var
    i : integer;
begin
  AString := Trim(AString);

  Result := AString <> '';

  if Result then
    for i := 1 to Length(AString) do
      Result := Result and (AString[i] in ['0'..'9']);
end;

function CountPos(const subtext: string; Text: string): Integer;
begin
  if (Length(subtext) = 0) or (Length(Text) = 0) or (Pos(subtext, Text) = 0) then Result := 0
  else
    Result := (Length(Text) - Length(StringReplace(Text, subtext, '', [rfReplaceAll]))) div Length(subtext);
end;

//получение имени параметра из строки в формате Имя=Значение
function GetParamOneName(AParams : string; AIndex : integer = 0; ADelimiter : char = ';') : string;
  var
    vStringList : TStringList;
begin
  vStringList := TStringList.Create;
  vStringList.Delimiter := ADelimiter;
  vStringList.StrictDelimiter := true;
  vStringList.DelimitedText := AParams;

  if vStringList.Count > 0 then Result := vStringList.Names[AIndex]
  else Result := '';

  vStringList.Free;
end;

//получение имени параметра из строки в формате Имя=Значение
function GetParamOneValue(AParams : string; AIndex : integer = 0; ADelimiter : char = ';') : string;
  var
    vStringList : TStringList;
begin
  vStringList := TStringList.Create;
  vStringList.Delimiter := ADelimiter;
  vStringList.StrictDelimiter := true;
  vStringList.DelimitedText := AParams;
  if vStringList.Count > 0 then Result := vStringList.ValueFromIndex[AIndex]
  else Result := '';
  vStringList.Free;
end;

//получение количества строк, разделенных ";" в формате Имя=Значение;...
function GetParamCount(AParams : string; ADelimiter : char = ';') : integer;
  var
    vStringList : TStringList;
begin
  vStringList := TStringList.Create;
  vStringList.Delimiter := ADelimiter;
  vStringList.StrictDelimiter := true;
  vStringList.DelimitedText := Trim(AParams);
  Result := vStringList.Count;
  vStringList.Free;
end;

//получение количества слов в строке
function GetTextWordCount(AText : string) : integer;
  var
    i, n, w : integer;
    s : string;
begin
  AText := StringREplace(AText, '.', '. ', [rfReplaceAll]);
  AText := StringREplace(AText, ',', ', ', [rfReplaceAll]);
  AText := StringREplace(AText, ':', ': ', [rfReplaceAll]);
  AText := StringREplace(AText, ';', '; ', [rfReplaceAll]);
  AText := Trim(AText) + ' ';

  n := Length(AText);
  w := 0;
  i := 1;
  s := '';
  while i <= n do
  begin
    if (Copy(AText, i, 1) <> ' ') then
    begin
      s := s + Copy(AText, i, 1);
      inc(i);
    end
    else
    begin
      s := '';
      w := w + 1;
      while (i <= n) and (Copy(AText, i, 1) = ' ') do inc(i);
    end;
  end;
  Result := w;
end;

//получение количества слов в строке
function GetTextWordByIndex(AText : string; AIndex : integer) : string;
  var
    i, n, w : integer;
    s : string;
begin
  AText := StringREplace(AText, '.', '. ', [rfReplaceAll]);
  AText := StringREplace(AText, ',', ', ', [rfReplaceAll]);
  AText := StringREplace(AText, ':', ': ', [rfReplaceAll]);
  AText := StringREplace(AText, ';', '; ', [rfReplaceAll]);
  AText := Trim(AText) + ' ';

  n := Length(AText);
  w := 0;
  i := 1;
  s := '';
  while (i <= n) and (w <> AIndex) do
  begin
    if Copy(AText, i, 1) <> ' ' then
    begin
      s := s + Copy(AText, i, 1);
      inc(i);
    end
    else
    begin
      Result := s;
      s := '';
      w := w + 1;
      while (i <= n) and (Copy(AText, i, 1) = ' ') do inc(i);
    end;
  end;
end;

//заполнение выпадающего списка колонками таблицы
function FillDBGridEhMenu(APopupMenu : TPopupMenu; ADBGridEh : TDBGridEh) : boolean;
  var
    i : integer;
    vMenuItem : TMenuItem;
    vStrings : TStringList;
  function FindMenuItem(Menu : TPopupMenu; ACaption : string) : TMenuItem;
    var
      i : integer;
  begin
    Result := nil;
    with Menu do
    begin
      for i := 0 to Items.Count - 1 do
        if Items[i].Caption = ACaption then
        begin
          Result := Items[i];
          Exit;
        end;
    end;
  end;
begin
  //заполняем меню
  with APopupMenu do
  begin
    while Items[0].Caption <> '-' do Items[0].Free;
    vStrings := TStringList.Create;
    for i := 0 to ADBGridEh.Columns.Count - 1 do
      with ADBGridEh.Columns[i].Field do
        vStrings.AddObject(DisplayLabel, ADBGridEh.Columns[i]);
    vStrings.Sort;
    for i := vStrings.Count - 1 downto 0 do
    begin
      vMenuItem := TMenuItem.Create(APopupMenu);
      vMenuItem.OnClick := UtilForm.pmColumnClick;
      vMenuItem.Checked := TColumnEh(vStrings.Objects[i]).Visible;
      vMenuItem.Caption := vStrings[i];
      Items.Insert(0, vMenuItem);
    end;
  end;

  for i := 0 to ADBGridEh.Columns.Count - 1 do
    with ADBGridEh.Columns[i].Field do
    begin
      vMenuItem := FindMenuItem(APopupMenu, DisplayLabel);
      vMenuItem.Checked := ADBGridEh.Columns[i].Visible;
      vMenuItem.Tag := integer(ADBGridEh.Columns[i]);
    end;
  Result := true;
end;

//раскраска DbGridEh
procedure SetDBGridEhSkin(AGrid : TDBGridEh);
  var
    i : integer;
begin
  AGrid.Color := RootLookAndFeel.Painter.DefaultContentColor;
  AGrid.OddRowColor := RootLookAndFeel.Painter.DefaultContentOddColor;
  AGrid.EvenRowColor := RootLookAndFeel.Painter.DefaultContentEvenColor;
  AGrid.FixedColor := RootLookAndFeel.Painter.DefaultContentColor;//RootLookAndFeel.Painter.DefaultFixedSeparatorColor;
//  AGrid.ColumnDefValues.Title.Color := RootLookAndFeel.Painter.DefaultContentColor
  //RootLookAndFeel.Painter.DefaultHeaderColor;
end;

//показать сообщение "в разработке"
procedure ShowUnderConstruction;
begin
  ShowMsg('Данный инструмент находится в разработке!', smtInformation, [smbOK], smbOK, smbOK);
end;

function FindForm(AType : TFormClass) : TForm;
  var
    w : TWinItem;
begin
  w := WinList.FindByFormClass(AType);
  Result := nil;
  if Assigned(w) then Result := w.Form;
end;

//проверка существования окна с указанным типом
function ExistsForm(AType : TFormClass) : boolean;
begin
  Result := WinList.ExistsFormClass(AType);
end;

function GetModuleFileName(pID: DWORD): string;
  var
    hSnapshot: THandle;
    mEntr: tagMODULEENTRY32;
begin
  result:= 'noname';
  hSnapshot:= CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, pID);
  if hSnapshot <> INVALID_HANDLE_VALUE then
  try
    mEntr.dwSize:= SizeOf(mEntr);
    if Module32First(hSnapshot, mEntr) then
      result:= mEntr.szExePath;
  finally
    CloseHandle(hSnapshot)
  end;
end;

function ParentProcName: string;
  var
    pID: DWORD;
    hSnapshot: THandle;
    ProcessEntry: TProcessEntry32;
begin
  result:= '';
  hSnapshot:= CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if hSnapshot <> INVALID_HANDLE_VALUE then
  try
    ProcessEntry.dwSize:= SizeOf(ProcessEntry);
    if Process32First(hSnapshot, ProcessEntry) then
    begin
      pID:= GetCurrentProcessID;
      repeat
        if ProcessEntry.th32ProcessID = pID then
        begin
          result:= GetModuleFileName(ProcessEntry.th32ParentProcessID);
           Break;
        end;
      until not Process32Next(hSnapshot, ProcessEntry);
    end;
  finally
    CloseHandle(hSnapshot)
  end;
end;

// корректировка текста для получения только целого числа вначале строки
function CorrectInteger(AString : string) : string;
  var
    n, i : integer;
begin
  Result := '';
  AString := Trim(AString);
  i := 1;
  n := Length(AString);
  while (i <= n) and (AString[i] in ['0'..'9']) do
  begin
    Result := Result + AString[i];
    inc(i);
  end;
end;

// корректировка текста для получения только целого числа по всей строке
function CorrectInteger2(AString : string) : string;
  var
    n, i : integer;
begin
  Result := '';
  AString := Trim(AString);
  i := 1;
  n := Length(AString);
  while (i <= n) do
  begin
    if (AString[i] in ['0'..'9'])  then
      Result := Result + AString[i];
    inc(i);
  end;
end;

//удаление символов маски из текста с номером телефона
function PreparePhone(AString : string) : string;
begin
  Result := CorrectInteger2(AString);

  //далее режем длину до 10 цифр
  Result := RightStr(Result, 10);

{  Result := ReplaceStr(AString, '(' ,'');
  Result := ReplaceStr(REsult, ')' ,'');
  Result := ReplaceStr(REsult, ' ' ,'');
  Result := ReplaceStr(REsult, '-' ,'');}
end;

//проверка на корректнсть рабочего времени
function IsWorkTime(AStr : string) : boolean;
  var
    h1, h2, m1, m2 : string;
begin
  AStr := Trim(AStr);
  Result :=
    (Length(AStr) = 11) and
    (Copy(AStr, 3, 1) = ':') and
    (Copy(AStr, 6, 1) = '-') and
    (Copy(AStr, 9, 1) = ':');
  if Result then
  begin
    h1 := Copy(AStr, 1, 2);
    m1 := Copy(AStr, 4, 2);
    h2 := Copy(AStr, 7, 2);
    m2 := Copy(AStr, 10, 2);

    Result :=
      IsInteger(h1) and IsInteger(m1) and IsInteger(h2) and IsInteger(m2) and
      (StrToInt(h1) >= 0) and (StrToInt(h1) <= 23) and
      (StrToInt(h2) >= 0) and (StrToInt(h2) <= 23) and
      (StrToInt(m1) >= 0) and (StrToInt(m1) <= 59) and
      (StrToInt(m2) >= 0) and (StrToInt(m2) <= 59) and
      ((StrToInt(h1) * 60 + StrToInt(m1)) <= (StrToInt(h2) * 60 + StrToInt(m2)));
  end;
end;

//  TDay = (dSunday, dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday);
//  TDays = set of TDay;

//установка TDays из строки
procedure SetDaysFromStr(var ADays : TDays; AStr : ansistring);
  var
    vDays : TDays;
    i, n : byte;
begin
  vDays := [];
  for i := 0 to 6 do
  begin
    n := i + 1;
    if n = 7 then n := 0;
    if Copy(AStr, i + 1, 1) = '1' then
      vDays := vDays + [TDay(n)];
  end;
  ADays := vDays;
end;

//установка строки из TDays
procedure SetStrFromDays(var AStr : ansistring; ADays : TDays);
  var
    vDays : TDays;
    i, n : byte;
begin
  AStr := '0000000';
  for i := 0 to 6 do
  begin
    n := i + 1;
    if n = 7 then n := 0;

    if TDay(n) in ADays then AStr[i] := '1';
  end;
  ADays := vDays;
end;

//округление до сотых
function RoundH(AFloat : double) : double;
begin
  Result := GetDoubleToHoundredth(AFloat);
end;

//форматирование телефона
function PhoneFormat(AStr : string) : string;
  var
    s : string;
begin
  s := PreparePhone(AStr);
  if Length(s) = 10 then s := '(' + Copy(s, 1, 3) + ') ' + Copy(s, 4, 3) + '-' + Copy(s, 7, 4);
  Result := s;
end;

//позвонить
procedure ExecPhone(APhone : string; AName : string);
  var
    s, p, d : string;
begin
  s := AnsiLowerCase(CallToCommandLine);
  s := StringReplace(s, '<phone>', APhone, [rfReplaceAll]);
  s := StringReplace(s, '<name>', AName, [rfReplaceAll]);

  d := AnsiLowerCase(extractfiledrive(s));

  if d = '' then
  begin
    ShellExecute(0, 'open', PChar(s), '', '', SW_SHOW)
  end
  else
  begin
    p := AnsiLowerCase(CallToParams);
    p := StringReplace(p, '<phone>', APhone, [rfReplaceAll]);
    p := StringReplace(p, '<name>', AName, [rfReplaceAll]);
    ShellExecute(0, 'open', PChar(s), PChar(p), '', SW_SHOW)
  end;
end;

{ TBarManagerHelper }

procedure TBarManagerHelper.LoadFromIniFile(const AFileName: string);
  var
    s, v : string;
    i, p : integer;
    vStringList : TStringList;
    vNewIcons : boolean;
begin
  //читаем все иконки
  inherited LoadFromIniFile(AFileName);

  vStringList := TStringList.Create;
  //разбор параметров запуска
  for i := 1 to ParamCount do
  begin
    s := ParamStr(i);
    if (s[1] = '-') then vStringList.Add(AnsiLowerCase(RightStr(s, Length(s) - 1)));
  end;

  if (vStringList.IndexOf('ni') <> -1) then vNewIcons := true
  else vNewIcons := false;

  vStringList.Free;

  v := AppVerInfo.FileVersion;
  p := Pos('.', v);
  s := Copy(v, 1, p - 1);
  try
    p := StrToInt(s);
  except
    p := 1;
  end;
  if (p <= 3) and not vNewIcons then
  begin
//    ImageOptions.UseLargeImagesForLargeIcons := false;
    ImageOptions.LargeImages := UtilForm.ImageListBig;
    ImageOptions.Images := UtilForm.ImageList;
  end
  else
  begin
//    ImageOptions.UseLargeImagesForLargeIcons := true;
    ImageOptions.LargeImages := UtilForm.ImageListBig;
    ImageOptions.Images := UtilForm.ImageList;
  end;
end;

{ TFileScanner }

constructor TFileScanner.Create (AOwner: TComponent);
begin
  Inherited Create (AOwner);
  FOnDirectoryFound := nil;       // no callback pointer yet for directory start
  FOnDirectoryDone := nil;        // or for directory complete
  FOnFileFound := nil;            // or for found file
  FSearchInProgress := False;     // and we're not yet searching
end;

procedure TFileScanner.ScanTree;
begin
  FSearchInProgress := True;      // now searching
  FFoundObject := '';             // nothing found as yet

  // Try to get a valid directory string.  If the user hasn't
  // specified a directory, use the current directory...
  if FInitialDirectory = '' then FInitialDirectory := GetCurrentDir;

  // ensure the directory ends in a '\'
  if FInitialDirectory [Length (FInitialDirectory)] <> '\' then
    FInitialDirectory := FInitialDirectory + '\';

  // now remove any file specification components...
  FInitialDirectory := ExtractFileDir (FInitialDirectory);
  // and again ensure that trailing backslash is present....
  if FInitialDirectory [Length (FInitialDirectory)] <> '\' then
    FInitialDirectory := FInitialDirectory + '\';
  // assume we wish to continue (at least to start with!)
  Continue := True;
  // and call the recursive scanning procedure
  scan_directory (FInitialDirectory);
  FSearchInProgress := False;      // note we have finished searching
end;

procedure TFileScanner.scan_directory (const dir: string);
var
 f: TSearchRec;             // used for scanning a directory
 status: integer;           // value returned from FindFirst/FindNext
 file_list: TStringList;    // sorted list of files in the directory
 dir_list: TStringList;     // sorted list of sub-directories
 i: integer;                // used to traverse the above lists
begin
  Application.ProcessMessages;    // allow the caller to do some work
  if not Continue then Exit;      // interrupted? - simply return to caller

  FFoundObject := dir;               // prepare to tell owner that we've
  if Assigned (FOnDirectoryFound)    // found a new directory
    then FOnDirectoryFound (self);

  file_list := TStringList.Create;   // prepare list of files
  file_list.Sorted := True;          // and note is is to be in sorted order
  dir_list := TStringList.Create;    // prepare list of directories
  dir_list.Sorted := True;           // also sorted

  dir_list.BeginUpdate;
  status := FindFirst (dir + '*.*', faAnyFile, f);  // try the first find call
  while status = 0 do with f do      // keep looping while more directories
    begin
    if ((faDirectory and Attr) <> 0) and     // is this a directory?
       (Name <> '.') and (Name <> '..')      // ignore backlinks
      then dir_list.Add (dir + Name + '\');  // add it to directory list
    status := FindNext (f);          // see if there's another directory entry
    end;
  FindClose (f);                     // all done, clean up from directory scan
  dir_list.EndUpdate;

  file_list.BeginUpdate;
  status := FindFirst (dir + FFileMask, faAnyFile, f);  // try the first find call
  while status = 0 do with f do      // keep looping while more entries
    begin
    if ((faDirectory and Attr) = 0) and   // is this not a directory?
       ((faVolumeID and Attr) = 0)        // is this not a volume ID?
      then file_list.Add (dir + Name);    // then add to file list
    status := FindNext (f);          // see if there's another directory entry
    end;
  FindClose (f);                     // all done, clean up from the scan
  file_list.EndUpdate;

  // scan the sorted list of files and call back the owner for each
  for i := 0 to file_list.Count - 1 do
    begin
    FFoundObject := file_list.Strings [i];
    if Assigned (FOnFileFound) then FOnFileFound (self);
    end;
  file_list.Free;                     // return memory owned by the list

  // scan the sorted list of directories and scan each sub-directory
  for i := 0 to dir_list.Count - 1 do
    scan_directory (dir_list.Strings [i]);
  dir_list.Free;                     // return memory owned by the list

  if Assigned (FOnDirectoryDone)     // finished this directory
    then FOnDirectoryDone (self);
end;

{ TFormHelper }

{constructor TFormHelper.Create(AOwner: TComponent);
  var
    i : integer;
begin
  inherited Create(AOwner);

  Font.Name := 'Tahoma';

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TcxGrid then
    begin
      (Components[i] as TcxGrid).ParentFont := true;
    end;
end;}

initialization
  WinList := TWinList.Create;

  UtilForm := TUtilForm.Create(nil);
finalization
  UtilForm.Free;

  WinList.Free;
end.

