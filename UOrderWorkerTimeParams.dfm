object OrderWorkerTimeParamsForm: TOrderWorkerTimeParamsForm
  Left = 754
  Top = 231
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1073#1086#1088' '#1074#1088#1077#1084#1077#1085#1080' '#1080' '#1084#1072#1089#1090#1077#1088#1072
  ClientHeight = 660
  ClientWidth = 885
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pBottom: TPanel
    Left = 0
    Top = 624
    Width = 885
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      885
      36)
    object bOK: TcxButton
      Left = 711
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 795
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
  object gbTime: TcxGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 8
    Margins.Left = 4
    Margins.Top = 8
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alTop
    Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103':'
    TabOrder = 0
    DesignSize = (
      877
      237)
    Height = 237
    Width = 877
    object GridTime: TcxGrid
      AlignWithMargins = True
      Left = 12
      Top = 148
      Width = 850
      Height = 73
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 11
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.ScrollbarMode = sbmDefault
      object ViewTime: TcxGridDBCardView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsTime
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.CardSizing = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.FocusRect = False
        OptionsView.ScrollBars = ssHorizontal
        OptionsView.CardBorderWidth = 1
        OptionsView.CardIndent = 3
        OptionsView.CardWidth = 50
        OptionsView.SeparatorWidth = 0
        Styles.Content = TimeStyleContent
        object ViewTimeRow1: TcxGridDBCardViewRow
          DataBinding.FieldName = 'From'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.TimeFormat = tfHourMin
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Position.LineCount = 2
          Styles.Content = TimeStyle
        end
        object ViewTimeInfo: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Info'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Styles.Content = TimeInfoStyle
        end
      end
      object LevelTime: TcxGridLevel
        GridView = ViewTime
      end
    end
    object GridDate: TcxGrid
      AlignWithMargins = True
      Left = 12
      Top = 72
      Width = 850
      Height = 73
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmDefault
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = True
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
        Navigator.InfoPanel.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
        NewItemRow.Visible = True
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
      end
      object cxGridWinExplorerView1: TcxGridWinExplorerView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridWinExplorerViewItem1: TcxGridWinExplorerViewItem
        end
        object cxGridWinExplorerViewItem2: TcxGridWinExplorerViewItem
        end
      end
      object ViewDate: TcxGridDBCardView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsDate
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.CardSizing = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.FocusRect = False
        OptionsView.ScrollBars = ssHorizontal
        OptionsView.CardBorderWidth = 1
        OptionsView.CardIndent = 3
        OptionsView.CardWidth = 64
        OptionsView.SeparatorWidth = 0
        Styles.Content = DayContentStyle
        object ViewDateCaption: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Caption'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Position.LineCount = 2
          Styles.Content = DayStyle
        end
        object ViewDateDescription: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Description'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Styles.Content = WeekdayStyle
        end
      end
      object cxGridDBWinExplorerView1: TcxGridDBWinExplorerView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        ActiveDisplayMode = dmTiles
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridDBWinExplorerViewItem1: TcxGridDBWinExplorerViewItem
          DataBinding.FieldName = 'From'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.TimeFormat = tfHourMin
        end
        object cxGridDBWinExplorerViewItem2: TcxGridDBWinExplorerViewItem
          DataBinding.FieldName = 'To'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.TimeFormat = tfHourMin
        end
      end
      object LevelDate: TcxGridLevel
        GridView = ViewDate
      end
    end
    object pTimeTop: TPanel
      Left = 2
      Top = 21
      Width = 873
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object cxLabel17: TcxLabel
        Left = 8
        Top = 0
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103', '#1091#1082#1072#1079#1072#1085#1085#1099#1077' '#1082#1083#1080#1077#1085#1090#1086#1084':'
        Style.TextStyle = []
        Transparent = True
      end
      object eClientTime: TcxTextEdit
        Left = 8
        Top = 20
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 233
      end
      object cxLabel1: TcxLabel
        Left = 248
        Top = 0
        Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1088#1072#1073#1086#1090':'
        Style.TextStyle = []
        Transparent = True
      end
      object eTimeLen: TcxTextEdit
        Left = 248
        Top = 20
        Properties.ReadOnly = True
        TabOrder = 3
        Width = 133
      end
      object eCategoryList: TcxTextEdit
        Left = 388
        Top = 20
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 153
      end
      object cxLabel2: TcxLabel
        Left = 388
        Top = 0
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103':'
        Style.TextStyle = []
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 708
        Top = 0
        Caption = #1042#1089#1077#1075#1086' '#1084#1072#1089#1090#1077#1088#1086#1074':'
        Style.TextStyle = []
        Transparent = True
      end
      object eWorkerCount: TcxTextEdit
        Left = 708
        Top = 20
        Properties.ReadOnly = True
        TabOrder = 7
        Width = 153
      end
      object eDistrict: TcxTextEdit
        Left = 548
        Top = 20
        Properties.ReadOnly = True
        TabOrder = 8
        Width = 153
      end
      object cxLabel4: TcxLabel
        Left = 548
        Top = 0
        Caption = #1056#1072#1081#1086#1085' '#1075#1086#1088#1086#1076#1072':'
        Style.TextStyle = []
        Transparent = True
      end
    end
  end
  object gbMaster: TcxGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 249
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Caption = #1052#1072#1089#1090#1077#1088':'
    TabOrder = 1
    DesignSize = (
      877
      371)
    Height = 371
    Width = 877
    object GridWorker: TcxGrid
      Left = 12
      Top = 24
      Width = 852
      Height = 331
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 11
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.ScrollbarMode = sbmDefault
      object ViewWorker: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
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
        Navigator.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsWorker
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.CheckBoxPosition = cbpIndicator
        OptionsSelection.CheckBoxVisibility = [cbvDataRow]
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelectMode = msmPersistent
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.FocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object ViewWorkerWorkerName: TcxGridDBColumn
          DataBinding.FieldName = 'WorkerName'
          MinWidth = 176
          Options.Moving = False
          Width = 176
        end
        object ViewWorkerCategoryList: TcxGridDBColumn
          DataBinding.FieldName = 'CategoryList'
          Options.Moving = False
          Width = 100
        end
        object ViewWorkerRequestCount: TcxGridDBColumn
          DataBinding.FieldName = 'RequestCount'
          MinWidth = 60
          Options.AutoWidthSizable = False
          Options.Moving = False
          Width = 80
        end
        object ViewWorkerSum: TcxGridDBColumn
          DataBinding.FieldName = 'RequestSum'
          MinWidth = 60
          Options.AutoWidthSizable = False
          Options.Moving = False
          Width = 80
        end
      end
      object LevelWorker: TcxGridLevel
        GridView = ViewWorker
      end
    end
  end
  object mdDate: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F03000000320000000100080043617074696F6E0032
      00000001000C004465736372697074696F6E00080000000B0005004461746500
      0107000000D1E5E3EEE4EDFF0102000000EFF2010000F06E3800CD4201060000
      00C7E0E2F2F0E00102000000F1E10100001E023B00CD42010B000000CFEEF1EB
      E5E7E0E2F2F0E00102000000E2F10100004C953D00CD42010200000032390102
      000000EFED0100007A284000CD42010200000033300102000000E2F2010000A8
      BB4200CD42}
    SortOptions = []
    Left = 612
    Top = 80
    object mdDateCaption: TStringField
      FieldName = 'Caption'
      Size = 50
    end
    object mdDateDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object mdDateDate: TDateTimeField
      FieldName = 'Date'
    end
  end
  object dsDate: TDataSource
    DataSet = mdDate
    Left = 672
    Top = 76
  end
  object dsTime: TDataSource
    DataSet = mdTime
    Left = 540
    Top = 188
  end
  object mdTime: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F02000000040000000A00050046726F6D0032000000
      01000500496E666F00010051250201070000003120E8E7203130}
    SortOptions = []
    Left = 624
    Top = 188
    object mdTimeFrom: TTimeField
      FieldName = 'From'
    end
    object mdTimeInfo: TStringField
      FieldName = 'Info'
      Size = 50
    end
  end
  object mdWorker: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 492
    Top = 356
    object mdWorkerID: TIntegerField
      FieldName = 'ID'
    end
    object StringField1: TStringField
      DisplayLabel = #1052#1072#1089#1090#1077#1088
      FieldName = 'WorkerName'
      Size = 100
    end
    object mdWorkerWorkClass: TStringField
      DisplayLabel = #1058#1080#1087' '#1088#1072#1073#1086#1090
      FieldName = 'WorkClass'
      Size = 50
    end
    object FloatField3: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldKind = fkCalculated
      FieldName = 'RequestSum'
      DisplayFormat = ',0.'
      Calculated = True
    end
    object mdWorkerRequestCount: TIntegerField
      DisplayLabel = #1047#1072#1103#1074#1086#1082
      FieldName = 'RequestCount'
    end
    object mdWorkerCategoryList: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      FieldName = 'CategoryList'
      Size = 100
    end
  end
  object dsWorker: TDataSource
    DataSet = mdWorker
    Left = 492
    Top = 420
  end
  object StyleRepository: TcxStyleRepository
    Left = 285
    Top = 420
    PixelsPerInch = 96
    object TimeStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clGreen
    end
    object DayStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clMaroon
    end
    object WeekdayStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object DayContentStyle: TcxStyle
      AssignedValues = [svColor]
      Color = clCream
    end
    object TimeStyleContent: TcxStyle
      AssignedValues = [svColor]
      Color = clCream
    end
    object TimeInfoStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clTeal
    end
  end
  object qMaster: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkerView'
      'order by Surname, Name, Patro'
      '  ')
    Params = <>
    Left = 212
    Top = 420
  end
  object tWorkerClass: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkerClass'
      'order by Tag')
    Params = <>
    Left = 260
    Top = 320
  end
  object qWorker: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      
        'select   W.ID, W.Surname, W.Name, W.Patro, WorkerCategoryList(W.' +
        'ID) as CategoryList, Sum(OL.WorkCost) as RequestSum, Count(OL.ID' +
        ') as RequestCount,  WT.*'
      'from  '
      '  Worker W  '
      
        '  inner join WorkerDistrict WD on WD.ID_District = :IDD and WD.I' +
        'D_Worker = W.ID and W.Deleted = 0'
      '  left outer join WorkerTiming WT on WT.ID_Worker = W.ID'
      
        '  left outer join OrderList OL on OL.Deleted = 0 and OL.ID_Worke' +
        'r = W.ID and OL.OrderCategory = 1 and OL.Closed = 0 and DATEDIFF' +
        '(CURDATE(), OL.AddTime) <= 7'
      'where'
      '  (1=1)  '
      'group by '
      '  W.ID, W.Surname, W.Name, W.Patro'
      'order by '
      '  W.Surname, W.Name, W.Patro')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDD'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDD'
        ParamType = ptUnknown
      end>
  end
  object mdData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 108
    Top = 524
    object mdDataDate: TDateTimeField
      FieldName = 'Date'
    end
    object mdDataTime: TDateTimeField
      FieldName = 'Time'
    end
    object mdDataID_Worker: TIntegerField
      FieldName = 'ID_Worker'
    end
    object mdDataMaxTime: TIntegerField
      FieldName = 'MaxTime'
    end
  end
  object qDataOrder: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from OrderList'
      'where '
      '  Date_Format(WorkDate, '#39'%Y.%m.%d'#39') >= :FD and'
      '  Date_Format(WorkDate, '#39'%Y.%m.%d'#39') <= :TD and'
      '  Deleted = 0 and Cancelled = 0 and ID <> :IDE and'
      '  ID_Worker in'
      '(0)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
    Left = 168
    Top = 524
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
  end
  object dsData: TDataSource
    DataSet = mdData
    Left = 232
    Top = 525
  end
  object qWorkRestDay: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkRestDay'
      'where ID_Worker = :IDW  '
      'order by ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDW'
        ParamType = ptUnknown
      end>
    Left = 396
    Top = 524
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDW'
        ParamType = ptUnknown
      end>
  end
  object mdDataDay: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 464
    Top = 524
    object DateTimeField1: TDateTimeField
      FieldName = 'Date'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Time'
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID_Worker'
    end
    object IntegerField2: TIntegerField
      FieldName = 'MaxTime'
    end
  end
end
