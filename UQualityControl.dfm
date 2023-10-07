object BrowseQualityControlForm: TBrowseQualityControlForm
  Left = 305
  Top = 172
  Margins.Left = 8
  Action = MainForm.aaBrowseNotificetion
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
  ClientHeight = 656
  ClientWidth = 1326
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
    Top = 639
    Width = 1326
    Height = 17
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
    Width = 964
    Height = 589
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.ScrollbarMode = sbmDefault
    object TableView: TcxGridDBTableView
      OnDblClick = TableViewDblClick
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
      OnCustomDrawCell = TableViewNNCustomDrawCell
      OnFocusedRecordChanged = TableViewFocusedRecordChanged
      DataController.DataSource = DataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsBehavior.CellHints = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.PullFocusing = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Preview.MaxLineCount = 0
      Styles.OnGetContentStyle = TableViewStylesGetContentStyle
      object TableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Width = 45
      end
      object TableViewActive: TcxGridDBColumn
        DataBinding.FieldName = 'Active'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Visible = False
      end
      object TableViewDeleted: TcxGridDBColumn
        DataBinding.FieldName = 'Deleted'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Visible = False
      end
      object TableViewUAdd: TcxGridDBColumn
        DataBinding.FieldName = 'UAdd'
        Options.FilterRowOperator = foContains
        Width = 120
      end
      object TableViewAppendTime: TcxGridDBColumn
        DataBinding.FieldName = 'AppendTime'
      end
      object TableViewUAssert: TcxGridDBColumn
        DataBinding.FieldName = 'UAssert'
        Options.FilterRowOperator = foContains
        Width = 120
      end
      object TableViewAssertTime: TcxGridDBColumn
        DataBinding.FieldName = 'AssertTime'
        Width = 100
      end
      object TableViewSTQCInfo: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089' '#1082#1086#1085#1090'. '#1082#1072#1095'.'
        DataBinding.FieldName = 'STQCInfo'
        Options.FilterRowOperator = foContains
        Width = 102
      end
      object TableViewSurveyCount: TcxGridDBColumn
        DataBinding.FieldName = 'SurveyCount'
        Width = 60
      end
      object TableViewSurveyReady: TcxGridDBColumn
        DataBinding.FieldName = 'SurveyReady'
        Width = 60
      end
      object TableViewID_OrderList: TcxGridDBColumn
        DataBinding.FieldName = 'ID_OrderList'
      end
      object TableViewSTInfo: TcxGridDBColumn
        DataBinding.FieldName = 'STInfo'
        Options.FilterRowOperator = foContains
        Width = 100
      end
      object TableViewDInfo: TcxGridDBColumn
        DataBinding.FieldName = 'DInfo'
        Options.FilterRowOperator = foContains
        Width = 120
      end
      object TableViewOrderAddress: TcxGridDBColumn
        DataBinding.FieldName = 'OrderAddress'
        Options.FilterRowOperator = foContains
        Width = 150
      end
      object TableViewOrderCloseTime: TcxGridDBColumn
        DataBinding.FieldName = 'OrderCloseTime'
      end
      object TableViewColor: TcxGridDBColumn
        DataBinding.FieldName = 'Color'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object gbRes: TcxGroupBox
    Left = 972
    Top = 50
    Align = alRight
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1087#1088#1086#1089#1072':'
    Constraints.MinWidth = 1
    TabOrder = 4
    Height = 589
    Width = 354
    object GridSurvey: TcxGrid
      AlignWithMargins = True
      Left = 10
      Top = 76
      Width = 334
      Height = 503
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.ScrollbarMode = sbmDefault
      object cxGridDBBandedTableView1: TcxGridDBBandedTableView
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
        OnCustomDrawCell = TableViewNNCustomDrawCell
        OnFocusedRecordChanged = TableViewFocusedRecordChanged
        DataController.DataSource = DataSource
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        FilterRow.OperatorCustomization = True
        OptionsBehavior.CellHints = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.PullFocusing = True
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.HideSelection = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.BandHeaders = False
        Preview.Column = cxGridDBBandedColumn3
        Preview.MaxLineCount = 0
        Preview.Visible = True
        Bands = <
          item
            Caption = #1057#1087#1080#1089#1086#1082' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
            Width = 400
          end>
        object cxGridDBBandedColumn1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Picture'
          PropertiesClassName = 'TcxImageProperties'
          Properties.GraphicClassName = 'TdxSmartImage'
          Options.Focusing = False
          Options.AutoWidthSizable = False
          Width = 57
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn2: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Header'
          Options.Focusing = False
          Width = 342
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.LineCount = 2
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn3: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Text'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.VisibleLineCount = 3
          Width = 200
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 1
        end
        object cxGridDBBandedColumn4: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Color'
          Visible = False
          VisibleForCustomization = False
          Width = 1043
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
      end
      object ViewSurvey: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
        Navigator.InfoPanel.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        OnFocusedRecordChanged = ViewSurveyFocusedRecordChanged
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = dsSurvey
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        FilterRow.OperatorCustomization = True
        OptionsBehavior.CellHints = True
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.CopyPreviewToClipboard = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsBehavior.PullFocusing = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        Preview.MaxLineCount = 0
        Styles.Content = StyleQuestion
        Styles.OnGetContentStyle = ViewSurveyStylesGetContentStyle
        object ViewSurveyAnswerChecked: TcxGridDBColumn
          DataBinding.FieldName = 'AnswerExists'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Visible = False
          Options.AutoWidthSizable = False
          VisibleForCustomization = False
          Width = 20
        end
        object ViewSurveyQuestionText: TcxGridDBColumn
          DataBinding.FieldName = 'QuestionText'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.ReadOnly = True
          Properties.WantReturns = False
          Options.Editing = False
          Options.Sorting = False
          Width = 107
        end
        object ViewSurveyID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object ViewAnswer: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
        Navigator.InfoPanel.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        OnFocusedRecordChanged = ViewAnswerFocusedRecordChanged
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = dsAnswer
        DataController.DetailKeyFieldNames = 'ID_OrderListSurvey'
        DataController.KeyFieldNames = 'ID'
        DataController.MasterKeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        FilterRow.OperatorCustomization = True
        OptionsBehavior.CellHints = True
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.CopyPreviewToClipboard = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsBehavior.PullFocusing = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        Preview.MaxLineCount = 0
        Styles.Content = StyleAnswer
        object ViewAnswerAnswerChecked: TcxGridDBColumn
          Caption = #1054#1090#1084#1077#1090#1082#1072
          DataBinding.FieldName = 'AnswerChecked'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Options.AutoWidthSizable = False
        end
        object ViewAnswerAnswerText: TcxGridDBColumn
          DataBinding.FieldName = 'AnswerText'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.ReadOnly = True
          Properties.WantReturns = False
          Options.Editing = False
          Width = 200
        end
        object ViewAnswerID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object LevelSurvey: TcxGridLevel
        GridView = ViewSurvey
        object LevelAnswer: TcxGridLevel
          GridView = ViewAnswer
          Options.DetailFrameWidth = 0
        end
      end
    end
    object DockControlAnswer: TdxBarDockControl
      Left = 2
      Top = 18
      Width = 350
      Height = 50
      Align = dalTop
      BarManager = BarManager
    end
  end
  object SplitterRes: TcxSplitter
    Left = 964
    Top = 50
    Width = 8
    Height = 589
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
    Control = gbRes
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = cbOpenAnswer
        Properties.Strings = (
          'EditValue')
      end>
    StorageName = 'PropertiesStore'
    Left = 204
    Top = 136
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 328
    Top = 136
    object aUpdate: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 8
      OnExecute = aUpdateExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aRunSurvey: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1087#1088#1086#1089
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1087#1088#1086#1089
      ImageIndex = 436
      OnExecute = aRunSurveyExecute
    end
    object aExpand: TAction
      Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1086#1090#1074#1077#1090#1099
      Hint = #1056#1072#1089#1082#1088#1099#1090#1100' '#1086#1090#1074#1077#1090#1099
      ImageIndex = 445
      OnExecute = aExpandExecute
    end
    object aCollapse: TAction
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1086#1090#1074#1077#1090#1099
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1086#1090#1074#1077#1090#1099
      ImageIndex = 444
      OnExecute = aCollapseExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 100
      OnExecute = aAddExecute
    end
    object aDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 101
      OnExecute = aDeleteExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 102
      OnExecute = aEditExecute
    end
    object aUndoDelete: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      ImageIndex = 419
      OnExecute = aUndoDeleteExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 103
      OnExecute = aPrintExecute
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
    Left = 436
    Top = 132
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
      FloatLeft = 587
      FloatTop = 207
      FloatClientWidth = 134
      FloatClientHeight = 24
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
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cbDel'
        end
        item
          Visible = True
          ItemName = 'eFromDate'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic1'
        end
        item
          Visible = True
          ItemName = 'eToDate'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
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
      Caption = #1054#1087#1088#1086#1089
      CaptionButtons = <>
      DockControl = DockControlAnswer
      DockedDockControl = DockControlAnswer
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1206
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'cbOpenAnswer'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object eFromDate: TcxBarEditItem
      Caption = #1053#1072#1095#1072#1083#1086':'
      Category = 0
      Hint = #1053#1072#1095#1072#1083#1086
      Visible = ivAlways
      OnKeyDown = eFromDateKeyDown
      Width = 150
      PropertiesClassName = 'TcxDateEditProperties'
      Properties.AssignedValues.DisplayFormat = True
      Properties.AssignedValues.EditFormat = True
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ShowToday = False
    end
    object dxBarStatic1: TdxBarStatic
      Caption = '-'
      Category = 0
      Hint = '-'
      Visible = ivAlways
    end
    object eToDate: TcxBarEditItem
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077':'
      Category = 0
      Hint = #1054#1082#1086#1085#1095#1072#1085#1080#1077
      Visible = ivAlways
      OnKeyDown = eToDateKeyDown
      Width = 150
      PropertiesClassName = 'TcxDateEditProperties'
      Properties.AssignedValues.DisplayFormat = True
      Properties.AssignedValues.EditFormat = True
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ShowToday = False
    end
    object dxBarButton2: TdxBarButton
      Action = aUpdate
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Action = aCancel
      Align = iaRight
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = aRunSurvey
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = aExpand
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aCollapse
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = aAdd
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aEdit
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = aDelete
      Category = 0
    end
    object dxBarButton9: TdxBarButton
      Action = aUndoDelete
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
    object cbOpenAnswer: TcxBarEditItem
      Align = iaRight
      Caption = #1054#1090#1082#1088#1099#1074#1072#1090#1100' '#1086#1090#1074#1077#1090#1099
      Category = 0
      Hint = #1054#1090#1082#1088#1099#1074#1072#1090#1100' '#1086#1090#1074#1077#1090#1099
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      InternalEditValue = False
    end
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 36
    Top = 136
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select OQC.*,'
      
        '  UserInfo(OQC.ID_AppendUser) as UAdd, UserInfo(OQC.ID_AssertUse' +
        'r) as UAssert,'
      
        '  DistrictInfo(OQC.ID_District) as DInfo, StatusTypeInfo(OQC.ID_' +
        'StatusType) as STInfo, StatusTypeQCInfo(OQC.ID_StatusTypeQC) as ' +
        'STQCInfo, ST.Color,'
      
        '  (select count(id) from OrderListSurvey OLS where ID_OrderQuali' +
        'tyCOntrol = OQC.ID) as SurveyCount,'
      
        '  (select count(id) from OrderListSurvey OLS where ID_OrderQuali' +
        'tyCOntrol = OQC.ID and AnswerExists = 1) as SurveyReady'
      'from'
      '  OrderQualityCOntrol OQC, StatusTypeQC as ST'
      'where'
      
        '    (OQC.Deleted = :D or :D = 2) and (OQC.Active = :A or :A = 2)' +
        ' and'
      
        '    ((Date_Format(OQC.AppendTime, '#39'%Y.%m.%d'#39') >= :FD) or (:FD = ' +
        #39#39')) and'
      
        '    ((Date_Format(OQC.AppendTime, '#39'%Y.%m.%d'#39') <= :TD) or (:TD = ' +
        #39#39')) and'
      '    ST.ID = OQC.ID_StatusTypeQC'
      'order by'
      '  OQC.AppendTime')
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
        DataType = ftWideString
        Name = 'FD'
        ParamType = ptUnknown
        Value = '2022.07.01'
      end
      item
        DataType = ftWideString
        Name = 'TD'
        ParamType = ptUnknown
        Value = '2022.07.30'
      end>
    Left = 112
    Top = 132
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
        DataType = ftWideString
        Name = 'FD'
        ParamType = ptUnknown
        Value = '2022.07.01'
      end
      item
        DataType = ftWideString
        Name = 'TD'
        ParamType = ptUnknown
        Value = '2022.07.30'
      end>
    object QueryUAdd: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'UAdd'
      ReadOnly = True
      Size = 200
    end
    object QueryActive: TSmallintField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1072
      FieldName = 'Active'
    end
    object QueryDeleted: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object QueryID_AppendUser: TSmallintField
      FieldName = 'ID_AppendUser'
    end
    object QueryAppendTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'AppendTime'
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object QueryID_OrderList: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072
      FieldName = 'ID_OrderList'
    end
    object QueryID_StatusType: TSmallintField
      FieldName = 'ID_StatusType'
    end
    object QueryID_StatusTypeQC: TSmallintField
      FieldName = 'ID_StatusTypeQC'
    end
    object QueryID_District: TSmallintField
      FieldName = 'ID_District'
    end
    object QueryOrderCloseTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1079#1072#1082#1072#1079#1072
      FieldName = 'OrderCloseTime'
    end
    object QueryOrderAddress: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'OrderAddress'
      Size = 800
    end
    object QueryUAssert: TWideStringField
      DisplayLabel = #1048#1079#1084#1077#1085#1080#1083
      FieldName = 'UAssert'
      ReadOnly = True
      Size = 200
    end
    object QueryDInfo: TWideStringField
      DisplayLabel = #1056#1072#1081#1086#1085
      FieldName = 'DInfo'
      ReadOnly = True
      Size = 200
    end
    object QuerySTInfo: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      FieldName = 'STInfo'
      ReadOnly = True
      Size = 200
    end
    object QuerySTQCInfo: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1082#1072#1095#1077#1089#1090#1074#1072
      FieldName = 'STQCInfo'
      ReadOnly = True
      Size = 200
    end
    object QuerySurveyCount: TLargeintField
      DisplayLabel = #1042#1086#1087#1088#1086#1089#1086#1074
      FieldName = 'SurveyCount'
      ReadOnly = True
    end
    object QuerySurveyReady: TLargeintField
      DisplayLabel = #1054#1090#1074#1077#1090#1086#1074
      FieldName = 'SurveyReady'
      ReadOnly = True
    end
    object QueryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QueryColor: TLargeintField
      FieldName = 'Color'
    end
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 592
    Top = 136
  end
  object StyleRepository: TcxStyleRepository
    Left = 752
    Top = 188
    PixelsPerInch = 96
    object StyleDeleted: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsStrikeOut]
    end
    object StyleBold: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object StyleQuestion: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object StyleAnswer: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object StyleQuestionReady: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13427660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object StyleAnswerReady: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13427660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object qSurvey: TZQuery
    Connection = Datas.ZConnection
    BeforePost = qSurveyBeforePost
    SQL.Strings = (
      'select '
      
        '  OLS.*, AnswerTypeInfo(OLS.AnswerType) as AnswInfo, UserInfo(OL' +
        'S.ID_AssertUser) as UAssert'
      'from'
      '  OrderListSurvey OLS'
      'where'
      '  OLS.ID_OrderQualityControl = :ID '
      'order by'
      '  OLS.QuestionPosition')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 936
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qSurveyID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qSurveyID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object qSurveyAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object qSurveyID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object qSurveyID_OrderQualityControl: TIntegerField
      FieldName = 'ID_OrderQualityControl'
    end
    object qSurveyAnswerType: TSmallintField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswerType'
    end
    object qSurveyAnswerRequired: TSmallintField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1086#1073#1103#1079#1072#1090#1077#1083#1077#1085
      FieldName = 'AnswerRequired'
    end
    object qSurveyQuestionPosition: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'QuestionPosition'
    end
    object qSurveyQuestionText: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'QuestionText'
      Size = 2000
    end
    object qSurveyAnswerExists: TSmallintField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1077#1089#1090#1100
      FieldName = 'AnswerExists'
    end
    object qSurveyUAssert: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'UAssert'
      ReadOnly = True
      Size = 200
    end
    object qSurveyAnswInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswInfo'
      ReadOnly = True
      Size = 80
    end
    object qSurveyID_Survey: TSmallintField
      FieldName = 'ID_Survey'
    end
    object qSurveyQuestionVisibility: TSmallintField
      FieldName = 'QuestionVisibility'
      ReadOnly = True
    end
  end
  object dsSurvey: TDataSource
    DataSet = qSurvey
    Left = 868
    Top = 184
  end
  object qAnswer: TZQuery
    Connection = Datas.ZConnection
    BeforePost = qAnswerBeforePost
    SQL.Strings = (
      'select OLA.*, UserInfo(ID_AssertUser) as UAssert'
      'from'
      '  OrderListSurveyAnswer OLA'
      'where'
      '  OLA.ID_OrderQualityControl = :ID'
      'order by'
      '  OLA.ID_OrderListSurvey, OLA.AnswerPosition')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 936
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object qAnswerID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object qAnswerID_OrderQualityControl: TIntegerField
      FieldName = 'ID_OrderQualityControl'
    end
    object qAnswerID_OrderListSurvey: TIntegerField
      FieldName = 'ID_OrderListSurvey'
    end
    object qAnswerAnswerPosition: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswerPosition'
    end
    object qAnswerAnswerText: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswerText'
      Size = 1000
    end
    object qAnswerAnswerChecked: TSmallintField
      DisplayLabel = #1055#1086#1084#1077#1095#1077#1085
      FieldName = 'AnswerChecked'
    end
    object qAnswerAnswerEdit: TSmallintField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      FieldName = 'AnswerEdit'
    end
    object qAnswerUAssert: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'UAssert'
      ReadOnly = True
      Size = 200
    end
    object qAnswerID_Survey: TSmallintField
      FieldName = 'ID_Survey'
    end
    object qAnswerID_SurveyAnswer: TSmallintField
      FieldName = 'ID_SurveyAnswer'
    end
  end
  object dsAnswer: TDataSource
    DataSet = qAnswer
    Left = 868
    Top = 260
  end
  object ZQuery1: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select '
      
        '  OLS.*, AnswerTypeInfo(OLS.AnswerType) as AnswInfo, UserInfo(OL' +
        'SA.ID_AssertUser) as UAssert,'
      '  OLSA.AnswerText, OLSA.AnswerChecked'
      'from'
      '  OrderListSurvey OLS, OrderListSurveyAnswer OLSA'
      'where'
      
        '  OLS.ID_OrderQualityControl = :ID and OLSA.ID_OrderListSurvey =' +
        ' OLS.ID'
      'order by'
      '  OLS.QuestionPosition, OLSA.AnswerPosition')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 1104
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField2: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID_OrderQualityControl'
    end
    object SmallintField3: TSmallintField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswerType'
    end
    object SmallintField4: TSmallintField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1086#1073#1103#1079#1072#1090#1077#1083#1077#1085
      FieldName = 'AnswerRequired'
    end
    object IntegerField5: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'QuestionPosition'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'QuestionText'
      Size = 2000
    end
    object SmallintField5: TSmallintField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1077#1089#1090#1100
      FieldName = 'AnswerExists'
    end
    object WideStringField2: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'UAssert'
      ReadOnly = True
      Size = 200
    end
    object WideStringField3: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswInfo'
      ReadOnly = True
      Size = 80
    end
    object SmallintField6: TSmallintField
      FieldName = 'ID_Survey'
    end
    object SmallintField7: TSmallintField
      FieldName = 'QuestionVisibility'
      ReadOnly = True
    end
    object WideStringField4: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswerText'
      Size = 1000
    end
    object SmallintField8: TSmallintField
      DisplayLabel = #1054#1090#1084#1077#1090#1082#1072
      FieldName = 'AnswerChecked'
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 1036
    Top = 136
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from OrderQualityCOntrol '
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 116
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
