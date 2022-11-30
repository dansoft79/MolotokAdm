object GClientParamForm: TGClientParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 268
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 232
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 15
    DesignSize = (
      425
      36)
    object bOK: TcxButton
      Left = 251
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
      Left = 335
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
  object eName: TcxTextEdit
    Left = 216
    Top = 48
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel3: TcxLabel
    Left = 216
    Top = 32
    Caption = #1048#1084#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 152
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 168
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 11
    OnKeyDown = eKeyDown
    Height = 61
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 32
    Caption = #1058#1077#1083#1077#1092#1086#1085':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eAddress: TcxTextEdit
    Left = 8
    Top = 88
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 309
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 72
    Caption = #1040#1076#1088#1077#1089':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel5: TcxLabel
    Left = 324
    Top = 72
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072':'
    Style.TextStyle = []
    Transparent = True
  end
  object eFlatNumber: TcxTextEdit
    Left = 324
    Top = 88
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 93
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 112
    Caption = #1056#1072#1081#1086#1085' '#1075#1086#1088#1086#1076#1072':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbDistrict: TcxComboBox
    Left = 8
    Top = 128
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = cbDistrictPropertiesChange
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel7: TcxLabel
    Left = 216
    Top = 112
    Caption = #1057#1090#1072#1085#1094#1080#1103' '#1084#1077#1090#1088#1086':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbMetro: TcxComboBox
    Left = 216
    Top = 128
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.DropDownRows = 20
    Properties.OnPopup = cbMetroPropertiesPopup
    TabOrder = 7
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object ePhone: TcxMaskEdit
    Left = 8
    Top = 48
    AutoSize = False
    BeepOnEnter = False
    Properties.EditMask = '!\(999\)\ 000-0000;1;_'
    Properties.OnChange = eChange
    TabOrder = 1
    Text = '(   )    -    '
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbClientDomSPB: TcxCheckBox
    Left = 8
    Top = 8
    AutoSize = False
    Caption = #1050#1083#1080#1077#1085#1090' '#1044#1086#1084' '#1057#1055#1041
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object qMetro: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *, DistrictInfo(ID_District) as DInfo'
      'from Metro'
      'where ID_District <> :IDD'
      'order by Name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDD'
        ParamType = ptUnknown
      end>
    Left = 28
    Top = 177
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDD'
        ParamType = ptUnknown
      end>
  end
end
