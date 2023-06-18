object NoticeTemplateForm: TNoticeTemplateForm
  Left = 331
  Top = 196
  Action = MainForm.anTemplateEditor
  Caption = #1064#1072#1073#1083#1086#1085#1099' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
  ClientHeight = 563
  ClientWidth = 1060
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
    Top = 542
    Width = 1060
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
    Width = 776
    Height = 492
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
        DataBinding.FieldName = 'Header'
        Width = 300
      end
      object TableViewDInfo: TcxGridDBColumn
        DataBinding.FieldName = 'Text'
        Width = 500
      end
      object TableViewTag: TcxGridDBColumn
        DataBinding.FieldName = 'ShowTime'
        Width = 120
      end
      object TableViewColor: TcxGridDBColumn
        DataBinding.FieldName = 'Color'
        PropertiesClassName = 'TdxColorEditProperties'
        Properties.ReadOnly = True
        Width = 102
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object gbEmployee: TcxGroupBox
    Left = 784
    Top = 50
    Align = alRight
    Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1080' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081':'
    Constraints.MinWidth = 1
    TabOrder = 6
    Height = 492
    Width = 276
    object GridSnap: TcxGrid
      Left = 2
      Top = 68
      Width = 272
      Height = 422
      Align = alClient
      TabOrder = 0
      object ViewSnap: TcxGridDBTableView
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
        DataController.DataSource = dsNoticeSnap
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
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
        object ViewSnapUInfo: TcxGridDBColumn
          DataBinding.FieldName = 'UInfo'
          Width = 120
        end
        object ViewSnapURName: TcxGridDBColumn
          DataBinding.FieldName = 'URName'
          Width = 120
        end
        object ViewSnapLogin: TcxGridDBColumn
          DataBinding.FieldName = 'Login'
          Visible = False
          VisibleForCustomization = False
          Width = 120
        end
        object ViewSnapID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object LevelSnap: TcxGridLevel
        GridView = ViewSnap
      end
    end
    object BarDockControlSnap: TdxBarDockControl
      Left = 2
      Top = 18
      Width = 272
      Height = 50
      Align = dalTop
      BarManager = BarManager
    end
  end
  object Splitter: TcxSplitter
    Left = 776
    Top = 50
    Width = 8
    Height = 492
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
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton12'
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
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
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
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1096#1072#1073#1083#1086#1085#1086#1074
      CaptionButtons = <>
      DockControl = BarDockControlSnap
      DockedDockControl = BarDockControlSnap
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1088
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
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarButton11'
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
      Action = aAddNotificationManual
      Category = 0
    end
    object dxBarButton12: TdxBarButton
      Action = aAddNotificationAuto
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aAddSnap
      Category = 0
    end
    object dxBarButton9: TdxBarButton
      Action = aDelSnap
      Category = 0
    end
    object dxBarButton10: TdxBarButton
      Action = aSelectSnap
      Category = 0
    end
    object dxBarButton11: TdxBarButton
      Action = aClearSnap
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
    object aAddNotificationManual: TAction
      Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1086#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1086#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      ImageIndex = 426
      OnExecute = aAddNotificationManualExecute
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
    object aAddSnap: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      ImageIndex = 100
      OnExecute = aAddSnapExecute
    end
    object aDelSnap: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      ImageIndex = 101
      OnExecute = aDelSnapExecute
    end
    object aSelectSnap: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 120
      OnExecute = aSelectSnapExecute
    end
    object aClearSnap: TAction
      Caption = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      Hint = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      ImageIndex = 121
      OnExecute = aClearSnapExecute
    end
    object aAddNotificationAuto: TAction
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      ImageIndex = 428
      OnExecute = aAddNotificationAutoExecute
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select  *, UserInfo(ID_AssertUser) as AssertUser'
      'from  NoticeTemplate'
      'where (Deleted = :D or :D = 2) and (Active = :A or :A = 2)'
      'order by Header')
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
    Top = 172
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
    object QueryColor: TIntegerField
      DisplayLabel = #1062#1074#1077#1090
      FieldName = 'Color'
    end
    object QueryHeader: TWideStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      FieldName = 'Header'
      Size = 200
    end
    object QueryText: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'Text'
      Size = 600
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      Size = 800
    end
    object QueryPictureType: TWideStringField
      DefaultExpression = #1058#1080#1087' '#1082#1072#1088#1090#1080#1085#1082#1080
      FieldName = 'PictureType'
      Size = 80
    end
    object QueryPicture: TBlobField
      DisplayLabel = #1050#1072#1088#1090#1080#1085#1082#1072
      FieldName = 'Picture'
    end
    object QueryShowTime: TIntegerField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      FieldName = 'ShowTime'
    end
    object QueryTimeFieldName: TWideStringField
      FieldName = 'TimeFieldName'
      Size = 200
    end
    object QueryTimeCondition: TSmallintField
      FieldName = 'TimeCondition'
    end
    object QueryTimeValue: TIntegerField
      FieldName = 'TimeValue'
    end
    object QueryTimeFieldCaption: TWideStringField
      FieldName = 'TimeFieldCaption'
      ReadOnly = True
      Size = 400
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from noticetemplate'
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
      'from noticetemplate'
      'where header = :N and ID <> :IDE'
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
  object qAction: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from noticeaction'
      'where id_noticetemplate = :ID'
      'order by PosNUm')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 276
    Top = 297
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qCondition: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from noticecondition'
      'where id_noticetemplate = :ID'
      'order by PosNUm, OrderFieldCaption'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 424
    Top = 297
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object mdCondition: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 356
    Top = 296
    object mdConditionID: TIntegerField
      FieldName = 'ID'
    end
    object mdConditionID_NoticeTemplate: TIntegerField
      FieldName = 'ID_NoticeTemplate'
    end
    object mdConditionPosNum: TIntegerField
      FieldName = 'PosNum'
    end
    object mdConditionOrderFieldName: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'OrderFieldName'
      Size = 50
    end
    object mdConditionOrderFieldCaption: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'OrderFieldCaption'
      Size = 50
    end
    object mdConditionConditionType: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1077
      FieldName = 'ConditionType'
      Size = 50
    end
    object mdConditionConditionTypeCaption: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1077
      FieldName = 'ConditionTypeCaption'
      Size = 50
    end
    object mdConditionTableName: TStringField
      DisplayLabel = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      FieldName = 'TableName'
      Size = 50
    end
    object mdConditionTableCaption: TStringField
      DisplayLabel = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      FieldName = 'TableCaption'
      Size = 50
    end
    object mdConditionFieldName: TStringField
      DisplayLabel = #1055#1086#1083#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      FieldName = 'FieldName'
      Size = 50
    end
    object mdConditionFieldCaption: TStringField
      DisplayLabel = #1055#1086#1083#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      FieldName = 'FieldCaption'
      Size = 50
    end
    object mdConditionOrderFieldValue: TStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'OrderFieldValue'
      Size = 500
    end
    object mdConditionOrderFieldValueCaption: TStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'OrderFieldValueCaption'
      Size = 500
    end
    object mdConditionEdited: TBooleanField
      FieldName = 'Edited'
    end
  end
  object mdAction: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 208
    Top = 296
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_NoticeTemplate'
    end
    object IntegerField3: TIntegerField
      FieldName = 'PosNum'
    end
    object StringField1: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'OrderFieldName'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'OrderFieldCaption'
      Size = 50
    end
    object StringField3: TStringField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1080#1077
      FieldName = 'ActionType'
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1080#1077
      FieldName = 'ActionTypeCaption'
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      FieldName = 'TableName'
      Size = 50
    end
    object StringField6: TStringField
      DisplayLabel = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      FieldName = 'TableCaption'
      Size = 50
    end
    object StringField7: TStringField
      DisplayLabel = #1055#1086#1083#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      FieldName = 'FieldName'
      Size = 50
    end
    object StringField8: TStringField
      DisplayLabel = #1055#1086#1083#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      FieldName = 'FieldCaption'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'OrderFieldValue'
      Size = 500
    end
    object StringField10: TStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'OrderFieldValueCaption'
      Size = 500
    end
    object BooleanField1: TBooleanField
      FieldName = 'Edited'
    end
  end
  object qNoticeSnap: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      
        'select UserInfo(U.ID) as UInfo, UR.Name as URName, U.Login, NS.I' +
        'D,  NS.ID_User'
      'from User U, NoticeSnap NS, UserRole UR'
      'where'
      '  NS.ID_NoticeTemplate = :ID and'
      '  NS.ID_User = U.ID and'
      '  U.ID_UserRole = UR.ID'
      'order by'
      '  U.Surname, U.Name, U.Patro')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 852
    Top = 252
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qNoticeSnapUInfo: TWideStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'UInfo'
      ReadOnly = True
      Size = 200
    end
    object qNoticeSnapLogin: TWideStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      FieldName = 'Login'
      Size = 80
    end
    object qNoticeSnapID_User: TSmallintField
      FieldName = 'ID_User'
    end
    object qNoticeSnapID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qNoticeSnapURName: TWideStringField
      DisplayLabel = #1056#1086#1083#1100
      FieldName = 'URName'
      Size = 200
    end
  end
  object dsNoticeSnap: TDataSource
    DataSet = qNoticeSnap
    Left = 916
    Top = 252
  end
  object tNoticeSnap: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from NoticeSnap'
      'where  ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 852
    Top = 300
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qTemp: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from NoticeTemplate'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 108
    Top = 420
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qCond: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from NoticeCondition'
      'where ID_NoticeTemplate = :ID'
      'order by PosNum')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 156
    Top = 420
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qAct: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from NoticeAction'
      'where ID_NoticeTemplate = :ID'
      'order by PosNum')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 420
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qOrder: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select ID'
      'from OrderList'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 244
    Top = 420
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qTempList: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from NoticeTemplate'
      'where Active = 1 and Deleted = 0'
      'order by ID')
    Params = <>
    Left = 52
    Top = 420
  end
  object qNotification: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from notification'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 296
    Top = 420
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
