object TextEditorForm: TTextEditorForm
  Left = 546
  Top = 366
  HelpContext = 788300
  ActiveControl = mText
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1088#1077#1076#1072#1082#1090#1086#1088
  ClientHeight = 282
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
    Top = 246
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
  object mText: TcxRichEdit
    AlignWithMargins = True
    Left = 4
    Top = 4
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    ParentFont = False
    Properties.HideScrollBars = False
    Properties.HideSelection = False
    Properties.PlainText = True
    Properties.ScrollBars = ssVertical
    Properties.WantTabs = True
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 238
    Width = 610
  end
  object lbTag: TcxListBox
    AlignWithMargins = True
    Left = 630
    Top = 4
    Width = 250
    Height = 238
    Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1076#1083#1103' '#1074#1089#1090#1072#1074#1082#1080' '#1090#1101#1075#1072' '#1074' '#1090#1077#1082#1089#1090
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alRight
    ItemHeight = 13
    PopupMenu = PopupMenu
    TabOrder = 6
    OnDblClick = lbTagDblClick
  end
  object Splitter: TcxSplitter
    Left = 618
    Top = 0
    Width = 8
    Height = 246
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
    Control = lbTag
  end
  object PropertiesStore: TcxPropertiesStore
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 216
    Top = 68
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList2
    Left = 328
    Top = 64
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
      #1058#1101#1075#1080)
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = UtilForm.ImageList2
    ImageOptions.LargeImages = UtilForm.ImageListBig2
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 432
    Top = 64
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarButton1: TdxBarButton
      Action = aCopyTag
      Category = 1
    end
    object dxBarButton2: TdxBarButton
      Action = aPasteTag
      Category = 1
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
    Left = 724
    Top = 72
  end
end
