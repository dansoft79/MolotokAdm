object GPaymentFormParamForm: TGPaymentFormParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1086#1088#1084#1099' '#1086#1087#1083#1072#1090#1099
  ClientHeight = 226
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
    Top = 190
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
    ExplicitTop = 180
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
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 1
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
  object cxLabel2: TcxLabel
    Left = 8
    Top = 48
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 64
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 61
    Width = 409
  end
  object cbDef: TcxCheckBox
    Left = 8
    Top = 132
    AutoSize = False
    Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 4
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbShowOnClient: TcxCheckBox
    Left = 8
    Top = 156
    AutoSize = False
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1072' '#1082#1083#1080#1077#1085#1090#1077
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 6
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbShowClientButton: TcxCheckBox
    Left = 216
    Top = 156
    AutoSize = False
    Caption = #1050#1085#1086#1087#1082#1072' '#1085#1072' '#1082#1083#1080#1077#1085#1090#1077
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 7
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbShowOnMaster: TcxCheckBox
    Left = 216
    Top = 132
    AutoSize = False
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1072' '#1084#1072#1089#1090#1077#1088#1077
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 5
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
end
