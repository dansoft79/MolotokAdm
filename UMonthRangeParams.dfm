object WorkMonthRangeForm: TWorkMonthRangeForm
  Left = 436
  Top = 309
  HelpContext = -1
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1076#1080#1072#1087#1086#1079#1086#1085#1072' '#1084#1077#1089#1103#1094#1077#1074
  ClientHeight = 91
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 58
    Width = 268
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      268
      33)
    object bOK: TcxButton
      Left = 94
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      LookAndFeel.NativeStyle = True
      NumGlyphs = 2
    end
    object bCancel: TcxButton
      Left = 178
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      NumGlyphs = 2
    end
  end
  object cxLabel1: TcxLabel
    Left = 12
    Top = 8
    Caption = #1057':'
    Transparent = True
  end
  object eMonthFrom: TcxMaskEdit
    Tag = 1
    Left = 12
    Top = 28
    BeepOnEnter = False
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '([0-9][0-9][0-9][0-9])/(0[1-9] | 1[012])'
    Properties.MaxLength = 0
    Properties.OnChange = eMonthFromPropertiesChange
    TabOrder = 0
    Text = '2006.01'
    OnKeyDown = cxMaskEditKeyDown
    OnKeyPress = eMonthKeyPress
    Width = 61
  end
  object SpinButtonFrom: TcxSpinButton
    Tag = 1
    Left = 71
    Top = 28
    AutoSize = False
    Properties.Increment = 0.010000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.MaxValue = 9999.120000000001000000
    Properties.MinValue = 0.010000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.ValueType = vtFloat
    Properties.OnChange = SpinButtonPropertiesChange
    TabOrder = 1
    Value = 2006.010000000000000000
    Height = 21
    Width = 48
  end
  object cxLabel2: TcxLabel
    Left = 124
    Top = 8
    Caption = #1055#1086':'
    Transparent = True
  end
  object eMonthTo: TcxMaskEdit
    Left = 124
    Top = 28
    BeepOnEnter = False
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '([0-9][0-9][0-9][0-9])/(0[1-9] | 1[012])'
    Properties.MaxLength = 0
    Properties.OnChange = eMonthToPropertiesChange
    TabOrder = 2
    Text = '2006.01'
    OnKeyDown = cxMaskEditKeyDown
    OnKeyPress = eMonthKeyPress
    Width = 61
  end
  object SpinButtonTo: TcxSpinButton
    Left = 183
    Top = 28
    AutoSize = False
    Properties.Increment = 0.010000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.MaxValue = 9999.120000000001000000
    Properties.MinValue = 0.010000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.ValueType = vtFloat
    Properties.OnChange = SpinButtonPropertiesChange
    TabOrder = 3
    Value = 2006.010000000000000000
    Height = 21
    Width = 48
  end
end
