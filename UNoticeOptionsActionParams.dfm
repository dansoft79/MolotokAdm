object NoticeOptionsActionParamsForm: TNoticeOptionsActionParamsForm
  Left = 546
  Top = 366
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1077#1081#1089#1090#1074#1080#1103
  ClientHeight = 400
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
    Top = 364
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 20
    ExplicitTop = 392
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
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1103' '#1074' '#1079#1072#1082#1072#1079#1072#1093':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 8
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1083#1103' '#1074' '#1079#1072#1082#1072#1079#1072#1093':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eOrderFieldCaption: TcxTextEdit
    Left = 8
    Top = 76
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object cbCondEqual: TcxCheckBox
    Left = 8
    Top = 252
    AutoSize = False
    Caption = #1042#1086#1079#1084#1086#1078#1085#1086' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1077' '#1091#1089#1083#1086#1074#1080#1103' '#1056#1040#1042#1053#1054
    Properties.FullFocusRect = True
    TabOrder = 11
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object cbCondNotEqual: TcxCheckBox
    Left = 8
    Top = 280
    AutoSize = False
    Caption = #1042#1086#1079#1084#1086#1078#1085#1086' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1077' '#1091#1089#1083#1086#1074#1080#1103' '#1053#1045' '#1056#1040#1042#1053#1054
    Properties.FullFocusRect = True
    TabOrder = 13
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 104
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1076#1083#1103' '#1091#1089#1090#1072#1085#1086#1074#1082#1080':'
    Style.TextStyle = []
    Transparent = True
  end
  object eOrderFieldName: TcxComboBox
    Left = 8
    Top = 28
    BeepOnEnter = False
    Properties.Sorted = True
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Width = 409
  end
  object cbCanSetNull: TcxCheckBox
    Left = 8
    Top = 308
    AutoSize = False
    Caption = #1042#1086#1079#1084#1086#1078#1085#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1072' NULL'
    Properties.FullFocusRect = True
    TabOrder = 15
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object cbCanSetValue: TcxCheckBox
    Left = 8
    Top = 336
    AutoSize = False
    Caption = #1042#1086#1079#1084#1086#1078#1085#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1072' '#1079#1085#1072#1095#1077#1085#1080#1103
    Properties.FullFocusRect = True
    TabOrder = 17
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object eOrderFieldValue: TcxTextEdit
    Left = 8
    Top = 124
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 152
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
    Style.TextStyle = []
    Transparent = True
  end
  object eTableName: TcxTextEdit
    Left = 8
    Top = 172
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 7
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel5: TcxLabel
    Left = 216
    Top = 152
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
    Style.TextStyle = []
    Transparent = True
  end
  object eTableCaption: TcxTextEdit
    Left = 216
    Top = 172
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 8
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 200
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1087#1086#1083#1103
    Style.TextStyle = []
    Transparent = True
  end
  object eFieldName: TcxTextEdit
    Left = 8
    Top = 220
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 9
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object eFieldCaption: TcxTextEdit
    Left = 216
    Top = 220
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 10
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel7: TcxLabel
    Left = 216
    Top = 200
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1087#1086#1083#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel8: TcxLabel
    Left = 216
    Top = 104
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object eOrderFieldValueCaption: TcxTextEdit
    Left = 216
    Top = 124
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
end
