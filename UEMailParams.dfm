object EMailParamsForm: TEMailParamsForm
  Left = 546
  Top = 366
  HelpContext = 788500
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  ClientHeight = 562
  ClientWidth = 884
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    884
    562)
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 526
    Width = 884
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      884
      36)
    object bOK: TcxButton
      Left = 710
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 794
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      OptionsImage.NumGlyphs = 2
      TabOrder = 1
    end
    object bEdit: TcxButton
      Left = 8
      Top = 4
      Width = 239
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' c '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077#1084' '#1076#1072#1085#1085#1099#1093
      OptionsImage.NumGlyphs = 2
      TabOrder = 2
      OnClick = bEditClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Caption = 'EMail:'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eSubject: TcxTextEdit
    Left = 8
    Top = 64
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 1
    OnKeyDown = eEMAILKeyDown
    Height = 21
    Width = 617
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 48
    Caption = #1058#1077#1084#1072':'
    Style.TextStyle = []
    Transparent = True
  end
  object eEMAIL: TcxButtonEdit
    Left = 8
    Top = 24
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BeepOnEnter = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = eEMAILPropertiesButtonClick
    Properties.OnChange = eNameChange
    TabOrder = 0
    OnDblClick = eEMAILDblClick
    OnKeyDown = eEMAILKeyDown
    Height = 21
    Width = 617
  end
  object gbMessge: TcxGroupBox
    Left = 8
    Top = 88
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077':'
    Constraints.MinHeight = 1
    TabOrder = 6
    Height = 433
    Width = 867
    object BarDockControlMessage: TdxBarDockControl
      Left = 2
      Top = 18
      Width = 863
      Height = 50
      Align = dalTop
      BarManager = BarManager
    end
    object mConvert: TRichEdit
      AlignWithMargins = True
      Left = 6
      Top = 400
      Width = 855
      Height = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        #1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1082#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1074' html')
      ParentFont = False
      TabOrder = 1
      Visible = False
      Zoom = 100
    end
    object mText: TcxRichEdit
      AlignWithMargins = True
      Left = 6
      Top = 72
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      ParentFont = False
      Properties.HideScrollBars = False
      Properties.HideSelection = False
      Properties.ScrollBars = ssVertical
      Properties.WantTabs = True
      Properties.OnSelectionChange = mTextSelectionChange
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      ExplicitTop = 64
      ExplicitHeight = 328
      Height = 320
      Width = 855
    end
  end
  object cxLabel2: TcxLabel
    Left = 632
    Top = 8
    Anchors = [akTop, akRight]
    Caption = #1060#1072#1081#1083#1099':'
    Style.TextStyle = []
    Transparent = True
  end
  object lbFiles: TcxListBox
    Left = 632
    Top = 24
    Width = 245
    Height = 61
    Anchors = [akTop, akRight]
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnDblClick = lbFilesDblClick
  end
  object PropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = eSubject
        Properties.Strings = (
          'Text')
      end>
    StorageName = 'PropertiesStore'
    Left = 220
    Top = 156
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 316
    Top = 196
    object aBold: TAction
      Category = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      Caption = #1046#1080#1088#1099#1081
      Hint = #1046#1080#1088#1099#1081
      ImageIndex = 378
      ShortCut = 16450
      OnExecute = aBoldExecute
    end
    object aItalic: TAction
      Category = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      Caption = #1050#1091#1088#1089#1080#1074
      Hint = #1050#1091#1088#1089#1080#1074
      ImageIndex = 379
      ShortCut = 16457
      OnExecute = aItalicExecute
    end
    object aUnderline: TAction
      Category = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      Caption = #1055#1086#1076#1095#1077#1088#1082#1080#1074#1072#1085#1080#1077
      Hint = #1050#1091#1088#1089#1080#1074
      ImageIndex = 380
      ShortCut = 16469
      OnExecute = aUnderlineExecute
    end
    object aLeft: TAction
      Category = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      Caption = #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
      Hint = #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
      ImageIndex = 382
      ShortCut = 16460
      OnExecute = aLeftExecute
    end
    object aCenter: TAction
      Category = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      Caption = #1055#1086' '#1094#1077#1085#1090#1088#1091
      Hint = #1055#1086' '#1094#1077#1085#1090#1088#1091
      ImageIndex = 383
      ShortCut = 16453
      OnExecute = aCenterExecute
    end
    object aRight: TAction
      Category = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      Caption = #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
      Hint = #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
      ImageIndex = 384
      ShortCut = 16466
      OnExecute = aRightExecute
    end
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      #1057#1086#1086#1073#1097#1077#1085#1080#1077)
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = UtilForm.ImageList
    ImageOptions.LargeImages = UtilForm.ImageListBig
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 432
    Top = 228
    PixelsPerInch = 96
    object BarManagerBar4: TdxBar
      AllowClose = False
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      CaptionButtons = <>
      DockControl = BarDockControlMessage
      DockedDockControl = BarDockControlMessage
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 916
      FloatTop = 8
      FloatClientWidth = 200
      FloatClientHeight = 192
      ItemLinks = <
        item
          Visible = True
          ItemName = 'FontName'
        end
        item
          Visible = True
          ItemName = 'FontSize'
        end
        item
          Visible = True
          ItemName = 'FontColor'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bBold'
        end
        item
          Visible = True
          ItemName = 'bItalic'
        end
        item
          Visible = True
          ItemName = 'bUnderline'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bLeft'
        end
        item
          Visible = True
          ItemName = 'bCenter'
        end
        item
          Visible = True
          ItemName = 'bRight'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object FontName: TcxBarEditItem
      Caption = #1064#1088#1080#1092#1090':'
      Category = 1
      Hint = #1064#1088#1080#1092#1090
      Visible = ivAlways
      OnChange = FontNameChange
      Width = 200
      PropertiesClassName = 'TcxFontNameComboBoxProperties'
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      InternalEditValue = 'Arial'
    end
    object FontSize: TcxBarEditItem
      Caption = #1056#1072#1079#1084#1077#1088':'
      Category = 1
      Hint = #1056#1072#1079#1084#1077#1088':'
      Visible = ivAlways
      Width = 50
      PropertiesClassName = 'TcxSpinEditProperties'
      Properties.ImmediatePost = True
      Properties.MaxValue = 80.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.OnChange = FontSizePropertiesChange
      Properties.OnEditValueChanged = FontSizePropertiesEditValueChanged
      InternalEditValue = '12'
    end
    object FontColor: TcxBarEditItem
      Caption = #1062#1074#1077#1090':'
      Category = 1
      Hint = #1062#1074#1077#1090
      Visible = ivAlways
      OnChange = FontColorChange
      Width = 80
      PropertiesClassName = 'TcxColorComboBoxProperties'
      Properties.AllowSelectColor = True
      Properties.CustomColors = <>
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.NamingConvention = cxncX11
      Properties.PrepareList = cxplX11
      Properties.ShowDescriptions = False
      Properties.ValidateOnEnter = False
      InternalEditValue = 0
    end
    object bBold: TdxBarButton
      Action = aBold
      Category = 1
      AllowAllUp = True
      ButtonStyle = bsChecked
    end
    object bItalic: TdxBarButton
      Action = aItalic
      Category = 1
      AllowAllUp = True
      ButtonStyle = bsChecked
    end
    object bUnderline: TdxBarButton
      Action = aUnderline
      Category = 1
      AllowAllUp = True
      ButtonStyle = bsChecked
    end
    object bLeft: TdxBarButton
      Action = aLeft
      Category = 1
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object bCenter: TdxBarButton
      Action = aCenter
      Category = 1
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object bRight: TdxBarButton
      Action = aRight
      Category = 1
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
  end
  object Report: TfrxReport
    Version = '6.9.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41973.806255578690000000
    ReportOptions.LastChange = 41973.806255578690000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 676
    Top = 200
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
