//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ����������
//
//------------------------------------------------------------------------------
program MolotokAdm;

{$I MolotokAdm.inc}

uses
  ShareMem,
  Sysutils,
  jclFileUtils,
  Forms,
  Windows,
  UDatas in 'UDatas.pas' {Datas: TDataModule},
  UUtil in 'UUtil.pas' {UtilForm},
  MainUnit in 'MainUnit.pas' {MainForm},
  USelectType in 'Select\USelectType.pas' {SelectTypeForm},
  USelectOrderTagMulti in 'Select\USelectOrderTagMulti.pas' {SelectOrderTagMultiForm},
  USelectUserMulti in 'Select\USelectUserMulti.pas' {SelectUserMultiForm},
  USelectReportForm in 'Select\USelectReportForm.pas' {SelectReportFormForm},
  USelectNoticeTemplateMulti in 'Select\USelectNoticeTemplateMulti.pas' {SelectNoticeMultiForm},
  USelectTypeMemData in 'Select\USelectTypeMemData.pas' {SelectTypeMemDataForm},
  UConsts in 'UConsts.pas',
  UProgress in 'UProgress.pas' {ProgressForm},
  UWaiting in 'UWaiting.pas' {WaitingForm},
  MesDlgRich in 'MesDlgRich.pas' {ShowMsgRichForm},
  UAbout in 'UAbout.pas' {AboutForm},
  USplash in 'USplash.pas' {SplashForm},
  USetup in 'USetup.pas' {FormSetup},
  UOptions in 'UOptions.pas' {FormOptions},
  UServerFile in 'UServerFile.pas' {ServerFileForm},
  UEnterpriseParams in 'UEnterpriseParams.pas' {GEnterpriseForm},
  UQuery in 'UQuery.pas' {QueryForm},
  USupport in 'USupport.pas' {SupportForm},
  UActivateParams in 'UActivateParams.pas' {ActivateParamsForm},
  UImportXLS in 'UImportXLS.pas' {ImportXLSForm},
  UFRXFunctions in 'UFRXFunctions.pas',
  UReportPreview in 'UReportPreview.pas' {ReportPreview},
  UNoticeTemplateSnap in 'UNoticeTemplateSnap.pas' {NoticeTemplateSnapForm},
  UEnter in 'UEnter.pas' {EnterForm},
  UChangePassword in 'UChangePassword.pas' {ChangePasswordForm},
  UPermitTree in 'UPermitTree.pas' {PermitTreeForm},
  UConnectParams in 'UConnectParams.pas' {ConnectParamsForm},
  UDateParams in 'UDateParams.pas' {DateForm},
  UDateRangeParams in 'UDateRangeParams.pas' {DateRangeForm},
  UConnectionDatabase in 'UConnectionDatabase.pas' {ConnectionDatabaseForm},
  UEditDate in 'UEditDate.pas' {EditDateForm},
  UBackup in 'UBackup.pas' {BackupForm},
  URestoreCloud in 'URestoreCloud.pas' {RestoreCloudForm},
  UEditInteger in 'UEditInteger.pas' {EditIntegerForm},
  UShowText in 'UShowText.pas' {TextForm},
  UShowDataset in 'UShowDataset.pas' {DatasetForm},
  UEditString in 'UEditString.pas' {EditStringForm},
  UAutoUpdateClientData in 'UAutoUpdateClientData.pas' {AutoUpdateClientData: TDataModule},
  UFileParams in 'UFileParams.pas' {FileAddParamsForm},
  UTextEditor in 'UTextEditor.pas' {TextEditorForm},
  UShowDatasetModal in 'UShowDatasetModal.pas' {DatasetModalForm},
  UShowTextModal in 'UShowTextModal.pas' {ModalTextForm},
  URTFEditor in 'URTFEditor.pas' {RTFEditorForm},
  UGReportForm in 'Guide\UGReportForm.pas' {GReportFormForm},
  UGReportFormParams in 'Guide\UGReportFormParams.pas' {ReportFormParamsForm},
  UConnectionSMTP in 'UConnectionSMTP.pas' {ConnectionSMTPForm},
  USelectTypeDB in 'Select\USelectTypeDB.pas' {SelectTypeDBForm},
  MesDlg in 'MesDlg.pas' {ShowMsgForm},
  UDaDataAddressParams in 'UDaDataAddressParams.pas' {AddressDaDataForm},
  UDaDataUtils in 'UDaDataUtils.pas',
  UDaDataJurParams in 'UDaDataJurParams.pas' {DaDataJurForm},
  UDaDataPhisParams in 'UDaDataPhisParams.pas' {DaDataPhisForm},
  PluginInterface in 'PluginInterface.pas',
  URestore in 'URestore.pas' {RestoreForm},
  USelectEMailMulti in 'Select\USelectEMailMulti.pas' {SelectEMailMultiForm},
  UShowPicture in 'UShowPicture.pas' {PictureForm},
  UNoticeTemplate in 'UNoticeTemplate.pas' {NoticeTemplateForm},
  UNoticeTemplateParams in 'UNoticeTemplateParams.pas' {NoticeTemplateParamForm},
  UChangeColumns in 'UChangeColumns.pas',
  UFrColumns in 'UFrColumns.pas' {ColumnsFrame: TFrame},
  UOrderWorkerTimeParams in 'UOrderWorkerTimeParams.pas' {OrderWorkerTimeParamsForm},
  UGUserRoleParams in 'Guide\UGUserRoleParams.pas' {DepartmentParamForm},
  UGUserRole in 'Guide\UGUserRole.pas' {GUserRoleForm},
  UGSignalTypeParams in 'Guide\UGSignalTypeParams.pas' {GSignalTypeParamForm},
  UGSignalType in 'Guide\UGSignalType.pas' {GSignalTypeForm},
  UGWorkClass in 'Guide\UGWorkClass.pas' {GWorkClassForm},
  UGWorkClassParams in 'Guide\UGWorkClassParams.pas' {GWorkClassParamForm},
  UGWorkerClass in 'Guide\UGWorkerClass.pas' {GWorkerClassForm},
  UGWorkerClassParams in 'Guide\UGWorkerClassParams.pas' {GWorkerClassParamForm},
  UGWorkType in 'Guide\UGWorkType.pas' {GWorkTypeForm},
  UGPaymentFormParams in 'Guide\UGPaymentFormParams.pas' {GPaymentFormParamForm},
  UGPaymentForm in 'Guide\UGPaymentForm.pas' {GPaymentFormForm},
  UGStatusTypeParams in 'Guide\UGStatusTypeParams.pas' {GStatusTypeParamForm},
  UGOrderTag in 'Guide\UGOrderTag.pas' {GOrderTagForm},
  UGOrderTagParams in 'Guide\UGOrderTagParams.pas' {GOrderTagParamForm},
  UGStatusType in 'Guide\UGStatusType.pas' {GStatusTypeForm},
  UGSearchHint in 'Guide\UGSearchHint.pas' {GSearchHintForm},
  UNoticeTemplateActionParams in 'UNoticeTemplateActionParams.pas' {NoticeTEmplateActionParamForm},
  USelectWorkerCompany in 'Select\USelectWorkerCompany.pas' {SelectWorkerCompanyForm},
  USelectWorker in 'Select\USelectWorker.pas' {SelectWorkerForm},
  USelectWorkerClassMulti in 'Select\USelectWorkerClassMulti.pas' {SelectWorkerClassMultiForm},
  UGWorkerCompany in 'Guide\UGWorkerCompany.pas' {GWorkerCompanyForm},
  UGWorkerCompanyParams in 'Guide\UGWorkerCompanyParams.pas' {GWorkerCompanyParamForm},
  UWorkTypeSynonym in 'UWorkTypeSynonym.pas' {WorkTypeSynonymForm},
  UWorkTypeSynonymParams in 'UWorkTypeSynonymParams.pas' {WorkTypeSynonymParamForm},
  UOrderList in 'UOrderList.pas' {OrderListForm},
  UGClient in 'Guide\UGClient.pas' {GClientForm},
  UScheduleParams in 'UScheduleParams.pas' {ScheduleParamForm},
  UGUser in 'Guide\UGUser.pas' {GUserForm},
  UGUserParams in 'Guide\UGUserParams.pas' {UserParamForm},
  UGWorker in 'Guide\UGWorker.pas' {GWorkerForm},
  UGWorkerParams in 'Guide\UGWorkerParams.pas' {GWorkerParamForm},
  UWorkerLead in 'UWorkerLead.pas' {WorkerLeadForm},
  UWorkerLeadParams in 'UWorkerLeadParams.pas' {WorkerLeadParamForm},
  USelectWorkTypeMulti in 'Select\USelectWorkTypeMulti.pas' {SelectWorkTypeMultiForm},
  USelectWorkClass in 'Select\USelectWorkClass.pas' {SelectWorkClassForm},
  USelectWorkType in 'Select\USelectWorkType.pas' {SelectWorkTypeForm},
  USelectStatusTypeMulti in 'Select\USelectStatusTypeMulti.pas' {SelectStatusTypeMultiForm},
  USelectClient in 'Select\USelectClient.pas' {SelectClientForm},
  USelectDistrictMulti in 'Select\USelectDistrictMulti.pas' {SelectDistrictMultiForm},
  UGClientParams in 'Guide\UGClientParams.pas' {GClientParamForm},
  UGDiscountType in 'Guide\UGDiscountType.pas' {GDiscountTypeForm},
  UGDiscountTypeParams in 'Guide\UGDiscountTypeParams.pas' {GDiscountTypeParamForm},
  UClientRequest in 'UClientRequest.pas' {ClientRequestForm},
  USelectDiscount in 'Select\USelectDiscount.pas' {SelectDiscountForm},
  cxSchedulerEventEditor in 'cxSchedulerEventEditor.pas' {cxSchedulerEventEditorForm},
  USelectStatusType in 'Select\USelectStatusType.pas' {SelectStatusTypeForm},
  UGDistrict in 'Guide\UGDistrict.pas' {GDistrictForm},
  UGDistrictParams in 'Guide\UGDistrictParams.pas' {GDistrictParamForm},
  USelectWorkerClass in 'Select\USelectWorkerClass.pas' {SelectWorkerClassForm},
  UGWorkTypeParams in 'Guide\UGWorkTypeParams.pas' {GWorkTypeParamsForm},
  UOrderListParams in 'UOrderListParams.pas' {OrderParamForm},
  USelectUser in 'Select\USelectUser.pas' {SelectEmployeeForm},
  UOrderWorkTypeParams in 'UOrderWorkTypeParams.pas' {OrderListWorkTypeParamsForm},
  UEditText in 'UEditText.pas' {EditTextForm},
  USchedulerWorkerHint in 'USchedulerWorkerHint.pas' {SchedulerWorkerHintForm},
  UBcrypt in 'UBcrypt.pas',
  UGReason in 'Guide\UGReason.pas' {GReasonForm},
  UGReasonParams in 'Guide\UGReasonParams.pas' {GReasonParamForm},
  UBrowseNotification in 'UBrowseNotification.pas' {BrowseNotificationForm},
  UGSourceTypeParams in 'Guide\UGSourceTypeParams.pas' {GSourceTypeParamForm},
  UGSourceType in 'Guide\UGSourceType.pas' {GSourceTypeForm},
  UGMetro in 'Guide\UGMetro.pas' {GMetroForm},
  UGMetroParams in 'Guide\UGMetroParams.pas' {GMetroParamForm},
  UReportSnap in 'UReportSnap.pas' {ReportSnapForm},
  USelectReportMulti in 'Select\USelectReportMulti.pas' {SelectReportMultiForm},
  UGAddressLimit in 'Guide\UGAddressLimit.pas' {GAddressLimitForm},
  UGAddressLimitParams in 'Guide\UGAddressLimitParams.pas' {RecordParamsForm},
  UNoticeOptionsActionParams in 'UNoticeOptionsActionParams.pas' {NoticeOptionsActionParamsForm},
  UNoticeOptionsAction in 'UNoticeOptionsAction.pas' {NoticeOptionsActionForm},
  UNoticeOptionsTime in 'UNoticeOptionsTime.pas' {NoticeOptionsTimeForm},
  UNoticeOptionsTimeParams in 'UNoticeOptionsTimeParams.pas' {NoticeOptionsTimeParamsForm},
  UBrowseOrderArch in 'UBrowseOrderArch.pas' {BrowseOrderArchForm},
  UGSearchHintParams in 'Guide\UGSearchHintParams.pas' {GSearchHintParamForm},
  UNoticeTemplateConditionParams in 'UNoticeTemplateConditionParams.pas' {NoticeTEmplateConditionParamForm},
  UGFAQ in 'Guide\UGFAQ.pas' {GFAQForm},
  UGFAQParams in 'Guide\UGFAQParams.pas' {GFAQParamForm},
  USelectDistrict in 'Select\USelectDistrict.pas' {SelectDistrictForm};

{$R *.RES}

begin
  Application.Initialize;

  Application.Title := 'PortalPro';

  LoadOptions;{ ������ ���������� }

  if (Trim(ParamValue('plugin')) = '') or (Trim(ParamValue('command')) = '') then
  begin
    ShowSplash;
  end
  else
  begin
    Application.Minimize;
  end;

  Datas := TDatas.Create(nil);

  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.