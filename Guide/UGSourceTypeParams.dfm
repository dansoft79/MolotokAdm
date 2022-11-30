object GSourceTypeParamForm: TGSourceTypeParamForm
  Left = 436
  Top = 305
  HelpContext = 663300
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1089#1090#1086#1095#1085#1080#1082#1072' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 180
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
    Top = 144
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
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
    Left = 8
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
    Left = 8
    Top = 32
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 88
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 53
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 72
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbColor: TcxLabel
    Left = 216
    Top = 32
    Caption = #1062#1074#1077#1090':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbDef: TcxCheckBox
    Left = 8
    Top = 8
    AutoSize = False
    Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object eColor: TdxColorEdit
    Left = 216
    Top = 48
    Properties.ImmediatePost = True
    Properties.ColorSet = csTheme1
    TabOrder = 3
    Width = 201
  end
end
