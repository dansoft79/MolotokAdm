object TextForm: TTextForm
  Left = 339
  Top = 225
  HelpContext = 777700
  Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1088#1077#1076#1072#1082#1090#1086#1088
  ClientHeight = 473
  ClientWidth = 692
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 250
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 50
    Width = 692
    Height = 403
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Memo: TcxRichEdit
      Left = 0
      Top = 0
      Align = alClient
      ParentFont = False
      Properties.HideScrollBars = False
      Properties.PlainText = True
      Properties.ScrollBars = ssBoth
      Properties.OnChange = MemoPropertiesChange
      Properties.OnSelectionChange = MemoPropertiesSelectionChange
      Lines.Strings = (
        'Memo')
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Height = 403
      Width = 692
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 453
    Width = 692
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taRightJustify
        Bevel = dxpbNone
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = #1057#1090#1088#1086#1082#1072':'
        Width = 60
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taRightJustify
        Bevel = dxpbNone
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = #1050#1086#1083#1086#1085#1082#1072':'
        Width = 60
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taRightJustify
        Bevel = dxpbNone
        Text = #1042#1089#1077#1075#1086' '#1089#1090#1088#1086#1082':'
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object FindDialog: TFindDialog
    Options = [frDown, frHideUpDown]
    OnFind = FindOne
    Left = 76
    Top = 104
  end
  object PrinterSetupDialog: TPrinterSetupDialog
    Left = 176
    Top = 105
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 324
    Top = 97
  end
  object ActionList: TActionList
    Images = UtilForm.ImageList
    Left = 168
    Top = 160
    object aOK: TAction
      Caption = 'OK'
      Hint = 'OK'
      ImageIndex = 99
      ShortCut = 27
      OnExecute = aOKExecute
    end
    object aPrint: TAction
      Caption = 'aPrint'
      ImageIndex = 103
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aOpen: TAction
      Caption = 'aOpen'
      ImageIndex = 113
      ShortCut = 16463
      OnExecute = aOpenExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1089#1090
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1089#1090
      ImageIndex = 114
      ShortCut = 16467
      OnExecute = aSaveExecute
    end
    object aFind: TAction
      Caption = #1053#1072#1081#1090#1080
      Hint = #1053#1072#1081#1090#1080
      ImageIndex = 129
      ShortCut = 16454
      OnExecute = aFindExecute
    end
    object aReplace: TAction
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100
      Hint = #1047#1072#1084#1077#1085#1080#1090#1100
      ImageIndex = 128
      ShortCut = 16466
      OnExecute = aReplaceExecute
    end
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
    ImageOptions.Images = UtilForm.ImageList2
    ImageOptions.LargeImages = UtilForm.ImageListBig2
    ImageOptions.LargeIcons = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 432
    Top = 88
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
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end>
      OldName = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton1: TdxBarButton
      Action = aOK
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aSave
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = aPrint
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aFind
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Action = aOpen
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = aReplace
      Category = 0
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 324
    Top = 148
  end
  object ReplaceDialog: TReplaceDialog
    OnFind = FindOne
    OnReplace = ReplaceDialogReplace
    Left = 80
    Top = 160
  end
end
