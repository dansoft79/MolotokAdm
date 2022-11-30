object SelectEMailMultiForm: TSelectEMailMultiForm
  Left = 388
  Top = 259
  HelpContext = 788600
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1072#1076#1088#1077#1089#1072' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1087#1086#1095#1090#1099
  ClientHeight = 462
  ClientWidth = 884
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
    Width = 884
    Height = 395
    Align = alClient
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
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
      Navigator.InfoPanel.Visible = True
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
      OptionsSelection.MultiSelect = True
      OptionsSelection.CheckBoxPosition = cbpIndicator
      OptionsSelection.CheckBoxVisibility = [cbvDataRow, cbvColumnHeader]
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.ShowCheckBoxesDynamically = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 200
      end
      object TableViewShortName: TcxGridDBColumn
        DataBinding.FieldName = 'ShortName'
        Width = 150
      end
      object TableViewType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
        Visible = False
        Width = 87
      end
      object TableViewPCInfo: TcxGridDBColumn
        DataBinding.FieldName = 'PCInfo'
        Width = 200
      end
      object TableViewEMail: TcxGridDBColumn
        DataBinding.FieldName = 'EMail'
        Width = 200
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 200
      end
      object TableViewIsClient: TcxGridDBColumn
        DataBinding.FieldName = 'IsClient'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 60
      end
      object TableViewIsCarrier: TcxGridDBColumn
        DataBinding.FieldName = 'IsCarrier'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 60
      end
      object TableViewIsBuyer: TcxGridDBColumn
        DataBinding.FieldName = 'IsBuyer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 60
      end
      object TableViewIsSeller: TcxGridDBColumn
        DataBinding.FieldName = 'IsSeller'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taRightJustify
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 60
      end
      object TableViewINN: TcxGridDBColumn
        DataBinding.FieldName = 'INN'
      end
      object TableViewKPP: TcxGridDBColumn
        DataBinding.FieldName = 'KPP'
      end
      object TableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 445
    Width = 884
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
    object aSelectAll: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 120
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aUnselectAll: TAction
      Caption = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      Hint = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      ImageIndex = 121
      ShortCut = 16451
      OnExecute = aUnselectAllExecute
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
    Left = 148
    Top = 80
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
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'cbPartner'
        end
        item
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'cbContact'
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
      Action = aSelectAll
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = aUnselectAll
      Category = 0
    end
    object cbPartner: TcxBarEditItem
      Caption = #1040#1076#1088#1077#1089#1072' '#1082#1086#1084#1087#1072#1085#1080#1081
      Category = 0
      Hint = #1040#1076#1088#1077#1089#1072' '#1082#1086#1084#1087#1072#1085#1080#1081
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.OnChange = cbPartnerPropertiesChange
      InternalEditValue = 'True'
    end
    object cbContact: TcxBarEditItem
      Caption = #1040#1076#1088#1077#1089#1072' '#1082#1086#1085#1090#1072#1090#1085#1099#1093' '#1083#1080#1094
      Category = 0
      Hint = #1040#1076#1088#1077#1089#1072' '#1082#1086#1085#1090#1072#1090#1085#1099#1093' '#1083#1080#1094
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.OnChange = cbContactPropertiesChange
      InternalEditValue = 'True'
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    AfterScroll = QueryAfterScroll
    SQL.Strings = (
      'select'
      
        '  ID, Name, ShortName, Type, IsClient, IsCarrier, IsSeller, IsBu' +
        'yer, INN, KPP, PartnerContactFullInfo(0) as PCInfo, EMail, Comme' +
        'nt'
      'from Partner'
      'where'
      
        '  ((select Admin + AccessAllPartner from Employee where ID = :ID' +
        '1) > 0 or'
      
        '  ID in (select ID_Partner from PartnerFix where ID_Employee = :' +
        'ID2)) and (:PE = 1) and Trim(EMail) <> '#39#39
      ''
      'union'
      ''
      'select'
      
        '  P.ID, P.Name, P.ShortName, P.Type, P.IsClient, P.IsCarrier, P.' +
        'IsSeller, P.IsBuyer, P.INN, P.KPP, PartnerContactFullInfo(PC.ID)' +
        ' as EInfo, PC.EMail, PC.Comment'
      'from Partner P, PartnerContact PC'
      'where'
      
        '  ((select Admin + AccessAllPartner from Employee where ID = :ID' +
        '1) > 0 or'
      
        '  P.ID in (select ID_Partner from PartnerFix where ID_Employee =' +
        ' :ID2)) and'
      '  P.ID = PC.ID_Partner and (:CE = 1) and Trim(PC.EMail) <> '#39#39
      ''
      'order by Name, PCInfo')
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
      end
      item
        DataType = ftWideString
        Name = 'PE'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftWideString
        Name = 'CE'
        ParamType = ptUnknown
        Value = '1'
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
      end
      item
        DataType = ftWideString
        Name = 'PE'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftWideString
        Name = 'CE'
        ParamType = ptUnknown
        Value = '1'
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
      DisplayWidth = 200
      FieldName = 'Type'
      ReadOnly = True
      Size = 200
    end
    object QueryID: TIntegerField
      FieldName = 'ID'
    end
    object QueryIsClient: TSmallintField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      FieldName = 'IsClient'
    end
    object QueryIsCarrier: TSmallintField
      DisplayLabel = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldName = 'IsCarrier'
    end
    object QueryIsSeller: TSmallintField
      DisplayLabel = #1055#1088#1086#1076#1072#1074#1077#1094
      FieldName = 'IsSeller'
    end
    object QueryIsBuyer: TSmallintField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      FieldName = 'IsBuyer'
    end
    object QueryINN: TWideStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
    end
    object QueryKPP: TWideStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
    end
    object QueryPCInfo: TWideStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
      FieldName = 'PCInfo'
      ReadOnly = True
      Size = 200
    end
    object QueryEMail: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1087#1086#1095#1090#1099
      FieldName = 'EMail'
      Size = 50
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 464
    Top = 260
    PixelsPerInch = 96
    object StyleEMail: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
end
