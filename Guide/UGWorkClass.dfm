object GWorkClassForm: TGWorkClassForm
  Left = 331
  Top = 196
  Action = MainForm.agWorkClass
  Caption = #1058#1080#1087#1099' '#1088#1072#1073#1086#1090
  ClientHeight = 564
  ClientWidth = 1216
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
    Top = 543
    Width = 1216
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
    Width = 777
    Height = 493
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
        Width = 200
      end
      object TableViewNamePublic: TcxGridDBColumn
        DataBinding.FieldName = 'NamePublic'
        Width = 223
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 300
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object pRight: TPanel
    Left = 785
    Top = 50
    Width = 431
    Height = 493
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinHeight = 1
    TabOrder = 6
    object gbAdd: TcxGroupBox
      Left = 0
      Top = 101
      Align = alClient
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
      TabOrder = 0
      Height = 392
      Width = 431
      object DockAdd: TdxBarDockControl
        Left = 2
        Top = 18
        Width = 427
        Height = 50
        Align = dalTop
        BarManager = BarManager
      end
      object GridAdd: TcxGrid
        Left = 2
        Top = 68
        Width = 427
        Height = 322
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object ViewAdd: TcxGridDBTableView
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
          DataController.DataSource = dsWorkAdd
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
          OptionsView.CellAutoHeight = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.OnGetContentStyle = ViewAddStylesGetContentStyle
          object ViewAddID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewAddDeleted: TcxGridDBColumn
            DataBinding.FieldName = 'Deleted'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewAddPublicWork: TcxGridDBColumn
            DataBinding.FieldName = 'PublicWork'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Width = 50
          end
          object ViewAddName: TcxGridDBColumn
            DataBinding.FieldName = 'Name'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.ReadOnly = True
            Properties.ScrollBars = ssVertical
            Width = 190
          end
          object ViewAddUnitName: TcxGridDBColumn
            DataBinding.FieldName = 'UnitName'
            Width = 50
          end
          object ViewAddPrice: TcxGridDBColumn
            DataBinding.FieldName = 'Price'
            Width = 50
          end
          object ViewAddAmount: TcxGridDBColumn
            DataBinding.FieldName = 'Amount'
            Width = 50
          end
        end
        object LevelAdd: TcxGridLevel
          GridView = ViewAdd
        end
      end
    end
    object gbDescription: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
      Constraints.MinHeight = 1
      TabOrder = 1
      Height = 101
      Width = 431
      object mDescr: TcxDBMemo
        AlignWithMargins = True
        Left = 10
        Top = 26
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alClient
        DataBinding.DataField = 'Description'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Style.LookAndFeel.ScrollbarMode = sbmDefault
        StyleDisabled.LookAndFeel.ScrollbarMode = sbmDefault
        StyleFocused.LookAndFeel.ScrollbarMode = sbmDefault
        StyleHot.LookAndFeel.ScrollbarMode = sbmDefault
        TabOrder = 0
        Height = 65
        Width = 411
      end
    end
  end
  object Splitter: TcxSplitter
    Left = 777
    Top = 50
    Width = 8
    Height = 493
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
      #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1072#1073#1086#1090#1099)
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
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
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
      CaptionButtons = <>
      DockControl = DockAdd
      DockedDockControl = DockAdd
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1244
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
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
    object dxBarButton7: TdxBarButton
      Action = aAddWork
      Category = 1
    end
    object dxBarButton9: TdxBarButton
      Action = aDelWork
      Category = 1
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
    object aAddWork: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1074#1080#1076#1086#1074' '#1088#1072#1073#1086#1090
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1074#1080#1076#1086#1074' '#1088#1072#1073#1086#1090
      ImageIndex = 100
      OnExecute = aAddWorkExecute
    end
    object aDelWork: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1080#1076' '#1088#1072#1073#1086#1090#1099
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1080#1076' '#1088#1072#1073#1086#1090#1099
      ImageIndex = 101
      OnExecute = aDelWorkExecute
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select  *, UserInfo(ID_AssertUser) as AssertUser'
      'from  WorkClass'
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
    object QueryNamePublic: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1091#1073#1083#1080#1095#1085#1086#1077
      FieldName = 'NamePublic'
      Size = 100
    end
    object QueryDescription: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 1000
      FieldName = 'Description'
      Size = 1000
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from workclass'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 228
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
      'from workclass'
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
    Top = 228
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
  object qWorkAdd: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select '
      '  WTA.*, '
      '  WT.Deleted,'
      '  WT.PublicWork,'
      '  WT.Name,'
      '  WT.UnitName,'
      '  WT.Price,'
      '  WT.Amount  '
      'from  '
      '  WorkClassAdd WTA'
      '  inner join WorkType WT on'
      '    WTA.ID_WorkTypeAdd = WT.ID and'
      '    (WT.Deleted = :D or :D =2)'
      'where WTA.ID_WorkClass = :ID'
      'order by WT.Name')
    Params = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 932
    Top = 292
    ParamData = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qWorkAddID: TSmallintField
      FieldName = 'ID'
    end
    object qWorkAddID_WorkTypeAdd: TSmallintField
      FieldName = 'ID_WorkTypeAdd'
    end
    object qWorkAddID_WorkClass: TSmallintField
      FieldName = 'ID_WorkClass'
    end
    object qWorkAddPublicWork: TSmallintField
      DisplayLabel = #1055#1091#1073#1083#1080#1095'.'
      FieldName = 'PublicWork'
    end
    object qWorkAddName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Size = 100
    end
    object qWorkAddUnitName: TWideStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084'.'
      FieldName = 'UnitName'
    end
    object qWorkAddPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'Price'
    end
    object qWorkAddAmount: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'Amount'
    end
    object qWorkAddDeleted: TSmallintField
      FieldName = 'Deleted'
    end
  end
  object dsWorkAdd: TDataSource
    DataSet = qWorkAdd
    Left = 992
    Top = 292
  end
  object tWorkAdd: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkClassAdd'
      'where ID_WorkClass = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 1084
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object pmAddWork: TcxGridPopupMenu
    Grid = GridAdd
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 828
    Top = 288
  end
end
