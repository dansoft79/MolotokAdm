object QueryForm: TQueryForm
  Left = 441
  Top = 239
  Action = MainForm.aaSQLQuery
  Caption = 'SQL '#1079#1072#1087#1088#1086#1089
  ClientHeight = 533
  ClientWidth = 678
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 519
    Width = 678
    Height = 14
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
  end
  object DBGrid: TcxGrid
    Left = 0
    Top = 283
    Width = 678
    Height = 236
    Align = alBottom
    Constraints.MinHeight = 1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dsQuery
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Appending = True
      OptionsView.GroupByBox = False
    end
    object DBGridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object cxSplitter: TcxSplitter
    Left = 0
    Top = 275
    Width = 678
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
    Control = DBGrid
  end
  object Memo: TSynMemo
    Left = 0
    Top = 50
    Width = 678
    Height = 225
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    CodeFolding.GutterShapeSize = 11
    CodeFolding.CollapsedLineColor = clGrayText
    CodeFolding.FolderBarLinesColor = clGrayText
    CodeFolding.IndentGuidesColor = clGray
    CodeFolding.IndentGuides = True
    CodeFolding.ShowCollapsedLine = False
    CodeFolding.ShowHintMark = True
    UseCodeFolding = False
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Highlighter = SynSQLSyn
    OnChange = MemoChange
    FontSmoothing = fsmNone
  end
  object SQL: TcxLabel
    Left = 344
    Top = 17
    Transparent = True
    Visible = False
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 104
    Top = 80
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 19
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aExecute: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 112
      ShortCut = 16453
      OnExecute = aExecuteExecute
    end
    object aOpen: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1087#1088#1086#1089
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 69
      ShortCut = 16463
      OnExecute = aOpenExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 68
      ShortCut = 16467
      OnExecute = aSaveExecute
    end
  end
  object dsQuery: TDataSource
    DataSet = Query
    Left = 236
    Top = 80
  end
  object dSave: TSaveDialog
    DefaultExt = 'sql'
    Filter = 'SQL|*.sql'
    FilterIndex = 2
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1090#1077#1082#1089#1090#1072' '#1079#1072#1087#1088#1086#1089#1072
    Left = 292
    Top = 80
  end
  object dOpen: TOpenDialog
    DefaultExt = 'sql'
    Filter = 'SQL|*.sql'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1054#1090#1082#1088#1099#1090#1080#1077' '#1090#1077#1082#1089#1090#1072' '#1079#1072#1087#1088#1086#1089#1072
    Left = 340
    Top = 80
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
    Left = 408
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
      FloatLeft = 297
      FloatTop = 151
      FloatClientWidth = 97
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
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
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bGridmode'
        end>
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton1: TdxBarButton
      Action = aCancel
      Category = 0
      ImageIndex = 99
    end
    object dxBarButton2: TdxBarButton
      Action = aOpen
      Category = 0
      ImageIndex = 113
    end
    object dxBarButton3: TdxBarButton
      Action = aSave
      Category = 0
      ImageIndex = 114
    end
    object dxBarButton4: TdxBarButton
      Action = aExecute
      Category = 0
    end
    object dxBarStatic1: TdxBarStatic
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082':'
      Category = 0
      Hint = #1047#1072#1075#1086#1083#1086#1074#1086#1082':'
      Visible = ivAlways
    end
    object dxBarEditTitle: TdxBarEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarButton5: TdxBarButton
      Action = aPrint
      Category = 0
      ImageIndex = 103
    end
    object bGridmode: TdxBarButton
      Caption = #1055#1088#1086#1089#1090#1072#1103' '#1089#1077#1090#1082#1072
      Category = 0
      Hint = #1055#1088#1086#1089#1090#1072#1103' '#1089#1077#1090#1082#1072
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      OnClick = bGridmodeClick
    end
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = DBGrid
    PopupMenus = <>
    Left = 208
    Top = 292
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = DBGrid
        Properties.Strings = (
          'Height')
      end>
    StorageName = 'PropertiesStore'
    Left = 504
    Top = 84
  end
  object SynSQLSyn: TSynSQLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    TableNameAttri.Foreground = clGreen
    TableNameAttri.Style = [fsUnderline]
    TableNames.Strings = (
      'cargotype'
      'carriage'
      'carriageh'
      'carrierincome'
      'carrierincomeh'
      'carrierpayment'
      'clientincome'
      'clientincomeh'
      'clientpayment'
      'const'
      'contracttype'
      'costs'
      'coststype'
      'department'
      'docdelivery'
      'docform'
      'driver'
      'employee'
      'enterprise'
      'fuelamount'
      'fueldoc'
      'fuelsupplier'
      'holiday'
      'organization'
      'partner'
      'partnercontact'
      'partnerevent'
      'partnerfix'
      'partnerinteraction'
      'paymentform'
      'places'
      'point'
      'reportform'
      'reportsnap'
      'request'
      'requestmember'
      'route'
      'trailer'
      'trailerrepair'
      'trailerrepairtype'
      'transport'
      'transportfix'
      'transportrepair'
      'transportrepairtype'
      'transportstay'
      'transportstaysimple'
      'transporttype'
      'workday'
      'zzz')
    SQLDialect = sqlMySQL
    Left = 592
    Top = 80
  end
  object SynAutoComplete: TSynAutoComplete
    AutoCompleteList.Strings = (
      'sel'
      '=select |'
      '=from'
      '=where'
      '=order by'
      'del'
      '=delete from |'
      '=where'
      'upd'
      '=update | '
      '=set '
      'ins'
      '=insert | () '
      '=values ()')
    EndOfTokenChr = '()[]. '
    Editor = Memo
    ShortCut = 16458
    DoLookupWhenNotExact = False
    Options = [scoCompleteWithEnter]
    Left = 400
    Top = 164
  end
  object SynCompletion: TSynCompletionProposal
    ItemList.Strings = (
      'cargotype'
      'carriage'
      'carrier'
      'carrierbalance'
      'carriercontact'
      'carrierevent'
      'carrierfix'
      'carrierincome'
      'carrierincomeh'
      'carrierinteraction'
      'carrierpayment'
      'client'
      'clientbalance'
      'clientcontact'
      'clientevent'
      'clientfix'
      'clientincome'
      'clientincomeh'
      'clientinteraction'
      'clientpayment'
      'contracttype'
      'costs'
      'coststype'
      'debetkredit'
      'department'
      'driver'
      'employee'
      'enterprise'
      'fuelamount'
      'fueldoc'
      'fuelsupplier'
      'holiday'
      'organization'
      'paymentform'
      'places'
      'point'
      'report'
      'reportform'
      'request'
      'requestmember'
      'route'
      'transport'
      'transportstay'
      'transportstaysimple'
      'transporttype')
    InsertList.Strings = (
      'cargotype'
      'carriage'
      'carrier'
      'carrierbalance'
      'carriercontact'
      'carrierevent'
      'carrierfix'
      'carrierincome'
      'carrierincomeh'
      'carrierinteraction'
      'carrierpayment'
      'client'
      'clientbalance'
      'clientcontact'
      'clientevent'
      'clientfix'
      'clientincome'
      'clientincomeh'
      'clientinteraction'
      'clientpayment'
      'contracttype'
      'costs'
      'coststype'
      'debetkredit'
      'department'
      'driver'
      'employee'
      'enterprise'
      'fuelamount'
      'fueldoc'
      'fuelsupplier'
      'holiday'
      'organization'
      'paymentform'
      'places'
      'point'
      'report'
      'reportform'
      'request'
      'requestmember'
      'route'
      'transport'
      'transportstay'
      'transportstaysimple'
      'transporttype')
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <>
    ShortCut = 16416
    Editor = Memo
    Left = 516
    Top = 164
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    Params = <>
    Left = 172
    Top = 80
  end
end
