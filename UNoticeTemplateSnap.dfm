object NoticeTemplateSnapForm: TNoticeTemplateSnapForm
  Left = 495
  Top = 267
  Action = MainForm.anTemplateSnap
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
  ClientHeight = 552
  ClientWidth = 897
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
    Top = 535
    Width = 897
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object gbEmployee: TcxGroupBox
    Left = 0
    Top = 50
    Align = alClient
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080':'
    TabOrder = 0
    Height = 226
    Width = 897
    object Grid: TcxGrid
      Left = 2
      Top = 18
      Width = 893
      Height = 206
      Align = alClient
      TabOrder = 0
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
        OnFocusedRecordChanged = TableViewFocusedRecordChanged
        DataController.DataSource = dsUser
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
        object TableViewESurname: TcxGridDBColumn
          DataBinding.FieldName = 'Surname'
        end
        object TableViewEName: TcxGridDBColumn
          DataBinding.FieldName = 'Name'
        end
        object TableViewEPatro: TcxGridDBColumn
          DataBinding.FieldName = 'Patro'
        end
        object TableViewDName: TcxGridDBColumn
          DataBinding.FieldName = 'URName'
          Width = 150
        end
        object TableViewName: TcxGridDBColumn
          DataBinding.FieldName = 'Login'
          Width = 150
        end
        object TableViewIDE: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object Level: TcxGridLevel
        GridView = TableView
      end
    end
  end
  object gbReport: TcxGroupBox
    Left = 0
    Top = 284
    Align = alBottom
    Caption = #1054#1090#1095#1077#1090#1099':'
    Constraints.MinHeight = 1
    TabOrder = 2
    Height = 251
    Width = 897
    object GridReport: TcxGrid
      Left = 2
      Top = 18
      Width = 893
      Height = 231
      Align = alClient
      TabOrder = 0
      object TableViewReport: TcxGridDBTableView
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
        object TableViewReportHeader: TcxGridDBColumn
          DataBinding.FieldName = 'Header'
          Width = 250
        end
        object TableViewReportText: TcxGridDBColumn
          DataBinding.FieldName = 'Text'
          Width = 500
        end
        object TableViewReportColor: TcxGridDBColumn
          DataBinding.FieldName = 'Color'
          PropertiesClassName = 'TdxColorEditProperties'
          Width = 111
        end
      end
      object LevelReport: TcxGridLevel
        GridView = TableViewReport
      end
    end
  end
  object Splitter: TcxSplitter
    Left = 0
    Top = 276
    Width = 897
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
    MinSize = 100
    ResizeUpdate = True
    Control = gbReport
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 120
    Top = 360
  end
  object dsUser: TDataSource
    DataSet = qUser
    Left = 84
    Top = 132
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        HitTypes = [gvhtNone, gvhtCell]
        Index = 0
      end>
    Left = 316
    Top = 92
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 472
    Top = 228
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
    Left = 508
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
  end
  object qUser: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      
        'select UR.Name as URName, U.Surname, U.Name, U.Patro, U.Login, U' +
        '.ID'
      'from User U, UserRole UR'
      'where U.ID_UserRole = UR.ID'
      'order by U.Surname, U.Name, U.Patro')
    Params = <>
    Left = 208
    Top = 132
    object qUserName: TWideStringField
      DisplayLabel = #1055#1089#1077#1074#1076#1086#1085#1080#1084
      DisplayWidth = 100
      FieldName = 'Login'
      Size = 100
    end
    object qUserESurname: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 50
      FieldName = 'Surname'
    end
    object qUserEName: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'Name'
    end
    object qUserEPatro: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Patro'
    end
    object qUserDName: TWideStringField
      DisplayLabel = #1056#1086#1083#1100
      DisplayWidth = 100
      FieldName = 'URName'
      Size = 100
    end
    object qUserID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      
        'select NT.Header, NT.Text, NT.Color, NS.ID, NS.ID_User, NS.ID_No' +
        'ticeTemplate'
      'from NoticeTemplate NT, NoticeSnap NS'
      'where '
      '  NS.ID_User = :ID and'
      '  NT.ID = NS.ID_NoticeTemplate and'
      '  NT.Deleted = 0'
      'order by NT.Header')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = dsUser
    Left = 248
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QueryID: TIntegerField
      FieldName = 'ID'
    end
    object QueryID_User: TSmallintField
      FieldName = 'ID_User'
      Required = True
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
    object QueryID_NoticeTemplate: TSmallintField
      FieldName = 'ID_NoticeTemplate'
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from NoticeSnap')
    Params = <>
    Left = 244
    Top = 420
    object TableID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TableID_User: TSmallintField
      FieldName = 'ID_User'
    end
    object TableID_NoticeTemplate: TSmallintField
      FieldName = 'ID_NoticeTemplate'
    end
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 352
    Top = 192
  end
end
