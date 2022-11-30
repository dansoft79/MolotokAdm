object ImportDataForm: TImportDataForm
  Left = 436
  Top = 305
  HelpContext = 763200
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1084#1087#1086#1088#1090#1072
  ClientHeight = 604
  ClientWidth = 1199
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpreadSheet: TdxSpreadSheet
    Left = 329
    Top = 50
    Width = 870
    Height = 537
    Align = alClient
    LookAndFeel.ScrollbarMode = sbmDefault
    OptionsView.R1C1Reference = True
    OnDblClick = SpreadSheetDblClick
    Data = {
      A402000044585353763242460C00000042465320000000000100000001000101
      010100000000000001004246532000000000424653200200000001000000200B
      00000007000000430061006C0069006200720069000000000000002000000020
      00000000200000000020000000002000000000200007000000470045004E0045
      00520041004C0000000000000200000000000000000101000000200B00000007
      000000430061006C006900620072006900000000000000200000002000000000
      200000000020000000002000000000200007000000470045004E004500520041
      004C000000000000020000000000000000014246532001000000424653201700
      0000540064007800530070007200650061006400530068006500650074005400
      610062006C006500560069006500770006000000530068006500650074003100
      01FFFFFFFFFFFFFFFF6400000002000000020000000200000055000000140000
      0002000000020000000002000000000000010000000000010100004246532055
      0000000000000042465320000000004246532014000000000000004246532000
      0000000000000000000000010000000000000000000000000000000000000042
      4653200000000002020000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000064000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000020002020002000000
      0000000000000000000000000000020000000000000000000000000000000000
      0000000000000000000000000000000000000202000000000000000042465320
      0000000000000000}
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 587
    Width = 1199
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object DBGrid: TcxGrid
    Left = 0
    Top = 50
    Width = 321
    Height = 537
    Align = alLeft
    Constraints.MinWidth = 1
    TabOrder = 6
    OnExit = DBGridExit
    object DBGridDBTableView: TcxGridDBTableView
      OnKeyPress = DBGridDBTableViewKeyPress
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      DataController.DataSource = DataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.GroupByBox = False
      Styles.OnGetContentStyle = DBGridDBTableViewStylesGetContentStyle
      object DBGridDBTableViewFieldCaption: TcxGridDBColumn
        DataBinding.FieldName = 'FieldCaption'
        Options.Editing = False
        Options.Focusing = False
        Width = 150
      end
      object DBGridDBTableViewFieldColumn: TcxGridDBColumn
        DataBinding.FieldName = 'FieldColumn'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 50
      end
      object DBGridDBTableViewRequired: TcxGridDBColumn
        DataBinding.FieldName = 'Required'
        Visible = False
        VisibleForCustomization = False
      end
      object DBGridDBTableViewDefaultValue: TcxGridDBColumn
        DataBinding.FieldName = 'DefaultValue'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 100
      end
    end
    object DBGridLevel: TcxGridLevel
      GridView = DBGridDBTableView
    end
  end
  object Splitter: TcxSplitter
    Left = 321
    Top = 50
    Width = 8
    Height = 537
    HotZoneClassName = 'TcxSimpleStyle'
    Control = DBGrid
  end
  object ActionList: TDataSetPrmActLst
    Images = UtilForm.ImageList
    ExcludedActions.Strings = (
      'aCancel'
      'aLoad')
    Options = [poHideDisabled]
    CheckMode = cmAfterExecute
    Left = 128
    Top = 80
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      OnExecute = aCancelExecute
    end
    object aOpenFile: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 113
      OnExecute = aOpenFileExecute
    end
    object aSaveFile: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 114
      OnExecute = aSaveFileExecute
    end
    object aImport: TAction
      Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 116
      OnExecute = aImportExecute
    end
    object aClearCol: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1082#1086#1083#1086#1085#1082#1080
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1085#1072#1089#1090#1086#1088#1081#1082#1091' '#1082#1086#1083#1086#1085#1086#1082
      ImageIndex = 282
      OnExecute = aClearColExecute
    end
    object aDeleteFile: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 71
      OnExecute = aDeleteFileExecute
    end
    object aGetCol: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 181
      OnExecute = aGetColExecute
    end
    object aSetCol: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 180
      OnExecute = aSetColExecute
    end
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = UtilForm.ImageList
    ImageOptions.LargeImages = UtilForm.ImageListBig
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 328
    Top = 80
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      50
      0)
    object BarManagerBar1: TdxBar
      AllowClose = False
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'eCaption'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          BeginGroup = True
          UserDefine = [udWidth]
          UserWidth = 54
          Visible = True
          ItemName = 'eFirst'
        end
        item
          Visible = True
          ItemName = 'eLast'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton5: TdxBarButton
      Action = aCancel
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aSetCol
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = aGetCol
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = aDeleteFile
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = aOpenFile
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aSaveFile
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aClearCol
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = aImport
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object eFirst: TcxBarEditItem
      Caption = #1055#1077#1088#1074#1072#1103' '#1089#1090#1088#1086#1082#1072':'
      Category = 0
      Hint = #1055#1077#1088#1074#1072#1103' '#1089#1090#1088#1086#1082#1072
      Visible = ivAlways
      OnKeyDown = eFirst_KeyDown
      ShowCaption = True
      Width = 50
      PropertiesClassName = 'TcxSpinEditProperties'
      Properties.ImmediatePost = True
      Properties.MinValue = 1.000000000000000000
      InternalEditValue = '1'
    end
    object eLast: TcxBarEditItem
      Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1089#1090#1088#1086#1082#1072':'
      Category = 0
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1089#1090#1088#1086#1082#1072
      Visible = ivAlways
      OnKeyDown = eKeyDown
      ShowCaption = True
      Width = 50
      PropertiesClassName = 'TcxSpinEditProperties'
      Properties.ImmediatePost = True
      Properties.MinValue = 1.000000000000000000
      InternalEditValue = '1'
    end
    object eCaption: TcxBarEditItem
      Caption = #1064#1072#1073#1083#1086#1085':'
      Category = 0
      Hint = #1064#1072#1073#1083#1086#1085
      Visible = ivAlways
      ShowCaption = True
      Width = 150
      PropertiesClassName = 'TcxComboBoxProperties'
      Properties.DropDownRows = 20
      Properties.ImmediateDropDownWhenKeyPressed = False
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.ValidationOptions = [evoRaiseException, evoAllowLoseFocus]
      Properties.OnValidate = eCaptionPropertiesValidate
      InternalEditValue = nil
    end
  end
  object mdDatas: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 64
    Top = 292
    object mdDatasFiledName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object mdDatasFieldCaption: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'FieldCaption'
      Size = 200
    end
    object mdDatasFieldColumn: TIntegerField
      DisplayLabel = #1050#1086#1083#1086#1085#1082#1072
      FieldName = 'FieldColumn'
    end
    object mdDatasRequired: TBooleanField
      FieldName = 'Required'
    end
    object mdDatasDefaultValue: TStringField
      DisplayLabel = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      FieldName = 'DefaultValue'
      Size = 200
    end
  end
  object DataSource: TDataSource
    DataSet = mdDatas
    Left = 132
    Top = 293
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 368
    Top = 184
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'xlsx'
    Filter = 
      #1042#1089#1077' '#1092#1072#1083#1081#1099'|*.*|'#1060#1072#1081#1083' Excel '#1076#1086' 2007|*.xls|'#1060#1072#1081#1083' Excel 2007 '#1080' '#1074#1099#1096#1077'|*.' +
      'xlsx'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 212
    Top = 84
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 
      #1042#1089#1077' '#1092#1072#1083#1081#1099'|*.*|'#1060#1072#1081#1083' Excel '#1076#1086' 2007|*.xls|'#1060#1072#1081#1083#1099' Excel 2007 '#1080' '#1074#1099#1096#1077'|*' +
      '.xlsx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 220
    Top = 132
  end
  object TreeScanner: TTreeScanner
    OnFileFound = TreeScannerFileFound
    Left = 696
    Top = 240
  end
end
