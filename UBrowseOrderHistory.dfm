object BrowseOrderHistForm: TBrowseOrderHistForm
  Left = 305
  Top = 172
  Action = MainForm.aaBrowseOrderArch
  Caption = #1040#1088#1093#1080#1074' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 716
  ClientWidth = 1240
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
    Top = 699
    Width = 1240
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object pOrder: TPanel
    Left = 0
    Top = 50
    Width = 1240
    Height = 649
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 1240
      Height = 448
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.ScrollbarMode = sbmDefault
      object TableView: TcxGridDBBandedTableView
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
        DataController.DataSource = dsOrderList
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DateTimeHandling.IgnoreTimeForFiltering = True
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
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.BandHeaders = False
        Bands = <
          item
            Caption = #1044#1077#1081#1089#1090#1074#1080#1077
            FixedKind = fkLeft
            Options.HoldOwnColumnsOnly = True
          end
          item
            Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
            Options.HoldOwnColumnsOnly = True
          end>
        object TableViewActionDateTime: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ActionDateTime'
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object TableViewID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID'
          Width = 100
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object TableViewID_OrderList: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
          DataBinding.FieldName = 'ID_OrderList'
          Width = 100
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object TableViewDeleted: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Deleted'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object TableViewClosed: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Closed'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object TableViewCancelled: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Cancelled'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object TableViewOCInfo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'OCInfo'
          Options.FilterRowOperator = foContains
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object TableViewAddTime: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AddTime'
          Position.BandIndex = 1
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object TableViewAddUser: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AddUser'
          Options.FilterRowOperator = foContains
          Width = 120
          Position.BandIndex = 1
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object TableViewAssertTime: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AssertTime'
          Width = 117
          Position.BandIndex = 1
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object TableViewAssertUser: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AssertUser'
          Options.FilterRowOperator = foContains
          Width = 120
          Position.BandIndex = 1
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object TableViewRequestText: TcxGridDBBandedColumn
          DataBinding.FieldName = 'RequestText'
          Options.FilterRowOperator = foContains
          Width = 200
          Position.BandIndex = 1
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object TableViewName: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Name'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object TableViewIsClientDOMSPB: TcxGridDBBandedColumn
          DataBinding.FieldName = 'IsClientDOMSPB'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Width = 110
          Position.BandIndex = 1
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object TableViewPhone: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Phone'
          Options.FilterRowOperator = foContains
          Position.BandIndex = 1
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object TableViewAddress: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Address'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 12
          Position.RowIndex = 0
        end
        object TableViewFlatNumber: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FlatNumber'
          Options.FilterRowOperator = foContains
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 13
          Position.RowIndex = 0
        end
        object TableViewClientDateTime: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ClientDateTime'
          Width = 132
          Position.BandIndex = 1
          Position.ColIndex = 14
          Position.RowIndex = 0
        end
        object TableViewClientComment: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ClientComment'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 15
          Position.RowIndex = 0
        end
        object TableViewWInfo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WInfo'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 16
          Position.RowIndex = 0
        end
        object TableViewWorkDate: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkDate'
          Position.BandIndex = 1
          Position.ColIndex = 17
          Position.RowIndex = 0
        end
        object TableViewWorkTime: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkTime'
          Position.BandIndex = 1
          Position.ColIndex = 18
          Position.RowIndex = 0
        end
        object TableViewPlanTime: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PlanTime'
          Width = 80
          Position.BandIndex = 1
          Position.ColIndex = 19
          Position.RowIndex = 0
        end
        object TableViewWorkCost: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkCost'
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 20
          Position.RowIndex = 0
        end
        object TableViewSourceInfo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SourceInfo'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 23
          Position.RowIndex = 0
        end
        object TableViewSignalInfo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SignalInfo'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 24
          Position.RowIndex = 0
        end
        object TableViewStatusInfo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'StatusInfo'
          Options.FilterRowOperator = foContains
          Width = 120
          Position.BandIndex = 1
          Position.ColIndex = 25
          Position.RowIndex = 0
        end
        object TableViewStatusComment: TcxGridDBBandedColumn
          DataBinding.FieldName = 'StatusComment'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 26
          Position.RowIndex = 0
        end
        object TableViewReasonInfo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ReasonInfo'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 27
          Position.RowIndex = 0
        end
        object TableViewPayed: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Payed'
          Position.BandIndex = 1
          Position.ColIndex = 28
          Position.RowIndex = 0
        end
        object TableViewPFInfo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PFInfo'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 29
          Position.RowIndex = 0
        end
        object TableViewCloseTime: TcxGridDBBandedColumn
          DataBinding.FieldName = 'CloseTime'
          Position.BandIndex = 1
          Position.ColIndex = 31
          Position.RowIndex = 0
        end
        object TableViewCheckNumber: TcxGridDBBandedColumn
          DataBinding.FieldName = 'CheckNumber'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 30
          Position.RowIndex = 0
        end
        object TableViewOrderNumberExt: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072' '#1074#1085#1077#1096#1085#1080#1081
          DataBinding.FieldName = 'OrderNumberExt'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 32
          Position.RowIndex = 0
        end
        object TableViewPersonalAccount: TcxGridDBBandedColumn
          Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
          DataBinding.FieldName = 'PersonalAccount'
          Options.FilterRowOperator = foContains
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 33
          Position.RowIndex = 0
        end
        object TableViewMaterialCost: TcxGridDBBandedColumn
          DataBinding.FieldName = 'MaterialCost'
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 21
          Position.RowIndex = 0
        end
        object TableViewFullCost: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FullCost'
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 22
          Position.RowIndex = 0
        end
      end
      object Level: TcxGridLevel
        GridView = TableView
      end
    end
    object GridOne: TcxGrid
      Left = 0
      Top = 456
      Width = 1240
      Height = 193
      Align = alBottom
      Constraints.MinHeight = 1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.ScrollbarMode = sbmDefault
      object TableViewOne: TcxGridDBBandedTableView
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
        DataController.DataSource = dsOne
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        FilterRow.OperatorCustomization = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.BandHeaders = False
        Styles.OnGetContentStyle = TableViewStylesGetContentStyle
        Bands = <
          item
            Caption = #1044#1077#1081#1089#1090#1074#1080#1077
            FixedKind = fkLeft
            Options.HoldOwnColumnsOnly = True
          end
          item
            Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
            Options.HoldOwnColumnsOnly = True
          end>
        object cxGridDBBandedColumn1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ActionDateTime'
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn2: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID'
          Width = 100
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn3: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
          DataBinding.FieldName = 'ID_OrderList'
          Width = 100
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn4: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Deleted'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn5: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Closed'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object TableViewOneCancelled: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Cancelled'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn6: TcxGridDBBandedColumn
          DataBinding.FieldName = 'OCInfo'
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn7: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AddTime'
          Position.BandIndex = 1
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn8: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AddUser'
          Width = 120
          Position.BandIndex = 1
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn9: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AssertTime'
          Width = 117
          Position.BandIndex = 1
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn10: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AssertUser'
          Width = 120
          Position.BandIndex = 1
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn11: TcxGridDBBandedColumn
          DataBinding.FieldName = 'RequestText'
          Width = 200
          Position.BandIndex = 1
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn12: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Name'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn13: TcxGridDBBandedColumn
          DataBinding.FieldName = 'IsClientDOMSPB'
          RepositoryItem = Datas.EditRepositoryIntCheckBox
          Width = 110
          Position.BandIndex = 1
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn14: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Phone'
          Position.BandIndex = 1
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn15: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Address'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 12
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn16: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FlatNumber'
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 13
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn18: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ClientDateTime'
          Width = 132
          Position.BandIndex = 1
          Position.ColIndex = 14
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn19: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ClientComment'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 15
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn20: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WInfo'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 16
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn21: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkDate'
          Position.BandIndex = 1
          Position.ColIndex = 17
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn22: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkTime'
          Position.BandIndex = 1
          Position.ColIndex = 18
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn23: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PlanTime'
          Width = 80
          Position.BandIndex = 1
          Position.ColIndex = 19
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn24: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkCost'
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 20
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn25: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SourceInfo'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 23
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn26: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SignalInfo'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 24
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn27: TcxGridDBBandedColumn
          DataBinding.FieldName = 'StatusInfo'
          Width = 120
          Position.BandIndex = 1
          Position.ColIndex = 25
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn28: TcxGridDBBandedColumn
          DataBinding.FieldName = 'StatusComment'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 26
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn29: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ReasonInfo'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 27
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn30: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Payed'
          Position.BandIndex = 1
          Position.ColIndex = 28
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn31: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PFInfo'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 29
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn32: TcxGridDBBandedColumn
          DataBinding.FieldName = 'CloseTime'
          Position.BandIndex = 1
          Position.ColIndex = 31
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn33: TcxGridDBBandedColumn
          DataBinding.FieldName = 'CheckNumber'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 30
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn34: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072' '#1074#1085#1077#1096#1085#1080#1081
          DataBinding.FieldName = 'OrderNumberExt'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 32
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn35: TcxGridDBBandedColumn
          Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
          DataBinding.FieldName = 'PersonalAccount'
          Width = 150
          Position.BandIndex = 1
          Position.ColIndex = 33
          Position.RowIndex = 0
        end
        object TableViewOneMaterialCost: TcxGridDBBandedColumn
          DataBinding.FieldName = 'MaterialCost'
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 21
          Position.RowIndex = 0
        end
        object TableViewOneFullCost: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FullCost'
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 22
          Position.RowIndex = 0
        end
      end
      object LevelOne: TcxGridLevel
        GridView = TableViewOne
      end
    end
    object SplitterClient: TcxSplitter
      Left = 0
      Top = 448
      Width = 1240
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salBottom
      ResizeUpdate = True
      Control = GridOne
    end
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = StyleChanged
        Properties.Strings = (
          'Color')
      end>
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
      Visible = False
    end
    object aUndoDelete: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      ImageIndex = 419
      Visible = False
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
          ItemName = 'eHistoryColor'
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
    object eHistoryColor: TcxBarEditItem
      Caption = #1062#1074#1077#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1081':'
      Category = 0
      Hint = #1062#1074#1077#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1081':'
      Visible = ivAlways
      ShowCaption = True
      Width = 150
      PropertiesClassName = 'TcxColorComboBoxProperties'
      Properties.AllowSelectColor = True
      Properties.CustomColors = <
        item
          Color = 12771582
        end>
      Properties.DefaultDescription = #1062#1074#1077#1090' '#1085#1077' '#1091#1082#1072#1079#1072#1085
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.NamingConvention = cxncX11
      Properties.PrepareList = cxplX11
      Properties.ShowDescriptions = False
      Properties.OnChange = cxBarEditItem1PropertiesChange
      InternalEditValue = 12771582
    end
  end
  object dsOrderList: TDataSource
    DataSet = qOrderList
    Left = 36
    Top = 136
  end
  object qOrderList: TZQuery
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
      'from  OrderList_H OL, Enterprise E'
      'where'
      
        '  ((Date_Format(OL.ActionDateTime, '#39'%Y.%m.%d'#39') >= :FD) or (:FD =' +
        ' '#39#39')) and'
      
        '  ((Date_Format(OL.ActionDateTime, '#39'%Y.%m.%d'#39') <= :TD) or (:TD =' +
        ' '#39#39'))'
      'order by  '
      '  OL.ActionDateTime')
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
    object qOrderListDeleted: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object qOrderListID_AddUser: TSmallintField
      FieldName = 'ID_AddUser'
    end
    object qOrderListAddUser: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'AddUser'
      ReadOnly = True
      Size = 50
    end
    object qOrderListAddTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'AddTime'
    end
    object qOrderListID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object qOrderListAssertEmployee: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object qOrderListAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object qOrderListRequestText: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1079#1072#1082#1072#1079#1091
      FieldName = 'RequestText'
      Size = 500
    end
    object qOrderListOrderNUmber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderNUmber'
    end
    object qOrderListOrderDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderDate'
    end
    object qOrderListOrderCategory: TSmallintField
      FieldName = 'OrderCategory'
    end
    object qOrderListClosed: TSmallintField
      DisplayLabel = #1047#1072#1082#1088#1099#1090#1072
      FieldName = 'Closed'
    end
    object qOrderListID_Client: TIntegerField
      FieldName = 'ID_Client'
    end
    object qOrderListPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'Phone'
    end
    object qOrderListAddress: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'Address'
      Size = 200
    end
    object qOrderListID_StatusType: TSmallintField
      FieldName = 'ID_StatusType'
    end
    object qOrderListID_SignalType: TSmallintField
      FieldName = 'ID_SignalType'
    end
    object qOrderListID_SourceType: TSmallintField
      FieldName = 'ID_SourceType'
    end
    object qOrderListID_Distrinct: TSmallintField
      FieldName = 'ID_District'
    end
    object qOrderListID_Metro: TSmallintField
      FieldName = 'ID_Metro'
    end
    object qOrderListFiles: TSmallintField
      DisplayLabel = #1045#1089#1090#1100' '#1092#1072#1081#1083#1099
      FieldName = 'Files'
    end
    object qOrderListID_PaymentForm: TSmallintField
      FieldName = 'ID_PaymentForm'
    end
    object qOrderListID_Worker: TSmallintField
      FieldName = 'ID_Worker'
    end
    object qOrderListWorkDate: TDateTimeField
      DisplayLabel = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
      FieldName = 'WorkDate'
    end
    object qOrderListWorkTime: TDateTimeField
      DisplayLabel = #1055#1083#1072#1085#1086#1074#1086#1077' '#1074#1088#1077#1084#1103
      FieldName = 'WorkTime'
      DisplayFormat = 'hh:nn'
    end
    object qOrderListPlanTime: TFloatField
      DisplayLabel = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
      FieldName = 'PlanTime'
    end
    object qOrderListWorkCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1088#1072#1073#1086#1090
      FieldName = 'WorkCost'
      DisplayFormat = ',0.##'
    end
    object qOrderListWInfo: TWideStringField
      DisplayLabel = #1052#1072#1089#1090#1077#1088
      FieldName = 'WInfo'
      ReadOnly = True
      Size = 100
    end
    object qOrderListOCInfo: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OCInfo'
      ReadOnly = True
    end
    object qOrderListFlatNumber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1072#1088#1090#1080#1088#1099
      FieldName = 'FlatNumber'
      Size = 50
    end
    object qOrderListName: TWideStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'Name'
      Size = 150
    end
    object qOrderListIsClientDOMSPB: TSmallintField
      DisplayLabel = #1050#1083#1080#1077#1085#1090' '#1044#1054#1052' '#1057#1055#1073
      FieldName = 'IsClientDOMSPB'
      ReadOnly = True
    end
    object qOrderListClientComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientComment'
      ReadOnly = True
      Size = 200
    end
    object qOrderListClientDateTime: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientDateTime'
      ReadOnly = True
    end
    object qOrderListStatusComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1090#1072#1090#1091#1089#1091
      FieldName = 'StatusComment'
      ReadOnly = True
      Size = 200
    end
    object qOrderListPayed: TSmallintField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'Payed'
      ReadOnly = True
    end
    object qOrderListStatusInfo: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'StatusInfo'
      ReadOnly = True
      Size = 50
    end
    object qOrderListSignalInfo: TWideStringField
      DisplayLabel = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'SignalInfo'
      ReadOnly = True
      Size = 50
    end
    object qOrderListPFInfo: TWideStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PFInfo'
      ReadOnly = True
      Size = 50
    end
    object qOrderListSourceInfo: TWideStringField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'SourceInfo'
      ReadOnly = True
      Size = 50
    end
    object qOrderListID_Reason: TSmallintField
      FieldName = 'ID_Reason'
    end
    object qOrderListReasonInfo: TWideStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldName = 'ReasonInfo'
      ReadOnly = True
      Size = 50
    end
    object qOrderListHideTime: TDateTimeField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1085#1072' '#1076#1086
      FieldName = 'HideTime'
      ReadOnly = True
    end
    object qOrderListCloseTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'CloseTime'
    end
    object qOrderListWorkDateTime: TDateTimeField
      FieldName = 'WorkDateTime'
    end
    object qOrderListNeedCallDate: TDateTimeField
      FieldName = 'NeedCallDate'
    end
    object qOrderListCheckNumber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1095#1077#1082#1072
      FieldName = 'CheckNumber'
      Size = 400
    end
    object qOrderListID_DiscountPromo: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object qOrderListUid: TWideStringField
      FieldName = 'Uid'
      Size = 256
    end
    object qOrderListOrderNumberExt: TWideStringField
      FieldName = 'OrderNumberExt'
      Size = 800
    end
    object qOrderListPersonalAccount: TWideStringField
      FieldName = 'PersonalAccount'
      Size = 400
    end
    object qOrderListID: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1087#1080#1089#1080
      FieldName = 'ID'
      Required = True
    end
    object qOrderListActionDateTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'ActionDateTime'
    end
    object qOrderListID_OrderList: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1081
      FieldName = 'ID_OrderList'
    end
    object qOrderListCancelled: TSmallintField
      DisplayLabel = #1054#1090#1084#1077#1085#1077#1085#1072
      FieldName = 'Cancelled'
    end
    object qOrderListMaterialCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      FieldName = 'MaterialCost'
      DisplayFormat = ',0.##'
    end
    object qOrderListFullCost: TFloatField
      DisplayLabel = #1042#1089#1077#1075#1086
      FieldName = 'FullCost'
      DisplayFormat = ',0.##'
    end
  end
  object PopupMenu: TcxGridPopupMenu
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 592
    Top = 136
  end
  object StyleRepository: TcxStyleRepository
    Left = 752
    Top = 188
    PixelsPerInch = 96
    object StyleChanged: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 12771582
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object qOne: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      
        'select Date_Add(OL.CloseTime, interval E.OldOrderTime hour) as H' +
        'ideTime,'
      
        '  OL.*, UserInfo(OL.ID_AssertUser) as AssertUser, UserInfo(OL.ID' +
        '_AddUser) as AddUser,'
      
        '  WorkerInfo(OL.ID_Worker) as WInfo, OrderCategoryInfo(OL.OrderC' +
        'ategory) as OCInfo,'
      
        '  StatusTypeInfo(OL.ID_StatusType) as StatusInfo, SignalTypeInfo' +
        '(OL.ID_SignalType) as SignalInfo, ReasonInfo(OL.ID_Reason) as Re' +
        'asonInfo,'
      
        '  PaymentFormInfo(OL.ID_PaymentForm) as PFInfo, SourceTypeInfo(O' +
        'L.ID_SourceType) as SourceInfo'
      'from  OrderList_H OL, Enterprise E'
      'where'
      '  OL.ID_OrderList = :ID_OrderList'
      'order by'
      '  OL.ActionDateTime')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_OrderList'
        ParamType = ptUnknown
      end>
    DataSource = dsOrderList
    Left = 140
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_OrderList'
        ParamType = ptUnknown
      end>
    object SmallintField1: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object SmallintField2: TSmallintField
      FieldName = 'ID_AddUser'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'AddUser'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'AddTime'
    end
    object SmallintField3: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object WideStringField2: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object WideStringField3: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1079#1072#1082#1072#1079#1091
      FieldName = 'RequestText'
      Size = 500
    end
    object WideStringField4: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderNUmber'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderDate'
    end
    object SmallintField4: TSmallintField
      FieldName = 'OrderCategory'
    end
    object SmallintField5: TSmallintField
      DisplayLabel = #1047#1072#1082#1088#1099#1090#1072
      FieldName = 'Closed'
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID_Client'
    end
    object WideStringField5: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'Phone'
    end
    object WideStringField6: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'Address'
      Size = 200
    end
    object SmallintField6: TSmallintField
      FieldName = 'ID_StatusType'
    end
    object SmallintField7: TSmallintField
      FieldName = 'ID_SignalType'
    end
    object SmallintField8: TSmallintField
      FieldName = 'ID_SourceType'
    end
    object SmallintField9: TSmallintField
      FieldName = 'ID_District'
    end
    object SmallintField10: TSmallintField
      FieldName = 'ID_Metro'
    end
    object SmallintField11: TSmallintField
      DisplayLabel = #1045#1089#1090#1100' '#1092#1072#1081#1083#1099
      FieldName = 'Files'
    end
    object SmallintField12: TSmallintField
      FieldName = 'ID_PaymentForm'
    end
    object SmallintField13: TSmallintField
      FieldName = 'ID_Worker'
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
      FieldName = 'WorkDate'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = #1055#1083#1072#1085#1086#1074#1086#1077' '#1074#1088#1077#1084#1103
      FieldName = 'WorkTime'
      DisplayFormat = 'hh:nn'
    end
    object FloatField1: TFloatField
      DisplayLabel = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
      FieldName = 'PlanTime'
    end
    object FloatField2: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1088#1072#1073#1086#1090
      FieldName = 'WorkCost'
      DisplayFormat = ',0.##'
    end
    object WideStringField7: TWideStringField
      DisplayLabel = #1052#1072#1089#1090#1077#1088
      FieldName = 'WInfo'
      ReadOnly = True
      Size = 100
    end
    object WideStringField8: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OCInfo'
      ReadOnly = True
    end
    object WideStringField9: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1072#1088#1090#1080#1088#1099
      FieldName = 'FlatNumber'
      Size = 50
    end
    object WideStringField10: TWideStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'Name'
      Size = 150
    end
    object SmallintField14: TSmallintField
      DisplayLabel = #1050#1083#1080#1077#1085#1090' '#1044#1054#1052' '#1057#1055#1073
      FieldName = 'IsClientDOMSPB'
      ReadOnly = True
    end
    object WideStringField11: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientComment'
      ReadOnly = True
      Size = 200
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientDateTime'
      ReadOnly = True
    end
    object WideStringField12: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1090#1072#1090#1091#1089#1091
      FieldName = 'StatusComment'
      ReadOnly = True
      Size = 200
    end
    object SmallintField15: TSmallintField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'Payed'
      ReadOnly = True
    end
    object WideStringField13: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'StatusInfo'
      ReadOnly = True
      Size = 50
    end
    object WideStringField14: TWideStringField
      DisplayLabel = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'SignalInfo'
      ReadOnly = True
      Size = 50
    end
    object WideStringField15: TWideStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PFInfo'
      ReadOnly = True
      Size = 50
    end
    object WideStringField16: TWideStringField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'SourceInfo'
      ReadOnly = True
      Size = 50
    end
    object SmallintField16: TSmallintField
      FieldName = 'ID_Reason'
    end
    object WideStringField17: TWideStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldName = 'ReasonInfo'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1085#1072' '#1076#1086
      FieldName = 'HideTime'
      ReadOnly = True
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'CloseTime'
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'WorkDateTime'
    end
    object DateTimeField10: TDateTimeField
      FieldName = 'NeedCallDate'
    end
    object WideStringField18: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1095#1077#1082#1072
      FieldName = 'CheckNumber'
      Size = 400
    end
    object SmallintField17: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object WideStringField19: TWideStringField
      FieldName = 'Uid'
      Size = 256
    end
    object WideStringField20: TWideStringField
      FieldName = 'OrderNumberExt'
      Size = 800
    end
    object WideStringField21: TWideStringField
      FieldName = 'PersonalAccount'
      Size = 400
    end
    object LargeintField1: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1087#1080#1089#1080
      FieldName = 'ID'
      Required = True
    end
    object DateTimeField11: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'ActionDateTime'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1081
      FieldName = 'ID_OrderList'
    end
    object qOneCancelled: TSmallintField
      DisplayLabel = #1054#1090#1084#1077#1085#1077#1085#1072
      FieldName = 'Cancelled'
    end
    object qOneMaterialCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      FieldName = 'MaterialCost'
      DisplayFormat = ',0.##'
    end
    object qOneFullCost: TFloatField
      DisplayLabel = #1042#1089#1077#1075#1086
      FieldName = 'FullCost'
      DisplayFormat = ',0.##'
    end
  end
  object dsOne: TDataSource
    DataSet = qOne
    Left = 80
    Top = 312
  end
end
