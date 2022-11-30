object GFAQParamForm: TGFAQParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1063#1040#1042#1054
  ClientHeight = 312
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
    Top = 276
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    ExplicitTop = 248
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
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    ParentFont = False
    Properties.OnChange = eChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 76
    Caption = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 120
    Caption = #1058#1077#1082#1089#1090' '#1086#1090#1074#1077#1090#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 136
    ParentFont = False
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Properties.OnChange = eCommentPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 137
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 36
    Caption = #1055#1086#1088#1103#1076#1086#1082' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object ePosition: TcxSpinEdit
    Left = 8
    Top = 52
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbActive: TcxCheckBox
    Left = 8
    Top = 12
    AutoSize = False
    Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1080#1074#1085#1072
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
end
