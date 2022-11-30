object SelectClientForm1: TSelectClientForm1
  Left = 388
  Top = 259
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
  ClientHeight = 431
  ClientWidth = 895
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
    Width = 895
    Height = 364
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
      FilterRow.SeparatorWidth = 5
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
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 212
      end
      object TableViewShortName: TcxGridDBColumn
        DataBinding.FieldName = 'ShortName'
        Width = 183
      end
      object TableViewType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
        Width = 111
      end
      object TableViewINN: TcxGridDBColumn
        DataBinding.FieldName = 'INN'
      end
      object TableViewKPP: TcxGridDBColumn
        DataBinding.FieldName = 'KPP'
        Width = 94
      end
      object ableViewColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'IsClient'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 80
      end
      object ableViewColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'IsCarrier'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 80
      end
      object ableViewColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'IsBuyer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 80
      end
      object ableViewColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'IsSeller'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 80
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 319
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 414
    Width = 895
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
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 100
      OnExecute = aAddExecute
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
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
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
      Action = aAdd
      Category = 0
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select * from Partner'
      'where ('
      ''
      
        '  (select Admin + AccessAllPartner from Employee where ID = :ID1' +
        ') > 0 or'
      
        '  ID in (select ID_Partner from PartnerFix where ID_Employee = :' +
        'ID2)) '
      ''
      'order by Name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2'
        ParamType = ptUnknown
      end>
    Left = 204
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2'
        ParamType = ptUnknown
      end>
    object QueryName: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 100
    end
    object QueryShortName: TWideStringField
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'ShortName'
      Size = 50
    end
    object QueryComment: TWideMemoField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
      DisplayWidth = 10
      FieldName = 'Comment'
      BlobType = ftWideMemo
    end
    object QueryType: TWideStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 50
      FieldName = 'Type'
      Size = 50
    end
    object QueryID: TIntegerField
      FieldName = 'ID'
    end
    object QueryAppendDate: TDateTimeField
      FieldName = 'AppendDate'
    end
    object QueryID_Employee: TSmallintField
      FieldName = 'ID_Employee'
    end
    object QueryMasterFIO: TWideStringField
      FieldName = 'MasterFIO'
      Size = 50
    end
    object QueryMasterPost: TWideStringField
      FieldName = 'MasterPost'
      Size = 50
    end
    object QueryMasterFIORP: TWideStringField
      FieldName = 'MasterFIORP'
      Size = 50
    end
    object QueryMasterPostRP: TWideStringField
      FieldName = 'MasterPostRP'
      Size = 50
    end
    object QueryBasis: TWideStringField
      FieldName = 'Basis'
      Size = 200
    end
    object QueryPSer: TWideStringField
      FieldName = 'PSer'
      Size = 10
    end
    object QueryPNum: TWideStringField
      FieldName = 'PNum'
    end
    object QueryPWho: TWideStringField
      FieldName = 'PWho'
      Size = 100
    end
    object QueryPDate: TDateTimeField
      FieldName = 'PDate'
    end
    object QueryCPerson: TWideStringField
      FieldName = 'CPerson'
      Size = 100
    end
    object QueryTown: TWideStringField
      FieldName = 'Town'
      Size = 50
    end
    object QueryAddress: TWideStringField
      FieldName = 'Address'
      Size = 100
    end
    object QueryJurAddress: TWideStringField
      FieldName = 'JurAddress'
      Size = 100
    end
    object QueryPhone: TWideStringField
      FieldName = 'Phone'
      Size = 50
    end
    object QueryFax: TWideStringField
      FieldName = 'Fax'
      Size = 50
    end
    object QueryEMail: TWideStringField
      FieldName = 'EMail'
      Size = 50
    end
    object QueryWebSite: TWideStringField
      FieldName = 'WebSite'
      Size = 50
    end
    object QueryINN: TWideStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
    end
    object QueryKPP: TWideStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
    end
    object QueryOKPO: TWideStringField
      FieldName = 'OKPO'
      Size = 50
    end
    object QueryRS: TWideStringField
      FieldName = 'RS'
      Size = 30
    end
    object QueryBIK: TWideStringField
      FieldName = 'BIK'
    end
    object QueryKS: TWideStringField
      FieldName = 'KS'
      Size = 30
    end
    object QueryBank: TWideStringField
      FieldName = 'Bank'
      Size = 100
    end
    object QueryWithNDS: TSmallintField
      FieldName = 'WithNDS'
    end
    object QueryRegion: TWideStringField
      FieldName = 'Region'
      Size = 100
    end
    object QueryLine: TWideStringField
      FieldName = 'Line'
      Size = 100
    end
    object QueryProduction: TWideStringField
      FieldName = 'Production'
      Size = 100
    end
    object QueryIsCarrier: TSmallintField
      DisplayLabel = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldName = 'IsCarrier'
    end
    object QueryIsClient: TSmallintField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      FieldName = 'IsClient'
    end
    object QueryIsSeller: TSmallintField
      DisplayLabel = #1055#1088#1086#1076#1072#1074#1077#1094
      FieldName = 'IsSeller'
    end
    object QueryIsBuyer: TSmallintField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      FieldName = 'IsBuyer'
    end
    object QueryPayDayCountClient: TSmallintField
      FieldName = 'PayDayCountClient'
    end
    object QueryPayStartDateClient: TSmallintField
      FieldName = 'PayStartDateClient'
    end
    object QueryPayDayCountCarrier: TSmallintField
      FieldName = 'PayDayCountCarrier'
    end
    object QueryPayStartDateCarrier: TSmallintField
      FieldName = 'PayStartDateCarrier'
    end
    object QueryContractNumClient: TWideStringField
      FieldName = 'ContractNumClient'
      Size = 50
    end
    object QueryContractDateClient: TDateTimeField
      FieldName = 'ContractDateClient'
    end
    object QueryID_OrganizationClient: TSmallintField
      FieldName = 'ID_OrganizationClient'
    end
    object QueryContractNumCarrier: TWideStringField
      FieldName = 'ContractNumCarrier'
      Size = 50
    end
    object QueryContractDateCarrier: TDateTimeField
      FieldName = 'ContractDateCarrier'
    end
    object QueryID_OrganizationCarrier: TSmallintField
      FieldName = 'ID_OrganizationCarrier'
    end
    object QueryNameBank: TWideStringField
      FieldName = 'NameBank'
      Required = True
      Size = 200
    end
    object QueryAccountant: TWideStringField
      FieldName = 'Accountant'
      Size = 50
    end
    object QueryLastClientLoadDate: TDateTimeField
      FieldName = 'LastClientLoadDate'
    end
    object QueryLastCarrierLoadDate: TDateTimeField
      FieldName = 'LastCarrierLoadDate'
    end
    object QueryID_EmployeeAppend: TSmallintField
      FieldName = 'ID_EmployeeAppend'
    end
    object QueryContractCarrierKind: TSmallintField
      FieldName = 'ContractCarrierKind'
      Required = True
    end
    object QueryContractCarrierReturnDate: TDateTimeField
      FieldName = 'ContractCarrierReturnDate'
    end
    object QueryContractCarrierReceiveDate: TDateTimeField
      FieldName = 'ContractCarrierReceiveDate'
    end
    object QueryContractCarrierSendDate: TDateTimeField
      FieldName = 'ContractCarrierSendDate'
    end
    object QueryContractClientKind: TSmallintField
      FieldName = 'ContractClientKind'
      Required = True
    end
    object QueryContractClientReturnDate: TDateTimeField
      FieldName = 'ContractClientReturnDate'
    end
    object QueryContractClientReceiveDate: TDateTimeField
      FieldName = 'ContractClientReceiveDate'
    end
    object QueryContractClientSendDate: TDateTimeField
      FieldName = 'ContractClientSendDate'
    end
    object QueryActive: TSmallintField
      FieldName = 'Active'
      Required = True
    end
    object QueryAssertDate: TDateTimeField
      FieldName = 'AssertDate'
    end
  end
end
