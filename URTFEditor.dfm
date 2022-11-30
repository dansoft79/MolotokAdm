object RTFEditorForm: TRTFEditorForm
  Left = 546
  Top = 366
  HelpContext = 788400
  ActiveControl = mText
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1088#1077#1076#1072#1082#1090#1086#1088
  ClientHeight = 462
  ClientWidth = 884
  Color = clBtnFace
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 426
    Width = 884
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
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
  end
  object BarDockControlMessage: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 884
    Height = 50
    Align = dalTop
    BarManager = BarManager
  end
  object mText: TcxRichEdit
    AlignWithMargins = True
    Left = 4
    Top = 54
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
    ExplicitTop = 46
    ExplicitHeight = 376
    Height = 368
    Width = 610
  end
  object lbTag: TcxListBox
    AlignWithMargins = True
    Left = 630
    Top = 54
    Width = 250
    Height = 368
    Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1076#1083#1103' '#1074#1089#1090#1072#1074#1082#1080' '#1090#1101#1075#1072' '#1074' '#1090#1077#1082#1089#1090
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alRight
    ItemHeight = 13
    PopupMenu = PopupMenu
    TabOrder = 3
    OnDblClick = lbTagDblClick
    ExplicitTop = 46
    ExplicitHeight = 376
  end
  object Splitter: TcxSplitter
    Left = 618
    Top = 50
    Width = 8
    Height = 376
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
    Control = lbTag
    ExplicitTop = 42
    ExplicitHeight = 384
  end
  object PropertiesStore: TcxPropertiesStore
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 220
    Top = 156
  end
  object ActionList: TActionList
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
    object aExit: TAction
      Category = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076
      ShortCut = 27
      OnExecute = aExitExecute
    end
    object aCopyTag: TAction
      Category = #1058#1101#1075#1080
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1090#1101#1075
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1090#1101#1075
      OnExecute = aCopyTagExecute
    end
    object aPasteTag: TAction
      Category = #1058#1101#1075#1080
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1090#1101#1075
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1090#1101#1075
      OnExecute = aPasteTagExecute
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
      #1057#1086#1086#1073#1097#1077#1085#1080#1077
      #1058#1101#1075#1080)
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
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
    object dxBarButton1: TdxBarButton
      Action = aCopyTag
      Category = 2
    end
    object dxBarButton2: TdxBarButton
      Action = aPasteTag
      Category = 2
    end
  end
  object PopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton1'
      end
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end>
    UseOwnFont = False
    Left = 652
    Top = 204
    PixelsPerInch = 96
  end
end
