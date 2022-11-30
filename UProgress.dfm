object ProgressForm: TProgressForm
  Left = 411
  Top = 241
  HelpContext = -1
  AlphaBlend = True
  AlphaBlendValue = 220
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077'...'
  ClientHeight = 80
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pClient: TcxLabel
    Left = 0
    Top = 0
    AutoSize = False
    Style.BorderStyle = ebsUltraFlat
    Transparent = True
    Height = 80
    Width = 500
  end
  object Gauge: TcxProgressBar
    Left = 4
    Top = 29
    ParentFont = False
    Position = 100.000000000000000000
    Properties.BarStyle = cxbsGradient
    Properties.BeginColor = 15507359
    Properties.EndColor = clNavy
    Properties.PeakValue = 100.000000000000000000
    Style.Shadow = False
    TabOrder = 1
    Width = 492
  end
  object lText: TcxLabel
    Left = 4
    Top = 4
    AutoSize = False
    Caption = #1053#1072#1076#1087#1080#1089#1100
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
    Height = 19
    Width = 492
  end
  object lTime: TcxLabel
    Left = 5
    Top = 58
    AutoSize = False
    Caption = #1055#1088#1086#1096#1083#1086':'
    Style.BorderStyle = ebsNone
    Transparent = True
    Height = 17
    Width = 45
  end
  object lLast: TcxLabel
    Left = 114
    Top = 58
    AutoSize = False
    Caption = #1054#1089#1090#1072#1083#1086#1089#1100':'
    Style.BorderStyle = ebsNone
    Transparent = True
    Height = 17
    Width = 54
  end
  object lAll: TcxLabel
    Left = 232
    Top = 58
    AutoSize = False
    Caption = #1042#1089#1077#1075#1086':'
    Style.BorderStyle = ebsNone
    Transparent = True
    Height = 17
    Width = 35
  end
  object stTime: TcxLabel
    Left = 51
    Top = 58
    TabStop = False
    AutoSize = False
    Style.BorderStyle = ebsUltraFlat
    Properties.Alignment.Horz = taCenter
    Transparent = True
    Height = 17
    Width = 60
    AnchorX = 81
  end
  object stLast: TcxLabel
    Left = 169
    Top = 58
    TabStop = False
    AutoSize = False
    Style.BorderStyle = ebsUltraFlat
    Properties.Alignment.Horz = taCenter
    Transparent = True
    Height = 17
    Width = 60
    AnchorX = 199
  end
  object stAll: TcxLabel
    Left = 268
    Top = 58
    TabStop = False
    AutoSize = False
    Style.BorderStyle = ebsUltraFlat
    Properties.Alignment.Horz = taCenter
    Transparent = True
    Height = 17
    Width = 60
    AnchorX = 298
  end
  object bCancel: TcxButton
    Left = 435
    Top = 58
    Width = 60
    Height = 17
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100
    TabOrder = 9
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = bCancelClick
  end
end
