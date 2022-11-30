object PartnerInteractionForm: TPartnerInteractionForm
  Left = 331
  Top = 196
  HelpContext = 723600
  Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
  ClientHeight = 448
  ClientWidth = 722
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
  DefaultMonitor = dmMainForm
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxGrid
    Left = 0
    Top = 50
    Width = 722
    Height = 318
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
      object TableViewActionDate: TcxGridDBColumn
        DataBinding.FieldName = 'ActionDate'
        PropertiesClassName = 'TcxDateEditProperties'
      end
      object TableViewActionTime: TcxGridDBColumn
        DataBinding.FieldName = 'ActionTime'
        PropertiesClassName = 'TcxTimeEditProperties'
      end
      object TableViewShortName: TcxGridDBColumn
        DataBinding.FieldName = 'ShortName'
        Width = 181
      end
      object TableViewCCName: TcxGridDBColumn
        DataBinding.FieldName = 'CCName'
        Width = 259
      end
      object TableViewEInfo: TcxGridDBColumn
        DataBinding.FieldName = 'EInfo'
        Width = 186
      end
      object TableViewActionType: TcxGridDBColumn
        DataBinding.FieldName = 'ActionType'
        Width = 126
      end
      object TableViewSubject: TcxGridDBColumn
        DataBinding.FieldName = 'Subject'
        Width = 152
      end
      object TableViewResult: TcxGridDBColumn
        DataBinding.FieldName = 'Result'
        Width = 300
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 431
    Width = 722
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object DBMemo: TcxDBMemo
    Left = 0
    Top = 368
    Align = alBottom
    DataBinding.DataField = 'Comment'
    DataBinding.DataSource = DataSource
    Properties.ReadOnly = True
    Properties.ScrollBars = ssVertical
    TabOrder = 6
    Height = 63
    Width = 722
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
    ImageOptions.Images = UtilForm.ImageList2
    ImageOptions.LargeImages = UtilForm.ImageListBig2
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 240
    Top = 84
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
          ItemName = 'dxBarButton8'
        end>
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton4: TdxBarButton
      Action = aOK
      Category = 0
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
    object aOK: TAction
      Caption = 'OK'
      Hint = 'OK'
      ImageIndex = 98
      ShortCut = 16397
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
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
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select '
      '  C.ShortName, '
      '  Concat(CC.Surname,'#39' '#39', CC.Name, '#39' '#39', CC.Patro) as CCName, '
      '  EmployeeInfo(CI.ID_Employee) as EInfo,'
      '  CI.*'
      'from'
      '  PartnerInteraction CI'
      '  inner join Partner C on'
      '    CI.ID_Partner = C.ID and'
      
        '    (:IDE in (select ID from Employee where Admin = 1) or CI.ID_' +
        'Employee = :IDE)'
      '  left outer join PartnerContact CC on'
      '    CI.ID_PartnerContact = CC.ID'
      'order by'
      '  CI.ActionDate desc, CI.ActionTime desc, C.ShortName, CCName')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
    object QueryShortName: TWideStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      DisplayWidth = 50
      FieldName = 'ShortName'
      Size = 50
    end
    object QueryCCName: TWideStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
      DisplayWidth = 152
      FieldName = 'CCName'
      ReadOnly = True
      Size = 152
    end
    object QueryEInfo: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      DisplayWidth = 50
      FieldName = 'EInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryActionType: TWideStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 100
      FieldName = 'ActionType'
      Size = 100
    end
    object QueryActionDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 18
      FieldName = 'ActionDate'
    end
    object QuerySubject: TWideStringField
      DisplayLabel = #1055#1088#1077#1076#1084#1077#1090
      DisplayWidth = 100
      FieldName = 'Subject'
      Size = 100
    end
    object QueryResult: TWideStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 100
      FieldName = 'Result'
      Size = 100
    end
    object QueryComment: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Comment'
      BlobType = ftWideMemo
    end
    object QueryID: TIntegerField
      FieldName = 'ID'
    end
    object QueryID_Partner: TIntegerField
      FieldName = 'ID_Partner'
      Required = True
    end
    object QueryID_PartnerContact: TIntegerField
      FieldName = 'ID_PartnerContact'
    end
    object QueryID_Employee: TSmallintField
      FieldName = 'ID_Employee'
      Required = True
    end
    object QueryActionTime: TTimeField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 'ActionTime'
      Required = True
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from partnerinteraction')
    Params = <>
    Left = 56
    Top = 228
  end
end
