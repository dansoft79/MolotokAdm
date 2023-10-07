object GSurveyParamForm: TGSurveyParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1086#1087#1088#1086#1089#1072
  ClientHeight = 347
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
    Top = 311
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 12
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
  object cxLabel3: TcxLabel
    Left = 8
    Top = 116
    Caption = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 228
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 244
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
    TabOrder = 11
    OnKeyDown = eKeyDown
    Height = 61
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
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    TabOrder = 3
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
    Properties.OnChange = eChange
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 76
    Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbVisibility: TcxComboBox
    Left = 8
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsFixedList
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Items.Strings = (
      #1044#1083#1103' '#1084#1086#1076#1077#1088#1072#1090#1086#1088#1072
      #1044#1083#1103' '#1082#1083#1080#1077#1085#1090#1072
      #1044#1083#1103' '#1084#1086#1076#1077#1088#1072#1090#1086#1088#1072' '#1080' '#1082#1083#1080#1077#1085#1090#1072)
    Properties.OnChange = eChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object eQuestion: TcxMemo
    Left = 8
    Top = 132
    ParentFont = False
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Properties.OnChange = eChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 8
    OnKeyDown = eKeyDown
    Height = 93
    Width = 409
  end
  object cxLabel5: TcxLabel
    Left = 216
    Top = 76
    Caption = #1058#1080#1087' '#1086#1090#1074#1077#1090#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbAnswerType: TcxComboBox
    Left = 216
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsFixedList
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Items.Strings = (
      #1051#1086#1075#1080#1095#1077#1089#1082#1080#1081
      #1054#1076#1080#1085' '#1086#1090#1074#1077#1090
      #1052#1091#1083#1100#1090#1080#1086#1090#1074#1077#1090
      #1057#1074#1086#1073#1086#1076#1085#1099#1081' '#1086#1090#1074#1077#1090)
    Properties.OnChange = eChange
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbAnswerRequired: TcxCheckBox
    Left = 216
    Top = 12
    AutoSize = False
    Caption = #1054#1090#1074#1077#1090' '#1086#1073#1103#1079#1072#1090#1077#1083#1077#1085
    Properties.FullFocusRect = True
    Properties.OnChange = eChange
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = False
    TabOrder = 1
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
end
