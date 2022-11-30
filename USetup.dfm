object FormSetup: TFormSetup
  Left = 404
  Top = 217
  HelpContext = 755500
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1054#1087#1094#1080#1080'...'
  ClientHeight = 561
  ClientWidth = 592
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object VerticalGrid: TcxVerticalGrid
    Left = 0
    Top = 0
    Width = 592
    Height = 528
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    OptionsView.ScrollBars = ssVertical
    OptionsView.RowHeaderWidth = 340
    OptionsBehavior.AlwaysShowEditor = True
    OptionsBehavior.GoToNextCellOnEnter = True
    OptionsBehavior.GoToNextCellOnTab = True
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 551
    Version = 1
    object cMain: TcxCategoryRow
      Properties.Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object eReportCreateTime: TcxEditorRow
      Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1088#1077#1084#1103' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1086#1090#1095#1077#1090#1086#1074
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'True'
      ID = 1
      ParentID = 0
      Index = 0
      Version = 1
    end
    object eAutoUpdateInterval: TcxEditorRow
      Properties.Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093' ('#1084#1080#1085')'
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.MaxValue = 60.000000000000000000
      Properties.EditProperties.MinValue = 1.000000000000000000
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 2
      ParentID = 0
      Index = 1
      Version = 1
    end
    object eDetailUpdateTime: TcxEditorRow
      Properties.Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1076#1077#1090#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' ('#1084#1089#1077#1082')'
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.MaxValue = 10000.000000000000000000
      Properties.EditProperties.MinValue = 100.000000000000000000
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 3
      ParentID = 0
      Index = 2
      Version = 1
    end
    object cbSavePassword: TcxEditorRow
      Properties.Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'False'
      ID = 4
      ParentID = 0
      Index = 3
      Version = 1
    end
    object cbMinimizeToTray: TcxEditorRow
      Properties.Caption = #1057#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1074' '#1090#1088#1077#1081
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'True'
      ID = 5
      ParentID = 0
      Index = 4
      Version = 1
    end
    object eSilentRun: TcxEditorRow
      Properties.Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1073#1077#1079' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.DisplayChecked = #1044#1072
      Properties.EditProperties.DisplayUnchecked = #1053#1077#1090
      Properties.EditProperties.ValueChecked = 'True'
      Properties.EditProperties.ValueUnchecked = 'False'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'False'
      ID = 6
      ParentID = 0
      Index = 5
      Version = 1
    end
    object eOneWindow: TcxEditorRow
      Properties.Caption = #1054#1076#1085#1086#1086#1082#1086#1085#1085#1099#1081' '#1080#1085#1090#1077#1088#1092#1077#1081#1089
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.DisplayChecked = #1044#1072
      Properties.EditProperties.DisplayUnchecked = #1053#1077#1090
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'True'
      ID = 7
      ParentID = 0
      Index = 6
      Version = 1
    end
    object cDataSorce: TcxCategoryRow
      Properties.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1076#1072#1085#1085#1099#1093
      ID = 8
      ParentID = -1
      Index = 1
      Version = 1
    end
    object eServer: TcxEditorRow
      Properties.Caption = #1057#1077#1088#1074#1077#1088
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
      Properties.EditProperties.OnButtonClick = eServerEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 9
      ParentID = 8
      Index = 0
      Version = 1
    end
    object eDatabase: TcxEditorRow
      Properties.Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 10
      ParentID = 8
      Index = 1
      Version = 1
    end
    object eProtocol: TcxEditorRow
      Properties.Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 11
      ParentID = 8
      Index = 2
      Version = 1
    end
    object ePort: TcxEditorRow
      Properties.Caption = #1055#1086#1088#1090
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 12
      ParentID = 8
      Index = 3
      Version = 1
    end
    object eUser: TcxEditorRow
      Properties.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 13
      ParentID = 8
      Index = 4
      Version = 1
    end
    object ePassword: TcxEditorRow
      Properties.Caption = #1055#1072#1088#1086#1083#1100
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 14
      ParentID = 8
      Index = 5
      Version = 1
    end
    object eParams: TcxEditorRow
      Properties.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 15
      ParentID = 8
      Index = 6
      Version = 1
    end
    object cHighlight: TcxCategoryRow
      Properties.Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077
      ID = 16
      ParentID = -1
      Index = 2
      Version = 1
    end
    object cUseSkins: TcxEditorRow
      Properties.Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1089#1082#1080#1085#1099
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'True'
      ID = 17
      ParentID = 16
      Index = 0
      Version = 1
    end
    object eSkin: TcxEditorRow
      Properties.Caption = #1057#1082#1080#1085
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsEditFixedList
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 18
      ParentID = 16
      Index = 1
      Version = 1
    end
    object cNativeStyle: TcxEditorRow
      Properties.Caption = #1056#1086#1076#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.DisplayChecked = #1044#1072
      Properties.EditProperties.DisplayUnchecked = #1053#1077#1090
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'True'
      ID = 19
      ParentID = 16
      Index = 2
      Version = 1
    end
    object cColorScheme: TcxEditorRow
      Properties.Caption = #1057#1093#1077#1084#1072
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsFixedList
      Properties.EditProperties.Items.Strings = (
        'Flat'
        'Standard'
        'UltraFlat'
        'Office11')
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 20
      ParentID = 16
      Index = 3
      Version = 1
    end
    object cDeleted: TcxEditorRow
      Properties.Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      Properties.RepositoryItem = ColorComboBox
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 21
      ParentID = 16
      Index = 4
      Version = 1
    end
    object cAuto: TcxCategoryRow
      Properties.Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1079#1072#1094#1080#1103
      ID = 22
      ParentID = -1
      Index = 3
      Version = 1
    end
    object eCallToCommandLine: TcxEditorRow
      Properties.Caption = #1050#1086#1084#1072#1085#1076#1085#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1076#1083#1103' '#1090#1077#1083#1077#1092#1086#1085#1085#1086#1075#1086' '#1079#1074#1086#1085#1082#1072
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Caption = '<'
          Default = True
          Hint = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          Kind = bkText
        end
        item
          Caption = 'X'
          Hint = #1054#1095#1080#1089#1090#1080#1090#1100
          Kind = bkText
        end>
      Properties.EditProperties.OnButtonClick = eCallToCommandLineEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 23
      ParentID = 22
      Index = 0
      Version = 1
    end
    object eCallToParams: TcxEditorRow
      Properties.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1083#1103' '#1090#1077#1083#1077#1092#1086#1085#1085#1086#1075#1086' '#1079#1074#1086#1085#1082#1072
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 24
      ParentID = 22
      Index = 1
      Version = 1
    end
    object cPath: TcxCategoryRow
      Expanded = False
      Properties.Caption = #1055#1091#1090#1080
      ID = 25
      ParentID = -1
      Index = 4
      Version = 1
    end
    object eBackupDir: TcxEditorRow
      Properties.Caption = 'Backup'
      Properties.RepositoryItem = DirButtonEdit
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 26
      ParentID = 25
      Index = 0
      Version = 1
    end
    object eSQLDir: TcxEditorRow
      Properties.Caption = 'SQL'
      Properties.RepositoryItem = DirButtonEdit
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 27
      ParentID = 25
      Index = 1
      Version = 1
    end
    object eImportDir: TcxEditorRow
      Properties.Caption = #1048#1084#1087#1086#1088#1090
      Properties.RepositoryItem = DirButtonEdit
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 28
      ParentID = 25
      Index = 2
      Version = 1
    end
    object eExportDir: TcxEditorRow
      Properties.Caption = #1069#1082#1089#1087#1086#1088#1090
      Properties.RepositoryItem = DirButtonEdit
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 29
      ParentID = 25
      Index = 3
      Version = 1
    end
    object eDotDir: TcxEditorRow
      Properties.Caption = #1064#1072#1073#1083#1086#1085#1099
      Properties.RepositoryItem = DirButtonEdit
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 30
      ParentID = 25
      Index = 4
      Version = 1
    end
    object eReportDir: TcxEditorRow
      Properties.Caption = #1054#1090#1095#1077#1090#1099
      Properties.RepositoryItem = DirButtonEdit
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 31
      ParentID = 25
      Index = 5
      Version = 1
    end
    object eFileDir: TcxEditorRow
      Properties.Caption = #1060#1072#1081#1083#1099
      Properties.RepositoryItem = DirButtonEdit
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 32
      ParentID = 25
      Index = 6
      Version = 1
    end
    object cBackup: TcxCategoryRow
      Expanded = False
      Properties.Caption = #1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
      ID = 33
      ParentID = -1
      Index = 5
      Version = 1
    end
    object eMySQLUtilPath: TcxEditorRow
      Properties.Caption = #1055#1091#1090#1100' '#1082' '#1091#1090#1080#1083#1080#1090#1077' MySQL'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = eMySQLUtilPathEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 34
      ParentID = 33
      Index = 0
      Version = 1
    end
    object eMySQLDumpUtilPath: TcxEditorRow
      Properties.Caption = #1055#1091#1090#1100' '#1082' '#1091#1090#1080#1083#1080#1090#1077' MySQLDump'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = eMySQLDumpUtilPathEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 35
      ParentID = 33
      Index = 1
      Version = 1
    end
    object eMySQLIniFileName: TcxEditorRow
      Properties.Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' '#1085#1072#1089#1090#1088#1086#1077#1082' MySQL'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = eMySQLIniFileNameEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 36
      ParentID = 33
      Index = 2
      Version = 1
    end
    object eMySQLCharsetDir: TcxEditorRow
      Properties.Caption = #1055#1072#1087#1082#1072' '#1089' '#1086#1087#1080#1089#1072#1085#1080#1103#1084#1080' '#1082#1086#1076#1080#1088#1086#1074#1086#1082
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = eMySQLCharsetDirEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 37
      ParentID = 33
      Index = 3
      Version = 1
    end
    object cBarcode: TcxCategoryRow
      Expanded = False
      Properties.Caption = #1057#1082#1072#1085#1077#1088' '#1096#1090#1088#1080#1093#1082#1086#1076#1072
      ID = 38
      ParentID = -1
      Index = 6
      Version = 1
    end
    object eUseBarcodeScanner: TcxEditorRow
      Properties.Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.DisplayChecked = #1044#1072
      Properties.EditProperties.DisplayUnchecked = #1085#1077#1090
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 39
      ParentID = 38
      Index = 0
      Version = 1
    end
    object eComPortName: TcxEditorRow
      Properties.Caption = #1048#1084#1103' '#1087#1086#1088#1090#1072
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 40
      ParentID = 38
      Index = 1
      Version = 1
    end
    object eBaudRate: TcxEditorRow
      Properties.Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1086#1088#1090#1072
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.MaxValue = 999999.000000000000000000
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 41
      ParentID = 38
      Index = 2
      Version = 1
    end
    object eScanTimeOut: TcxEditorRow
      Properties.Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1095#1090#1077#1085#1080#1103
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.AssignedValues.MinValue = True
      Properties.EditProperties.MaxValue = 1000000.000000000000000000
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 42
      ParentID = 38
      Index = 3
      Version = 1
    end
  end
  object pBottom: TPanel
    Left = 0
    Top = 528
    Width = 592
    Height = 33
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 551
    DesignSize = (
      592
      33)
    object bOK: TcxButton
      Left = 418
      Top = 4
      Width = 80
      Height = 25
      Action = aOK
      Anchors = [akTop, akRight]
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 502
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
    Left = 464
    Top = 308
    PixelsPerInch = 96
    object ColorComboBox: TcxEditRepositoryColorComboBox
      Properties.AllowSelectColor = True
      Properties.CustomColors = <>
      Properties.DefaultDescription = #1062#1074#1077#1090' '#1085#1077' '#1091#1082#1072#1079#1072#1085
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.NamingConvention = cxncX11
      Properties.PrepareList = cxplX11
    end
    object DirButtonEdit: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = DirButtonEditPropertiesButtonClick
    end
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 188
    Top = 304
  end
  object ActionList: TActionList
    Left = 116
    Top = 304
    object aOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = aOKExecute
    end
  end
  object FolderDialog: TcxShellBrowserDialog
    FolderLabelCaption = #1048#1084#1103' '#1087#1072#1087#1082#1080':'
    Options.ShowHidden = True
    Root.BrowseFolder = bfDrives
    Title = #1042#1099#1073#1086#1088' '#1087#1072#1087#1082#1080
    Left = 356
    Top = 204
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 320
    Top = 352
  end
end
