object DatasetModalForm: TDatasetModalForm
  Left = 339
  Top = 225
  HelpContext = -1
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1072#1085#1085#1099#1093
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
  OldCreateOrder = False
  Position = poScreenCenter
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
    object DBGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 692
      Height = 403
      Align = alClient
      Constraints.MinHeight = 1
      TabOrder = 0
      object TableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Appending = True
        OptionsView.Navigator = True
        OptionsView.Footer = True
      end
      object DBGridLevel: TcxGridLevel
        GridView = TableView
      end
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
        Text = #1057#1090#1088#1086#1082':'
        Width = 60
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
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
    Left = 352
    Top = 160
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
          ItemName = 'dxBarButton2'
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
    object dxBarButton2: TdxBarButton
      Action = aPrint
      Category = 0
    end
  end
  object dsQuery: TDataSource
    Left = 80
    Top = 160
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = DBGrid
    PopupMenus = <>
    Left = 264
    Top = 160
  end
end
