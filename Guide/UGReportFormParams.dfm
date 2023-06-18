object ReportFormParamsForm: TReportFormParamsForm
  Left = 372
  Top = 268
  HelpContext = 671400
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 309
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
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 16
    ExplicitTop = 237
    DesignSize = (
      425
      33)
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
  object bEditForm: TcxButton
    Left = 8
    Top = 216
    Width = 137
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1092#1086#1088#1084#1091' ...'
    OptionsImage.NumGlyphs = 2
    TabOrder = 14
    TabStop = False
    OnClick = bEditFormClick
  end
  object bDelForm: TcxButton
    Left = 8
    Top = 248
    Width = 137
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1088#1084#1091' ...'
    OptionsImage.NumGlyphs = 2
    TabOrder = 15
    TabStop = False
    OnClick = bDelFormClick
  end
  object eName: TcxTextEdit
    Left = 8
    Top = 60
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eNameChange
    TabOrder = 3
    OnKeyDown = eTypeKeyDown
    Height = 21
    Width = 409
  end
  object eType: TcxComboBox
    Left = 8
    Top = 20
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eTypeChange
    TabOrder = 1
    OnKeyDown = eTypeKeyDown
    Height = 21
    Width = 409
  end
  object Label1: TcxLabel
    Left = 8
    Top = 4
    Caption = #1058#1080#1087':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 44
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 124
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    Style.TextStyle = []
    Transparent = True
  end
  object mComment: TcxMemo
    Left = 8
    Top = 140
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 13
    OnKeyDown = eTypeKeyDown
    Height = 69
    Width = 409
  end
  object eLastNumber: TcxSpinEdit
    Left = 88
    Top = 100
    AutoSize = False
    BeepOnEnter = False
    Properties.AssignedValues.MinValue = True
    Properties.MaxValue = 999999999.000000000000000000
    TabOrder = 9
    Height = 21
    Width = 121
  end
  object cxLabel3: TcxLabel
    Left = 88
    Top = 84
    Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1085#1086#1084#1077#1088':'
    Style.TextStyle = []
    Transparent = True
  end
  object eLastYear: TcxSpinEdit
    Left = 296
    Top = 100
    AutoSize = False
    BeepOnEnter = False
    Properties.MaxValue = 9999.000000000000000000
    Properties.MinValue = 1000.000000000000000000
    TabOrder = 11
    Value = 2023
    Height = 21
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 296
    Top = 84
    Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1075#1086#1076':'
    Style.TextStyle = []
    Transparent = True
  end
  object eNumPrefix: TcxTextEdit
    Left = 8
    Top = 100
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eNameChange
    TabOrder = 8
    OnKeyDown = eTypeKeyDown
    Height = 21
    Width = 81
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 84
    Caption = #1055#1088#1077#1092#1080#1082#1089':'
    Style.TextStyle = []
    Transparent = True
  end
  object eNumSuffix: TcxTextEdit
    Left = 208
    Top = 100
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eNameChange
    TabOrder = 10
    OnKeyDown = eTypeKeyDown
    Height = 21
    Width = 81
  end
  object cxLabel6: TcxLabel
    Left = 208
    Top = 84
    Caption = #1057#1091#1092#1092#1080#1082#1089':'
    Style.TextStyle = []
    Transparent = True
  end
end
