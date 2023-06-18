object BrowseOrderHistorySimpleForm: TBrowseOrderHistorySimpleForm
  Left = 305
  Top = 172
  Hint = #1040#1088#1093#1080#1074' '#1079#1072#1082#1072#1079#1086#1074
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1040#1088#1093#1080#1074' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 615
  ClientWidth = 1193
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
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
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 50
    Width = 1193
    Height = 548
    Align = alClient
    TabOrder = 5
    Properties.ActivePage = tsAddress
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 548
    ClientRectRight = 1193
    ClientRectTop = 24
    object tsClient: TcxTabSheet
      Caption = #1050#1083#1080#1077#1085#1090
      ImageIndex = 0
      object GridClient: TcxGrid
        Left = 0
        Top = 0
        Width = 1193
        Height = 338
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.ScrollbarMode = sbmDefault
        object TableViewClient: TcxGridDBTableView
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
          OnFocusedRecordChanged = TableViewClientFocusedRecordChanged
          DataController.DataSource = dsClient
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
          object TableViewClientDeleted: TcxGridDBColumn
            DataBinding.FieldName = 'Deleted'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
          end
          object TableViewClientClosed: TcxGridDBColumn
            DataBinding.FieldName = 'Closed'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
          end
          object TableViewClientID: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'ID'
          end
          object TableViewClientStatusInfo: TcxGridDBColumn
            DataBinding.FieldName = 'StatusInfo'
            Options.FilterRowOperator = foContains
            Width = 120
          end
          object TableViewClientAddTime: TcxGridDBColumn
            DataBinding.FieldName = 'AddTime'
          end
          object TableViewClientAddUser: TcxGridDBColumn
            DataBinding.FieldName = 'AddUser'
            Options.FilterRowOperator = foContains
            Width = 100
          end
          object TableViewClientAssertTime: TcxGridDBColumn
            DataBinding.FieldName = 'AssertTime'
            Visible = False
          end
          object TableViewClientAssertUser: TcxGridDBColumn
            DataBinding.FieldName = 'AssertUser'
            Visible = False
            Width = 100
          end
          object TableViewClientOrderNUmber: TcxGridDBColumn
            DataBinding.FieldName = 'OrderNUmber'
            Visible = False
          end
          object TableViewClientOrderDate: TcxGridDBColumn
            DataBinding.FieldName = 'OrderDate'
            Visible = False
          end
          object TableViewClientOCInfo: TcxGridDBColumn
            DataBinding.FieldName = 'OCInfo'
            Visible = False
          end
          object TableViewClientRequestText: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1082' '#1079#1072#1082#1072#1079#1091
            DataBinding.FieldName = 'RequestText'
            Options.FilterRowOperator = foContains
            Width = 200
          end
          object TableViewClientName: TcxGridDBColumn
            Caption = #1048#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
            DataBinding.FieldName = 'Name'
            Options.FilterRowOperator = foContains
            Width = 150
          end
          object TableViewClientIsClientDOMSPB: TcxGridDBColumn
            Caption = #1050#1083#1080#1077#1085#1090' '#1044#1054#1052' '#1057#1055#1073
            DataBinding.FieldName = 'IsClientDOMSPB'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Width = 103
          end
          object TableViewClientPhone: TcxGridDBColumn
            DataBinding.FieldName = 'Phone'
          end
          object TableViewClientAddress: TcxGridDBColumn
            DataBinding.FieldName = 'Address'
            Options.FilterRowOperator = foContains
            Width = 200
          end
          object TableViewClientWInfo: TcxGridDBColumn
            Caption = #1052#1072#1089#1090#1077#1088
            DataBinding.FieldName = 'WInfo'
            Width = 150
          end
          object TableViewClientWorkDate: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
            DataBinding.FieldName = 'WorkDate'
          end
          object TableViewClientWorkTime: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1086#1077' '#1074#1088#1077#1084#1103
            DataBinding.FieldName = 'WorkTime'
          end
          object TableViewClientFlatNumber: TcxGridDBColumn
            DataBinding.FieldName = 'FlatNumber'
            Visible = False
            Width = 93
          end
          object TableViewClientClientComment: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1082' '#1072#1076#1088#1077#1089#1091
            DataBinding.FieldName = 'ClientComment'
            Visible = False
            Width = 200
          end
          object TableViewClientFiles: TcxGridDBColumn
            DataBinding.FieldName = 'Files'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
            Width = 75
          end
          object TableViewClientClientDateTime: TcxGridDBColumn
            DataBinding.FieldName = 'ClientDateTime'
            Visible = False
          end
          object TableViewClientPlanTime: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
            DataBinding.FieldName = 'PlanTime'
            Visible = False
            Width = 88
          end
          object TableViewClientWorkCost: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'WorkCost'
            OnGetDisplayText = TableViewClientWorkCostGetDisplayText
          end
          object TableViewClientSignalInfo: TcxGridDBColumn
            DataBinding.FieldName = 'SignalInfo'
            Width = 120
          end
          object TableViewClientReasonInfo: TcxGridDBColumn
            DataBinding.FieldName = 'ReasonInfo'
            Visible = False
            Width = 120
          end
          object TableViewClientStatusComment: TcxGridDBColumn
            DataBinding.FieldName = 'StatusComment'
            Visible = False
            Width = 200
          end
          object TableViewClientSourceInfo: TcxGridDBColumn
            DataBinding.FieldName = 'SourceInfo'
            Visible = False
            Width = 150
          end
          object TableViewClientPFInfo: TcxGridDBColumn
            DataBinding.FieldName = 'PFInfo'
            Visible = False
            Width = 120
          end
          object TableViewClientPayed: TcxGridDBColumn
            DataBinding.FieldName = 'Payed'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
          end
          object TableViewClientHideTime: TcxGridDBColumn
            DataBinding.FieldName = 'HideTime'
            Visible = False
          end
          object TableViewClientCloseTime: TcxGridDBColumn
            DataBinding.FieldName = 'CloseTime'
            Visible = False
          end
        end
        object LevelClient: TcxGridLevel
          GridView = TableViewClient
        end
      end
      object SplitterWorks: TcxSplitter
        Left = 0
        Top = 338
        Width = 1193
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = gbWorksClient
      end
      object gbWorksClient: TcxGroupBox
        Left = 0
        Top = 346
        Align = alBottom
        Caption = #1056#1072#1073#1086#1090#1099' '#1087#1086' '#1079#1072#1082#1072#1079#1091':'
        Constraints.MinHeight = 1
        TabOrder = 2
        Height = 178
        Width = 1193
        object GridClientWork: TcxGrid
          Left = 2
          Top = 18
          Width = 1189
          Height = 158
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.ScrollbarMode = sbmDefault
          object ViewClientWork: TcxGridDBTableView
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
            OnFocusedRecordChanged = ViewClientWorkFocusedRecordChanged
            DataController.DataSource = dsOrderWorkClient
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.##'
                Kind = skSum
                Column = ViewClientWorkWorkCost
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
            object ViewClientWorkWorkCode: TcxGridDBColumn
              DataBinding.FieldName = 'WorkCode'
              Options.FilterRowOperator = foContains
              Width = 100
            end
            object ViewClientWorkWCTag: TcxGridDBColumn
              DataBinding.FieldName = 'WCTag'
              Options.FilterRowOperator = foContains
              Width = 100
            end
            object ViewClientWorkWorkName: TcxGridDBColumn
              DataBinding.FieldName = 'WorkName'
              Options.FilterRowOperator = foContains
              Width = 500
            end
            object ViewClientWorkWorkAmount: TcxGridDBColumn
              DataBinding.FieldName = 'WorkAmount'
              Width = 100
            end
            object ViewClientWorkWorkPrice: TcxGridDBColumn
              DataBinding.FieldName = 'WorkPrice'
              Width = 100
            end
            object ViewClientWorkWorkCost: TcxGridDBColumn
              DataBinding.FieldName = 'WorkCost'
              Width = 100
            end
            object ViewClientWorkWarranty: TcxGridDBColumn
              DataBinding.FieldName = 'Warranty'
              Width = 100
            end
          end
          object LevelClientWork: TcxGridLevel
            GridView = ViewClientWork
          end
        end
      end
    end
    object tsAddress: TcxTabSheet
      Caption = #1040#1076#1088#1077#1089
      ImageIndex = 1
      object GridAddress: TcxGrid
        Left = 0
        Top = 0
        Width = 1193
        Height = 338
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.ScrollbarMode = sbmDefault
        object TableViewAddress: TcxGridDBTableView
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
          OnFocusedRecordChanged = TableViewClientFocusedRecordChanged
          DataController.DataSource = dsAddress
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
          Styles.OnGetContentStyle = TableViewAddressStylesGetContentStyle
          object TableViewAddressDeleted: TcxGridDBColumn
            DataBinding.FieldName = 'Deleted'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'Closed'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'ID'
          end
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'StatusInfo'
            Options.FilterRowOperator = foContains
            Width = 120
          end
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'AddTime'
          end
          object cxGridDBColumn6: TcxGridDBColumn
            DataBinding.FieldName = 'AddUser'
            Options.FilterRowOperator = foContains
            Width = 100
          end
          object cxGridDBColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'AssertTime'
            Visible = False
          end
          object cxGridDBColumn8: TcxGridDBColumn
            DataBinding.FieldName = 'AssertUser'
            Visible = False
            Width = 100
          end
          object cxGridDBColumn9: TcxGridDBColumn
            DataBinding.FieldName = 'OrderNUmber'
            Visible = False
          end
          object cxGridDBColumn10: TcxGridDBColumn
            DataBinding.FieldName = 'OrderDate'
            Visible = False
          end
          object cxGridDBColumn11: TcxGridDBColumn
            DataBinding.FieldName = 'OCInfo'
            Visible = False
          end
          object cxGridDBColumn13: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1082' '#1079#1072#1082#1072#1079#1091
            DataBinding.FieldName = 'RequestText'
            Options.FilterRowOperator = foContains
            Width = 200
          end
          object cxGridDBColumn14: TcxGridDBColumn
            Caption = #1048#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
            DataBinding.FieldName = 'Name'
            Options.FilterRowOperator = foContains
            Width = 150
          end
          object cxGridDBColumn15: TcxGridDBColumn
            Caption = #1050#1083#1080#1077#1085#1090' '#1044#1054#1052' '#1057#1055#1073
            DataBinding.FieldName = 'IsClientDOMSPB'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Width = 103
          end
          object cxGridDBColumn12: TcxGridDBColumn
            DataBinding.FieldName = 'Phone'
          end
          object cxGridDBColumn16: TcxGridDBColumn
            DataBinding.FieldName = 'Address'
            Options.FilterRowOperator = foContains
            Width = 200
          end
          object cxGridDBColumn17: TcxGridDBColumn
            Caption = #1052#1072#1089#1090#1077#1088
            DataBinding.FieldName = 'WInfo'
            Width = 150
          end
          object cxGridDBColumn18: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
            DataBinding.FieldName = 'WorkDate'
          end
          object cxGridDBColumn19: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1086#1077' '#1074#1088#1077#1084#1103
            DataBinding.FieldName = 'WorkTime'
          end
          object cxGridDBColumn20: TcxGridDBColumn
            DataBinding.FieldName = 'FlatNumber'
            Visible = False
            Width = 93
          end
          object cxGridDBColumn21: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1082' '#1072#1076#1088#1077#1089#1091
            DataBinding.FieldName = 'ClientComment'
            Visible = False
            Width = 200
          end
          object cxGridDBColumn22: TcxGridDBColumn
            DataBinding.FieldName = 'Files'
            RepositoryItem = Datas.EditRepositoryIntCheckBox
            Visible = False
            Width = 75
          end
          object cxGridDBColumn23: TcxGridDBColumn
            DataBinding.FieldName = 'ClientDateTime'
            Visible = False
          end
          object cxGridDBColumn24: TcxGridDBColumn
            Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
            DataBinding.FieldName = 'PlanTime'
            Visible = False
            Width = 88
          end
          object cxGridDBColumn25: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'WorkCost'
            OnGetDisplayText = TableViewClientWorkCostGetDisplayText
          end
          object cxGridDBColumn26: TcxGridDBColumn
            DataBinding.FieldName = 'SignalInfo'
            Width = 120
          end
          object cxGridDBColumn27: TcxGridDBColumn
            DataBinding.FieldName = 'ReasonInfo'
            Visible = False
            Width = 120
          end
          object cxGridDBColumn28: TcxGridDBColumn
            DataBinding.FieldName = 'StatusComment'
            Visible = False
            Width = 200
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
        object LevelAddress: TcxGridLevel
          GridView = TableViewAddress
        end
      end
      object gbWorksAddress: TcxGroupBox
        Left = 0
        Top = 346
        Align = alBottom
        Caption = #1056#1072#1073#1086#1090#1099' '#1087#1086' '#1079#1072#1082#1072#1079#1091':'
        Constraints.MinHeight = 1
        TabOrder = 1
        Height = 178
        Width = 1193
        object GridAddressWork: TcxGrid
          Left = 2
          Top = 18
          Width = 1189
          Height = 158
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.ScrollbarMode = sbmDefault
          object ViewAddressWork: TcxGridDBTableView
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
            OnFocusedRecordChanged = ViewClientWorkFocusedRecordChanged
            DataController.DataSource = dsOrderWorkAddress
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.##'
                Kind = skSum
                Column = cxGridDBColumn39
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
            object cxGridDBColumn34: TcxGridDBColumn
              DataBinding.FieldName = 'WorkCode'
              Options.FilterRowOperator = foContains
              Width = 100
            end
            object cxGridDBColumn35: TcxGridDBColumn
              DataBinding.FieldName = 'WCTag'
              Options.FilterRowOperator = foContains
              Width = 100
            end
            object cxGridDBColumn36: TcxGridDBColumn
              DataBinding.FieldName = 'WorkName'
              Options.FilterRowOperator = foContains
              Width = 500
            end
            object cxGridDBColumn37: TcxGridDBColumn
              DataBinding.FieldName = 'WorkAmount'
              Width = 100
            end
            object cxGridDBColumn38: TcxGridDBColumn
              DataBinding.FieldName = 'WorkPrice'
              Width = 100
            end
            object cxGridDBColumn39: TcxGridDBColumn
              DataBinding.FieldName = 'WorkCost'
              Width = 100
            end
            object cxGridDBColumn40: TcxGridDBColumn
              DataBinding.FieldName = 'Warranty'
              Width = 100
            end
          end
          object LevelAddressWork: TcxGridLevel
            GridView = ViewAddressWork
          end
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 338
        Width = 1193
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = gbWorksAddress
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
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1079#1072#1082#1072#1079#1091
      ImageIndex = 102
      ShortCut = 16453
    end
    object aUndoDelete: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      ImageIndex = 419
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'eClient'
        end
        item
          Visible = True
          ItemName = 'eAddress'
        end>
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object dxBarButton5: TdxBarButton
      Action = aCancel
      Align = iaRight
      Category = 0
    end
    object eClient: TdxBarEdit
      Caption = #1050#1083#1080#1077#1085#1090':'
      Category = 0
      Hint = #1050#1083#1080#1077#1085#1090
      Visible = ivAlways
      ShowCaption = True
      Width = 400
      ReadOnly = True
    end
    object eAddress: TdxBarEdit
      Caption = #1040#1076#1088#1077#1089':'
      Category = 0
      Hint = #1040#1076#1088#1077#1089
      Visible = ivAlways
      ShowCaption = True
      Width = 400
      ReadOnly = True
    end
  end
  object dsClient: TDataSource
    DataSet = qClient
    Left = 52
    Top = 240
  end
  object qClient: TZQuery
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
      '  OL.phone = :PH'
      'order by'
      '  OL.ID desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'PH'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PH'
        ParamType = ptUnknown
      end>
    object qClientID: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1081
      FieldName = 'ID'
      Required = True
    end
    object qClientDeleted: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object qClientID_AddUser: TSmallintField
      FieldName = 'ID_AddUser'
    end
    object qClientAddUser: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'AddUser'
      ReadOnly = True
      Size = 50
    end
    object qClientAddTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'AddTime'
    end
    object qClientID_AssertUser: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object qClientAssertEmployee: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object qClientAssertTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object qClientRequestText: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1079#1072#1082#1072#1079#1091
      FieldName = 'RequestText'
      Size = 500
    end
    object qClientOrderNUmber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderNUmber'
    end
    object qClientOrderDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OrderDate'
    end
    object qClientOrderCategory: TSmallintField
      FieldName = 'OrderCategory'
    end
    object qClientClosed: TSmallintField
      DisplayLabel = #1047#1072#1082#1088#1099#1090#1072
      FieldName = 'Closed'
    end
    object qClientID_Client: TIntegerField
      FieldName = 'ID_Client'
    end
    object qClientPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'Phone'
    end
    object qClientAddress: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'Address'
      Size = 200
    end
    object qClientID_StatusType: TSmallintField
      FieldName = 'ID_StatusType'
    end
    object qClientID_SignalType: TSmallintField
      FieldName = 'ID_SignalType'
    end
    object qClientID_SourceType: TSmallintField
      FieldName = 'ID_SourceType'
    end
    object qClientID_Distrinct: TSmallintField
      FieldName = 'ID_District'
    end
    object qClientID_Metro: TSmallintField
      FieldName = 'ID_Metro'
    end
    object qClientFiles: TSmallintField
      DisplayLabel = #1045#1089#1090#1100' '#1092#1072#1081#1083#1099
      FieldName = 'Files'
    end
    object qClientID_PaymentForm: TSmallintField
      FieldName = 'ID_PaymentForm'
    end
    object qClientID_Worker: TSmallintField
      FieldName = 'ID_Worker'
    end
    object qClientWorkDate: TDateTimeField
      FieldName = 'WorkDate'
    end
    object qClientWorkTime: TDateTimeField
      FieldName = 'WorkTime'
      DisplayFormat = 'hh:nn'
    end
    object qClientPlanTime: TFloatField
      FieldName = 'PlanTime'
    end
    object qClientWorkCost: TFloatField
      FieldName = 'WorkCost'
      DisplayFormat = ',0.##'
    end
    object qClientWInfo: TWideStringField
      FieldName = 'WInfo'
      ReadOnly = True
      Size = 100
    end
    object qClientOCInfo: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1103#1074#1082#1080
      FieldName = 'OCInfo'
      ReadOnly = True
    end
    object qClientFlatNumber: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1072#1088#1090#1080#1088#1099
      FieldName = 'FlatNumber'
      Size = 50
    end
    object qClientName: TWideStringField
      FieldName = 'Name'
      Size = 150
    end
    object qClientIsClientDOMSPB: TSmallintField
      FieldName = 'IsClientDOMSPB'
      ReadOnly = True
    end
    object qClientClientComment: TWideStringField
      FieldName = 'ClientComment'
      ReadOnly = True
      Size = 200
    end
    object qClientClientDateTime: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientDateTime'
      ReadOnly = True
    end
    object qClientStatusComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1090#1072#1090#1091#1089#1091
      FieldName = 'StatusComment'
      ReadOnly = True
      Size = 200
    end
    object qClientPayed: TSmallintField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'Payed'
      ReadOnly = True
    end
    object qClientStatusInfo: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'StatusInfo'
      ReadOnly = True
      Size = 50
    end
    object qClientSignalInfo: TWideStringField
      DisplayLabel = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'SignalInfo'
      ReadOnly = True
      Size = 50
    end
    object qClientPFInfo: TWideStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PFInfo'
      ReadOnly = True
      Size = 50
    end
    object qClientSourceInfo: TWideStringField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'SourceInfo'
      ReadOnly = True
      Size = 50
    end
    object qClientID_Reason: TSmallintField
      FieldName = 'ID_Reason'
    end
    object qClientReasonInfo: TWideStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldName = 'ReasonInfo'
      ReadOnly = True
      Size = 50
    end
    object qClientHideTime: TDateTimeField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1085#1072' '#1076#1086
      FieldName = 'HideTime'
      ReadOnly = True
    end
    object qClientCloseTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'CloseTime'
    end
    object qClientWorkDateTime: TDateTimeField
      FieldName = 'WorkDateTime'
    end
    object qClientNeedCallDate: TDateTimeField
      FieldName = 'NeedCallDate'
    end
    object qClientCheckNumber: TWideStringField
      FieldName = 'CheckNumber'
      Size = 400
    end
    object qClientID_DiscountPromo: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object qClientUid: TWideStringField
      FieldName = 'Uid'
      Size = 256
    end
    object qClientOrderNumberExt: TWideStringField
      FieldName = 'OrderNumberExt'
      Size = 800
    end
    object qClientPersonalAccount: TWideStringField
      FieldName = 'PersonalAccount'
      Size = 400
    end
  end
  object qOrderWorkClient: TZQuery
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
    DataSource = dsClient
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
    object qOrderWorkClientID: TSmallintField
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
    object qOrderWorkClientID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object qOrderWorkClientID_WorkType: TSmallintField
      FieldName = 'ID_WorkType'
    end
    object qOrderWorkClientID_WorkerClass: TSmallintField
      FieldName = 'ID_WorkerClass'
    end
    object qOrderWorkClientWorkName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 300
      FieldName = 'WorkName'
      Size = 300
    end
    object qOrderWorkClientWorkPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'WorkPrice'
      DisplayFormat = ',0.##'
    end
    object qOrderWorkClientWorkNorm: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' ('#1084#1080#1085')'
      FieldName = 'WorkNorm'
    end
    object qOrderWorkClientWorkAmount: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'WorkAmount'
    end
    object qOrderWorkClientWorkUnitName: TWideStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084'.'
      FieldName = 'WorkUnitName'
    end
    object qOrderWorkClientWorkCode: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'WorkCode'
    end
    object qOrderWorkClientWorkWarrantyType: TSmallintField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WorkWarrantyType'
    end
    object qOrderWorkClientWorkWarrantyTime: TIntegerField
      DisplayLabel = #1057#1088#1086#1082' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WorkWarrantyTime'
    end
    object qOrderWorkClientWTInfo: TWideStringField
      DisplayWidth = 300
      FieldName = 'WTInfo'
      ReadOnly = True
      Size = 300
    end
    object qOrderWorkClientWTypeInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WTypeInfo'
      ReadOnly = True
    end
    object qOrderWorkClientWTypeShortInfo: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WTypeShortInfo'
      ReadOnly = True
    end
    object qOrderWorkClientAmountText: TWideStringField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'AmountText'
      ReadOnly = True
      Size = 172
    end
    object qOrderWorkClientWorkCost: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'WorkCost'
      ReadOnly = True
      DisplayFormat = ',0.##'
    end
    object qOrderWorkClientWarranty: TWideStringField
      DisplayLabel = #1043#1072#1088#1072#1085#1090#1080#1103
      FieldName = 'Warranty'
      ReadOnly = True
      Size = 128
    end
    object qOrderWorkClientWCTag: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'WCTag'
      ReadOnly = True
      Size = 8
    end
    object qOrderWorkClientWorkSum: TFloatField
      FieldName = 'WorkSum'
    end
    object qOrderWorkClientID_Discount: TSmallintField
      FieldName = 'ID_Discount'
    end
    object qOrderWorkClientID_DiscountPromo: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object qOrderWorkClientDiscountPercent: TFloatField
      FieldName = 'DiscountPercent'
    end
    object qOrderWorkClientDiscountSum: TFloatField
      FieldName = 'DiscountSum'
    end
    object qOrderWorkClientDiscountPromoPercent: TFloatField
      FieldName = 'DiscountPromoPercent'
    end
    object qOrderWorkClientDiscountPromoSum: TFloatField
      FieldName = 'DiscountPromoSum'
    end
    object qOrderWorkClientTotalPrice: TFloatField
      FieldName = 'TotalPrice'
    end
    object qOrderWorkClientTotalSum: TFloatField
      FieldName = 'TotalSum'
    end
    object qOrderWorkClientDiscountDebtType: TSmallintField
      FieldName = 'DiscountDebtType'
    end
    object qOrderWorkClientDiscountSubType: TSmallintField
      FieldName = 'DiscountSubType'
    end
    object qOrderWorkClientDiscountCanAdd: TSmallintField
      FieldName = 'DiscountCanAdd'
    end
    object qOrderWorkClientDiscountMinOrderSum: TFloatField
      FieldName = 'DiscountMinOrderSum'
    end
    object qOrderWorkClientDiscountPromoDebtType: TSmallintField
      FieldName = 'DiscountPromoDebtType'
    end
    object qOrderWorkClientDiscountPromoSubType: TSmallintField
      FieldName = 'DiscountPromoSubType'
    end
    object qOrderWorkClientDiscountPromoCanAdd: TSmallintField
      FieldName = 'DiscountPromoCanAdd'
    end
    object qOrderWorkClientDiscountPromoMinOrderSum: TFloatField
      FieldName = 'DiscountPromoMinOrderSum'
    end
  end
  object dsOrderWorkClient: TDataSource
    DataSet = qOrderWorkClient
    Left = 264
    Top = 498
  end
  object PopupMenuClient: TcxGridPopupMenu
    Grid = GridClient
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 592
    Top = 136
  end
  object PopupMenuClientWork: TcxGridPopupMenu
    Grid = GridClientWork
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 420
    Top = 500
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
  object qAddress: TZQuery
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
      '  Lower(OL.Address) = Lower(:ADDR)'
      'order by'
      '  OL.ID desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ADDR'
        ParamType = ptUnknown
      end>
    Left = 324
    Top = 244
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ADDR'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1081
      FieldName = 'ID'
      Required = True
    end
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
    object IntegerField2: TIntegerField
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
      FieldName = 'WorkDate'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'WorkTime'
      DisplayFormat = 'hh:nn'
    end
    object FloatField1: TFloatField
      FieldName = 'PlanTime'
    end
    object FloatField2: TFloatField
      FieldName = 'WorkCost'
      DisplayFormat = ',0.##'
    end
    object WideStringField7: TWideStringField
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
      FieldName = 'Name'
      Size = 150
    end
    object SmallintField14: TSmallintField
      FieldName = 'IsClientDOMSPB'
      ReadOnly = True
    end
    object WideStringField11: TWideStringField
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
    object SmallintField16: TSmallintField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'Payed'
      ReadOnly = True
    end
    object WideStringField14: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'StatusInfo'
      ReadOnly = True
      Size = 50
    end
    object WideStringField15: TWideStringField
      DisplayLabel = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'SignalInfo'
      ReadOnly = True
      Size = 50
    end
    object WideStringField16: TWideStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PFInfo'
      ReadOnly = True
      Size = 50
    end
    object WideStringField17: TWideStringField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'SourceInfo'
      ReadOnly = True
      Size = 50
    end
    object SmallintField18: TSmallintField
      FieldName = 'ID_Reason'
    end
    object WideStringField18: TWideStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldName = 'ReasonInfo'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1085#1072' '#1076#1086
      FieldName = 'HideTime'
      ReadOnly = True
    end
    object DateTimeField9: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'CloseTime'
    end
    object DateTimeField10: TDateTimeField
      FieldName = 'WorkDateTime'
    end
    object DateTimeField11: TDateTimeField
      FieldName = 'NeedCallDate'
    end
    object WideStringField19: TWideStringField
      FieldName = 'CheckNumber'
      Size = 400
    end
    object SmallintField19: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object WideStringField20: TWideStringField
      FieldName = 'Uid'
      Size = 256
    end
    object WideStringField21: TWideStringField
      FieldName = 'OrderNumberExt'
      Size = 800
    end
    object WideStringField22: TWideStringField
      FieldName = 'PersonalAccount'
      Size = 400
    end
  end
  object dsAddress: TDataSource
    DataSet = qAddress
    Left = 252
    Top = 244
  end
  object qOrderWorkAddress: TZQuery
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
    DataSource = dsAddress
    Left = 560
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
    object SmallintField20: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField21: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1072
      FieldName = 'Deleted'
    end
    object SmallintField22: TSmallintField
      FieldName = 'ID_AssertUser'
    end
    object WideStringField23: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1085#1080#1083
      FieldName = 'AssertUser'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField12: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'AssertTime'
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object SmallintField23: TSmallintField
      FieldName = 'ID_WorkType'
    end
    object SmallintField24: TSmallintField
      FieldName = 'ID_WorkerClass'
    end
    object WideStringField24: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 300
      FieldName = 'WorkName'
      Size = 300
    end
    object FloatField3: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'WorkPrice'
      DisplayFormat = ',0.##'
    end
    object FloatField4: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' ('#1084#1080#1085')'
      FieldName = 'WorkNorm'
    end
    object FloatField5: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'WorkAmount'
    end
    object WideStringField25: TWideStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084'.'
      FieldName = 'WorkUnitName'
    end
    object WideStringField26: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'WorkCode'
    end
    object SmallintField25: TSmallintField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WorkWarrantyType'
    end
    object IntegerField4: TIntegerField
      DisplayLabel = #1057#1088#1086#1082' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WorkWarrantyTime'
    end
    object WideStringField27: TWideStringField
      DisplayWidth = 300
      FieldName = 'WTInfo'
      ReadOnly = True
      Size = 300
    end
    object WideStringField28: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WTypeInfo'
      ReadOnly = True
    end
    object WideStringField29: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1075#1072#1088#1072#1085#1090#1080#1080
      FieldName = 'WTypeShortInfo'
      ReadOnly = True
    end
    object WideStringField30: TWideStringField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'AmountText'
      ReadOnly = True
      Size = 172
    end
    object FloatField6: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'WorkCost'
      ReadOnly = True
      DisplayFormat = ',0.##'
    end
    object WideStringField31: TWideStringField
      DisplayLabel = #1043#1072#1088#1072#1085#1090#1080#1103
      FieldName = 'Warranty'
      ReadOnly = True
      Size = 128
    end
    object WideStringField32: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'WCTag'
      ReadOnly = True
      Size = 8
    end
    object FloatField7: TFloatField
      FieldName = 'WorkSum'
    end
    object SmallintField26: TSmallintField
      FieldName = 'ID_Discount'
    end
    object SmallintField27: TSmallintField
      FieldName = 'ID_DiscountPromo'
    end
    object FloatField8: TFloatField
      FieldName = 'DiscountPercent'
    end
    object FloatField9: TFloatField
      FieldName = 'DiscountSum'
    end
    object FloatField10: TFloatField
      FieldName = 'DiscountPromoPercent'
    end
    object FloatField11: TFloatField
      FieldName = 'DiscountPromoSum'
    end
    object FloatField12: TFloatField
      FieldName = 'TotalPrice'
    end
    object FloatField13: TFloatField
      FieldName = 'TotalSum'
    end
    object SmallintField28: TSmallintField
      FieldName = 'DiscountDebtType'
    end
    object SmallintField29: TSmallintField
      FieldName = 'DiscountSubType'
    end
    object SmallintField30: TSmallintField
      FieldName = 'DiscountCanAdd'
    end
    object FloatField14: TFloatField
      FieldName = 'DiscountMinOrderSum'
    end
    object SmallintField31: TSmallintField
      FieldName = 'DiscountPromoDebtType'
    end
    object SmallintField32: TSmallintField
      FieldName = 'DiscountPromoSubType'
    end
    object SmallintField33: TSmallintField
      FieldName = 'DiscountPromoCanAdd'
    end
    object FloatField15: TFloatField
      FieldName = 'DiscountPromoMinOrderSum'
    end
  end
  object dsOrderWorkAddress: TDataSource
    DataSet = qOrderWorkAddress
    Left = 668
    Top = 498
  end
  object PopupMenuAddressWork: TcxGridPopupMenu
    Grid = GridAddressWork
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 800
    Top = 500
  end
  object cxGridPopupAddress: TcxGridPopupMenu
    Grid = GridAddress
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 672
    Top = 140
  end
end
