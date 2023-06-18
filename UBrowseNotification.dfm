object BrowseNotificationForm: TBrowseNotificationForm
  Left = 305
  Top = 172
  Action = MainForm.aaBrowseNotificetion
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
  ClientHeight = 615
  ClientWidth = 1178
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
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 598
    Width = 1178
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
    Width = 1178
    Height = 548
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    LookAndFeel.ScrollbarMode = sbmDefault
    object TableViewNN: TcxGridDBBandedTableView
      OnDblClick = TableViewDblClick
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
      Preview.Column = TableViewNNText
      Preview.MaxLineCount = 0
      Preview.Visible = True
      Bands = <
        item
          Caption = #1057#1087#1080#1089#1086#1082' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
          Width = 400
        end>
      object TableViewNNPicture: TcxGridDBBandedColumn
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
      object TableViewNNHeader: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Header'
        Options.Focusing = False
        Width = 342
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.LineCount = 2
        Position.RowIndex = 0
      end
      object TableViewNNText: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Text'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.VisibleLineCount = 3
        Width = 200
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.LineCount = 2
        Position.RowIndex = 1
      end
      object TableViewNNColor: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Color'
        Visible = False
        VisibleForCustomization = False
        Width = 1043
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
    end
    object TableView: TcxGridDBTableView
      OnDblClick = TableViewDblClick
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
      object TableViewPicture: TcxGridDBColumn
        DataBinding.FieldName = 'Picture'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TdxSmartImage'
        Options.Focusing = False
        Options.AutoWidthSizable = False
      end
      object TableViewHeader: TcxGridDBColumn
        DataBinding.FieldName = 'Header'
        PropertiesClassName = 'TcxTextEditProperties'
        Options.Focusing = False
        Options.FilterRowOperator = foContains
        Options.AutoWidthSizable = False
        Styles.Content = StyleBold
        Width = 200
      end
      object TableViewText: TcxGridDBColumn
        DataBinding.FieldName = 'Text'
        Options.FilterRowOperator = foContains
        Options.AutoWidthSizable = False
        Width = 400
      end
      object TableViewColor: TcxGridDBColumn
        DataBinding.FieldName = 'Color'
        Visible = False
        VisibleForCustomization = False
      end
      object TableViewShowTime: TcxGridDBColumn
        DataBinding.FieldName = 'ShowTime'
        Width = 102
      end
      object TableViewAppendTime: TcxGridDBColumn
        Caption = #1042#1088#1077#1084#1103' '#1089#1086#1079#1076#1072#1085#1080#1103
        DataBinding.FieldName = 'AppendTime'
      end
      object TableViewOrderCloseTime: TcxGridDBColumn
        DataBinding.FieldName = 'OrderCloseTime'
        Visible = False
        VisibleForCustomization = False
        Width = 126
      end
      object TableViewOpenTime: TcxGridDBColumn
        Caption = #1042#1088#1077#1084#1103' '#1086#1090#1082#1088#1099#1090#1080#1103
        DataBinding.FieldName = 'OpenTime'
        Width = 112
      end
      object TableViewUOpen: TcxGridDBColumn
        DataBinding.FieldName = 'UOpen'
        Width = 150
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 204
    Top = 136
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 328
    Top = 136
    object aBrowse: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      ImageIndex = 427
      OnExecute = aBrowseExecute
    end
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
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
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
    end
    object dxBarButton2: TdxBarButton
      Action = aUpdate
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton1: TdxBarButton
      Action = aBrowse
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Action = aCancel
      Align = iaRight
      Category = 0
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
      
        'select NT.Picture, PictureType, UserInfo(ID_UserOpen) as UOpen, ' +
        'N.*'
      'from '
      '  Notification N'
      '  inner join NotificationUser NU on '
      '    N.ID = NU.ID_Notification and'
      '    ((NU.ID_User = :IDU) or (:IDU = 1)) and'
      
        '    ((Date_Format(N.AppendTime, '#39'%Y.%m.%d'#39') >= :FD) or (:FD = '#39#39 +
        ')) and'
      
        '    ((Date_Format(N.AppendTime, '#39'%Y.%m.%d'#39') <= :TD) or (:TD = '#39#39 +
        '))'
      '  inner join NoticeTemplate NT on '
      '    N.ID_NoticeTemplate = NT.ID'
      'order by N.AppendTime desc')
    Params = <
      item
        DataType = ftWideString
        Name = 'IDU'
        ParamType = ptUnknown
        Value = '1'
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
        Name = 'IDU'
        ParamType = ptUnknown
        Value = '1'
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
    object QueryPicture: TBlobField
      DisplayLabel = #1050#1072#1088#1090#1080#1085#1082#1072
      FieldName = 'Picture'
    end
    object QueryPictureType: TWideStringField
      FieldName = 'PictureType'
      Size = 80
    end
    object QueryID: TLargeintField
      FieldName = 'ID'
      Required = True
    end
    object QueryID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object QueryID_NoticeTemplate: TSmallintField
      FieldName = 'ID_NoticeTemplate'
    end
    object QueryAppendTime: TDateTimeField
      DisplayLabel = #1057#1086#1079#1076#1072#1085#1080#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
      FieldName = 'AppendTime'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
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
    object QueryColor: TIntegerField
      DisplayLabel = #1062#1074#1077#1090
      FieldName = 'Color'
    end
    object QueryShowTime: TIntegerField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      FieldName = 'ShowTime'
    end
    object QueryOrderCloseTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1079#1072#1082#1072#1079#1072
      FieldName = 'OrderCloseTime'
    end
    object QueryOpenTime: TDateTimeField
      DisplayLabel = #1054#1090#1082#1088#1099#1090#1080#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
      FieldName = 'OpenTime'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object QueryID_UserOpen: TSmallintField
      FieldName = 'ID_UserOpen'
    end
    object QueryUOpen: TWideStringField
      DisplayLabel = #1054#1090#1082#1088#1099#1083
      FieldName = 'UOpen'
      ReadOnly = True
      Size = 200
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
  end
end
