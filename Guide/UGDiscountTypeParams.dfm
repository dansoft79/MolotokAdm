object GDiscountTypeParamForm: TGDiscountTypeParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1082#1080#1076#1082#1080
  ClientHeight = 368
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
    Top = 332
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 22
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
    Top = 52
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
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 36
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1080#1076#1082#1080' '#1080#1083#1080' '#1087#1088#1086#1084#1086#1072#1082#1094#1080#1080' ('#1085#1077#1087#1091#1073#1083#1080#1095#1085#1086#1077'):'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 236
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1082#1080#1076#1082#1080' ('#1085#1077#1087#1091#1073#1083#1080#1095#1085#1086#1077'):'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 252
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
    TabOrder = 18
    OnKeyDown = eKeyDown
    Height = 77
    Width = 409
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
  object cxLabel1: TcxLabel
    Left = 8
    Top = 76
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
    Style.TextStyle = []
    Transparent = True
  end
  object eFromDate: TcxDateEdit
    Left = 8
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel4: TcxLabel
    Left = 216
    Top = 76
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object eToDate: TcxDateEdit
    Left = 216
    Top = 92
    Properties.OnChange = eChange
    TabOrder = 4
    OnKeyDown = eKeyDown
    Width = 201
  end
  object ePromocode: TcxTextEdit
    Left = 8
    Top = 132
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
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 116
    Caption = #1055#1088#1086#1084#1086#1082#1086#1076':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbType: TcxComboBox
    Left = 216
    Top = 132
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      #1087#1088#1086#1094#1077#1085#1090
      #1089#1091#1084#1084#1072)
    Properties.OnChange = cbTypePropertiesChange
    TabOrder = 7
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel6: TcxLabel
    Left = 216
    Top = 116
    Caption = #1058#1080#1087' '#1089#1082#1080#1076#1082#1080':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eSize: TcxSpinEdit
    Left = 8
    Top = 172
    AutoSize = False
    BeepOnEnter = False
    Properties.AssignedValues.MinValue = True
    Properties.DisplayFormat = '0 '#39#1088'.'#39
    Properties.LargeIncrement = 1000.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.OnChange = eChange
    TabOrder = 9
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 156
    Caption = #1056#1072#1079#1084#1077#1088' '#1089#1082#1080#1076#1082#1080':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eMinOrderSum: TcxSpinEdit
    Left = 216
    Top = 172
    AutoSize = False
    BeepOnEnter = False
    Properties.AssignedValues.MinValue = True
    Properties.DisplayFormat = '0 '#39#1088'.'#39
    Properties.EditFormat = '0 '#39#1088'.'#39
    Properties.ImmediatePost = True
    Properties.LargeIncrement = 1000.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.OnChange = eChange
    TabOrder = 10
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel8: TcxLabel
    Left = 216
    Top = 156
    Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1072':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbDebtType: TcxComboBox
    Left = 8
    Top = 212
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      #1089' '#1079#1072#1082#1072#1079#1072
      #1089' '#1072#1075#1077#1085#1090#1072
      #1089' '#1084#1072#1089#1090#1077#1088#1072)
    Properties.OnChange = eChange
    TabOrder = 12
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel9: TcxLabel
    Left = 8
    Top = 196
    Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1089#1082#1080#1076#1082#1080':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbSubType: TcxComboBox
    Left = 216
    Top = 212
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      #1080#1079' '#1087#1086#1079#1080#1094#1080#1080' '#1079#1072#1082#1072#1079#1072
      #1080#1079' '#1089#1091#1084#1084#1099' '#1079#1072#1082#1072#1079#1072)
    Properties.OnChange = eChange
    TabOrder = 13
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel10: TcxLabel
    Left = 216
    Top = 196
    Caption = #1042#1099#1095#1077#1090' '#1089#1082#1080#1076#1082#1080':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbCanAdd: TcxCheckBox
    Left = 216
    Top = 12
    Hint = #1052#1086#1078#1077#1090' '#1089#1091#1084#1084#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1089' '#1076#1088#1091#1075#1080#1084#1080' '#1089#1082#1080#1076#1082#1072#1084#1080
    AutoSize = False
    Caption = #1052#1086#1078#1077#1090' '#1089#1091#1084#1084#1080#1088#1086#1074#1072#1090#1100#1089#1103
    ParentShowHint = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    ShowHint = True
    Style.TextStyle = [fsBold]
    TabOrder = 1
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
end
