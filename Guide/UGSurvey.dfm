object GSurveyForm: TGSurveyForm
  Left = 331
  Top = 196
  Action = MainForm.agSurvey
  Caption = #1054#1087#1088#1086#1089#1085#1080#1082
  ClientHeight = 628
  ClientWidth = 1313
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
    Top = 607
    Width = 1313
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
    Width = 912
    Height = 557
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
      Preview.Column = TableViewComment
      Preview.MaxLineCount = 0
      Preview.Visible = True
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
        Visible = False
        Width = 70
      end
      object TableViewDeleted: TcxGridDBColumn
        DataBinding.FieldName = 'Deleted'
        Visible = False
      end
      object TableViewPosition: TcxGridDBColumn
        DataBinding.FieldName = 'Position'
      end
      object TableViewAnswerRequired: TcxGridDBColumn
        DataBinding.FieldName = 'AnswerRequired'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 104
      end
      object TableViewVisInfo: TcxGridDBColumn
        DataBinding.FieldName = 'VisInfo'
        Width = 150
      end
      object TableViewAnswType: TcxGridDBColumn
        DataBinding.FieldName = 'AnswType'
        Width = 150
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Question'
        Width = 300
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
    Left = 920
    Top = 50
    Width = 393
    Height = 557
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinHeight = 1
    Constraints.MinWidth = 1
    TabOrder = 6
    object GridAnswer: TcxGrid
      Left = 0
      Top = 50
      Width = 393
      Height = 507
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object ViewAnswer: TcxGridDBTableView
        OnDblClick = ViewAnswerDblClick
        OnKeyDown = ViewAnswerKeyDown
        OnKeyPress = ViewAnswerKeyPress
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
        DataController.DataSource = dsAnswer
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
        Preview.Visible = True
        Styles.OnGetContentStyle = ViewAnswerStylesGetContentStyle
        object ViewAnswerID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
        end
        object ViewAnswerAssertTime: TcxGridDBColumn
          DataBinding.FieldName = 'AssertTime'
          Visible = False
        end
        object ViewAnswerDeleted: TcxGridDBColumn
          DataBinding.FieldName = 'Deleted'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Visible = False
        end
        object ViewAnswerActive: TcxGridDBColumn
          DataBinding.FieldName = 'Active'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Visible = False
        end
        object ViewAnswerAssertUser: TcxGridDBColumn
          DataBinding.FieldName = 'AssertUser'
          Visible = False
          Width = 120
        end
        object ViewAnswerPosition: TcxGridDBColumn
          DataBinding.FieldName = 'Position'
          Width = 61
        end
        object ViewAnswerAnswer: TcxGridDBColumn
          DataBinding.FieldName = 'Answer'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.WantReturns = False
          Width = 300
        end
      end
      object LevelAnswer: TcxGridLevel
        GridView = ViewAnswer
      end
    end
    object DockControlAnswer: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 393
      Height = 50
      Align = dalTop
      BarManager = BarManager
    end
  end
  object SplitterBottom: TcxSplitter
    Left = 912
    Top = 50
    Width = 8
    Height = 557
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
      #1054#1090#1074#1077#1090#1099)
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
      AllowReset = False
      Caption = #1042#1086#1087#1088#1086#1089#1099
      CaptionButtons = <>
      DockControl = DockControlAnswer
      DockedDockControl = DockControlAnswer
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1293
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
      Action = aAddAnswer
      Category = 1
    end
    object dxBarButton7: TdxBarButton
      Action = aEditAnswer
      Category = 1
    end
    object dxBarButton9: TdxBarButton
      Action = aDeleteAnswer
      Category = 1
    end
    object dxBarButton10: TdxBarButton
      Action = aUndoDeleteAnswer
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
    object aAddAnswer: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1074#1077#1090
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1074#1077#1090
      ImageIndex = 100
      OnExecute = aAddAnswerExecute
    end
    object aEditAnswer: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1090#1074#1077#1090
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1090#1074#1077#1090
      ImageIndex = 102
      OnExecute = aEditAnswerExecute
    end
    object aDeleteAnswer: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1074#1077#1090
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1074#1077#1090
      ImageIndex = 101
      OnExecute = aDeleteAnswerExecute
    end
    object aUndoDeleteAnswer: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1086#1090#1074#1077#1090#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1086#1090#1074#1077#1090#1072
      ImageIndex = 419
      OnExecute = aUndoDeleteAnswerExecute
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select  *, '
      
        '  UserInfo(ID_AssertUser) as AssertUser, SurveyVisibilityInfo(Vi' +
        'sibility) as VisInfo,'
      '  AnswerTypeInfo(AnswerType) as AnswType'
      'from  Survey'
      'where (Deleted = :D or :D = 2) and (Active = :A or :A = 2)'
      'order by  Position')
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
    object QueryPosition: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082
      FieldName = 'Position'
    end
    object QueryComment: TWideMemoField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      BlobType = ftWideMemo
    end
    object QueryQuestion: TWideStringField
      DisplayLabel = #1058#1077#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'Question'
      Size = 2000
    end
    object QueryVisibility: TSmallintField
      DisplayLabel = #1042#1080#1076#1080#1084#1086#1089#1090#1100
      FieldName = 'Visibility'
    end
    object QueryAnswerType: TSmallintField
      FieldName = 'AnswerType'
      ReadOnly = True
    end
    object QueryAnswerRequired: TSmallintField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1086#1073#1103#1079#1072#1090#1077#1083#1077#1085
      FieldName = 'AnswerRequired'
      ReadOnly = True
    end
    object QueryVisInfo: TWideStringField
      DisplayLabel = #1042#1080#1076#1080#1084#1086#1089#1090#1100
      FieldName = 'VisInfo'
      ReadOnly = True
      Size = 80
    end
    object QueryAnswType: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswType'
      ReadOnly = True
      Size = 80
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from Survey'
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
      'from Survey'
      'where Question = :Q and ID <> :IDE'
      'limit 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Q'
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
        Name = 'Q'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
  end
  object qAnswer: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = qAnswerAfterOpen
    AfterScroll = qAnswerAfterScroll
    SQL.Strings = (
      'select  *, UserInfo(ID_AssertUser) as AssertUser'
      'from  SurveyAnswer'
      'where (Deleted = :D or :D = 2) and (Active = :A or :A = 2) and'
      '  ID_Survey = :ID'
      'order by  Position')
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
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 1000
    Top = 188
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
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object SmallintField1: TSmallintField
      FieldName = 'ID'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object SmallintField2: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object SmallintField3: TSmallintField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1072
      FieldName = 'Active'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object SmallintField4: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object IntegerField1: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082
      FieldName = 'Position'
    end
    object qAnswerID_Survey: TSmallintField
      FieldName = 'ID_Survey'
    end
    object qAnswerAnswer: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1086#1090#1074#1077#1090#1072
      FieldName = 'Answer'
      Required = True
      Size = 1000
    end
    object qAnswerAnswerEdit: TSmallintField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1077#1082#1089#1090#1072
      FieldName = 'AnswerEdit'
    end
    object qAnswerAnswerChecked: TSmallintField
      DisplayLabel = #1054#1090#1084#1077#1095#1077#1085
      FieldName = 'AnswerChecked'
    end
  end
  object dsAnswer: TDataSource
    DataSet = qAnswer
    Left = 1104
    Top = 188
  end
  object tAnswer: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from SurveyAnswer'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'ValidateUpdateCount=FALSE')
    Left = 1000
    Top = 252
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qExistsAnswer: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select ID'
      'from SurveyAnswer'
      'where ID_Survey = :IDS and Answer = :A and ID <> :IDE'
      'limit 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'A'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
    Left = 1100
    Top = 252
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'A'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
  end
end
