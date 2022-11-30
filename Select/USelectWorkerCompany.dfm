object SelectWorkerCompanyForm: TSelectWorkerCompanyForm
  Left = 388
  Top = 259
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1088#1072#1073#1086#1090
  ClientHeight = 418
  ClientWidth = 824
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
    Top = 401
    Width = 824
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
    Width = 824
    Height = 351
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
      object TableViewOrgType: TcxGridDBColumn
        DataBinding.FieldName = 'OrgType'
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 200
      end
      object TableViewINN: TcxGridDBColumn
        DataBinding.FieldName = 'INN'
      end
      object TableViewKPP: TcxGridDBColumn
        DataBinding.FieldName = 'KPP'
      end
      object TableViewOGRN: TcxGridDBColumn
        DataBinding.FieldName = 'OGRN'
      end
      object TableViewAddressJur: TcxGridDBColumn
        DataBinding.FieldName = 'AddressJur'
        Width = 200
      end
      object TableViewAddressFact: TcxGridDBColumn
        DataBinding.FieldName = 'AddressFact'
        Width = 200
      end
      object TableViewBank: TcxGridDBColumn
        DataBinding.FieldName = 'Bank'
        Width = 200
      end
      object TableViewBIK: TcxGridDBColumn
        DataBinding.FieldName = 'BIK'
      end
      object TableViewKS: TcxGridDBColumn
        DataBinding.FieldName = 'KS'
      end
      object TableViewRS: TcxGridDBColumn
        DataBinding.FieldName = 'RS'
      end
      object TableViewComissionSize: TcxGridDBColumn
        DataBinding.FieldName = 'ComissionSize'
        Width = 96
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 300
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
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
      'select *, UserInfo(ID_AssertUser) as AssertUser'
      'from workercompanyview'
      'order by Name, INN, KPP')
    Params = <>
    Left = 204
    Top = 80
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
    object QueryOrgType: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
      FieldName = 'OrgType'
    end
    object QueryINN: TWideStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
    end
    object QueryKPP: TWideStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
    end
    object QueryOGRN: TWideStringField
      DisplayLabel = #1054#1043#1056#1053
      FieldName = 'OGRN'
    end
    object QueryAddressJur: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1102#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081
      FieldName = 'AddressJur'
      Size = 150
    end
    object QueryAddressFact: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081
      FieldName = 'AddressFact'
      Size = 150
    end
    object QueryBank: TWideStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldName = 'Bank'
      Size = 200
    end
    object QueryBIK: TWideStringField
      DisplayLabel = #1041#1048#1050
      FieldName = 'BIK'
    end
    object QueryKS: TWideStringField
      DisplayLabel = #1050#1086#1088'. '#1089#1095#1077#1090
      FieldName = 'KS'
      Size = 30
    end
    object QueryRS: TWideStringField
      DisplayLabel = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      FieldName = 'RS'
      Size = 30
    end
    object QueryComissionSize: TFloatField
      DisplayLabel = #1056#1072#1079#1084#1077#1088' '#1082#1086#1084#1080#1089#1089#1080#1080
      FieldName = 'ComissionSize'
    end
    object QueryAssertUser: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
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
    Left = 332
    Top = 140
  end
end
