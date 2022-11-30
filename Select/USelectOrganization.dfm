object SelectOrganizationForm: TSelectOrganizationForm
  Left = 388
  Top = 259
  HelpContext = 773900
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
  ClientHeight = 442
  ClientWidth = 742
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
    Width = 742
    Height = 375
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
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
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
        Width = 70
      end
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 200
      end
      object TableViewShortName: TcxGridDBColumn
        DataBinding.FieldName = 'ShortName'
        Width = 150
      end
      object TableViewNameBank: TcxGridDBColumn
        DataBinding.FieldName = 'NameBank'
        Width = 150
      end
      object TableViewMasterFIO: TcxGridDBColumn
        DataBinding.FieldName = 'MasterFIO'
        Width = 150
      end
      object TableViewMasterPost: TcxGridDBColumn
        DataBinding.FieldName = 'MasterPost'
        Width = 150
      end
      object TableViewAddress: TcxGridDBColumn
        DataBinding.FieldName = 'Address'
        Width = 300
      end
      object TableViewJurAddress: TcxGridDBColumn
        DataBinding.FieldName = 'JurAddress'
        Width = 300
      end
      object TableViewPhone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
        Width = 200
      end
      object TableViewFax: TcxGridDBColumn
        DataBinding.FieldName = 'Fax'
        Width = 200
      end
      object TableViewEMail: TcxGridDBColumn
        DataBinding.FieldName = 'EMail'
        Width = 200
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 425
    Width = 742
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
    ImageOptions.Images = UtilForm.ImageList2
    ImageOptions.LargeImages = UtilForm.ImageListBig2
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 148
    Top = 80
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
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select O.*'
      'from Organization O'
      'where O.Active = 1'
      'order by O.Name')
    Params = <>
    Left = 204
    Top = 80
    object QueryID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object QueryID_Partner: TIntegerField
      FieldName = 'ID_Partner'
      Required = True
    end
    object QueryType: TWideStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'Type'
      Required = True
      Size = 50
    end
    object QueryName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Required = True
      Size = 100
    end
    object QueryShortName: TWideStringField
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'ShortName'
      Required = True
      Size = 50
    end
    object QueryNameBank: TWideStringField
      DisplayLabel = #1041#1072#1085#1082#1086#1074#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NameBank'
      Required = True
      Size = 200
    end
    object QueryMasterFIO: TWideStringField
      DisplayLabel = #1060#1048#1054' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
      FieldName = 'MasterFIO'
      Required = True
      Size = 50
    end
    object QueryMasterPost: TWideStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
      FieldName = 'MasterPost'
      Required = True
      Size = 50
    end
    object QueryMasterFIORP: TWideStringField
      FieldName = 'MasterFIORP'
      Required = True
      Size = 50
    end
    object QueryMasterPostRP: TWideStringField
      FieldName = 'MasterPostRP'
      Required = True
      Size = 50
    end
    object QueryBasis: TWideStringField
      FieldName = 'Basis'
      Required = True
      Size = 200
    end
    object QueryAccountant: TWideStringField
      FieldName = 'Accountant'
      Required = True
      Size = 50
    end
    object QueryPSer: TWideStringField
      FieldName = 'PSer'
      Required = True
      Size = 10
    end
    object QueryPNum: TWideStringField
      FieldName = 'PNum'
      Required = True
    end
    object QueryPWho: TWideStringField
      FieldName = 'PWho'
      Required = True
      Size = 100
    end
    object QueryPDate: TDateTimeField
      FieldName = 'PDate'
    end
    object QueryTown: TWideStringField
      FieldName = 'Town'
      Required = True
      Size = 50
    end
    object QueryAddress: TWideStringField
      DisplayLabel = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
      FieldName = 'Address'
      Required = True
      Size = 100
    end
    object QueryJurAddress: TWideStringField
      DisplayLabel = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
      FieldName = 'JurAddress'
      Required = True
      Size = 100
    end
    object QueryPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'Phone'
      Required = True
      Size = 50
    end
    object QueryFax: TWideStringField
      DisplayLabel = #1060#1072#1082#1089
      FieldName = 'Fax'
      Required = True
      Size = 50
    end
    object QueryEMail: TWideStringField
      FieldName = 'EMail'
      Required = True
      Size = 50
    end
    object QueryWebSite: TWideStringField
      FieldName = 'WebSite'
      Required = True
      Size = 50
    end
    object QueryINN: TWideStringField
      FieldName = 'INN'
      Required = True
    end
    object QueryKPP: TWideStringField
      FieldName = 'KPP'
      Required = True
    end
    object QueryOKPO: TWideStringField
      FieldName = 'OKPO'
      Required = True
      Size = 50
    end
    object QueryRS: TWideStringField
      FieldName = 'RS'
      Required = True
      Size = 30
    end
    object QueryBIK: TWideStringField
      FieldName = 'BIK'
      Required = True
    end
    object QueryKS: TWideStringField
      FieldName = 'KS'
      Required = True
      Size = 30
    end
    object QueryBank: TWideStringField
      FieldName = 'Bank'
      Required = True
      Size = 100
    end
    object QueryComment: TWideMemoField
      FieldName = 'Comment'
      BlobType = ftWideMemo
    end
    object QueryContractNumClient: TIntegerField
      FieldName = 'ContractNumClient'
      Required = True
    end
    object QueryContractYearClient: TIntegerField
      FieldName = 'ContractYearClient'
      Required = True
    end
    object QueryContractNumCarrier: TIntegerField
      FieldName = 'ContractNumCarrier'
      Required = True
    end
    object QueryContractYearCarrier: TIntegerField
      FieldName = 'ContractYearCarrier'
      Required = True
    end
    object QueryInvoicePayNum: TIntegerField
      FieldName = 'InvoicePayNum'
      Required = True
    end
    object QueryInvoicePayYear: TIntegerField
      FieldName = 'InvoicePayYear'
      Required = True
    end
    object QueryInvoiceNum: TIntegerField
      FieldName = 'InvoiceNum'
      Required = True
    end
    object QueryInvoiceYear: TIntegerField
      FieldName = 'InvoiceYear'
      Required = True
    end
    object QueryAssertTime: TDateTimeField
      FieldName = 'AssertTime'
    end
    object QueryID_AssertEmployee: TSmallintField
      FieldName = 'ID_AssertEmployee'
    end
    object QueryActive: TSmallintField
      FieldName = 'Active'
      Required = True
    end
    object QueryActYear: TIntegerField
      FieldName = 'ActYear'
      Required = True
    end
    object QueryActNum: TIntegerField
      FieldName = 'ActNum'
      Required = True
    end
    object QueryNameAct: TWideStringField
      FieldName = 'NameAct'
      Required = True
      Size = 50
    end
    object QueryNameInvoice: TWideStringField
      FieldName = 'NameInvoice'
      Required = True
      Size = 50
    end
    object QueryNameInvoicePay: TWideStringField
      FieldName = 'NameInvoicePay'
      Required = True
      Size = 50
    end
  end
end
