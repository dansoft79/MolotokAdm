object GWorkerForm: TGWorkerForm
  Left = 331
  Top = 196
  Action = MainForm.agWorker
  Caption = #1052#1072#1089#1090#1077#1088#1072
  ClientHeight = 482
  ClientWidth = 1133
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
    Top = 461
    Width = 1133
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
    Width = 788
    Height = 411
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
      object TableViewWCInfo: TcxGridDBColumn
        DataBinding.FieldName = 'WCInfo'
        Width = 150
      end
      object TableViewURInfo: TcxGridDBColumn
        DataBinding.FieldName = 'URInfo'
        Width = 150
      end
      object TableViewSurname: TcxGridDBColumn
        DataBinding.FieldName = 'Surname'
        Width = 150
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 100
      end
      object TableViewPatro: TcxGridDBColumn
        DataBinding.FieldName = 'Patro'
        Width = 100
      end
      object TableViewPhone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
        OnGetDataText = TableViewPhoneGetDataText
        Width = 100
      end
      object TableViewEmail: TcxGridDBColumn
        DataBinding.FieldName = 'Email'
        Width = 100
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
  object pRight: TPanel
    Left = 796
    Top = 50
    Width = 337
    Height = 411
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinHeight = 1
    Constraints.MinWidth = 1
    TabOrder = 5
    object PageControl: TcxPageControl
      Left = 0
      Top = 0
      Width = 337
      Height = 411
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tsSchedule
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 411
      ClientRectRight = 337
      ClientRectTop = 24
      object tsSchedule: TcxTabSheet
        Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
        ImageIndex = 4
        object GridTiming: TcxGrid
          Left = 0
          Top = 50
          Width = 337
          Height = 337
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object ViewTiming: TcxGridDBTableView
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
            DataController.DataSource = dsTiming
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
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
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object ViewTimingID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              VisibleForCustomization = False
            end
            object ViewTimingFree: TcxGridDBColumn
              DataBinding.FieldName = 'STInfo'
            end
            object ViewTimingDay1: TcxGridDBColumn
              DataBinding.FieldName = 'Day1'
              Width = 100
            end
            object ViewTimingDay2: TcxGridDBColumn
              DataBinding.FieldName = 'Day2'
              Width = 100
            end
            object ViewTimingDay3: TcxGridDBColumn
              DataBinding.FieldName = 'Day3'
              Width = 100
            end
            object ViewTimingDay4: TcxGridDBColumn
              DataBinding.FieldName = 'Day4'
              Width = 100
            end
            object ViewTimingDay5: TcxGridDBColumn
              DataBinding.FieldName = 'Day5'
              Width = 100
            end
            object ViewTimingDay6: TcxGridDBColumn
              DataBinding.FieldName = 'Day6'
              Width = 100
            end
            object ViewTimingDay7: TcxGridDBColumn
              DataBinding.FieldName = 'Day7'
              Width = 100
            end
            object ViewTimingComment: TcxGridDBColumn
              DataBinding.FieldName = 'Comment'
              Width = 200
            end
          end
          object ViewTime: TcxGridDBLayoutView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsTiming
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsCustomize.ItemFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.RecordCaption.Visible = False
            OptionsView.SingleRecordStretch = srsClient
            Styles.Item = StyleTiming
            Styles.OnGetItemStyle = ViewTimeStylesGetItemStyle
            object ViewTimeDay1: TcxGridDBLayoutViewItem
              DataBinding.FieldName = 'Day1'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              LayoutItem = ViewTimeLayoutItem3
              Options.Editing = False
              Options.Filtering = False
              Styles.Content = StyleTimingWork
            end
            object ViewTimeDay2: TcxGridDBLayoutViewItem
              DataBinding.FieldName = 'Day2'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              LayoutItem = ViewTimeLayoutItem4
              Options.Editing = False
              Options.Filtering = False
              Styles.Content = StyleTimingWork
            end
            object ViewTimeDay3: TcxGridDBLayoutViewItem
              DataBinding.FieldName = 'Day3'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              LayoutItem = ViewTimeLayoutItem5
              Options.Editing = False
              Options.Filtering = False
              Styles.Content = StyleTimingWork
            end
            object ViewTimeDay4: TcxGridDBLayoutViewItem
              DataBinding.FieldName = 'Day4'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              LayoutItem = ViewTimeLayoutItem6
              Options.Editing = False
              Options.Filtering = False
              Styles.Content = StyleTimingWork
            end
            object ViewTimeDay5: TcxGridDBLayoutViewItem
              DataBinding.FieldName = 'Day5'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              LayoutItem = ViewTimeLayoutItem7
              Options.Editing = False
              Options.Filtering = False
              Styles.Content = StyleTimingWork
            end
            object ViewTimeDay6: TcxGridDBLayoutViewItem
              DataBinding.FieldName = 'Day6'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              LayoutItem = ViewTimeLayoutItem8
              Options.Editing = False
              Options.Filtering = False
              Styles.Content = StyleTimingWork
            end
            object ViewTimeDay7: TcxGridDBLayoutViewItem
              DataBinding.FieldName = 'Day7'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              LayoutItem = ViewTimeLayoutItem9
              Options.Editing = False
              Options.Filtering = False
              Styles.Content = StyleTimingWork
            end
            object ViewTimeComment: TcxGridDBLayoutViewItem
              DataBinding.FieldName = 'Comment'
              PropertiesClassName = 'TcxMemoProperties'
              Properties.ReadOnly = True
              Properties.ScrollBars = ssVertical
              Properties.VisibleLineCount = 5
              LayoutItem = ViewTimeLayoutItem10
              Options.Editing = False
              Options.Filtering = False
              Styles.Content = StyleTiming
            end
            object ViewTimeGroup_Root: TdxLayoutGroup
              AlignHorz = ahClient
              AlignVert = avClient
              ButtonOptions.Buttons = <>
              Hidden = True
              ScrollOptions.Horizontal = smAuto
              ScrollOptions.Vertical = smAuto
              ShowBorder = False
              Index = -1
            end
            object ViewTimeLayoutItem3: TcxGridLayoutItem
              Parent = ViewTimeGroup_Root
              Index = 0
            end
            object ViewTimeLayoutItem4: TcxGridLayoutItem
              Parent = ViewTimeGroup_Root
              Index = 1
            end
            object ViewTimeLayoutItem5: TcxGridLayoutItem
              Parent = ViewTimeGroup_Root
              Index = 2
            end
            object ViewTimeLayoutItem6: TcxGridLayoutItem
              Parent = ViewTimeGroup_Root
              Index = 3
            end
            object ViewTimeLayoutItem7: TcxGridLayoutItem
              Parent = ViewTimeGroup_Root
              Index = 4
            end
            object ViewTimeLayoutItem8: TcxGridLayoutItem
              Parent = ViewTimeGroup_Root
              Index = 5
            end
            object ViewTimeLayoutItem9: TcxGridLayoutItem
              Parent = ViewTimeGroup_Root
              Index = 6
            end
            object ViewTimeLayoutItem10: TcxGridLayoutItem
              Parent = ViewTimeGroup_Root
              CaptionOptions.AlignVert = tavTop
              Index = 7
            end
          end
          object LevelTiming: TcxGridLevel
            GridView = ViewTime
          end
        end
        object DockTiming: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 337
          Height = 50
          Align = dalTop
          BarManager = BarManager
        end
      end
      object tsCategory: TcxTabSheet
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
        ImageIndex = 0
        object GridCategory: TcxGrid
          Left = 0
          Top = 50
          Width = 337
          Height = 337
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object ViewCategory: TcxGridDBTableView
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
            OnCustomDrawCell = ViewCategoryCustomDrawCell
            OnFocusedRecordChanged = TableViewFocusedRecordChanged
            DataController.DataSource = dsCategory
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
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
            object ViewCategoryColor: TcxGridDBColumn
              DataBinding.FieldName = 'Color'
              Visible = False
              VisibleForCustomization = False
            end
            object ViewCategoryAssertUser: TcxGridDBColumn
              DataBinding.FieldName = 'AssertUser'
              Visible = False
              VisibleForCustomization = False
            end
            object ViewCategoryAssertTime: TcxGridDBColumn
              DataBinding.FieldName = 'AssertTime'
              Visible = False
              VisibleForCustomization = False
            end
            object ViewCategoryWorkInfo: TcxGridDBColumn
              DataBinding.FieldName = 'WorkInfo'
              Width = 140
            end
            object ViewCategoryWorkerInfo: TcxGridDBColumn
              DataBinding.FieldName = 'WorkerInfo'
              Width = 70
            end
            object ViewCategoryPriority: TcxGridDBColumn
              DataBinding.FieldName = 'Priority'
              Width = 59
            end
            object ViewCategoryTag: TcxGridDBColumn
              DataBinding.FieldName = 'Tag'
              Width = 30
            end
          end
          object LevelCategory: TcxGridLevel
            GridView = ViewCategory
          end
        end
        object DockCategory: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 337
          Height = 50
          Align = dalTop
          BarManager = BarManager
        end
      end
      object tsDistict: TcxTabSheet
        Caption = #1056#1072#1081#1086#1085#1099
        ImageIndex = 2
        object GridDistrict: TcxGrid
          Left = 0
          Top = 50
          Width = 337
          Height = 337
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object ViewDistrict: TcxGridDBTableView
            OnDblClick = DBGridDblClick
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
            DataController.DataSource = dsDistrict
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
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
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object ViewDistrictID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              VisibleForCustomization = False
            end
            object ViewDistrictDInfo: TcxGridDBColumn
              DataBinding.FieldName = 'DInfo'
              Width = 481
            end
          end
          object LevelDistrict: TcxGridLevel
            GridView = ViewDistrict
          end
        end
        object DockDistrict: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 337
          Height = 50
          Align = dalTop
          BarManager = BarManager
        end
      end
      object tsTag: TcxTabSheet
        Caption = #1058#1101#1075#1080
        ImageIndex = 3
        object GridTag: TcxGrid
          Left = 0
          Top = 50
          Width = 337
          Height = 337
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object ViewTag: TcxGridDBTableView
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
            DataController.DataSource = dsTag
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
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
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object ViewTagID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              VisibleForCustomization = False
            end
            object ViewTagOTInfo: TcxGridDBColumn
              DataBinding.FieldName = 'OTInfo'
            end
          end
          object LevelTag: TcxGridLevel
            GridView = ViewTag
          end
        end
        object DockTag: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 337
          Height = 50
          Align = dalTop
          BarManager = BarManager
        end
      end
    end
  end
  object Splitter: TcxSplitter
    Left = 788
    Top = 50
    Width = 8
    Height = 411
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
    Control = pRight
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 108
    Top = 84
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      #1050#1072#1090#1077#1075#1086#1088#1080#1080
      #1056#1072#1081#1086#1085#1099
      #1058#1101#1075#1080
      #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077)
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
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
    object BarManagerBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      CaptionButtons = <>
      DockControl = DockCategory
      DockedDockControl = DockCategory
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 833
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object BarManagerBar4: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = #1056#1072#1081#1086#1085#1099
      CaptionButtons = <>
      DockControl = DockDistrict
      DockedDockControl = DockDistrict
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 317
      FloatTop = 445
      FloatClientWidth = 51
      FloatClientHeight = 46
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton11'
        end
        item
          Visible = True
          ItemName = 'dxBarButton12'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object BarManagerBar5: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = #1058#1101#1075#1080
      CaptionButtons = <>
      DockControl = DockTag
      DockedDockControl = DockTag
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 833
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton13'
        end
        item
          Visible = True
          ItemName = 'dxBarButton14'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object BarManagerBar6: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
      CaptionButtons = <>
      DockControl = DockTiming
      DockedDockControl = DockTiming
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 985
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton18'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
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
    object dxBarButton6: TdxBarButton
      Action = aAddCategory
      Category = 1
    end
    object dxBarButton7: TdxBarButton
      Action = aDelCategory
      Category = 1
    end
    object dxBarButton11: TdxBarButton
      Action = aAddDistrict
      Category = 2
    end
    object dxBarButton12: TdxBarButton
      Action = aDelDistrict
      Category = 2
    end
    object dxBarButton13: TdxBarButton
      Action = aAddTag
      Category = 3
    end
    object dxBarButton14: TdxBarButton
      Action = aDelTag
      Category = 3
    end
    object dxBarButton18: TdxBarButton
      Action = aEditTiming
      Category = 4
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 172
    Top = 84
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
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
    object aAddCategory: TAction
      Category = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      ImageIndex = 100
      OnExecute = aAddCategoryExecute
    end
    object aDelCategory: TAction
      Category = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      ImageIndex = 101
      OnExecute = aDelCategoryExecute
    end
    object aAddDistrict: TAction
      Category = #1056#1072#1081#1086#1085#1099
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1081#1086#1085
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1081#1086#1085
      ImageIndex = 100
      OnExecute = aAddDistrictExecute
    end
    object aDelDistrict: TAction
      Category = #1056#1072#1081#1086#1085#1099
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1081#1086#1085
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1081#1086#1085
      ImageIndex = 101
      OnExecute = aDelDistrictExecute
    end
    object aAddTag: TAction
      Category = #1058#1101#1075#1080
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1101#1075
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1101#1075
      ImageIndex = 100
      OnExecute = aAddTagExecute
    end
    object aDelTag: TAction
      Category = #1058#1101#1075#1080
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1101#1075
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1101#1075
      ImageIndex = 101
      OnExecute = aDelTagExecute
    end
    object aEditTiming: TAction
      Category = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
      ImageIndex = 102
      OnExecute = aEditTimingExecute
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      
        'select *, UserInfo(ID_AssertUser) as AssertUser, WorkerCompanyIn' +
        'fo(ID_WorkerCompany) as WCInfo, UserRoleInfo(ID_UserRole) as URI' +
        'nfo'
      'from Worker'
      'where (Deleted = :D or :D = 2) and (Active = :A or :A = 2)'
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
      end>
    Left = 32
    Top = 136
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
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select * from Worker'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 36
    Top = 84
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
    Left = 332
    Top = 88
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
    Left = 332
    Top = 140
    PixelsPerInch = 96
  end
  object qExists: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select ID'
      'from Worker'
      'where Phone = :N and ID <> :IDE'
      'limit 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDE'
        ParamType = ptUnknown
      end>
  end
  object qCategory: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select '
      '  WC.ID, WC.ID_WorkClass, WC.ID_WorkerClass, WC.ID_Worker,'
      '  WorkerClassInfo(WC.ID_WorkerClass) as WorkerInfo, '
      '  WorkClassInfo(WC.ID_WorkClass) as WorkInfo,'
      '  WCL.Color, WCL.Priority, WCL.Tag'
      'from '
      '  WorkerCategory WC'
      '  inner join WorkerClass WCL on'
      '    WCL.ID = WC.ID_WorkerClass'
      'where '
      '  WC.ID_Worker = :ID'
      'order by '
      '  WorkInfo, WorkerInfo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 76
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object SmallintField1: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object qCategoryID_Worker: TSmallintField
      FieldName = 'ID_Worker'
    end
    object qCategoryID_WorkClass: TSmallintField
      FieldName = 'ID_WorkClass'
    end
    object qCategoryID_WorkerClass: TSmallintField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
      FieldName = 'ID_WorkerClass'
    end
    object qCategoryWorkerInfo: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'WorkerInfo'
      ReadOnly = True
      Size = 50
    end
    object qCategoryWorkInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1088#1072#1073#1086#1090#1099
      FieldName = 'WorkInfo'
      ReadOnly = True
      Size = 50
    end
    object qCategoryColor: TLargeintField
      DisplayLabel = #1062#1074#1077#1090
      FieldName = 'Color'
      ReadOnly = True
    end
    object qCategoryPriority: TSmallintField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'Priority'
    end
    object qCategoryTag: TWideStringField
      DisplayLabel = #1058#1101#1075
      FieldName = 'Tag'
      Size = 2
    end
  end
  object dsCategory: TDataSource
    DataSet = qCategory
    Left = 132
    Top = 360
  end
  object pmGridCategory: TcxGridPopupMenu
    Grid = GridCategory
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 132
    Top = 408
  end
  object tCategory: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    SQL.Strings = (
      'select *'
      'from WorkerCategory'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 76
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object tDistrict: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkerDistrict'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qDistrict: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *, DistrictInfo(ID_District) as DInfo'
      'from WorkerDistrict'
      'where ID_Worker = :ID'
      'order by DInfo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 376
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object SmallintField2: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField3: TSmallintField
      FieldName = 'ID_Worker'
    end
    object qDistrictID_District: TSmallintField
      FieldName = 'ID_District'
    end
    object qDistrictDInfo: TWideStringField
      DisplayLabel = #1056#1072#1081#1086#1085
      FieldName = 'DInfo'
      ReadOnly = True
      Size = 50
    end
  end
  object dsDistrict: TDataSource
    DataSet = qDistrict
    Left = 432
    Top = 360
  end
  object pmDistrict: TcxGridPopupMenu
    Grid = GridDistrict
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 432
    Top = 408
  end
  object pmTag: TcxGridPopupMenu
    Grid = GridTag
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 580
    Top = 408
  end
  object qTag: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *, OrderTagInfo(ID_OrderTag) as OTInfo'
      'from WorkerTag'
      'where ID_Worker = :ID'
      'order by OTInfo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 524
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object SmallintField4: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField5: TSmallintField
      FieldName = 'ID_Worker'
    end
    object qTagID_OrderTag: TSmallintField
      FieldName = 'ID_OrderTag'
    end
    object qTagOTInfo: TWideStringField
      DisplayLabel = #1058#1101#1075
      FieldName = 'OTInfo'
      ReadOnly = True
      Size = 50
    end
  end
  object dsTag: TDataSource
    DataSet = qTag
    Left = 580
    Top = 360
  end
  object tTag: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkerTag'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 524
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qTiming: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = qTimingAfterOpen
    SQL.Strings = (
      'select *'
      'from WorkerTiming'
      'where ID_Worker = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = DataSource
    Left = 652
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object SmallintField6: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField7: TSmallintField
      FieldName = 'ID_Worker'
    end
    object qTimingDay1: TWideStringField
      DisplayLabel = #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
      FieldName = 'Day1'
      Size = 50
    end
    object qTimingDay2: TWideStringField
      DisplayLabel = #1042#1090#1086#1088#1085#1080#1082
      FieldName = 'Day2'
      Size = 50
    end
    object qTimingDay3: TWideStringField
      DisplayLabel = #1057#1088#1077#1076#1072
      FieldName = 'Day3'
      Size = 50
    end
    object qTimingDay4: TWideStringField
      DisplayLabel = #1063#1077#1090#1074#1077#1088#1075
      FieldName = 'Day4'
      Size = 50
    end
    object qTimingDay5: TWideStringField
      DisplayLabel = #1055#1103#1090#1085#1080#1094#1072
      FieldName = 'Day5'
      Size = 50
    end
    object qTimingDay6: TWideStringField
      DisplayLabel = #1057#1091#1073#1073#1086#1090#1072
      FieldName = 'Day6'
      Size = 50
    end
    object qTimingDay7: TWideStringField
      DisplayLabel = #1042#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077
      FieldName = 'Day7'
      Size = 50
    end
    object qTimingComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'Comment'
      Size = 200
    end
  end
  object dsTiming: TDataSource
    DataSet = qTiming
    Left = 708
    Top = 360
  end
  object pmTiming: TcxGridPopupMenu
    Grid = GridTiming
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 708
    Top = 408
  end
  object tTiming: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkerTIming'
      'where ID = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 652
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object StyleRepository: TcxStyleRepository
    Left = 616
    Top = 192
    PixelsPerInch = 96
    object StyleTiming: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object StyleTimingWork: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clGreen
    end
    object StyleTimingHoliday: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
  end
end
