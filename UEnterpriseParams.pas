//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры предприятия
//
//------------------------------------------------------------------------------
unit UEnterpriseParams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, 
  DBCtrls, ADODB, Mask,  ComCtrls, CheckLst, cxStyles, cxGraphics, cxEdit,
  cxCheckBox, cxDropDownEdit, cxVGrid, cxControls, cxInplaceContainer,
  cxTextEdit, cxSpinEdit, cxCheckComboBox, cxCalendar, Menus,
  cxLookAndFeelPainters, cxButtons, cxCalc, cxEditRepositoryItems, 
  cxButtonEdit, dxSkinsCore, dxSkinsDefaultPainters, ActnList, cxLookAndFeels,
  cxImageComboBox, System.Actions, cxClasses, cxMaskEdit, dxScrollbarAnnotations;

type
  TGEnterpriseForm = class(TForm)
    Grid: TcxVerticalGrid;
    eShortName: TcxEditorRow;
    eMasterPost: TcxEditorRow;
    ePhone: TcxEditorRow;
    eEMail: TcxEditorRow;
    eWEBSite: TcxEditorRow;
    eAddress: TcxEditorRow;
    eMasterName: TcxEditorRow;
    eName: TcxEditorRow;
    gMain: TcxCategoryRow;
    gOptions: TcxCategoryRow;
    eWorkDay: TcxEditorRow;
    GridCategoryRow3: TcxCategoryRow;
    EditRepository: TcxEditRepository;
    TextItem: TcxEditRepositoryTextItem;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    pButtons: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    ActionList: TActionList;
    aOK: TAction;
    eWorkPeriodStart: TcxEditorRow;
    eWorkPeriodEnd: TcxEditorRow;
    eUpdateURL: TcxEditorRow;
    GridCategoryRow4: TcxCategoryRow;
    eFileServerType: TcxEditorRow;
    eFileServerDir: TcxEditorRow;
    eFileServerUser: TcxEditorRow;
    eFileServerPassword: TcxEditorRow;
    eFileServerPort: TcxEditorRow;
    eFileServerHost: TcxEditorRow;
    ePhotoWidth: TcxEditorRow;
    ePhotoHeight: TcxEditorRow;
    GridCategoryRow5: TcxCategoryRow;
    eEmailHost: TcxEditorRow;
    eEmailLogin: TcxEditorRow;
    eEmailPassword: TcxEditorRow;
    eEmailPort: TcxEditorRow;
    eEmailAuthType: TcxEditorRow;
    eEmailTLSType: TcxEditorRow;
    eEmailName: TcxEditorRow;
    eEmailFromEMail: TcxEditorRow;
    eEmailCharset: TcxEditorRow;
    eEMailCollection: TcxEditorRow;
    eEmailPreview: TcxEditorRow;
    eEMailPreviewClient: TcxEditorRow;
    eEMailJPGQuality: TcxEditorRow;
    eEMailJPGRes: TcxEditorRow;
    eEMailNotification: TcxEditorRow;
    eSecretKeyDadata: TcxEditorRow;
    eAPIKeyDadata: TcxEditorRow;
    eWorkTime: TcxEditorRow;
    eOldOrderTime: TcxEditorRow;
    eCheckUpdateTime: TcxEditorRow;
    gClientSite: TcxCategoryRow;
    eSignalTypeLead: TcxEditorRow;
    eStatusTypeLead: TcxEditorRow;
    eSourceTypeLead: TcxEditorRow;
    eSignalTypeRequest: TcxEditorRow;
    eStatusTypeRequest: TcxEditorRow;
    eSourceTypeRequest: TcxEditorRow;
    eOurWorkTime: TcxEditorRow;
    eStatusTypeCancel: TcxEditorRow;
    GridCategoryRow7: TcxCategoryRow;
    eSMSServiceLogin: TcxEditorRow;
    eSMSServicePassword: TcxEditorRow;
    eSMSServiceSender: TcxEditorRow;
    ePaymentFormYoomoney: TcxEditorRow;
    GridCategoryRow8: TcxCategoryRow;
    eNotificationTime: TcxEditorRow;
    eMaxDiscount: TcxEditorRow;
    eYoomoneyShopID: TcxEditorRow;
    eYoomoneyKey: TcxEditorRow;
    cMasterApplication: TcxCategoryRow;
    eMasterLicFileLink: TcxEditorRow;
    eMasterCoordTelegram: TcxEditorRow;
    eMasterCoordPhone: TcxEditorRow;
    eStatusMasterConfirmArea: TcxEditorRow;
    eStatusMasterButtonAcceptOrder: TcxEditorRow;
    eStatusMasterButtonCancelOrder: TcxEditorRow;
    eSignalMasterCancelOrder: TcxEditorRow;
    eStatusMasterButtonOnTime: TcxEditorRow;
    eStatusMasterButtonFinishOrder: TcxEditorRow;
    eStatusMasterButtonClientPaid: TcxEditorRow;
    eStatusMasterButtonSendPay: TcxEditorRow;
    eStatusMasterButtonStartWork: TcxEditorRow;
    eStatusMasterButtonCameOrder: TcxEditorRow;
    eStatusMasterButtonLateOrder: TcxEditorRow;
    eSignalMasterLaterOrder: TcxEditorRow;
    eINN: TcxEditorRow;
    eOGRN: TcxEditorRow;
    eAddressJur: TcxEditorRow;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aOKExecute(Sender: TObject);
    procedure eSummerSeasonDateEditPropertiesChange(Sender: TObject);
    procedure eEmailHostEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FClientContract, FCarrierContract : TMemoryStream;
  public
    { Public declarations }
    procedure SetOKEnabled;
    function CheckData : boolean;
  end;

function EditEnterpriseParams(
  var AName, AShortName, AINN, AOGRN,
      AMasterName, AMasterPost,
      AAddress, AAddressJur,
      APhone, AEMail, AWEBSite,
      AAPIKeyDadata, ASecretKeyDadata : string;
  var AWorkDay, AWorkTime : string;
  var AOldOrderTime, ACheckUpdateTime, ANotificationTime : integer;
  var AWorkPeriodStart, AWorkPeriodEnd : TDate;
  var AUpdateURL : string;
  var AFileServerType : integer;
  var AFileServerHost, AFileServerDir, AFileServerUser, AFileServerPassword : string;
  var AFileServerPort : integer;
  var APhotoWidth, APhotoHeight : integer;
  var AEmailHost, AEmailLogin, AEmailPassword : string;
  var AEmailPort, AEmailAuthType, AEmailTLSType : integer;
  var AEmailName, AEmailCharset, AEmailFrom : string;
  var AEMailCollection : string;
  var AEMailPreview, AEMailPreviewClient, AEMailNotification : integer;
  var AEMailJPGQuality, AEMailJPGRes : integer;

  var AIDSignalTypeLead, AIDStatusTypeLead, AIDSourceTypeLead : integer;
  var AIDSignalTypeRequest, AIDStatusTypeRequest, AIDSourceTypeRequest : integer;

  var AIDStatusTypeCancel : integer;
  var AOurWorkTime : integer;

  var ASMSServiceLogin, ASMSServicePassword, ASMSServiceSender : string;

  var AIDPaymentFormYoomoney : integer;
  var AYoomoneyShopID, AYoomoneyKey : string;

  var AMaxDiscount : integer;

  var AMasterLicFileLink, AMasterCoordTelegram, AMasterCoordPhone : string;
  var AIDStatusMasterConfirmArea, AIDStatusMasterButtonAcceptOrder, AIDStatusMasterButtonCancelOrder,
      AIDSignalMasterCancelOrder, AIDStatusMasterButtonOnTime, AIDStatusMasterButtonLateOrder,
      AIDSignalMasterLaterOrder, AIDStatusMasterButtonCameOrder, AIDStatusMasterButtonStartWork,
      AIDStatusMasterButtonSendPay, AIDStatusMasterButtonClientPaid, AIDStatusMasterButtonFinishOrder : integer
  ) : boolean;

implementation

{$R *.DFM}

uses
  UConsts, mesdlg, UProgress, UDatas, UOptions, UUtil,
  DTKUtils, MainUnit, Dateutils, Variants, USelectTypeDB, UConnectionSMTP;

function EditEnterpriseParams(
  var AName, AShortName, AINN, AOGRN,
      AMasterName, AMasterPost,
      AAddress, AAddressJur,
      APhone, AEMail, AWEBSite,
      AAPIKeyDadata, ASecretKeyDadata : string;
  var AWorkDay, AWorkTime : string;
  var AOldOrderTime, ACheckUpdateTime, ANotificationTime : integer;
  var AWorkPeriodStart, AWorkPeriodEnd : TDate;
  var AUpdateURL : string;
  var AFileServerType : integer;
  var AFileServerHost, AFileServerDir, AFileServerUser, AFileServerPassword : string;
  var AFileServerPort : integer;
  var APhotoWidth, APhotoHeight : integer;
  var AEmailHost, AEmailLogin, AEmailPassword : string;
  var AEmailPort, AEmailAuthType, AEmailTLSType : integer;
  var AEmailName, AEmailCharset, AEmailFrom : string;
  var AEMailCollection : string;
  var AEMailPreview, AEMailPreviewClient, AEMailNotification : integer;
  var AEMailJPGQuality, AEMailJPGRes : integer;

  var AIDSignalTypeLead, AIDStatusTypeLead, AIDSourceTypeLead : integer;
  var AIDSignalTypeRequest, AIDStatusTypeRequest, AIDSourceTypeRequest : integer;

  var AIDStatusTypeCancel : integer;
  var AOurWorkTime : integer;

  var ASMSServiceLogin, ASMSServicePassword, ASMSServiceSender : string;

  var AIDPaymentFormYoomoney : integer;
  var AYoomoneyShopID, AYoomoneyKey : string;
  var AMaxDiscount : integer;
  var AMasterLicFileLink, AMasterCoordTelegram, AMasterCoordPhone : string;
  var AIDStatusMasterConfirmArea, AIDStatusMasterButtonAcceptOrder, AIDStatusMasterButtonCancelOrder,
      AIDSignalMasterCancelOrder, AIDStatusMasterButtonOnTime, AIDStatusMasterButtonLateOrder,
      AIDSignalMasterLaterOrder, AIDStatusMasterButtonCameOrder, AIDStatusMasterButtonStartWork,
      AIDStatusMasterButtonSendPay, AIDStatusMasterButtonClientPaid, AIDStatusMasterButtonFinishOrder : integer
  ) : boolean;
  var
    s : string;
begin
  with TGEnterpriseForm.Create(nil) do
    try
      bOK.Enabled := CanEditInActionByAction(MainForm.agEnterprise);
      Grid.OptionsData.Editing := bOK.Enabled;

      eName.Properties.Value := AName;
      eShortName.Properties.Value := AShortName;
      eINN.Properties.Value := AINN;
      eOGRN.Properties.Value := AOGRN;
      eMasterName.Properties.Value := AMasterName;
      eMasterPost.Properties.Value := AMasterPost;
      eAddress.Properties.Value := AAddress;
      eAddressJur.Properties.Value := AAddressJur;
      ePhone.Properties.Value := APhone;
      eEMail.Properties.Value := AEMail;
      eWEBSite.Properties.Value := AWEBSite;
      eAPIKeyDadata.Properties.Value := AAPIKeyDadata;
      eSecretKeyDadata.Properties.Value := ASecretKeyDadata;

      if Length(AWorkDay) <> 7 then AWorkDay := cDefaultWorkDay;
      eWorkDay.Properties.Value := AWorkDay;

      if Length(AWorkTime) <> 11 then AWorkDay := cDefaultWorkTime;
      eWorkTime.Properties.Value := AWorkTime;

      eOldOrderTime.Properties.Value := AOldOrderTime;
      eCheckUpdateTime.Properties.Value := ACheckUpdateTime;
      eNotificationTime.Properties.Value := ANotificationTime;

      eUpdateURL.Properties.Value := AUpdateURL;

      eWorkPeriodStart.Properties.Value := DateToStr(AWorkPeriodStart);
      eWorkPeriodEnd.Properties.Value := DateToStr(AWorkPeriodEnd);

      eFileServerType.Properties.Value := TcxComboBoxProperties(eFileServerType.Properties.EditProperties).Items[AFileServerType];
      eFileServerHost.Properties.Value := AFileServerHost;
      eFileServerDir.Properties.Value := AFileServerDir;
      eFileServerUser.Properties.Value := AFileServerUser;
      eFileServerPassword.Properties.Value := AFileServerPassword;
      eFileServerPort.Properties.Value := AFileServerPort;

      ePhotoWidth.Properties.Value := APhotoWidth;
      ePhotoHeight.Properties.Value := APhotoHeight;

      eEmailHost.Properties.Value := AEmailHost;
      eEmailLogin.Properties.Value := AEmailLogin;
      eEmailPassword.Properties.Value := AEmailPassword;
      eEmailPort.Properties.Value := AEmailPort;
      eEmailAuthType.Properties.Value := AEmailAuthType;
      eEmailTLSType.Properties.Value := AEmailTLSType;
      eEmailName.Properties.Value := AEmailName;
      eEmailCharset.Properties.Value := AEmailCharset;
      eEMailFromEMail.Properties.Value := AEmailFrom;

      eEMailCollection.Properties.Value := AEmailCollection;
      eEMailPreview.Properties.Value := AEmailPreview;
      eEMailPreviewClient.Properties.Value := AEmailPreviewClient;
      eEMailNotification.Properties.Value := AEMailNotification;
      eEMailJPGQuality.Properties.Value := AEMailJPGQuality;
      eEMailJPGRes.Properties.Value := AEMailJPGRes;

      FillPropComboBoxExSQL(eSignalTypeLead.Properties, 'select ID, Name from SignalType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eSignalTypeLead.Properties, AIDSignalTypeLead);

      FillPropComboBoxExSQL(eStatusTypeLead.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusTypeLead.Properties, AIDStatusTypeLead);

      FillPropComboBoxExSQL(eSourceTypeLead.Properties, 'select ID, Name from SourceType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eSourceTypeLead.Properties, AIDSourceTypeLead);

      FillPropComboBoxExSQL(eSignalTypeRequest.Properties, 'select ID, Name from SignalType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eSignalTypeRequest.Properties, AIDSignalTypeRequest);

      FillPropComboBoxExSQL(eStatusTypeRequest.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusTypeRequest.Properties, AIDStatusTypeRequest);

      FillPropComboBoxExSQL(eSourceTypeRequest.Properties, 'select ID, Name from SourceType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eSourceTypeRequest.Properties, AIDSourceTypeRequest);

      FillPropComboBoxExSQL(eStatusTypeCancel.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusTypeCancel.Properties, AIDStatusTypeCancel);

      eOurWorkTime.Properties.Value := AOurWorkTime;

      eSMSServiceLogin.Properties.Value := ASMSServiceLogin;
      eSMSServicePassword.Properties.Value := ASMSServicePassword;
      eSMSServiceSender.Properties.Value := ASMSServiceSender;

      FillPropComboBoxExSQL(ePaymentFormYoomoney.Properties, 'select ID, Name from PaymentForm order by Name', 'Name', 'ID');
      SetPropItemIndexByID(ePaymentFormYoomoney.Properties, AIDPaymentFormYoomoney);

      eYoomoneyShopID.Properties.Value := AYoomoneyShopID;
      eYoomoneyKey.Properties.Value := AYoomoneyKey;

      eMaxDiscount.Properties.Value := AMaxDiscount;

      eMasterLicFileLink.Properties.Value := AMasterLicFileLink;
      eMasterCoordTelegram.Properties.Value :=  AMasterCoordTelegram;
      eMasterCoordPhone.Properties.Value :=  AMasterCoordPhone;

      FillPropComboBoxExSQL(eStatusTypeRequest.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusTypeRequest.Properties, AIDStatusTypeRequest);

      FillPropComboBoxExSQL(eStatusMasterConfirmArea.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterConfirmArea.Properties, AIDStatusMasterConfirmArea);

      FillPropComboBoxExSQL(eStatusMasterButtonAcceptOrder.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonAcceptOrder.Properties, AIDStatusMasterButtonAcceptOrder);

      FillPropComboBoxExSQL(eStatusMasterButtonCancelOrder.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonCancelOrder.Properties, AIDStatusMasterButtonCancelOrder);

      FillPropComboBoxExSQL(eSignalMasterCancelOrder.Properties, 'select ID, Name from SignalType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eSignalMasterCancelOrder.Properties, AIDSignalMasterCancelOrder);

      FillPropComboBoxExSQL(eStatusMasterButtonOnTime.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonOnTime.Properties, AIDStatusMasterButtonOnTime);

      FillPropComboBoxExSQL(eStatusMasterButtonLateOrder.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonLateOrder.Properties, AIDStatusMasterButtonLateOrder);

      FillPropComboBoxExSQL(eSignalMasterLaterOrder.Properties, 'select ID, Name from SignalType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eSignalMasterLaterOrder.Properties, AIDSignalMasterLaterOrder);

      FillPropComboBoxExSQL(eStatusMasterButtonCameOrder.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonCameOrder.Properties, AIDStatusMasterButtonCameOrder);

      FillPropComboBoxExSQL(eStatusMasterButtonStartWork.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonStartWork.Properties, AIDStatusMasterButtonStartWork);

//      FillPropComboBoxExSQL(eStatusMasterButtonSendPay.Properties, 'select ID, Name from StatusType where ShowPayButton = 1 order by Name', 'Name', 'ID');
      FillPropComboBoxExSQL(eStatusMasterButtonSendPay.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonSendPay.Properties, AIDStatusMasterButtonSendPay);

      FillPropComboBoxExSQL(eStatusMasterButtonClientPaid.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonClientPaid.Properties, AIDStatusMasterButtonClientPaid);

      FillPropComboBoxExSQL(eStatusMasterButtonFinishOrder.Properties, 'select ID, Name from StatusType order by Name', 'Name', 'ID');
      SetPropItemIndexByID(eStatusMasterButtonFinishOrder.Properties, AIDStatusMasterButtonFinishOrder);

      Result := ShowModal = mrOK;

      if Result then
      begin
        AName := IsNull(eName.Properties.Value, '');
        AShortName := IsNull(eShortName.Properties.Value, '');
        AINN := IsNull(eINN.Properties.Value, '');
        AOGRN := IsNull(eOGRN.Properties.Value, '');
        AMasterName := IsNull(eMasterName.Properties.Value, '');
        AMasterPost := IsNull(eMasterPost.Properties.Value, '');
        AAddress := IsNull(eAddress.Properties.Value, '');
        AAddressJur := IsNull(eAddressJur.Properties.Value, '');
        APhone := IsNull(ePhone.Properties.Value, '');
        AEMail := IsNull(eEMail.Properties.Value, '');
        AWEBSite := IsNull(eWEBSite.Properties.Value, '');
        AAPIKeyDadata := IsNull(eAPIKeyDadata.Properties.Value, '');
        ASecretKeyDadata := IsNull(eSecretKeyDadata.Properties.Value, '');

        AWorkDay := eWorkDay.Properties.Value;
        AWorkTime := eWorkTime.Properties.Value;

        s := IsNull(eWorkPeriodStart.Properties.Value, '');
        AWorkPeriodStart := StrToDate(s);
        s := IsNull(eWorkPeriodEnd.Properties.Value, '');
        AWorkPeriodEnd := StrToDate(s);

        AOldOrderTime := IsNull(eOldOrderTime.Properties.Value, 0);
        ACheckUpdateTime := IsNull(eCheckUpdateTime .Properties.Value, 0);
        ANotificationTime := IsNull(eNotificationTime.Properties.Value, 0);

        AUpdateURL := IsNull(eUpdateURL.Properties.Value, '');

        AFileServerType := TcxComboBoxProperties(eFileServerType.Properties.EditProperties).Items.IndexOf(eFileServerType.Properties.Value);
        AFileServerHost := IsNull(eFileServerHost.Properties.Value, '');
        AFileServerDir := IsNull(eFileServerDir.Properties.Value, '');
        AFileServerUser := IsNull(eFileServerUser.Properties.Value, '');
        AFileServerPassword := IsNull(eFileServerPassword.Properties.Value, '');
        AFileServerPort := IsNull(eFileServerPort.Properties.Value, 0);

        APhotoWidth := IsNUll(ePhotoWidth.Properties.Value, 256);
        APhotoHeight := IsNull(ePhotoHeight.Properties.Value, 256);

        AEmailHost := IsNull(eEmailHost.Properties.Value, '');
        AEmailLogin := IsNull(eEmailLogin.Properties.Value, '');
        AEmailPassword := IsNull(eEmailPassword.Properties.Value, '');
        AEmailPort := IsNull(eEmailPort.Properties.Value, 0);
        AEmailAuthType := IsNull(eEmailAuthType.Properties.Value, 0);
        AEmailTLSType := IsNull(eEmailTLSType.Properties.Value, 0);
        AEmailName := IsNull(eEmailName.Properties.Value, '');
        AEmailCharset := IsNull(eEmailCharset.Properties.Value, '');
        AEmailFrom := IsNull(eEMailFromEMail.Properties.Value, '');

        AEmailCollection := IsNull(eEMailCollection.Properties.Value, '');
        AEmailPreview := IsNull(eEMailPreview.Properties.Value, 0);
        AEmailPreviewClient := IsNull(eEMailPreviewClient.Properties.Value, 0);
        AEMailNotification := IsNull(eEMailNotification.Properties.Value, 0);

        AEMailJPGQuality := IsNull(eEMailJPGQuality.Properties.Value, 100);
        AEMailJPGRes := IsNull(eEMailJPGRes.Properties.Value, 200);

        AIDSignalTypeLead := GetPropIDByItemIndex(eSignalTypeLead.Properties);
        AIDStatusTypeLead := GetPropIDByItemIndex(eStatusTypeLead.Properties);
        AIDSourceTypeLead := GetPropIDByItemIndex(eSourceTypeLead.Properties);
        AIDSignalTypeRequest := GetPropIDByItemIndex(eSignalTypeRequest.Properties);
        AIDStatusTypeRequest := GetPropIDByItemIndex(eStatusTypeRequest.Properties);
        AIDSourceTypeRequest := GetPropIDByItemIndex(eSourceTypeRequest.Properties);
        AIDStatusTypeCancel := GetPropIDByItemIndex(eStatusTypeCancel.Properties);
        AOurWorkTime := IsNull(eOurWorkTime.Properties.Value, 1);

        ASMSServiceLogin := IsNull(eSMSServiceLogin.Properties.Value, '');
        ASMSServicePassword := IsNull(eSMSServicePassword.Properties.Value, '');
        ASMSServiceSender := IsNull(eSMSServiceSender.Properties.Value, '');

        AIDPaymentFormYoomoney := GetPropIDByItemIndex(ePaymentFormYoomoney.Properties);
        AYoomoneyShopID := IsNUll(eYoomoneyShopID.Properties.Value, '');
        AYoomoneyKey := IsNull(eYoomoneyKey.Properties.Value, '');

        AMaxDiscount := IsNull(eMaxDiscount.Properties.Value, 0);

        AMasterLicFileLink := IsNull(eMasterLicFileLink.Properties.Value, '');
        AMasterCoordTelegram  := IsNull(eMasterCoordTelegram.Properties.Value, '');
        AMasterCoordPhone  := IsNull(eMasterCoordPhone.Properties.Value, '');

        AIDStatusMasterConfirmArea := GetPropIDByItemIndex(eStatusMasterConfirmArea.Properties);

        AIDStatusMasterButtonAcceptOrder := GetPropIDByItemIndex(eStatusMasterButtonAcceptOrder.Properties);

        AIDStatusMasterButtonCancelOrder := GetPropIDByItemIndex(eStatusMasterButtonCancelOrder.Properties);

        AIDSignalMasterCancelOrder := GetPropIDByItemIndex(eSignalMasterCancelOrder.Properties);

        AIDStatusMasterButtonOnTime := GetPropIDByItemIndex(eStatusMasterButtonOnTime.Properties);

        AIDStatusMasterButtonLateOrder := GetPropIDByItemIndex(eStatusMasterButtonLateOrder.Properties);

        AIDSignalMasterLaterOrder := GetPropIDByItemIndex(eSignalMasterLaterOrder.Properties);

        AIDStatusMasterButtonCameOrder := GetPropIDByItemIndex(eStatusMasterButtonCameOrder.Properties);

        AIDStatusMasterButtonStartWork := GetPropIDByItemIndex(eStatusMasterButtonStartWork.Properties);

        AIDStatusMasterButtonSendPay := GetPropIDByItemIndex(eStatusMasterButtonSendPay.Properties);

        AIDStatusMasterButtonClientPaid := GetPropIDByItemIndex(eStatusMasterButtonClientPaid.Properties);

        AIDStatusMasterButtonFinishOrder := GetPropIDByItemIndex(eStatusMasterButtonFinishOrder.Properties);
      end;
    finally
      Free;
    end;
end;

procedure TGEnterpriseForm.SetOKEnabled;
  var
    ce : boolean;
begin
  ce := CanEditInActionByAction(MainForm.agEnterprise);
  bOK.Enabled := ce;
end;

procedure TGEnterpriseForm.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Grid.LastVisibleRow = Grid.FocusedRow then
  begin
    bOK.SetFocus;
  end;
end;

procedure TGEnterpriseForm.aOKExecute(Sender: TObject);
begin
  if not CheckData then ShowMsg(cNotEnoughData, smtInformation, [smbOK], smbOK, smbOK)
  else ModalResult := mrOK;
end;

function TGEnterpriseForm.CheckData: boolean;
  var
    p1, p2, wt : string;
begin
  p1 := IsNull(eWorkPeriodStart.Properties.Value, '');
  p2 := IsNull(eWorkPeriodEnd.Properties.Value, '');
  wt := IsNull(eWorkTime.Properties.Value, '');
  Result :=
    (IsNull(eName.Properties.Value, '') <> '') and
    (IsNull(eShortName.Properties.Value, '') <> '') and
    IsDate(p1) and IsDate(p2) and (StrToDate(p1) < StrToDate(p2)) and
    IsWorkTime(wt);
end;

procedure TGEnterpriseForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGEnterpriseForm.eEmailHostEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    vID : string;
    v : variant;
    vSQL : string;
begin
  if AButtonIndex = 0 then
  begin
    vSQL := 'select ID, Name from ConnectionSMTP order by Name';
    vID := SelectTypeDB('Выбор сохраненного подключения', vSQL, 'Name=Название подключения', 'ID', 788900);
    if vID <> '' then
    begin
      v := Datas.ReadValues('connectionsmtp', 'EMailHost;EMailLogin;EMailPassword;EMailPort;EMailAuthType;EMailTLSType;EMailName;EMailCharset;FromEMail', StrToInt(vID));

      eEmailHost.Properties.Value := IsNull(v[0], '');
      eEmailLogin.Properties.Value := IsNull(v[1], '');
      eEmailPassword.Properties.Value := IsNull(v[2], '');
      eEmailPort.Properties.Value := IsNull(v[3], 25);
      eEmailAuthType.Properties.Value := IsNull(v[4], 0);
      eEmailTLSType.Properties.Value := IsNull(v[5], 0);
      eEmailName.Properties.Value := IsNull(v[6], '');
      eEmailCharset.Properties.Value := IsNull(v[7], 'windows-1251');
      eEMailFromEMail.Properties.Value := IsNull(v[8], '');
    end;
  end
  else
    if AButtonIndex = 1 then
    begin
      //редактирование
      ConnectionSMTPEditor;
    end
    else
      if AButtonIndex = 2 then
      begin
        //стираем
        eEmailHost.Properties.Value := '';
        eEmailLogin.Properties.Value := '';
        eEmailPassword.Properties.Value := '';
        eEmailPort.Properties.Value := '';
        eEmailAuthType.Properties.Value := '';
        eEmailTLSType.Properties.Value := '';
        eEmailName.Properties.Value := '';
        eEmailCharset.Properties.Value := '';
        eEMailFromEMail.Properties.Value := '';
      end;
  Grid.FocusedRow := nil;
  Grid.FocusedRow := eEmailHost;
end;

procedure TGEnterpriseForm.eSummerSeasonDateEditPropertiesChange(
  Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TGEnterpriseForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
