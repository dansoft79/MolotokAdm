object RecordParamsForm: TRecordParamsForm
  Left = 546
  Top = 366
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1076#1088#1077#1089#1085#1086#1075#1086' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103
  ClientHeight = 130
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
    Top = 94
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
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
    object ldadata: TcxLabel
      Left = 12
      Top = 4
      Transparent = True
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 52
    Caption = #1040#1076#1088#1077#1089':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 8
    Caption = #1058#1080#1087' '#1072#1076#1088#1077#1089#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cbAddressType: TcxComboBox
    Left = 8
    Top = 24
    BeepOnEnter = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1056#1077#1075#1080#1086#1085
      #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090)
    Properties.OnChange = eChange
    TabOrder = 0
    Text = #1056#1077#1075#1080#1086#1085
    OnKeyDown = eKeyDown
    Width = 409
  end
  object eAddress: TcxComboBox
    Left = 8
    Top = 68
    AutoSize = False
    BeepOnEnter = False
    ParentFont = False
    Properties.DropDownRows = 20
    Properties.DropDownSizeable = True
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.IncrementalSearch = False
    Properties.Items.Strings = (
      '')
    Properties.OnChange = eAddressPropertiesChange
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    OnExit = eAddressExit
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object AddressTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = AddressTimerTimer
    Left = 152
    Top = 37
  end
end
