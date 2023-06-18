object GWorkRestDayParamForm: TGWorkRestDayParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1087#1091#1089#1082#1072'/'#1086#1090#1075#1091#1083#1072'/'#1088#1072#1073#1086#1095#1080#1093' '#1076#1085#1077#1081
  ClientHeight = 275
  ClientWidth = 301
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
    Top = 239
    Width = 301
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 14
    DesignSize = (
      301
      36)
    object bOK: TcxButton
      Left = 127
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
      Left = 211
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
  object cxLabel2: TcxLabel
    Left = 8
    Top = 160
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 176
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
    TabOrder = 12
    OnKeyDown = eKeyDown
    Height = 61
    Width = 281
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
    Width = 281
  end
  object cxLabel12: TcxLabel
    Left = 8
    Top = 76
    Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eFromDate: TcxDateEdit
    Left = 8
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    Properties.OnCloseUp = eChange
    Properties.OnEditValueChanged = eChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 137
  end
  object cxLabel13: TcxLabel
    Left = 152
    Top = 76
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eToDate: TcxDateEdit
    Left = 152
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    Properties.OnCloseUp = eChange
    Properties.OnEditValueChanged = eChange
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 137
  end
  object cxLabel14: TcxLabel
    Left = 152
    Top = 116
    Caption = #1042#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099':'
    Style.TextStyle = []
    Transparent = True
  end
  object f0: TcxTimeEdit
    Left = 152
    Top = 132
    AutoSize = False
    BeepOnEnter = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Circular = True
    Properties.ImmediatePost = True
    Properties.Nullstring = '00'
    Properties.TimeFormat = tfHourMin
    Properties.UseNullString = True
    Properties.OnChange = eChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.Shadow = False
    Style.IsFontAssigned = True
    TabOrder = 7
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object cxLabel15: TcxLabel
    Left = 216
    Top = 132
    Caption = '-'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object t0: TcxTimeEdit
    Left = 228
    Top = 132
    AutoSize = False
    BeepOnEnter = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Circular = True
    Properties.ImmediatePost = True
    Properties.Nullstring = '00'
    Properties.TimeFormat = tfHourMin
    Properties.UseNullString = True
    Properties.OnChange = eChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 9
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object d0: TcxCheckBox
    Left = 8
    Top = 132
    TabStop = False
    AutoSize = False
    Caption = #1056#1072#1073#1086#1095#1077#1077' '#1074#1088#1077#1084#1103
    ParentColor = False
    ParentFont = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = d0PropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    TabOrder = 6
    Transparent = True
    Height = 21
    Width = 137
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 36
    Caption = #1058#1080#1087' '#1087#1077#1088#1080#1086#1076#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbDateType: TcxComboBox
    Left = 8
    Top = 52
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsFixedList
    Properties.ImmediatePost = True
    Properties.Items.Strings = (
      #1054#1090#1087#1091#1089#1082
      #1054#1090#1075#1091#1083
      #1056#1072#1073#1086#1095#1080#1081' '#1076#1077#1085#1100)
    Properties.OnChange = eChange
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 21
    Width = 281
  end
end
