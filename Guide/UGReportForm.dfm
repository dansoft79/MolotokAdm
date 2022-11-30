object GReportFormForm: TGReportFormForm
  Left = 331
  Top = 196
  Caption = #1042#1080#1076#1099' '#1086#1090#1095#1077#1090#1086#1074
  ClientHeight = 448
  ClientWidth = 825
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
  DefaultMonitor = dmMainForm
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 427
    Width = 825
    Height = 21
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object Button1: TButton
    Left = 152
    Top = 240
    Width = 329
    Height = 25
    Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1074#1077#1088#1089#1080#1102' '#1086#1090#1095#1077#1090#1086#1074' '#1080' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' ('#1057') '#1076#1086' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1075#1086#1076#1072
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object Grid: TcxGrid
    Left = 0
    Top = 50
    Width = 825
    Height = 377
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object TableView: TcxGridDBTableView
      PopupMenu = dxBarPopupMenu
      OnDblClick = DBGridDblClick
      OnKeyDown = TableViewKeyDown
      OnKeyPress = TableViewKeyPress
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      OnFocusedRecordChanged = TableViewFocusedRecordChanged
      DataController.DataSource = DataSource
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
        Width = 200
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 200
      end
      object TableViewSize: TcxGridDBColumn
        DataBinding.FieldName = 'Size'
      end
      object TableViewVersion: TcxGridDBColumn
        DataBinding.FieldName = 'Version'
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 200
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 108
    Top = 104
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
    Left = 240
    Top = 104
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
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton11'
        end
        item
          Visible = True
          ItemName = 'dxBarButton12'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end>
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object dxBarButton4: TdxBarButton
      Action = aOK
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Action = aCancel
      Align = iaRight
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = aAdd
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = aDelete
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aEdit
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = aPrint
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = aCreateReport
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aEditForm
      Category = 0
    end
    object dxBarButton9: TdxBarButton
      Action = aImportForm
      Category = 0
    end
    object dxBarButton10: TdxBarButton
      Action = aExportForm
      Category = 0
    end
    object dxBarButton11: TdxBarButton
      Action = aOpenForm
      Category = 0
    end
    object dxBarButton12: TdxBarButton
      Action = aSaveForm
      Category = 0
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 172
    Top = 104
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 100
      ShortCut = 16449
      OnExecute = aAddExecute
    end
    object aDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 101
      ShortCut = 16452
      OnExecute = aDeleteExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 102
      ShortCut = 16453
      OnExecute = aEditExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 103
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aOK: TAction
      Caption = 'OK'
      Hint = 'OK'
      ImageIndex = 98
      ShortCut = 16397
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aEditForm: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1092#1086#1088#1084#1091
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 9
      OnExecute = aEditFormExecute
    end
    object aCreateReport: TAction
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1086#1090#1095#1077#1090
      Hint = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1086#1090#1095#1077#1090
      ImageIndex = 61
      OnExecute = aCreateReportExecute
    end
    object aImportForm: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1092#1086#1088#1084
      Hint = #1048#1084#1087#1086#1088#1090' '#1092#1086#1088#1084
      ImageIndex = 109
      OnExecute = aImportFormExecute
    end
    object aExportForm: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1092#1086#1088#1084
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1092#1086#1088#1084
      ImageIndex = 110
      OnExecute = aExportFormExecute
    end
    object aOpenForm: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1086#1088#1084#1091' '#1080#1079' '#1092#1072#1081#1083#1072
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1086#1088#1084#1091' '#1080#1079' '#1092#1072#1081#1083#1072
      ImageIndex = 113
      OnExecute = aOpenFormExecute
    end
    object aSaveForm: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1086#1088#1084#1091' '#1074' '#1092#1072#1081#1083
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1086#1088#1084#1091' '#1074' '#1092#1072#1081#1083
      ImageIndex = 114
      OnExecute = aSaveFormExecute
    end
  end
  object TreeScanner: TTreeScanner
    OnFileFound = TreeScannerFileFound
    FileMask = '*.fr3'
    Left = 420
    Top = 105
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'Select *, UserInfo(ID_AssertUser) as AssertUser'
      'From ReportForm'
      'where Active = 1 and Deleted = 0'
      'Order By Type, Name')
    Params = <>
    Left = 56
    Top = 196
    object QueryID: TSmallintField
      FieldName = 'ID'
    end
    object QueryAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      DisplayWidth = 18
      FieldName = 'AssertTime'
    end
    object QueryType: TWideStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 100
      FieldName = 'Type'
      Size = 100
    end
    object QueryName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 200
      FieldName = 'Name'
      Size = 200
    end
    object QuerySize: TIntegerField
      DisplayLabel = #1056#1072#1079#1084#1077#1088
      DisplayWidth = 10
      FieldName = 'Size'
    end
    object QueryVersion: TWideStringField
      DisplayLabel = #1042#1077#1088#1089#1080#1103
      DisplayWidth = 20
      FieldName = 'Version'
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'Comment'
      Required = True
      Size = 500
    end
    object QueryData: TBlobField
      FieldName = 'Data'
    end
    object QueryActive: TSmallintField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1072
      FieldName = 'Active'
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryDeleted: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object QueryAssertUser: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select * from reportform'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'fr3'
    Filter = #1064#1072#1073#1083#1086#1085' '#1086#1090#1095#1077#1090#1072' FastReport|*.fr3|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 600
    Top = 108
  end
  object BrowseFolder: TcxShellBrowserDialog
    FolderLabelCaption = #1048#1084#1103' '#1087#1072#1087#1082#1080':'
    Options.ShowHidden = True
    Root.BrowseFolder = bfDrives
    Title = #1042#1099#1073#1086#1088' '#1087#1072#1087#1082#1080
    Left = 516
    Top = 108
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'fr3'
    Filter = #1064#1072#1073#1083#1086#1085' '#1086#1090#1095#1077#1090#1072' FastReport|*.fr3|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 684
    Top = 104
  end
  object dxBarPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton1'
      end
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end
      item
        Visible = True
        ItemName = 'dxBarButton3'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'dxBarButton8'
      end>
    UseOwnFont = False
    Left = 312
    Top = 128
    PixelsPerInch = 96
  end
  object PopupMenu: TcxGridPopupMenu
    PopupMenus = <
      item
        HitTypes = [gvhtNone, gvhtCell]
        Index = 0
      end>
    Left = 312
    Top = 72
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 28
    Top = 72
  end
end
