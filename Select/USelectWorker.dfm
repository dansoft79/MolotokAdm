object SelectWorkerForm: TSelectWorkerForm
  Left = 388
  Top = 259
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1084#1072#1089#1090#1077#1088#1072
  ClientHeight = 483
  ClientWidth = 1232
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
    Width = 1232
    Height = 416
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
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
      OptionsSelection.MultiSelect = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewCatList: TcxGridDBColumn
        DataBinding.FieldName = 'CatList'
        Styles.Content = StyleBold
        Width = 100
      end
      object TableViewWCInfo: TcxGridDBColumn
        DataBinding.FieldName = 'WCInfo'
        Width = 150
      end
      object TableViewSurname: TcxGridDBColumn
        DataBinding.FieldName = 'Surname'
        Width = 150
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 150
      end
      object TableViewPatro: TcxGridDBColumn
        DataBinding.FieldName = 'Patro'
        Width = 150
      end
      object TableViewTagList: TcxGridDBColumn
        DataBinding.FieldName = 'TagList'
        Width = 100
      end
      object TableViewPhone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
        Width = 150
      end
      object TableViewEmail: TcxGridDBColumn
        DataBinding.FieldName = 'Email'
        Width = 150
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
    Top = 466
    Width = 1232
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
    Left = 252
    Top = 108
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 56
    Top = 108
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
    Left = 120
    Top = 108
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
          ItemName = 'cbDistrict'
        end
        item
          Visible = True
          ItemName = 'cbCategory'
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
    object cbDistrict: TdxBarCombo
      Caption = #1056#1072#1081#1086#1085':'
      Category = 0
      Hint = #1056#1072#1081#1086#1085
      Visible = ivAlways
      OnChange = cbDistrictChange
      ShowCaption = True
      Width = 180
      ShowEditor = False
      Sorted = True
      ItemIndex = -1
    end
    object cbCategory: TdxBarCombo
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      Category = 0
      Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      Visible = ivAlways
      OnChange = cbCategoryChange
      ShowCaption = True
      Width = 180
      ShowEditor = False
      Sorted = True
      ItemIndex = -1
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
    Left = 324
    Top = 108
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select '
      
        '  *, UserInfo(ID_AssertUser) as AssertUser, WorkerCompanyInfo(ID' +
        '_WorkerCompany) as WCInfo, UserRoleInfo(ID_UserRole) as URInfo, '
      
        '  WorkerCategoryList(ID) as CatList, WorkerTagList(ID) as TagLis' +
        't'
      'from Worker'
      'where '
      '  (Deleted = :D or :D = 2) and (Active = :A or :A = 2) and'
      
        '  (:IDC1 in (select ID_WorkerClass from WorkerCategory where ID_' +
        'Worker = Worker.ID) or :IDC2 = 0) and'
      
        '  (:IDD1 in (select ID_District from WorkerDistrict where ID_Wor' +
        'ker = Worker.ID) or :IDD2 = 0)'
      'order by '
      '  WCInfo, Surname, Name, Patro')
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
      end
      item
        DataType = ftWideString
        Name = 'IDC1'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftWideString
        Name = 'IDC2'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftWideString
        Name = 'IDD1'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftWideString
        Name = 'IDD2'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 184
    Top = 108
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
      end
      item
        DataType = ftWideString
        Name = 'IDC1'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftWideString
        Name = 'IDC2'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftWideString
        Name = 'IDD1'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftWideString
        Name = 'IDD2'
        ParamType = ptUnknown
        Value = '0'
      end>
    object QueryAssertUser: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object QueryID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object QueryActive: TSmallintField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1072
      FieldName = 'Active'
    end
    object QueryDeleted: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object QuerySurname: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'Surname'
      Size = 50
    end
    object QueryName: TWideStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'Name'
      Size = 50
    end
    object QueryPatro: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'Patro'
      Size = 50
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      Size = 200
    end
    object QueryPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1086#1092#1085
      FieldName = 'Phone'
    end
    object QueryWCInfo: TWideStringField
      DisplayLabel = #1055#1086#1076#1088#1103#1076#1095#1080#1082
      FieldName = 'WCInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryID_WorkerCompany: TSmallintField
      FieldName = 'ID_WorkerCompany'
    end
    object QueryID_UserRole: TSmallintField
      FieldName = 'ID_UserRole'
    end
    object QueryEmail: TWideStringField
      FieldName = 'Email'
      Size = 100
    end
    object QueryPassword: TWideStringField
      FieldName = 'Password'
      Size = 100
    end
    object QueryURInfo: TWideStringField
      DisplayLabel = #1056#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      FieldName = 'URInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryCatList: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      FieldName = 'CatList'
      ReadOnly = True
      Size = 200
    end
    object QueryTagList: TWideStringField
      DisplayLabel = #1058#1101#1075#1080
      FieldName = 'TagList'
      ReadOnly = True
      Size = 200
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 268
    Top = 224
    PixelsPerInch = 96
    object StyleBold: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
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
    Left = 56
    Top = 172
  end
end
