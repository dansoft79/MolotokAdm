object SelectEmployeeForm: TSelectEmployeeForm
  Left = 388
  Top = 259
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 339
  ClientWidth = 696
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
    Width = 696
    Height = 272
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
      object TableViewEPost: TcxGridDBColumn
        DataBinding.FieldName = 'Surname'
      end
      object TableViewEName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
      end
      object TableViewEPatro: TcxGridDBColumn
        DataBinding.FieldName = 'Patro'
      end
      object TableViewESurname: TcxGridDBColumn
        DataBinding.FieldName = 'URInfo'
        Width = 150
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Login'
        Width = 140
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
    Top = 322
    Width = 696
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
    Left = 260
    Top = 80
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 88
    Top = 80
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
    Left = 148
    Top = 80
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
    SQL.Strings = (
      'select *, UserRoleInfo(ID_UserROle) as URInfo'
      'from UserView'
      'order by Surname, Name, Patro')
    Params = <>
    Left = 204
    Top = 80
    object QueryPassword: TWideStringField
      DisplayWidth = 100
      FieldName = 'Password'
      Size = 100
    end
    object QueryESurname: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'Surname'
      Size = 50
    end
    object QueryEName: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 50
    end
    object QueryEPatro: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Patro'
      Size = 50
    end
    object QueryID: TSmallintField
      FieldName = 'ID'
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
    object QueryLogin: TWideStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      FieldName = 'Login'
    end
    object QueryID_UserRole: TSmallintField
      FieldName = 'ID_UserRole'
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      Size = 200
    end
    object QueryPermTool: TWideMemoField
      FieldName = 'PermTool'
      BlobType = ftWideMemo
    end
    object QueryPermData: TWideMemoField
      FieldName = 'PermData'
      BlobType = ftWideMemo
    end
    object QueryURInfo: TWideStringField
      DisplayLabel = #1056#1086#1083#1100
      FieldName = 'URInfo'
      ReadOnly = True
      Size = 50
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
