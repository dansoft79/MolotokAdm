object GDiscountTypeForm: TGDiscountTypeForm
  Left = 331
  Top = 196
  Action = MainForm.agDiscountType
  Caption = #1057#1082#1080#1076#1082#1080
  ClientHeight = 586
  ClientWidth = 1393
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
    Top = 565
    Width = 1393
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
    Width = 945
    Height = 515
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
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
      Preview.MaxLineCount = 0
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
      object TableViewActive: TcxGridDBColumn
        DataBinding.FieldName = 'Active'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 70
      end
      object TableViewDeleted: TcxGridDBColumn
        DataBinding.FieldName = 'Deleted'
        Visible = False
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 200
      end
      object TableViewFromDate: TcxGridDBColumn
        DataBinding.FieldName = 'FromDate'
      end
      object TableViewToDate: TcxGridDBColumn
        DataBinding.FieldName = 'ToDate'
      end
      object TableViewPromocode: TcxGridDBColumn
        DataBinding.FieldName = 'Promocode'
        Width = 200
      end
      object TableViewDiscountInfo: TcxGridDBColumn
        DataBinding.FieldName = 'DiscountInfo'
        Width = 100
      end
      object TableViewMinOrderSum: TcxGridDBColumn
        DataBinding.FieldName = 'MinOrderSum'
        Width = 100
      end
      object TableViewDebtType: TcxGridDBColumn
        DataBinding.FieldName = 'DDTInfo'
        Width = 100
      end
      object TableViewSubType: TcxGridDBColumn
        DataBinding.FieldName = 'DSTInfo'
        Width = 100
      end
      object TableViewCanAdd: TcxGridDBColumn
        DataBinding.FieldName = 'CanAdd'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 100
      end
      object TableViewAllWorkType: TcxGridDBColumn
        DataBinding.FieldName = 'AllWorkType'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 89
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
  object gbEmployee: TcxGroupBox
    Left = 953
    Top = 50
    Align = alRight
    Caption = #1056#1072#1073#1086#1090#1099':'
    Constraints.MinWidth = 1
    TabOrder = 6
    Height = 515
    Width = 440
    object GridWorkType: TcxGrid
      Left = 2
      Top = 68
      Width = 436
      Height = 445
      Align = alClient
      TabOrder = 0
      object ViewWorkType: TcxGridDBTableView
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
        DataController.DataSource = dsDiscountWorkType
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object ViewWorkTypeCode: TcxGridDBColumn
          DataBinding.FieldName = 'Code'
          Width = 80
        end
        object ViewWorkTypeWTInfo: TcxGridDBColumn
          DataBinding.FieldName = 'WTInfo'
          Width = 150
        end
        object ViewWorkTypeWCInfo: TcxGridDBColumn
          DataBinding.FieldName = 'WCInfo'
          Visible = False
          GroupIndex = 0
          Width = 250
        end
        object ViewWorkTypeWCTag: TcxGridDBColumn
          DataBinding.FieldName = 'WCTag'
          Width = 80
        end
        object ViewWorkTypePrice: TcxGridDBColumn
          DataBinding.FieldName = 'Price'
        end
        object ViewWorkTypeID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object LevelWorkType: TcxGridLevel
        GridView = ViewWorkType
      end
    end
    object BarDockControlSnap: TdxBarDockControl
      Left = 2
      Top = 18
      Width = 436
      Height = 50
      Align = dalTop
      BarManager = BarManager
    end
  end
  object Splitter: TcxSplitter
    Left = 945
    Top = 50
    Width = 8
    Height = 515
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
    Control = gbEmployee
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
      Caption = #1042#1080#1076#1099' '#1088#1072#1073#1086#1090
      CaptionButtons = <>
      DockControl = BarDockControlSnap
      DockedDockControl = BarDockControlSnap
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1108
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
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end>
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
      Action = aAddWorkType
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aDelWorkType
      Category = 0
    end
    object dxBarButton9: TdxBarButton
      Action = aSelectAll
      Category = 0
    end
    object dxBarButton10: TdxBarButton
      Action = aClearSelection
      Category = 0
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
    object aAddWorkType: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1080#1076#1099' '#1088#1072#1073#1086#1090
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1080#1076#1099' '#1088#1072#1073#1086#1090
      ImageIndex = 100
      OnExecute = aAddWorkTypeExecute
    end
    object aDelWorkType: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1080#1076#1099' '#1088#1072#1073#1086#1090
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1080#1076#1099' '#1088#1072#1073#1086#1090
      ImageIndex = 101
      OnExecute = aDelWorkTypeExecute
    end
    object aSelectAll: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      Hint = #1042#1099#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 120
      OnExecute = aSelectAllExecute
    end
    object aClearSelection: TAction
      Caption = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      Hint = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      ImageIndex = 121
      OnExecute = aClearSelectionExecute
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    OnCalcFields = QueryCalcFields
    SQL.Strings = (
      'select  '
      '  *, '
      '  DiscountTypeInfo(Type) as DTInfo,'
      '  DiscountDebtTypeInfo(DebtType) as DDTInfo,'
      '  DiscountSubTypeInfo(SubType) as DSTInfo,'
      '  UserInfo(ID_AssertUser) as AssertUser'
      'from  DiscountType'
      'where (Deleted = :D or :D = 2) and (Active = :A or :A = 2)'
      'order by Name, FromDate, ToDate')
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
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'Comment'
      Size = 800
    end
    object QueryFromDate: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086
      FieldName = 'FromDate'
    end
    object QueryToDate: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077
      FieldName = 'ToDate'
    end
    object QueryPromocode: TWideStringField
      DisplayLabel = #1055#1088#1086#1084#1086#1082#1086#1076
      FieldName = 'Promocode'
      Size = 200
    end
    object QueryDiscountType: TSmallintField
      DisplayLabel = #1058#1080#1087' '#1089#1082#1080#1076#1082#1080
      FieldName = 'Type'
    end
    object QueryDiscountSize: TFloatField
      DisplayLabel = #1056#1072#1079#1084#1077#1088' '#1089#1082#1080#1076#1082#1080
      FieldName = 'Size'
    end
    object QueryMinOrderSum: TFloatField
      DisplayLabel = #1052#1080#1085'. '#1089#1091#1084#1084#1072
      FieldName = 'MinOrderSum'
    end
    object QueryDebtType: TSmallintField
      DisplayLabel = #1057#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'DebtType'
    end
    object QuerySubType: TIntegerField
      DisplayLabel = #1042#1099#1095#1077#1090
      FieldName = 'SubType'
    end
    object QueryCanAdd: TSmallintField
      DisplayLabel = #1057#1091#1084#1084#1080#1088#1091#1077#1090#1089#1103
      FieldName = 'CanAdd'
    end
    object QueryDiscountInfo: TStringField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      FieldKind = fkCalculated
      FieldName = 'DiscountInfo'
      Size = 50
      Calculated = True
    end
    object QueryDTInfo: TWideStringField
      FieldName = 'DTInfo'
      ReadOnly = True
      Size = 80
    end
    object QueryDDTInfo: TWideStringField
      DisplayLabel = #1057#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'DDTInfo'
      ReadOnly = True
      Size = 80
    end
    object QueryDSTInfo: TWideStringField
      DisplayLabel = #1042#1099#1095#1077#1090
      FieldName = 'DSTInfo'
      ReadOnly = True
      Size = 80
    end
    object QueryAllWorkType: TSmallintField
      DisplayLabel = #1042#1089#1077' '#1074#1080#1076#1099' '#1088#1072#1073#1086#1090
      FieldName = 'AllWorkType'
      ReadOnly = True
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from DiscountType'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'ValidateUpdateCount=FALSE')
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
      'from district'
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
  object qDiscountWorkType: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select DWT.*, '
      '  WorkTypeInfo(DWT.ID_WorkType) as WTInfo, '
      '  WorkClassInfo(WT.ID_WorkClass) as WCInfo,'
      '  WorkerClassTag(WT.ID_WorkerClass) as WCTag,'
      '  WT.Code, WT.Price'
      'from DiscountWorkType DWT, WorkType WT'
      'where'
      '  DWT.ID_DiscountType = :ID and'
      '  WT.ID = DWT.ID_WorkType'
      'order by'
      '  WCInfo, WTInfo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 1031
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qDiscountWorkTypeWTInfo: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
      FieldName = 'WTInfo'
      ReadOnly = True
      Size = 1200
    end
    object qDiscountWorkTypeWCInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1088#1072#1073#1086#1090#1099
      FieldName = 'WCInfo'
      ReadOnly = True
      Size = 200
    end
    object qDiscountWorkTypeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qDiscountWorkTypeID_DiscountType: TSmallintField
      FieldName = 'ID_DiscountType'
    end
    object qDiscountWorkTypeID_WorkType: TSmallintField
      FieldName = 'ID_WorkType'
    end
    object qDiscountWorkTypeWCTag: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'WCTag'
      ReadOnly = True
      Size = 8
    end
    object qDiscountWorkTypeCode: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
      Size = 80
    end
    object qDiscountWorkTypePrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'Price'
    end
  end
  object dsDiscountWorkType: TDataSource
    DataSet = qDiscountWorkType
    Left = 1171
    Top = 224
  end
  object tDiscountWorkType: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from DiscountWorkType'
      'where  ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 1023
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object PopupMenuWork: TcxGridPopupMenu
    Grid = GridWorkType
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 1300
    Top = 224
  end
end
