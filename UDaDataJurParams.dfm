object DaDataJurForm: TDaDataJurForm
  Left = 546
  Top = 366
  HelpContext = 790600
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082' '#1076#1072#1085#1085#1099#1093' '#1085#1072' '#1089#1077#1088#1074#1080#1089#1077' DaData'
  ClientHeight = 445
  ClientWidth = 594
  Color = clBtnFace
  Constraints.MaxWidth = 600
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 8
    Top = 4
    Width = 88
    Height = 16
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090':'
  end
  object Label1: TLabel
    Left = 8
    Top = 156
    Width = 147
    Height = 16
    Caption = #1053#1072#1081#1076#1077#1085#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
  end
  object pBottom: TPanel
    Left = 0
    Top = 412
    Width = 594
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      594
      33)
    object bOK: TcxButton
      AlignWithMargins = True
      Left = 418
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object bCancel: TcxButton
      AlignWithMargins = True
      Left = 506
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ListVariant: TcxListBox
    Left = 8
    Top = 44
    Width = 577
    Height = 109
    ItemHeight = 16
    TabOrder = 1
    OnClick = ListVariantClick
    OnEnter = ListVariantEnter
    OnExit = ListVariantExit
    OnKeyDown = ListVariantKeyDown
    OnKeyPress = eKeyPress
  end
  object eText: TcxTextEdit
    Left = 8
    Top = 20
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eTextChange
    TabOrder = 0
    OnKeyDown = eTextKeyDown
    OnKeyPress = eKeyPress
    Height = 24
    Width = 577
  end
  object ListBox: TcxListView
    Left = 8
    Top = 172
    Width = 577
    Height = 237
    Columns = <
      item
        Caption = #1057#1074#1086#1081#1089#1090#1074#1086
        Width = 110
      end
      item
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Width = 320
      end>
    HideSelection = False
    Items.ItemData = {
      05880100000A00000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
      000C1D04300438043C0435043D043E04320430043D043804350400000000FFFF
      FFFFFFFFFFFF00000000FFFFFFFF000000000C200443043A043E0432043E0434
      043804420435043B044C0400000000FFFFFFFFFFFFFFFF00000000FFFFFFFF00
      0000000914043E043B0436043D043E04410442044C0400000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFF000000000318041D041D0400000000FFFFFFFFFFFFFF
      FF00000000FFFFFFFF00000000031A041F041F0400000000FFFFFFFFFFFFFFFF
      00000000FFFFFFFF00000000041E04130420041D0400000000FFFFFFFFFFFFFF
      FF00000000FFFFFFFF00000000051004340440043504410400000000FFFFFFFF
      FFFFFFFF00000000FFFFFFFF00000000051E041A0412042D04140400000000FF
      FFFFFFFFFFFFFF00000000FFFFFFFF00000000041E041A041F041E0400000000
      FFFFFFFFFFFFFFFF00000000FFFFFFFF000000000921043E04410442043E044F
      043D0438043504}
    TabOrder = 2
    ViewStyle = vsReport
    OnEnter = ListBoxEnter
    OnKeyDown = ListBoxKeyDown
    OnKeyPress = eKeyPress
  end
end
