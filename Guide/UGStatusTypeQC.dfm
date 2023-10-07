object GStatusTypeQCForm: TGStatusTypeQCForm
  Left = 331
  Top = 196
  Action = MainForm.agStatusTypeQC
  Caption = #1057#1090#1072#1090#1091#1089#1099' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1082#1072#1095#1077#1089#1090#1074#1072
  ClientHeight = 591
  ClientWidth = 1305
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 570
    Width = 1305
    Height = 21
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 50
    Width = 1077
    Height = 520
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TableView: TcxGridDBTableView
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
      ScrollbarAnnotations.CustomAnnotations = <>
      OnFocusedRecordChanged = TableViewFocusedRecordChanged
      DataController.DataSource = DataSource
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsBehavior.CellHints = True
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
      Styles.OnGetContentStyle = TableViewStylesGetContentStyle
      object TableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object TableViewAssertTime: TcxGridDBColumn
        DataBinding.FieldName = 'AssertTime'
        Visible = False
      end
      object TableViewAssertUser: TcxGridDBColumn
        DataBinding.FieldName = 'AssertUser'
        Visible = False
      end
      object TableViewDeleted: TcxGridDBColumn
        DataBinding.FieldName = 'Deleted'
        Visible = False
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 159
      end
      object TableViewStatusOrder: TcxGridDBColumn
        DataBinding.FieldName = 'StatusOrder'
        Width = 98
      end
      object TableViewColor: TcxGridDBColumn
        DataBinding.FieldName = 'Color'
        PropertiesClassName = 'TdxColorEditProperties'
        Properties.ReadOnly = True
        Width = 81
      end
      object TableViewDefSource: TcxGridDBColumn
        DataBinding.FieldName = 'DefStatus'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 120
      end
      object TableViewFinStatus: TcxGridDBColumn
        DataBinding.FieldName = 'FinStatus'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 120
      end
      object TableViewEndStatus: TcxGridDBColumn
        DataBinding.FieldName = 'EndStatus'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 120
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 250
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object pRight: TPanel
    Left = 1085
    Top = 50
    Width = 220
    Height = 520
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinHeight = 1
    Constraints.MinWidth = 1
    TabOrder = 6
    OnResize = pRightResize
    object gbRight: TcxGroupBox
      Left = 0
      Top = 221
      Align = alClient
      Caption = #1057#1090#1072#1090#1091#1089#1099', '#1074' '#1082#1086#1090#1086#1088#1099#1077' '#1084#1086#1078#1085#1086' '#1087#1077#1088#1077#1081#1090#1080':'
      TabOrder = 0
      Height = 299
      Width = 220
      object dxBarDockControl2: TdxBarDockControl
        Left = 2
        Top = 18
        Width = 216
        Height = 50
        Align = dalTop
        BarManager = BarManager
      end
      object DBGridTo: TcxGrid
        Left = 2
        Top = 68
        Width = 216
        Height = 229
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object ViewTo: TcxGridDBTableView
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
          ScrollbarAnnotations.CustomAnnotations = <>
          OnFocusedRecordChanged = TableViewFocusedRecordChanged
          DataController.DataSource = dsTo
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = '<'#1092#1080#1083#1100#1090#1088'>'
          FilterRow.ApplyChanges = fracImmediately
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.OnGetContentStyle = ViewToStylesGetContentStyle
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'STInfo'
          end
          object ViewToDeleted: TcxGridDBColumn
            DataBinding.FieldName = 'Deleted'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object LevelTo: TcxGridLevel
          GridView = ViewTo
        end
      end
    end
    object gbTop: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      Caption = #1057#1090#1072#1090#1091#1089#1099', '#1089' '#1082#1086#1090#1086#1088#1099#1093' '#1084#1086#1078#1085#1086' '#1087#1077#1088#1077#1081#1090#1080':'
      TabOrder = 1
      Height = 221
      Width = 220
      object dxBarDockControl1: TdxBarDockControl
        Left = 2
        Top = 18
        Width = 216
        Height = 50
        Align = dalTop
        BarManager = BarManager
      end
      object DBGridFrom: TcxGrid
        Left = 2
        Top = 68
        Width = 216
        Height = 151
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object ViewFrom: TcxGridDBTableView
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
          ScrollbarAnnotations.CustomAnnotations = <>
          OnFocusedRecordChanged = TableViewFocusedRecordChanged
          DataController.DataSource = dsFrom
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = '<'#1092#1080#1083#1100#1090#1088'>'
          FilterRow.ApplyChanges = fracImmediately
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.OnGetContentStyle = ViewFromStylesGetContentStyle
          object ViewFromID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewFromSTInfo: TcxGridDBColumn
            DataBinding.FieldName = 'STInfo'
          end
          object ViewFromDeleted: TcxGridDBColumn
            DataBinding.FieldName = 'Deleted'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object LevelFrom: TcxGridLevel
          GridView = ViewFrom
        end
      end
    end
  end
  object SplitterBottom: TcxSplitter
    Left = 1077
    Top = 50
    Width = 8
    Height = 520
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
    Control = pRight
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 132
    Top = 116
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      #1048#1089#1090#1086#1095#1085#1080#1082#1080
      #1053#1072#1079#1085#1072#1095#1077#1085#1080#1103)
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    ImageOptions.Images = UtilForm.ImageList
    ImageOptions.LargeImages = UtilForm.ImageListBig
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 264
    Top = 116
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
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cbDel'
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
    object BarManagerBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 884
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object BarManagerBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1103
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 884
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
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
    object dxBarButton4: TdxBarButton
      Action = aUndoDelete
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
    object cbDel: TdxBarCombo
      Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077':'
      Category = 0
      Hint = #1059#1076#1072#1083#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      Visible = ivAlways
      OnChange = cbDelChange
      ShowCaption = True
      Text = #1053#1077#1090
      ShowEditor = False
      Items.Strings = (
        #1053#1077#1090
        #1044#1072
        #1042#1089#1077)
      ItemIndex = 0
    end
    object cbActive: TdxBarCombo
      Caption = #1040#1082#1090#1080#1074#1085#1099#1077':'
      Category = 0
      Hint = #1040#1082#1090#1080#1074#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      Visible = ivAlways
      OnChange = cbActiveChange
      ShowCaption = True
      Text = #1042#1089#1077
      ShowEditor = False
      Items.Strings = (
        #1053#1077#1090
        #1044#1072
        #1042#1089#1077)
      ItemIndex = 2
    end
    object dxBarButton6: TdxBarButton
      Action = aAddFrom
      Category = 1
    end
    object dxBarButton7: TdxBarButton
      Action = aDelFrom
      Category = 1
    end
    object dxBarButton9: TdxBarButton
      Action = aAddTo
      Category = 2
    end
    object dxBarButton10: TdxBarButton
      Action = aDelTo
      Category = 2
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 200
    Top = 116
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
    object aUndoDelete: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      ImageIndex = 419
      OnExecute = aUndoDeleteExecute
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
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aAddFrom: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082#1080
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082#1080
      ImageIndex = 100
      OnExecute = aAddFromExecute
    end
    object aDelFrom: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082#1080
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082#1080
      ImageIndex = 101
      OnExecute = aDelFromExecute
    end
    object aAddTo: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      ImageIndex = 100
      OnExecute = aAddToExecute
    end
    object aDelTo: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      ImageIndex = 101
      OnExecute = aDelToExecute
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select  *, UserInfo(ID_AssertUser) as AssertUser'
      'from  StatusTypeQC'
      'where (Deleted = :D or :D = 2) and (Active = :A or :A = 2)'
      'order by  Name')
    Params = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftWideString
        Name = 'A'
        ParamType = ptUnknown
        Value = '2'
      end>
    Left = 56
    Top = 176
    ParamData = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftWideString
        Name = 'A'
        ParamType = ptUnknown
        Value = '2'
      end>
    object QueryName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
    end
    object QueryID: TSmallintField
      FieldName = 'ID'
    end
    object QueryAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object QueryDeleted: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object QueryActive: TSmallintField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1072
      FieldName = 'Active'
    end
    object QueryAssertEmployee: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      Size = 200
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryColor: TLargeintField
      DisplayLabel = #1062#1074#1077#1090
      FieldName = 'Color'
    end
    object QueryStatusOrder: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
      FieldName = 'StatusOrder'
    end
    object QueryDefStatus: TSmallintField
      DisplayLabel = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      FieldName = 'DefStatus'
    end
    object QueryFinStatus: TSmallintField
      DisplayLabel = #1047#1072#1082#1088#1099#1074#1072#1102#1097#1080#1081
      FieldName = 'FinStatus'
    end
    object QueryEndStatus: TSmallintField
      DisplayLabel = #1047#1072#1074#1077#1088#1096#1072#1077#1090' '#1086#1087#1088#1086#1089
      FieldName = 'EndStatus'
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from StatusTypeQC'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        GridView = TableView
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 340
    Top = 116
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 56
    Top = 116
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
    Left = 340
    Top = 172
    PixelsPerInch = 96
  end
  object qExists: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select ID'
      'from StatusTypeQC'
      'where Name = :N and ID <> :IDE'
      'limit 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
  end
  object qFrom: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select '
      '  FT.*, '
      '  ST.Deleted,'
      '  StatusTypeQCInfo(FT.ID_StatusTypeQCFrom) as STInfo  '
      'from '
      '  StatusTypeQCFromTo FT'
      ' inner join  StatusTypeQC ST on'
      
        '    FT.ID_StatusTypeQCTo = :ID and FT.ID_StatusTypeQCFrom = ST.I' +
        'D and'
      '    (ST.Deleted = :D or :D = 2)'
      'order by  STInfo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end>
    DataSource = DataSource
    Left = 916
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qFromID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qFromSTInfo: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'STInfo'
      ReadOnly = True
      Size = 50
    end
    object qFromID_StatusTypeFrom: TSmallintField
      FieldName = 'ID_StatusTypeQCFrom'
    end
    object qFromID_StatusTypeTo: TSmallintField
      FieldName = 'ID_StatusTypeQCTo'
    end
    object qFromDeleted: TSmallintField
      FieldName = 'Deleted'
      ReadOnly = True
    end
  end
  object dsFrom: TDataSource
    DataSet = qFrom
    Left = 964
    Top = 140
  end
  object dsTo: TDataSource
    DataSet = qTo
    Left = 960
    Top = 360
  end
  object qTo: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select '
      '  FT.*, '
      '  StatusTypeQCInfo(FT.ID_StatusTypeQCTo) as STInfo, '
      '  ST.Deleted'
      'from '
      '  StatusTypeQCFromTo FT'
      '  inner  join  StatusTypeQC ST on'
      
        '    FT.ID_StatusTypeQCFrom = :ID and FT.ID_StatusTypeQCTo = ST.I' +
        'D and'
      '    (ST.Deleted = :D or :D = 2)'
      'order by  STInfo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end>
    DataSource = DataSource
    Left = 916
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qToID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qToSTInfo: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'STInfo'
      ReadOnly = True
      Size = 50
    end
    object qToID_StatusTypeFrom: TSmallintField
      FieldName = 'ID_StatusTypeQCFrom'
    end
    object qToID_StatusTypeTo: TSmallintField
      FieldName = 'ID_StatusTypeQCTo'
    end
    object qToDeleted: TSmallintField
      FieldName = 'Deleted'
      ReadOnly = True
    end
  end
  object qStatusTypeFrom: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from StatusTypeQCFromTo'
      'where ID_StatusTypeQCTo = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 1032
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qStatusTypeTo: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from StatusTypeQCFromTo'
      'where ID_StatusTypeQCFrom = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 1036
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object pmFrom: TcxGridPopupMenu
    Grid = DBGridFrom
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 1160
    Top = 144
  end
  object pmTo: TcxGridPopupMenu
    Grid = DBGridTo
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 1136
    Top = 388
  end
end
