//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Главное окно
//
//------------------------------------------------------------------------------
unit MainUnit;

interface

{$I MolotokAdm.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, Menus, ImgList, ComCtrls, ToolWin,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db,
  DBCtrls, Mask, MemoComponentUnit,
  Buttons, ActnMan, dxBarSkinnedCustForm,
  ActnColorMaps, XPStyleActnCtrls, ActnCtrls, ActnMenus, XPMan,
  dxBar, cxContainer, cxEdit, cxLookAndFeels, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxGroupBox, cxSplitter, dxStatusBar, dxDockControl,
  dxDockPanel, cxVGrid, cxInplaceContainer, cxDropDownEdit, cxCheckBox,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxTextEdit, cxMemo, cxDBEdit,
  cxGridBandedTableView, cxGridDBBandedTableView, cxSpinEdit, cxCalc, dxNavBar,
  dxNavBarBase, dxNavBarCollns, cxLookAndFeelPainters, cxButtons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,
  cxMRUEdit, cxPropertiesStore, BinaryFile, cxCalendar,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, dxSkinsdxDockControlPainter,
  dxSkinsForm, dxNavBarStyles, cxButtonEdit, JvTrayIcon, JvComponentBase, JvAppEvent,
  JvStringHolder, JvWinHelp, cxLocalization, cxPC,
  dxSkinsdxNavBarPainter, System.Actions, PluginInterface, cxRichEdit,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, dxBarBuiltInMenu, dxTabbedMDI,
  dxNavBarOfficeNavigationBar

  {$Region 'Скины'}
  ,dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinOffice2007Green, dxCore
  {$ENDRegion}
  ;

type

  TPluginItem = class;

  //команда
  TCommandItem = class(TCollectionItem)
  private
    FAction: TAction;
  public
    property Action : TAction read FAction write FAction;
  end;

  //список команд
  TCommandList = class(TCollection)
  private
    FPluginItem : TPluginItem;
    function GetItem(Index: Integer): TCommandItem;//получение элемента
    procedure SetItem(Index: Integer; const Value: TCommandItem);//установка элемента
  protected
    function GetOwner: TPersistent; override;//владелец коллекции
  public
    function Insert(Index: Integer): TCommandItem;//вставка плугина
    function Add: TCommandItem;//добавление в конец
    //плугины
    property Items[Index: Integer]: TCommandItem read GetItem write SetItem; default;
  end;

  //плагин
  TPluginItem = class(TCollectionItem)
  private
    FPluginInterface: IPluginInterface;
    FFileName : string;
    FHandle : THandle;
    FCommandList : TCommandList;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property PluginInterface : IPluginInterface read FPluginInterface write FPluginInterface;
    property FileName : string read FFileName write FFileName;
    property Handle : THandle read FHandle write FHandle;

    property CommandList : TCommandList read FCommandList;
  end;

  //список плагинов
  TPluginList = class(TCollection)
  private
    function GetItem(Index: Integer): TPluginItem;//получение элемента
    procedure SetItem(Index: Integer; const Value: TPluginItem);//установка элемента
  protected
    function GetOwner: TPersistent; override;//владелец коллекции
  public
    function Insert(Index: Integer): TPluginItem;//вставка плугина
    function Add: TPluginItem;//добавление в конец
    //плугины
    property Items[Index: Integer]: TPluginItem read GetItem write SetItem; default;
  end;

  TMainForm = class(TForm, IMainInterface)
    ActionList: TActionList;
    afExit: TAction;
    ahAbout: TAction;
    afOptions: TAction;
    ahInfo: TAction;
    dsQuery: TDataSource;
    AppEvents: TJvAppEvents;
    afConnect: TAction;
    afDisconnect: TAction;
    arOpenReport: TAction;
    agEnterprise: TAction;
    agUser: TAction;
    agUserRole: TAction;
    OpenReport: TOpenDialog;
    aaChangePassword: TAction;
    XPManifest: TXPManifest;
    arCreateReport: TAction;
    EditStyleController: TcxEditStyleController;
    BarManager: TdxBarManager;
    dxFile: TdxBarSubItem;
    dxActions: TdxBarSubItem;
    dxGuide: TdxBarSubItem;
    dxHelp: TdxBarSubItem;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    TopBarDockControl: TdxBarDockControl;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton35: TdxBarButton;
    dxBarButton37: TdxBarButton;
    StatusBar: TdxStatusBar;
    DockingManager: TdxDockingManager;
    LeftDockSite: TdxDockSite;
    RightDockSite: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxBarButton52: TdxBarButton;
    arReportForm: TAction;
    dxBarButton53: TdxBarButton;
    WindowsPanel: TdxDockPanel;
    WinControl: TdxBarDockControl;
    NavBar: TdxNavBar;
    dxBarButton56: TdxBarButton;
    dxBarButton66: TdxBarButton;
    dxWindow: TdxBarSubItem;
    awHor: TAction;
    awVer: TAction;
    awCascade: TAction;
    awCloseAll: TAction;
    dxBarButton72: TdxBarButton;
    dxBarButton75: TdxBarButton;
    dxBarButton76: TdxBarButton;
    dxBarButton77: TdxBarButton;
    arReportSnap: TAction;
    dxBarButton12: TdxBarButton;
    dxReport: TdxBarSubItem;
    awWindowsList: TAction;
    dxBarButton71: TdxBarButton;
    BottomBarDockControl: TdxBarDockControl;
    ahHomePage: TAction;
    ahSupport: TAction;
    dxBarButton93: TdxBarButton;
    dxBarButton95: TdxBarButton;
    SkinController: TdxSkinController;
    SelectedStyle: TdxNavBarStyleItem;
    HotSelectedStyle: TdxNavBarStyleItem;
    PropertiesStore: TcxPropertiesStore;
    afDeleteWinOptions: TAction;
    dxBarButton113: TdxBarButton;
    RusLang: TBinaryFile;
    Localizer: TcxLocalizer;
    qReport: TZQuery;
    dxBarButton186: TdxBarButton;
    DemoInfo: TBinaryFile;
    cbInterface: TdxBarCombo;
    mPlugins: TdxBarSubItem;
    agStatusType: TAction;
    agOrderTag: TAction;
    agWorkClass: TAction;
    agWorkType: TAction;
    dxBarButton6: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton19: TdxBarButton;
    agDistrict: TAction;
    dxBarButton5: TdxBarButton;
    agMetro: TAction;
    dxBarButton7: TdxBarButton;
    agSourceType: TAction;
    dxBarButton8: TdxBarButton;
    agSignalType: TAction;
    dxBarButton9: TdxBarButton;
    agWorkerClass: TAction;
    dxBarButton13: TdxBarButton;
    agPaymentForm: TAction;
    dxBarButton14: TdxBarButton;
    aaClientRequest: TAction;
    dxBarButton4: TdxBarButton;
    aaWorkTypeSynonym: TAction;
    dxBarButton20: TdxBarButton;
    agWorkerCompany: TAction;
    dxBarButton21: TdxBarButton;
    aaWorkerLead: TAction;
    dxBarButton22: TdxBarButton;
    agWorker: TAction;
    dxBarButton23: TdxBarButton;
    agClient: TAction;
    dxBarButton24: TdxBarButton;
    TabbedMDIManager: TdxTabbedMDIManager;
    aaOrderList: TAction;
    dxBarButton25: TdxBarButton;
    agReason: TAction;
    dxBarButton26: TdxBarButton;
    aaBackup: TAction;
    aaRestore: TAction;
    aaSQLQuery: TAction;
    dxBarButton27: TdxBarButton;
    dxBarButton28: TdxBarButton;
    dxBarButton29: TdxBarButton;
    dxAdmin: TdxBarSubItem;
    agFAQ: TAction;
    dxBarButton30: TdxBarButton;
    aaBrowseOrderArch: TAction;
    dxBarButton31: TdxBarButton;
    agSearchHint: TAction;
    dxBarButton32: TdxBarButton;
    agAddressLimit: TAction;
    dxBarButton33: TdxBarButton;
    dxNotification: TdxBarSubItem;
    dxBarButton34: TdxBarButton;
    anTemplateEditor: TAction;
    anTemplateSnap: TAction;
    dxBarButton36: TdxBarButton;
    aaNoticeOptionsTime: TAction;
    aaNoticeOptionsAction: TAction;
    dxBarButton38: TdxBarButton;
    dxBarButton39: TdxBarButton;
    NotificationTimer: TTimer;
    aaBrowseNotificetion: TAction;
    dxBarButton40: TdxBarButton;
    qNotification: TZQuery;
    qNoticeTemplate: TZQuery;
    agDiscountType: TAction;
    dxBarButton41: TdxBarButton;
    aaBrowseOrderHist: TAction;
    dxBarButton42: TdxBarButton;
    agMaterialType: TAction;
    dxBarButton43: TdxBarButton;
    agWorkRestDay: TAction;
    dxBarButton44: TdxBarButton;
    aaQualityControl: TAction;
    dxBarButton45: TdxBarButton;
    agSurvey: TAction;
    dxBarButton46: TdxBarButton;
    agStatusTypeQC: TAction;
    dxBarButton47: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure afExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ahAboutExecute(Sender: TObject);
    procedure afOptionsExecute(Sender: TObject);
    procedure ahInfoExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acUpdateExecute(Sender: TObject);
    procedure AppEventsException(Sender: TObject; E: Exception);
    procedure afConnectExecute(Sender: TObject);
    procedure afDisconnectExecute(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure arOpenReportExecute(Sender: TObject);
    procedure agEnterpriseExecute(Sender: TObject);
    procedure agUserExecute(Sender: TObject);
    procedure eKeyPress(Sender: TObject; var Key: Char);
    procedure aaChangePasswordExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure cbRecordTypeChange(Sender: TObject);
    procedure arCreateReportExecute(Sender: TObject);
    procedure QueryAfterClose(DataSet: TDataSet);
    procedure arReportFormExecute(Sender: TObject);
    procedure NavBarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure awHorExecute(Sender: TObject);
    procedure awVerExecute(Sender: TObject);
    procedure awCascadeExecute(Sender: TObject);
    procedure awCloseAllExecute(Sender: TObject);
    procedure arReportSnapExecute(Sender: TObject);
    procedure awWindowsListExecute(Sender: TObject);
    procedure WindowsPanelCloseQuery(Sender: TdxCustomDockControl;
      var CanClose: Boolean);
    procedure FilterPanelCloseQuery(Sender: TdxCustomDockControl;
      var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ahHomePageExecute(Sender: TObject);
    procedure ahSupportExecute(Sender: TObject);
    procedure SkinControllerSkinForm(Sender: TObject; AForm: TCustomForm;
      var ASkinName: string; var UseSkin: Boolean);
    procedure FormResize(Sender: TObject);
    procedure AppEventsActiveFormChange(Sender: TObject);
    procedure afDeleteWinOptionsExecute(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbInterfaceChange(Sender: TObject);
    procedure agUserRoleExecute(Sender: TObject);
    procedure agStatusTypeExecute(Sender: TObject);
    procedure agOrderTagExecute(Sender: TObject);
    procedure agWorkClassExecute(Sender: TObject);
    procedure agWorkTypeExecute(Sender: TObject);
    procedure agDistrictExecute(Sender: TObject);
    procedure agMetroExecute(Sender: TObject);
    procedure agSourceTypeExecute(Sender: TObject);
    procedure agSignalTypeExecute(Sender: TObject);
    procedure agWorkerClassExecute(Sender: TObject);
    procedure agPaymentFormExecute(Sender: TObject);
    procedure aaClientRequestExecute(Sender: TObject);
    procedure aaWorkTypeSynonymExecute(Sender: TObject);
    procedure agWorkerCompanyExecute(Sender: TObject);
    procedure aaWorkerLeadExecute(Sender: TObject);
    procedure agWorkerExecute(Sender: TObject);
    procedure agClientExecute(Sender: TObject);
    procedure TabbedMDIManagerPageAdded(Sender: TdxTabbedMDIManager;
      APage: TdxTabbedMDIPage);
    procedure aaOrderListExecute(Sender: TObject);
    procedure agReasonExecute(Sender: TObject);
    procedure aaBackupExecute(Sender: TObject);
    procedure aaRestoreExecute(Sender: TObject);
    procedure aaSQLQueryExecute(Sender: TObject);
    procedure agFAQExecute(Sender: TObject);
    procedure aaBrowseOrderArchExecute(Sender: TObject);
    procedure agSearchHintExecute(Sender: TObject);
    procedure agAddressLimitExecute(Sender: TObject);
    procedure anTemplateEditorExecute(Sender: TObject);
    procedure anTemplateSnapExecute(Sender: TObject);
    procedure aaNoticeOptionsTimeExecute(Sender: TObject);
    procedure aaNoticeOptionsActionExecute(Sender: TObject);
    procedure NotificationTimerTimer(Sender: TObject);
    procedure aaBrowseNotificetionExecute(Sender: TObject);
    procedure agDiscountTypeExecute(Sender: TObject);
    procedure aaBrowseOrderHistExecute(Sender: TObject);
    procedure agMaterialTypeExecute(Sender: TObject);
    procedure agWorkRestDayExecute(Sender: TObject);
    procedure aaQualityControlExecute(Sender: TObject);
    procedure agSurveyExecute(Sender: TObject);
    procedure agStatusTypeQCExecute(Sender: TObject);
  private
    FActiveActions : integer; //для работы команд из трея
    FMinimized : boolean;

    FClientInstance : TFarProc;
    FPrevClientProc : TFarProc;

    FClosing : boolean;

    FBackup : boolean;

    CargoCount : integer;

    //для резервного копирования и восстановления
    FExistsMysqlUtil : boolean;
    FExistsMysqldumpUtil : boolean;
    FStoreOptions: boolean;

    FPluginList : TPluginList;

    //чтение уведомлений
    FLastReadNotification : TDateTime;
    FNewReadNotification : TDateTime;

    procedure ClientWndProc(var Message: TMessage);

    procedure SetStoreOptions(const Value: boolean);

    procedure TranslateInterface;

    //для поиска плагинов
    procedure OnPluginFound(Sender : TObject);

    procedure LoadPlugins;{ чтение плугинов }

    procedure UnLoadPlugins;{ выгрузка плугинов }

    //запуск действия из плагина
    procedure PluginActionExecute(Sender: TObject);

    //загрузка плагина
    procedure LoadPlugin(AFileName : string);

    //получение информации о плагине
    procedure PluginInfoExecute(Sender: TObject);

    //выполнение команды плагина
    procedure RunPlugin(APlugin, ACommand, AParams, ALog : string);

    //очистка меню от плагинов
    procedure ClearPluginBar;

    //закрытие плагинов
    procedure ClosePlugins;

    //обновление Enabled
    procedure UpdatePluginState;

    //открытие Connection в плагинах
    procedure OpenPluginConnections;

    //закрытие Connection в плагинах
    procedure ClosePluginConnections;
  protected
    //--------------------------------------------------------------------------
    //реализация основного интерфейса
    //--------------------------------------------------------------------------
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
    //--------------------------------------------------------------------------
  public
    { Public declarations }
    function RunUpdate(MustUpdate : boolean; UpdateURL : string) : boolean;//обновление

    procedure UpdateStatus;//обновление строки статуса

    procedure SetPermission;
    procedure PrepareActions;//подготовка разрешенности
    procedure VisibleActions;//подготовка видимости

    procedure CloseDatas;{ закрытие данных }
    procedure OpenDatas;{ открытие данных }
    procedure UpdateData;{ обновление данных }
    procedure SimpleUpdateData;{ простое обновление }
    procedure UpdateDatabase;{ установка нового места расположения базы данных }

    procedure CorrectFloat(Sender : TComboBox);//корректировка вещественного числа
    function CorrectSQLFloat(AFloat : string) : string;//корректировка симола точки
    procedure UpdateWinList(AObject : TObject);

    procedure UpdateColorScheme;
    procedure UpdateNavBar;
    procedure RepaintAllWindow;
    procedure RepaintOneWindow(AForm : TForm);

    property StoreOptions : boolean read FStoreOptions write SetStoreOptions;

    procedure UpdateExportDirs;

    //чтение новых уведомлений
    procedure ReadNotification;
    //скрытие прочитанных другими уведомлений
    procedure HideNotification;

    //заполнение списка картинок для уведомлений
    procedure UpdateNotificationImages;
  end;

var
  MainForm: TMainForm = nil;

  AppLoading : boolean = True;

  MustCloseApp : boolean = False;

implementation

{$R *.DFM}

uses
  variants, types, IniFiles, HtmlHelpViewer, clipbrd,
  DateUtils, SHFolder, math, ShellAPI,

  //JVCL и JCL
  JvVersionInfo, jclSecurity, jvStrings, JvJCLUtils, jclFileUtils,

  //
  StrUtils,

  //Devexpress
  dxNavBarViewsFact, cxGridCommon, dxUxTheme, dxThemeConsts, dxOffice11,
  dxThemeManager, dxGDIPlusClasses, dxAlertWindow,

  //Fastreport
  frxPopupForm, frxDesgn,

  //Администратор
  DTKUtils, Mesdlg, Mesdlgrich, UDatas,

  UBackup, URestore, URestoreCloud, UServerFile,
  USelectReportForm, UMonthRangeParams, UReportSnap, UShowText,

  UShowPicture, UUtil, UAbout, USplash, USetup, UConsts,
  UProgress, UWaiting, UOptions, UQuery,
  USupport, UEditString, UEditInteger,
  UNoticeOptionsTime, UNoticeOptionsAction, UBrowseNotification,
  USelectWorker,

  //справочники
  UGUserRole, UGUser, UGReportForm,
  UGDistrict, UGMetro, UGSourceType, UGSignalType, UGWorkClass, UGWorkType,
  UGOrderTag, UGWorkerClass, UGPaymentForm, UGStatusType,
  UGWorkerCompany, UGWorker, UGClient, UGReason, UGFaq, UGSearchHint,
  UGAddressLimit, UGDiscountType, UGMaterialType, UGWorkRestDay,
  UGStatusTypeQC, UGSurvey,

  //рабочие инструменты
  UOrderList, UClientRequest, UWorkTypeSynonym, UWorkerLead, UBrowseOrderArch,
  UNoticeTemplate, UNoticeTemplateSnap, UBrowseOrderHistory,
  UQualityControl;

const
  NavBarStyleNames : array [TcxLookAndFeelKind] of string = ('BaseView', 'FlatView', 'UltraFlatExplorerBarView', 'Office11TaskPaneView');

type
  TdxTabbedMDIPageHook = class(TdxTabbedMDIPage)
  published
    property ImageIndex;
    property Tab;
  end;
  TcxTabHook = class(TcxTab)
  published
    property Tabs;
  end;

{  TMainForm  }

procedure TMainForm.FormCreate(Sender: TObject);
  var
    s : string;
begin
  FPluginList := TPluginList.Create(TPluginItem);

  Caption := AppVerInfo.ProductName;

  StoreOptions := true;
  FActiveActions := 0;
  FMinimized := false;
  FClientInstance := MakeObjectInstance(ClientWndProc);
  FPrevClientProc := Pointer(GetWindowLong(ClientHandle,
                              GWL_WNDPROC));
  SetWindowLong(ClientHandle,
                GWL_WNDPROC,
                LongInt(FClientInstance));

  FClosing := false;
  FBackup := false;

  ChangeWaiting('Загрузка приложения ...');

  CreateDirs;{ создание каталогов }

  UpdateColorScheme;
  TranslateInterface;

  UpdateNavBar;

  UpdateExportDirs;//обновление папок для экспорта

  //процедура обновления списка окон
  WinList.OnChange := UpdateWinList;

  FExistsMysqlUtil := FileExists(cMySQLUtilPath);
  FExistsMySQLDumpUtil := FileExists(cMySQLDumpUtilPath);

  cbInterface.ItemIndex := cbInterface.Items.IndexOf(InterfaceType);

  BarManager.LoadFromIniFile(cIniFileNameMainForm);
  BarManager.Bars[0].Reset;//главное меню
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if StoreOptions then
    PropertiesStore.StoreTo(false);

  SaveOptions;

  ClearPluginBar;

  ClosePlugins;

  FPluginList.Free;
  FPluginList := nil;
end;

procedure TMainForm.afExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormShow(Sender: TObject);
  var
    pl, com, par, log : string;
begin
  OnShow := nil;

  Datas.frxDesigner.OpenDir := cDotDir;
  Datas.frxDesigner.SaveDir := cDotDir;

  PropertiesStore.StorageName := cIniFileNameMainForm;
  PropertiesStore.RestoreFrom;

  DockingManager.LoadLayoutFromIniFile(cMainDockIniFileName);

  //на всякий пожарный читаем раньше
  DefLog := Trim(ParamValue('log'));

  UpdateDataBase;

  LoadPlugins;

  PrepareActions;

  HideSplash;{ прячем сплэш }

  AppLoading := false;

  if MustCloseApp then
  begin
    afExit.Execute;

    exit;
  end
  else
  begin
    //если был вызов плагина
    if (Trim(ParamValue('plugin')) <> '') and (Trim(ParamValue('command')) <> '') then
    begin
      par := Trim(ParamValue('params'));
      pl := Trim(ParamValue('plugin'));
      com := Trim(ParamValue('command'));
      log := Trim(ParamValue('log'));

      RunPlugin(pl, com, par, log);

      //обработка автоматического выхода
      if (Trim(ParamValue('exit')) = '1') or (AnsiLowerCase(Trim(ParamValue('exit'))) = 'yes') or (AnsiLowerCase(Trim(ParamValue('exit'))) = 'true') then
        afExit.Execute;

      exit;
    end;
  end;

//  TrayIcon.Hint := Application.Title;
end;

function TMainForm.GetConnectionString: string;
begin
  Result := Datas.ConnectionString;
end;

function TMainForm.GetCurrentWorkMonth: string;
begin
  Result := WorkMonth;
end;

function TMainForm.GetUserAdmin: boolean;
begin
  Result := (UserID = 1) or (UserID = 0);
end;

function TMainForm.GetUserID: integer;
begin
  Result := UserID;
end;

function TMainForm.GetUserName: string;
begin
  Result := UserName;
end;

procedure TMainForm.HideNotification;
  var
    i : integer;
    vWin : TdxAlertWindow;
    vIDN, vIDU : integer;
begin
  for i := 0 to Datas.AlertWindowManager.Count - 1 do
  begin
    vWin := Datas.AlertWindowManager.Items[i];
    vIDN := vWin.Tag;
    if vIDN <> 0 then
    begin
      vIDU := IfNull(Datas.ReadValues('notification', 'ID_UserOpen', vIDN)[0], 0);
      if (vIDU <> 0) and (vIDU <> UserID) then
      begin
        //закрываем, если не было открыто из архива
        if vWIn.HelpKeyword <> 'fixed' then
          vWin.DeleteCurrentMessage;
      end;
    end;
  end;
end;

function TMainForm.GetExportDir: string;
begin
  Result := cABSExportDir;
end;

function TMainForm.GetImportDir: string;
begin
  Result := cABSImportDir;
end;

function TMainForm.GetIniFileName: string;
begin

end;

function TMainForm.GetServerTime: TDateTime;
begin
  Result := Udatas.ServerTime;
end;

procedure TMainForm.LoadPlugin(AFileName: string);
  var
    i, c, b : integer;
    vBarSubitem : TdxBarSubitem;
    vBarButton : TdxBarButton;
    vAction : TAction;
    DllHandle: THandle;
    InitPlugin : function (AAppHandle : HWND) : IPluginInterface; StdCall;
    Plugin : IPluginInterface;
    vBitmap, vBitmapBig : TBitmap;
    vPluginItem : TPluginItem;
    vCommandItem : TCommandItem;
    vColor : TColor;
    vBeginGroup : boolean;
begin
  //добавляем иконки
  vBitmap := TBitmap.Create;
  vBitmap.Height := UtilForm.ImageList.Height;
  vBitmap.Width := UtilForm.ImageList.Width;

  vBitmapBig := TBitmap.Create;
  vBitmapBig.Height := UtilForm.ImageListBig.Height;
  vBitmapBig.Width := UtilForm.ImageListBig.Width;

  DllHandle := LoadLibrary(PChar(AFileName));

  if DllHandle <> 0 then
  begin
    @InitPlugin := GetProcAddress(DllHandle, 'InitPlugin');
    if @InitPlugin <> nil then
    begin
      Plugin := InitPlugin(Application.Handle);
    end;
    if Plugin = nil then
    begin
      ShowMsg('Библитека "' + AFileName + '" не является плагином!', smtWarning, [smbOk], smbOK, smbOK);
      FreeLibrary(DllHandle);
    end
    else
    begin
      Plugin.SetMainInterface(Self as IMainINterface);

      c := BarManager.Categories.Add('+ ' + Plugin.GetDescription);

      vPluginItem := FPluginList.Add;
      with vPluginItem do
      begin
        FPluginInterface := Plugin;
        FHandle := DLLHandle;
        FFilename := AFileName;
      end;

      //добавляем подменю
      vBarSubitem := TdxBarSubitem.Create(MainForm);
      vBarSubitem.Caption := Plugin.GetDescription;
      vBarSubitem.Category := BarManager.Categories.IndexOf('Расширения');
      vBarSubitem.Data := vPluginItem;

      mPlugins.ItemLinks.Add.Item := vBarSubitem;

      vBeginGroup := false;

      for i := 0 to Plugin.CommandCount - 1 do
      begin
        if Plugin.GetCommandCaption(i) = '-' then
        begin
          vBeginGroup := true;
        end
        else
        begin

          vBitmap.Handle := Plugin.GetCommandBitmap(i);

          vColor := vBitmap.TransparentColor;
          b := UtilForm.ImageList.AddBitmap(vBitmap, nil, vColor, false, false);
          UtilForm.ImageList.GetBitmap(b, vBitmap);

          vBitmapBig.Handle := Plugin.GetCommandBitmapBig(i);
          vColor := vBitmapBig.TransparentColor;
          b := UtilForm.ImageListBig.AddBitmap(vBitmapBig, nil, vColor, false, false);
          UtilForm.ImageListBig.GetBitmap(b, vBitmap);

          vAction := TAction.Create(ActionList);
          vAction.ActionList := ActionList;
          vAction.GroupIndex := Integer(pointer(Plugin));
          try
            vAction.Tag := Plugin.GetCommandPermit(i);
          except
            vAction.Tag := 10;
          end;
          vAction.DesignInfo := i;
          vAction.OnExecute := PluginActionExecute;
          vAction.Caption := Plugin.GetCommandCaption(i);
          vAction.Hint := Plugin.GetCommandCaption(i);
          vAction.ImageIndex := UtilForm.ImageList.Count - 1;

          //запоминаем TAction
          vCommandItem := vPluginItem.CommandList.Add;
          vCommandItem.Action := vAction;

          vBarButton := TdxBarButton.Create(MainForm);
          vBarButton.Action := vAction;
          vBarButton.Category := c;
//          vBarButton.Data := pointer(vPluginItem);

          with vBarSubitem.ItemLinks.Add do
          begin
            BeginGroup := vBeginGroup;
            Item := vBarButton;
            vBeginGroup := false;
          end;
        end;
      end;

      //добавляем прочерк и ссылку на информацию о плагине

//      vSeparator := TdxBarSeparator.Create(MainForm);
//      vBarSubitem.ItemLinks.Add.Item := TdxBarSeparator.Create(MainForm);

      vBarButton := TdxBarButton.Create(MainForm);
      vBarButton.Caption := 'Информация о расширении...';
      vBarButton.Category := c;
      vBarButton.Data := pointer(vPluginItem);
      vBarButton.OnClick := PluginInfoExecute;

      with vBarSubitem.ItemLinks.Add do
      begin
        BeginGroup := true;
        Item := vBarButton;
      end;
    end;
  end
  else
  begin
    ShowMsg('Библитека "' + AFileName + '" не загружена!', smtWarning, [smbOk], smbOK, smbOK);
  end;

  vBitmap.Free;
  vBitmapBig.Free;
end;

procedure TMainForm.LoadPlugins;
begin
  if Trim(cABSPluginDir) <> '' then
    if DirectoryExists(Trim(cABSPluginDir)) then
    begin
      with TFileScanner.Create(nil) do
        try
          OnFileFound := OnPluginFound;
          FileMask := '*.dll';
          InitialDirectory := cABSPluginDir;
          ScanTree;
        finally
          Free;
        end;
    end;

  if mPlugins.ItemLinks.Count = 0 then
    mPlugins.Visible := TDxBarItemVisible.ivNever
  else
    mPlugins.Visible := TDxBarItemVisible.ivAlways
end;

procedure TMainForm.ahAboutExecute(Sender: TObject);
begin
  ShowAbout;
end;

procedure TMainForm.ahHomePageExecute(Sender: TObject);
begin
  ShellExecute(0,'open',PChar('https://portalpro.ru'),'','',SW_SHOW);
end;

procedure TMainForm.afOptionsExecute(Sender: TObject);
  var
    vServer, vDatabase, vPort : string;
begin
  inc(FActiveActions);
  PrepareActions;
  try

    vServer := Server;
    vDatabase := Database;
    vPort := Port;

    if DoSetup then
    begin
      { сохранение параметров в Ini }
      SaveOptions;

      UpdateColorScheme;

      UpdateNavBar;

      if Datas.ZConnection.Connected and ((vServer <> Server) or (vDatabase <> Database) or (vPort <> Port))then
      begin
        if Datas.ZConnection.Connected then CloseDatas;
        OpenDatas{ открытие базы данных };
      end
      else SimpleUpdateData;

      CreateDirs;

      UpdateExportDirs;//обновление папок для экспорта
    end;
  finally
    dec(FActiveActions);
    PrepareActions;
  end;
end;

procedure TMainForm.ahInfoExecute(Sender: TObject);
begin
  Application.HelpSystem.ShowContextHelp(HelpContext, Application.HelpFile);
end;

procedure TMainForm.ahSupportExecute(Sender: TObject);
begin
  ShowSupport;
  PrepareActions;
end;

procedure TMainForm.anTemplateEditorExecute(Sender: TObject);
begin
  ShowNoticeTemplate(anTemplateEditor);
end;

procedure TMainForm.anTemplateSnapExecute(Sender: TObject);
begin
  ShowNoticeTempalteSnap(anTemplateSnap);
end;

procedure TMainForm.UpdateData;
begin

  UpdateStatus;
end;

procedure TMainForm.UpdateDatabase;
begin
  if FBackup then Exit;

  CloseDatas;
  try
    OpenDatas;
  except
    ShowMsg('Не удается открыть таблицы базы данных.'#10#13 +
            'Работа в системе невозможна.'#10#13 +
            'Необходимо определить расположение базы данных.', smtWarning, [smbOK], smbOK, smbOK);
  end;
end;

procedure TMainForm.ClearPluginBar;
  var
    i, j : integer;
    vBarSubitem : TdxBarSubitem;
    vBarButton : TdxBarButton;
    vAction : TAction;
    vPluginItem : TPluginItem;
    vCommandItem : TCommandItem;
    vLink : TdxBarItemLink;
begin
  for i := mPlugins.ItemLinks.Count - 1 downto 0 do
  begin
    vBarSubitem := TdxBarSubitem(mPlugins.ItemLinks[i].Item);

    for j := vBarSubitem.ItemLinks.Count - 1 downto 0 do
    begin
      vBarButton := TdxBarButton(vBarSubitem.ItemLinks[j].Item);

      vBarSubitem.ItemLinks.Delete(j);

      vBarButton.Action.Free;
      vBarButton.Action := nil;

      vBarButton.Free;
    end;

    mPlugins.ItemLinks.Delete(i);
    vBarSubitem.Free;
  end;

{  vPluginItem := FPluginList.Add;
  with vPluginItem do
  begin
    FPluginInterface := Plugin;
    FHandle := DLLHandle;
    FFilename := AFileName;
  end;

  //добавляем подменю
  vBarSubitem := TdxBarSubitem.Create(MainForm);
  vBarSubitem.Caption := Plugin.GetDescription;
  vBarSubitem.Category := BarManager.Categories.IndexOf('Расширения');
  vBarSubitem.Data := vPluginItem;

  BarPlugins.ItemLinks.Add.Item := vBarSubitem;

  for i := 0 to Plugin.CommandCount - 1 do
  begin
    vBitmap.Handle := Plugin.GetCommandBitmap(i);

//        ShowPicture(vBitmap);

    vColor := vBitmap.TransparentColor;

    il16x16.AddMasked(vBitmap, vColor);

    il16x16.GetBitmap(il16x16.Count - 1, vBitmap);

//        ShowPicture(vBitmap);

    vAction := TAction.Create(ActionList);
    vAction.ActionList := ActionList;
    vAction.GroupIndex := Integer(pointer(Plugin));
    try
      vAction.Tag := Plugin.GetCommandPermit(i);
    except
      vAction.Tag := 10;
    end;
    vAction.DesignInfo := i;
    vAction.OnExecute := PluginActionExecute;
    vAction.Caption := Plugin.GetCommandCaption(i);
    vAction.Hint := Plugin.GetCommandCaption(i);
    vAction.ImageIndex := il16x16.Count - 1;

    //запоминаем TAction
    vCommandItem := vPluginItem.CommandList.Add;
    vCommandItem.Action := vAction;

    vBarButton := TdxBarButton.Create(MainForm);
    vBarButton.Action := vAction;
    vBarButton.Category := c;
    vBarButton.Data := pointer(vPluginItem);

    vBarSubitem.ItemLinks.Add.Item := vBarButton;
  end;

  //добавляем прочерк и ссылку на информацию о плагине

//      vSeparator := TdxBarSeparator.Create(MainForm);
//      vBarSubitem.ItemLinks.Add.Item := TdxBarSeparator.Create(MainForm);

  vBarButton := TdxBarButton.Create(MainForm);
  vBarButton.Caption := 'Информация о расширении...';
  vBarButton.Category := c;
  vBarButton.Data := pointer(vPluginItem);
  vBarButton.OnClick := PluginInfoExecute;

  vLink := vBarSubitem.ItemLinks.Add;
  vLink.Item := vBarButton;
  vLink.BeginGroup := true;}
end;

procedure TMainForm.ClientWndProc(var Message: TMessage);
  var
    Dc : hDC;
    ATheme: TdxTheme;
    R: TRect;
    vDrawDefault: boolean;
begin
  with Message do
  begin
    vDrawDefault := True;
    case Msg of
      WM_ERASEBKGND:
      if not SkinController.UseSkins then
      begin
        R := ClientRect;
        DC := TWMEraseBkGnd(Message).Dc;
        if SkinController.NativeStyle then
        begin
          ATheme := OpenTheme(totTab);
          if ATheme<>0  then
          begin
            DrawThemeBackground(ATheme, TWMEraseBkGnd(Message).Dc, dxThemeConsts.TABP_TOPTABITEM, 0, @R);
            vDrawDefault := False;
          end;
        end else
          case SkinController.Kind of
            lfOffice11:
            begin
              FillGradientRect(Dc, R, dxOffice11ToolbarsColor1, dxOffice11ToolbarsColor2, False);
              vDrawDefault := False;
            end
          else
          end;
      end;
    end;
    if vDrawDefault then
          Result := CallWindowProc(FPrevClientProc,
                                   ClientHandle,
                                   Msg,
                                   wParam,
                                   lParam);
  end;
end;

procedure TMainForm.CloseDatas;
begin
  //останавливаем таймер проверки уведомлений
  NotificationTimer.OnTimer := nil;
  NotificationTimer.Enabled := false;

  WinList.CloseAll;
  Datas.CloseDatabase;
  UpdateStatus;

//  GetAllTextPermissions(UserPermTool);
  UserPermTool.Clear;
end;

procedure TMainForm.ClosePluginConnections;
  var
    i : integer;
    vPlugin : TPluginItem;
begin
  for i := 0 to FPluginList.Count - 1 do
  begin
    vPlugin := FPluginList[i];

    vPlugin.PluginInterface.CloseConnection;
  end;
end;

procedure TMainForm.ClosePlugins;
  var
    i : integer;
    FinishProc : procedure (); stdcall;
    vHandle : THandle;
begin
  for i := FPluginList.Count - 1 downto 0 do
  begin
    vHandle := FPluginList[i].Handle;

    @FinishProc := GetProcAddress(vHandle, 'FinishPlugin');

    if @FinishProc <> nil then
    begin
      FinishProc;
    end;

{    if FreeLibrary(vHandle) then
    begin
      FPluginList[i].Handle := 0;
      FPluginList[i].FileName := '';
    end;}

    FPluginList[i].PluginInterface := nil;

//    FreeLibrary(vHandle);

    FPluginList[i].Handle := 0;
    FPluginList[i].FileName := '';

    FPluginList[i].Destroy;
  end;

  FPluginList.Clear;
end;

procedure TMainForm.OnPluginFound(Sender: TObject);
begin
  BarManager.BeginUpdate;

  try
    LoadPlugin(TFileScanner(Sender).FileFound);
  finally
    BarManager.EndUpdate;
  end;
end;

procedure TMainForm.OpenDatas;
  var
    v : variant;
begin
  Datas.OpenDatabase;
  if Datas.ZConnection.Connected then
  begin

{$IFDEF FULLVERSION}
{$ELSE}
    //текст RTF берется из главного окна
{      ShowMsg('ВНИМАНИЕ!'#13#10 +
            'Вы используете ДЕМОНСТРАЦИОННУЮ ВЕРСИЮ системы, поэтому при работе'#13#10 +
            'вместо некоторых инструментов появляется соответствующий раздел справки.'#13#10 +
            'Данные инструменты включены в полный пакет, который поставляется после покупки.'#13#10 +
            'Адрес электронной почты: mail@ciritas.ru, адрес сайта: www.ciritas.ru');}

    ADefWidth := 800;
    ADefHeight := 600;

    ShowMsgRichFile('Информация', DemoInfo.SaveToTempFile, [smbrOK], smbrOK, smbrOK, URLClick);
{$ENDIF}

    if
      (ExtractFileName(ParentProcName) <> 'bds.exe') and ExistsUpdate and
      (ShowMsg('Появилась новая версия приложения, выполнить обновление программного обеспечения?', smtInformation, [smbYes, smbNo], smbYes, smbYes) = mrYes) then
    begin
      MustCloseApp := false;
      try
        if RunUpdate(true, UpdateURL) then
        begin
          MustCloseApp := true;
        end;
      except
        on E: Exception do ShowMsg('Во время обновления произошла ошибка:' + #13#10 + E.Message, smtError, [smbOK], smbOK, smbOK);
      end;
    end
    else
    begin
      //запускаем таймер проверки уведомлений
      FLastReadNotification := LastEnterTime;
      FNewReadNotification := IncSecond(LastEnterTime, -1);
      UpdateNotificationImages;
      NotificationTimer.OnTimer := NotificationTimerTimer;
      NotificationTimer.Enabled := true;

      UpdateData;
      UpdateStatus;
    end;
  end
  else
    if (AutoriseError = 100) and (UpdateURL <> '') then
    begin
      if ShowMsg('Необходимо выполнить обновление программного обеспечения.',
              smtInformation, [smbOK, smbCancel], smbOK, smbOK) = mrOK then
      begin
        MustCloseApp := false;
        try
          if RunUpdate(true, UpdateURL) then
          begin
            MustCloseApp := true;
          end;
        except
          on E: Exception do ShowMsg('Во время обязательного обновления произошла ошибка:' + #13#10 + E.Message, smtError, [smbOK], smbOK, smbOK);
        end;
      end;
    end;

  UpdateStatus;
end;

procedure TMainForm.OpenPluginConnections;
  var
    i : integer;
    vPlugin : TPluginItem;
begin
  for i := 0 to FPluginList.Count - 1 do
  begin
    vPlugin := FPluginList[i];

    vPlugin.PluginInterface.SetConnectionString(Datas.ConnectionString);
    vPlugin.PluginInterface.OpenConnection;
  end;
end;

procedure TMainForm.PluginActionExecute(Sender: TObject);
  var
    Plugin : IPluginInterface;
    Command : integer;
begin
  Plugin := IPluginInterface(TAction(Sender).GroupIndex);
  Command := TAction(Sender).DesignInfo;

  try
    Plugin.Execute(Command);
  except
    on e : Exception do
      ShowMsg('Выполнение завершилось ошибкой:' + #13#10 +
              E.Message, smtError, [smbOK], smbOK, smbOK);
  end;
end;

procedure TMainForm.PluginInfoExecute(Sender: TObject);
  var
    vPlugin : TPluginItem;
    v, s : string;
begin
  vPlugin := TPluginitem(TdxBarButton(Sender).Data);
  with TJvVersionInfo.Create(vPlugin.FileName) do
  begin
    v := FileVersion;
    Free;
  end;
  s := '';
  s := s + 'Имя файла: ' + vPlugin.FileName + #13#10;
  s := s + 'Название расширения: ' + vPlugin.PluginInterface.GetDescription + #13#10;
  s := s + 'Версия расширения: ' + v + #13#10;
  s := s + 'Количество команд: ' + IntToStr(vPlugin.CommandList.Count) + #13#10;
  ShowMsg(s);
end;

procedure TMainForm.PrepareActions;
  var
    vOpen : boolean;
    vID : integer;
  procedure PrepareMenu(AMenu : TDxBarSubItem);
  begin
    if AMenu.ItemLinks.VisibleItemCount = 0 then AMenu.Visible := TDxBarItemVisible.ivNever
    else AMenu.Visible := TDxBarItemVisible.ivAlways;
  end;
begin
  BarManager.BeginUpdate;
  try

    if FClosing then Exit;

    vOpen := Datas.ZConnection.Connected;

    //файл
    afConnect.Enabled :=
      not vOpen and (FActiveActions = 0);
    afDisconnect.Enabled := vOpen and (FActiveActions = 0);
    aaChangePassword.Enabled := vOpen;
    afOptions.Enabled := FActiveActions = 0;
    afExit.Enabled := FActiveActions = 0;

    //действия
    aaOrderList.Enabled := vOpen;
    aaWorkerLead.Enabled := vOpen;
    aaBrowseOrderArch.Enabled := vOpen;
    aaBrowseOrderHist.Enabled := vOpen;
    aaQualityControl.Enabled := vOpen;

    //администрирование
    aaSQLQuery.Enabled := vOpen and GetUserAdmin;
    aaBackup.Enabled := vOpen and GetUserAdmin;
    aaRestore.Enabled := vOpen and GetUserAdmin;
    aaNoticeOptionsAction.Enabled := vOpen and GetUserAdmin;
    aaNoticeOptionsTime.Enabled := vOpen and GetUserAdmin;

    //увдеомления
    anTemplateSnap.Enabled := vOpen;
    anTemplateEditor.Enabled := vOpen;
    aaBrowseNotificetion.Enabled := vOpen;

    //отчетность
    arReportForm.Enabled := vOpen;
    arReportSnap.Enabled := vOpen;
    arCreateReport.Enabled := vOpen and (FActiveActions = 0);

    //справочники
    agEnterprise.Enabled := vOpen;
    agUser.Enabled := vOpen;
    agUserROle.Enabled := vOpen;

    agDistrict.Enabled := vOpen;
    agMetro.Enabled := vOpen;
    agSourceType.Enabled := vOpen;
    agSignalType.Enabled := vOpen;
    agWorkClass.Enabled := vOpen;
    agWorkType.Enabled := vOpen;
    agMaterialType.Enabled := vOpen;
    agOrderTag.Enabled := vOpen;
    agWorkerClass.Enabled := vOpen;
    agPaymentForm.Enabled := vOpen;
    agStatusType.Enabled := vOpen;
    agWorkerCompany.Enabled := vOpen;
    agWorker.Enabled := vOpen;
    agClient.Enabled := vOpen;
    agReason.Enabled := vOpen;
    agFaq.Enabled := vOpen;
    agSearchHint.Enabled := vOpen;
    agAddressLimit.Enabled := vOpen;
    agWorkRestDay.Enabled := vOpen;
    aaClientRequest.Enabled := vOpen;
    aaWorkTypeSynonym.Enabled := vOpen;
    agSurvey.Enabled := vOpen;
    agStatusTypeQC.Enabled := vOpen;

    //расширения
    UpdatePluginState;

    VisibleActions;

    SetPermission;
  finally
    BarManager.EndUpdate;
  end;

  PrepareMenu(dxFile);
  PrepareMenu(dxActions);
  PrepareMenu(dxReport);
  PrepareMenu(dxGuide);
  PrepareMenu(dxAdmin);
  PrepareMenu(dxNotification);
  PrepareMenu(dxHelp);
end;

procedure TMainForm.SetPermission;
  var
    i : integer;
    cp, s, p : string;
    vAction : TAction;
    vAll : TStringList;
  function ActionByCaption(ACaption : string) : TAction;
    var
      i : integer;
  begin
    Result := nil;
    with ActionList do
      for i := 0 to ActionCount - 1 do
        if TAction(Actions[i]).Caption = ACaption then
        begin
          Result := TAction(Actions[i]);
          Exit;
        end;
  end;
  function GetClerkPermission(APName : string) : string;
    var
      i : integer;
      s : string;
  begin
    Result := '';
    for i := 0 to UserPermTool.Count - 1 do
    begin
      s := UserPermTool[i];
      if Length(s) = (Length(APName) + 3) then
        if LeftStr(s, Length(s) - 3) = APName then
        begin
          Result := s;
          Exit;
        end;
    end;
  end;
begin
  if UserID = 1 then Exit;
  vAll := TStringList.Create;
  GetAllTextPermissions(vAll);
  for i := 0 to vAll.Count - 1 do
  begin
    s := vAll[i];
    s := LeftStr(s, Length(s) - 3);
    cp := GetClerkPermission(s);
    if cp <> '' then p := RightStr(cp, 2)
    else p := '00';
    vAction := ActionByCaption(s);
    if vAction <> nil then
    begin
      vAction.Enabled := vAction.Enabled and (p[1] = '1');
      vAction.Visible := vAction.Visible and (p[1] = '1');
    end;
  end;
  vAll.Free;
end;

procedure TMainForm.SetStoreOptions(const Value: boolean);
begin
  FStoreOptions := Value;
end;

procedure TMainForm.ShowText(AText, ACaption: string);
begin
  UShowText.ShowText(nil, AText, ACaption);
end;

procedure TMainForm.SimpleUpdateData;
  var
    vID : integer;
begin
  if FBackup then Exit;

  ShowWaiting(cDataGetting);
  try

  finally
    HideWaiting;
  end;
  UpdateStatus;
end;

procedure TMainForm.SkinControllerSkinForm(Sender: TObject; AForm: TCustomForm;
  var ASkinName: string; var UseSkin: Boolean);
  var
    i : integer;
    vComponent : TComponent;
begin
  if AForm.Name = 'frxDialogForm' then
  begin
    UseSkin := SkinController.UseSkins;

    AForm.Color := RootLookAndFeel.Painter.DefaultContentColor;

    for i := 0 to AForm.ControlCount - 1 do
    begin
      vComponent := AForm.Controls[i];
      if vComponent is TGroupBox then (vComponent as TGroupBox).ParentBackground := true //(vComponent as TGroupBox).Color := RootLookAndFeel.Painter.DefaultContentColor
      else
        if vComponent is TCheckBox then (vComponent as TCheckBox).ParentColor := true// Color := RootLookAndFeel.Painter.DefaultContentColor
        else
          if vComponent is TRadioButton then (vComponent as TRadioButton).ParentColor := true //Color := RootLookAndFeel.Painter.DefaultContentColor
          else
            if vComponent is TLabel then (vComponent as TLabel).Transparent := true;//RootLookAndFeel.Painter.DefaultContentColor

      AForm.Color := RootLookAndFeel.Painter.DefaultContentColor;

    end;
  end
  else
    if Assigned(AForm) and (Pos('frx', AForm.Name) <> 0) then UseSkin := false
    else
      if AForm is TfrxPopupForm then UseSkin := false
      else
        if AForm.ClassName = 'TdxAlertWindow' then
          UseSkin := false
        else
        begin
          for i := 0 to AForm.ComponentCount - 1 do
          begin
            vComponent := AForm.Components[i];
            if vComponent is TDBGridEh then SetDBGridEhSkin(vComponent as TDBGridEh);
          end;
        end;
end;

procedure TMainForm.TabbedMDIManagerPageAdded(Sender: TdxTabbedMDIManager;
  APage: TdxTabbedMDIPage);
  var
    i : integer;
begin
{  TcxTabControlProperties(TabbedMDIManager.TabProperties).Images.Clear;
  for i := 0 to TcxTabHook(TdxTabbedMDIPageHook(Apage).Tab).Tabs.Count - 1 do
  begin

  end;}

  //(TcxTabControlProperties(TabbedMDIManager.TabProperties).Images)

//  APage
//  TcxTabHook(TdxTabbedMDIPageHook(Apage).Tab).Tabs.  ImageIndex := -1;

//TcxTabControlProperties(
//  ShowMessage(IntToStr(TdxTabbedMDIPageHook(Apage).ImageIndex));
end;

procedure TMainForm.TranslateInterface  ;
  var
    s : string;
begin
  s := TempDir + 'Rus.ini';
  RusLang.SaveToFile(s);
  Localizer.FileName := s;
  Localizer.Active := True;
  Localizer.LanguageIndex := 1049;
  DeleteFile(s);
end;

procedure TMainForm.TrayIconDblClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FActiveActions = 0 then
  begin
    Application.Restore;
    if WindowState = wsMinimized then ShowWindow(Application.Handle, SW_MAXIMIZE);// WindowState := wsNormal;
    SetForegroundWindow(Application.Handle);

    PrepareActions;
  end;
end;

procedure TMainForm.UpdateStatus;
  var
    s : string;
begin
  if not FClosing then
    if Datas.ZConnection.Connected then
    begin
      StatusBar.Panels[0].Text := GetWorkMonth(Date);//WorkMonth;
      StatusBar.Panels[1].Text := UserName;
      StatusBar.Panels[2].Text := Server + ':' + Port + ', ' + Database;
    end
    else
    begin
      StatusBar.Panels[0].Text := '';
      StatusBar.Panels[1].Text := '';
      StatusBar.Panels[2].Text := '';
    end;

  StatusBar.Panels[3].Text := 'v' + AppVerInfo.FileVersion;;

  s := ExtractFileName(ParentProcName);

  if s <> 'noname' then
    StatusBar.Panels[4].Text := s;
end;

procedure TMainForm.UpdateWinList(AObject: TObject);
  var
    i : integer;
    s : string;
    vGroups : TStringList;
    vItem : TdxNavBarItem;
    vGroup : TdxNavBarGroup;
  function GetGroupImageIndex(ACaption : string) : integer;
    var
      i : integer;
  begin
    Result := -1;
    for i := low(cCategories) to  High(cCategories) do
    begin
      if cCategories[i].Name = ACaption then
      begin
        Result := cCategories[i].ImageIndex;
        Exit;
      end;
    end;
  end;
begin
  NavBar.BeginUpdate;
//  NavBar.Groups.Clear;
//  NavBar.Items.Clear;
  vGroups := TStringList.Create;
  for i := 0 to WinList.Count - 1 do
  begin
    if vGroups.IndexOf(WinList[i].Category) = -1 then
      vGroups.Add(WinList[i].Category);
  end;
  vGroups.Sort;

  //удаляем ненужные группы из навбара
  i := NavBar.Groups.Count - 1;
  while (i >= 0) do
  begin
    s := NavBar.Groups.Items[i].Caption;
    if not WinList.GroupExists(s) then
      NavBar.Groups.Delete(i);
    i := i - 1;
  end;

  //добавляем несуществующие группы
  for i := 0 to vGroups.Count - 1 do
  begin
    if not Assigned(NavBar.Groups.ItemByCaption(vGroups[i])) then
      with NavBar.Groups.Add do
      begin
        Caption := vGroups[i];
        SmallImageIndex := GetGroupImageIndex(Caption);
      end;
  end;

  //удаляем из навбара ненужные кнопки
  i := NavBar.Items.Count - 1;
  while i >= 0 do
  begin
    if not Assigned(WinList.FindByForm(pointer(NavBar.Items[i].Tag))) then
      NavBar.Items.Delete(i);
    i := i - 1;
  end;

  for i := 0 to WinList.Count - 1 do
    if not Assigned(NavBar.Items.ItemByCaption(WinList[i].Caption)) then
    begin
      vItem := NavBar.Items.Add;
      with vItem do
      begin
        Caption := WinList[i].Caption;
        Hint := WinList[i].Caption;
        SmallImageIndex := WinList[i].ImageIndex;
        Tag := integer(WinList[i].Form);
      end;
      vGroup := TdxNavBarGroup(NavBar.Groups.ItemByCaption(WinList[i].Category));
      if Assigned(vGroup) then
        vGroup.CreateLink(vItem);
    end;

  for i := 0 to NavBar.Items.Count - 1 do
    with NavBar.Items[i] do
    if TForm(pointer(Tag)) = WinList.ActiveForm then
    begin
      Style := SelectedStyle;
      StyleHotTracked := HotSelectedStyle;
      //раскрываем группу
      s := WinList.FindByForm(TForm(pointer(Tag))).Category;
      TdxNavBarGroup(NavBar.Groups.ItemByCaption(s)).Expanded := true;
    end
    else
    begin
      Style := nil;
      StyleHotTracked := nil;
    end;

  vGroups.Free;
  NavBar.EndUpdate;
end;

procedure TMainForm.VisibleActions;
  var
    vIsExpert: boolean;
begin
  vIsExpert := cbInterface.Text = cIExpert;

  BarManager.BeginUpdate;

  //файл
  afConnect.Visible := true;
  afDisconnect.Visible := true;
  aaChangePassword.Visible := true;
  afOptions.Visible := true;
  afExit.Visible := true;

  //действия
  aaOrderList.Visible := vIsExpert;
  aaWorkerLead.Visible := vIsExpert;
  aaBrowseOrderArch.Visible := vIsExpert;
  aaBrowseOrderHist.Visible := vIsExpert;
  aaQualityControl.Visible := vIsExpert;

  //администрирование
  aaSQLQuery.Visible := vIsExpert;
  aaBackup.Visible := vIsExpert;
  aaRestore.Visible := vIsExpert;
  aaNoticeOptionsAction.Visible := vIsExpert;
  aaNoticeOptionsTime.Visible := vIsExpert;

  //уведомления
  anTemplateSnap.Visible := vIsExpert;
  anTemplateEditor.Visible := vIsExpert;
  aaBrowseNotificetion.Visible := vIsExpert;

  //отчетность
  arReportSnap.Visible := vIsExpert;
  arReportForm.Visible := vIsExpert;
  arCreateReport.Visible := true;

  //справочники
  agEnterprise.Visible := vIsExpert;
  agUser.Visible := vIsExpert;
  agUserROle.Visible := vIsExpert;
  agDistrict.Visible := vIsExpert;
  agMetro.Visible := vIsExpert;
  agSourceType.Visible := vIsExpert;
  agSignalType.Visible := vIsExpert;
  agWorkClass.Visible := vIsExpert;
  agWorkType.Visible := vIsExpert;
  agOrderTag.Visible := vIsExpert;
  agWorkerClass.Visible := vIsExpert;
  agPaymentForm.Visible := vIsExpert;
  agStatusType.Visible := vIsExpert;
  agWorkerCompany.Visible := vIsExpert;
  agWorker.Visible := vIsExpert;
  agClient.Visible := vIsExpert;
  agReason.Visible := vIsExpert;
  agFaq.Visible := vIsExpert;
  agSearchHint.Visible := vIsExpert;
  agAddressLimit.Visible := vIsExpert;
  agMaterialType.Visible := vIsExpert;
  agWorkRestDay.Visible := vIsExpert;
  aaClientRequest.Visible := vIsExpert;
  aaWorkTypeSynonym.Visible := vIsExpert;
  agSurvey.Visible := vIsExpert;
  agStatusTypeQC.Visible := vIsExpert;

  //окна
  awHor.Visible := not OneWindow;
  awVer.Visible := not OneWindow;
  awCascade.Visible := not OneWindow;

  //меню
{  if dxFile.ItemLinks.VisibleItemCount > 0 then dxFile.Visible := ivAlways
  else dxFile.Visible := ivNever;

  if dxActions.ItemLinks.VisibleItemCount > 0 then dxActions.Visible := ivAlways
  else dxActions.Visible := ivNever;

  if dxReport.ItemLinks.VisibleItemCount > 0 then dxReport.Visible := ivAlways
  else dxReport.Visible := ivNever;

  if dxWindow.ItemLinks.VisibleItemCount > 0 then dxWindow.Visible := ivAlways
  else dxGuide.Visible := ivNever;

  if dxGuide.ItemLinks.VisibleItemCount > 0 then dxGuide.Visible := ivAlways
  else dxGuide.Visible := ivNever;

  if dxHelp.ItemLinks.VisibleItemCount > 0 then dxHelp.Visible := ivAlways
  else dxHelp.Visible := ivNever;}

  //прячем
//  TabbedMDIManager.Active := OneWindow;
  TabbedMDIManager.Active := true;

  if OneWindow then
  begin

{    dxWindow.Visible := ivInCustomizing;
    WindowsPanel.Visible := false;
    LeftDockSite.Visible := false;

    with BarManager.Bars.Items[BarManager.Bars.Count - 1] do
    begin
      Visible := false;
      AllowClose := false;
      AllowCustomizing := false;
      AllowQuickCustomizing := false;
    end;}

  end
  else
  begin
{    if dxWindow.ItemLinks.VisibleItemCount > 0 then dxWindow.Visible := ivAlways
    else dxWindow.Visible := ivNever;
    LeftDockSite.Visible := true;
    WindowsPanel.Visible := true;

    with BarManager.Bars.Items[BarManager.Bars.Count - 1] do
    begin
      Visible := true;
      AllowClose := true;
      AllowCustomizing := true;
      AllowQuickCustomizing := true;
    end;}
  end;

  BarManager.EndUpdate;
end;

procedure TMainForm.WindowsPanelCloseQuery(Sender: TdxCustomDockControl;
  var CanClose: Boolean);
begin
  CanClose := false;
end;

procedure TMainForm.UnLoadPlugins;
  var
    i : integer;
begin
  for i := FPluginList.Count - 1 downto 0 do
  begin
    FreeLibrary(FPluginList[i].FHandle);
    FPluginList.Delete(i);
  end;
end;

procedure TMainForm.UpdateColorScheme;
begin
  if integer(Low(TcxLookAndFeelKind)) > ColorScheme then ColorScheme := Integer(Low(TcxLookAndFeelKind))
  else
    if Integer(High(TcxLookAndFeelKind)) < ColorScheme then ColorScheme := Integer(High(TcxLookAndFeelKind));

  SkinController.Kind := TcxLookAndFeelKind(ColorScheme);
  SkinController.NativeStyle := NativeStyle;
  SkinController.UseSkins := UseSkins;
  SkinController.SkinName := CurrentSkin;

  RepaintAllWindow;
end;

function TMainForm.Connected: boolean;
begin
  Result := Datas.ZConnection.Connected;
end;

procedure TMainForm.CorrectFloat(Sender: TComboBox);
begin
  with Sender do
    if Not IsFloat(Text) then
      Text := '';
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseDatas;

  Datas.Free;
  Datas := nil;

  if StoreOptions then
    DockingManager.SaveLayoutToIniFile(cMainDockIniFileName);

  if StoreOptions then
  begin
    PropertiesStore.StoreTo(false);
    BarManager.SaveToIniFile(cIniFileNameMainForm);
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FClosing := true;
end;

procedure TMainForm.acUpdateExecute(Sender: TObject);
{  var
    vID : integer;}
begin
//  vID := Query.FieldByName('ID').AsInteger;
  SimpleUpdateData;
{  if Query.Active then
    Query.Locate('ID', vID, []);}
end;

procedure TMainForm.AppEventsActiveFormChange(Sender: TObject);
begin
  if Assigned(Screen.ActiveForm) and (Screen.ActiveForm.FormStyle = fsMDIChild) then
    WinList.SelectWin(Screen.ActiveForm);
end;

procedure TMainForm.AppEventsException(Sender: TObject; E: Exception);
  var
    c, s : string;
begin
  if E is EClipboardException then Exit;

  s := E.Message;
  c := E.ClassName;
  if s = 'SQL Error: MySQL server has gone away' then
  begin
    s := 'MySQL сервер недоступен!';
    ShowMsg(s, smtError, [smbOK], smbOK, smbOK);
    try
      WinList.CloseAll;
    except
    end;
    try
      CloseDatas;
    except
    end;
  end
  else
  if E is Exception then
  begin
    s := E.Message;
    ShowMsg(E.ClassName + #13#10 + s, smtError, [smbOK], smbOK, smbOK);
  end;

  PrepareActions;
end;

procedure TMainForm.afConnectExecute(Sender: TObject);
begin
  inc(FActiveActions);
  PrepareActions;
  try
    OpenDatas;
  finally
    dec(FActiveActions);
    PrepareActions;
  end;

  if MustCloseApp then afExit.Execute;  
end;

procedure TMainForm.afDeleteWinOptionsExecute(Sender: TObject);
begin
  if WinList.Count > 0 then
    ShowMsg('Для удаления настроек необходимо закрыть все окна!', smtWarning, [smbOK], smbOK, smbOK)
  else
    if ShowMsg('Действительно удалить файлы с настройками таблиц и панелей инструментов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
    begin
      //удаляем файлы
      DeleteFile(cIniFileNameMainForm);

      DeleteFile(cIniFileName);

      //файлы с настройками плавающих панелей
      DeleteFile(cMainDockIniFileName);

      //файлы с настройками окон
      DeleteFile(cIniFileNameToolBar);

      StoreOptions := false;

      ShowMsg('Необходимо перезагрузить программу!', smtInformation, [smbOK], smbOK, smbOK, 5);

      afExit.Execute;
    end;
end;

procedure TMainForm.afDisconnectExecute(Sender: TObject);
begin
  inc(FActiveActions);
  PrepareActions;
  try
    if ShowMsg('Действительно отключиться?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
    begin
//      AutoUpdateTimer.Enabled := false;
      CloseDatas;
    end;
  finally
    dec(FActiveActions);
    PrepareActions;
  end;
end;

procedure TMainForm.QueryAfterClose(DataSet: TDataSet);
begin
  PrepareActions;
  UpdateStatus;
end;

procedure TMainForm.QueryAfterOpen(DataSet: TDataSet);
begin
  UpdateStatus;
  PrepareActions;
///  UpdateDetail;
end;

procedure TMainForm.arOpenReportExecute(Sender: TObject);
  var
    s1, s2 : string;
begin
  with OpenReport do
  begin
    InitialDir := cABSReportDir;
    if Execute then
    begin
      OpenReadyReport3(arOpenReport, FileName);

      s1 := ExtractFilePath(FileName);
      s1 := CorrectPath(s1);
      s2 := cABSReportDir;
      s2 := CorrectPath(s2);
      if s1 <> s2 then
        if ShowMsg('Запомнить путь для сохранения готовых отчетов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
        begin
          cReportDir := s1;
          cABSReportDir := s1;
        end;
    end;
  end;
end;

procedure TMainForm.agEnterpriseExecute(Sender: TObject);
begin
  ChangeEnterpriseParams;
end;

procedure TMainForm.agFAQExecute(Sender: TObject);
begin
  ShowFaq(agFaq);
end;

procedure TMainForm.agMaterialTypeExecute(Sender: TObject);
begin
  ShowMaterialType(agMaterialType);
end;

procedure TMainForm.agMetroExecute(Sender: TObject);
begin
  ShowMetro(agMetro);
end;

procedure TMainForm.agAddressLimitExecute(Sender: TObject);
begin
  ShowAddressLimit(agAddressLimit);
end;

procedure TMainForm.agClientExecute(Sender: TObject);
begin
  ShowClient(agClient);
end;

procedure TMainForm.agStatusTypeQCExecute(Sender: TObject);
begin
  ShowStatusTypeQC(agStatusTypeQC);
end;

procedure TMainForm.agStatusTypeExecute(Sender: TObject);
begin
  ShowStatusType(agStatusType);
end;

procedure TMainForm.agSurveyExecute(Sender: TObject);
begin
  ShowSurvey(agSurvey);
end;

procedure TMainForm.agOrderTagExecute(Sender: TObject);
begin
  ShowOrderTag(agOrderTag);
end;

procedure TMainForm.agPaymentFormExecute(Sender: TObject);
begin
  ShowPaymentForm(agPaymentForm);
end;

procedure TMainForm.agReasonExecute(Sender: TObject);
begin
  ShowReason(agReason);
end;

procedure TMainForm.agWorkClassExecute(Sender: TObject);
begin
  ShowWorkClass(agWorkClass);
end;

procedure TMainForm.agWorkerClassExecute(Sender: TObject);
begin
  ShowWorkerClass(agWorkerClass);
end;

procedure TMainForm.agWorkerCompanyExecute(Sender: TObject);
begin
  ShowWorkerCompany(agWorkerCompany);
end;

procedure TMainForm.agWorkerExecute(Sender: TObject);
begin
  ShowWorker(agWorker);
end;

procedure TMainForm.agWorkRestDayExecute(Sender: TObject);
  var
    vID : integer;
begin
  if SelectWorker(vID) then
    ShowWorkRestDay(vID, agWorkRestDay);
end;

procedure TMainForm.aaWorkerLeadExecute(Sender: TObject);
begin
  ShowWorkerLead(aaWorkerLead);
end;

procedure TMainForm.agWorkTypeExecute(Sender: TObject);
begin
  ShowWorkType(agWorkType);
end;

procedure TMainForm.agDiscountTypeExecute(Sender: TObject);
begin
  ShowDiscountType(agDiscountType);
end;

procedure TMainForm.agDistrictExecute(Sender: TObject);
begin
  ShowDistrict(agDistrict);
end;

procedure TMainForm.agUserRoleExecute(Sender: TObject);
begin
  ShowUserROle(agUserRole);
end;

procedure TMainForm.agUserExecute(Sender: TObject);
begin
  ShowUser(agUser);
end;

procedure TMainForm.eKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(TWinControl(Sender), true, true);
  end;
end;

procedure TMainForm.aaBackupExecute(Sender: TObject);
begin
  FBackup := true;
  try
    BackupDatabase;
  finally
    FBackup := False;
  end;
end;

procedure TMainForm.aaBrowseNotificetionExecute(Sender: TObject);
begin
  BrowseNotification(aaBrowseNotificetion, DateToStr(Date), DateToStr(Date));
end;

procedure TMainForm.aaBrowseOrderArchExecute(Sender: TObject);
  var
    FD, TD : string;
begin
  TD := DateToStr(Date);
  FD := DateToStr(IncMonth(Date, -1));

  BrowseOrderArch(aaBrowseOrderArch, FD, TD);
end;

procedure TMainForm.aaBrowseOrderHistExecute(Sender: TObject);
  var
    FD, TD : string;
begin
  TD := DateToStr(Date);
//  FD := DateToStr(IncMonth(Date, -1));
  FD := DateToStr(Date);

  BrowseOrderHist(aaBrowseOrderHist, FD, TD);
end;

procedure TMainForm.aaChangePasswordExecute(Sender: TObject);
begin
  ChangePassword;
  UpdateColorScheme;
end;

function TMainForm.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  CallHelp := false;
  Application.HelpSystem.ShowContextHelp(Data, Application.HelpFile);
  Result := true;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
//  SkinController. Refresh;
end;

procedure TMainForm.cbInterfaceChange(Sender: TObject);
begin
  InterfaceType := cbInterface.Text;
  PrepareActions;
end;

procedure TMainForm.cbRecordTypeChange(Sender: TObject);
begin
  UpdateData;
end;

procedure TMainForm.aaClientRequestExecute(Sender: TObject);
begin
  ShowClientRequest(aaClientRequest);
end;

procedure TMainForm.aaNoticeOptionsActionExecute(Sender: TObject);
begin
  ShowNoticeOptionsAction(aaNoticeOptionsAction);
end;

procedure TMainForm.aaNoticeOptionsTimeExecute(Sender: TObject);
begin
  ShowNoticeOptionsTime(aaNoticeOptionsTime);
end;

procedure TMainForm.aaOrderListExecute(Sender: TObject);
begin
  ShowOrderlist(aaOrderList);
end;

procedure TMainForm.aaQualityControlExecute(Sender: TObject);
begin
  QualityControl(aaQualityControl, DateToStr(Date - 14), DateToStr(Date));
end;

procedure TMainForm.aaRestoreExecute(Sender: TObject);
  var
    r : integer;
begin
  if WinList.Count > 0 then
  begin
    ShowMsg('Для восстановления резервной копии необходимо закрыть все окна!', smtWarning, [smbOK], smbOK, smbOK);
    Exit;
  end;

  r := ShowMsg('Восстановить базу данных на текущий сервер?'#13#10 +
               'ДА - восстановить на текущий сервер'#13#10 +
               'НЕТ - восстановить на другой сервер'#13#10 +
               'ОТМЕНА - отменить восстановление базы данных', smtConfirmation, [smbYes, smbNo, smbCancel], smbYes, smbCancel);

  if r = mrYes then
  begin
    try
      FBackup := true;
      if RestoreDatabase then
        SimpleUpdateData;
    finally
      FBackup := false;
    end;
  end
  else
  if r = mrNo then
  begin
    try
      FBackup := true;
      if RestoreDatabaseCloud then
        SimpleUpdateData;
    finally
      FBackup := false;
    end;
  end;
end;

procedure TMainForm.aaSQLQueryExecute(Sender: TObject);
begin
  ShowQuery(aaSQLQuery);
end;

procedure TMainForm.ReadNotification;
  var
    vType, vImageIndex, vColor, vShowTime, vIDN, vIDOL, vIDNT : integer;
    vHeader, vText : string;
begin
  FNewReadNotification := ServerTime;
  //читаем уведомления которые больше либо равно FLastReadNotification и меньше FNewReadNotification
  qNotification.Close;
  qNotification.ParamBYName('IDU').AsInteger := UserID;
  qNotification.ParamBYName('FDT').AsString := DateToSQLDate(FLastReadNotification) + ' ' + TimeToStr(FLastReadNotification);
  qNotification.ParamBYName('TDT').AsString := DateToSQLDate(FNewReadNotification) + ' ' + TimeToStr(FNewReadNotification);
  qNotification.Open;
  qNotification.First;
  while not qNotification.eof do
  begin
    vIDN := qNotification.FieldByName('ID').AsInteger;
    vIDNT := qNotification.FieldByName('ID_NoticeTemplate').AsInteger;
    vType := qNotification.FieldByName('Type').AsInteger;

    if vType = 0 then
    begin
      if Datas.AlertImageID.Strings.IndexOfName(IntToStr(vIDNT)) = -1 then
        UpdateNotificationImages;

      vImageIndex := StrToInt(Datas.AlertImageID.Strings.Values[IntToStr(vIDNT)]);

      vIDOL := qNotification.FieldByName('ID_OrderList').AsInteger;
    end
    else
    begin
      vImageIndex := -1;
      vIDOL := 0;
    end;

    vHeader := '(' + qNotification.FieldBYName('ID').AsString + ') ' + qNotification.FieldByName('Header').AsString;
    vText := qNotification.FieldByName('Text').AsString;
    vColor := qNotification.FieldByName('Color').AsInteger;
    vShowTime := qNotification.FieldByName('ShowTime').AsInteger;

    ShowNotification(vType, vIDN, vIDOL, vHeader, vText, vColor, vShowTime, vImageIndex, 'fixed');

    qNotification.Next;
  end;
  qNotification.Close;

  FLastReadNotification := FNewReadNotification;
end;

procedure TMainForm.RepaintAllWindow;
begin
  EnumWindow(RepaintOneWindow);
end;

procedure TMainForm.RepaintOneWindow(AForm: TForm);
begin
  AForm.Update;
end;

procedure TMainForm.RunPlugin(APlugin, ACommand, AParams, ALog: string);
  var
    i, j : integer;
    vBarSubitem : TdxBarSubitem;
    vPluginItem : TPluginItem;
    f : string;
begin
  DefPlugin := APlugin;
  DefCommand := ACommand;
  DefParams := AParams;
  DefLog := ALog;

  for i := 0 to mPlugins.ItemLinks.Count - 1 do
  begin
    vBarSubitem := TdxBarSubitem(mPlugins.ItemLinks.Items[i].Item);
    vPluginItem := TPluginItem(vBarSubitem.Data);

    if Assigned(vPluginItem) then
    begin
      f := ExtractFileName(vPluginItem.FileName);
      f := ChangeFileExt(f, '');

      if AnsiLowerCase(f) = AnsiLowerCase(APlugin) then
      begin
        for j := 0 to vPluginItem.PluginInterface.CommandCount - 1 do
        begin
          if AnsiLowerCase(vPluginItem.PluginInterface.GetCommandCaption(j)) = AnsiLowerCase(ACommand) then
          begin
            if not vPluginItem.PluginInterface.GetCommandEnabled(j) then
              WritePluginLog('Плагин "' + AnsiLowerCase(APlugin) + '": команда "' + AnsiLowerCase(ACommand) + '" неактивна!')
            else
            begin
              WritePluginLog('Плагин "' + AnsiLowerCase(APlugin) + '": выполнение команды "' + AnsiLowerCase(ACommand) + '", параметры "' + AParams + '"');
              try
                vPluginItem.PluginInterface.Execute(j);
              except
                on E: Exception do WritePluginLog(E.Message);
              end;
              WritePluginLog('Плагин "' + AnsiLowerCase(APlugin) + '": выполнение команды "' + AnsiLowerCase(ACommand) + '" завершено');
            end;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

function TMainForm.RunUpdate(MustUpdate : boolean; UpdateURL : string) : boolean;//обновление
  const
    cNotInitUpdater : string = 'Не удается инициализировать модуль обновления!';
  var
    s, fb, fu, fi : string;
begin
  Result := false;
  if not MustUpdate or (UpdateURL = '') then Exit;

  fu := AppDir + 'Updater.exe';
  fi := AppDir + 'Updater.ini';
  fb := AppDir + 'Updater.bat';
  if FileExists(fu) then DeleteFile(fu);
  if FileExists(fu) then
  begin
    ShowMessage(cNotInitUpdater);
    Exit;
  end;
  Datas.binUpdater.SaveToFile(fu);
  Datas.strUpdaterIni.Strings.SaveToFile(fi);

  with TIniFile.Create(fi) do
    try
      WriteString('Channel', 'TargetURL', UpdateURL);
    finally
      Free;
    end;

  with TStringList.Create do
    try
      s := StrToOEM('"' + fu + '"');
      Add(s);
      s := StrToOEM('start ' + ExtractFileName(Application.ExeName));
      Add(s);
      s := StrToOEM('del "' + fu + '"');
      Add(s);
      s := StrToOEM('del "' + fi + '"');
      Add(s);
      s := StrToOEM('del "' + fb + '"');
      Add(s);

      SaveToFile(fb);
    finally
      Free;
    end;

  FileExecute(fb, '', ExtractFileDir(fb), esHidden);
  Result := true;
end;

function TMainForm.CorrectSQLFloat(AFloat: string) : string;
begin
  Result := StringReplace(AFloat, ',', '.', [rfReplaceAll]);
end;

procedure TMainForm.awCascadeExecute(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.awCloseAllExecute(Sender: TObject);
begin
  WinList.CloseAll;
end;

procedure TMainForm.awHorExecute(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TMainForm.awVerExecute(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TMainForm.awWindowsListExecute(Sender: TObject);
begin
  WindowsPanel.Show;
end;

procedure TMainForm.CallChangeProgress(AProgress: double; AText: string);
begin
  ChangeProgress(AProgress, AText);
end;

procedure TMainForm.CallChangeWaiting(AText: string);
begin
  ChangeWaiting(AText);
end;

procedure TMainForm.CallHideProgress;
begin
  HideProgress;
end;

procedure TMainForm.CallHideWaiting;
begin
  HideWaiting;
end;

function TMainForm.CallReadOptions(ANames: string): variant;
begin
  Result := Datas.ReadOptions(ANames);
end;

function TMainForm.CallReadValues(ATableName, ANames: string;
  AID: integer): variant;
begin
  Result := Datas.ReadValues(ATableName, ANames, AID);
end;

function TMainForm.CallReadValuesSQL(ASQL, ANames: string): variant;
begin
  Result := Datas.ReadValuesSQL(ASQL, ANames);
end;

function TMainForm.CallShowMsg(AText: string; AMsgType: TIShowMsgType;
  AButtons: TIShowMsgButtons; ADefaultButton,
  ACancelButton: TIShowMsgButton; ATime : integer): integer;
begin
  Result := ShowMsg(
    AText, TShowMsgType(AMsgType), TShowMsgButtons(AButtons),
    TShowMsgButton(ADefaultButton),
    TShowMsgButton(ACancelButton), ATime);
end;

procedure TMainForm.CallShowProgress(ATitle: string; ACancelButton,
  AConfirmTerminate: boolean);
begin
  ShowProgress(ATitle, ACancelButton, AConfirmTerminate);
end;

procedure TMainForm.CallShowWaiting(AText: string);
begin
  ShowWaiting(AText);
end;

function TMainForm.CallTerminatedProgress: boolean;
begin
  Result := TerminatedProgress;
end;

procedure TMainForm.NavBarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
begin
  with TForm(ALink.Item.Tag) do
  begin
    if WindowState = wsMinimized then
      WindowState := wsNormal;
//    Show;
    BringToFront;
  end;
end;

procedure TMainForm.NotificationTimerTimer(Sender: TObject);
begin
  NotificationTimer.Enabled := false;
  HideNotification;
  ReadNotification;
  NotificationTimer.Enabled := true;
end;

procedure TMainForm.arCreateReportExecute(Sender: TObject);
  var
    vID : integer;
    vData : TMemoryStream;
    s : string;
    vOK : boolean;
begin
  inc(FActiveActions);
  PrepareActions;
  try
    vOK := SelectReportForm(vID);
    if vOK then
    begin
      qReport.Close;
      qReport.ParamByName('ID').AsInteger := vID;
      qReport.Open;

      vData := TMemoryStream.Create;

      TBlobField(qReport.FieldByName('Data')).SaveToStream(vData);

      qReport.Close;

      vData.Position := 0;
      CreateReport3(arCreateReport, vData, Datas.ReadValues('ReportForm', 'Name', vID)[0]);
      vData.Free;
    end;
  finally
    dec(FActiveActions);
    PrepareActions;
  end;

  if vOK and FMinimized then
    TrayIconDblClick(nil, mbLeft, [], 0, 0);
end;

procedure TMainForm.arReportFormExecute(Sender: TObject);
begin
  ShowReportForm(arReportForm);
end;

procedure TMainForm.agSearchHintExecute(Sender: TObject);
begin
  ShowSearchHint(agSearchHint);
end;

procedure TMainForm.agSignalTypeExecute(Sender: TObject);
begin
  ShowSignalType(agSignalType);
end;

procedure TMainForm.agSourceTypeExecute(Sender: TObject);
begin
  ShowSourceType(agSourceType);
end;

procedure TMainForm.aaWorkTypeSynonymExecute(Sender: TObject);
begin
  ShowWorkTypeSynonym(aaWorkTypeSynonym);
end;

function GetAppDataDir : string;
  var
    vPath : array [0..max_path- 1] of char;
begin
  FillChar(vPath, max_path, 0);
  if (Win32Platform and VER_PLATFORM_WIN32_NT) = 0 then Result := ExtractFilePath(Application.ExeName)
  else
    if Succeeded(SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, vPath)) then Result := vPath
    else
      if Succeeded(SHGetFolderPath(0, CSIDL_LOCAL_APPDATA, 0, 0, vPath)) then Result := vPath
      else
        Result := ExtractFilePath(Application.ExeName);
  if Result[Length(Result)] <> '\' then Result := Result + '\';
  Result := Result + ChangeFileExt(ExtractFileName(Application.ExeName), '') + '\';
end;

function GetMyDocDir : string;
  var
    vPath : array [0..max_path- 1] of char;
begin
  FillChar(vPath, max_path, 0);
  if (Win32Platform and VER_PLATFORM_WIN32_NT) = 0 then Result := ExtractFilePath(Application.ExeName)
  else
    if Succeeded(SHGetFolderPath(0, CSIDL_PERSONAL, 0, 0, vPath)) then Result := vPath
    else
      Result := ExtractFilePath(Application.ExeName);
  if Result[Length(Result)] <> '\' then Result := Result + '\';
  Result := Result + ChangeFileExt(ExtractFileName(Application.ExeName), '') + '\';
end;

function ExePath : string;
begin
  Result := ExtractFilePath(Application.ExeName);
  if Result[Length(Result)] <> '\' then Result := Result + '\';
end;

procedure TMainForm.UpdateExportDirs;
begin
  Datas.UpdateExportDirs;
end;

procedure TMainForm.UpdateNavBar;
begin
  if not SkinController.UseSkins then
    NavBar.View := dxNavBarViewsFactory.IndexOfName(NavBarStyleNames[TcxLookAndFeelKind(ColorScheme)])
  else
    NavBar.View := dxNavBarViewsFactory.IndexOfName('SkinExplorerBarView');
end;

procedure TMainForm.UpdateNotificationImages;
  var
    n : integer;
    vImage : TdxSmartImage;
    vStream : TMemoryStream;
    vID, r : integer;
begin
  qNoticeTemplate.Close;
  qNoticeTemplate.Open;
  qNoticeTemplate.First;
  while not qNoticeTemplate.eof do
  begin
    vID := qNoticeTemplate.FieldByName('ID').AsINteger;

    if Datas.AlertImageID.Strings.IndexOfName(IntToStr(vID)) = -1 then
    begin
      vStream := TMemoryStream.Create;
      TBlobField(qNoticeTemplate.FieldBYName('Picture')).SaveToStream(vStream);
      vStream.Position := 0;

      vImage := TdxSmartImage.CreateFromStream(vStream);

      n := Datas.AlertImageList.Add(vImage);
      Datas.AlertImageID.Strings.Add(IntToStr(vID) + '=' + IntToStr(n));

      vImage.Free;
      vStream.Free;
    end;

    qNoticeTemplate.Next;
  end;
  qNoticeTemplate.Close;
end;

procedure TMainForm.UpdatePluginState;
  var
    i, j : integer;
    vPluginItem : TPluginItem;
    vAction : TAction;
    vCommand : integer;
begin
  if FPluginList = nil then Exit;

  for i := 0 to FPluginList.Count - 1 do
  begin
    vPluginItem := FPluginList[i];
    for j := 0 to vPluginItem.CommandList.Count - 1 do
    begin
      vAction := vPluginItem.CommandList[j].Action;
      vCommand := vAction.DesignInfo;

      vAction.Enabled := vPluginItem.PluginInterface.GetCommandEnabled(vCommand);
    end;
  end;
end;

procedure TMainForm.arReportSnapExecute(Sender: TObject);
begin
  ShowReportSnap(arReportSnap);
end;

procedure TMainForm.FilterPanelCloseQuery(Sender: TdxCustomDockControl;
  var CanClose: Boolean);
begin
  CanCLose := false;
end;

{ TCommandList }

function TCommandList.Add: TCommandItem;
begin
  Result := TCommandItem(inherited Add);
end;

function TCommandList.GetItem(Index: Integer): TCommandItem;
begin
  Result := TCommandItem(inherited GetItem(Index));
end;

function TCommandList.GetOwner: TPersistent;
begin
  Result := FPluginItem;
end;

function TCommandList.Insert(Index: Integer): TCommandItem;
begin
  Result := TCommandItem(inherited Insert(Index))
end;

procedure TCommandList.SetItem(Index: Integer; const Value: TCommandItem);
begin
  inherited SetItem(Index, Value);
end;

{ TPluginItem }

constructor TPluginItem.Create(Collection: TCollection);
begin
  FCommandList := TCommandList.Create(TCommandItem);
  FCommandList.FPluginItem := Self;

  inherited;
end;

destructor TPluginItem.Destroy;
begin
  inherited;
  FCommandList.Free;
end;

{ TPluginList }

function TPluginList.Add: TPluginItem;
begin
  Result := TPluginItem(inherited Add);
end;

function TPluginList.GetItem(Index: Integer): TPluginItem;
begin
  Result := TPluginItem(inherited GetItem(Index));
end;

function TPluginList.GetOwner: TPersistent;
begin
  Result := nil;
end;

function TPluginList.Insert(Index: Integer): TPluginItem;
begin
  Result := TPluginItem(inherited Insert(Index))
end;

procedure TPluginList.SetItem(Index: Integer; const Value: TPluginItem);
begin
  inherited SetItem(Index, Value);
end;

initialization
  //текущий каталог
  AppDir := CorrectPath(ExtractFilePath(Application.ExeName));
//  CurrentDir := GetAppDataDir;
  CurrentDir := AppDir;
  MyDocDir := GetMyDocDir;
  TempDir := CorrectPath(PathGetTempPath);

  //файл справки
  Application.HelpFile := ExePath + 'Справка\' + ChangeFileExt(ExtractFileName(Application.ExeName), '.chm');

  //файл с настройками программы
  cIniFileNameSetup := CurrentDir + ChangeFileExt(ChangeFileExt(ExtractFileName(Application.ExeName), '') + 'Setup', '.opt');

  //файл с подключениями к базе данных
  cIniFileNameDatas := CurrentDir + ChangeFileExt(ChangeFileExt(ExtractFileName(Application.ExeName), '') + 'Datas', '.opt');

  //файл с настройками главного окна
  cIniFileNameMainForm := CurrentDir + ChangeFileExt(ChangeFileExt(ExtractFileName(Application.ExeName), '') + 'MainForm', '.opt');

  //файл с настройками окон
  cIniFileName := CurrentDir + ChangeFileExt(ExtractFileName(Application.ExeName), '.opt');

  //файл с настройками кнопок
  cIniFileNameToolBar := CurrentDir + ChangeFileExt(ChangeFileExt(ExtractFileName(Application.ExeName), '') + 'Toolbar', '.opt');

  //файлы с настройками плавающих панелей
  cMainDockIniFileName := CurrentDir + ChangeFileExt(ExtractFileName(Application.ExeName), '.dmm');
finalization

end.
