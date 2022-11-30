object PartnerFixForm: TPartnerFixForm
  Left = 272
  Top = 184
  HelpContext = 695000
  Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
  ClientHeight = 668
  ClientWidth = 905
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pRight: TPanel
    Left = 461
    Top = 50
    Width = 444
    Height = 601
    Align = alClient
    TabOrder = 0
    ExplicitTop = 42
    ExplicitWidth = 423
    ExplicitHeight = 545
    object gbEmployee: TcxGroupBox
      Left = 1
      Top = 1
      Align = alClient
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080':'
      TabOrder = 0
      ExplicitWidth = 421
      ExplicitHeight = 280
      Height = 336
      Width = 442
      object DBGridEmployee: TcxGrid
        AlignWithMargins = True
        Left = 6
        Top = 18
        Width = 430
        Height = 312
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 409
        ExplicitHeight = 256
        object DBGridEmployeeDBTableView: TcxGridDBTableView
          OnDblClick = DBGridEmployee1DblClick
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
          OnFocusedRecordChanged = DBGridEmployeeDBTableViewFocusedRecordChanged
          DataController.DataSource = dsEmployee
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
          OptionsSelection.MultiSelect = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object DBGridEmployeeDBTableViewName: TcxGridDBColumn
            DataBinding.FieldName = 'Name'
            Width = 150
          end
          object DBGridEmployeeDBTableViewESurname: TcxGridDBColumn
            DataBinding.FieldName = 'ESurname'
          end
          object DBGridEmployeeDBTableViewEName: TcxGridDBColumn
            DataBinding.FieldName = 'EName'
          end
          object DBGridEmployeeDBTableViewEPatro: TcxGridDBColumn
            DataBinding.FieldName = 'EPatro'
          end
          object DBGridEmployeeDBTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object DBGridEmployeeLevel: TcxGridLevel
          GridView = DBGridEmployeeDBTableView
        end
      end
    end
    object gbPartnerList: TcxGroupBox
      Left = 1
      Top = 345
      Align = alBottom
      Caption = #1055#1088#1080#1074#1103#1079#1082#1080' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074':'
      Constraints.MinHeight = 1
      TabOrder = 1
      ExplicitTop = 289
      ExplicitWidth = 421
      Height = 255
      Width = 442
      object GridFixP: TcxGrid
        AlignWithMargins = True
        Left = 6
        Top = 68
        Width = 430
        Height = 181
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        TabOrder = 0
        ExplicitTop = 60
        ExplicitWidth = 409
        ExplicitHeight = 189
        object TableViewSnapPartner: TcxGridDBTableView
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
          OnEditKeyDown = TableViewSnapPartnerEditKeyDown
          OnEditKeyPress = TableViewSnapPartnerEditKeyPress
          OnFocusedRecordChanged = TableViewSnapPartnerFocusedRecordChanged
          DataController.DataSource = dsQueryPartner
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
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
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'Name'
            Width = 148
          end
          object cxGridDBColumn6: TcxGridDBColumn
            DataBinding.FieldName = 'ShortName'
            Width = 99
          end
          object cxGridDBColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'Address'
            Width = 162
          end
          object cxGridDBColumn8: TcxGridDBColumn
            DataBinding.FieldName = 'Phone'
            Width = 136
          end
          object cxGridDBColumn9: TcxGridDBColumn
            DataBinding.FieldName = 'CPerson'
            Width = 165
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = TableViewSnapPartner
        end
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 2
        Top = 18
        Width = 438
        Height = 50
        Align = dalTop
        BarManager = BarManager
        ExplicitWidth = 417
      end
    end
    object Splitter1: TcxSplitter
      Left = 1
      Top = 337
      Width = 442
      Height = 8
      Cursor = crVSplit
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salBottom
      MinSize = 100
      ResizeUpdate = True
      Control = gbPartnerList
      Color = clBtnFace
      ParentColor = False
      ExplicitTop = 281
      ExplicitWidth = 421
    end
  end
  object pLeft: TPanel
    Left = 0
    Top = 50
    Width = 453
    Height = 601
    Align = alLeft
    Constraints.MinWidth = 1
    TabOrder = 1
    ExplicitTop = 42
    ExplicitHeight = 545
    object gbPartner: TcxGroupBox
      Left = 1
      Top = 1
      Align = alClient
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
      TabOrder = 0
      ExplicitHeight = 280
      Height = 336
      Width = 451
      object DBGridPartner: TcxGrid
        AlignWithMargins = True
        Left = 6
        Top = 18
        Width = 439
        Height = 312
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 256
        object DBGridPartnerDBTableView: TcxGridDBTableView
          OnDblClick = DBGridPartnerDblClick
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
          OnFocusedRecordChanged = DBGridPartnerDBTableViewFocusedRecordChanged
          DataController.DataSource = dsPartner
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
          OptionsSelection.MultiSelect = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object DBGridPartnerDBTableViewName: TcxGridDBColumn
            DataBinding.FieldName = 'Name'
            Width = 148
          end
          object DBGridPartnerDBTableViewShortName: TcxGridDBColumn
            DataBinding.FieldName = 'ShortName'
            Width = 99
          end
          object DBGridPartnerDBTableViewAddress: TcxGridDBColumn
            DataBinding.FieldName = 'Address'
            Width = 162
          end
          object DBGridPartnerDBTableViewPhone: TcxGridDBColumn
            DataBinding.FieldName = 'Phone'
            Width = 136
          end
          object DBGridPartnerDBTableViewCPerson: TcxGridDBColumn
            DataBinding.FieldName = 'CPerson'
            Width = 165
          end
          object DBGridPartnerDBTableViewIsClient: TcxGridDBColumn
            DataBinding.FieldName = 'IsClient'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taRightJustify
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 80
          end
          object DBGridPartnerDBTableViewIsCarrier: TcxGridDBColumn
            DataBinding.FieldName = 'IsCarrier'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taRightJustify
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 80
          end
          object DBGridPartnerDBTableViewIsBuyer: TcxGridDBColumn
            DataBinding.FieldName = 'IsBuyer'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taRightJustify
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 80
          end
          object DBGridPartnerDBTableViewIsSeller: TcxGridDBColumn
            DataBinding.FieldName = 'IsSeller'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taRightJustify
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 80
          end
          object DBGridPartnerDBTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object DBGridPartnerLevel: TcxGridLevel
          GridView = DBGridPartnerDBTableView
        end
      end
    end
    object gbManagerList: TcxGroupBox
      Left = 1
      Top = 345
      Align = alBottom
      Caption = #1055#1088#1080#1074#1103#1079#1082#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074':'
      Constraints.MinHeight = 1
      TabOrder = 1
      ExplicitTop = 289
      Height = 255
      Width = 451
      object GridFixE: TcxGrid
        AlignWithMargins = True
        Left = 6
        Top = 68
        Width = 439
        Height = 181
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        TabOrder = 0
        ExplicitTop = 60
        ExplicitHeight = 189
        object TableViewSnapEmployee: TcxGridDBTableView
          OnKeyDown = GridFixEKeyDown
          OnKeyPress = GridFixEKeyPress
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
          OnEditKeyDown = TableViewSnapEmployeeEditKeyDown
          OnEditKeyPress = TableViewSnapEmployeeEditKeyPress
          OnFocusedRecordChanged = TableViewSnapEmployeeFocusedRecordChanged
          DataController.DataSource = dsQueryEmployee
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
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
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'Name'
            Width = 150
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'ESurname'
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'EName'
          end
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'EPatro'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = TableViewSnapEmployee
        end
      end
      object dxBarDockControl2: TdxBarDockControl
        Left = 2
        Top = 18
        Width = 447
        Height = 50
        Align = dalTop
        BarManager = BarManager
      end
    end
    object Splitter: TcxSplitter
      Left = 1
      Top = 337
      Width = 451
      Height = 8
      Cursor = crVSplit
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salBottom
      MinSize = 100
      ResizeUpdate = True
      Control = gbManagerList
      Color = clBtnFace
      ParentColor = False
      ExplicitTop = 281
    end
  end
  object SplitterLeft: TcxSplitter
    Left = 453
    Top = 50
    Width = 8
    Height = 601
    Cursor = crHSplit
    HotZoneClassName = 'TcxSimpleStyle'
    AutoSnap = True
    ResizeUpdate = True
    Control = pLeft
    Color = clBtnFace
    ParentColor = False
    ExplicitTop = 42
    ExplicitHeight = 545
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 651
    Width = 905
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
    ExplicitTop = 587
    ExplicitWidth = 884
  end
  object dsQueryEmployee: TDataSource
    DataSet = QueryEmployee
    Left = 120
    Top = 424
  end
  object dsPartner: TDataSource
    DataSet = qPartner
    Left = 116
    Top = 76
  end
  object dsEmployee: TDataSource
    DataSet = qEmployee
    Left = 596
    Top = 80
  end
  object dsQueryPartner: TDataSource
    DataSet = QueryPartner
    Left = 676
    Top = 416
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
          ItemName = 'dxBarButton'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BarManagerBar2: TdxBar
      AllowClose = False
      Caption = #1055#1088#1080#1074#1103#1079#1082#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton9'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1055#1088#1080#1074#1103#1079#1082#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BarManagerBar3: TdxBar
      AllowClose = False
      Caption = #1055#1088#1080#1074#1103#1079#1082#1080' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 323
      FloatTop = 483
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
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
          ItemName = 'dxBarButton10'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1055#1088#1080#1074#1103#1079#1082#1080' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton: TdxBarButton
      Action = aCancel
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = aAddNE
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = aAddE
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aDeleteE
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aClearE
      Category = 0
    end
    object dxBarButton7: TdxBarButton
      Action = aAddNC
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Action = aAddC
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = aDeleteC
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = aClearC
      Category = 0
    end
    object dxBarButton9: TdxBarButton
      Action = aCopyEmployee
      Category = 0
    end
    object dxBarButton10: TdxBarButton
      Action = aCopyPartner
      Category = 0
    end
  end
  object ActionList: TActionList
    Left = 292
    Top = 116
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aAddNE: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      ImageIndex = 259
      OnExecute = aAddNEExecute
    end
    object aAddE: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      ImageIndex = 100
      OnExecute = aAddEExecute
    end
    object aDeleteE: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      ImageIndex = 101
      OnExecute = aDeleteEExecute
    end
    object aClearE: TAction
      Caption = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      Hint = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      ImageIndex = 260
      OnExecute = aClearEExecute
    end
    object aAddNC: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
      ImageIndex = 259
      OnExecute = aAddNCExecute
    end
    object aAddC: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      ImageIndex = 100
      OnExecute = aAddCExecute
    end
    object aDeleteC: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      ImageIndex = 101
      OnExecute = aDeleteCExecute
    end
    object aClearC: TAction
      Caption = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077#1093' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
      Hint = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077#1093' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
      ImageIndex = 260
      OnExecute = aClearCExecute
    end
    object aCopyEmployee: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      ImageIndex = 303
      OnExecute = aCopyEmployeeExecute
    end
    object aCopyPartner: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
      ImageIndex = 304
      OnExecute = aCopyPartnerExecute
    end
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 200
    Top = 116
  end
  object qPartner: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = qPartnerAfterScroll
    Filtered = True
    SQL.Strings = (
      'select'
      '  C.ID,'
      '  C.Name,'
      '  C.ShortName,'
      '  C.Address,'
      '  C.Phone,'
      '  C.CPerson as CPerson,'
      '  C.IsCarrier,'
      '  C.IsClient,'
      '  C.IsBuyer,'
      '  C.IsSeller'
      'from'
      '  Partner C'
      'order by'
      '  C.ShortName')
    Params = <>
    Left = 64
    Top = 76
    object qPartnerName: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
    end
    object qPartnerShortName: TWideStringField
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'ShortName'
      Size = 50
    end
    object qPartnerAddress: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 200
      FieldName = 'Address'
      ReadOnly = True
      Size = 200
    end
    object qPartnerPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 200
      FieldName = 'Phone'
      ReadOnly = True
      Size = 200
    end
    object qPartnerCPerson: TWideStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
      DisplayWidth = 200
      FieldName = 'CPerson'
      ReadOnly = True
      Size = 200
    end
    object qPartnerIsCarrier: TSmallintField
      DisplayLabel = #1055#1077#1088#1077#1074#1086#1079#1095#1080#1082
      FieldName = 'IsCarrier'
    end
    object qPartnerIsClient: TSmallintField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      FieldName = 'IsClient'
    end
    object qPartnerIsBuyer: TSmallintField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      FieldName = 'IsBuyer'
    end
    object qPartnerIsSeller: TSmallintField
      DisplayLabel = #1055#1088#1086#1076#1072#1074#1077#1094
      FieldName = 'IsSeller'
    end
    object qPartnerID: TIntegerField
      FieldName = 'ID'
    end
  end
  object qEmployee: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = qEmployeeAfterScroll
    Filtered = True
    SQL.Strings = (
      'select E.Name, E.ESurname, E.EName, E.EPatro, E.ID'
      'from Employee E'
      'order by E.Name')
    Params = <>
    Left = 524
    Top = 80
    object qEmployeeName: TWideStringField
      DisplayLabel = #1055#1089#1077#1074#1076#1086#1085#1080#1084
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
    end
    object qEmployeeESurname: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'ESurname'
    end
    object qEmployeeEName: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'EName'
    end
    object qEmployeeEPatro: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'EPatro'
    end
    object qEmployeeID: TSmallintField
      FieldName = 'ID'
    end
  end
  object QueryEmployee: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryEmployeeAfterOpen
    AfterScroll = QueryEmployeeAfterScroll
    SQL.Strings = (
      'select E.Name, E.ESurname, E.EName, E.EPatro, CF.*'
      'from Employee E, PartnerFix CF'
      'where'
      '  CF.ID_Partner = :ID and'
      '  CF.ID_Employee = E.ID'
      'order by Name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = dsPartner
    Left = 36
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QueryEmployeeName: TWideStringField
      DisplayLabel = #1055#1089#1077#1074#1076#1086#1085#1080#1084
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
    end
    object QueryEmployeeESurname: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'ESurname'
    end
    object QueryEmployeeEName: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'EName'
    end
    object QueryEmployeeEPatro: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'EPatro'
    end
    object QueryEmployeeID: TIntegerField
      FieldName = 'ID'
    end
    object QueryEmployeeID_Partner: TIntegerField
      FieldName = 'ID_Partner'
      Required = True
    end
    object QueryEmployeeID_Employee: TSmallintField
      FieldName = 'ID_Employee'
      Required = True
    end
  end
  object qClearE: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'delete from PartnerFix'
      'where ID_Partner = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 236
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object Table: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from PartnerFix')
    Params = <>
    Left = 380
    Top = 472
  end
  object QueryPartner: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryPartnerAfterOpen
    AfterScroll = qPartnerAfterScroll
    SQL.Strings = (
      'select'
      '  C.Name,'
      '  C.ShortName,'
      '  C.Address,'
      '  C.Phone,'
      '  C.CPerson as CPerson,'
      '  CF.*'
      'from'
      '  Partner C, PartnerFix CF'
      'where'
      '  CF.ID_Employee = :ID and'
      '  CF.ID_Partner = C.ID'
      'order by'
      '  C.ShortName')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DataSource = dsEmployee
    Left = 568
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QueryPartnerName: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
    end
    object QueryPartnerShortName: TWideStringField
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'ShortName'
      Size = 50
    end
    object QueryPartnerAddress: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 200
      FieldName = 'Address'
      ReadOnly = True
      Size = 200
    end
    object QueryPartnerPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 200
      FieldName = 'Phone'
      ReadOnly = True
      Size = 200
    end
    object QueryPartnerCPerson: TWideStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
      DisplayWidth = 200
      FieldName = 'CPerson'
      ReadOnly = True
      Size = 200
    end
    object QueryPartnerID_Partner: TIntegerField
      FieldName = 'ID_Partner'
      Required = True
    end
    object QueryPartnerID_Employee: TSmallintField
      FieldName = 'ID_Employee'
      Required = True
    end
    object QueryPartnerID: TIntegerField
      FieldName = 'ID'
    end
  end
  object qClearC: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'delete from PartnerFix'
      'where ID_Employee = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 780
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qEmployeeFrom: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryEmployeeAfterOpen
    AfterScroll = QueryEmployeeAfterScroll
    SQL.Strings = (
      'select E.Name, E.ESurname, E.EName, E.EPatro, CF.*'
      'from Employee E, PartnerFix CF'
      'where'
      '  CF.ID_Partner = :ID and'
      '  CF.ID_Employee = E.ID'
      'order by Name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 36
    Top = 484
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object StringField1: TWideStringField
      DisplayLabel = #1055#1089#1077#1074#1076#1086#1085#1080#1084
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
    end
    object StringField2: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'ESurname'
    end
    object StringField3: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'EName'
    end
    object StringField4: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'EPatro'
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_Partner'
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'ID_Employee'
      Required = True
    end
  end
  object qPartnerFrom: TZQuery
    Connection = Datas.ZConnection
    AfterOpen = QueryPartnerAfterOpen
    AfterScroll = qPartnerAfterScroll
    SQL.Strings = (
      'select'
      '  C.Name,'
      '  C.ShortName,'
      '  C.Address,'
      '  C.Phone,'
      '  C.CPerson as CPerson,'
      '  CF.*'
      'from'
      '  Partner C, PartnerFix CF'
      'where'
      '  CF.ID_Employee = :ID and'
      '  CF.ID_Partner = C.ID'
      'order by'
      '  C.ShortName')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 568
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object StringField5: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
    end
    object StringField6: TWideStringField
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'ShortName'
      Size = 50
    end
    object StringField7: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 200
      FieldName = 'Address'
      ReadOnly = True
      Size = 200
    end
    object StringField8: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 200
      FieldName = 'Phone'
      ReadOnly = True
      Size = 200
    end
    object StringField9: TWideStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
      DisplayWidth = 200
      FieldName = 'CPerson'
      ReadOnly = True
      Size = 200
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_Partner'
      Required = True
    end
    object SmallintField2: TSmallintField
      FieldName = 'ID_Employee'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID'
    end
  end
end
