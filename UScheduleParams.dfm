object ScheduleParamForm: TScheduleParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
  ClientHeight = 320
  ClientWidth = 281
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
    Top = 284
    Width = 281
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 32
    ExplicitTop = 320
    DesignSize = (
      281
      36)
    object bOK: TcxButton
      Left = 107
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
      Left = 191
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
    Top = 200
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 216
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 28
    OnKeyDown = eKeyDown
    Height = 65
    Width = 265
  end
  object cxLabel1: TcxLabel
    Left = 136
    Top = 8
    Caption = #1042#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099':'
    Style.TextStyle = []
    Transparent = True
  end
  object f1: TcxTimeEdit
    Left = 136
    Top = 28
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
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object t1: TcxTimeEdit
    Left = 212
    Top = 28
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
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object cxLabel4: TcxLabel
    Left = 200
    Top = 24
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
  object cxLabel5: TcxLabel
    Left = 8
    Top = 8
    Caption = #1044#1085#1080' '#1085#1077#1076#1077#1083#1080':'
    Style.TextStyle = []
    Transparent = True
  end
  object f2: TcxTimeEdit
    Left = 136
    Top = 52
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
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object t2: TcxTimeEdit
    Left = 212
    Top = 52
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
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object cxLabel6: TcxLabel
    Left = 200
    Top = 48
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
  object t3: TcxTimeEdit
    Left = 212
    Top = 76
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
    TabOrder = 8
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object cxLabel7: TcxLabel
    Left = 200
    Top = 72
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
  object f3: TcxTimeEdit
    Left = 136
    Top = 76
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
    TabOrder = 7
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object t4: TcxTimeEdit
    Left = 212
    Top = 100
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
    TabOrder = 12
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object cxLabel8: TcxLabel
    Left = 200
    Top = 96
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
  object f4: TcxTimeEdit
    Left = 136
    Top = 100
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
    TabOrder = 11
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object t5: TcxTimeEdit
    Left = 212
    Top = 124
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
    TabOrder = 15
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object cxLabel9: TcxLabel
    Left = 200
    Top = 120
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
  object f5: TcxTimeEdit
    Left = 136
    Top = 124
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
    TabOrder = 14
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object t6: TcxTimeEdit
    Left = 212
    Top = 148
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
    TabOrder = 19
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object cxLabel10: TcxLabel
    Left = 200
    Top = 144
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
  object f6: TcxTimeEdit
    Left = 136
    Top = 148
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
    TabOrder = 18
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object t7: TcxTimeEdit
    Left = 212
    Top = 172
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
    TabOrder = 23
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object cxLabel11: TcxLabel
    Left = 200
    Top = 168
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
  object f7: TcxTimeEdit
    Left = 136
    Top = 172
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
    TabOrder = 22
    OnKeyDown = eKeyDown
    Height = 21
    Width = 61
  end
  object d1: TcxCheckBox
    Tag = 1
    Left = 8
    Top = 28
    AutoSize = False
    Caption = #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
    ParentColor = False
    ParentFont = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = cbPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Transparent = True
    Height = 21
    Width = 121
  end
  object d2: TcxCheckBox
    Tag = 2
    Left = 8
    Top = 52
    AutoSize = False
    Caption = #1042#1090#1086#1088#1085#1080#1082
    ParentColor = False
    ParentFont = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = cbPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Transparent = True
    Height = 21
    Width = 121
  end
  object d3: TcxCheckBox
    Tag = 3
    Left = 8
    Top = 76
    AutoSize = False
    Caption = #1057#1088#1077#1076#1072
    ParentColor = False
    ParentFont = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = cbPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 6
    Transparent = True
    Height = 21
    Width = 121
  end
  object d4: TcxCheckBox
    Tag = 4
    Left = 8
    Top = 100
    AutoSize = False
    Caption = #1063#1077#1090#1074#1077#1088#1075
    ParentColor = False
    ParentFont = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = cbPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 10
    Transparent = True
    Height = 21
    Width = 121
  end
  object d5: TcxCheckBox
    Tag = 5
    Left = 8
    Top = 124
    AutoSize = False
    Caption = #1055#1103#1090#1085#1080#1094#1072
    ParentColor = False
    ParentFont = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = cbPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 13
    Transparent = True
    Height = 21
    Width = 121
  end
  object d6: TcxCheckBox
    Tag = 6
    Left = 8
    Top = 148
    AutoSize = False
    Caption = #1057#1091#1073#1073#1086#1090#1072
    ParentColor = False
    ParentFont = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = cbPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 17
    Transparent = True
    Height = 21
    Width = 121
  end
  object d7: TcxCheckBox
    Tag = 7
    Left = 8
    Top = 172
    AutoSize = False
    Caption = #1042#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077
    ParentColor = False
    ParentFont = False
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnChange = cbPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 21
    Transparent = True
    Height = 21
    Width = 121
  end
end
