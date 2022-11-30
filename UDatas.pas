//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ������ ������
//
//------------------------------------------------------------------------------
unit UDatas;

interface

uses
  Windows, SysUtils, Classes, Controls, Dialogs, Forms, Graphics,
  cxGrid, cxGridDBTableView,
  cxGridCustomView, Printers, LbCipher, LbClass, frxDesgn, frxClass,
  frxBarcode, frxOLE,
  frxRich, frxCross, frxChBox, frxGradient, frxDCtrl,
  fs_iadortti, fs_idbrtti, fs_idbctrlsrtti, fs_ichartrtti, fs_ipascal,
  fs_ibasic, fs_iclassesrtti, fs_igraphicsrtti, fs_iextctrlsrtti, fs_iformsrtti,
  fs_idialogsrtti, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  cxStyles, ActnList, frxZComponents, DBGridEh,
  cxGridTableView, cxGridDBDataDefinitions, cxDBData, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSFileBasedXplorer, frxChart, DB, XComDrv,
  cxTL, cxTLData, cxDBTL, types, BinaryFile,
  cxEditRepositoryItems, cxDBEditRepository, cxEdit,
  cxExtEditRepositoryItems, ZAbstractConnection, JvStringHolder,
  cxClasses, frxExportBaseDialog, frxExportText,

  {$HINTS OFF}
  frxExportPDF, frxExportRTF, frxExportCSV, frxExportXLS, frxExportXML,
  frxExportHTML, frxExportImage, frxDMPExport,
  frxExportODF, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxSkinsCore, dxSkinscxPCPainter, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, cxCheckBox, IdGlobal, dxPScxTLLnk, JvComponentBase,
  JvRichEditToHtml, dxSkinsdxRibbonPainter, PrnDbgeh, cxLookAndFeelPainters,
  cxGraphics, dxAlertWindow, System.ImageList, Vcl.ImgList, cxImageList
  {$HINTS ON};

type
  TDatas = class(TDataModule)
    PSFileBasedExplorer: TdxPSFileBasedExplorer;
    ComponentPrinter: TdxComponentPrinter;
    ComponentPrinterLink1: TdxGridReportLink;
    frxDesigner: TfrxDesigner;
    frxDialogControls: TfrxDialogControls;
    frxGradientObject: TfrxGradientObject;
    frxCheckBoxObject: TfrxCheckBoxObject;
    frxCrossObject: TfrxCrossObject;
    frxRichObject: TfrxRichObject;
    frxOLEObject: TfrxOLEObject;
    frxBarCodeObject: TfrxBarCodeObject;
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    frxHTMLExport: TfrxHTMLExport;
    frxRTFExport: TfrxRTFExport;
    frxCSVExport: TfrxCSVExport;
    ZConnection: TZConnection;
    tUser: TZQuery;
    qServerTime: TZQuery;
    qEmployees: TZQuery;
    tEnterprise: TZQuery;
//    ZComponents: TfrxZComponents;
    PrinterSetupDialog: TPrinterSetupDialog;
    frxChartObject1: TfrxChartObject;
    frxRichObject1: TfrxRichObject;
    frxXLSExport: TfrxXLSExport;
    frxBMPExport: TfrxBMPExport;
    frxJPEGExport: TfrxJPEGExport;
    frxDotMatrixExport: TfrxDotMatrixExport;
    ComPort: TXComm;
    TreeListPrinter: TdxComponentPrinter;
    PSFileBasedExplorerTree: TdxPSFileBasedExplorer;
    TreeListPrinterLink1: TcxDBTreeListReportLink;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    frxXMLExport1: TfrxXMLExport;
    EditRepository: TcxEditRepository;
    EditRepositoryWeekend: TcxEditRepositoryCheckComboBox;
    EditRepositoryIntCheckBox: TcxEditRepositoryCheckBoxItem;
    EditRepositoryWeekdayName: TcxEditRepositoryComboBoxItem;
    EditRepositoryLookupWeekDay: TcxEditRepositoryImageComboBoxItem;
    EditRepositoryLookupEmployee: TcxEditRepositoryLookupComboBoxItem;
    EditRepositoryNumAsText: TcxEditRepositoryTextItem;
    EditRepositoryCalcType: TcxEditRepositoryImageComboBoxItem;
    FTP: TIdFTP;
    qReport: TZQuery;
    RichEditToHtml: TJvRichEditToHtml;
    qConsts: TZQuery;
    StrConst: TJvStrHolder;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    PrintDBGridEh: TPrintDBGridEh;
    strUpdaterIni: TJvStrHolder;
    binUpdater: TBinaryFile;
    StyleRepository: TcxStyleRepository;
    DeletedRecordStyle: TcxStyle;
    tClientList: TZQuery;
    tChat: TZQuery;
    ZComponents: TfrxZComponents;
    tNotification: TZQuery;
    tNotificationUser: TZQuery;
    AlertWindowManager: TdxAlertWindowManager;
    AlertImageList: TcxImageList;
    AlertImageID: TJvStrHolder;
    qNoticeTemplate: TZQuery;
    procedure DefaultProc(Sender: TObject; const Received: Cardinal);
    procedure DataModuleCreate(Sender: TObject);
    procedure AlertWindowManagerClick(Sender: TObject;
      AAlertWindow: TdxAlertWindow);
    procedure AlertWindowManagerCustomDrawBackground(Sender: TObject;
      AAlertWindow: TdxAlertWindow; ACanvas: TcxCanvas;
      AViewInfo: TdxAlertWindowViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    FProc : TDataEvent;

    FStartReport : boolean;

    function Autorise(ALogin, APassword : string) : integer;
    function ClientVersionCheck(var AAppVersion, ADBVersion : string) : boolean;
    function GetUpdateURL : string;
    function CheckConsts : boolean;

    //������ ������� �������
    procedure frxReportProgress(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
  public
    { Public declarations }
    function ConnectToDatabase(AZConnection : TZConnection; var AHost, ADatabase, AUser, APassword, AProtocol, APort, AParams : string) : boolean;
    procedure OpenDatabase;
    procedure CloseDatabase;
    function ConnectionString : string;

    //������ ������ �������
    function ReadValuesSQL(ASQL : string; ANames : string): variant;
    //������ ����� �������
    function ReadValues(ATableName : string; ANames : string; AID : integer = -1): variant;
    //������ ������� ��������
    function ReadOptions(ANames : string): variant;

    //������ ������ �������
    procedure WriteValuesSQL(ASQL : string; ANames : string; AValues : variant); stdcall;
    //������ ����� �������
    procedure WriteValues(ATableName : string; ANames : string; AValues : variant; AID : integer = -1); stdcall;
    //������ ������� ��������
    procedure WriteOptions(ANames : string; AValues : variant); stdcall;

    //�������� ������������� ������
    function UsedData(ATableName: string; AID: integer): boolean;

    //������ �������� ��������
    procedure ReadExportOptions;

    //���������� ����� ��� �������� ��������
    procedure UpdateExportDirs;

    //������ ���������
    procedure SetBarcodeScannerProc(AProc : TDataEvent);
    procedure ResetBarcodeScannerProc;
    function OpenScanner : boolean;
    function CloseScanner : boolean;
  end;

  TPrinterOrientation = Printers.TPrinterOrientation;  // required for Form Designer

  TDocumentType = (dtUnknown, dtIncome, dtIncomeInternal, dtOutcome, dtOutcomeInternal, dtMoving);

  TPropType = (ptText, ptFloat, ptInteger);

const
  cFloatPropMask = '(\+|\-)?\d+(\.\d+)?';
  cIntegerPropMask = '(\+|\-)?\d+';

var
  Datas: TDatas;

  PropTypeStr : array [TPropType] of string = ('���������', '������������', '�������������');

  PropTypeFormat : array [TPropType] of string = ('', cFloatPropMask, cIntegerpropMask);

  cDoCheck : boolean = true;

  EntName : string = '';//�������� �����������
  EntShortName : string = '';

  WorkDay : string = '';//������ ������� ����
  WorkTime : string = '';//������ �������� �������, �������� 09:00-19:00

  WorkMonth : string = '';//������� �����

  vLogin : string;   //�����
  vPassword : string;//������

  AutoriseError : integer = 0;//��� ���������� �������� �����������

  //������ ������������� � ��������, �.�. ��������� ��� ������� ��� ������, ����� ������ ���������� ��� ���������
  UserID : integer;                //� ��������� �������� ������ ��������������
  UserName : string = '';          //��� ������������
  UserPermTool : TStringList = nil;//���������� �� �����������
  UserPermData : TStringList = nil;//���������� �� ������
  LastEnterTime : TDateTIme = 0;   //����� ��������� �����������

  //����� ���������� ���������� ������
  StartTime : TDateTime = 0;
  ReportTime : TTime = 0;

  //URL ����������
  UpdateURL : string = '';

  //��� ���������� ��������������� �� ������, ��� �� ���, ��� ������� ����� ����������� ����� ��� ��������
  ReportFileName : string;

//������ ��������
var
  DefPlugin : string = '';
  DefCommand : string = '';
  DefParams : string = '';
  DefLog : string = '';

  //������� ����
  CurrentOrderList : TForm = nil;

  //������� �������������
  IDOrderList : integer = 0;

{ �������� ������� ������� ����� }
function ChangeEnterpriseParams : boolean;

{ �������� ������� ������� ����� }
function EditWorkMonth : boolean;

{ �������� ������ }
function CloseMonth : boolean;

{ ������� ������� ����� }
procedure OpenReadyReport3(AParentAction : TAction; AFileName : string);

{ ������� ���������� �� ������ ��������� � ������ �� ����� }
function CopyRecord(AFrom, ATo : TDataset) : boolean; overload;

{ ������� ���������� �� ������ ��������� � ������ �� ����� }
function CopyRecord(AFrom, ATo : TDataset; AExcludeFields : string; AUseFromFields : boolean) : boolean; overload;

{ ������� ���������� �� ������ ��������� � ������ �� ����� � ������������ ����� ����� � ������� }
function CopyRecord(AFrom, ATo : TDataset; AExcludeFields : string) : boolean; overload;

{ ��������� ������ �������� ������������ }
function ChangePassword : boolean;

//��������� ������� �������
function GetServerTime(var ADate : TDate; var ATime : TTime) : boolean;

//��������� ������� �������
function ServerTime : TDateTime;

//��������� ��������� ����������� ����
function GetIDEmployee(AIDRequest : integer; var AIDEmployee : integer) : boolean;

//������� ������ ��������� ����
function GetBooleanText(AField : TField; ATrueText, AFalseText : string) : string;

//�������� ������ � ���������� ���� Deleted
function DeleteRec(ATableName : string; AID : integer; AShowWaiting : boolean = true) : boolean;

//�������� ������ �������
function DeleteRecSimple(ATableName : string; AID : integer; AShowWaiting : boolean = true) : boolean;

//���������� ������
function EditRecord(ATableName : string; AID : integer; AFieldNames : array of string; AValues : array of const) : boolean;

//��������� ����� ������ FastReport
function EditReport3(ATitle, AFileName : string; AForm : TMemoryStream) : boolean;

//���������� ������ FastReport
function CreateReport3(AParentAction : TAction; AForm : TStream; ACaption : string; AShowProgress : boolean = true) : boolean;

//��������� ������������ ������
function PrepareReport(AIDReport : integer; AShowWaiting : boolean = true) : TFRXReport; overload;

//��������� ������������ ������
function PrepareReport(AReport : TfrxReport; AShowWaiting : boolean = true) : boolean; overload;

//������� ������ � ������ ������
function ExportReport(AFRXReport : TFRXReport; AFileName : string; AShowWaiting : boolean = true) : boolean;

//�������� ����
function IsWeekend(ADate : TDate) : boolean;

//������ ����������� DX
procedure PrintGuideGridDX(AGuideName : string; AGrid : TcxGrid);

//������ ����������� Eh
procedure PrintGuideGridEh(AGuideName : string; ADBGridEh : TDBGridEh);

//������ ������ DX
procedure PrintTreeListDX(AGuideName : string; ATree : TcxDBTreeList);

//���������� �������
procedure ExecSQL(ASQL : string);

//��������� �������� �������� 0, 1 �� false, true
function BooleanToInt(AValue : boolean) : integer;

//��������������� ������ � ����������
function IntToBoolean(AValue : integer) : boolean;

//��������� ������ ������
function GetFastReport3FormVersion(AForm : TStream) : string;

//������������� ������� �� ������
procedure LocateRecordInView(AView: TcxGridTableView; AID: variant);

//������ � ������� �� ���� ������� ��������� �����
procedure ReadImportData(ADataset : TDataset; AFields, AValue : string; AQuota : char);

//������ ����� �� ������ �������� � ������
procedure CopyFields(AFields : string; AFrom, ATo : TDataset);

//���������� ��������� �����
function CreateDatabaseBackup(AFileName : string) : integer;

//�������������� ��������� �����
function RestoreDatabaseBackup(AFileName : string) : integer;

//�������������� ��������� ����� �� ��������� ������
function RestoreDatabaseBackupCloud(AFileName, AHost, ADatabase, AUser, APassword, AProtocol, APort, AParams : string) : integer;

//�������� ����������� �� ���
function ExistsPartnerByINNKPP(AINN, AKPP: String; AExcludeID : integer): Boolean;

//����� ����������� �� ���
function FindPartnerByINNKPP(AINN, AKPP: String; AExcludeID : integer): Integer;

//�������� ������� ����������� ������
function ExistsUpdate : boolean;

//�������� ����� � ���������
//APrefix - ��������� ������, ADate - ���� � ����� ���������� �����,
//AID - ������������� ��������, � ������� ��������� ����
//AIDFile - ������������� ������ �����
//AFileName - ������������ ��� ����� ��� ����
//AServerPath - ������ ���� � ����� � ���������
//AServerFileName - ���������� ��� �����, ��������������� �� ����������
function ServerFileSend(APrefix : string; ADate : TDateTime; AID, AIDFile : integer; AFileName : string; var AServerPath, AServerFileName : string) : boolean;

//��������� ����� �� ���������
function ServerFileReceive(AFileName, AServerPath, AServerFileName : string; var FilePath : string) : boolean;

//�������� ����� � ���������
function ServerFileDelete(AServerPath, AServerFileName : string) : boolean;

//�������� ����� � ���������
function ServerFileExists(AServerPath, AServerFileName : string) : boolean;

//���������� ����� ��� ������ ������
function ServerFileSaveAs(AFilePath, AServerPath, AServerFileName : string) : boolean;

//��������� ���������� ������������
function GetEmployeeName(AIDEmployee : integer) : string;

//��������� ������ ������
function GetFastReportVersion(AForm : TStream) : string;

//������ ���������� � ��� ��� �������
procedure WritePluginLog(AText : string);

//��������� ��������� �� ���������
function GetSourceTypeDef : integer;

//��������� ������� �� ���������
function GetStatusTypeDef : integer;

//��������� ����� ������ �� ���������
function GetPaymentFormDef : integer;

//��������� ����������� ��������� �� ���������
function GetSignalTypeDef : integer;

//���������� ��������� � ���
function AddChatMessage(AIDOrderList : integer; AText : string) : integer;

//���������� ����������� �������
function AddNotificationManual(AIDOrderList, AIDNoticeTemplate, AIDUser: integer; AHeader, AText : string; AColor, AShowTime : integer) : integer;

//����������� �����������
function ShowNotification(AIDNotification, AIDOrderList : integer; AHeader, AText : string; AColor, AShowTime : integer; AImageIndex : integer; AInfo : string = '') : integer;

//�������� �������� ��� �����������
function LoadNoticeIcons : boolean;

//���������� ��������������������
function SaveLastEnterTime : boolean;

implementation

{$R *.dfm}

uses
  Math, Variants, MesDlg, UUtil, DTKUtils, UProgress, DateUtils, UWaiting,
  UOptions, UEnter, UEnterpriseParams, UChangePassword, UConsts,
  UMonthParams, UConnectParams, ShellAPI, inifiles, frxDsgnIntf,
  jclfileutils, StrUtils, UReportPreview,
  UAutoUpdateClientData, UShowDatasetModal, JvVersionInfo, dxGDIPlusClasses,

  MainUnit, UOrderList;

{ �������� ������� ������� ����� }
function ChangeEnterpriseParams : boolean;
  var
    vName, vShortName, vMasterName, vMasterPost,
    vAddress, vPhone, vEMail, vWEBSite, vWorkDay, vWorkTime, vUpdateURL,
    vAPIKeyDadata, vSecretKeyDadata : string;
    vOldOrderTime, vCheckUpdateTime, vNotificationTIme : integer;
    vWorkPeriodStart, vWorkPeriodEnd : TDate;

    vFileServerType : integer;
    vFileServerHost, vFileServerDir, vFileServerUser, vFileServerPassword : string;
    vFileServerPort : integer;
    vPhotoHeight, vPhotoWidth : integer;
    vMessageCheckInterval, vMessageViewCount : integer;

    vEmailFrom, vEmailCharset, vEmailName, vEmailHost, vEmailLogin, vEmailPassword : String;
    vEmailPort, vEmailAuthType, vEmailTLSType : Integer;
    vEMailCollection : string;
    vEMailNotification, vEMailPreview, vEMailPreviewClient : integer;
    vEMailJPGQuality, vEMailJPGRes : integer;

    vIDSignalTypeLead, vIDStatusTypeLead, vIDSourceTypeLead,
    vIDSignalTypeRequest, vIDStatusTypeRequest, vIDSourceTypeRequest : integer;
    vIDStatusTypeCancel, vOurWorkTime : integer;
    vSMSServiceLogin, vSMSServicePassword, vSMSServiceSender : string;

    vMaxDiscount, vIDPaymentFormYoomoney : integer;
    vYoomoneyShopID, vYoomoneyKey : string;
    vMasterLicFileLink, vMasterCoordTelegram, vMasterCoordPhone : string;
    vIDStatusMasterConfirmArea, vIDStatusMasterButtonAcceptOrder, vIDStatusMasterButtonCancelOrder,
    vIDSignalMasterCancelOrder, vIDStatusMasterButtonOnTime, vIDStatusMasterButtonLateOrder,
    vIDSignalMasterLaterOrder, vIDStatusMasterButtonCameOrder, vIDStatusMasterButtonStartWork,
    vIDStatusMasterButtonSendPay, vIDStatusMasterButtonClientPaid, vIDStatusMasterButtonFinishOrder : integer;
begin
  ShowWaiting(cDataGetting);

  with Datas.tEnterprise do
  begin
    vName := FieldByName('Name').AsString;
    vShortName := FieldByName('ShortName').AsString;
    vMasterName := FieldByName('MasterName').AsString;
    vMasterPost := FieldByName('MasterPost').AsString;
    vAddress := FieldByName('Address').AsString;
    vPhone := FieldByName('Phone').AsString;
    vEMail := FieldByName('EMail').AsString;
    vWEBSite := FieldByName('WEBSite').AsString;
    vAPIKeyDadata := FieldByName('APIKeyDadata').AsString;
    vSecretKeyDadata := FieldByName('SecretKeyDadata').AsString;

    vWorkDay := FieldByName('WorkDay').AsString;
    vWorkTime := FieldByName('WorkTime').AsString;

    vOldOrderTime := FieldByName('OldOrderTime').AsInteger;
    vCheckUpdateTime := FieldByName('CheckUpdateTime').AsInteger;
    vNotificationTIme := FieldByName('NotificationTIme').AsInteger;

    vWorkPeriodStart := FieldByName('WorkPeriodStart').AsDateTime;
    vWorkPeriodEnd := FieldByName('WorkPeriodEnd').AsDateTime;

    vUpdateURL := FieldByName('UpdateURL').AsString;

    //�������� ������
    vFileServerType := FieldByname('FileServerType').AsInteger;
    vFileServerHost := FieldByname('FileServerHost').AsString;
    vFileServerDir := FieldByname('FileServerDir').AsString;
    vFileServerUser := FieldByname('FileServerUser').AsString;
    vFileServerPassword := FieldByname('FileServerPassword').AsString;
    vFileServerPort := FieldByname('FileServerPort').AsInteger;

    //����
    vPhotoWidth := FieldByname('PhotoWidth').AsInteger;
    vPhotoHeight := FieldByname('PhotoHeight').AsInteger;

    //����������� �����
    vEmailHost := FieldByName('EmailHost').AsString;
    vEmailLogin := FieldByName('EmailLogin').AsString;
    vEmailPassword := FieldByName('EmailPassword').AsString;
    vEmailPort := FieldByName('EmailPort').AsInteger;
    vEmailAuthType := FieldByName('EmailAuthType').AsInteger;
    vEmailTLSType := FieldByName('EmailTLSType').AsInteger;
    vEmailName := FieldByName('EmailName').AsString;
    vEmailCharset := FieldByName('EmailCharset').AsString;
    vEmailFrom := FieldByName('FromEmail').AsString;
    vEMailCollection := FieldByName('EMailCollection').AsString;
    vEMailPreview := FieldByName('EMailPreview').AsInteger;
    vEMailPreviewClient := FieldByName('EMailPreviewClient').AsInteger;
    vEMailNotification := FieldByName('EMailNotification').AsInteger;
    vEMailJPGQuality := FieldByName('EMailJPGQuality').AsInteger;
    vEMailJPGRes := FieldByName('EMailJPGRes').AsInteger;

    vIDSignalTypeLead := FieldByName('ID_SignalTypeLead').AsInteger;
    vIDStatusTypeLead := FieldByName('ID_StatusTypeLead').AsInteger;
    vIDSourceTypeLead := FieldByName('ID_SourceTypeLead').AsInteger;
    vIDSignalTypeRequest := FieldByName('ID_SignalTypeRequest').AsInteger;
    vIDStatusTypeRequest := FieldByName('ID_StatusTypeRequest').AsInteger;
    vIDSourceTypeRequest := FieldByName('ID_SourceTypeRequest').AsInteger;
    vIDStatusTypeCancel := FieldByName('ID_StatusTypeCancel').AsInteger;
    vOurWorkTime := FieldByName('OurWorkTime').AsInteger;
    vSMSServiceLogin := FieldByName('SMSServiceLogin').AsString;
    vSMSServicePassword := FieldByName('SMSServicePassword').AsString;
    vSMSServiceSender := FieldByName('SMSServiceSender').AsString;

    vIDPaymentFormYoomoney := FieldByName('ID_PaymentFormYoomoney').AsInteger;
    vYoomoneyShopID := FieldByName('YoomoneyShopID').AsString;
    vYoomoneyKey := FieldByName('YoomoneyKey').AsString;

    vMaxDiscount := FieldByName('MaxDiscount').AsInteger;

    vMasterLicFileLink := FieldByName('MasterLicFileLink').AsString;
    vMasterCoordTelegram := FieldByName('MasterCoordTelegram').AsString;
    vMasterCoordPhone  := FieldByName('MasterCoordPhone').AsString;
    vIDStatusMasterConfirmArea := FieldByName('ID_StatusMasterConfirmArea').AsInteger;
    vIDStatusMasterButtonAcceptOrder := FieldByName('ID_StatusMasterButtonAcceptOrder').AsInteger;
    vIDStatusMasterButtonCancelOrder := FieldByName('ID_StatusMasterButtonCancelOrder').AsInteger;
    vIDSignalMasterCancelOrder := FieldByName('ID_SignalMasterCancelOrder').AsInteger;
    vIDStatusMasterButtonOnTime := FieldByName('ID_StatusMasterButtonOnTime').AsInteger;
    vIDStatusMasterButtonLateOrder := FieldByName('ID_StatusMasterButtonLateOrder').AsInteger;
    vIDSignalMasterLaterOrder := FieldByName('ID_SignalMasterLaterOrder').AsInteger;
    vIDStatusMasterButtonCameOrder := FieldByName('ID_StatusMasterButtonCameOrder').AsInteger;
    vIDStatusMasterButtonStartWork := FieldByName('ID_StatusMasterButtonStartWork').AsInteger;
    vIDStatusMasterButtonSendPay := FieldByName('ID_StatusMasterButtonSendPay').AsInteger;
    vIDStatusMasterButtonClientPaid := FieldByName('ID_StatusMasterButtonClientPaid').AsInteger;
    vIDStatusMasterButtonFinishOrder := FieldByName('ID_StatusMasterButtonFinishOrder').AsInteger;
  end;
  HideWaiting;

  Result :=
    EditEnterpriseParams(
      vName,
      vShortName,
      vMasterName,
      vMasterPost,
      vAddress,
      vPhone,
      vEMail,
      vWEBSite,
      vAPIKeyDadata, vSecretKeyDadata,

      vWorkDay, vWorkTime,
      vOldOrderTime, vCheckUpdateTime, vNotificationTIme,
      vWorkPeriodStart, vWorkPeriodEnd,
      vUpdateURL,

      vFileServerType,
      vFileServerHost, vFileServerDir, vFileServerUser, vFileServerPassword,
      vFileServerPort,

      vPhotoWidth, vPhotoHeight,

      vEmailHost,
      vEmailLogin,
      vEmailPassword,
      vEmailPort,
      vEmailAuthType,
      vEmailTLSType,
      vEmailName,
      vEmailCharset,
      vEmailFrom,
      vEMailCollection,
      vEMailPreview,
      vEMailPreviewClient,
      vEMailNotification,
      vEMailJPGQuality,
      vEMailJPGRes,

      vIDSignalTypeLead, vIDStatusTypeLead, vIDSourceTypeLead,
      vIDSignalTypeRequest, vIDStatusTypeRequest, vIDSourceTypeRequest,

      vIDStatusTypeCancel, vOurWorkTime,
      vSMSServiceLogin, vSMSServicePassword, vSMSServiceSender,

      vIDPaymentFormYoomoney, vYoomoneyShopID, vYoomoneyKey,

      vMaxDiscount,

      vMasterLicFileLink, vMasterCoordTelegram, vMasterCoordPhone,
      vIDStatusMasterConfirmArea, vIDStatusMasterButtonAcceptOrder, vIDStatusMasterButtonCancelOrder,
      vIDSignalMasterCancelOrder, vIDStatusMasterButtonOnTime, vIDStatusMasterButtonLateOrder,
      vIDSignalMasterLaterOrder, vIDStatusMasterButtonCameOrder, vIDStatusMasterButtonStartWork,
      vIDStatusMasterButtonSendPay, vIDStatusMasterButtonClientPaid, vIDStatusMasterButtonFinishOrder

      );
  if Result then
    with Datas.tEnterprise do
    begin
      ShowWaiting(cDataUpdating);
      try

        Edit;

        //����������
        FieldByName('Name').AsString := vName;
        FieldByName('ShortName').AsString := vShortName;
        FieldByName('MasterName').AsString := vMasterName;
        FieldByName('MasterPost').AsString := vMasterPost;
        FieldByName('Address').AsString := vAddress;
        FieldByName('Phone').AsString := vPhone;
        FieldByName('EMail').AsString := vEMail;
        FieldByName('WEBSite').AsString := vWEBSite;
        FieldByName('APIKeyDadata').AsString := vAPIKeyDadata;
        FieldByName('SecretKeyDadata').AsString := vSecretKeyDadata;

        //�����
        FieldByName('WorkDay').AsString := vWorkDay;
        FieldByName('WorkTime').AsString := vWorkTime;
        FieldByName('OldOrderTime').AsInteger := vOldOrderTime;
        FieldByName('CheckUpdateTime').AsInteger := vCheckUpdateTime;
        FieldByName('NotificationTIme').AsInteger := vNotificationTIme;
        FieldByName('UpdateURL').AsString := vUpdateURL;

        //���� ������
        FieldByName('WorkPeriodStart').AsDateTime := vWorkPeriodStart;
        FieldByName('WorkPeriodEnd').AsDateTime := vWorkPeriodEnd;

        //�������� ������
        FieldByname('FileServerType').AsInteger := vFileServerType;
        FieldByname('FileServerHost').AsString := vFileServerHost;
        FieldByname('FileServerDir').AsString := vFileServerDir;
        FieldByname('FileServerUser').AsString := vFileServerUser;
        FieldByname('FileServerPassword').AsString := vFileServerPassword;
        FieldByname('FileServerPort').AsInteger := vFileServerPort;

        //����
        FieldByname('PhotoWidth').AsInteger := vPhotoWidth;
        FieldByname('PhotoHeight').AsInteger := vPhotoHeight;

        //����������� �����
        FieldByName('EmailHost').AsString := vEmailHost;
        FieldByName('EmailLogin').AsString := vEmailLogin;
        FieldByName('EmailPassword').AsString := vEmailPassword;
        FieldByName('EmailPort').AsInteger := vEmailPort;
        FieldByName('EmailAuthType').AsInteger := vEmailAuthType;
        FieldByName('EmailTLSType').AsInteger := vEmailTLSType;
        FieldByName('EmailName').AsString := vEmailName;
        FieldByName('EmailCharset').AsString := vEmailCharset;
        FieldByName('FromEmail').AsString := vEmailFrom;
        FieldByName('EMailCollection').AsString := vEMailCollection;
        FieldByName('EMailPreview').AsInteger := vEMailPreview;
        FieldByName('EMailPreviewClient').AsInteger := vEMailPreviewClient;
        FieldByName('EMailNotification').AsInteger := vEMailNotification;

        FieldByName('EMailJPGQuality').AsInteger := vEMailJPGQuality;
        FieldByName('EMailJPGRes').AsInteger := vEMailJPGRes;

        FieldByName('ID_SignalTypeLead').AsInteger := vIDSignalTypeLead;
        FieldByName('ID_StatusTypeLead').AsInteger := vIDStatusTypeLead;
        FieldByName('ID_SourceTypeLead').AsInteger := vIDSourceTypeLead;
        FieldByName('ID_SignalTypeRequest').AsInteger := vIDSignalTypeRequest;
        FieldByName('ID_StatusTypeRequest').AsInteger := vIDStatusTypeRequest;
        FieldByName('ID_SourceTypeRequest').AsInteger := vIDSourceTypeRequest;
        FieldByName('ID_StatusTypeCancel').AsInteger := vIDStatusTypeCancel;
        FieldByName('OurWorkTime').AsInteger := vOurWorkTime;

        //��� ���������
        FieldByName('SMSServiceLogin').AsString := vSMSServiceLogin;
        FieldByName('SMSServicePassword').AsString := vSMSServicePassword;
        FieldByName('SMSServiceSender').AsString := vSMSServiceSender;

        FieldByName('ID_PaymentFormYoomoney').AsInteger := vIDPaymentFormYoomoney;
        FieldByName('YoomoneyShopID').AsString := vYoomoneyShopID;
        FieldByName('YoomoneyKey').AsString := vYoomoneyKey;

        FieldByName('MaxDiscount').AsInteger := vMaxDiscount;

        FieldByName('MasterLicFileLink').AsString := vMasterLicFileLink;
        FieldByName('MasterCoordTelegram').AsString := vMasterCoordTelegram;
        FieldByName('MasterCoordPhone').AsString :=  vMasterCoordPhone;
        FieldByName('ID_StatusMasterConfirmArea').AsInteger := vIDStatusMasterConfirmArea;
        FieldByName('ID_StatusMasterButtonAcceptOrder').AsInteger := vIDStatusMasterButtonAcceptOrder;
        FieldByName('ID_StatusMasterButtonCancelOrder').AsInteger := vIDStatusMasterButtonCancelOrder;
        FieldByName('ID_SignalMasterCancelOrder').AsInteger := vIDSignalMasterCancelOrder;
        FieldByName('ID_StatusMasterButtonOnTime').AsInteger := vIDStatusMasterButtonOnTime;
        FieldByName('ID_StatusMasterButtonLateOrder').AsInteger := vIDStatusMasterButtonLateOrder;
        FieldByName('ID_SignalMasterLaterOrder').AsInteger := vIDSignalMasterLaterOrder;
        FieldByName('ID_StatusMasterButtonCameOrder').AsInteger := vIDStatusMasterButtonCameOrder;
        FieldByName('ID_StatusMasterButtonStartWork').AsInteger := vIDStatusMasterButtonStartWork;
        FieldByName('ID_StatusMasterButtonSendPay').AsInteger := vIDStatusMasterButtonSendPay;
        FieldByName('ID_StatusMasterButtonClientPaid').AsInteger := vIDStatusMasterButtonClientPaid;
        FieldByName('ID_StatusMasterButtonFinishOrder').AsInteger := vIDStatusMasterButtonFinishOrder;

        Post;
//        Datas.ZConnection.Commit;
        HideWaiting;
      Except
        on e : exception do
        begin
//          Datas.ZConnection.Rollback;
          Datas.tEnterprise.Cancel;
          HideWaiting;
          ShowMsg('�� ����� ���������� ������ ��������� ������'#13#10+E.Message, smtError, [smbOK], smbOK, smbOK);
        end;
      end;

      EntName := FieldByName('Name').AsString;
      EntShortName := FieldByName('ShortName').AsString;

      WorkDay := FieldByName('WorkDay').AsString;
      WorkTime := FieldByName('WorkTime').AsString;

      WorkMonth := FieldByName('WorkMonth').AsString;

      Datas.ReadExportOptions;
    end;
end;

{ �������� ������� ������� ����� }
function EditWorkMonth : boolean;
  var
    vMonth : string;
begin
  with Datas.tEnterprise do
    vMonth := FieldByName('WorkMonth').AsString;
  Result := EditMonth(vMonth, '��������� �������� ������', 659900);
  if Result then
    with Datas.tEnterprise do
    begin
      Edit;
      FieldByName('WorkMonth').AsString := vMonth;
      Post;
      WorkMonth := vMonth;
    end;
end;

{ �������� ������ }
function CloseMonth : boolean;
begin
  Result := true;
  if Result then
    with Datas.tEnterprise do
    begin
      Edit;
      FieldByName('WorkMonth').AsString := IncWorkMonth(WorkMonth);
      Post;
      WorkMonth := FieldByName('WorkMonth').AsString;
    end;
end;

{ ������� ������� ����� }
procedure OpenReadyReport3(AParentAction : TAction; AFileName : string);
begin
  with Datas.frxReport do
  begin
    PreviewPages.LoadFromFile(AFileName);

    ReportPreview(Datas.frxReport, AFileName, AParentAction);
  end
end;

{ TDatas }
procedure TDatas.AlertWindowManagerClick(Sender: TObject;
  AAlertWindow: TdxAlertWindow);
  var
    vOpenUser : string;
    vIDOL, vIDN, vIDU : integer;
    i : integer;
begin
  if IsInteger(AAlertWindow.Hint) then
    vIDOL := StrToInt(AAlertWindow.Hint)
  else
    vIDOL := 0;

  vIDN := AAlertWindow.Tag;

  Application.Restore;
  if MainForm.WindowState = wsMinimized then ShowWindow(Application.Handle, SW_MAXIMIZE);// WindowState := wsNormal;
  SetForegroundWindow(Application.Handle);

  Application.RestoreTopMosts;

  if vIDOL = 0 then ShowMsg('� ����������� ��� ���������� � ������', smtInformation, [smbOK], smbOK, smbOK, 3)
  else
    if Assigned(MainForm.ActiveMDIChild) and (MainForm.ActiveMDIChild is TOrderListForm)then
    begin
      for i := 0 to Screen.FormCount - 1 do
        if fsModal in Screen.Forms[i].FormState then
        begin
          ShowMsg('����� ������� ��� ���������� ����', smtInformation, [smbOK], smbOK, smbOK, 3);
          Exit;
        end;

        //������� ���� ������� � ������� ��� �������, ���� ������ �����
        with TOrderListForm(MainForm.ActiveMDIChild) do
        begin
          if not Query.Locate('ID', vIDOL, []) then
            ShowMsg('����� �' + IntToStr(vIDOL) + ' �� ������ � ������ �������!', smtInformation, [smbOK], smbOK, smbOK, 3)
          else
          begin
            if Query.FieldByName('OrderCategory').AsInteger = 0 then PageControl.ActivePageIndex := 2
            else PageControl.ActivePageIndex := 1;

            if aEdit.Enabled then
            begin
              if vIDN = 0 then aEdit.Execute
              else
              begin
                //���������, ���� �� ������� ������� ������������
                vIDU := IsNUll(Datas.ReadValues('notification', 'ID_UserOpen', vIDN)[0], 0);
                if vIDU = 0 then
                begin
                  //���� ������������� ���� ����� �� ������ � ���������� ����
                  Datas.WriteValues('notification', 'ID_UserOpen;OpenTIme', VarArrayOf([UserID, ServerTime]), vIDN);

                  aEdit.Execute;
                end
                else
                  if vIDU = UserID then aEdit.Execute
                  else
                  begin
                    vOpenUser := IfNull(Datas.ReadValuesSQL('select userinfo(' + IntToStr(vIDU) + ') as UInfo', 'UInfo')[0], '');
                    ShowMsg('����������� ������ �������� ' + vOpenUser, smtInformation, [smbOK], smbOK, smbOK, 3);
                  end;
              end;
            end;
          end;
        end;
    end
    else
    begin
      ShowMsg('������ ���� �������� ���� ������ �������', smtInformation, [smbOK], smbOK, smbOK, 3);
    end;
end;

procedure TDatas.AlertWindowManagerCustomDrawBackground(Sender: TObject;
  AAlertWindow: TdxAlertWindow; ACanvas: TcxCanvas;
  AViewInfo: TdxAlertWindowViewInfo; var ADone: Boolean);
  var
    vRect : TRect;
begin
  vRect.Left := 0;
  vRect.Top := 0;
  vRect.Right := TForm(AAlertWindow).Width;
  vRect.Bottom := TForm(AAlertWindow).Height;
  ACanvas.FillRect(vRect, AAlertWindow.Color);

  ADone := true;
end;

function TDatas.Autorise(ALogin, APassword: string): integer;
  var
    s, p : string;
begin
  ShowWaiting('����������� ...');
  try

    if not qEmployees.Active then qEmployees.Open;

//    ShowDatasetModal(qEmployees);

    if not qEmployees.Locate('Login', ALogin, [loCaseInsensitive])  then Result := 1
    else
    begin
      s := GetHashStr(APassword);
      p := qEmployees.FieldByName('Password').AsString;
      if p <> s then Result := 3
      else
      begin
        UserName := qEmployees.FieldByName('Surname').AsString + ' ' +
                     Copy(qEmployees.FieldByName('Name').AsString, 1, 1) + '.';
        if qEmployees.FieldByName('Patro').AsString <> '' then
          UserName := UserName + ' ' + Copy(qEmployees.FieldByName('Patro').AsString, 1, 1) + '.';
        UserPermTool.Text := qEmployees.FieldByName('PermTool').AsString;
        UserID := qEmployees.FieldByName('ID').AsInteger;

        Result := 0;
      end;
    end;
  finally
    HideWaiting;
  end;
end;

function TDatas.CheckConsts: boolean;
  var
    i, n : integer;
    s : string;
begin
  qConsts.Open;
  n := 0;
  for i := 0 to StrConst.Strings.Count - 1 do
  begin
    s := StrConst.Strings[i];
    if qConsts.Locate('Constname', s, []) then n := n + 1;
  end;
  qConsts.Close;

  Result := StrConst.Strings.Count = n;
end;

function TDatas.ClientVersionCheck(var AAppVersion,
  ADBVersion: string): boolean;
  var
    vDoCheck : boolean;
begin
  AAppVersion := AppVerInfo.FileVersion;
  vDoCheck := cDoCheck;
  with tEnterprise do
  begin
    Open;
    ADBVersion := FieldByName('ClientVersion').AsString;
    Close;
  end;
  Result :=
    not vDoCheck or (GetMainVersion(AAppVersion) = GetMainVersion(ADBVersion));
end;

procedure TDatas.CloseDatabase;
begin
  tEnterprise.Close;
  qEmployees.Close;
  tClientList.Close;

  if ZConnection.Connected then ZConnection.Disconnect;
end;

function TDatas.CloseScanner : boolean;
begin
  if ComPort.Opened then
    ComPort.CloseDevice;
  Result := True;
end;

function TDatas.ConnectionString: string;
begin
  with Datas.ZConnection do
  begin
    Result := Result + 'hostname=' + Hostname + ';';
    Result := Result + 'database=' + Database + ';';
    Result := Result + 'protocol=' + Protocol + ';';
    Result := Result + 'port=' + IntToStr(Port) + ';';
    Result := Result + 'user=' + User + ';';
    Result := Result + 'password=' + Password + ';';
    Result := Result + 'properties="' + Properties.DelimitedText + '";';
  end;
end;

function TDatas.ConnectToDatabase(AZConnection : TZConnection; var AHost, ADatabase, AUser, APassword, AProtocol, APort, AParams : string): boolean;
begin
  repeat
    if AZConnection.Connected then AZConnection.Connected := false;

    if (Trim(AHost) <> '') and (Trim(ADatabase) <> '') and (Trim(AUser) <> '') and (Trim(AProtocol) <> '') and (Trim(APort) <> '') then
    begin

      Result := true;
      try
        ShowWaiting(cServerConnecting);
        AZConnection.HostName := AHost;
        AZConnection.Database := ADatabase;
        AZConnection.User := AUser;
        AZConnection.Password := APassword;
        AZConnection.Protocol := AProtocol;
        AZConnection.Port := StrToInt(APort);
        AZConnection.Properties.Delimiter := ';';
        AZConnection.Properties.StrictDelimiter := true;
        AZConnection.Properties.DelimitedText := AParams;
        AZConnection.Connected := true;
        HideWaiting;
      except
        HideWaiting;
        Result := false;
      end;

      if not Result then
      begin
        AZConnection.Connected := false;
        ShowMsg(cCannotConnectServer, smtInformation, [smbOK], smbOK, smbOK);
      end;
    end
    else
    begin
      ShowMsg(cNotSpecDatabaseParams, smtInformation, [smbOK], smbOK, smbOK);
      Result := false;
    end;
  until Result or not ConnectParams(AHost, ADatabase, AUser, APassword, AProtocol, APort, AParams);
end;

procedure TDatas.DataModuleCreate(Sender: TObject);
begin
  FProc := nil;
end;

procedure TDatas.DefaultProc(Sender: TObject; const Received: Cardinal);
  var
    s : string;
begin
  Sleep(ScanTimeOut);
  if Assigned(FProc) then FProc(Sender, Received)
  else
    if Received <> 0 then
      if ComPort.ReadString(s) then
        ShowMsg('������ ��������: "' + s + '"', smtInformation, [smbOK], smbOK, smbOK);
end;

procedure TDatas.frxReportProgress(Sender: TfrxReport;
  ProgressType: TfrxProgressType; Progress: Integer);
begin
  if (ProgressType = ptRunning) and not FStartReport then
  begin
    FStartReport := true;
    StartTime := Now;
  end;
end;

function TDatas.GetUpdateURL: string;
begin
  with tEnterprise do
  begin
    Open;
    Result := FieldByName('UpdateURL').AsString;
    Close;
  end;
end;

procedure TDatas.OpenDatabase;
  var
    vServer, vDatabase, vDatabaseClient, vDBUser, vDBPassword, vProtocol, vPort, vParams : string;
    vAppVersion, vDBVersion : string;
    vEnterInfo : boolean;
    v : variant;
begin
  vServer := Server;
  vDatabase := Database;
  vDBUser := User;
  vDBPassword := Password;
  vProtocol := Protocol;
  vPort := Port;
  vParams := Params;

  if GetEnterInfo(vLogin, vPassword) then
  begin
    ConnectToDatabase(ZConnection, Server, Database, User, Password, Protocol, Port, Params);

    if not ZConnection.Connected then
    begin
      ShowMsg('�� ������� ������� ������� ���� ������.'#10#13 +
              '������ � ������� ����������.', smtInformation, [smbOK], smbOK, smbOK);
      AutoriseError := -1;
      Exit;
    end;
    UpdateURL := '';
    try
      UpdateURL := GetUpdateURL;
    except
    end;
    if not ClientVersionCheck(vAppVersion, vDBVersion) then
    begin
      ShowMsg('������ "' + vAppVersion + '" ����������� ���������� �����������.'#10#13 +
              '������ � ����� ������ �������� ��� ������� ������ "' + vDBVersion + '"', smtInformation, [smbOK], smbOK, smbOK);
      AutoriseError := 100;
      ZConnection.Connected := false;
      Exit;
    end;
    //�������������� ���������
    if not CheckConsts then
    begin
      ShowMsg('�������� ��������� ������� ��������.'#13#10 +
              '��������� ����������� ����� ����������� ��������.', smtWarning, [smbOK], smbOK, smbOK);
    end;

    //���� ���������� ��������� ����������, �� �������� ��
    if
      (vServer <> Server) or
      (vDatabase <> Database) or
      (vDBUser <> User) or
      (vDBPassword <> Password) or
      (vProtocol <> Protocol) or
      (vPort <> Port) or
      (vParams <> Params)
      then
      SaveOptions;

    //�����������
    AutoriseError := Autorise(vLogin, vPassword);

    if AutoriseError <> 0 then
    begin
      //������ � ����, ���� ������ �� �� ��������� ������
      if (Trim(ParamValue('plugin')) <> '') and (Trim(ParamValue('command')) <> '') then
        WritePluginLog('�������� ��� ��� ������ ������������!')
      else
      repeat
        ShowMsg('�������� ��� ��� ������ ������������!', smtError, [smbOK], smbOK, smbOK);
        vEnterInfo := GetEnterInfo(vLogin, vPassword, false);
        if vEnterInfo then AutoriseError := Autorise(vLogin, vPassword);
      until not vEnterInfo or (AutoriseError = 0);

      HideWaiting;

      if not vEnterInfo or (AutoriseError <> 0) then
      begin
        ZConnection.Disconnect;
        Exit;
      end;
    end;

    with tEnterprise do
    begin
      Open;

      EntName := FieldByName('Name').AsString;
      EntShortName := FieldByName('ShortName').AsString;

      WorkDay := FieldByname('WorkDay').AsString;
      if Length(WorkDay) <> 7 then WorkDay := cDefaultWorkDay;

      WorkTime := FieldByname('WorkTime').AsString;
      if Not IsWorkTime(WorkTime) then WorkTime := cDefaultWorkTime;

      WorkMonth := FieldByName('WorkMonth').AsString;

      if not IsWorkmonth(WorkMonth) then
      begin
        Edit;
        FieldByName('WorkMonth').AsString := GetWorkmonth(Date);
        Post;
        WorkMonth := FieldByName('WorkMonth').AsString;
      end;

      //���������� ������� ��������� ����������� (��� ��������� ����������� � �.�.)
      SaveLastEnterTime;

      ReadExportOptions;

      tClientList.Open;
    end;
  end
  else
  begin
    { ������ ����������� }
    AutoriseError := 3;
    HideWaiting;
    ZConnection.Disconnect;
    Exit;
  end
end;

function TDatas.OpenScanner : boolean;
begin
  if ComPort.Opened then ComPort.CloseDevice;

  ComPort.DeviceName := ComPortName;
  ComPort.BaudValue := BaudRate;

  Result := UseBarcodeScanner and (ComPortName <> '') and ComPort.OpenDevice;
end;

{ ������� ���������� �� ������ ��������� � ������ �� ����� }
function CopyRecord(AFrom, ATo : TDataset) : boolean;
  var
    n, i : integer;
    s : string;
    vToField, vFromField : TField;
begin
  try
    with AFrom.Fields do
    begin
      n := Count;
      for i := 0 to n - 1 do
      begin
        vFromField := Fields[i];
        s := vFromField.FieldName;
        vToField := ATo.FieldByName(s);
        if (vToField <> nil) and not vToField.ReadOnly then
          vToField.Value := vFromField.Value;
      end;
    end;
    Result := true;
  except
    Result := false;
  end;
end;

{ ������� ���������� �� ������ ��������� � ������ �� ����� }
function CopyRecord(AFrom, ATo : TDataset; AExcludeFields : string; AUseFromFields : boolean) : boolean; overload;
  var
    n, i : integer;
    s : string;
    vToField, vFromField : TField;
    vStringList : TStringList;
begin
  if AUseFromFields then Result := CopyREcord(AFrom, ATo, AExcludeFields)
  else
  begin
    try
      vStringList := TStringList.Create;
      vStringList.Delimiter := ';';
      vStringList.DelimitedText := AnsiLowerCase(AExcludeFields);
      try
        with ATo.Fields do
          begin
            n := Count;
            for i := 0 to n - 1 do
            begin
              vToField := Fields[i];
              s := vToField.FieldName;
              if vStringList.IndexOf(s) = -1 then
              begin
                vFromField := AFrom.FieldByName(s);
                if (vFromField <> nil) and not vToField.ReadOnly then
                  vToField.Value := vFromField.Value;
              end;
            end;
          end;
        Result := true;
      finally
        vStringList.Free;
      end;
    except
      on E: Exception do
      begin
        Result := false;
        ShowMsg(E.Message, smtError);
      end;
    end;
  end;
end;

{ ������� ���������� �� ������ ��������� � ������ �� ����� � ������������ ����� ����� � ������� }
function CopyRecord(AFrom, ATo : TDataset; AExcludeFields : string) : boolean; overload;
  var
    n, i : integer;
    s : string;
    vToField, vFromField : TField;
    vStringList : TStringList;
begin
  try
    vStringList := TStringList.Create;
    vStringList.Delimiter := ';';
    vStringList.DelimitedText := AnsiLowerCase(AExcludeFields);

    try

      with AFrom.Fields do
      begin
        n := Count;
        for i := 0 to n - 1 do
        begin
          vFromField := Fields[i];
          s := AnsiLowerCase(vFromField.FieldName);
          if vStringList.IndexOf(s) = -1 then
          begin
            vToField := ATo.FieldByName(s);
            if (vToField <> nil) and not vToField.ReadOnly then
              vToField.Value := vFromField.Value;
          end;
        end;
      end;

      Result := true;
    finally
      vStringList.Free;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      ShowMsg(E.Message, smtError);
    end;
  end;
end;

{ ��������� ������ �������� ������������ }
function ChangePassword : boolean;
  var
    vOld, vNew, s : string;
begin
  Result := false;
  if ChangePasswordDialog(vOld, vNew) then
    with Datas.tUser do
    begin
      Open;
      if Locate('Login', vLogin, [loCaseInsensitive]) then
      begin
        s := FieldByName('Password').AsString;
        if s <> GetHashStr(vOld) then ShowMsg('������� ������ ������ ������!', smtError, [smbOK], smbOK, smbOK)
        else
        begin
          s := GetHashStr(vNew);
          Edit;
          FieldByName('Password').AsString := s;
          Post;
          Result := true;
        end;
      end;
      Close;
    end;
end;

//��������� ������� �������
function GetServerTime(var ADate : TDate; var ATime : TTime) : boolean;
  var
    vNow : TDateTime;
begin
  with Datas.qServerTime do
  begin
    if Active then Close;
    Open;
    vNow := FieldByName('ST').AsDateTime;
    ADate := DateOf(vNow);
    ATime := TimeOf(vNow);
    Close;
    Result := true;
  end;
end;

//��������� ������� �������
function ServerTime : TDateTime;
begin
  with Datas.qServerTime do
  begin
    if Active then Close;
    Open;
    Result := FieldByName('ST').AsDateTime;
    Close;
  end;
end;

//��������� ��������� ����������� ����
function GetIDEmployee(AIDRequest : integer; var AIDEmployee : integer) : boolean;
begin
  try
    AIDEmployee :=
      IsNull(
        Datas.ReadValuesSQL('select ID_Employee from Request where ID = ' + IntToStr(AIDRequest), 'ID_Employee')[0]
      ,0);
    Result := true;
  except
    Result := false;
  end;
end;

// ������� ������ ��������� ����
function GetBooleanText(AField : TField; ATrueText, AFalseText : string) : string;
begin
  with AField do
    if Dataset.Active and (Dataset.RecordCount > 0) then
      if AsInteger = 1 then Result := ATrueText
      else Result := AFalseText
    else Result := '';
end;

//�������� ������
function DeleteRec(ATableName : string; AID : integer; AShowWaiting : boolean = true) : boolean;
begin
  with TZQuery.Create(nil) do
  try
    Connection := Datas.ZConnection;
    SQL.Add('update ' + ATableName + ' set Deleted = 1, Active = 0 where ID = ' + IntToStr(AID));
    if AShowWaiting then ShowWaiting(cDataDeleting);
    Result := False;
    try
      ExecSQL;
      Result := True;
    finally
      if AShowWaiting then HideWaiting;
    end;
  finally
    Free;
  end;
end;

//�������� ������ �������
function DeleteRecSimple(ATableName : string; AID : integer; AShowWaiting : boolean = true) : boolean;
begin
  with TZQuery.Create(nil) do
  try
    Connection := Datas.ZConnection;
    SQL.Add('delete from ' + ATableName + ' where ID = ' + IntToStr(AID));
    if AShowWaiting then ShowWaiting(cDataDeleting);
    Result := False;
    try
      ExecSQL;
      Result := True;
    finally
      if AShowWaiting then HideWaiting;
    end;
  finally
    Free;
  end;
end;

//���������� ������
function EditRecord(ATableName : string; AID : integer; AFieldNames : array of string; AValues : array of const) : boolean;
  var
    i : integer;
    s : string;
begin
  Result := false;
  if Length(AFieldNames) <> Length(AValues) then Exit;
  with TZQuery.Create(nil) do
  try
    Connection := Datas.ZConnection;
    SQL.Add('update ' + ATableName);
    SQL.Add('Set');
    for i := 1 to Length(AFieldNames) do
    begin
      s := '  ' + AFieldNames[i - 1] + ' = ''' + AValues[i - 1].VPChar + '''';
      if i <> Length(AFieldNames) then
        s := s + ',';
      SQL.Add(s);
    end;
    SQL.Add('where ID = ' + IntToStr(AID));
    ShowWaiting(cDataUpdating);
    Result := false;
    try
      ExecSQL;
      Result := true;
    finally
      HideWaiting;
    end;
  finally
    Free;
  end;
end;

//��������� ����� ������ FastReport
function EditReport3(ATitle, AFileName : string; AForm : TMemoryStream) : boolean;
begin
  Result := true;

  with TFrxReport.Create(Application) do
    try
      try
        FileName := cABSDotDir + AFileName + '.fr3';
        StoreInDFM := true;
        AForm.Position := 0;
        Clear;
        If AForm.Size>0
          Then
            LoadFromStream(AForm);
        DesignReport;
        AForm.Clear;
        AForm.Position := 0;
        SaveToStream(AForm);
        Clear;
      except
        on E:Exception do
        begin
          ShowMsg(E.Message, smtError, [smbOK], smbOK, smbOK);
          Result := false;
        end
      end;
    finally
      Free;
    end;
end;

//���������� ������ FastReport
function CreateReport3(AParentAction : TAction; AForm : TStream; ACaption : string; AShowProgress : boolean = true) : boolean;
  var
    vNow : TDateTime;
    vMS : Int64;
    vReport : TfrxReport;
begin
  Result := false;
  if AForm.Size = 0 then
  begin
    ShowMsg('���������� ������ ��������, �.�. �� ������ ������!', smtWarning);
    Exit;
  end;

  ReportFileName := '';

  vReport := TfrxReport.Create(Application);
  With vReport Do
  Try
    Datas.FStartReport := false;
    OnProgress := Datas.frxReportProgress;

    PreviewOptions.ZoomMode := zmDefault;
    OldStyleProgress := true;
    StoreInDFM := true;
    ShowProgress := AShowProgress;
    AForm.Position := 0;

    LoadFromStream(AForm);

    Result := PrepareReport;

    if Result and ReportCreateTime then
    begin
      vNow := Now;
      vMS := MilliSecondsBetween(vNow, StartTime);
      ReportTime := MSecsToTime(vMS);

      ShowMsg('����� ������� ��������.'#13#10 +
              '����� ���������� - ' + FormatDateTime('hh:nn:ss.zzz', ReportTime), smtInformation, [smbOK], smbOK, smbOK);
    end;

    if Result then
      ReportPreview(vReport, ACaption, AParentAction);
    Clear;
  Finally
    Free
  End;
end;

//��������� ������������ ������
function PrepareReport(AIDReport : integer; AShowWaiting : boolean = true) : TFRXReport;
  var
    vID : integer;
    vData : TStringStream;
    s : string;
    vOK : boolean;
    vReport : TfrxReport;
begin
  if AShowWaiting then ShowWaiting('������������ ������...');
  try
    Datas.qReport.Close;
    Datas.qReport.ParamByName('ID').AsInteger := AIDReport;
    Datas.qReport.Open;

    vData := TStringStream.Create;

    TBlobField(Datas.qReport.FieldByName('Data')).SaveToStream(vData);

    Datas.qReport.Close;

    vData.Position := 0;

    vReport := TfrxReport.Create(Application);
    vReport.ShowProgress := false;
    vReport.LoadFromStream(vData);

    vData.Free;

    if vReport.PrepareReport then Result := vReport
    else
    begin
      vReport.Free;
      Result := nil;
    end;
  finally
    HideWaiting;
  end;
end;

function PrepareReport(AReport : TfrxReport; AShowWaiting : boolean = true) : boolean;
begin
  if AShowWaiting then ShowWaiting('������������ ������...');
  try
    AReport.ShowProgress := false;
    try
      Result := AReport.PrepareReport
    except
      Result := false;
    end;
  finally
    HideWaiting;
  end;
end;

//������� ������ � ������ ������
function ExportReport(AFRXReport : TFRXReport; AFileName : string; AShowWaiting : boolean = true) : boolean;
  var
    vExt : string;
    v : variant;
begin
  if AShowWaiting then ShowWaiting('������� ������...');
  try
    vExt := ExtractFileExt(AFileName);
    if (vExt = '') or (vExt = '.fp3') then AFRXReport.PreviewPages.SaveToFile(AFileName)
    else
      if vExt = '.pdf' then
      begin
        Datas.frxPDFExport.ShowDialog := false;
        Datas.frxPDFExport.FileName := AFileName;
        Datas.frxPDFExport.PrintOptimized := true;
        try
          Result := AFRXReport.Export(Datas.frxPDFExport);
        finally
          Datas.frxPDFExport.ShowDialog := true;
        end;
      end
      else
        if vExt = '.jpg' then
        begin
          v := Datas.ReadOptions('EMailJPGQuality;EMailJPGRes');
          Datas.frxJPEGExport.JPEGQuality := IsNull(v[0], 100);
          Datas.frxJPEGExport.Resolution := IsNull(v[1], 200);
          Datas.frxJPEGExport.ShowDialog := false;
          Datas.frxJPEGExport.FileName := AFileName;
          Datas.frxJPEGExport.SeparateFiles := false;
          try
            Result := AFRXReport.Export(Datas.frxJPEGExport);
          finally
            Datas.frxJPEGExport.ShowDialog := true;
          end;
        end
        else
        begin
          AFRXReport.PreviewPages.SaveToFile(AFileName);
          Result := true;
        end;
  finally
    HideWaiting;
  end;
end;

//�������� ����
function IsWeekend(ADate : TDate) : boolean;
  var
    vDW : integer;
begin
  vDW := DayOfWeek(ADate);
  if vDW = 1 then vDW := 8;
  vDW := vDW - 1;
  Result := WorkDay[vDW] = '0';
end;

//������ ����� DX
procedure PrintGuideGridDX(AGuideName : string; AGrid : TcxGrid);
  var
    AppName : string;
    s : string;
begin
  s := Printer.Printers[Printer.PrinterIndex];
  dxSetDefaultPrinter(PChar(s));

  with Datas.ComponentPrinter do
  begin
    AppName := AppVerInfo.ProductName;
    CurrentLink.Component := AGrid;
//    CurrentLink.PrinterPage.Orientation := TDxPrinterOrientation(Printer.Orientation);
    PrintTitle := AppName + '. ' + AGuideName;
    CurrentLink.ReportTitle.Text := PrintTitle;

    Preview(true, nil);
  end;
end;

//������ ����������� Eh
procedure PrintGuideGridEh(AGuideName : string; ADBGridEh : TDBGridEh);
  var
    AppName : string;
begin
  with Datas.PrintDBGridEh do
  begin
    DBGridEh := ADBGridEh;
    AppName := AppVerInfo.ProductName;
    PageHeader.LeftText.Text := AGuideName;
    PageHeader.RightText.Text := AppName + '. ' + AGuideName;
    PageFooter.LeftText.Text := '&[DATE]. &[TIME]';
    PageFooter.RightText.Text := '���. &[PAGE] �� &[PAGES]';
    Preview;
  end;
end;

//������ ������ DX
procedure PrintTreeListDX(AGuideName : string; ATree : TcxDBTreeList);
  var
    AppName : string;
    s : string;
begin
  if Datas.PrinterSetupDialog.Execute then
  begin

    s := Printer.Printers[Printer.PrinterIndex];
    dxSetDefaultPrinter(PChar(s));

    with Datas.TreeListPrinter do
    begin
      AppName := AppVerInfo.ProductName;
      CurrentLink.Component := ATree;
      CurrentLink.PrinterPage.Orientation := TDxPrinterOrientation(Printer.Orientation);
      PrintTitle := AppName + '. ' + AGuideName;
      CurrentLink.ReportTitle.Text := PrintTitle;

      Print(false, nil);
    end;
  end;
end;

//���������� �������
procedure ExecSQL(ASQL : string);
begin
  with TZQuery.Create(nil) do
  try
    Connection := Datas.ZConnection;

    SQL.Text := ASQL;

    ExecSQL;
  finally
    Free;
  end;
end;

//��������� �������� �������� 0, 1 �� false, true
function BooleanToInt(AValue : boolean) : integer;
begin
  if AValue then Result := 1
  else Result := 0;
end;

//��������������� ������ � ����������
function IntToBoolean(AValue : integer) : boolean;
begin
  Result := AValue <> 0;
end;

//��������� ������ ������
function GetFastReport3FormVersion(AForm : TStream) : string;
begin
  with TFrxReport.Create(Application) do
    try
      try
        StoreInDFM := true;
        AForm.Position := 0;
        Clear;
        if AForm.Size > 0 then LoadFromStream(AForm);

        if (ReportOptions.VersionMajor + ReportOptions.VersionMinor + ReportOptions.VersionRelease + ReportOptions.VersionBuild) = '' then Result := ''
        else
        begin
          if ReportOptions.VersionMajor = '' then Result := '0'
          else Result := ReportOptions.VersionMajor;

          if ReportOptions.VersionMinor = '' then Result := Result + '.0'
          else Result := Result + '.' + ReportOptions.VersionMinor;

          if ReportOptions.VersionRelease = '' then Result := Result + '.0'
          else Result := Result + '.' + ReportOptions.VersionRelease;

          if ReportOptions.VersionBuild = '' then Result := Result + '.0'
          else Result := Result + '.' + ReportOptions.VersionBuild;
        end;
      except
        Result := '';
      end;
    finally
      Free;
    end;
end;

//������������� ������� �� ������
procedure LocateRecordInView(AView: TcxGridTableView; AID: variant);
begin
  with TcxDBDataController(AView.Datacontroller) do
  begin
    BeginUpdate;
    try
      Filter.Active := false;
      DataSet.Locate('ID', AID, []);
      LocateByKey(AID);
    finally
      EndUpdate;
    end;
  end;
end;

//������ � ������� �� ���� ������� ��������� �����
procedure ReadImportData(ADataset : TDataset; AFields, AValue : string; AQuota : char);
  var
    vStrings, vValues : TStringList;
    i : integer;
    s, v : string;
begin
  vStrings := TStringList.Create;
  vValues := TStringList.Create;
  try
    vStrings.Delimiter := ';';
    vStrings.StrictDelimiter := true;
    vStrings.QuoteChar := AQuota;
    vStrings.DelimitedText := AFields;

    vValues.Delimiter := ';';
    vValues.StrictDelimiter := true;
    vValues.DelimitedText := AValue;

    for i := 0 to vStrings.Count - 1 do
    begin
      s := vStrings[i];
      v := Trim(AnsiDequotedStr(vValues.Values[s], AQuota));
      ADataset.FieldByName(s).AsString := v;
    end;
  finally
    vStrings.Free;
    vValues.Free;
  end;
end;

//������ ����� �� ������ �������� � ������
procedure CopyFields(AFields : string; AFrom, ATo : TDataset);
  var
    vStrings : TStringList;
    i : integer;
    s : string;
begin
  vStrings := TStringList.Create;
  try
    vStrings.Delimiter := ';';
    vStrings.StrictDelimiter := true;
    vStrings.DelimitedText := AFields;
    for i := 0 to vStrings.Count - 1 do
    begin
      s := vStrings[i];
      try
        ATo[s] := AFrom[s];
      except

      end;
    end;
  finally
    vStrings.Free;
  end;
end;

//���������� ��������� �����
function CreateDatabaseBackup(AFileName : string) : integer;
  var
    s, vDumpUtil, vMySQLCharsetDir : string;
    vParams : string;
    vBat : TStringList;
begin
  vDumpUtil := cMySQLDumpUtilPath;
  if ExtractFilePath(vDumpUtil) = '' then
    vDumpUtil := AppDir + vDumpUtil;

  vMySQLCharsetDir := cMySQLCharsetDir;
  if ExtractFilePath(vMySQLCharsetDir) = '' then
    vMySQLCharsetDir := AppDir + vMySQLCharsetDir;

  if not FileExists(vDumpUtil) then Result := -1
  else
    if FileExists(AFileName) then Result := -2
    else
    begin
      vParams := '';

      //���� � ����������� �� ���������
      //vParams := vParams + '--defaults-file="' + cMySQLIniFileName + '"';

      //��������� �����������
      vParams := vParams +
        ' --max_allowed_packet=32M' +
        ' --host=' + UOptions.Server +
        ' --port=' + UOptions.Port +
        ' --user=' + UOptions.User +
        ' --password=' + UOptions.Password;

      //���� � ������ ���������
      vParams := vParams +
        ' --character-sets-dir="' + RemoveBackSlash(vMySQLCharsetDir) +  '"';

      //���� � log-�����
{      vParams := vParams +
        ' --log-error="' + AppDir + cMySQLDir + 'MySQL.log"';}

      //���� � �����-����������
      vParams := vParams +
        ' --result-file="' + AFileName + '"';

      //����� �������� �����
      vParams := vParams +
        ' --databases --complete-insert --disable-keys --quick --routines' +
        ' --triggers --default-character-set=utf8mb4' +
        ' --add-drop-database ' +
        Datas.ZConnection.Database;

      ShowWaiting(cDataBackuping);
      try

        vBat := TStringList.Create;
        try
          s := '"' + vDumpUtil + '" ' + vParams;
          s := StrToOem(s);
          //s := UTF8Encode(s);
          vBat.Add(s);
          vBat.SaveToFile(cABSBackupDir + 'Backup.bat');
        finally
          vBat.Free;
        end;

        FileExecuteWait(cABSBackupDir + 'Backup.bat', '', cABSBackupDir, esHidden);

        Result := 0;

        HideWaiting;

        Sysutils.DeleteFile(cABSBackupDir + 'Backup.bat');

      except
        on E:Exception do
        begin
          Result := -3;
          ShowMsg('�� ����� ���������� ����������� ��������� ������:'#13#10 + E.Message,
                  smtError, [smbOK], smbOK, smbOK);
        end;
      end;
    end;
end;

//�������������� ��������� �����
function RestoreDatabaseBackup(AFileName : string) : integer;
  var
    s,
    vMySQLUtil, vMySQLCharsetDir : string;
    vParams : string;
    vBat : TStringList;
begin
  vMySQLUtil := cMySQLUtilPath;
  if ExtractFilePath(vMySQLUtil) = '' then
    vMySQLUtil := AppDir + vMySQLUtil;

  vMySQLCharsetDir := cMySQLCharsetDir;
  if ExtractFilePath(vMySQLCharsetDir) = '' then
    vMySQLCharsetDir := AppDir + vMySQLCharsetDir;

  if not FileExists(vMySQLUtil) then Result := -1
  else
    if not FileExists(AFileName) then Result := -2
    else
    begin
      vParams := '';

      //���� � ����������� �� ���������
      //vParams := vParams + ' --defaults-file="' + cMySQLIniFileName + '"';

      //���� � ������ ���������
      vParams := vParams +
        ' --character-sets-dir="' + RemoveBackSlash(vMySQLCharsetDir) + '"';

      //��������� �� ���������
      vParams := vParams + ' --default-character-set=utf8mb4';

      //��������� �����������
      vParams := vParams +
        ' --connect_timeout=60' +
        ' --max_allowed_packet=32M' +
        ' --force' +
        ' --host=' + UOptions.Server +
        ' --port=' + UOptions.Port +
        ' --user=' + UOptions.User +
        ' --password=' + UOptions.Password;

      ShowWaiting(cDataRestoring);
      try
        vBat := TStringList.Create;
        try
          s := '"' + StrToOem(vMySQLUtil) + '" ' + UTF8Encode(vParams) + ' < "' + StrToOem(AFileName) + '"';
          //s := StrToOem(s);
          //s := UTF8Encode(s);
          vBat.Add(s);
          vBat.SaveToFile(cABSBackupDir + 'Restore.bat');
        finally
          vBat.Free;
        end;

        FileExecuteWait(cABSBackupDir + 'Restore.bat', '', cABSBackupDir, esHidden);

//        Sysutils.DeleteFile(cABSBackupDir + 'Restore.bat');

        HideWaiting;

        Result := 0;
      except
        on E:Exception do
        begin
          HideWaiting;
          Result := -3;
          ShowMsg('�� ����� �������������� ���� ������ ��������� ������:'#13#10 + E.Message,
                  smtError, [smbOK], smbOK, smbOK);
        end;
      end;
    end;
end;

//�������������� ��������� ����� �� ��������� ������
function RestoreDatabaseBackupCloud(AFileName, AHost, ADatabase, AUser, APassword, AProtocol, APort, AParams : string) : integer;
  var
    s,
    vMySQLUtil : string;
    vParams : string;
    vBat : TStringList;
begin
//  vMySQLUtil := AppDir + cMySQLDir + 'Bin\' + cMySQLUtil;
  vMySQLUtil := cMySQLUtilPath;
  if not FileExists(vMySQLUtil) then Result := -1
  else
    if not FileExists(AFileName) then Result := -2
    else
    begin
      vParams := '';

      //���� � ����������� �� ���������
      //vParams := vParams + ' --defaults-file="' + cMySQLIniFileName + '"';

      //���� � ������ ���������
      vParams := vParams +
        ' --character-sets-dir="' + RemoveBackSlash(cMySQLCharsetDir) + '"';

      //��������� �� ���������
      vParams := vParams + ' --default-character-set=cp1251';

      //��������� �����������
      vParams := vParams +
        ' --connect_timeout=60' +
        ' --max_allowed_packet=32M' +
        ' --force' +
        ' --host=' + AHost +
        ' --port=' + APort +
        ' --user=' + AUser +
        ' --password=' + APassword;

      ShowWaiting(cDataRestoring);
      try
        vBat := TStringList.Create;
        try
          s := '"' + StrToOem(vMySQLUtil) + '" ' + UTF8Encode(vParams) + ' < "' + StrToOem(AFileName) + '"';
          //s := StrToOem(s);
          //s := UTF8Encode(s);
          vBat.Add(s);
          vBat.SaveToFile(cABSBackupDir + 'Restore.bat');
        finally
          vBat.Free;
        end;

        FileExecuteWait(cABSBackupDir + 'Restore.bat', '', cABSBackupDir, esHidden);

//        Sysutils.DeleteFile(cABSBackupDir + 'Restore.bat');

        HideWaiting;

        Result := 0;
      except
        on E:Exception do
        begin
          HideWaiting;
          Result := -3;
          ShowMsg('�� ����� �������������� ���� ������ ��������� ������:'#13#10 + E.Message,
                  smtError, [smbOK], smbOK, smbOK);
        end;
      end;
    end;
end;

//�������� ����������� �� ���
function ExistsPartnerByINNKPP(AINN, AKPP: String; AExcludeID : integer): Boolean;
  var
    v : variant;
begin
  v := Datas.ReadValuesSQL('select ID from Partner where INN = ''' + AINN + ''' and KPP = ''' + AKPP + ''' and ID <> ' + IntToStr(AExcludeID), 'ID');
  Result := IsNull(v[0], 0) > 0;
end;

//����� ����������� �� ���
function FindPartnerByINNKPP(AINN, AKPP: String; AExcludeID : integer): Integer;
  var
    v : variant;
begin
  v := Datas.ReadValuesSQL('select ID from Partner where INN = ''' + AINN + ''' and KPP = ''' + AKPP + ''' and ID <> ' + IntToStr(AExcludeID), 'ID');
  Result := IsNull(v[0], 0);
end;

function ExistsUpdate : boolean;
  var
    s : string;
begin
  if UpdateURL = '' then Result := false
  else
  begin
    try
      s := ChangeFileExt(ExtractFileName(Application.ExeName), '');
      s := CurrentDir + s + 'Updater.ini';
      Datas.strUpdaterIni.Strings.SaveToFile(s);

      with TIniFile.Create(s) do
        try
          WriteString('Channel', 'TargetURL', UpdateURL);
        finally
          Free;
        end;

      AutoUpdateClientData := TAutoUpdateClientData.Create(Application);
      try
        Result := AutoUpdateClientData.CheckForUpdates;
        AutoUpdateClientData.Free;
      except
        on E: Exception do
        begin
          ShowMsg('�� ����� �������� ���������� ��������� ������:'#13#10 + E.Message, smtError);
          Result := false;
        end;
      end;
    except
      on E: Exception do
      begin
        ShowMsg('�� ����� �������� ���������� ��������� ������:'#13#10 + E.Message, smtError);
        Result := false;
      end;
    end;
  end;
end;

//�������� ����� � ���������
function ServerFileSend(APrefix : string; ADate : TDateTime; AID, AIDFile : integer; AFileName : string; var AServerPath, AServerFileName : string) : boolean;
  var
    s, t, d : string;
    v : variant;
    serverdir, serverfile, ext : string;
begin
  Result := false;
  with Datas do
  begin
    v := ReadOptions('FileServerType;FileServerHost;FileServerDir;FileServerUser;FileServerPassword;FileServerport');

    case IsNull(v[0], 0) of
      0 :
        begin
          //�������� � ��������� ����
          serverdir := IsNull(v[1], ''); //��������, \\localhost ��� D:
          if Serverdir <> '' then Serverdir := CorrectPath(Serverdir);
          serverdir := Serverdir + IsNull(v[2], '');//��������, Files
          if Serverdir <> '' then Serverdir := CorrectPath(Serverdir);

          //���� � ������ � ����� = �����, ����� ������ ��������� ����� ��� ������
          if Serverdir = '' then
          begin
            ServerDir := cABSFileDir;
            Serverdir := CorrectPath(Serverdir);
          end;

          serverdir := serverdir + APrefix;//��������, prerequest, carriage � �.�.
          if Serverdir <> '' then Serverdir := CorrectPath(Serverdir);
          s := StringREplace(GetWorkMonth(ADate), '.', '', []);
          serverdir := serverdir + s;
          if Serverdir <> '' then Serverdir := CorrectPath(Serverdir);
          s := IntToStrF(DayOf(ADate), 2, '0');
          serverdir := serverdir + s;
          if Serverdir <> '' then Serverdir := CorrectPath(Serverdir);
          //�������� ����� � ���������, ��������, \\Server\Prerequest\201309\05
          AServerPath := ServerDir;

          if not DirectoryExists(AServerPath) then
            if not ForceDirectories(AServerPath) then Exit;

          serverfile := IntToStrF(AID, 10, '0');//��������, ������� ����������� ����
          ServerFile := ServerFile + '-' + IntToStrF(AIDFile, 10, '0');
          d := StringReplace(DateToSQLDate(ADate), '.', '', [rfReplaceAll]);
          t := StringReplace(TimeToStr(ADate), ':', '', [rfReplaceAll]);
          ext := ExtractFileExt(AFileName);
          ServerFile := ServerFile + '-' + d + '-' + t + ext;
          AServerFileName := ServerFile;

          Result := FileCopy(AFileName, Serverdir + AServerFileName, true);
        end;
      1 :
        begin
          //�������� �� ������ FTP
          serverdir := IsNull(v[2], ''); //��������, Files
          if Serverdir <> '' then Serverdir := CorrectPathFTP(Serverdir);
          serverdir := serverdir + APrefix;//��������, prerequest, carriage � �.�.
          if Serverdir <> '' then Serverdir := CorrectPathFTP(Serverdir);
          s := StringREplace(GetWorkMonth(ADate), '.', '', []);
          serverdir := serverdir + s;
          if Serverdir <> '' then Serverdir := CorrectPathFTP(Serverdir);
          s := IntToStrF(DayOf(ADate), 2, '0');
          serverdir := serverdir + s;
          if Serverdir <> '' then Serverdir := CorrectPathFTP(Serverdir);
          //�������� ����� � ���������, ��������, \\Server\Prerequest\201309\05
          AServerPath := ServerDir;

          serverfile := IntToStrF(AID, 10, '0');//��������, ������� ����������� ����
          ServerFile := ServerFile + '-' + IntToStrF(AIDFile, 10, '0');
          d := StringReplace(DateToSQLDate(ADate), '.', '', [rfReplaceAll]);
          t := StringReplace(TimeToStr(ADate), ':', '', [rfReplaceAll]);
          ext := ExtractFileExt(AFileName);
          ServerFile := ServerFile + '-' + d + '-' + t + ext;
          AServerFileName := ServerFile;

          try
            FTP.Host := IsNull(v[1], '');
            FTP.UserName := IsNull(v[3], '');
            FTP.Password := IsNull(v[4], '');
            FTP.Port := IsNull(v[5], 21);

            FTP.Connect;
            if FTP.Connected then
            begin
              try
                  FTP.MakeDir(AServerPath);
              except
              end;
              s := AServerpath + AServerFileName;
              try
                FTP.Put(AFileName, s);
                Result := true;
              finally
                FTP.Disconnect;
              end;
            end
          except
            on E:Exception do
              ShowMsg('�� ����� �������� ����� �������� ������:' + #13#10 + E.Message, smtWarning, [smbOK], smbOK, smbOK);
          end;
        end;
    end;
  end;
end;

//��������� ����� �� ���������
function ServerFileReceive(AFileName, AServerPath, AServerFileName : string; var FilePath : string) : boolean;
  var
    v : variant;
begin
  Result := false;
  with Datas do
  begin
    v := ReadOptions('FileServerType;FileServerHost;FileServerDir;FileServerUser;FileServerPassword;FileServerport');

    case IsNull(v[0], 0) of
      0 :
        begin
          //��������� �� ��������� ����
          FilePath := cABSFileTempDir + AFileName;

          AServerPath := CorrectPath(AServerPath);

          Result := FileCopy(AServerPath + AServerFileName, FilePath, true);
        end;
      1 :
        begin
          FilePath := cABSFileTempDir + AFileName;//���� ���������

          if FileExists(FilePath) then DeleteFile(FilePath);

          try
            FTP.Host := IsNull(v[1], '');
            FTP.UserName := IsNull(v[3], '');
            FTP.Password := IsNull(v[4], '');
            FTP.Port := IsNull(v[5], 21);

            FTP.Connect;
            if FTP.Connected then
            begin
              try
                FTP.ChangeDir(AServerPath);
                FTP.Get(AServerFileName, FilePath, true);
                Result := true;
              finally
                FTP.Disconnect;
              end;
            end
          except
            on E:Exception do
              ShowMsg('�� ����� ��������� ����� �������� ������:' + #13#10 + E.Message, smtWarning, [smbOK], smbOK, smbOK);
          end;

        end;
    end;
  end;
end;

//�������� ����� � ���������
function ServerFileDelete(AServerPath, AServerFileName : string) : boolean;
  var
    v : variant;
begin
  Result := false;
  with Datas do
  begin
    v := ReadOptions('FileServerType;FileServerHost;FileServerDir;FileServerUser;FileServerPassword;FileServerport');

    case IsNull(v[0], 0) of
      0 :
        begin
          //�������� �� ��������� ����
          AServerPath := CorrectPath(AServerPath);
          Result := FileDelete(AServerPath + AServerFileName, false);
        end;
      1 :
        begin
          //�������� �� ������ FTP
          try
            FTP.Host := IsNull(v[1], '');
            FTP.UserName := IsNull(v[3], '');
            FTP.Password := IsNull(v[4], '');
            FTP.Port := IsNull(v[5], 21);

            FTP.Connect;
            if FTP.Connected then
            begin
              try
                FTP.ChangeDir(AServerPath);
                FTP.Delete(AServerFileName);
                Result := true;
              finally
                FTP.Disconnect;
              end;
            end
          except
            on E:Exception do
              ShowMsg('�� ����� �������� ����� �������� ������:' + #13#10 + E.Message, smtWarning, [smbOK], smbOK, smbOK);
          end;
        end;
    end;
  end;
end;

//�������� ����� � ���������
function ServerFileExists(AServerPath, AServerFileName : string) : boolean;
  var
    v : variant;
    vFiles : TStringList;
    s : integer;
begin
  Result := false;
  with Datas do
  begin
    v := ReadOptions('FileServerType;FileServerHost;FileServerDir;FileServerUser;FileServerPassword;FileServerport');

    case IsNull(v[0], 0) of
      0 :
        begin
          //�������� � ��������� ����
          AServerPath := CorrectPath(AServerPath);
          Result := FileExists(AServerPath + AServerFileName);
        end;
      1 :
        begin
          //�������� �� ������ FTP
          try
            FTP.Host := IsNull(v[1], '');
            FTP.UserName := IsNull(v[3], '');
            FTP.Password := IsNull(v[4], '');
            FTP.Port := IsNull(v[5], 21);

            FTP.Connect;
            if FTP.Connected then
            begin
              s := FTP.Size(AServerPath + AServerFilename);
              Result := s >= 0;
              FTP.Disconnect;
            end
          except
            Result := false;
          end;
        end;
    end;
  end;
end;

//���������� ����� ��� ������ ������
function ServerFileSaveAs(AFilePath, AServerPath, AServerFileName : string) : boolean;
  var
    v : variant;
begin
  Result := false;
  with Datas do
  begin
    v := ReadOptions('FileServerType;FileServerHost;FileServerDir;FileServerUser;FileServerPassword;FileServerport');

    AServerPath := CorrectPath(AServerPath);

    case IsNull(v[0], 0) of
      0 :
        begin
          //��������� �� ��������� ����
          Result := FileCopy(AServerPath + AServerFileName, AFilePath, true);
        end;
      1 :
        begin
          if FileExists(AFilePath) then DeleteFile(AFilePath);

          try
            FTP.Host := IsNull(v[1], '');
            FTP.UserName := IsNull(v[3], '');
            FTP.Password := IsNull(v[4], '');
            FTP.Port := IsNull(v[5], 21);

            FTP.Connect;
            if FTP.Connected then
            begin
              try
                FTP.ChangeDir(AServerPath);
                FTP.Get(AServerFileName, AFilePath, true);
                Result := true;
              finally
                FTP.Disconnect;
              end;
            end
          except
            on E:Exception do
              ShowMsg('�� ����� ��������� ����� �������� ������:' + #13#10 + E.Message, smtWarning, [smbOK], smbOK, smbOK);
          end;

        end;
    end;
  end;
end;

//��������� ���������� ������������
function GetEmployeeName(AIDEmployee : integer) : string;
  var
    s, n, p : string;
    v : variant;
begin
  v := Datas.ReadValues('employee', 'Surname;Name;Patro', AIDEmployee);
  Result :=
    IsNull(v[0], '') + ' ' + IsNull(v[1], '') + '.' + v[2] + '.';
end;

//��������� ������ ������
function GetFastReportVersion(AForm : TStream) : string;
begin
  with TFrxReport.Create(Application) do
    try
      try
        StoreInDFM := true;
        AForm.Position := 0;
        Clear;
        if AForm.Size > 0 then LoadFromStream(AForm);
        Result :=
          ReportOptions.VersionMajor + '.' +
          ReportOptions.VersionMinor + '.' +
          ReportOptions.VersionRelease + '.' +
          ReportOptions.VersionBuild;
      except
        Result := '';
      end;
    finally
      Free;
    end
end;

procedure WritePluginLog(AText : string);
  var
    vText : Text;
    s : string;
    vLogFile : string;
begin
  if DefLog = '' then Exit;

  vLogFile := DefLog;

  AssignFile(vText, vLogFile);
  if FileExists(vLogFile) then Append(vText)
  else Rewrite(vText);
  s := AText;
  s := StringReplace(s, #13, '|', [rfReplaceAll]);
  s := StringReplace(s, #10, '|', [rfReplaceAll]);
  Writeln(vText, DateTimeToStr(Now) + ': ' + s);
  CloseFile(vText);
end;

//��������� ��������� �� ���������
function GetStatusTypeDef : integer;
begin
  Result := IsNUll(Datas.ReadValuesSQL('select ID from StatusType where defstatus = 1 limit 1', 'ID')[0], 0)
end;

//��������� ������� �� ���������
function GetSourceTypeDef : integer;
begin
  Result := IsNUll(Datas.ReadValuesSQL('select ID from SourceType where defsource = 1 limit 1', 'ID')[0], 0)
end;

//��������� ����� ������ �� ���������
function GetPaymentFormDef : integer;
begin
  Result := IsNUll(Datas.ReadValuesSQL('select ID from PaymentForm where defform = 1 limit 1', 'ID')[0], 0)
end;

//��������� ����� ������ �� ���������
function GetSignalTypeDef : integer;
begin
  Result := IsNUll(Datas.ReadValuesSQL('select ID from signaltype where defsignal = 1 limit 1', 'ID')[0], 0)
end;

//���������� ��������� � ���
function AddChatMessage(AIDOrderList : integer; AText : string) : integer;
begin
  with Datas do
  begin
    tChat.Close;
    tChat.ParamByName('ID').AsInteger := AIDOrderList;
    tChat.Open;
    tChat.Append;
    tChat.FieldBYName('ID_OrderList').AsInteger := AIDOrderList;
    tChat.FieldBYName('ID_User').AsInteger := UserID;
    tChat.FieldBYName('MessageText').AsString := AText;
    tChat.Post;
    Result := tChat.FieldBYName('ID').AsINteger;
    tChat.Close;
  end;
end;

//���������� �����������
function AddNotificationManual(AIDOrderList, AIDNoticeTemplate, AIDUser: integer; AHeader, AText : string; AColor, AShowTime : integer) : integer;
begin
  with Datas do
  begin
    tNotification.Close;
    tNotification.ParamByName('ID').AsInteger := 0;
    tNotification.Open;
    tNotification.Append;
    tNotification.FieldBYName('ID_OrderList').Value := NullIf(AIDOrderList, 0);
    tNotification.FieldBYName('ID_NoticeTemplate').Value := NullIf(AIDNoticeTemplate, 0);
    tNotification.FieldBYName('Header').AsString := AHeader;
    tNotification.FieldBYName('Text').AsString := AText;
    tNotification.FieldBYName('Color').AsInteger := AColor;
    tNotification.FieldBYName('ShowTime').AsInteger := AShowTime;
    tNotification.FieldByName('Manual').AsInteger := 1;
    tNotification.Post;
    Result := tNotification.FieldBYName('ID').AsINteger;
    tNotification.Close;

    tNotificationUser.Close;
    tNotificationUser.ParamByName('ID').AsInteger := 0;
    tNotificationUser.Open;
    tNotificationUser.Append;
    tNotificationUser.FieldBYName('ID_Notification').AsInteger := Result;
    tNotificationUser.FieldBYName('ID_User').AsInteger := AIDUser;
    tNotificationUser.Post;
    tNotificationUser.Close;
  end;
end;

//����������� �����������
function ShowNotification(AIDNotification, AIDOrderList : integer; AHeader, AText : string; AColor, AShowTime : integer; AImageIndex : integer; AInfo : string = '') : integer;
  var
    vWin : TdxAlertWindow;
begin
  vWin := Datas.AlertWindowManager.Show(AHeader, AText, AImageIndex);
//  vWin.OptionsMessage.Text.Font.Color := AColor;
//  vWin.OptionsMessage.Caption.Font.Color := AColor;
  if AShowTime = 0 then vWin.Pinned := true
  else vWin.OptionsBehavior.DisplayTime := AShowTime * 1000;

  vWin.Color := AColor;

  vWin.Tag := AIDNotification;

  vWin.Hint := INtToStr(AIDOrderList);

  vWin.HelpKeyword := AInfo;
end;

//���������� ��������������������
function SaveLastEnterTime : boolean;
begin
  with Datas.tUser do
  begin
    Open;
    if Locate('ID', UserID, []) then
    begin
      LastEnterTime := ServerTime;
      Edit;
      FieldByName('LastEnterTime').AsDateTime := LastEnterTime;
      Post;
      Result := true;
    end;
    Close;
  end;
end;

//�������� �������� ��� �����������
function LoadNoticeIcons : boolean;
  var
    vImage : TdxSmartImage;
    vStream : TMEmoryStream;
    n : integer;
begin
  vStream := TMEmoryStream.Create;
  with Datas do
  begin
    AlertImageList.Clear;
    AlertImageID.Clear;

    qNoticeTemplate.Close;
    qNoticeTemplate.Open;
    qNoticeTemplate.First;
    while not qNoticeTemplate.eof do
    begin
      if not qNoticeTemplate.FieldByName('Picture').IsNull then
      begin
        TBlobField(qNoticeTemplate.FieldByName('Picture')).SaveToStream(vStream);
        vStream.Position := 0;
        vImage := TdxSmartImage.CreateFromStream(vStream);
        n := AlertImageList.Add(vImage);
        vImage.Free;
        //��������� ������ �� ������
        AlertImageID.Strings.Add(qNoticeTemplate.FieldByName('ID').AsString + '=' + IntToStr(n));
      end;
      qNoticeTemplate.Next;
    end;
  end;
  vStream.Free;
end;

procedure TDatas.ReadExportOptions;
  var
    v : variant;
begin
  v := Datas.ReadOptions('EMailJPGQuality;EMailJPGRes');
  Datas.frxJPEGExport.JPEGQuality := IsNull(v[0], 100);
  Datas.frxJPEGExport.Resolution := IsNull(v[1], 200);
end;

function TDatas.ReadOptions(ANames : string): variant;
begin
  Result := ReadValues('enterprise', ANames);
end;

function TDatas.ReadValues(ATableName, ANames: string; AID: integer): variant;
begin
  Result := ReadValuesSQL(
    'select * from ' + ATableName + IfThen(AID=-1, '', ' where ID = ' + IntToStr(AID)),
    ANames
  );
end;

function TDatas.ReadValuesSQL(ASQL, ANames: string): variant;
  var
    i : integer;
    v : array of variant;
    vFieldList: TList;
begin
  with TZQuery.Create(nil) do
  try
    vFieldList := TList.Create;
    try
      Connection := Self.ZConnection;
      SQL.Text := ASQL;
      Open;
      GetFieldList(vFieldList, ANames);
      SetLength(v, vFieldList.Count);
      for i := 0 to vFieldList.Count - 1 do
        v[i] := TField(vFieldList[i]).Value;
      Result := v;
    finally
      vFieldList.Free;
    end;
  finally
    Free;
  end;
end;

procedure TDatas.ResetBarcodeScannerProc;
begin
  FProc := nil;
end;

procedure TDatas.SetBarcodeScannerProc(AProc: TDataEvent);
begin
  FProc := AProc;
end;

procedure TDatas.UpdateExportDirs;
begin
  frxPDFExport.DefaultPath := cABSExportDir;
  frxRTFExport.DefaultPath := cABSExportDir;
  frxXLSExport.DefaultPath := cABSExportDir;
  frxHTMLExport.DefaultPath := cABSExportDir;
  frxCSVExport.DefaultPath := cABSExportDir;
  frxBMPExport.DefaultPath := cABSExportDir;
  frxJPEGExport.DefaultPath := cABSExportDir;
  frxDotMatrixExport.DefaultPath := cABSExportDir;
end;

function TDatas.UsedData(ATableName: string; AID: integer): boolean;
begin
  with TZQuery.Create(nil) do
  try
    Connection := ZConnection;
    SQL.Text := 'select Used' + ATableName + '(' + IntToStr(AID) + ') as UInfo';
    Open;
    Result := FieldByName('UInfo').AsInteger = 1;
    Close;
  finally
    Free;
  end;
end;

procedure TDatas.WriteOptions(ANames: string; AValues: variant);
begin
  WriteValues('Options', ANames, AValues);
end;

procedure TDatas.WriteValues(ATableName, ANames: string; AValues: variant;
  AID: integer);
begin
  WriteValuesSQL(
    'select * from ' + ATableName + IfThen(AID = -1, '', ' where ID = ' + IntToStr(AID)),
    ANames,
    AValues
  );
end;

procedure TDatas.WriteValuesSQL(ASQL, ANames: string; AValues: variant);
  var
    i : integer;
    vFieldList: TList;
begin
  with TZQuery.Create(nil) do
  try
    vFieldList := TList.Create;
    try
      Connection := Self.ZConnection;
      SQL.Text := ASQL;
      Open;
      GetFieldList(vFieldList, ANames);
      Edit;
      for i := 0 to vFieldList.Count-1 do
        TField(vFieldList[i]).Value := AValues[i];
      Post;
    finally
      vFieldList.Free
    end;
  finally
    Free;
  end;
end;

initialization
  UserPermTool := TStringList.Create;
  UserPermData := TStringList.Create;
  PropTypeFormat[ptFloat] := StringReplace(cFloatPropMask, '.', FormatSettings.DecimalSeparator, []);


finalization
  UserPermTool.Free;
  UserPermData.Free;
end.

