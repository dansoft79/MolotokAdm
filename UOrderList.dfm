object OrderListForm: TOrderListForm
  Left = 331
  Top = 196
  Action = MainForm.aaOrderList
  Caption = #1046#1091#1088#1085#1072#1083' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 658
  ClientWidth = 1384
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 637
    Width = 1384
    Height = 21
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object PageControl: TcxPageControl
    Left = 0
    Top = 50
    Width = 1384
    Height = 587
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tsTableRequest
    Properties.CustomButtons.Buttons = <>
    OnChange = PageControlChange
    OnPageChanging = PageControlPageChanging
    ClientRectBottom = 587
    ClientRectRight = 1384
    ClientRectTop = 24
    object tsPlanner: TcxTabSheet
      Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082
      ImageIndex = 1
      OnResize = tsPlannerResize
      DesignSize = (
        1384
        563)
      object Scheduler: TcxScheduler
        Left = 0
        Top = 26
        Width = 1381
        Height = 534
        ParentCustomHint = False
        DateNavigator.ColCount = 3
        DateNavigator.Visible = False
        ViewTimeGrid.Active = True
        ViewTimeGrid.EventMaxLineCount = 1
        ViewTimeGrid.Scales.TimeStep = 60
        OnCustomDrawContent = SchedulerCustomDrawContent
        OnCustomDrawEvent = SchedulerCustomDrawEvent
        OnCustomDrawResourceHeader = SchedulerCustomDrawResourceHeader
        OnInitEventImages = SchedulerInitEventImages
        Anchors = [akLeft, akTop, akRight, akBottom]
        ContentPopupMenu.UseBuiltInPopupMenu = False
        ControlBox.Visible = False
        DialogsLookAndFeel.NativeStyle = False
        DialogsLookAndFeel.ScrollbarMode = sbmDefault
        DialogsStyle = 'Standard'
        EventImages = UtilForm.ImageList
        EventOperations.Creating = False
        EventOperations.Deleting = False
        EventOperations.DialogEditing = False
        EventOperations.DialogShowing = False
        EventOperations.InplaceEditing = False
        EventOperations.Intersection = False
        EventOperations.MovingBetweenResources = False
        EventOperations.Moving = False
        EventOperations.Recurrence = False
        EventOperations.Sizing = False
        EventPopupMenu.PopupMenu = pmEvent
        EventPopupMenu.UseBuiltInPopupMenu = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        OptionsView.GroupSeparatorWidth = 1
        OptionsView.ResourceHeaders.Height = 150
        OptionsView.ResourceHeaders.RotateCaptions = False
        OptionsView.ResourcesPerPage = 10
        OptionsView.RotateResourceCaptions = False
        OptionsView.ShowNavigationButtons = False
        OptionsView.StartOfWeek = swMonday
        OptionsView.WorkDays = []
        OptionsView.WorkFinish = 0.833333333333333400
        ResourceNavigator.Buttons.First.Hint = #1055#1077#1088#1074#1099#1081' '#1084#1072#1089#1090#1077#1088
        ResourceNavigator.Buttons.Last.Hint = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1084#1072#1089#1090#1077#1088
        ResourceNavigator.Buttons.ShowFewerResources.Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1084#1077#1085#1100#1096#1077' '#1084#1072#1089#1090#1077#1088#1086#1074
        ResourceNavigator.Buttons.ShowMoreResources.Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1073#1086#1083#1100#1096#1077' '#1084#1072#1089#1090#1077#1088#1086#1074
        ResourceNavigator.Visibility = snvAlways
        ShowHint = True
        Storage = SchedulerDBStorage
        Styles.ResourceHeader = StyleWorker
        TabOrder = 0
        OnDblClick = SchedulerDblClick
        OnEventSelectionChanged = SchedulerEventSelectionChanged
        OnGetEventDisplayText = SchedulerGetEventDisplayText
        OnGetEventModernStyleHintInfo = SchedulerGetEventModernStyleHintInfo
        OnMouseDown = SchedulerMouseDown
        OnMouseMove = SchedulerMouseMove
        Splitters = {
          B00300007E0000003F04000083000000AB03000001000000B003000032020000}
        StoredClientBounds = {01000000010000006405000015020000}
      end
      object DockControlScheduler: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 1384
        Height = 26
        Align = dalTop
        BarManager = BarManager
      end
    end
    object tsTableRequest: TcxTabSheet
      Caption = #1047#1072#1082#1072#1079#1099
      ImageIndex = 0
      object Grid: TcxGrid
        Left = 0
        Top = 0
        Width = 1384
        Height = 348
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.ScrollbarMode = sbmDefault
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
          ScrollbarAnnotations.CustomAnnotations = <>
          OnFocusedRecordChanged = TableViewFocusedRecordChanged
          OnSelectionChanged = TableViewSelectionChanged
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
          object TableViewID: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'ID'
          end
          object TableViewDeleted: TcxGridDBColumn
            DataBinding.FieldName = 'Deleted'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
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
          object TableViewClosed: TcxGridDBColumn
            DataBinding.FieldName = 'Closed'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
          end
          object TableViewOrderNUmber: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072
            DataBinding.FieldName = 'OrderNUmber'
            Visible = False
          end
          object TableViewOrderDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
            DataBinding.FieldName = 'OrderDate'
            Visible = False
          end
          object TableViewRequestText: TcxGridDBColumn
            DataBinding.FieldName = 'RequestText'
            Options.FilterRowOperator = foContains
            Width = 200
          end
          object TableViewOCInfo: TcxGridDBColumn
            DataBinding.FieldName = 'OCInfo'
            Visible = False
          end
          object TableViewPhone: TcxGridDBColumn
            DataBinding.FieldName = 'Phone'
            Visible = False
          end
          object TableViewName: TcxGridDBColumn
            Caption = #1048#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
            DataBinding.FieldName = 'Name'
            OnGetFilterValues = TableViewNameGetFilterValues
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
            Options.FilterRowOperator = foContains
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
          object TableViewWorkCost: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'WorkCost'
            OnGetDisplayText = TableViewWorkCostGetDisplayText
          end
          object TableViewSignalInfo: TcxGridDBColumn
            DataBinding.FieldName = 'SignalInfo'
            Width = 120
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
          object TableViewHideTime: TcxGridDBColumn
            DataBinding.FieldName = 'HideTime'
            Visible = False
          end
          object TableViewCloseTime: TcxGridDBColumn
            DataBinding.FieldName = 'CloseTime'
            Visible = False
          end
        end
        object Level: TcxGridLevel
          GridView = TableView
        end
      end
      object SplitterWorks: TcxSplitter
        Left = 0
        Top = 348
        Width = 1384
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = pBottomOrder
      end
      object pBottomOrder: TPanel
        Left = 0
        Top = 356
        Width = 1384
        Height = 207
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        OnResize = pBottomOrderResize
        object gbWorks: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          Caption = #1056#1072#1073#1086#1090#1099' '#1087#1086' '#1079#1072#1082#1072#1079#1091':'
          Constraints.MinHeight = 1
          TabOrder = 0
          Height = 207
          Width = 704
          object GridWork: TcxGrid
            Left = 2
            Top = 18
            Width = 700
            Height = 187
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
              ScrollbarAnnotations.CustomAnnotations = <>
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
                DataBinding.FieldName = 'AmountText'
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
        object gbMaterialOrder: TcxGroupBox
          Left = 704
          Top = 0
          Align = alRight
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1087#1086' '#1079#1072#1082#1072#1079#1091':'
          Constraints.MinHeight = 1
          TabOrder = 1
          Height = 207
          Width = 680
          object GridMaterial: TcxGrid
            Left = 2
            Top = 18
            Width = 676
            Height = 187
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
    end
    object tsTableLead: TcxTabSheet
      Caption = #1051#1080#1076#1099
      ImageIndex = 2
      object LeadGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 1384
        Height = 378
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.ScrollbarMode = sbmDefault
        object TableViewLead: TcxGridDBTableView
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
          ScrollbarAnnotations.CustomAnnotations = <>
          OnFocusedRecordChanged = TableViewFocusedRecordChanged
          OnSelectionChanged = TableViewLeadSelectionChanged
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
          object TableViewLeadID: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'ID'
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'Deleted'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
          end
          object cxGridDBColumn25: TcxGridDBColumn
            DataBinding.FieldName = 'StatusInfo'
            Options.FilterRowOperator = foContains
            Width = 120
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'AddTime'
          end
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'AddUser'
            Options.FilterRowOperator = foContains
            Width = 100
          end
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'AssertTime'
            Visible = False
          end
          object cxGridDBColumn6: TcxGridDBColumn
            DataBinding.FieldName = 'AssertUser'
            Visible = False
            Width = 100
          end
          object cxGridDBColumn17: TcxGridDBColumn
            DataBinding.FieldName = 'RequestText'
            Options.FilterRowOperator = foContains
            Width = 200
          end
          object cxGridDBColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'Closed'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
          end
          object cxGridDBColumn8: TcxGridDBColumn
            DataBinding.FieldName = 'OrderNUmber'
            Visible = False
          end
          object cxGridDBColumn9: TcxGridDBColumn
            DataBinding.FieldName = 'OrderDate'
            Visible = False
          end
          object cxGridDBColumn12: TcxGridDBColumn
            Caption = #1048#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
            DataBinding.FieldName = 'Name'
            Options.FilterRowOperator = foContains
            Width = 150
          end
          object cxGridDBColumn13: TcxGridDBColumn
            Caption = #1050#1083#1080#1077#1085#1090' '#1044#1054#1052' '#1057#1055#1073
            DataBinding.FieldName = 'IsClientDOMSPB'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Width = 103
          end
          object TableViewLeadAddress: TcxGridDBColumn
            DataBinding.FieldName = 'Address'
            Options.FilterRowOperator = foContains
            Width = 200
          end
          object cxGridDBColumn24: TcxGridDBColumn
            Caption = #1052#1072#1089#1090#1077#1088
            DataBinding.FieldName = 'WInfo'
            Options.FilterRowOperator = foContains
            Width = 150
          end
          object cxGridDBColumn20: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
            DataBinding.FieldName = 'WorkDate'
          end
          object cxGridDBColumn21: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1086#1077' '#1074#1088#1077#1084#1103
            DataBinding.FieldName = 'WorkTime'
          end
          object TableViewLeadOCOnfo: TcxGridDBColumn
            DataBinding.FieldName = 'OCInfo'
            Visible = False
          end
          object TableViewLeadPhone: TcxGridDBColumn
            DataBinding.FieldName = 'Phone'
            Visible = False
          end
          object cxGridDBColumn15: TcxGridDBColumn
            DataBinding.FieldName = 'FlatNumber'
            Visible = False
            Width = 93
          end
          object cxGridDBColumn16: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1082' '#1072#1076#1088#1077#1089#1091
            DataBinding.FieldName = 'ClientComment'
            Visible = False
            Width = 200
          end
          object cxGridDBColumn18: TcxGridDBColumn
            DataBinding.FieldName = 'Files'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
            Width = 75
          end
          object cxGridDBColumn19: TcxGridDBColumn
            DataBinding.FieldName = 'ClientDateTime'
            Visible = False
          end
          object cxGridDBColumn22: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
            DataBinding.FieldName = 'PlanTime'
            Visible = False
            Width = 88
          end
          object cxGridDBColumn23: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'WorkCost'
            OnGetDisplayText = cxGridDBColumn23GetDisplayText
          end
          object cxGridDBColumn26: TcxGridDBColumn
            DataBinding.FieldName = 'ReasonInfo'
            Visible = False
            Width = 120
          end
          object cxGridDBColumn27: TcxGridDBColumn
            DataBinding.FieldName = 'StatusComment'
            Visible = False
            Width = 200
          end
          object cxGridDBColumn28: TcxGridDBColumn
            DataBinding.FieldName = 'SignalInfo'
            Width = 120
          end
          object cxGridDBColumn29: TcxGridDBColumn
            DataBinding.FieldName = 'SourceInfo'
            Visible = False
            Width = 150
          end
          object cxGridDBColumn30: TcxGridDBColumn
            DataBinding.FieldName = 'PFInfo'
            Visible = False
            Width = 120
          end
          object cxGridDBColumn31: TcxGridDBColumn
            DataBinding.FieldName = 'Payed'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
          end
          object cxGridDBColumn32: TcxGridDBColumn
            DataBinding.FieldName = 'HideTime'
            Visible = False
          end
          object cxGridDBColumn33: TcxGridDBColumn
            DataBinding.FieldName = 'CloseTime'
            Visible = False
          end
        end
        object LevelLead: TcxGridLevel
          GridView = TableViewLead
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 378
        Width = 1384
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = pBottomLead
        ExplicitWidth = 8
      end
      object pBottomLead: TPanel
        Left = 0
        Top = 386
        Width = 1384
        Height = 177
        Align = alBottom
        BevelOuter = bvNone
        Constraints.MinHeight = 1
        TabOrder = 2
        OnResize = pBottomLeadResize
        object gbWorksLead: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          Caption = #1056#1072#1073#1086#1090#1099' '#1087#1086' '#1079#1072#1103#1074#1082#1077':'
          Constraints.MinHeight = 1
          TabOrder = 0
          Height = 177
          Width = 704
          object GridWorkLead: TcxGrid
            Left = 2
            Top = 18
            Width = 700
            Height = 157
            Align = alClient
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            LookAndFeel.ScrollbarMode = sbmDefault
            object ViewWorkLead: TcxGridDBTableView
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
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = dsOrderWork
              DataController.Filter.Options = [fcoCaseInsensitive]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ',0.##'
                  Kind = skSum
                  Column = ViewWorkLeadWorkCost
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
              object ViewWorkLeadWorkCode: TcxGridDBColumn
                DataBinding.FieldName = 'WorkCode'
                Options.FilterRowOperator = foContains
                Width = 100
              end
              object ViewWorkLeadWCTag: TcxGridDBColumn
                DataBinding.FieldName = 'WCTag'
                Options.FilterRowOperator = foContains
                Width = 100
              end
              object ViewWorkLeadWorkName: TcxGridDBColumn
                DataBinding.FieldName = 'WorkName'
                Options.FilterRowOperator = foContains
                Width = 500
              end
              object ViewWorkLeadAmountText: TcxGridDBColumn
                DataBinding.FieldName = 'AmountText'
                Width = 100
              end
              object ViewWorkLeadWorkPrice: TcxGridDBColumn
                DataBinding.FieldName = 'WorkPrice'
                Width = 100
              end
              object ViewWorkLeadWorkCost: TcxGridDBColumn
                DataBinding.FieldName = 'WorkCost'
                Width = 100
              end
              object ViewWorkLeadWarranty: TcxGridDBColumn
                DataBinding.FieldName = 'Warranty'
                Width = 100
              end
            end
            object LevelWorkLead: TcxGridLevel
              GridView = ViewWorkLead
            end
          end
        end
        object gbMaterialLead: TcxGroupBox
          Left = 704
          Top = 0
          Align = alRight
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1087#1086' '#1079#1072#1103#1074#1082#1077':'
          Constraints.MinHeight = 1
          TabOrder = 1
          Height = 177
          Width = 680
          object GridMaterialLead: TcxGrid
            Left = 2
            Top = 18
            Width = 676
            Height = 157
            Align = alClient
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            LookAndFeel.ScrollbarMode = sbmDefault
            object ViewMaterialLead: TcxGridDBTableView
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
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = dsOrderMaterial
              DataController.Filter.Options = [fcoCaseInsensitive]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ',0.##'
                  Kind = skSum
                  Column = cxGridDBColumn35
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
              object cxGridDBColumn1: TcxGridDBColumn
                DataBinding.FieldName = 'MaterialCode'
                Options.FilterRowOperator = foContains
                Width = 100
              end
              object cxGridDBColumn10: TcxGridDBColumn
                DataBinding.FieldName = 'Category'
                Options.FilterRowOperator = foContains
                Width = 100
              end
              object cxGridDBColumn11: TcxGridDBColumn
                DataBinding.FieldName = 'MaterialName'
                Options.FilterRowOperator = foContains
                Width = 500
              end
              object cxGridDBColumn14: TcxGridDBColumn
                DataBinding.FieldName = 'AmountText'
                Width = 100
              end
              object cxGridDBColumn34: TcxGridDBColumn
                DataBinding.FieldName = 'MaterialPrice'
                Width = 100
              end
              object cxGridDBColumn35: TcxGridDBColumn
                DataBinding.FieldName = 'MaterialCost'
                Width = 100
              end
            end
            object LevelMaterialLead: TcxGridLevel
              GridView = ViewMaterialLead
            end
          end
        end
      end
    end
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 136
    Top = 228
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
    ImageOptions.StretchGlyphs = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 376
    Top = 172
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
          ItemName = 'bPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 162
          Visible = True
          ItemName = 'eDate'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton11'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object BarScheduler: TdxBar
      AllowClose = False
      Caption = #1060#1080#1083#1100#1090#1088#1099
      CaptionButtons = <>
      DockControl = DockControlScheduler
      DockedDockControl = DockControlScheduler
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1275
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cbDistricts'
        end
        item
          Visible = True
          ItemName = 'cbCategories'
        end
        item
          Visible = True
          ItemName = 'cbSignalTypes'
        end
        item
          Visible = True
          ItemName = 'cbWorkerCompany'
        end
        item
          BeginGroup = True
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'cbAllMaster'
        end
        item
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'cbAllSlot'
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
    object dxBarButton9: TdxBarButton
      Action = aExportData
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
      Visible = ivInCustomizing
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
    object dxBarButton6: TdxBarButton
      Action = aLeft
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aRight
      Category = 0
    end
    object eDate: TdxBarDateCombo
      Align = iaCenter
      Caption = #1044#1072#1090#1072
      Category = 0
      Hint = #1044#1072#1090#1072
      Visible = ivAlways
      OnChange = eDateChange
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
      Width = 130
      StyleEdit = StyleDateEditor
      ShowEditor = False
      ShowClearButton = False
    end
    object cbAllMaster: TcxBarEditItem
      Caption = #1042#1089#1077' '#1084#1072#1089#1090#1077#1088#1072
      Category = 0
      Hint = #1042#1089#1077' '#1084#1072#1089#1090#1077#1088#1072
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.FullFocusRect = True
      Properties.ImmediatePost = True
      Properties.OnChange = cbAllMasterPropertiesChange
      InternalEditValue = False
    end
    object cbAllSlot: TcxBarEditItem
      Caption = #1042#1089#1077' '#1089#1083#1086#1090#1099
      Category = 0
      Hint = #1042#1089#1077' '#1089#1083#1086#1090#1099
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.OnChange = cbAllSlotPropertiesChange
      InternalEditValue = False
    end
    object cbDistricts: TcxBarEditItem
      Caption = #1056#1072#1081#1086#1085#1099':'
      Category = 0
      Hint = #1056#1072#1081#1086#1085#1099
      Visible = ivAlways
      OnKeyDown = cbDistrictsKeyDown
      ShowCaption = True
      Width = 200
      PropertiesClassName = 'TcxCheckComboBoxProperties'
      Properties.EmptySelectionText = #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1086
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.EditValueFormat = cvfStatesString
      Properties.ImmediatePost = True
      Properties.Items = <>
      Properties.OnChange = cbDistrictsPropertiesChange
      Properties.OnCloseUp = cbDistrictsPropertiesCloseUp
    end
    object cbCategories: TcxBarEditItem
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080':'
      Category = 0
      Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      Visible = ivAlways
      OnKeyDown = cbCategoriesKeyDown
      ShowCaption = True
      Width = 200
      PropertiesClassName = 'TcxCheckComboBoxProperties'
      Properties.EmptySelectionText = #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1086
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.EditValueFormat = cvfStatesString
      Properties.ImmediatePost = True
      Properties.Items = <>
      Properties.OnChange = cbCategoriesPropertiesChange
      Properties.OnCloseUp = cbCategoriesPropertiesCloseUp
    end
    object cbSignalTypes: TcxBarEditItem
      Caption = #1057#1080#1075#1085#1072#1083#1100#1085#1099#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103':'
      Category = 0
      Hint = #1057#1080#1075#1085#1072#1083#1100#1085#1099#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
      Visible = ivAlways
      OnKeyDown = cbSignalTypesKeyDown
      ShowCaption = True
      Width = 200
      PropertiesClassName = 'TcxCheckComboBoxProperties'
      Properties.EmptySelectionText = #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1086
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.EditValueFormat = cvfStatesString
      Properties.ImmediatePost = True
      Properties.Items = <>
      Properties.OnChange = cbSignalTypesPropertiesChange
      Properties.OnCloseUp = cbSignalTypesPropertiesCloseUp
    end
    object bPrint: TdxBarSubItem
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      Category = 0
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100
      Visible = ivAlways
      ImageIndex = 103
      ShowCaption = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end>
    end
    object dxBarButton10: TdxBarButton
      Action = aPrintReport
      Category = 0
    end
    object cbWorkerCompany: TcxBarEditItem
      Caption = #1055#1086#1076#1088#1103#1076#1095#1080#1082#1080':'
      Category = 0
      Hint = #1055#1086#1076#1088#1103#1076#1095#1080#1082#1080':'
      Visible = ivAlways
      OnKeyDown = cbWorkerCompanyKeyDown
      ShowCaption = True
      Width = 200
      PropertiesClassName = 'TcxCheckComboBoxProperties'
      Properties.EmptySelectionText = #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1086
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.EditValueFormat = cvfStatesString
      Properties.ImmediatePost = True
      Properties.Items = <>
      Properties.OnChange = cbWorkerCompanyPropertiesChange
      Properties.OnCloseUp = cbWorkerCompanyPropertiesCloseUp
    end
    object dxBarButton11: TdxBarButton
      Action = aHistory
      Category = 0
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 304
    Top = 172
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
      Caption = #1057#1087#1080#1089#1086#1082' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099
      OnExecute = aPrintExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aRight: TAction
      Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1076#1077#1085#1100
      Hint = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1076#1077#1085#1100
      ImageIndex = 6
      OnExecute = aRightExecute
    end
    object aLeft: TAction
      Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1076#1077#1085#1100
      Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1076#1077#1085#1100
      ImageIndex = 5
      OnExecute = aLeftExecute
    end
    object aExportData: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      OnExecute = aExportDataExecute
    end
    object aPrintReport: TAction
      Caption = #1054#1090#1095#1077#1090#1085#1099#1077' '#1092#1086#1088#1084#1099
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100' '#1086#1090#1095#1077#1090#1085#1099#1077' '#1092#1086#1088#1084#1099
      OnExecute = aPrintReportExecute
    end
    object aFiles: TAction
      Caption = 'aFiles'
    end
    object aHistory: TAction
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1079#1072#1082#1072#1079#1086#1074
      Hint = #1048#1089#1090#1086#1088#1080#1103' '#1079#1072#1082#1072#1079#1086#1074
      ImageIndex = 431
      OnExecute = aHistoryExecute
    end
  end
  object qWorkList: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select OL.Closed,'
      
        '  OL.ID, OL.WorkDate, OL.WorkTime, OL.PlanTime, OL.ID_Worker, OL' +
        '.OrderDate,'
      
        '  OrderCategoryFullList(OL.ID) as Tag,  DistrictInfo(OL.ID_Distr' +
        'ict) as DistrictInfo, MetroInfo(OL.ID_Metro) as MetroInfo,'
      
        '  ST.Name as StatusInfo, ST.Color, OL.RequestText, OL.WorkCost, ' +
        'OL.Address, OL.FlatNumber, (select DefSignal from SignalType whe' +
        're ID = OL.ID_SignalType) as DefSignal'
      'from '
      '  OrderList OL, StatusType ST'
      'where'
      '  OL.Deleted = 0 and OL.OrderCategory = 1 and'
      '  Date_Format(OL.WorkDate, '#39'%Y.%m.%d'#39') = :DS and'
      '  ST.ID = OL.ID_StatusType and'
      '  (FIND_IN_SET(OL.ID_SignalType, :SList1) > 0 or :SList2 = '#39#39')'
      'order by '
      '  OL.ID_Worker, OL.WorkDate, OL.WorkTime')
    Params = <
      item
        DataType = ftWideString
        Name = 'DS'
        ParamType = ptUnknown
        Value = '2021.11.26'
      end
      item
        DataType = ftUnknown
        Name = 'SList1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SList2'
        ParamType = ptUnknown
      end>
    Left = 452
    Top = 520
    ParamData = <
      item
        DataType = ftWideString
        Name = 'DS'
        ParamType = ptUnknown
        Value = '2021.11.26'
      end
      item
        DataType = ftUnknown
        Name = 'SList1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SList2'
        ParamType = ptUnknown
      end>
  end
  object qMaster: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select'
      
        '  WorkerCategoryList(W.ID) as CatList, WorkerTagList(W.ID) as Ta' +
        'gList, W.Deleted, W.ID, WorkerInfo(W.ID) as WInfo, WorkerSurname' +
        'Name(W.ID) as WSNInfo,'
      
        '  (Select ID from OrderList where Deleted = 0 and ID_Worker = W.' +
        'ID and Date_Format(WorkDate, '#39'%Y.%m.%d'#39') = :DS limit 1) as CID,'
      '  WC.OrgType, WC.Name, WC.INN, WC.KPP, WC.OGRN,'
      '  WT.*'
      'from'
      '  Worker W'
      '  left outer join WorkerTiming WT on'
      '    WT.ID_Worker = W.ID'
      '  inner join WorkerCompany WC on'
      '    W.ID_WorkerCompany = WC.ID'
      'where'
      
        '  (Exists(select ID_WorkerClass from WorkerCategory where ID_Wor' +
        'ker = W.ID and FIND_IN_SET(ID_WorkerClass, :CList1) > 0 limit 1)' +
        ' or :CList2 = '#39#39') and'
      
        '  (Exists(select ID_District from WorkerDistrict where ID_Worker' +
        ' = W.ID and FIND_IN_SET(ID_District, :DList1) > 0 limit 1) or :D' +
        'List2 = '#39#39') and'
      '  (FIND_IN_SET(WC.ID, :WCList1) > 0 or :WCList2 = '#39#39')'
      'order by '
      '  W.Surname, W.Name, W.Patro')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CList1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CList2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DList1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DList2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WCList1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WCList2'
        ParamType = ptUnknown
      end>
    Left = 624
    Top = 362
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CList1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CList2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DList1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DList2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WCList1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WCList2'
        ParamType = ptUnknown
      end>
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
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
      'from'
      '  Enterprise E'
      '  inner join OrderList OL on'
      '   (OL.Deleted = :D or :D = 2) and ('
      '    OL.Closed = 0 or'
      
        '    OL.Closed = 1 and Date_Add(OL.CloseTime, interval E.OldOrder' +
        'Time hour) >= Now())'
      '   left join Worker W on'
      '     W.ID = OL.ID_Worker'
      'where'
      '  (OL.ID = :IDDef1) or (:IDDef2 = 0) and'
      
        '  (FIND_IN_SET(OL.ID_SignalType, :STList1) > 0 or :STList2 = '#39#39')' +
        ' and'
      
        '  (Exists(select ID_WorkerClass from WorkerCategory where ID_Wor' +
        'ker = W.ID and FIND_IN_SET(ID_WorkerClass, :CList1) > 0 limit 1)' +
        ' or :CList2 = '#39#39') and'
      
        '  (Exists(select ID_District from WorkerDistrict where ID_Worker' +
        ' = W.ID and FIND_IN_SET(ID_District, :DList1) > 0 limit 1) or :D' +
        'List2 = '#39#39')'
      'order by  '
      '  OL.ID desc')
    Params = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'IDDef1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDDef2'
        ParamType = ptUnknown
      end
      item
        DataType = ftWideString
        Name = 'STList1'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'STList2'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'CList1'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'CList2'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'DList1'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'DList2'
        ParamType = ptUnknown
        Value = #39#39
      end>
    Left = 44
    Top = 228
    ParamData = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'IDDef1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDDef2'
        ParamType = ptUnknown
      end
      item
        DataType = ftWideString
        Name = 'STList1'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'STList2'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'CList1'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'CList2'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'DList1'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'DList2'
        ParamType = ptUnknown
        Value = #39#39
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
      Alignment = taCenter
      FieldName = 'WorkTime'
      DisplayFormat = 'hh:nn'
    end
    object QueryPlanTime: TFloatField
      FieldName = 'PlanTime'
    end
    object QueryWorkCost: TFloatField
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
    object QueryNeedCallDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1074#1086#1085#1082#1072' '#1082#1083#1080#1077#1085#1090#1091
      FieldName = 'NeedCallDate'
    end
    object QueryUid: TWideStringField
      FieldName = 'Uid'
      Size = 256
    end
    object QueryCheckNumber: TWideStringField
      FieldName = 'CheckNumber'
      Size = 400
    end
    object QueryWorkDateTime: TDateTimeField
      FieldName = 'WorkDateTime'
    end
    object QueryID_DiscountPromo: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object QueryOrderNumberExt: TWideStringField
      DisplayLabel = #1042#1085#1077#1096#1085#1080#1081' '#1085#1086#1084#1077#1088
      FieldName = 'OrderNumberExt'
      ReadOnly = True
      Size = 800
    end
    object QueryPersonalAccount: TWideStringField
      DisplayLabel = #1051#1080#1094'.'#1089#1095#1077#1090'/GUID'
      FieldName = 'PersonalAccount'
      ReadOnly = True
      Size = 400
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
  object PopupMenuOrder: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        GridView = TableView
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 452
    Top = 172
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = cbAllMaster
        Properties.Strings = (
          'EditValue')
      end
      item
        Component = cbAllSlot
        Properties.Strings = (
          'EditValue')
      end>
    StorageName = 'PropertiesStore'
    Left = 168
    Top = 172
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
    Left = 504
    Top = 228
    PixelsPerInch = 96
  end
  object qExists: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select ID'
      'from OrderWork'
      'where ID_OrderList = :ID'
      'limit 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 284
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object tClient: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from CLient'
      'where Phone = :P')
    Params = <
      item
        DataType = ftUnknown
        Name = 'P'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P'
        ParamType = ptUnknown
      end>
  end
  object SchedulerHolidays: TcxSchedulerHolidays
    Locations = <>
    Left = 836
    Top = 310
  end
  object dsMaster: TDataSource
    DataSet = qMaster
    Left = 544
    Top = 364
  end
  object StyleRepository: TcxStyleRepository
    Left = 424
    Top = 362
    PixelsPerInch = 96
    object StyleWorker: TcxStyle
    end
    object StyleDateEditor: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
    end
  end
  object mdEvents: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 892
    Top = 548
    object mdEventsID: TAutoIncField
      FieldName = 'ID'
    end
    object mdEventsParentID: TIntegerField
      FieldName = 'ParentID'
    end
    object mdEventsType: TIntegerField
      FieldName = 'Type'
    end
    object mdEventsStart: TDateTimeField
      FieldName = 'Start'
    end
    object mdEventsFinish: TDateTimeField
      FieldName = 'Finish'
    end
    object mdEventsOptions: TIntegerField
      FieldName = 'Options'
    end
    object mdEventsCaption: TStringField
      FieldName = 'Caption'
      Size = 255
    end
    object mdEventsRecurrenceIndex: TIntegerField
      FieldName = 'RecurrenceIndex'
    end
    object mdEventsRecurrenceInfo: TBlobField
      FieldName = 'RecurrenceInfo'
    end
    object mdEventsResourceID: TBlobField
      FieldName = 'ResourceID'
    end
    object mdEventsLocation: TStringField
      FieldName = 'Location'
      Size = 255
    end
    object mdEventsMessage: TStringField
      FieldName = 'Message'
      Size = 255
    end
    object mdEventsReminderDate: TDateTimeField
      FieldName = 'ReminderDate'
    end
    object mdEventsReminderMinutes: TIntegerField
      FieldName = 'ReminderMinutes'
    end
    object mdEventsState: TIntegerField
      FieldName = 'State'
    end
    object mdEventsLabelColor: TIntegerField
      FieldName = 'LabelColor'
    end
    object mdEventsActualStart: TDateTimeField
      FieldName = 'ActualStart'
    end
    object mdEventsActualFinish: TDateTimeField
      FieldName = 'ActualFinish'
    end
    object mdEventsSyncIDField: TStringField
      FieldName = 'SyncIDField'
      Size = 255
    end
    object mdEventsID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object mdEventsImageIndex: TIntegerField
      FieldName = 'ImageIndex'
    end
    object mdEventsOrderTime: TStringField
      FieldName = 'OrderTime'
    end
    object mdEventsMetro: TStringField
      FieldName = 'Metro'
      Size = 100
    end
    object mdEventsDistrict: TStringField
      FieldName = 'District'
      Size = 100
    end
    object mdEventsStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object mdEventsAddress: TStringField
      FieldName = 'Address'
      Size = 200
    end
    object mdEventsCost: TFloatField
      FieldName = 'Cost'
    end
    object mdEventsRequestText: TStringField
      FieldName = 'RequestText'
      Size = 200
    end
  end
  object dsEvents: TDataSource
    DataSet = mdEvents
    Left = 824
    Top = 548
  end
  object SchedulerDBStorage: TcxSchedulerDBStorage
    UseActualTimeRange = True
    Resources.Images = UtilForm.ImageList
    Resources.Items = <
      item
        ImageIndex = 4
      end
      item
      end
      item
        ImageIndex = 4
      end
      item
        ImageIndex = 10
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    Resources.ResourceID = 'ID'
    Resources.ResourceName = 'WInfo'
    SmartRefresh = True
    CustomFields = <
      item
        FieldName = 'ID_OrderList'
      end
      item
        FieldName = 'ImageIndex'
      end
      item
        FieldName = 'OrderTime'
      end
      item
        FieldName = 'Metro'
      end
      item
        FieldName = 'District'
      end
      item
        FieldName = 'Status'
      end
      item
        FieldName = 'Address'
      end
      item
        FieldName = 'Cost'
      end
      item
        FieldName = 'RequestText'
      end>
    Holidays = SchedulerHolidays
    DataSource = dsEvents
    FieldNames.ActualFinish = 'ActualFinish'
    FieldNames.ActualStart = 'ActualStart'
    FieldNames.Caption = 'Caption'
    FieldNames.EventType = 'Type'
    FieldNames.Finish = 'Finish'
    FieldNames.ID = 'ID'
    FieldNames.LabelColor = 'LabelColor'
    FieldNames.Location = 'Location'
    FieldNames.Message = 'Message'
    FieldNames.Options = 'Options'
    FieldNames.ParentID = 'ParentID'
    FieldNames.RecurrenceIndex = 'RecurrenceIndex'
    FieldNames.RecurrenceInfo = 'RecurrenceInfo'
    FieldNames.ReminderDate = 'ReminderDate'
    FieldNames.ReminderMinutesBeforeStart = 'ReminderMinutes'
    FieldNames.ResourceID = 'ResourceID'
    FieldNames.Start = 'Start'
    FieldNames.State = 'State'
    Left = 716
    Top = 364
  end
  object mdWork: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 76
    Top = 536
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
    Left = 128
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsOrderWork: TDataSource
    DataSet = qOrderWork
    Left = 364
    Top = 520
  end
  object qOrderWork: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select  '
      
        '  OW.*, UserInfo(OW.ID_AssertUser) as AssertUser,  WorkTypeInfo(' +
        'OW.ID_WorkType) as WTInfo,'
      '  WarrantyTypeInfo(OW.WorkWarrantyType) as WTypeInfo,'
      '  WarrantyTypeShortInfo(OW.WorkWarrantyType) as WTypeShortInfo,'
      
        '  (select WC.Tag from WorkerClass WC, WorkType WT where WT.ID = ' +
        'OW.ID_WorkType and WC.ID = WT.ID_WorkerClass) as WCTag,'
      
        '  Concat(Convert(OW.WorkWarrantyTime, CHAR CHARACTER SET utf8mb4' +
        '), '#39' '#39', WarrantyTypeShortInfo(OW.WorkWarrantyType)) as Warranty,'
      
        '  Concat(Convert(OW.WorkAmount, CHAR CHARACTER SET utf8mb4), '#39' '#39 +
        ', OW.WorkUnitName) as AmountText,'
      '  OW.WorkPrice * OW.WorkAmount as WorkCost'
      'from'
      '  OrderWork OW'
      'where'
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
    Left = 280
    Top = 520
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
    object qOrderWorkWCTag: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'WCTag'
      ReadOnly = True
      Size = 8
    end
    object qOrderWorkWarranty: TWideStringField
      DisplayLabel = #1043#1072#1088#1072#1085#1090#1080#1103
      FieldName = 'Warranty'
      ReadOnly = True
      Size = 128
    end
    object qOrderWorkWorkCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'WorkCost'
      ReadOnly = True
      DisplayFormat = ',0.##'
    end
    object qOrderWorkAmountText: TWideStringField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'AmountText'
      ReadOnly = True
      Size = 172
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
    object qOrderWorkDiscountPromoDebtType: TSmallintField
      FieldName = 'DiscountPromoDebtType'
    end
    object qOrderWorkDiscountPromoSubType: TSmallintField
      FieldName = 'DiscountPromoSubType'
    end
    object qOrderWorkDiscountPromoCanAdd: TSmallintField
      FieldName = 'DiscountPromoCanAdd'
    end
    object qOrderWorkDiscountMinOrderSum: TFloatField
      FieldName = 'DiscountMinOrderSum'
    end
    object qOrderWorkDiscountPromoMinOrderSum: TFloatField
      FieldName = 'DiscountPromoMinOrderSum'
    end
  end
  object PopupMenuWork: TcxGridPopupMenu
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 588
    Top = 508
  end
  object qWorkOne: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select OL.Closed,'
      
        '  OL.ID, OL.WorkDate, OL.WorkTime, OL.PlanTime, OL.ID_Worker, OL' +
        '.OrderDate,'
      
        '  OrderCategoryFullList(OL.ID) as Tag,  DistrictInfo(OL.ID_Distr' +
        'ict) as DistrictInfo, MetroInfo(OL.ID_Metro) as MetroInfo,'
      
        '  ST.Name as StatusINfo, ST.Color, OL.RequestText, OL.Address, O' +
        'L.FlatNumber, OL.WorkCost,'
      
        '  (select DefSignal from SignalType where ID = OL.ID_SignalType)' +
        ' as DefSignal'
      'from '
      '  OrderList OL, StatusType ST'
      'where'
      '  OL.ID = :ID and'
      '  ST.ID = OL.ID_StatusType'
      'order by '
      '  OL.ID_Worker, OL.WorkDate, OL.WorkTime')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 692
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object pmEvent: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end
      item
        Visible = True
        ItemName = 'dxBarButton3'
      end>
    UseOwnFont = False
    Left = 792
    Top = 176
    PixelsPerInch = 96
  end
  object qDistrict: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from DistrictView'
      'order by Name')
    Params = <>
    Left = 160
    Top = 440
  end
  object qCategory: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkClassView'
      'order by Name')
    Params = <>
    Left = 220
    Top = 440
  end
  object CalloutPopup: TdxCalloutPopup
    Alignment = cpaRightCenter
    Rounded = True
    Left = 1028
    Top = 282
  end
  object HintStyleController: TcxHintStyleController
    Global = False
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'Tahoma'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = []
    OnShowHint = HintStyleControllerShowHint
    Left = 1028
    Top = 218
  end
  object UpdateTimer: TTimer
    Enabled = False
    OnTimer = UpdateTimerTimer
    Left = 932
    Top = 142
  end
  object dsWorkList: TDataSource
    DataSet = qWorkList
    Left = 504
    Top = 504
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.xlsx'
    FileName = 'ExportData'
    Filter = #1060#1072#1081#1083#1099' Excel|*.xlsx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 672
    Top = 204
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = LeadGrid
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = dxBarPopupMenu
      end>
    Left = 544
    Top = 172
  end
  object DetailTimer: TTimer
    Enabled = False
    OnTimer = DetailTimerTimer
    Left = 932
    Top = 202
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
    Left = 280
    Top = 568
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
    Left = 368
    Top = 568
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
    Left = 128
    Top = 584
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
    Left = 76
    Top = 584
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
end
