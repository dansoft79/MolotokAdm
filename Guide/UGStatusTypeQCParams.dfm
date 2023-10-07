object GStatusTypeQCParamForm: TGStatusTypeQCParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1090#1072#1090#1091#1089#1072' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1082#1072#1095#1077#1089#1090#1074#1072
  ClientHeight = 270
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
    Top = 234
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 10
    ExplicitTop = 452
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
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
      OnClick = bOKClick
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
    Left = 8
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 8
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 104
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 49
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 88
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbColor: TcxLabel
    Left = 216
    Top = 48
    Caption = #1062#1074#1077#1090':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbDef: TcxCheckBox
    Left = 8
    Top = 160
    AutoSize = False
    Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 8
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbFin: TcxCheckBox
    Left = 8
    Top = 184
    AutoSize = False
    Caption = #1047#1072#1082#1088#1099#1074#1072#1102#1097#1080#1081
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Style.TextStyle = [fsBold]
    TabOrder = 9
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 48
    Caption = #1053#1086#1084#1077#1088' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091':'
    Style.TextStyle = []
    Transparent = True
  end
  object eStatusOrder: TcxSpinEdit
    Left = 8
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object eColor: TdxColorEdit
    Left = 216
    Top = 64
    Properties.ImmediatePost = True
    Properties.ColorSet = csTheme1
    TabOrder = 4
    Width = 201
  end
  object cbEnd: TcxCheckBox
    Left = 8
    Top = 208
    AutoSize = False
    Caption = #1047#1072#1074#1077#1088#1096#1072#1077#1090' '#1086#1087#1088#1086#1089
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = False
    TabOrder = 11
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
end
