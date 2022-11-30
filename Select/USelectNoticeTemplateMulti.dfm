object SelectNoticeMultiForm: TSelectNoticeMultiForm
  Left = 440
  Top = 270
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1096#1072#1073#1083#1086#1085#1086#1074' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
  ClientHeight = 569
  ClientWidth = 990
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
    Top = 552
    Width = 990
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object DBGrid: TcxGrid
    Left = 0
    Top = 50
    Width = 990
    Height = 502
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
      DataController.DataSource = DataSource
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = '<'#1092#1080#1083#1100#1090#1088'>'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
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
      OptionsSelection.CheckBoxPosition = cbpIndicator
      OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvColumnHeader]
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelectMode = msmPersistent
      OptionsSelection.ShowCheckBoxesDynamically = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewHeader: TcxGridDBColumn
        DataBinding.FieldName = 'Header'
        Options.FilterRowOperator = foContains
        Width = 200
      end
      object TableViewText: TcxGridDBColumn
        DataBinding.FieldName = 'Text'
        Options.FilterRowOperator = foContains
        Width = 500
      end
      object TableViewColor: TcxGridDBColumn
        DataBinding.FieldName = 'Color'
        Width = 120
      end
      object TableViewShowTime: TcxGridDBColumn
        DataBinding.FieldName = 'ShowTime'
        Width = 120
      end
      object TableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 240
    Top = 140
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
    Left = 364
    Top = 228
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
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 304
    Top = 228
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
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = QueryAfterScroll
    Filtered = True
    SQL.Strings = (
      'select *'
      'from NoticeTemplate'
      'where Deleted = 0 and Active = 1'
      'order by Header')
    Params = <>
    Left = 144
    Top = 140
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
    object QueryComment: TWideStringField
      FieldName = 'Comment'
      Size = 800
    end
    object QueryPicture: TBlobField
      FieldName = 'Picture'
    end
    object QueryPictureType: TWideStringField
      FieldName = 'PictureType'
      Size = 80
    end
    object QueryShowTime: TIntegerField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      FieldName = 'ShowTime'
    end
    object QueryTimeFieldName: TWideStringField
      FieldName = 'TimeFieldName'
      Size = 200
    end
    object QueryTimeConfition: TSmallintField
      FieldName = 'TimeCondition'
    end
    object QueryTimeValue: TIntegerField
      FieldName = 'TimeValue'
    end
    object QueryTimeFieldCaption: TWideStringField
      FieldName = 'TimeFieldCaption'
      Size = 400
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
