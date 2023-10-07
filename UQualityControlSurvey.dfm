object QualityControlSurveyForm: TQualityControlSurveyForm
  Left = 436
  Top = 305
  ActiveControl = VerticalGrid
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1052#1072#1089#1090#1077#1088' '#1086#1087#1088#1086#1089#1072
  ClientHeight = 630
  ClientWidth = 837
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
  object GridSurvey: TcxGrid
    Left = 0
    Top = 208
    Width = 837
    Height = 398
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
    TabOrder = 2
    LookAndFeel.ScrollbarMode = sbmDefault
    ExplicitHeight = 402
    object ViewSurvey: TcxGridDBTableView
      OnKeyDown = ViewSurveyKeyDown
      OnKeyPress = ViewSurveyKeyPress
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = True
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
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsBehavior.CellHints = True
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsBehavior.FocusCellOnCycle = True
      OptionsBehavior.PullFocusing = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
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
      object ViewSurveyQuestionPosition: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'QuestionPosition'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Options.AutoWidthSizable = False
        VisibleForCustomization = False
        Width = 40
      end
      object ViewSurveyAnswerExists: TcxGridDBColumn
        DataBinding.FieldName = 'AnswerExists'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ImmediatePost = True
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Visible = False
        Options.Filtering = False
        Options.AutoWidthSizable = False
        VisibleForCustomization = False
        Width = 40
      end
      object ViewSurveyQuestionText: TcxGridDBColumn
        DataBinding.FieldName = 'QuestionText'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.ReadOnly = True
        Properties.WantReturns = False
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 107
      end
      object ViewSurveyID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        VisibleForCustomization = False
      end
    end
    object ViewAnswer: TcxGridDBTableView
      OnKeyDown = ViewAnswerKeyDown
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = True
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
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsBehavior.CellHints = True
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsBehavior.FocusCellOnCycle = True
      OptionsBehavior.PullFocusing = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Preview.MaxLineCount = 0
      Styles.Content = StyleAnswer
      Styles.OnGetContentStyle = ViewAnswerStylesGetContentStyle
      object ViewAnswerAnswerPosition: TcxGridDBColumn
        DataBinding.FieldName = 'AnswerPosition'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Options.AutoWidthSizable = False
        VisibleForCustomization = False
        Width = 40
      end
      object ViewAnswerAnswerChecked: TcxGridDBColumn
        DataBinding.FieldName = 'AnswerChecked'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ImmediatePost = True
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Options.AutoWidthSizable = False
        Width = 40
      end
      object ViewAnswerAnswerText: TcxGridDBColumn
        DataBinding.FieldName = 'AnswerText'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.ReadOnly = True
        Properties.WantReturns = False
        Options.Editing = False
      end
      object ViewAnswerAnswerEdit: TcxGridDBColumn
        DataBinding.FieldName = 'AnswerEdit'
        Visible = False
        Options.AutoWidthSizable = False
        VisibleForCustomization = False
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
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 606
    Width = 837
    Height = 24
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
        Text = #1055#1088#1086#1075#1088#1077#1089#1089':'
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer0
        Bevel = dxpbNone
        Width = 200
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitTop = 610
    object StatusBarContainer0: TdxStatusBarContainerControl
      Left = 54
      Top = 2
      Width = 767
      Height = 22
      object ProgressBar: TcxProgressBar
        Left = 0
        Top = 0
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 84
        ExplicitTop = 4
        ExplicitWidth = 121
        ExplicitHeight = 21
        Width = 767
      end
    end
  end
  object VerticalGrid: TcxDBVerticalGrid
    Left = 0
    Top = 50
    Width = 837
    Height = 150
    Align = alTop
    Constraints.MinHeight = 1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    OptionsView.ScrollBars = ssVertical
    OptionsView.RowHeaderWidth = 258
    OptionsView.ValueWidth = 200
    OptionsView.ValueMinWidth = 100
    OptionsBehavior.GoToNextCellOnEnter = True
    OptionsBehavior.GoToNextCellOnTab = True
    OptionsBehavior.FocusCellOnCycle = True
    OptionsBehavior.FocusFirstCellOnNewRecord = True
    OptionsData.CancelOnExit = False
    OptionsData.Editing = False
    OptionsData.Appending = False
    OptionsData.Deleting = False
    OptionsData.DeletingConfirmation = False
    OptionsData.Inserting = False
    OptionsData.MultiThreadedFiltering = bFalse
    Navigator.Buttons.CustomButtons = <>
    ParentFont = False
    ScrollbarAnnotations.CustomAnnotations = <>
    TabOrder = 0
    DataController.DataSource = DataSource
    DataController.GridMode = True
    Version = 1
    object VerticalGridOrderNUmber: TcxDBEditorRow
      Properties.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.EditProperties.Alignment = taLeftJustify
      Properties.DataBinding.FieldName = 'ID'
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object VerticalGridOrderDate: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'OrderDate'
      ID = 1
      ParentID = -1
      Index = 1
      Version = 1
    end
    object VerticalGridOCInfo: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'OCInfo'
      ID = 2
      ParentID = -1
      Index = 2
      Version = 1
    end
    object VerticalGridName: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'Name'
      ID = 3
      ParentID = -1
      Index = 3
      Version = 1
    end
    object VerticalGridPhone: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'Phone'
      ID = 4
      ParentID = -1
      Index = 4
      Version = 1
    end
    object VerticalGridIsClientDOMSPB: TcxDBEditorRow
      Properties.Caption = #1050#1083#1080#1077#1085#1090' '#1044#1054#1052' '#1057#1055#1073
      Properties.RepositoryItem = Datas.EditRepositoryIntCheckBox
      Properties.DataBinding.FieldName = 'IsClientDOMSPB'
      ID = 5
      ParentID = -1
      Index = 5
      Version = 1
    end
    object VerticalGridAddress: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'Address'
      ID = 6
      ParentID = -1
      Index = 6
      Version = 1
    end
    object VerticalGridFlatNumber: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'FlatNumber'
      ID = 7
      ParentID = -1
      Index = 7
      Version = 1
    end
    object VerticalGridRequestText: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.EditProperties.VisibleLineCount = 3
      Properties.DataBinding.FieldName = 'RequestText'
      ID = 8
      ParentID = -1
      Index = 8
      Version = 1
    end
    object VerticalGridClientComment: TcxDBEditorRow
      Properties.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082#1083#1080#1077#1085#1090#1072
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.EditProperties.VisibleLineCount = 3
      Properties.DataBinding.FieldName = 'ClientComment'
      ID = 9
      ParentID = -1
      Index = 9
      Version = 1
    end
    object VerticalGridStatusInfo: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'StatusInfo'
      ID = 10
      ParentID = -1
      Index = 10
      Version = 1
    end
    object VerticalGridStatusComment: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'StatusComment'
      ID = 11
      ParentID = -1
      Index = 11
      Version = 1
    end
    object VerticalGridPFInfo: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'PFInfo'
      ID = 12
      ParentID = -1
      Index = 12
      Version = 1
    end
    object VerticalGridPayed: TcxDBEditorRow
      Properties.RepositoryItem = Datas.EditRepositoryIntCheckBox
      Properties.DataBinding.FieldName = 'Payed'
      ID = 13
      ParentID = -1
      Index = 13
      Version = 1
    end
    object VerticalGridPersonalAccount: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'PersonalAccount'
      ID = 14
      ParentID = -1
      Index = 14
      Version = 1
    end
    object VerticalGridSignalInfo: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'SignalInfo'
      ID = 15
      ParentID = -1
      Index = 15
      Version = 1
    end
    object VerticalGridSourceInfo: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'SourceInfo'
      ID = 16
      ParentID = -1
      Index = 16
      Version = 1
    end
    object VerticalGridOrderNumberExt: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'OrderNumberExt'
      ID = 17
      ParentID = -1
      Index = 17
      Version = 1
    end
    object VerticalGridAddUser: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'AddUser'
      ID = 18
      ParentID = -1
      Index = 18
      Version = 1
    end
    object VerticalGridAddTime: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'AddTime'
      ID = 19
      ParentID = -1
      Index = 19
      Version = 1
    end
    object VerticalGridAssertUser: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'AssertUser'
      ID = 20
      ParentID = -1
      Index = 20
      Version = 1
    end
    object VerticalGridAssertTime: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'AssertTime'
      ID = 21
      ParentID = -1
      Index = 21
      Version = 1
    end
    object VerticalGridClientDateTime: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'ClientDateTime'
      ID = 22
      ParentID = -1
      Index = 22
      Version = 1
    end
    object VerticalGridWorkDate: TcxDBEditorRow
      Properties.Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'WorkDate'
      ID = 23
      ParentID = -1
      Index = 23
      Version = 1
    end
    object VerticalGridWorkTime: TcxDBEditorRow
      Properties.Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.EditProperties.Alignment = taLeftJustify
      Properties.DataBinding.FieldName = 'WorkTime'
      ID = 24
      ParentID = -1
      Index = 24
      Version = 1
    end
    object VerticalGridClosed: TcxDBEditorRow
      Properties.RepositoryItem = Datas.EditRepositoryIntCheckBox
      Properties.DataBinding.FieldName = 'Closed'
      ID = 25
      ParentID = -1
      Index = 25
      Version = 1
    end
    object VerticalGridCloseTime: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.DataBinding.FieldName = 'CloseTime'
      ID = 26
      ParentID = -1
      Index = 26
      Version = 1
    end
    object VerticalGridDeleted: TcxDBEditorRow
      Properties.RepositoryItem = Datas.EditRepositoryIntCheckBox
      Properties.DataBinding.FieldName = 'Deleted'
      ID = 27
      ParentID = -1
      Index = 27
      Version = 1
    end
  end
  object Splitter: TcxSplitter
    Left = 0
    Top = 200
    Width = 837
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salTop
    Control = VerticalGrid
  end
  object dsSurvey: TDataSource
    DataSet = mdSurvey
    Left = 302
    Top = 272
  end
  object qSurvey: TZQuery
    Connection = Datas.ZConnection
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
    Left = 126
    Top = 272
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
  object qAnswer: TZQuery
    Connection = Datas.ZConnection
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
    Left = 126
    Top = 356
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
    DataSet = mdAnswer
    Left = 302
    Top = 356
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
    Left = 408
    Top = 268
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      50
      0)
    object BarManagerBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
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
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'cbOpenAnswer'
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
    object dxBarButton3: TdxBarButton
      Action = aExpand
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aCollapse
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = aCheck
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = aUncheck
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aOK
      Category = 0
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
      InternalEditValue = True
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 412
    Top = 356
    object aUpdate: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 8
      OnExecute = aUpdateExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
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
    object aCheck: TAction
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1086#1090#1074#1077#1090#1099
      Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1086#1090#1074#1077#1090#1099' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1074#1086#1087#1088#1086#1089#1086#1074
      ImageIndex = 120
      OnExecute = aCheckExecute
    end
    object aUncheck: TAction
      Caption = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1080' '#1086#1090#1074#1077#1090#1086#1074
      Hint = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1080' '#1086#1090#1074#1077#1090#1086#1074' '#1085#1072' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1074#1086#1087#1088#1086#1089#1099
      ImageIndex = 121
      OnExecute = aUncheckExecute
    end
    object aOK: TAction
      Caption = 'OK'
      Hint = 'OK'
      ImageIndex = 98
      ShortCut = 16397
      OnExecute = aOKExecute
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 282
    Top = 464
    PixelsPerInch = 96
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
    object StyleAnswerEdit: TcxStyle
      AssignedValues = [svColor]
      Color = 12902911
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      
        'select Date_Add(OL.CloseTime, interval E.OldOrderTime hour) as H' +
        'ideTime, '
      
        '  OL.*, UserInfo(OL.ID_AssertUser) as AssertUser, UserInfo(OL.ID' +
        '_AddUser) as AddUser, '
      
        '  WorkerInfo(OL.ID_Worker) as WInfo, OrderCategoryInfo(OL.OrderC' +
        'ategory) as OCInfo,'
      
        '  StatusTypeInfo(OL.ID_StatusType) as StatusInfo, SignalTypeInfo' +
        '(OL.ID_SignalType) as SignalInfo, ReasonInfo(OL.ID_Reason) as Re' +
        'asonInfo,'
      
        '  PaymentFormInfo(OL.ID_PaymentForm) as PFInfo, SourceTypeInfo(O' +
        'L.ID_SourceType) as SourceInfo'
      'from'
      '  Enterprise E'
      '  inner join OrderList OL on'
      '    OL.ID = :ID'
      '   left join Worker W on'
      '     W.ID = OL.ID_Worker'
      'order by  '
      '  OL.ID desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 404
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QueryID: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1081
      FieldName = 'ID'
      Required = True
    end
    object QueryDeleted: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object QueryID_AddUser: TSmallintField
      FieldName = 'ID_AddUser'
    end
    object QueryAddUser: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'AddUser'
      ReadOnly = True
      Size = 50
    end
    object QueryAddTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'AddTime'
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryAssertEmployee: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object QueryAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object QueryRequestText: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1079#1072#1082#1072#1079#1091
      FieldName = 'RequestText'
      Size = 500
    end
    object QueryOrderNUmber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderNUmber'
    end
    object QueryOrderDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderDate'
    end
    object QueryOrderCategory: TSmallintField
      FieldName = 'OrderCategory'
    end
    object QueryClosed: TSmallintField
      DisplayLabel = #1047#1072#1082#1088#1099#1090#1072
      FieldName = 'Closed'
    end
    object QueryID_Client: TIntegerField
      FieldName = 'ID_Client'
    end
    object QueryPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'Phone'
    end
    object QueryAddress: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'Address'
      Size = 200
    end
    object QueryID_StatusType: TSmallintField
      FieldName = 'ID_StatusType'
    end
    object QueryID_SignalType: TSmallintField
      FieldName = 'ID_SignalType'
    end
    object QueryID_SourceType: TSmallintField
      FieldName = 'ID_SourceType'
    end
    object QueryID_Distrinct: TSmallintField
      FieldName = 'ID_District'
    end
    object QueryID_Metro: TSmallintField
      FieldName = 'ID_Metro'
    end
    object QueryFiles: TSmallintField
      DisplayLabel = #1045#1089#1090#1100' '#1092#1072#1081#1083#1099
      FieldName = 'Files'
    end
    object QueryID_PaymentForm: TSmallintField
      FieldName = 'ID_PaymentForm'
    end
    object QueryID_Worker: TSmallintField
      FieldName = 'ID_Worker'
    end
    object QueryWorkDate: TDateTimeField
      FieldName = 'WorkDate'
    end
    object QueryWorkTime: TDateTimeField
      Alignment = taCenter
      FieldName = 'WorkTime'
      DisplayFormat = 'hh:nn'
    end
    object QueryPlanTime: TFloatField
      FieldName = 'PlanTime'
    end
    object QueryWorkCost: TFloatField
      FieldName = 'WorkCost'
      DisplayFormat = ',0.##'
    end
    object QueryWInfo: TWideStringField
      FieldName = 'WInfo'
      ReadOnly = True
      Size = 100
    end
    object QueryOCInfo: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OCInfo'
      ReadOnly = True
    end
    object QueryFlatNumber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1072#1088#1090#1080#1088#1099
      FieldName = 'FlatNumber'
      Size = 50
    end
    object QueryName: TWideStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'Name'
      Size = 150
    end
    object QueryIsClientDOMSPB: TSmallintField
      FieldName = 'IsClientDOMSPB'
      ReadOnly = True
    end
    object QueryClientComment: TWideStringField
      FieldName = 'ClientComment'
      ReadOnly = True
      Size = 200
    end
    object QueryClientDateTime: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientDateTime'
      ReadOnly = True
    end
    object QueryStatusComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1090#1072#1090#1091#1089#1091
      FieldName = 'StatusComment'
      ReadOnly = True
      Size = 200
    end
    object QueryPayed: TSmallintField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'Payed'
      ReadOnly = True
    end
    object QueryStatusInfo: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'StatusInfo'
      ReadOnly = True
      Size = 50
    end
    object QuerySignalInfo: TWideStringField
      DisplayLabel = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'SignalInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryPFInfo: TWideStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PFInfo'
      ReadOnly = True
      Size = 50
    end
    object QuerySourceInfo: TWideStringField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'SourceInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryID_Reason: TSmallintField
      FieldName = 'ID_Reason'
    end
    object QueryReasonInfo: TWideStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldName = 'ReasonInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryHideTime: TDateTimeField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1085#1072' '#1076#1086
      FieldName = 'HideTime'
      ReadOnly = True
    end
    object QueryCloseTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'CloseTime'
    end
    object QueryNeedCallDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1074#1086#1085#1082#1072' '#1082#1083#1080#1077#1085#1090#1091
      FieldName = 'NeedCallDate'
    end
    object QueryUid: TWideStringField
      FieldName = 'Uid'
      Size = 256
    end
    object QueryCheckNumber: TWideStringField
      FieldName = 'CheckNumber'
      Size = 400
    end
    object QueryWorkDateTime: TDateTimeField
      FieldName = 'WorkDateTime'
    end
    object QueryID_DiscountPromo: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object QueryOrderNumberExt: TWideStringField
      DisplayLabel = #1042#1085#1077#1096#1085#1080#1081' '#1085#1086#1084#1077#1088
      FieldName = 'OrderNumberExt'
      ReadOnly = True
      Size = 800
    end
    object QueryPersonalAccount: TWideStringField
      DisplayLabel = #1051#1080#1094'.'#1089#1095#1077#1090'/GUID'
      FieldName = 'PersonalAccount'
      ReadOnly = True
      Size = 400
    end
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 480
    Top = 112
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = cbOpenAnswer
        Properties.Strings = (
          'EditValue')
      end
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Left'
          'Top'
          'Width')
      end
      item
        Component = VerticalGrid
        Properties.Strings = (
          'Height')
      end>
    StorageName = 'PropertiesStore'
    Left = 204
    Top = 136
  end
  object mdSurvey: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 216
    Top = 272
    object mdSurveyID: TIntegerField
      FieldName = 'ID'
    end
    object mdSurveyID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object mdSurveyAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object mdSurveyID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object mdSurveyID_OrderQualityControl: TIntegerField
      FieldName = 'ID_OrderQualityControl'
    end
    object mdSurveyAnswerType: TSmallintField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswerType'
    end
    object mdSurveyAnswerRequired: TSmallintField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1086#1073#1103#1079#1072#1090#1077#1083#1077#1085
      FieldName = 'AnswerRequired'
    end
    object mdSurveyQuestionPosition: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'QuestionPosition'
    end
    object mdSurveyQuestionText: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'QuestionText'
      Size = 2000
    end
    object mdSurveyAnswerExists: TSmallintField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1077#1089#1090#1100
      FieldName = 'AnswerExists'
    end
    object mdSurveyUAssert: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'UAssert'
      Size = 200
    end
    object mdSurveyAnswInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswInfo'
      Size = 80
    end
    object mdSurveyID_Survey: TSmallintField
      FieldName = 'ID_Survey'
    end
    object mdSurveyQuestionVisibility: TSmallintField
      FieldName = 'QuestionVisibility'
    end
  end
  object mdAnswer: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterPost = mdAnswerAfterPost
    Left = 216
    Top = 356
    object mdAnswerID: TIntegerField
      FieldName = 'ID'
    end
    object mdAnswerID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object mdAnswerAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object mdAnswerID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object mdAnswerID_OrderQualityControl: TIntegerField
      FieldName = 'ID_OrderQualityControl'
    end
    object mdAnswerID_OrderListSurvey: TIntegerField
      FieldName = 'ID_OrderListSurvey'
    end
    object mdAnswerAnswerPosition: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswerPosition'
    end
    object mdAnswerAnswerText: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1086#1090#1074#1077#1090#1072
      FieldName = 'AnswerText'
      Size = 1000
    end
    object mdAnswerAnswerChecked: TSmallintField
      DisplayLabel = #1055#1086#1084#1077#1095#1077#1085
      FieldName = 'AnswerChecked'
    end
    object mdAnswerAnswerEdit: TSmallintField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      FieldName = 'AnswerEdit'
    end
    object mdAnswerUAssert: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'UAssert'
      Size = 200
    end
    object mdAnswerID_Survey: TSmallintField
      FieldName = 'ID_Survey'
    end
    object mdAnswerID_SurveyAnswer: TSmallintField
      FieldName = 'ID_SurveyAnswer'
    end
    object mdAnswerEdited: TIntegerField
      FieldName = 'Edited'
    end
  end
end
