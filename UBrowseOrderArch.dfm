object BrowseOrderArchForm: TBrowseOrderArchForm
  Left = 305
  Top = 172
  Action = MainForm.aaBrowseOrderArch
  Caption = #1040#1088#1093#1080#1074' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 615
  ClientWidth = 1193
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
    Width = 1193
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
    Width = 1193
    Height = 342
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LookAndFeel.ScrollbarMode = sbmDefault
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
      OnFocusedRecordChanged = TableViewFocusedRecordChanged
      DataController.DataSource = DataSource
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      FilterRow.OperatorCustomization = True
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
      object TableViewDeleted: TcxGridDBColumn
        DataBinding.FieldName = 'Deleted'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
      end
      object TableViewClosed: TcxGridDBColumn
        DataBinding.FieldName = 'Closed'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
      end
      object TableViewID: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088
        DataBinding.FieldName = 'ID'
      end
      object TableViewStatusInfo: TcxGridDBColumn
        DataBinding.FieldName = 'StatusInfo'
        Options.FilterRowOperator = foContains
        Width = 120
      end
      object TableViewAddTime: TcxGridDBColumn
        DataBinding.FieldName = 'AddTime'
      end
      object TableViewAddUser: TcxGridDBColumn
        DataBinding.FieldName = 'AddUser'
        Options.FilterRowOperator = foContains
        Width = 100
      end
      object TableViewAssertTime: TcxGridDBColumn
        DataBinding.FieldName = 'AssertTime'
        Visible = False
      end
      object TableViewAssertUser: TcxGridDBColumn
        DataBinding.FieldName = 'AssertUser'
        Visible = False
        Width = 100
      end
      object TableViewOrderNUmber: TcxGridDBColumn
        DataBinding.FieldName = 'OrderNUmber'
        Visible = False
      end
      object TableViewOrderDate: TcxGridDBColumn
        DataBinding.FieldName = 'OrderDate'
        Visible = False
      end
      object TableViewOCInfo: TcxGridDBColumn
        DataBinding.FieldName = 'OCInfo'
        Visible = False
      end
      object TableViewPhone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
        Visible = False
      end
      object TableViewRequestText: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1082' '#1079#1072#1082#1072#1079#1091
        DataBinding.FieldName = 'RequestText'
        Options.FilterRowOperator = foContains
        Width = 200
      end
      object TableViewName: TcxGridDBColumn
        Caption = #1048#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
        DataBinding.FieldName = 'Name'
        Options.FilterRowOperator = foContains
        Width = 150
      end
      object TableViewIsClientDOMSPB: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090' '#1044#1054#1052' '#1057#1055#1073
        DataBinding.FieldName = 'IsClientDOMSPB'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Width = 103
      end
      object TableViewAddress: TcxGridDBColumn
        DataBinding.FieldName = 'Address'
        Options.FilterRowOperator = foContains
        Width = 200
      end
      object TableViewWInfo: TcxGridDBColumn
        Caption = #1052#1072#1089#1090#1077#1088
        DataBinding.FieldName = 'WInfo'
        Width = 150
      end
      object TableViewWorkDate: TcxGridDBColumn
        Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
        DataBinding.FieldName = 'WorkDate'
      end
      object TableViewWorkTime: TcxGridDBColumn
        Caption = #1055#1083#1072#1085#1086#1074#1086#1077' '#1074#1088#1077#1084#1103
        DataBinding.FieldName = 'WorkTime'
      end
      object TableViewFlatNumber: TcxGridDBColumn
        DataBinding.FieldName = 'FlatNumber'
        Visible = False
        Width = 93
      end
      object TableViewClientComment: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1082' '#1072#1076#1088#1077#1089#1091
        DataBinding.FieldName = 'ClientComment'
        Visible = False
        Width = 200
      end
      object TableViewFiles: TcxGridDBColumn
        DataBinding.FieldName = 'Files'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Visible = False
        Width = 75
      end
      object TableViewClientDateTime: TcxGridDBColumn
        DataBinding.FieldName = 'ClientDateTime'
        Visible = False
      end
      object TableViewPlanTime: TcxGridDBColumn
        Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'PlanTime'
        Visible = False
        Width = 88
      end
      object TableViewSignalInfo: TcxGridDBColumn
        DataBinding.FieldName = 'SignalInfo'
        Width = 120
      end
      object TableViewReasonInfo: TcxGridDBColumn
        DataBinding.FieldName = 'ReasonInfo'
        Visible = False
        Width = 120
      end
      object TableViewStatusComment: TcxGridDBColumn
        DataBinding.FieldName = 'StatusComment'
        Visible = False
        Width = 200
      end
      object TableViewSourceInfo: TcxGridDBColumn
        DataBinding.FieldName = 'SourceInfo'
        Visible = False
        Width = 150
      end
      object TableViewPFInfo: TcxGridDBColumn
        DataBinding.FieldName = 'PFInfo'
        Visible = False
        Width = 120
      end
      object TableViewPayed: TcxGridDBColumn
        DataBinding.FieldName = 'Payed'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
        Visible = False
      end
      object TableViewCancelled: TcxGridDBColumn
        DataBinding.FieldName = 'Cancelled'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
      end
      object TableViewHideTime: TcxGridDBColumn
        DataBinding.FieldName = 'HideTime'
        Visible = False
      end
      object TableViewCloseTime: TcxGridDBColumn
        DataBinding.FieldName = 'CloseTime'
        Visible = False
      end
      object TableViewWorkCost: TcxGridDBColumn
        DataBinding.FieldName = 'WorkCost'
        OnGetDisplayText = TableViewWorkCostGetDisplayText
      end
      object TableViewMaterialCost: TcxGridDBColumn
        DataBinding.FieldName = 'MaterialCost'
      end
      object TableViewFullCost: TcxGridDBColumn
        Caption = #1042#1089#1077#1075#1086
        DataBinding.FieldName = 'FullCost'
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object SplitterWorks: TcxSplitter
    Left = 0
    Top = 392
    Width = 1193
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
  end
  object pBottom: TPanel
    Left = 0
    Top = 400
    Width = 1193
    Height = 198
    Align = alBottom
    BevelOuter = bvNone
    Constraints.MinHeight = 1
    TabOrder = 7
    OnResize = pBottomResize
    object gbWorks: TcxGroupBox
      Left = 0
      Top = 0
      Align = alClient
      Caption = #1056#1072#1073#1086#1090#1099' '#1087#1086' '#1079#1072#1082#1072#1079#1091':'
      Constraints.MinHeight = 1
      TabOrder = 0
      Height = 198
      Width = 513
      object GridWork: TcxGrid
        Left = 2
        Top = 18
        Width = 509
        Height = 178
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.ScrollbarMode = sbmDefault
        object ViewWork: TcxGridDBTableView
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
          OnFocusedRecordChanged = ViewWorkFocusedRecordChanged
          DataController.DataSource = dsOrderWork
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.##'
              Kind = skSum
              Column = ViewWorkWorkCost
            end>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          FilterRow.OperatorCustomization = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object ViewWorkWorkCode: TcxGridDBColumn
            DataBinding.FieldName = 'WorkCode'
            Options.FilterRowOperator = foContains
            Width = 100
          end
          object ViewWorkWCTag: TcxGridDBColumn
            DataBinding.FieldName = 'WCTag'
            Options.FilterRowOperator = foContains
            Width = 100
          end
          object ViewWorkWorkName: TcxGridDBColumn
            DataBinding.FieldName = 'WorkName'
            Options.FilterRowOperator = foContains
            Width = 500
          end
          object ViewWorkWorkAmount: TcxGridDBColumn
            DataBinding.FieldName = 'WorkAmount'
            Width = 100
          end
          object ViewWorkWorkPrice: TcxGridDBColumn
            DataBinding.FieldName = 'WorkPrice'
            Width = 100
          end
          object ViewWorkWorkCost: TcxGridDBColumn
            DataBinding.FieldName = 'WorkCost'
            Width = 100
          end
          object ViewWorkWarranty: TcxGridDBColumn
            DataBinding.FieldName = 'Warranty'
            Width = 100
          end
        end
        object LevelWork: TcxGridLevel
          GridView = ViewWork
        end
      end
    end
    object gbMaterial: TcxGroupBox
      Left = 513
      Top = 0
      Align = alRight
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1087#1086' '#1079#1072#1082#1072#1079#1091':'
      Constraints.MinHeight = 1
      TabOrder = 1
      Height = 198
      Width = 680
      object GridMaterial: TcxGrid
        Left = 2
        Top = 18
        Width = 676
        Height = 178
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.ScrollbarMode = sbmDefault
        object ViewMaterial: TcxGridDBTableView
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
          DataController.DataSource = dsOrderMaterial
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.##'
              Kind = skSum
              Column = cxGridDBColumn41
            end>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          FilterRow.OperatorCustomization = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGridDBColumn36: TcxGridDBColumn
            DataBinding.FieldName = 'MaterialCode'
            Options.FilterRowOperator = foContains
            Width = 100
          end
          object cxGridDBColumn37: TcxGridDBColumn
            DataBinding.FieldName = 'Category'
            Options.FilterRowOperator = foContains
            Width = 100
          end
          object cxGridDBColumn38: TcxGridDBColumn
            DataBinding.FieldName = 'MaterialName'
            Options.FilterRowOperator = foContains
            Width = 500
          end
          object cxGridDBColumn39: TcxGridDBColumn
            DataBinding.FieldName = 'AmountText'
            Width = 100
          end
          object cxGridDBColumn40: TcxGridDBColumn
            DataBinding.FieldName = 'MaterialPrice'
            Width = 100
          end
          object cxGridDBColumn41: TcxGridDBColumn
            DataBinding.FieldName = 'MaterialCost'
            Width = 100
          end
        end
        object LevelMaterial: TcxGridLevel
          GridView = ViewMaterial
        end
      end
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
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aUpdate: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 8
      OnExecute = aUpdateExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1079#1072#1082#1072#1079#1091
      ImageIndex = 102
      ShortCut = 16453
      OnExecute = aEditExecute
    end
    object aUndoDelete: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      ImageIndex = 419
      OnExecute = aUndoDeleteExecute
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
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          BeginGroup = True
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
    object dxBarButton1: TdxBarButton
      Action = aEdit
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aUndoDelete
      Category = 0
    end
    object dxBarStatic1: TdxBarStatic
      Caption = '-'
      Category = 0
      Hint = '-'
      Visible = ivAlways
    end
    object eFromDate: TdxBarDateCombo
      Caption = #1053#1072#1095#1072#1083#1086':'
      Category = 0
      Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      Visible = ivAlways
      OnKeyDown = eFromDateKeyDown
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF0000
        00FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000080FF000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000080FF000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080FF0000
        80FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        80FF000080FFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFF000080FF000080FF000080FF0000
        80FF000080FFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FF800000FF800000FF800000FF800000FF800000FF8000
        00FF800000FF800000FF800000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FF800000FF800000FF800000FF800000FF800000FF8000
        00FF800000FF800000FF800000FF000000FFFF00FFFF000000FF800000FF8000
        00FF800000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FF800000FF8000
        00FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF0000
        00FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      ShowDayText = False
    end
    object eToDate: TdxBarDateCombo
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077':'
      Category = 0
      Hint = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072
      Visible = ivAlways
      OnKeyDown = eToDateKeyDown
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF0000
        00FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000080FF000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000080FF000080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080FF0000
        80FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        80FF000080FFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFF000080FF000080FF000080FF0000
        80FF000080FFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000080FF000000FF800000FF800000FF800000FF800000FF800000FF8000
        00FF800000FF800000FF800000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FF800000FF800000FF800000FF800000FF800000FF8000
        00FF800000FF800000FF800000FF000000FFFF00FFFF000000FF800000FF8000
        00FF800000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FF800000FF8000
        00FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF0000
        00FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      ShowDayText = False
    end
    object dxBarButton2: TdxBarButton
      Action = aUpdate
      Category = 0
      PaintStyle = psCaptionGlyph
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
      
        'select Date_Add(OL.CloseTime, interval E.OldOrderTime hour) as H' +
        'ideTime, '
      
        '  OL.*, UserInfo(OL.ID_AssertUser) as AssertUser, UserInfo(OL.ID' +
        '_AddUser) as AddUser, '
      
        '  WorkerInfo(OL.ID_Worker) as WInfo, OrderCategoryInfo(OL.OrderC' +
        'ategory) as OCInfo,'
      
        '  StatusTypeInfo(OL.ID_StatusType) as StatusInfo, SignalTypeInfo' +
        '(OL.ID_SignalType) as SignalInfo, ReasonInfo(OL.ID_Reason) as Re' +
        'asonInfo,'
      
        '  PaymentFormInfo(OL.ID_PaymentForm) as PFInfo, SourceTypeInfo(O' +
        'L.ID_SourceType) as SourceInfo'
      'from  OrderList OL, Enterprise E'
      'where'
      '  ((OL.Deleted = 1) or (OL.Closed = 1)) and'
      
        '  ((Date_Format(OL.AddTime, '#39'%Y.%m.%d'#39') >= :FD) or (:FD = '#39#39')) a' +
        'nd'
      '  ((Date_Format(OL.AddTime, '#39'%Y.%m.%d'#39') <= :TD) or (:TD = '#39#39'))'
      'order by  '
      '  OL.ID desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TD'
        ParamType = ptUnknown
      end>
    Left = 112
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TD'
        ParamType = ptUnknown
      end>
    object QueryID: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1081
      FieldName = 'ID'
      Required = True
    end
    object QueryDeleted: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object QueryID_AddUser: TSmallintField
      FieldName = 'ID_AddUser'
    end
    object QueryAddUser: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'AddUser'
      ReadOnly = True
      Size = 50
    end
    object QueryAddTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'AddTime'
    end
    object QueryID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object QueryAssertEmployee: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object QueryAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object QueryRequestText: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1079#1072#1082#1072#1079#1091
      FieldName = 'RequestText'
      Size = 500
    end
    object QueryOrderNUmber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderNUmber'
    end
    object QueryOrderDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderDate'
    end
    object QueryOrderCategory: TSmallintField
      FieldName = 'OrderCategory'
    end
    object QueryClosed: TSmallintField
      DisplayLabel = #1047#1072#1082#1088#1099#1090#1072
      FieldName = 'Closed'
    end
    object QueryID_Client: TIntegerField
      FieldName = 'ID_Client'
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
    object QueryID_StatusType: TSmallintField
      FieldName = 'ID_StatusType'
    end
    object QueryID_SignalType: TSmallintField
      FieldName = 'ID_SignalType'
    end
    object QueryID_SourceType: TSmallintField
      FieldName = 'ID_SourceType'
    end
    object QueryID_Distrinct: TSmallintField
      FieldName = 'ID_District'
    end
    object QueryID_Metro: TSmallintField
      FieldName = 'ID_Metro'
    end
    object QueryFiles: TSmallintField
      DisplayLabel = #1045#1089#1090#1100' '#1092#1072#1081#1083#1099
      FieldName = 'Files'
    end
    object QueryID_PaymentForm: TSmallintField
      FieldName = 'ID_PaymentForm'
    end
    object QueryID_Worker: TSmallintField
      FieldName = 'ID_Worker'
    end
    object QueryWorkDate: TDateTimeField
      FieldName = 'WorkDate'
    end
    object QueryWorkTime: TDateTimeField
      FieldName = 'WorkTime'
      DisplayFormat = 'hh:nn'
    end
    object QueryPlanTime: TFloatField
      FieldName = 'PlanTime'
    end
    object QueryWorkCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1088#1072#1073#1086#1090
      FieldName = 'WorkCost'
      DisplayFormat = ',0.##'
    end
    object QueryWInfo: TWideStringField
      FieldName = 'WInfo'
      ReadOnly = True
      Size = 100
    end
    object QueryOCInfo: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OCInfo'
      ReadOnly = True
    end
    object QueryFlatNumber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1072#1088#1090#1080#1088#1099
      FieldName = 'FlatNumber'
      Size = 50
    end
    object QueryName: TWideStringField
      FieldName = 'Name'
      Size = 150
    end
    object QueryIsClientDOMSPB: TSmallintField
      FieldName = 'IsClientDOMSPB'
      ReadOnly = True
    end
    object QueryClientComment: TWideStringField
      FieldName = 'ClientComment'
      ReadOnly = True
      Size = 200
    end
    object QueryClientDateTime: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientDateTime'
      ReadOnly = True
    end
    object QueryStatusComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1090#1072#1090#1091#1089#1091
      FieldName = 'StatusComment'
      ReadOnly = True
      Size = 200
    end
    object QueryPayed: TSmallintField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'Payed'
      ReadOnly = True
    end
    object QueryStatusInfo: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'StatusInfo'
      ReadOnly = True
      Size = 50
    end
    object QuerySignalInfo: TWideStringField
      DisplayLabel = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'SignalInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryPFInfo: TWideStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PFInfo'
      ReadOnly = True
      Size = 50
    end
    object QuerySourceInfo: TWideStringField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'SourceInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryID_Reason: TSmallintField
      FieldName = 'ID_Reason'
    end
    object QueryReasonInfo: TWideStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldName = 'ReasonInfo'
      ReadOnly = True
      Size = 50
    end
    object QueryHideTime: TDateTimeField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1085#1072' '#1076#1086
      FieldName = 'HideTime'
      ReadOnly = True
    end
    object QueryCloseTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'CloseTime'
    end
    object QueryWorkDateTime: TDateTimeField
      FieldName = 'WorkDateTime'
    end
    object QueryNeedCallDate: TDateTimeField
      FieldName = 'NeedCallDate'
    end
    object QueryCheckNumber: TWideStringField
      FieldName = 'CheckNumber'
      Size = 400
    end
    object QueryID_DiscountPromo: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object QueryUid: TWideStringField
      FieldName = 'Uid'
      Size = 256
    end
    object QueryOrderNumberExt: TWideStringField
      FieldName = 'OrderNumberExt'
      Size = 800
    end
    object QueryPersonalAccount: TWideStringField
      FieldName = 'PersonalAccount'
      Size = 400
    end
    object QueryCancelled: TSmallintField
      DisplayLabel = #1054#1090#1084#1077#1085#1077#1085
      FieldName = 'Cancelled'
    end
    object QueryMaterialCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      FieldName = 'MaterialCost'
      DisplayFormat = ',0.##'
    end
    object QueryFullCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1072
      FieldName = 'FullCost'
      DisplayFormat = ',0.##'
    end
  end
  object qOrderWork: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select  '
      
        '  OW.*, UserInfo(OW.ID_AssertUser) as AssertUser,  WorkTypeInfo(' +
        'OW.ID_WorkType) as WTInfo,'
      '  WarrantyTypeInfo(OW.WorkWarrantyType) as WTypeInfo, '
      '  WarrantyTypeShortInfo(OW.WorkWarrantyType) as WTypeShortInfo,'
      
        '  (select WC.Tag from WorkerClass WC, WorkType WT where WT.ID = ' +
        'OW.ID_WorkType and WC.ID = WT.ID_WorkerClass) as WCTag,'
      
        '  Concat(Convert(OW.WorkWarrantyTime, CHAR CHARACTER SET utf8mb4' +
        '), '#39' '#39', WarrantyTypeShortInfo(OW.WorkWarrantyType)) as Warranty,'
      
        '  Concat(Convert(OW.WorkAmount, CHAR CHARACTER SET utf8mb4), '#39' '#39 +
        ', OW.WorkUnitName) as AmountText,'
      '  OW.WorkPrice * OW.WorkAmount as WorkCost'
      'from  '
      '  OrderWork OW'
      'where '
      '  (OW.Deleted = :D or :D = 2)  and'
      '  OW.ID_OrderList = :ID'
      'order by  '
      '  OW.WorkName')
    Params = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 164
    Top = 498
    ParamData = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qOrderWorkID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField15: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object SmallintField17: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object WideStringField13: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object qOrderWorkID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object qOrderWorkID_WorkType: TSmallintField
      FieldName = 'ID_WorkType'
    end
    object qOrderWorkID_WorkerClass: TSmallintField
      FieldName = 'ID_WorkerClass'
    end
    object qOrderWorkWorkName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 300
      FieldName = 'WorkName'
      Size = 300
    end
    object qOrderWorkWorkPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'WorkPrice'
      DisplayFormat = ',0.##'
    end
    object qOrderWorkWorkNorm: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' ('#1084#1080#1085')'
      FieldName = 'WorkNorm'
    end
    object qOrderWorkWorkAmount: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'WorkAmount'
    end
    object qOrderWorkWorkUnitName: TWideStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084'.'
      FieldName = 'WorkUnitName'
    end
    object qOrderWorkWorkCode: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'WorkCode'
    end
    object qOrderWorkWorkWarrantyType: TSmallintField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WorkWarrantyType'
    end
    object qOrderWorkWorkWarrantyTime: TIntegerField
      DisplayLabel = #1057#1088#1086#1082' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WorkWarrantyTime'
    end
    object qOrderWorkWTInfo: TWideStringField
      DisplayWidth = 300
      FieldName = 'WTInfo'
      ReadOnly = True
      Size = 300
    end
    object qOrderWorkWTypeInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WTypeInfo'
      ReadOnly = True
    end
    object qOrderWorkWTypeShortInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WTypeShortInfo'
      ReadOnly = True
    end
    object qOrderWorkAmountText: TWideStringField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'AmountText'
      ReadOnly = True
      Size = 172
    end
    object qOrderWorkWorkCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'WorkCost'
      ReadOnly = True
      DisplayFormat = ',0.##'
    end
    object qOrderWorkWarranty: TWideStringField
      DisplayLabel = #1043#1072#1088#1072#1085#1090#1080#1103
      FieldName = 'Warranty'
      ReadOnly = True
      Size = 128
    end
    object qOrderWorkWCTag: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'WCTag'
      ReadOnly = True
      Size = 8
    end
    object qOrderWorkWorkSum: TFloatField
      FieldName = 'WorkSum'
    end
    object qOrderWorkID_Discount: TSmallintField
      FieldName = 'ID_Discount'
    end
    object qOrderWorkID_DiscountPromo: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object qOrderWorkDiscountPercent: TFloatField
      FieldName = 'DiscountPercent'
    end
    object qOrderWorkDiscountSum: TFloatField
      FieldName = 'DiscountSum'
    end
    object qOrderWorkDiscountPromoPercent: TFloatField
      FieldName = 'DiscountPromoPercent'
    end
    object qOrderWorkDiscountPromoSum: TFloatField
      FieldName = 'DiscountPromoSum'
    end
    object qOrderWorkTotalPrice: TFloatField
      FieldName = 'TotalPrice'
    end
    object qOrderWorkTotalSum: TFloatField
      FieldName = 'TotalSum'
    end
    object qOrderWorkDiscountDebtType: TSmallintField
      FieldName = 'DiscountDebtType'
    end
    object qOrderWorkDiscountSubType: TSmallintField
      FieldName = 'DiscountSubType'
    end
    object qOrderWorkDiscountCanAdd: TSmallintField
      FieldName = 'DiscountCanAdd'
    end
    object qOrderWorkDiscountMinOrderSum: TFloatField
      FieldName = 'DiscountMinOrderSum'
    end
    object qOrderWorkDiscountPromoDebtType: TSmallintField
      FieldName = 'DiscountPromoDebtType'
    end
    object qOrderWorkDiscountPromoSubType: TSmallintField
      FieldName = 'DiscountPromoSubType'
    end
    object qOrderWorkDiscountPromoCanAdd: TSmallintField
      FieldName = 'DiscountPromoCanAdd'
    end
    object qOrderWorkDiscountPromoMinOrderSum: TFloatField
      FieldName = 'DiscountPromoMinOrderSum'
    end
  end
  object dsOrderWork: TDataSource
    DataSet = qOrderWork
    Left = 272
    Top = 498
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        GridView = TableView
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 592
    Top = 136
  end
  object PopupMenuWork: TcxGridPopupMenu
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 556
    Top = 504
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
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from OrderList'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 168
    Top = 284
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qWork: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from OrderWork'
      'where ID_OrderList = :ID and Deleted = 0')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 72
    Top = 500
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object mdWork: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 20
    Top = 500
    object mdWorkID: TLargeintField
      FieldName = 'ID'
    end
    object mdWorkID_WorkType: TIntegerField
      FieldName = 'ID_WorkType'
    end
    object mdWorkID_WorkerClass: TIntegerField
      FieldName = 'ID_WorkerClass'
    end
    object mdWorkWorkType: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      FieldName = 'WorkName'
      Size = 100
    end
    object mdWorkPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072' ('#1088#1091#1073')'
      FieldName = 'WorkPrice'
    end
    object mdWorkAmount: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'WorkAmount'
    end
    object mdWorkWorkSum: TFloatField
      FieldName = 'WorkSum'
    end
    object mdWorkUnitName: TStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084#1077#1088'.'
      FieldName = 'WorkUnitName'
    end
    object mdWorkNorm: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' ('#1084')'
      FieldName = 'WorkNorm'
    end
    object mdWorkWorkWarrantyType: TIntegerField
      FieldName = 'WorkWarrantyType'
    end
    object mdWorkWorkWarrantyTime: TIntegerField
      FieldName = 'WorkWarrantyTime'
    end
    object mdWorkWorkerClassTag: TStringField
      DisplayWidth = 2
      FieldName = 'WorkerClassTag'
      Size = 2
    end
    object mdWorkEdited: TSmallintField
      FieldName = 'Edited'
    end
    object mdWorkID_Discount: TIntegerField
      FieldName = 'ID_Discount'
    end
    object mdWorkID_DiscountPromo: TIntegerField
      FieldName = 'ID_DiscountPromo'
    end
    object mdWorkDiscountPercent: TFloatField
      FieldName = 'DiscountPercent'
    end
    object mdWorkDiscountSum: TFloatField
      FieldName = 'DiscountSum'
    end
    object mdWorkDiscountPromoPercent: TFloatField
      FieldName = 'DiscountPromoPercent'
    end
    object mdWorkDiscountPromoSum: TFloatField
      FieldName = 'DiscountPromoSum'
    end
    object mdWorkTotalPrice: TFloatField
      FieldName = 'TotalPrice'
    end
    object mdWorkTotalSum: TFloatField
      FieldName = 'TotalSum'
    end
    object mdWorkDiscountDebtType: TIntegerField
      FieldName = 'DiscountDebtType'
    end
    object mdWorkDiscountSubType: TIntegerField
      FieldName = 'DiscountSubType'
    end
    object mdWorkDiscountCanAdd: TIntegerField
      FieldName = 'DiscountCanAdd'
    end
    object mdWorkDiscountMinOrderSum: TFloatField
      FieldName = 'DiscountMinOrderSum'
    end
    object mdWorkDiscountPromoDebtType: TIntegerField
      FieldName = 'DiscountPromoDebtType'
    end
    object mdWorkDiscountPromoSubType: TIntegerField
      FieldName = 'DiscountPromoSubType'
    end
    object mdWorkDiscountPromoCanAdd: TIntegerField
      FieldName = 'DiscountPromoCanAdd'
    end
    object mdWorkDiscountPromoMinOrderSum: TFloatField
      FieldName = 'DiscountPromoMinOrderSum'
    end
  end
  object qMaterial: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from OrderMaterial'
      'where ID_OrderList = :ID and Deleted = 0')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 84
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object mdMaterial: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 32
    Top = 552
    object LargeintField1: TLargeintField
      FieldName = 'ID'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_MaterialType'
    end
    object StringField1: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      FieldName = 'MaterialName'
      Size = 100
    end
    object FloatField2: TFloatField
      DisplayLabel = #1062#1077#1085#1072' ('#1088#1091#1073')'
      FieldName = 'MaterialPrice'
    end
    object FloatField6: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'MaterialAmount'
    end
    object FloatField7: TFloatField
      FieldName = 'MaterialSum'
    end
    object StringField2: TStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084#1077#1088'.'
      FieldName = 'MaterialUnitName'
    end
    object StringField3: TStringField
      DisplayWidth = 50
      FieldName = 'MaterialCode'
      Size = 50
    end
    object SmallintField5: TSmallintField
      FieldName = 'Edited'
    end
  end
  object qOrderMaterial: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select'
      
        '  OM.*, UserInfo(OM.ID_AssertUser) as AssertUser, MaterialTypeIn' +
        'fo(OM.ID_MaterialType) as MTInfo,'
      
        '  (select Category from MaterialType MT where MT.ID = OM.ID_Mate' +
        'rialType) as Category,'
      
        '  Concat(Convert(OM.MaterialAmount, CHAR CHARACTER SET utf8mb4),' +
        ' '#39' '#39', OM.MaterialUnitName) as AmountText,'
      '  OM.MaterialPrice * OM.MaterialAmount as MaterialCost'
      'from'
      '  OrderMaterial OM'
      'where'
      '  (OM.Deleted = :D or :D = 2)  and'
      '  OM.ID_OrderList = :ID'
      'order by'
      '  OM.MaterialName')
    Params = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 704
    Top = 484
    ParamData = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object SmallintField1: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField2: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object SmallintField3: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object SmallintField4: TSmallintField
      FieldName = 'ID_MaterialType'
    end
    object WideStringField2: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 300
      FieldName = 'MaterialName'
      Size = 300
    end
    object FloatField1: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'MaterialPrice'
      DisplayFormat = ',0.##'
    end
    object FloatField3: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'MaterialAmount'
    end
    object WideStringField3: TWideStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084'.'
      FieldName = 'MaterialUnitName'
    end
    object WideStringField4: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'MaterialCode'
    end
    object FloatField4: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'MaterialCost'
      ReadOnly = True
      DisplayFormat = ',0.##'
    end
    object WideStringField10: TWideStringField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'AmountText'
      ReadOnly = True
      Size = 172
    end
    object FloatField5: TFloatField
      FieldName = 'MaterialSum'
    end
    object qOrderMaterialMTInfo: TWideStringField
      FieldName = 'MTInfo'
      ReadOnly = True
      Size = 1200
    end
    object qOrderMaterialCategory: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'Category'
      ReadOnly = True
      Size = 400
    end
  end
  object dsOrderMaterial: TDataSource
    DataSet = qOrderMaterial
    Left = 792
    Top = 484
  end
end
