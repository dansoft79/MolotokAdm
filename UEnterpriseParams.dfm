object GEnterpriseForm: TGEnterpriseForm
  Left = 382
  Top = 226
  HelpContext = 627600
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '#1089#1077#1088#1074#1080#1089#1072
  ClientHeight = 752
  ClientWidth = 570
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxVerticalGrid
    Left = 0
    Top = 0
    Width = 570
    Height = 719
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    OptionsView.RowHeaderWidth = 318
    OptionsBehavior.AlwaysShowEditor = True
    OptionsBehavior.GoToNextCellOnEnter = True
    OptionsBehavior.GoToNextCellOnTab = True
    ParentFont = False
    TabOrder = 0
    OnKeyDown = GridKeyDown
    Version = 1
    object gMain: TcxCategoryRow
      Properties.Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object eName: TcxEditorRow
      Properties.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.ValidateOnEnter = True
      Properties.Value = ''
      Styles.Header = cxStyle1
      ID = 1
      ParentID = 0
      Index = 0
      Version = 1
    end
    object eShortName: TcxEditorRow
      Properties.Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.ValidateOnEnter = True
      Properties.Value = ''
      Styles.Header = cxStyle1
      ID = 2
      ParentID = 0
      Index = 1
      Version = 1
    end
    object eINN: TcxEditorRow
      Properties.Caption = #1048#1053#1053
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 80
      ParentID = 0
      Index = 2
      Version = 1
    end
    object eOGRN: TcxEditorRow
      Properties.Caption = #1054#1043#1056#1053
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 81
      ParentID = 0
      Index = 3
      Version = 1
    end
    object eMasterName: TcxEditorRow
      Properties.Caption = #1060#1048#1054' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 3
      ParentID = 0
      Index = 4
      Version = 1
    end
    object eMasterPost: TcxEditorRow
      Properties.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 4
      ParentID = 0
      Index = 5
      Version = 1
    end
    object eAddress: TcxEditorRow
      Properties.Caption = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 5
      ParentID = 0
      Index = 6
      Version = 1
    end
    object eAddressJur: TcxEditorRow
      Properties.Caption = #1040#1076#1088#1077#1089' '#1102#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 82
      ParentID = 0
      Index = 7
      Version = 1
    end
    object ePhone: TcxEditorRow
      Properties.Caption = #1058#1077#1083#1077#1092#1086#1085
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 6
      ParentID = 0
      Index = 8
      Version = 1
    end
    object eWEBSite: TcxEditorRow
      Properties.Caption = 'Web-'#1089#1072#1081#1090
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 7
      ParentID = 0
      Index = 9
      Version = 1
    end
    object eEMail: TcxEditorRow
      Properties.Caption = 'EMail'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      ID = 8
      ParentID = 0
      Index = 10
      Version = 1
    end
    object gOptions: TcxCategoryRow
      Properties.Caption = #1054#1087#1094#1080#1080
      ID = 9
      ParentID = -1
      Index = 1
      Version = 1
    end
    object eUpdateURL: TcxEditorRow
      Properties.Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = ''
      Styles.Header = cxStyle1
      ID = 10
      ParentID = 9
      Index = 0
      Version = 1
    end
    object eWorkDay: TcxEditorRow
      Properties.Caption = #1056#1072#1073#1086#1095#1080#1077' '#1076#1085#1080
      Properties.EditPropertiesClassName = 'TcxCheckComboBoxProperties'
      Properties.EditProperties.EmptySelectionText = #1053#1077' '#1091#1082#1072#1079#1072#1085#1099
      Properties.EditProperties.DropDownRows = 7
      Properties.EditProperties.DropDownSizeable = True
      Properties.EditProperties.EditValueFormat = cvfStatesString
      Properties.EditProperties.Items = <
        item
          Description = #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
        end
        item
          Description = #1042#1090#1086#1088#1085#1080#1082
        end
        item
          Description = #1057#1088#1077#1076#1072
        end
        item
          Description = #1063#1077#1090#1074#1077#1088#1075
        end
        item
          Description = #1055#1103#1090#1085#1080#1094#1072
        end
        item
          Description = #1057#1091#1073#1073#1086#1090#1072
        end
        item
          Description = #1042#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077
        end>
      Properties.Value = Null
      Styles.Header = cxStyle1
      ID = 11
      ParentID = 9
      Index = 1
      Version = 1
    end
    object eWorkTime: TcxEditorRow
      Properties.Caption = #1056#1072#1073#1086#1095#1077#1077' '#1074#1088#1077#1084#1103
      Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
      Properties.EditProperties.AlwaysShowBlanksAndLiterals = True
      Properties.EditProperties.EditMask = '!00:00-00:00;1;_'
      Properties.Value = '00:00-00:00'
      Styles.Header = cxStyle1
      ID = 12
      ParentID = 9
      Index = 2
      Version = 1
    end
    object eOldOrderTime: TcxEditorRow
      Properties.Caption = #1042#1088#1077#1084#1103' '#1087#1086#1082#1072#1079#1072' '#1079#1072#1082#1088#1099#1090#1099#1093' '#1079#1072#1082#1072#1079#1086#1074', '#1095
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.AssignedValues.MinValue = True
      Properties.EditProperties.ImmediatePost = True
      Properties.Value = Null
      ID = 13
      ParentID = 9
      Index = 3
      Version = 1
    end
    object eCheckUpdateTime: TcxEditorRow
      Properties.Caption = #1042#1088#1077#1084#1103' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1082#1072#1079#1086#1074', '#1089#1077#1082
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.Value = Null
      ID = 14
      ParentID = 9
      Index = 4
      Version = 1
    end
    object eNotificationTime: TcxEditorRow
      Properties.Caption = #1055#1077#1088#1080#1086#1076' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081', '#1095
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.MaxValue = 24.000000000000000000
      Properties.EditProperties.MinValue = 1.000000000000000000
      Properties.Value = Null
      ID = 15
      ParentID = 9
      Index = 5
      Version = 1
    end
    object eMaxDiscount: TcxEditorRow
      Properties.Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1084#1077#1088' '#1089#1082#1080#1076#1082#1080' (%)'
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.AssignedValues.MinValue = True
      Properties.EditProperties.MaxValue = 99.000000000000000000
      Properties.Value = Null
      ID = 16
      ParentID = 9
      Index = 6
      Version = 1
    end
    object eAPIKeyDadata: TcxEditorRow
      Properties.Caption = 'API-'#1082#1083#1102#1095' '#1089#1077#1088#1074#1080#1089#1072' Dadata'
      Properties.Value = Null
      ID = 17
      ParentID = 9
      Index = 7
      Version = 1
    end
    object eSecretKeyDadata: TcxEditorRow
      Properties.Caption = #1057#1077#1082#1088#1077#1090#1085#1099#1081' '#1082#1083#1102#1095' '#1089#1077#1088#1074#1080#1089#1072' Dadata'
      Properties.Value = Null
      ID = 18
      ParentID = 9
      Index = 8
      Version = 1
    end
    object gClientSite: TcxCategoryRow
      Properties.Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1083#1080#1077#1085#1090#1089#1082#1086#1075#1086' '#1089#1072#1081#1090#1072
      ID = 19
      ParentID = -1
      Index = 2
      Version = 1
    end
    object eSignalTypeLead: TcxEditorRow
      Properties.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1083#1080#1076#1072
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.EditProperties.ImmediatePost = True
      Properties.Value = Null
      ID = 20
      ParentID = 19
      Index = 0
      Version = 1
    end
    object eStatusTypeLead: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1083#1080#1076#1072
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.EditProperties.ImmediatePost = True
      Properties.Value = Null
      ID = 21
      ParentID = 19
      Index = 1
      Version = 1
    end
    object eSourceTypeLead: TcxEditorRow
      Properties.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1083#1080#1076#1072
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 22
      ParentID = 19
      Index = 2
      Version = 1
    end
    object eSignalTypeRequest: TcxEditorRow
      Properties.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1079#1072#1082#1072#1079#1072
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 23
      ParentID = 19
      Index = 3
      Version = 1
    end
    object eStatusTypeRequest: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1079#1072#1082#1072#1079#1072
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 24
      ParentID = 19
      Index = 4
      Version = 1
    end
    object eSourceTypeRequest: TcxEditorRow
      Properties.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1079#1072#1082#1072#1079#1072
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 25
      ParentID = 19
      Index = 5
      Version = 1
    end
    object eStatusTypeCancel: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1086#1090#1084#1077#1085#1099' '#1079#1072#1082#1072#1079#1072
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsFixedList
      Properties.Value = Null
      ID = 26
      ParentID = 19
      Index = 6
      Version = 1
    end
    object eOurWorkTime: TcxEditorRow
      Properties.Caption = #1042#1088#1077#1084#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' "'#1053#1072#1096#1080' '#1088#1072#1073#1086#1090#1099'" ('#1089'.)'
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.MinValue = 1.000000000000000000
      Properties.Value = '1'
      ID = 27
      ParentID = 19
      Index = 7
      Version = 1
    end
    object cMasterApplication: TcxCategoryRow
      Properties.Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' '#1084#1072#1089#1090#1077#1088#1072
      ID = 28
      ParentID = -1
      Index = 3
      Version = 1
    end
    object eMasterLicFileLink: TcxEditorRow
      Properties.Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1092#1072#1081#1083' '#1083#1080#1094#1077#1085#1079#1080#1086#1085#1085#1086#1075#1086' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
      Properties.Value = Null
      ID = 29
      ParentID = 28
      Index = 0
      Version = 1
    end
    object eMasterCoordTelegram: TcxEditorRow
      Properties.Caption = #1058#1077#1083#1077#1075#1088#1072#1084' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1086#1088#1072
      Properties.Value = Null
      ID = 30
      ParentID = 28
      Index = 1
      Version = 1
    end
    object eMasterCoordPhone: TcxEditorRow
      Properties.Caption = #1058#1077#1083#1077#1092#1086#1085' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1086#1088#1072
      Properties.Value = Null
      ID = 31
      ParentID = 28
      Index = 2
      Version = 1
    end
    object eStatusMasterConfirmArea: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1086#1073#1083#1072#1089#1090#1080' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 32
      ParentID = 28
      Index = 3
      Version = 1
    end
    object eStatusMasterButtonAcceptOrder: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1055#1088#1080#1085#1103#1090#1100' '#1079#1072#1082#1072#1079
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 33
      ParentID = 28
      Index = 4
      Version = 1
    end
    object eStatusMasterButtonCancelOrder: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1054#1090#1082#1083#1086#1085#1080#1090#1100' '#1079#1072#1082#1072#1079
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 34
      ParentID = 28
      Index = 5
      Version = 1
    end
    object eSignalMasterCancelOrder: TcxEditorRow
      Height = 17
      Properties.Caption = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1054#1090#1082#1083#1086#1085#1080#1090#1100
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 35
      ParentID = 28
      Index = 6
      Version = 1
    end
    object eStatusMasterButtonOnTime: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1041#1091#1076#1091' '#1074#1086#1074#1088#1077#1084#1103
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 36
      ParentID = 28
      Index = 7
      Version = 1
    end
    object eStatusMasterButtonLateOrder: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1047#1072#1076#1077#1088#1078#1080#1074#1072#1102#1089#1100
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 37
      ParentID = 28
      Index = 8
      Version = 1
    end
    object eSignalMasterLaterOrder: TcxEditorRow
      Properties.Caption = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1047#1072#1076#1077#1088#1078#1080#1074#1072#1102#1089#1100
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 38
      ParentID = 28
      Index = 9
      Version = 1
    end
    object eStatusMasterButtonCameOrder: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1055#1088#1080#1073#1099#1083' '#1085#1072' '#1079#1072#1082#1072#1079
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 39
      ParentID = 28
      Index = 10
      Version = 1
    end
    object eStatusMasterButtonStartWork: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1055#1088#1080#1089#1090#1091#1087#1080#1083' '#1082' '#1088#1072#1073#1086#1090#1077
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 40
      ParentID = 28
      Index = 11
      Version = 1
    end
    object eStatusMasterButtonSendPay: TcxEditorRow
      Height = 17
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1086#1087#1083#1072#1090#1091
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 41
      ParentID = 28
      Index = 12
      Version = 1
    end
    object eStatusMasterButtonClientPaid: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1050#1083#1080#1077#1085#1090' '#1086#1087#1083#1072#1090#1080#1083
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 42
      ParentID = 28
      Index = 13
      Version = 1
    end
    object eStatusMasterButtonFinishOrder: TcxEditorRow
      Properties.Caption = #1057#1090#1072#1090#1091#1089' '#1082#1085#1086#1087#1082#1080' '#1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1079#1072#1082#1072#1079
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.Value = Null
      ID = 43
      ParentID = 28
      Index = 14
      Version = 1
    end
    object GridCategoryRow7: TcxCategoryRow
      Expanded = False
      Properties.Caption = #1057#1052#1057'-'#1087#1088#1086#1074#1072#1081#1076#1077#1088
      ID = 44
      ParentID = -1
      Index = 4
      Version = 1
    end
    object eSMSServiceLogin: TcxEditorRow
      Properties.Caption = #1051#1086#1075#1080#1085' '#1089#1084#1089'-'#1089#1077#1088#1074#1080#1089#1072
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 45
      ParentID = 44
      Index = 0
      Version = 1
    end
    object eSMSServicePassword: TcxEditorRow
      Properties.Caption = #1055#1072#1088#1086#1083#1100' '#1089#1084#1089'-'#1089#1077#1088#1074#1080#1089#1072
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 46
      ParentID = 44
      Index = 1
      Version = 1
    end
    object eSMSServiceSender: TcxEditorRow
      Properties.Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 47
      ParentID = 44
      Index = 2
      Version = 1
    end
    object GridCategoryRow8: TcxCategoryRow
      Expanded = False
      Properties.Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1089#1077#1088#1074#1080#1089' '#1070'Money'
      ID = 48
      ParentID = -1
      Index = 5
      Version = 1
    end
    object ePaymentFormYoomoney: TcxEditorRow
      Properties.Caption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099' '#1070'Money'
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsFixedList
      Properties.Value = Null
      ID = 49
      ParentID = 48
      Index = 0
      Version = 1
    end
    object eYoomoneyShopID: TcxEditorRow
      Properties.Caption = 'ID '#1084#1072#1075#1072#1079#1080#1085#1072
      Properties.Value = Null
      ID = 50
      ParentID = 48
      Index = 1
      Version = 1
    end
    object eYoomoneyKey: TcxEditorRow
      Properties.Caption = #1050#1083#1102#1095
      Properties.Value = Null
      ID = 51
      ParentID = 48
      Index = 2
      Version = 1
    end
    object GridCategoryRow3: TcxCategoryRow
      Expanded = False
      Properties.Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
      ID = 52
      ParentID = -1
      Index = 6
      Version = 1
    end
    object eWorkPeriodStart: TcxEditorRow
      Properties.Caption = #1053#1072#1095#1072#1083#1086' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      Properties.EditPropertiesClassName = 'TcxDateEditProperties'
      Properties.Value = Null
      Styles.Header = cxStyle1
      ID = 53
      ParentID = 52
      Index = 0
      Version = 1
    end
    object eWorkPeriodEnd: TcxEditorRow
      Properties.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      Properties.EditPropertiesClassName = 'TcxDateEditProperties'
      Properties.Value = Null
      Styles.Header = cxStyle1
      ID = 54
      ParentID = 52
      Index = 1
      Version = 1
    end
    object ePhotoWidth: TcxEditorRow
      Properties.Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1096#1080#1088#1080#1085#1072' '#1092#1086#1090#1086
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.MaxValue = 1024.000000000000000000
      Properties.EditProperties.MinValue = 1.000000000000000000
      Properties.EditProperties.SpinButtons.ShowFastButtons = True
      Properties.Value = Null
      ID = 55
      ParentID = 52
      Index = 2
      Version = 1
    end
    object ePhotoHeight: TcxEditorRow
      Properties.Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1074#1099#1089#1086#1090#1072' '#1092#1086#1090#1086
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.MaxValue = 1024.000000000000000000
      Properties.EditProperties.MinValue = 1.000000000000000000
      Properties.EditProperties.SpinButtons.ShowFastButtons = True
      Properties.Value = Null
      ID = 56
      ParentID = 52
      Index = 3
      Version = 1
    end
    object GridCategoryRow4: TcxCategoryRow
      Expanded = False
      Properties.Caption = #1061#1088#1072#1085#1080#1083#1080#1097#1077' '#1092#1072#1081#1083#1086#1074
      ID = 57
      ParentID = -1
      Index = 7
      Version = 1
    end
    object eFileServerType: TcxEditorRow
      Properties.Caption = #1058#1080#1087
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsFixedList
      Properties.EditProperties.Items.Strings = (
        #1057#1077#1088#1074#1077#1088' '#1074' '#1083#1086#1082#1072#1083#1100#1085#1086#1081' '#1089#1077#1090#1080
        #1057#1077#1088#1074#1077#1088' FTP')
      Properties.Value = #1057#1077#1088#1074#1077#1088' '#1074' '#1083#1086#1082#1072#1083#1100#1085#1086#1081' '#1089#1077#1090#1080
      ID = 58
      ParentID = 57
      Index = 0
      Version = 1
    end
    object eFileServerHost: TcxEditorRow
      Properties.Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 59
      ParentID = 57
      Index = 1
      Version = 1
    end
    object eFileServerDir: TcxEditorRow
      Properties.Caption = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1092#1072#1081#1083#1086#1074
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 60
      ParentID = 57
      Index = 2
      Version = 1
    end
    object eFileServerUser: TcxEditorRow
      Properties.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 61
      ParentID = 57
      Index = 3
      Version = 1
    end
    object eFileServerPassword: TcxEditorRow
      Properties.Caption = #1055#1072#1088#1086#1083#1100
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 62
      ParentID = 57
      Index = 4
      Version = 1
    end
    object eFileServerPort: TcxEditorRow
      Properties.Caption = #1055#1086#1088#1090
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.Value = Null
      ID = 63
      ParentID = 57
      Index = 5
      Version = 1
    end
    object GridCategoryRow5: TcxCategoryRow
      Expanded = False
      Properties.Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072
      ID = 64
      ParentID = -1
      Index = 8
      Version = 1
    end
    object eEmailHost: TcxEditorRow
      Properties.Caption = #1040#1076#1088#1077#1089' SMTP '#1089#1077#1088#1074#1077#1088#1072
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end
        item
          Caption = '^'
          Kind = bkText
        end
        item
          Caption = 'X'
          Kind = bkText
        end>
      Properties.EditProperties.OnButtonClick = eEmailHostEditPropertiesButtonClick
      Properties.Value = Null
      ID = 65
      ParentID = 64
      Index = 0
      Version = 1
    end
    object eEmailLogin: TcxEditorRow
      Properties.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 66
      ParentID = 64
      Index = 1
      Version = 1
    end
    object eEmailPassword: TcxEditorRow
      Properties.Caption = #1055#1072#1088#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 67
      ParentID = 64
      Index = 2
      Version = 1
    end
    object eEmailPort: TcxEditorRow
      Properties.Caption = #1055#1086#1088#1090
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.AssignedValues.MinValue = True
      Properties.EditProperties.MaxValue = 65535.000000000000000000
      Properties.Value = Null
      ID = 68
      ParentID = 64
      Index = 3
      Version = 1
    end
    object eEmailAuthType: TcxEditorRow
      Properties.Caption = #1058#1080#1087' '#1072#1074#1090#1086#1088#1080#1079#1072#1094#1080#1080
      Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.EditProperties.Items = <
        item
          Description = #1053#1077' '#1091#1082#1072#1079#1072#1085#1086
          ImageIndex = 0
          Value = 0
        end
        item
          Description = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          Value = 1
        end
        item
          Description = 'SASL'
          Value = 2
        end>
      Properties.Value = Null
      ID = 69
      ParentID = 64
      Index = 4
      Version = 1
    end
    object eEmailTLSType: TcxEditorRow
      Properties.Caption = #1058#1080#1087' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103
      Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.EditProperties.Items = <
        item
          Description = 'TLS '#1085#1077' '#1087#1086#1076#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Implicit TLS'
          Value = 1
        end
        item
          Description = 'Require TLS'
          Value = 2
        end
        item
          Description = 'Explicit TLS'
          Value = 3
        end>
      Properties.Value = Null
      ID = 70
      ParentID = 64
      Index = 5
      Version = 1
    end
    object eEmailName: TcxEditorRow
      Properties.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1077#1088#1074#1077#1088#1072
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 71
      ParentID = 64
      Index = 6
      Version = 1
    end
    object eEmailCharset: TcxEditorRow
      Properties.Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 72
      ParentID = 64
      Index = 7
      Version = 1
    end
    object eEmailFromEMail: TcxEditorRow
      Properties.Caption = #1054#1073#1088#1072#1090#1085#1099#1081' '#1072#1076#1088#1077#1089
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 73
      ParentID = 64
      Index = 8
      Version = 1
    end
    object eEMailCollection: TcxEditorRow
      Properties.Caption = #1040#1076#1088#1077#1089' '#1076#1083#1103' '#1089#1073#1086#1088#1082#1080' '#1086#1090#1087#1088#1072#1074#1083#1103#1077#1084#1086#1081' '#1087#1086#1095#1090#1099
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.Value = Null
      ID = 74
      ParentID = 64
      Index = 9
      Version = 1
    end
    object eEmailPreview: TcxEditorRow
      Properties.Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1087#1080#1089#1077#1084
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.DisplayChecked = #1044#1072
      Properties.EditProperties.DisplayUnchecked = #1053#1077#1090
      Properties.EditProperties.ValueChecked = '1'
      Properties.EditProperties.ValueUnchecked = '0'
      Properties.Value = 'False'
      ID = 75
      ParentID = 64
      Index = 10
      Version = 1
    end
    object eEMailPreviewClient: TcxEditorRow
      Properties.Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1087#1080#1089#1077#1084' '#1074' '#1087#1086#1095#1090#1086#1074#1086#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.DisplayChecked = #1044#1072
      Properties.EditProperties.DisplayUnchecked = #1053#1077#1090
      Properties.EditProperties.ValueChecked = '1'
      Properties.EditProperties.ValueUnchecked = '0'
      Properties.Value = 'False'
      ID = 76
      ParentID = 64
      Index = 11
      Version = 1
    end
    object eEMailNotification: TcxEditorRow
      Properties.Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086' '#1087#1088#1086#1095#1090#1077#1085#1080#1080
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.DisplayChecked = #1044#1072
      Properties.EditProperties.DisplayUnchecked = #1053#1077#1090
      Properties.EditProperties.ValueChecked = '1'
      Properties.EditProperties.ValueUnchecked = '0'
      Properties.Value = Null
      ID = 77
      ParentID = 64
      Index = 12
      Version = 1
    end
    object eEMailJPGQuality: TcxEditorRow
      Properties.Caption = #1050#1072#1095#1077#1089#1090#1074#1086' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1086#1090#1095#1077#1090#1086#1074' '#1074' JPG'
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.MaxValue = 100.000000000000000000
      Properties.EditProperties.MinValue = 50.000000000000000000
      Properties.EditProperties.SpinButtons.Position = sbpHorzRight
      Properties.EditProperties.SpinButtons.ShowFastButtons = True
      Properties.Value = Null
      ID = 78
      ParentID = 64
      Index = 13
      Version = 1
    end
    object eEMailJPGRes: TcxEditorRow
      Properties.Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1077' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1086#1090#1095#1077#1090#1086#1074' '#1074' JPG'
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.LargeIncrement = 100.000000000000000000
      Properties.EditProperties.MaxValue = 600.000000000000000000
      Properties.EditProperties.MinValue = 100.000000000000000000
      Properties.EditProperties.SpinButtons.Position = sbpHorzRight
      Properties.EditProperties.SpinButtons.ShowFastButtons = True
      Properties.Value = Null
      ID = 79
      ParentID = 64
      Index = 14
      Version = 1
    end
  end
  object pButtons: TPanel
    Left = 0
    Top = 719
    Width = 570
    Height = 33
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      570
      33)
    object bOK: TcxButton
      Left = 397
      Top = 4
      Width = 80
      Height = 25
      Action = aOK
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 481
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      OptionsImage.NumGlyphs = 2
      TabOrder = 1
    end
  end
  object EditRepository: TcxEditRepository
    Left = 392
    Top = 72
    PixelsPerInch = 96
    object TextItem: TcxEditRepositoryTextItem
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 392
    Top = 128
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 300
    Top = 60
    object aOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = aOKExecute
    end
  end
end
