object WorkMonthForm: TWorkMonthForm
  Left = 436
  Top = 309
  HelpContext = -1
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1084#1077#1089#1103#1094#1072
  ClientHeight = 91
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 58
    Width = 242
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      242
      33)
    object bOK: TcxButton
      Left = 68
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
      OnClick = bOKClick
    end
    object bCancel: TcxButton
      Left = 152
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
  object Label1: TcxLabel
    Left = 12
    Top = 8
    Caption = #1052#1077#1089#1103#1094':'
    Transparent = True
  end
  object eMonth: TcxMaskEdit
    Left = 12
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    ParentFont = False
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '([0-9][0-9][0-9][0-9])/(0[1-9] | 1[012])'
    Properties.MaxLength = 0
    Properties.OnChange = eMonthPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Text = '2006.01'
    OnKeyDown = eMonthKeyDown
    OnKeyPress = eMonthKeyPress
    Height = 24
    Width = 85
  end
  object SpinButton: TcxSpinButton
    Left = 95
    Top = 24
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
    Height = 24
    Width = 51
  end
end
