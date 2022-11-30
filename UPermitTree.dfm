object PermitTreeForm: TPermitTreeForm
  Left = 289
  Top = 148
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1103
  ClientHeight = 473
  ClientWidth = 692
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 200
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TcxSplitter
    Left = 353
    Top = 0
    Width = 8
    Height = 437
    Cursor = crHSplit
    HotZoneClassName = 'TcxSimpleStyle'
    AutoSnap = True
    ResizeUpdate = True
    Control = gbPermitTree
    Color = clBtnFace
    ParentColor = False
  end
  object gbPermitTree: TcxGroupBox
    Left = 0
    Top = 0
    Align = alLeft
    Caption = #1044#1077#1088#1077#1074#1086' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074':'
    TabOrder = 0
    Height = 437
    Width = 353
    object Tree: TcxTreeView
      AlignWithMargins = True
      Left = 6
      Top = 18
      Width = 341
      Height = 413
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
      HideSelection = False
      HotTrack = True
      Indent = 23
      ReadOnly = True
      RowSelect = True
      OnChange = TreeChange
    end
  end
  object gbList: TcxGroupBox
    Left = 361
    Top = 0
    Align = alClient
    Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1081':'
    TabOrder = 2
    Height = 437
    Width = 331
    object pEdit: TPanel
      Left = 2
      Top = 404
      Width = 327
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object cbEdit: TcxCheckBox
        Left = 8
        Top = 4
        AutoSize = False
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
        TabOrder = 0
        Transparent = True
        OnClick = cbEditClick
        Height = 21
        Width = 149
      end
    end
    object List: TcxListView
      AlignWithMargins = True
      Left = 6
      Top = 18
      Width = 319
      Height = 382
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Checkboxes = True
      ColumnClick = False
      Columns = <
        item
          AutoSize = True
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ShowColumnHeaders = False
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
      OnChange = ListChange
      OnSelectItem = ListSelectItem
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 437
    Width = 692
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      692
      36)
    object cxButton1: TcxButton
      Left = 518
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      OptionsImage.NumGlyphs = 2
      TabOrder = 2
    end
    object cxButton2: TcxButton
      Left = 602
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      OptionsImage.NumGlyphs = 2
      TabOrder = 3
    end
    object sbUnselectAll: TcxButton
      Left = 60
      Top = 4
      Width = 48
      Height = 25
      Hint = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1074#1089#1077
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D760600000000000036000000280000001400000014000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FF9080
        70FF908070FF908070FF908070FF908070FF908070FF908070FF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFFAFAFAFFF5F5F5FFF0F0F0FFECEC
        ECFFE7E7E7FFE2E2E2FF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFFFFF
        FFFFFAFAFAFFF5F5F5FFF0F0F0FFECECECFFE7E7E7FFE2E2E2FF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFFAFAFAFFF5F5F5FFF0F0F0FFECEC
        ECFFE7E7E7FFE2E2E2FF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFFFFF
        FFFFFAFAFAFFF5F5F5FFF0F0F0FFECECECFFE7E7E7FFE2E2E2FF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFFAFAFAFFF5F5F5FFF0F0F0FFECEC
        ECFFE7E7E7FFE2E2E2FF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFFFFF
        FFFFFAFAFAFFF5F5F5FFF0F0F0FFECECECFFE7E7E7FFE2E2E2FF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFFAFAFAFFF5F5F5FFF0F0F0FFECEC
        ECFFE7E7E7FFE2E2E2FF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFD0B8
        A0FFD0B8A0FFD0B8A0FFD0B8A0FFD0B8A0FFD0B8A0FFD0B8A0FFD0B8A0FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FF9080
        70FF908070FF908070FF908070FF908070FF908070FF908070FF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFF9F9F9FFF4F4F4FFEEEEEEFFE8E8
        E8FFE3E3E3FFDDDDDDFF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFFFFF
        FFFFF9F9F9FFF4F4F4FFEEEEEEFFE8E8E8FFE3E3E3FFDDDDDDFF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFF9F9F9FFF4F4F4FFEEEEEEFFE8E8
        E8FFE3E3E3FFDDDDDDFF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFFFFF
        FFFFF9F9F9FFF4F4F4FFEEEEEEFFE8E8E8FFE3E3E3FFDDDDDDFF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFF9F9F9FFF4F4F4FFEEEEEEFFE8E8
        E8FFE3E3E3FFDDDDDDFF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFFFFF
        FFFFF9F9F9FFF4F4F4FFEEEEEEFFE8E8E8FFE3E3E3FFDDDDDDFF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFF9F9F9FFF4F4F4FFEEEEEEFFE8E8
        E8FFE3E3E3FFDDDDDDFF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFD0B8
        A0FFD0B8A0FFD0B8A0FFD0B8A0FFD0B8A0FFD0B8A0FFD0B8A0FFD0B8A0FF0000
        00000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = sbUnselectAllClick
    end
    object sbSelectAll: TcxButton
      Left = 8
      Top = 4
      Width = 48
      Height = 25
      Hint = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1089#1077
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D760600000000000036000000280000001400000014000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B0A0FF6048
        30FF705840FF807060FFA08880FF908070FF908070FF908070FF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFFFFFFFFFF0E0D0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8B0FFFFFF
        FFFFD0D0E0FF7080D0FFC0C8E0FFFFFFFFFFFFFFFFFFFFFFFFFF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0C8B0FFC0C8E0FF5068D0FF2050E0FF4060D0FFD0D8
        E0FFFFFFFFFFFFFFFFFF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E0D0C0FF4060
        D0FF4068F0FF6080FFFF3058E0FF7080D0FFE0E8F0FFFFFFFFFF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0C0C0FF90A8FFFF90A0FFFFD0D0F0FFA0B0F0FF4060
        E0FF8090D0FFE0D8E0FF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0C0B0FFF0F0
        FFFFF0E8FFFFFFF8FFFFFFF8FFFFC0C8FFFF4058D0FF9090C0FFA09080FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF8
        FFFFD0D8FFFF6078E0FF707890FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFD0B8
        A0FFD0B8A0FFD0B8A0FFD0B8B0FFD0C8C0FFE0D8D0FFD0D0F0FF7088D0FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B0A0FF6048
        30FF705840FF807060FFA08880FF908070FF908070FF908070FF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFFFFFFFFFF0E0D0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8B0FFFFFF
        FFFFD0D0E0FF7080D0FFC0C8E0FFFFFFFFFFFFFFFFFFFFFFFFFF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0C8B0FFC0C8E0FF5068D0FF2050E0FF4060D0FFD0D8
        E0FFFFFFFFFFFFFFFFFF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E0D0C0FF4060
        D0FF4068F0FF6080FFFF3058E0FF7080D0FFE0E8F0FFFFFFFFFF908070FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0C0C0FF90A8FFFF90A0FFFFD0D0F0FFA0B0F0FF4060
        E0FF8090D0FFE0D8E0FF908070FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0C0B0FFF0F0
        FFFFF0E8FFFFFFF8FFFFFFF8FFFFC0C8FFFF4058D0FF9090C0FFA09080FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF8
        FFFFD0D8FFFF6078E0FF707890FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000D0B8A0FFD0B8
        A0FFD0B8A0FFD0B8A0FFD0B8B0FFD0C8C0FFE0D8D0FFD0D0F0FF7088D0FF0000
        00000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = sbSelectAllClick
    end
  end
end
