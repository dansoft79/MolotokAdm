object NoticeOptionsTimeParamsForm: TNoticeOptionsTimeParamsForm
  Left = 546
  Top = 366
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1090#1086#1095#1082#1080' '#1086#1090#1089#1095#1077#1090#1072
  ClientHeight = 251
  ClientWidth = 425
  Color = clBtnFace
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
  object pBottom: TPanel
    Left = 0
    Top = 215
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 10
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
      TabOrder = 2
    end
    object ldadata: TcxLabel
      Left = 12
      Top = 4
      Transparent = True
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 56
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 8
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1083#1103':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eFieldCaption: TcxTextEdit
    Left = 8
    Top = 76
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object cbCondBefore: TcxCheckBox
    Left = 8
    Top = 156
    Caption = #1042#1086#1079#1084#1086#1078#1085#1086' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1077' '#1091#1089#1083#1086#1074#1080#1103' '#1044#1054
    Properties.OnChange = eChange
    TabOrder = 4
    Transparent = True
    OnKeyDown = eKeyDown
  end
  object cbCondAfter: TcxCheckBox
    Left = 8
    Top = 184
    Caption = #1042#1086#1079#1084#1086#1078#1085#1086' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1077' '#1091#1089#1083#1086#1074#1080#1103' '#1055#1054#1057#1051#1045
    Properties.OnChange = eChange
    TabOrder = 6
    Transparent = True
    OnKeyDown = eKeyDown
  end
  object eMinValue: TcxSpinEdit
    Left = 8
    Top = 124
    AutoSize = False
    BeepOnEnter = False
    Properties.AssignedValues.MinValue = True
    Properties.ImmediatePost = True
    Properties.LargeIncrement = 60.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 104
    Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'
    Style.TextStyle = []
    Transparent = True
  end
  object eMaxValue: TcxSpinEdit
    Left = 216
    Top = 124
    AutoSize = False
    BeepOnEnter = False
    Properties.AssignedValues.MinValue = True
    Properties.ImmediatePost = True
    Properties.LargeIncrement = 60.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.OnChange = eChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel4: TcxLabel
    Left = 216
    Top = 104
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'
    Style.TextStyle = []
    Transparent = True
  end
  object eFieldName: TcxComboBox
    Left = 8
    Top = 28
    BeepOnEnter = False
    Properties.DropDownSizeable = True
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Sorted = True
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Width = 409
  end
end
