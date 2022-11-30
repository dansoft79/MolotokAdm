object RemiderForm: TRemiderForm
  Left = 388
  Top = 259
  HelpContext = 767300
  Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
  ClientHeight = 506
  ClientWidth = 850
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 489
    Width = 850
    Height = 17
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
    Width = 850
    Height = 439
    Align = alClient
    TabOrder = 5
    Properties.ActivePage = tsClient
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 439
    ClientRectRight = 850
    ClientRectTop = 24
    object tsClient: TcxTabSheet
      Caption = #1055#1086' '#1082#1083#1080#1077#1085#1090#1072#1084
      ImageIndex = 0
      object DBGridClient: TcxGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 842
        Height = 407
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
          Navigator.Visible = True
          OnCellDblClick = TableViewClientCellDblClick
          DataController.DataSource = dsReminderClient
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DateTimeHandling.IgnoreTimeForFiltering = True
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          object TableViewClientComment: TcxGridDBColumn
            DataBinding.FieldName = 'Comment'
          end
          object TableViewClientNumber: TcxGridDBColumn
            DataBinding.FieldName = 'Number'
            Width = 80
          end
          object TableViewClientContractnumClient: TcxGridDBColumn
            DataBinding.FieldName = 'ContractnumClient'
            Width = 80
          end
          object TableViewClientContractDateClient: TcxGridDBColumn
            DataBinding.FieldName = 'ContractDateClient'
            Width = 80
          end
          object TableViewClientOrgInfo: TcxGridDBColumn
            DataBinding.FieldName = 'OrgInfo'
            Width = 150
          end
          object TableViewClientCLIName: TcxGridDBColumn
            DataBinding.FieldName = 'CLIName'
            Width = 150
          end
          object TableViewClientRInfo: TcxGridDBColumn
            DataBinding.FieldName = 'RInfo'
            Width = 200
          end
          object TableViewClientCargoName: TcxGridDBColumn
            DataBinding.FieldName = 'CargoName'
            Width = 120
          end
          object TableViewClientCARName: TcxGridDBColumn
            DataBinding.FieldName = 'CARName'
            Width = 150
          end
          object TableViewClientTInfo: TcxGridDBColumn
            DataBinding.FieldName = 'TInfo'
            Width = 150
          end
          object TableViewClientTRInfo: TcxGridDBColumn
            DataBinding.FieldName = 'TRInfo'
            Width = 150
          end
          object TableViewClientDInfo: TcxGridDBColumn
            DataBinding.FieldName = 'DInfo'
            Width = 150
          end
          object TableViewClientFromDate: TcxGridDBColumn
            DataBinding.FieldName = 'FromDate'
          end
          object TableViewClientToDate: TcxGridDBColumn
            DataBinding.FieldName = 'ToDate'
          end
          object TableViewClientEInfo: TcxGridDBColumn
            DataBinding.FieldName = 'EInfo'
            Width = 120
          end
          object TableViewClientRealized: TcxGridDBColumn
            DataBinding.FieldName = 'Realized'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object TableViewClientRealizeDate: TcxGridDBColumn
            DataBinding.FieldName = 'RealizeDate'
          end
          object TableViewClientReturnBase: TcxGridDBColumn
            DataBinding.FieldName = 'ReturnBase'
            Width = 100
          end
          object TableViewClientReturnTime: TcxGridDBColumn
            DataBinding.FieldName = 'ReturnTime'
          end
          object TableViewClientDocReady: TcxGridDBColumn
            DataBinding.FieldName = 'DocReady'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object TableViewClientDocReadyDate: TcxGridDBColumn
            DataBinding.FieldName = 'DocReadyDate'
          end
          object TableViewClientInvoicePayDateClient: TcxGridDBColumn
            DataBinding.FieldName = 'InvoicePayDateClient'
          end
          object TableViewClientInvoicePayNumClient: TcxGridDBColumn
            DataBinding.FieldName = 'InvoicePayNumClient'
            Width = 100
          end
          object TableViewClientInvoicePayCliSend: TcxGridDBColumn
            DataBinding.FieldName = 'InvoicePayCliSend'
            Width = 120
          end
          object TableViewClientInvoicePayCliReceive: TcxGridDBColumn
            DataBinding.FieldName = 'InvoicePayCliReceive'
            Width = 120
          end
          object TableViewClientCost: TcxGridDBColumn
            DataBinding.FieldName = 'Cost'
          end
          object TableViewClientPaySum: TcxGridDBColumn
            DataBinding.FieldName = 'PaySum'
            Width = 100
          end
          object TableViewClientID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
          object TableViewClientID_Request: TcxGridDBColumn
            DataBinding.FieldName = 'ID_Request'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object GridLevelClient: TcxGridLevel
          GridView = TableViewClient
        end
      end
    end
    object tsCarrier: TcxTabSheet
      Caption = #1055#1086' '#1087#1077#1088#1077#1074#1086#1079#1095#1080#1082#1072#1084
      ImageIndex = 1
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGridCarrier: TcxGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 833
        Height = 406
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TableViewCarrier: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Visible = True
          OnCellDblClick = TableViewCarrierCellDblClick
          DataController.DataSource = dsReminderCarrier
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DateTimeHandling.IgnoreTimeForFiltering = True
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'Comment'
          end
          object TableViewCarrierNumber: TcxGridDBColumn
            DataBinding.FieldName = 'Number'
            Width = 80
          end
          object TableViewCarrierContractnumCarrier: TcxGridDBColumn
            DataBinding.FieldName = 'ContractnumCarrier'
            Width = 80
          end
          object TableViewCarrierContractDateCarrier: TcxGridDBColumn
            DataBinding.FieldName = 'ContractDateCarrier'
            Width = 80
          end
          object TableViewCarrierOrgInfo: TcxGridDBColumn
            DataBinding.FieldName = 'OrgInfo'
            Width = 150
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'CLIName'
            Width = 150
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'RInfo'
            Width = 200
          end
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'CargoName'
            Width = 120
          end
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'CARName'
            Width = 150
          end
          object cxGridDBColumn6: TcxGridDBColumn
            DataBinding.FieldName = 'TInfo'
            Width = 150
          end
          object cxGridDBColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'TRInfo'
            Width = 150
          end
          object cxGridDBColumn8: TcxGridDBColumn
            DataBinding.FieldName = 'DInfo'
            Width = 150
          end
          object TableViewCarrierFromDate: TcxGridDBColumn
            DataBinding.FieldName = 'FromDate'
          end
          object TableViewCarrierToDate: TcxGridDBColumn
            DataBinding.FieldName = 'ToDate'
          end
          object TableViewCarrierEInfo: TcxGridDBColumn
            DataBinding.FieldName = 'EInfo'
            Width = 120
          end
          object TableViewCarrierRealized: TcxGridDBColumn
            DataBinding.FieldName = 'Realized'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object TableViewCarrierRealizeDate: TcxGridDBColumn
            DataBinding.FieldName = 'RealizeDate'
          end
          object TableViewCarrierReturnBase: TcxGridDBColumn
            DataBinding.FieldName = 'ReturnBase'
            Width = 100
          end
          object TableViewCarrierReturnTime: TcxGridDBColumn
            DataBinding.FieldName = 'ReturnTime'
          end
          object TableViewCarrierDocReady: TcxGridDBColumn
            DataBinding.FieldName = 'DocReady'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object TableViewCarrierDocReadyDate: TcxGridDBColumn
            DataBinding.FieldName = 'DocReadyDate'
          end
          object TableViewCarrierInvoicePayDateCarrier: TcxGridDBColumn
            DataBinding.FieldName = 'InvoicePayDateCarrier'
          end
          object TableViewCarrierInvoicePayNumCarrier: TcxGridDBColumn
            DataBinding.FieldName = 'InvoicePayNumCarrier'
            Width = 100
          end
          object TableViewCarrierInvoicePayCarSend: TcxGridDBColumn
            DataBinding.FieldName = 'InvoicePayCarSend'
            Width = 120
          end
          object TableViewCarrierInvoicePayCarReceive: TcxGridDBColumn
            DataBinding.FieldName = 'InvoicePayCarReceive'
            Width = 120
          end
          object TableViewCarrierCost: TcxGridDBColumn
            DataBinding.FieldName = 'Cost'
          end
          object TableViewCarrierPaySum: TcxGridDBColumn
            DataBinding.FieldName = 'PaySum'
            Width = 100
          end
          object TableViewCarrierID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
          object TableViewCarrierID_Request: TcxGridDBColumn
            DataBinding.FieldName = 'ID_Request'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object GridLevelCarrier: TcxGridLevel
          GridView = TableViewCarrier
        end
      end
    end
  end
  object dsReminderClient: TDataSource
    DataSet = qReminderClient
    Left = 76
    Top = 232
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 76
    Top = 104
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
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
    object aDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1077#1088#1077#1074#1086#1079#1082#1080
      Hint = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1077#1088#1077#1074#1086#1079#1082#1080
      ImageIndex = 125
      OnExecute = aDetailExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 103
      OnExecute = aPrintExecute
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
    ImageOptions.Images = UtilForm.ImageList2
    ImageOptions.LargeImages = UtilForm.ImageListBig2
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 136
    Top = 104
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
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cbMode'
        end
        item
          Visible = True
          ItemName = 'eFrom'
        end
        item
          Visible = True
          ItemName = 'eTo'
        end
        item
          Visible = True
          ItemName = 'bUpdate'
        end>
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton4: TdxBarButton
      Action = aCancel
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = aDetail
      Category = 0
    end
    object cbMode: TdxBarCombo
      Caption = #1056#1077#1078#1080#1084':'
      Category = 0
      Hint = 
        #1057#1074#1086#1080' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103' - '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103' '#1087#1086' '#1087#1077#1088#1077#1074#1086#1079#1082#1072#1084', '#1082#1086#1090#1086#1088#1099#1081' '#1076#1086#1073#1072#1074#1080#1083' '#1090#1077 +
        #1082#1091#1097#1080#1081' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      Visible = ivAlways
      OnKeyDown = eKeyDown
      ShowCaption = True
      Width = 150
      Text = #1057#1074#1086#1080' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
      ShowEditor = False
      Items.Strings = (
        #1057#1074#1086#1080' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
        #1042#1089#1077' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103)
      ItemIndex = 0
    end
    object eFrom: TdxBarDateCombo
      Caption = #1053#1072#1095#1072#1083#1086':'
      Category = 0
      Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' '#1076#1083#1103' '#1076#1072#1090#1099' '#1079#1072#1075#1088#1091#1079#1082#1080
      Visible = ivAlways
      OnKeyDown = eKeyDown
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      ShowDayText = False
    end
    object eTo: TdxBarDateCombo
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077':'
      Category = 0
      Hint = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072' '#1076#1083#1103' '#1076#1072#1090#1099' '#1079#1072#1075#1088#1091#1079#1082#1080
      Visible = ivAlways
      OnKeyDown = eKeyDown
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      ShowDayText = False
    end
    object bUpdate: TdxBarButton
      Action = aUpdate
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object dsReminderCarrier: TDataSource
    DataSet = qReminderCarrier
    Left = 276
    Top = 232
  end
  object qReminderClient: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select'
      
        '  CA.ID, CA.Realized, CA.RealizeDate, CA.DocReady, CA.DocReadyDa' +
        'te, CA.ReturnBase, CA.ReturnTime,'
      '  CA.ID_Request,'
      
        '  R.Number, R.CargoName, CA.ContractnumClient, CA.ContractDateCl' +
        'ient, OrganizationInfo(CA.ID_OrganizationClient) as OrgInfo,'
      '  PartnerInfo(R.ID_Client) as CLIName,'
      '  RouteInfo(R.ID_Route) as RInfo,'
      '  PartnerInfo(CA.ID_Carrier) as CARName,'
      '  TransportInfo(CA.ID_Transport) as TInfo,'
      '  TrailerInfo(CA.ID_Trailer) as TRInfo,'
      '  DriverInfo(CA.ID_Driver) as DInfo,'
      '  CA.FromDate, CA.ToDate,'
      
        '  ca.InvoicePayDateClient, ca.InvoicePayNumClient, ca.InvoicePay' +
        'CliSend, ca.InvoicePayCliReceive,'
      '  ca.ClientCost as Cost, CarriageClientPaySum(ca.id) as PaySum,'
      '  EmployeeInfo(CA.ID_Employee) as EInfo,'
      '  case'
      '    when'
      
        '      ca.RealizeDate is null and WorkDayBetween2(ca.ToDate, curd' +
        'ate()) > e.RealizedPeriod'
      '      then '#39#1053#1077#1090' '#1086#1090#1084#1077#1090#1082#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103#39
      '    when'
      
        '      not ca.ReturnTime is null and ca.DocReadyDate is null and ' +
        'WorkDayBetween2(ca.ReturnTime, Now()) > e.DocReadyPeriod or'

        '      ca.ReturnTime is null and ca.DocReadyDate is null and Work' +
        'DayBetween2(ca.RealizeDate, Now()) > e.DocReadyNBPeriod'
      '      then '#39#1053#1077#1090' '#1086#1090#1084#1077#1090#1082#1080' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103#39
      '    when'
      
        '      ca.DocReadyDate is not null and ca.InvoicePayDateClient is' +
        ' null and WorkDayBetween2(ca.DocReadyDate, Now()) > e.Invoic' +
        'eCreate'
      '      then '#39#1053#1077' '#1074#1099#1089#1090#1072#1074#1083#1077#1085' '#1089#1095#1077#1090#39
      '    when'
      
        '      ca.InvoicePayDateClient is not null and ca.InvoicePayCliSe' +
        'nd is null and WorkDayBetween2(ca.InvoicePayDateClient,Now()' +
        ') > e.InvoiceSend'
      '      then '#39#1053#1077' '#1074#1099#1089#1083#1072#1085' '#1089#1095#1077#1090#39
      '    when'
      
        '      ca.InvoicePayDateClient is not null and ca.InvoicePayCliSe' +
        'nd is not null and ca.InvoicePayCliReceive is not null and'
      
        '      WorkDayBetween2(ca.InvoicePayCliReceive,Now()) > e.Inv' +
        'oicePay and CarriageClientPaySum(ca.ID) < ca.ClientCost'
      '      then '#39#1053#1077' '#1086#1087#1083#1072#1095#1077#1085' '#1089#1095#1077#1090#39
      '    else '#39#39
      '  end as Comment'
      'from'
      '  Request R'
      '  inner join Carriage CA on'
      '    R.ID = CA.ID_Request and ca.RemindClient = 1 and'
      '    ((CA.ID_Employee = :IDEmployee) or (:rem = 1)) and'
      
        '    (Date_Format(CA.FromDate, '#39'%Y.%m.%d'#39') >= :FD or (:FD = '#39#39')) ' +
        'and'
      '    (Date_Format(CA.FromDate, '#39'%Y.%m.%d'#39') <= :TD or (:TD = '#39#39'))'
      '  inner join Enterprise e'
      'order by'
      '  CLIName,'
      '  FromDate')
    Params = <
      item
        DataType = ftString
        Name = 'IDEmployee'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'rem'
        ParamType = ptUnknown
      end
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
    Left = 76
    Top = 172
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEmployee'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'rem'
        ParamType = ptUnknown
      end
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
    object qReminderClientID: TIntegerField
      FieldName = 'ID'
    end
    object qReminderClientComment: TWideStringField
      DisplayLabel = #1057#1080#1090#1091#1072#1094#1080#1103
      FieldName = 'Comment'
      Size = 50
    end
    object qReminderClientCLIName: TWideStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CLIName'
      ReadOnly = True
      Size = 50
    end
    object qReminderClientRInfo: TWideStringField
      DisplayLabel = #1052#1072#1088#1096#1088#1091#1090
      FieldName = 'RInfo'
      ReadOnly = True
      Size = 100
    end
    object qReminderClientCargoName: TWideStringField
      DisplayLabel = #1043#1088#1091#1079
      FieldName = 'CargoName'
      Required = True
      Size = 50
    end
    object qReminderClientCARName: TWideStringField
      DisplayLabel = #1055#1077#1088#1077#1074#1086#1079#1095#1080#1082
      FieldName = 'CARName'
      ReadOnly = True
      Size = 50
    end
    object qReminderClientTInfo: TWideStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      FieldName = 'TInfo'
      ReadOnly = True
      Size = 100
    end
    object qReminderClientTRInfo: TWideStringField
      DisplayLabel = #1055#1088#1080#1094#1077#1087
      FieldName = 'TRInfo'
      ReadOnly = True
      Size = 100
    end
    object qReminderClientDInfo: TWideStringField
      DisplayLabel = #1042#1086#1076#1080#1090#1077#1083#1100
      FieldName = 'DInfo'
      ReadOnly = True
      Size = 100
    end
    object qReminderClientFromDate: TDateTimeField
      DisplayLabel = #1047#1072#1075#1088#1091#1079#1082#1072
      FieldName = 'FromDate'
      Required = True
    end
    object qReminderClientToDate: TDateTimeField
      DisplayLabel = #1056#1072#1079#1075#1088#1091#1079#1082#1072
      FieldName = 'ToDate'
      Required = True
    end
    object qReminderClientEInfo: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'EInfo'
      ReadOnly = True
      Size = 50
    end
    object qReminderClientID_Request: TIntegerField
      FieldName = 'ID_Request'
      Required = True
    end
    object qReminderClientInvoicePayDateClient: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1077#1090#1072
      FieldName = 'InvoicePayDateClient'
    end
    object qReminderClientInvoicePayNumClient: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
      FieldName = 'InvoicePayNumClient'
      Size = 50
    end
    object qReminderClientInvoicePayCliSend: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1095#1077#1090#1072
      FieldName = 'InvoicePayCliSend'
    end
    object qReminderClientInvoicePayCliReceive: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1089#1095#1077#1090#1072
      FieldName = 'InvoicePayCliReceive'
    end
    object qReminderClientCost: TFloatField
      DisplayLabel = #1057#1090#1072#1074#1082#1072
      FieldName = 'Cost'
      Required = True
    end
    object qReminderClientPaySum: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PaySum'
      ReadOnly = True
    end
    object qReminderClientNumber: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1075#1088#1091#1079#1072
      FieldName = 'Number'
      Required = True
    end
    object qReminderClientRealized: TSmallintField
      DisplayLabel = #1042#1099#1087#1086#1083#1085#1077#1085#1072
      FieldName = 'Realized'
    end
    object qReminderClientRealizeDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'RealizeDate'
    end
    object qReminderClientContractnumClient: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072'-'#1079#1072#1103#1074#1082#1080
      FieldName = 'ContractnumClient'
      Required = True
    end
    object qReminderClientContractDateClient: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072'-'#1079#1072#1103#1074#1082#1080
      FieldName = 'ContractDateClient'
      Required = True
    end
    object qReminderClientOrgInfo: TWideStringField
      DisplayLabel = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      FieldName = 'OrgInfo'
      ReadOnly = True
      Size = 50
    end
    object qReminderClientDocReady: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1072
      FieldName = 'DocReady'
    end
    object qReminderClientDocReadyDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'DocReadyDate'
    end
    object qReminderClientReturnBase: TWideStringField
      DisplayLabel = #1041#1072#1079#1072
      FieldName = 'ReturnBase'
      Required = True
      Size = 50
    end
    object qReminderClientReturnTime: TDateTimeField
      DisplayLabel = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1073#1072#1079#1091
      FieldName = 'ReturnTime'
    end
  end
  object qReminderCarrier: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select'
      
        '  CA.ID, CA.Realized, CA.RealizeDate, CA.DocReady, CA.DocReadyDa' +
        'te, CA.ReturnBase, CA.ReturnTime,'
      '  CA.ID_Request,'
      
        '  R.CargoName, R.Number, CA.ContractnumCarrier, CA.ContractDateC' +
        'arrier, OrganizationInfo(CA.ID_OrganizationCarrier) as OrgInfo,'
      '  PartnerInfo(R.ID_Client) as CLIName,'
      '  RouteInfo(R.ID_Route) as RInfo,'
      '  PartnerInfo(CA.ID_Carrier) as CARName,'
      '  TransportInfo(CA.ID_Transport) as TInfo,'
      '  TrailerInfo(CA.ID_Trailer) as TRInfo,'
      '  DriverInfo(CA.ID_Driver) as DInfo,'
      '  CA.FromDate,  CA.ToDate,'
      
        '  ca.InvoicePayDateCarrier, ca.InvoicePayNumCarrier, ca.InvoiceP' +
        'ayCarSend, ca.InvoicePayCarReceive,'
      '  ca.Cost, CarriageCarrierPaySum(ca.id) as PaySum,'
      '  EmployeeInfo(CA.ID_Employee) as EInfo,'
      '  case'
      '    when'
      
        '      ca.RealizeDate is null and WorkDayBetween2(ca.ToDate, curd' +
        'ate()) > e.RealizedPeriod'
      '      then '#39#1053#1077#1090' '#1086#1090#1084#1077#1090#1082#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103#39
      '    when'
      
        '      not ca.ReturnTime is null and ca.DocReadyDate is null and ' +
        'WorkDayBetween2(ca.ReturnTime, Now()) > e.DocReadyPeriod or'
      
        '      ca.ReturnTime is null and ca.DocReadyDate is null and Work' +
        'DayBetween2(ca.RealizeDate, Now()) > e.DocReadyNBPeriod'
      '      then '#39#1053#1077#1090' '#1086#1090#1084#1077#1090#1082#1080' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103#39
      '    when'
      
        '      ca.DocReadyDate is not null and ca.InvoicePayDateCarrier i' +
        's null and WorkDayBetween2(ca.DocReadyDate, Now()) > e.Invoi' +
        'ceCreate'
      '      then '#39#1053#1077' '#1074#1099#1089#1090#1072#1074#1083#1077#1085' '#1089#1095#1077#1090#39
      '    when'
      
        '      ca.InvoicePayDateCarrier is not null and ca.InvoicePayCarS' +
        'end is null and WorkDayBetween2(ca.InvoicePayDateCarrier, curdat' +
        'e()) > e.InvoiceSend'
      '      then '#39#1053#1077' '#1074#1099#1089#1083#1072#1085' '#1089#1095#1077#1090#39
      '    when  '
      
        '      ca.InvoicePayDateCarrier is not null and ca.InvoicePayCarS' +
        'end is not null and  ca.InvoicePayCarReceive is not null and'
      
        '      WorkDayBetween2(ca.InvoicePayCarReceive, Now()) > e.In' +
        'voicePay and  CarriageCarrierPaySum(ca.ID) < ca.Cost '
      '      then '#39#1053#1077' '#1086#1087#1083#1072#1095#1077#1085' '#1089#1095#1077#1090#39
      '    else '#39#39
      '  end as Comment      '
      'from'
      '  Request R'
      '  inner join Carriage CA on'
      '    R.ID = CA.ID_Request and ca.RemindCarrier = 1 and'
      '    ((CA.ID_Employee = :IDEmployee) or (:rem = 1)) and'
      
        '    (Date_Format(CA.FromDate, '#39'%Y.%m.%d'#39') >= :FD or (:FD = '#39#39')) ' +
        'and'
      '    (Date_Format(CA.FromDate, '#39'%Y.%m.%d'#39') <= :TD or (:TD = '#39#39'))'
      '  inner join enterprise e'
      'order by'
      '  CARName, FromDate')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDEmployee'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rem'
        ParamType = ptUnknown
      end
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
    Left = 276
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEmployee'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rem'
        ParamType = ptUnknown
      end
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
    object qReminderCarrierID: TIntegerField
      FieldName = 'ID'
    end
    object qReminderCarrierComment: TWideStringField
      DisplayLabel = #1057#1080#1090#1091#1072#1094#1080#1103
      FieldName = 'Comment'
      Size = 50
    end
    object qReminderCarrierCLIName: TWideStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CLIName'
      ReadOnly = True
      Size = 50
    end
    object qReminderCarrierRInfo: TWideStringField
      DisplayLabel = #1052#1072#1088#1096#1088#1091#1090
      FieldName = 'RInfo'
      ReadOnly = True
      Size = 100
    end
    object qReminderCarrierCargoName: TWideStringField
      DisplayLabel = #1043#1088#1091#1079
      FieldName = 'CargoName'
      Required = True
      Size = 50
    end
    object qReminderCarrierCARName: TWideStringField
      DisplayLabel = #1055#1077#1088#1077#1074#1086#1079#1095#1080#1082
      FieldName = 'CARName'
      ReadOnly = True
      Size = 50
    end
    object qReminderCarrierTInfo: TWideStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      FieldName = 'TInfo'
      ReadOnly = True
      Size = 100
    end
    object qReminderCarrierTRInfo: TWideStringField
      DisplayLabel = #1055#1088#1080#1094#1077#1087
      FieldName = 'TRInfo'
      ReadOnly = True
      Size = 100
    end
    object qReminderCarrierDInfo: TWideStringField
      DisplayLabel = #1042#1086#1076#1080#1090#1077#1083#1100
      FieldName = 'DInfo'
      ReadOnly = True
      Size = 100
    end
    object qReminderCarrierFromDate: TDateTimeField
      DisplayLabel = #1047#1072#1075#1088#1091#1079#1082#1072
      FieldName = 'FromDate'
      Required = True
    end
    object qReminderCarrierToDate: TDateTimeField
      DisplayLabel = #1056#1072#1079#1075#1088#1091#1079#1082#1072
      FieldName = 'ToDate'
      Required = True
    end
    object qReminderCarrierEInfo: TWideStringField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1083
      FieldName = 'EInfo'
      ReadOnly = True
      Size = 50
    end
    object qReminderCarrierID_Request: TIntegerField
      FieldName = 'ID_Request'
      Required = True
    end
    object qReminderCarrierInvoicePayDateCarrier: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1077#1090#1072
      FieldName = 'InvoicePayDateCarrier'
    end
    object qReminderCarrierInvoicePayNumCarrier: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
      FieldName = 'InvoicePayNumCarrier'
      Size = 50
    end
    object qReminderCarrierInvoicePayCarSend: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1095#1077#1090#1072
      FieldName = 'InvoicePayCarSend'
    end
    object qReminderCarrierInvoicePayCarReceive: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1089#1095#1077#1090#1072
      FieldName = 'InvoicePayCarReceive'
    end
    object qReminderCarrierCost: TFloatField
      DisplayLabel = #1057#1090#1072#1074#1082#1072
      FieldName = 'Cost'
      Required = True
    end
    object qReminderCarrierPaySum: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PaySum'
      ReadOnly = True
    end
    object qReminderCarrierNumber: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1075#1088#1091#1079#1072
      FieldName = 'Number'
      Required = True
    end
    object qReminderCarrierRealized: TSmallintField
      DisplayLabel = #1042#1099#1087#1086#1083#1085#1077#1085#1072
      FieldName = 'Realized'
    end
    object qReminderCarrierRealizeDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'RealizeDate'
    end
    object qReminderCarrierContractnumCarrier: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072'-'#1079#1072#1103#1074#1082#1080
      FieldName = 'ContractnumCarrier'
      Required = True
    end
    object qReminderCarrierContractDateCarrier: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072'-'#1079#1072#1103#1074#1082#1080
      FieldName = 'ContractDateCarrier'
      Required = True
    end
    object qReminderCarrierOrgInfo: TWideStringField
      DisplayLabel = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      FieldName = 'OrgInfo'
      ReadOnly = True
      Size = 50
    end
    object qReminderCarrierDocReady: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1072
      FieldName = 'DocReady'
    end
    object qReminderCarrierDocReadyDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'DocReadyDate'
    end
    object qReminderCarrierReturnBase: TWideStringField
      DisplayLabel = #1041#1072#1079#1072
      FieldName = 'ReturnBase'
      Required = True
      Size = 50
    end
    object qReminderCarrierReturnTime: TDateTimeField
      DisplayLabel = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1073#1072#1079#1091
      FieldName = 'ReturnTime'
    end
  end
  object GridClient: TcxGridPopupMenu
    Grid = DBGridClient
    PopupMenus = <>
    Left = 404
    Top = 252
  end
  object GridCarrier: TcxGridPopupMenu
    Grid = DBGridCarrier
    PopupMenus = <>
    Left = 488
    Top = 252
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = cbMode
        Properties.Strings = (
          'ItemIndex')
      end
      item
        Component = eFrom
        Properties.Strings = (
          'Text')
      end
      item
        Component = eTo
        Properties.Strings = (
          'Text')
      end>
    StorageName = 'PropertiesStore'
    Left = 72
    Top = 296
  end
end
