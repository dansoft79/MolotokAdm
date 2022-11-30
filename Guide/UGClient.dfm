object GClientForm: TGClientForm
  Left = 331
  Top = 196
  Action = MainForm.agClient
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 501
  ClientWidth = 1216
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
    Top = 480
    Width = 1216
    Height = 21
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
    Width = 1216
    Height = 430
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object TableView: TcxGridDBTableView
      OnDblClick = DBGridDblClick
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
      Styles.OnGetContentStyle = TableViewStylesGetContentStyle
      object TableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object TableViewAssertTime: TcxGridDBColumn
        DataBinding.FieldName = 'AssertTime'
        Visible = False
      end
      object TableViewAssertUser: TcxGridDBColumn
        DataBinding.FieldName = 'AssertUser'
        Visible = False
      end
      object TableViewDeleted: TcxGridDBColumn
        DataBinding.FieldName = 'Deleted'
        Visible = False
      end
      object TableViewIsClientDomSPB: TcxGridDBColumn
        DataBinding.FieldName = 'IsClientDomSPB'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 90
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 150
      end
      object TableViewPhone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
        OnGetDataText = TableViewPhoneGetDataText
      end
      object TableViewAddress: TcxGridDBColumn
        DataBinding.FieldName = 'Address'
        Width = 200
      end
      object TableViewFlatNumber: TcxGridDBColumn
        DataBinding.FieldName = 'FlatNumber'
        Width = 65
      end
      object TableViewDInfo: TcxGridDBColumn
        DataBinding.FieldName = 'DInfo'
        Width = 150
      end
      object TableViewMInfo: TcxGridDBColumn
        DataBinding.FieldName = 'MInfo'
        Width = 150
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 250
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 132
    Top = 116
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
    Left = 264
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
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cbDel'
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
    object dxBarButton4: TdxBarButton
      Action = aUndoDelete
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aEdit
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = aImport
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = aPrint
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
    object cbActive: TdxBarCombo
      Caption = #1040#1082#1090#1080#1074#1085#1099#1077':'
      Category = 0
      Hint = #1040#1082#1090#1080#1074#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      Visible = ivAlways
      OnChange = cbActiveChange
      ShowCaption = True
      Text = #1042#1089#1077
      ShowEditor = False
      Items.Strings = (
        #1053#1077#1090
        #1044#1072
        #1042#1089#1077)
      ItemIndex = 2
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 200
    Top = 116
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
    object aUndoDelete: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      ImageIndex = 419
      OnExecute = aUndoDeleteExecute
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
    object aImport: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' '#1092#1072#1081#1083#1072
      Hint = #1048#1084#1087#1086#1088#1090' '#1080#1079' '#1092#1072#1081#1083#1072
      ImageIndex = 177
      OnExecute = aImportExecute
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      
        'select  *, UserInfo(ID_AssertUser) as AssertUser, DistrictInfo(I' +
        'D_District) as DInfo, MetroInfo(ID_Metro) as MInfo'
      'from Client'
      'where (Deleted = :D or :D = 2) and (Active = :A or :A = 2)'
      'order by Name')
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
      end>
    Left = 56
    Top = 176
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
      end>
    object QueryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QueryName: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
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
    object QueryAssertEmployee: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      Size = 500
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
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
    object QueryFlatNumber: TWideStringField
      DisplayLabel = #1050#1074#1072#1088#1090#1080#1088#1072
      FieldName = 'FlatNumber'
      Size = 50
    end
    object QueryID_District: TSmallintField
      FieldName = 'ID_District'
    end
    object QueryID_Metro: TSmallintField
      FieldName = 'ID_Metro'
    end
    object QueryDInfo: TWideStringField
      DisplayLabel = #1056#1072#1081#1086#1085
      FieldName = 'DInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryMInfo: TWideStringField
      DisplayLabel = #1052#1077#1090#1088#1086
      FieldName = 'MInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryIsClientDomSPB: TSmallintField
      DisplayLabel = #1050#1083#1080#1077#1085#1090' '#1044#1086#1084' '#1057#1055#1041
      FieldName = 'IsClientDomSPB'
    end
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from Client'
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
  object PopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        GridView = TableView
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 340
    Top = 116
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 56
    Top = 116
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
    Left = 340
    Top = 172
    PixelsPerInch = 96
  end
  object qExists: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select ID'
      'from Client'
      'where Phone  = :P and ID <> :IDE'
      'limit 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'P'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
  end
  object TableAll: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from Client')
    Params = <>
    Left = 60
    Top = 385
  end
  object qDistrict: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from District'
      'where Lower(Name) = Lower(:N)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 385
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end>
  end
  object qMetro: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from Metro'
      'where Lower(Name) = Lower(:N)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 385
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end>
  end
end
