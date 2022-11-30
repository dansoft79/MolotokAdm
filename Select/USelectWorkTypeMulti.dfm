object SelectWorkTypeMultiForm: TSelectWorkTypeMultiForm
  Left = 388
  Top = 259
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1074#1080#1076#1086#1074' '#1088#1072#1073#1086#1090
  ClientHeight = 561
  ClientWidth = 1159
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
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
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 544
    Width = 1159
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
    ExplicitTop = 401
    ExplicitWidth = 824
  end
  object Grid: TcxGrid
    Left = 0
    Top = 50
    Width = 1159
    Height = 494
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    ExplicitWidth = 824
    ExplicitHeight = 351
    object TableView: TcxGridDBTableView
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
      OnEditValueChanged = TableViewEditValueChanged
      OnFocusedRecordChanged = TableViewFocusedRecordChanged
      DataController.DataSource = DataSource
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting, dcoMultiSelectionSyncGroupWithChildren]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.CheckBoxPosition = cbpIndicator
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
      end
      object TableViewSelected: TcxGridDBColumn
        DataBinding.FieldName = 'Selected'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 60
      end
      object TableViewWorkCode: TcxGridDBColumn
        DataBinding.FieldName = 'Code'
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 80
      end
      object TableViewWCInfo: TcxGridDBColumn
        DataBinding.FieldName = 'WCInfo'
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 180
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 400
      end
      object TableViewWorkerClass: TcxGridDBColumn
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        DataBinding.FieldName = 'WCLInfo'
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 80
      end
      object TableViewAmount: TcxGridDBColumn
        DataBinding.FieldName = 'AmountText'
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 80
      end
      object TableViewPrice: TcxGridDBColumn
        DataBinding.FieldName = 'Price'
        Options.Editing = False
        Width = 80
      end
      object TableViewWarranty: TcxGridDBColumn
        DataBinding.FieldName = 'WarrantyText'
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 80
      end
      object TableViewNorm: TcxGridDBColumn
        DataBinding.FieldName = 'Norm'
        Options.Editing = False
        Width = 80
      end
      object TableViewFrequentWork: TcxGridDBColumn
        DataBinding.FieldName = 'FrequentWork'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Visible = False
        Options.Editing = False
      end
      object TableViewPublicWork: TcxGridDBColumn
        DataBinding.FieldName = 'PublicWork'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Visible = False
        Options.Editing = False
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Visible = False
        Options.Editing = False
        Options.FilterRowOperator = foContains
        Width = 200
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 292
    Top = 132
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 120
    Top = 132
    object aOK: TAction
      Caption = 'OK'
      Hint = 'OK'
      ImageIndex = 98
      ShortCut = 16397
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aSelectAll: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 120
      OnExecute = aSelectAllExecute
    end
    object aUnselectAll: TAction
      Caption = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      Hint = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      ImageIndex = 121
      OnExecute = aUnselectAllExecute
    end
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
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
    Left = 180
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
      FloatLeft = 404
      FloatTop = 343
      FloatClientWidth = 23
      FloatClientHeight = 22
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
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end>
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton3: TdxBarButton
      Action = aOK
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aCancel
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = aSelectAll
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = aUnselectAll
      Category = 0
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select *, '#39'0'#39' as Selected, '
      
        '  UserInfo(ID_AssertUser) as AssertUser, WorkClassInfo(ID_WorkCl' +
        'ass) as WCInfo, WarrantyTypeInfo(WarrantyType) as WTInfo, Worker' +
        'ClassTag(ID_WorkerClass) WCLInfo,'
      
        '  Concat(Convert(Amount, CHAR CHARACTER SET utf8mb4), '#39' '#39', UnitN' +
        'ame) as AmountText,'
      
        '  Concat(Convert(WarrantyTime, CHAR CHARACTER SET utf8mb4), '#39' '#39',' +
        ' WarrantyTypeShortInfo(WarrantyType)) as WarrantyText'
      'from worktypeview'
      'order by WCInfo, Name')
    Params = <>
    Left = 236
    Top = 132
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
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      Size = 200
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryID_WorkClass: TSmallintField
      FieldName = 'ID_WorkClass'
    end
    object QueryPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'Price'
      DisplayFormat = ',0.##'
    end
    object QueryNorm: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072
      FieldName = 'Norm'
    end
    object QueryAmount: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'Amount'
    end
    object QueryUnitName: TWideStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      FieldName = 'UnitName'
    end
    object QueryWarrantyTime: TIntegerField
      DisplayLabel = #1057#1088#1086#1082' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WarrantyTime'
    end
    object QueryWarrantyType: TSmallintField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WarrantyType'
    end
    object QueryFrequentWork: TSmallintField
      DisplayLabel = #1063#1072#1089#1090#1072#1103
      FieldName = 'FrequentWork'
    end
    object QueryPublicWork: TSmallintField
      DisplayLabel = #1055#1091#1073#1083#1080#1095#1085#1072#1103
      FieldName = 'PublicWork'
    end
    object QueryWCInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1088#1072#1073#1086#1090#1099
      FieldName = 'WCInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryWTInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WTInfo'
      ReadOnly = True
    end
    object QueryWorkCode: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
      ReadOnly = True
    end
    object QueryID_WorkerClass: TSmallintField
      FieldName = 'ID_WorkerClass'
      ReadOnly = True
    end
    object QueryWCLInfo: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
      FieldName = 'WCLInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryAssertUser: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object QueryDescription: TWideStringField
      FieldName = 'Description'
      Size = 4000
    end
    object QuerySelected: TWideStringField
      DisplayLabel = #1042#1099#1073#1088#1072#1085#1086
      FieldName = 'Selected'
      ReadOnly = True
      Size = 4
    end
    object QueryAmountText: TWideStringField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'AmountText'
      ReadOnly = True
      Size = 172
    end
    object QueryWarrantyText: TWideStringField
      DisplayLabel = #1043#1072#1088#1072#1085#1090#1080#1103
      FieldName = 'WarrantyText'
      ReadOnly = True
      Size = 128
    end
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        GridView = TableView
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 380
    Top = 132
  end
  object MemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 468
    Top = 132
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Left'
          'Top'
          'Width'
          'WindowState')
      end>
    StorageName = 'PropertiesStore'
    Left = 124
    Top = 192
  end
end
