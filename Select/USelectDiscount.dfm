object SelectDiscountForm: TSelectDiscountForm
  Left = 388
  Top = 259
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1089#1082#1080#1076#1082#1080
  ClientHeight = 478
  ClientWidth = 1278
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
  object DBGrid: TcxGrid
    Left = 0
    Top = 50
    Width = 1278
    Height = 411
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 703
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
      OnFocusedRecordChanged = TableViewFocusedRecordChanged
      DataController.DataSource = DataSource
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = '<'#1092#1080#1083#1100#1090#1088'>'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewPromocode: TcxGridDBColumn
        DataBinding.FieldName = 'Promocode'
        Width = 150
      end
      object TableViewFromDate: TcxGridDBColumn
        DataBinding.FieldName = 'FromDate'
      end
      object TableViewToDate: TcxGridDBColumn
        DataBinding.FieldName = 'ToDate'
      end
      object TableViewDiscountText: TcxGridDBColumn
        DataBinding.FieldName = 'DiscountText'
        Width = 100
      end
      object TableViewMinOrderSum: TcxGridDBColumn
        DataBinding.FieldName = 'MinOrderSum'
      end
      object TableViewDDTInfo: TcxGridDBColumn
        DataBinding.FieldName = 'DDTInfo'
        Width = 150
      end
      object TableViewDSTInfo: TcxGridDBColumn
        DataBinding.FieldName = 'DSTInfo'
        Width = 150
      end
      object TableViewCanAdd: TcxGridDBColumn
        DataBinding.FieldName = 'CanAdd'
        Width = 100
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 300
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 461
    Width = 1278
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
    ExplicitWidth = 703
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 244
    Top = 140
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 72
    Top = 140
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
    Left = 132
    Top = 140
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
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Visible = ivAlways
      ImageIndex = 100
    end
    object dxBarButton2: TdxBarButton
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      Category = 0
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      Visible = ivAlways
      ImageIndex = 118
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = QueryAfterScroll
    OnCalcFields = QueryCalcFields
    SQL.Strings = (
      'select'
      '  *,'
      '  DiscountTypeInfo(Type) as DTInfo,'
      '  DiscountDebtTypeInfo(DebtType) as DDTInfo,'
      '  DiscountSubTypeInfo(SubType) as DSTInfo'
      'from DiscountType'
      'where '
      '  Active = 1 and Deleted = 0 and '
      
        '  ((Date_Format(FromDate, '#39'%Y.%m.%d'#39') <= :DT) or FromDate is nul' +
        'l) and'
      
        '  ((Date_Format(ToDate, '#39'%Y.%m.%d'#39') >= :DT) or ToDate is null) a' +
        'nd'
      '  Promocode <> '#39#39' '
      'order by Name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DT'
        ParamType = ptUnknown
      end>
    Left = 188
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT'
        ParamType = ptUnknown
      end>
    object QueryID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object QueryActive: TSmallintField
      FieldName = 'Active'
    end
    object QueryDeleted: TSmallintField
      FieldName = 'Deleted'
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryAssertTime: TDateTimeField
      FieldName = 'AssertTime'
    end
    object QueryName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 50
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      Size = 200
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
    object QueryType: TSmallintField
      FieldName = 'Type'
    end
    object QuerySize: TFloatField
      FieldName = 'Size'
    end
    object QueryMinOrderSum: TFloatField
      DisplayLabel = #1052#1080#1085'. '#1089#1091#1084#1084#1072
      FieldName = 'MinOrderSum'
    end
    object QueryDebtType: TSmallintField
      FieldName = 'DebtType'
    end
    object QuerySubType: TIntegerField
      FieldName = 'SubType'
    end
    object QueryCanAdd: TSmallintField
      DisplayLabel = #1057#1091#1084#1084#1080#1088#1091#1077#1090#1089#1103
      FieldName = 'CanAdd'
    end
    object QueryAllWorkType: TSmallintField
      FieldName = 'AllWorkType'
    end
    object QueryDiscountText: TStringField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      FieldKind = fkCalculated
      FieldName = 'DiscountText'
      Size = 50
      Calculated = True
    end
    object QueryDTInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1089#1082#1080#1076#1082#1080
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
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = DBGrid
    PopupMenus = <
      item
        GridView = TableView
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 332
    Top = 140
  end
end
