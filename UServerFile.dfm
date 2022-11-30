object ServerFileForm: TServerFileForm
  Left = 331
  Top = 196
  HelpContext = 787200
  Caption = #1060#1072#1081#1083#1099
  ClientHeight = 277
  ClientWidth = 640
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxGrid
    Left = 0
    Top = 50
    Width = 640
    Height = 210
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
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
      Navigator.Visible = True
      OnCellDblClick = TableViewCellDblClick
      OnFocusedRecordChanged = TableViewFocusedRecChanged
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
      OptionsSelection.MultiSelect = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewFileName: TcxGridDBColumn
        DataBinding.FieldName = 'FileName'
        Width = 250
      end
      object TableViewServerPath: TcxGridDBColumn
        DataBinding.FieldName = 'ServerPath'
        Width = 200
      end
      object TableViewServerFileName: TcxGridDBColumn
        DataBinding.FieldName = 'ServerFileName'
        Width = 200
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 200
      end
      object TableViewAppendDate: TcxGridDBColumn
        DataBinding.FieldName = 'AppendDate'
      end
      object TableViewEAppend: TcxGridDBColumn
        DataBinding.FieldName = 'EAppend'
        Width = 150
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 260
    Width = 640
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
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
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
          ItemName = 'dxBarButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarButton11'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton8'
        end>
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
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
    object dxBarButton3: TdxBarButton
      Action = aEdit
      Category = 0
    end
    object dxBarButton10: TdxBarButton
      Action = aSelectAll
      Category = 0
    end
    object dxBarButton11: TdxBarButton
      Action = aUnselectAll
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aScan
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aView
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = aSave
      Category = 0
    end
    object dxBarButton9: TdxBarButton
      Action = aSendMail
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = aPrint
      Category = 0
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageListBig
    Left = 172
    Top = 84
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
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aView: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      ImageIndex = 373
      OnExecute = aViewExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1087#1086#1076' '#1076#1088#1091#1075#1080#1084' '#1080#1084#1077#1085#1077#1084
      ImageIndex = 114
      OnExecute = aSaveExecute
    end
    object aScan: TAction
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100
      Hint = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 374
      OnExecute = aScanExecute
    end
    object aSendMail: TAction
      Caption = #1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1086' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1087#1086#1095#1090#1077
      Hint = #1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1086' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1087#1086#1095#1090#1077
      ImageIndex = 396
      OnExecute = aSendMailExecute
    end
    object aSelectAll: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      ImageIndex = 120
      OnExecute = aSelectAllExecute
    end
    object aUnselectAll: TAction
      Caption = #1057#1085#1103#1090#1100' '#1074#1099#1073#1086#1088
      Hint = #1057#1085#1103#1090#1100' '#1074#1099#1073#1086#1088
      ImageIndex = 121
      OnExecute = aUnselectAllExecute
    end
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = aAdd
        Properties.Strings = (
          'AutoCheck'
          'Caption'
          'Category'
          'Checked'
          'Enabled'
          'GroupIndex'
          'HelpContext'
          'HelpKeyword'
          'HelpType'
          'Hint'
          'ImageIndex'
          'Name'
          'SecondaryShortCuts'
          'ShortCut'
          'Tag'
          'Visible')
      end>
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
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select *, EmployeeInfo(ID_EmployeeAppend) as EAppend'
      'from ServerFile'
      'where ID_Base = :IDB and BaseTableName = :BTN'
      'order by FileName')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BTN'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BTN'
        ParamType = ptUnknown
      end>
    object QueryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QueryFileName: TWideStringField
      DisplayLabel = #1054#1088#1080#1075#1080#1085#1072#1083#1100#1085#1086#1077' '#1080#1084#1103' '#1092#1072#1081#1083#1072
      FieldName = 'FileName'
      Size = 512
    end
    object QueryServerPath: TWideStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1093#1088#1072#1085#1077#1085#1080#1103
      FieldName = 'ServerPath'
      Size = 200
    end
    object QueryServerFileName: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1092#1072#1081#1083#1072' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1077
      FieldName = 'ServerFileName'
      Size = 50
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
      FieldName = 'Comment'
      ReadOnly = True
      Size = 200
    end
    object QueryAppendDate: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'AppendDate'
    end
    object QueryID_EmployeeAppend: TSmallintField
      FieldName = 'ID_EmployeeAppend'
    end
    object QueryEAppend: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'EAppend'
      ReadOnly = True
      Size = 50
    end
    object QueryID_Base: TIntegerField
      FieldName = 'ID_Base'
    end
    object QueryBaseTableName: TWideStringField
      FieldName = 'BaseTableName'
      Required = True
      Size = 50
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from ServerFile'
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
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1092#1072#1081#1083#1072
    Left = 424
    Top = 160
  end
  object DragDrop: TJvDragDrop
    DropTarget = Owner
    OnDrop = DragDropDrop
    Left = 424
    Top = 104
  end
end
