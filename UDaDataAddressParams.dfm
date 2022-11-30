object AddressDaDataForm: TAddressDaDataForm
  Left = 546
  Top = 366
  HelpContext = 790600
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082' '#1076#1072#1085#1085#1099#1093' '#1085#1072' '#1089#1077#1088#1074#1080#1089#1077' DaData'
  ClientHeight = 489
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
    Top = 456
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
  object eText: TcxTextEdit
    Left = 8
    Top = 20
    Properties.OnChange = eTextChange
    TabOrder = 0
    OnKeyDown = eTextKeyDown
    OnKeyPress = eKeyPress
    Width = 577
  end
  object ListVariant: TcxListBox
    Left = 8
    Top = 44
    Width = 577
    Height = 109
    ItemHeight = 16
    TabOrder = 1
    OnClick = eTextClick
    OnEnter = ListVariantEnter
    OnKeyDown = ListVariantKeyDown
    OnKeyPress = eKeyPress
  end
  object ListBox: TcxListView
    Left = 8
    Top = 172
    Width = 577
    Height = 281
    Columns = <
      item
        Caption = #1057#1074#1086#1081#1089#1090#1074#1086
        Width = 230
      end
      item
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Width = 320
      end>
    HideSelection = False
    Items.ItemData = {
      053C0200000B00000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
      000620043504330438043E043D0400000000FFFFFFFFFFFFFFFF00000000FFFF
      FFFF00000000052004300439043E043D0400000000FFFFFFFFFFFFFFFF000000
      00FFFFFFFF00000000101D043004410435043B0435043D043D044B0439042000
      3F0443043D043A04420400000000FFFFFFFFFFFFFFFF00000000FFFFFFFF0000
      00000523043B0438044604300400000000FFFFFFFFFFFFFFFF00000000FFFFFF
      FF000000000314043E043C0400000000FFFFFFFFFFFFFFFF00000000FFFFFFFF
      00000000081A04320430044004420438044004300400000000FFFFFFFFFFFFFF
      FF00000000FFFFFFFF000000001F1A043E04340420003D043004410435043B04
      35043D043D043E0433043E0420003F0443043D043A044204300420003F043E04
      20001A041B0410041404200400000000FFFFFFFFFFFFFFFF00000000FFFFFFFF
      00000000121A043E043404200043043B04380446044B0420003F043E0420001A
      041B0410041404200400000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
      00111A043E043404200034043E043C04300420003F043E0420001A041B041004
      1404200400000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000000F1F043E
      04470442043E0432044B043904200038043D04340435043A04410400000000FF
      FFFFFFFFFFFFFF00000000FFFFFFFF000000001310043A044204430430043B04
      4C043D043E04410442044C042000340430043D043D044B044504}
    TabOrder = 2
    ViewStyle = vsReport
    OnEnter = ListBoxEnter
    OnKeyDown = ListBoxKeyDown
    OnKeyPress = eKeyPress
  end
end
