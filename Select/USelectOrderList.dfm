object SelectOrderListForm: TSelectOrderListForm
  Left = 388
  Top = 259
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 547
  ClientWidth = 1160
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
  object DBGrid: TcxGrid
    Left = 0
    Top = 50
    Width = 1160
    Height = 480
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 703
    ExplicitHeight = 411
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
      ScrollbarAnnotations.CustomAnnotations = <>
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
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewOrderNUmber: TcxGridDBColumn
        DataBinding.FieldName = 'OrderNUmber'
        Width = 80
      end
      object TableViewOrderDate: TcxGridDBColumn
        DataBinding.FieldName = 'OrderDate'
      end
      object TableViewPersonalAccount: TcxGridDBColumn
        DataBinding.FieldName = 'PersonalAccount'
        Width = 120
      end
      object TableViewOCInfo: TcxGridDBColumn
        DataBinding.FieldName = 'OCInfo'
      end
      object TableViewClosed: TcxGridDBColumn
        DataBinding.FieldName = 'Closed'
        RepositoryItem = Datas.EditRepositoryIntCheckBox
      end
      object TableViewCloseTime: TcxGridDBColumn
        DataBinding.FieldName = 'CloseTime'
      end
      object TableViewPhone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
      end
      object TableViewAddress: TcxGridDBColumn
        DataBinding.FieldName = 'Address'
        Width = 200
      end
      object TableViewFlatNumber: TcxGridDBColumn
        DataBinding.FieldName = 'FlatNumber'
        Width = 80
      end
      object TableViewStatusInfo: TcxGridDBColumn
        DataBinding.FieldName = 'StatusInfo'
        Width = 150
      end
      object TableViewStatusComment: TcxGridDBColumn
        DataBinding.FieldName = 'StatusComment'
        Width = 200
      end
      object TableViewSignalInfo: TcxGridDBColumn
        DataBinding.FieldName = 'SignalInfo'
        Width = 120
      end
      object TableViewPFInfo: TcxGridDBColumn
        DataBinding.FieldName = 'PFInfo'
        Width = 120
      end
      object TableViewSourceInfo: TcxGridDBColumn
        DataBinding.FieldName = 'SourceInfo'
        Width = 120
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 530
    Width = 1160
    Height = 17
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
    ExplicitTop = 461
    ExplicitWidth = 703
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 244
    Top = 140
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 72
    Top = 140
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
    ImageOptions.Images = UtilForm.ImageList
    ImageOptions.LargeImages = UtilForm.ImageListBig
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 132
    Top = 140
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
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Visible = ivAlways
      ImageIndex = 100
    end
    object dxBarButton2: TdxBarButton
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      Category = 0
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      Visible = ivAlways
      ImageIndex = 118
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
  object Query: TZQuery
    Connection = Datas.ZConnection
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
      'order by  '
      '  OL.ID desc')
    Params = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 188
    Top = 136
    ParamData = <
      item
        DataType = ftWideString
        Name = 'D'
        ParamType = ptUnknown
        Value = '0'
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
end
