object NoticeOptionsActionForm: TNoticeOptionsActionForm
  Left = 331
  Top = 196
  Action = MainForm.aaNoticeOptionsAction
  Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1076#1083#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
  ClientHeight = 448
  ClientWidth = 1156
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
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
  object Grid: TcxGrid
    Left = 0
    Top = 50
    Width = 1156
    Height = 381
    Align = alClient
    TabOrder = 0
    object TableView: TcxGridDBTableView
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
      OnCellDblClick = TableViewCellDblClick
      OnFocusedRecordChanged = TableViewFocusedRecChanged
      DataController.DataSource = DataSource
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
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewOrderFieldName: TcxGridDBColumn
        DataBinding.FieldName = 'OrderFieldName'
        Width = 150
      end
      object TableViewOrderFieldCaption: TcxGridDBColumn
        DataBinding.FieldName = 'OrderFieldCaption'
        Width = 150
      end
      object TableViewTableName: TcxGridDBColumn
        DataBinding.FieldName = 'TableName'
        Width = 120
      end
      object TableViewTableCaption: TcxGridDBColumn
        DataBinding.FieldName = 'TableCaption'
        Width = 200
      end
      object TableViewFieldName: TcxGridDBColumn
        DataBinding.FieldName = 'FieldName'
        Width = 150
      end
      object TableViewFieldCaption: TcxGridDBColumn
        DataBinding.FieldName = 'FieldCaption'
        Width = 150
      end
      object TableViewOrderFieldValue: TcxGridDBColumn
        DataBinding.FieldName = 'OrderFieldValue'
        Width = 150
      end
      object TableViewOrderFieldValueCaption: TcxGridDBColumn
        DataBinding.FieldName = 'OrderFieldValueCaption'
        Width = 200
      end
      object TableViewCondEqual: TcxGridDBColumn
        DataBinding.FieldName = 'CondEqual'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 100
      end
      object TableViewCondNotEqual: TcxGridDBColumn
        DataBinding.FieldName = 'CondNotEqual'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 100
      end
      object TableViewCanSetValue: TcxGridDBColumn
        DataBinding.FieldName = 'CanSetValue'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 100
      end
      object TableViewCanSetNull: TcxGridDBColumn
        DataBinding.FieldName = 'CanSetNull'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 100
      end
      object TableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 431
    Width = 1156
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 108
    Top = 84
  end
  object PSFileBasedExplorer: TdxPSFileBasedExplorer
    FilterLink = 'TcxGrid'
    Left = 416
    Top = 84
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = ComponentPrinterLink1
    Explorer = PSFileBasedExplorer
    PreviewOptions.Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
    Version = 0
    Left = 416
    Top = 140
    PixelsPerInch = 96
    object ComponentPrinterLink1: TdxGridReportLink
      Active = True
      Component = Grid
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 44770.867813229170000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        GridView = TableView
        HitTypes = [gvhtNone, gvhtCell]
        Index = 0
      end>
    Left = 316
    Top = 84
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
    Top = 84
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      50
      0)
    object BarManagerBar1: TdxBar
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
      Caption = 'OK'
      Category = 0
      Hint = 'OK'
      Visible = ivAlways
      ImageIndex = 98
      ShortCut = 16397
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
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 172
    Top = 84
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
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
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 32
    Top = 84
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
    Left = 316
    Top = 140
    PixelsPerInch = 96
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from NoticeOptionsAction'
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
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select *'
      'from NoticeOptionsAction'
      'order by FieldCaption')
    Params = <>
    Left = 56
    Top = 176
    object QueryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QueryTableName: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      FieldName = 'TableName'
      Size = 200
    end
    object QueryTableCaption: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      FieldName = 'TableCaption'
      Size = 200
    end
    object QueryFieldName: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1087#1086#1083#1103
      FieldName = 'FieldName'
      Size = 200
    end
    object QueryFieldCaption: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1103
      FieldName = 'FieldCaption'
      Size = 400
    end
    object QueryOrderFieldName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1083#1077' '#1074' '#1079#1072#1082#1072#1079#1072#1093
      FieldName = 'OrderFieldName'
      Size = 200
    end
    object QueryOrderFieldCaption: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1103' '#1074' '#1079#1072#1082#1072#1079#1072#1093
      FieldName = 'OrderFieldCaption'
      Size = 2000
    end
    object QueryOrderFieldValue: TWideStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103
      FieldName = 'OrderFieldValue'
      Size = 2000
    end
    object QueryOrderFieldValueCaption: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
      FieldName = 'OrderFieldValueCaption'
      Size = 2000
    end
    object QueryCondEqual: TSmallintField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1077' '#1056#1040#1042#1053#1054
      FieldName = 'CondEqual'
    end
    object QueryCondNotEqual: TSmallintField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1077' '#1053#1045' '#1056#1040#1042#1053#1054
      FieldName = 'CondNotEqual'
    end
    object QueryCanSetValue: TSmallintField
      DisplayLabel = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1079#1085#1072#1095#1077#1085#1080#1103
      FieldName = 'CanSetValue'
    end
    object QueryCanSetNull: TSmallintField
      DisplayLabel = #1059#1089#1090#1072#1085#1086#1074#1082#1072' NULL'
      FieldName = 'CanSetNull'
    end
  end
end
