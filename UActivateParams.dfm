object ActivateParamsForm: TActivateParamsForm
  Left = 546
  Top = 366
  HelpContext = 745200
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1082#1090#1080#1074#1072#1094#1080#1080
  ClientHeight = 156
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 123
    Width = 293
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      293
      33)
    object bOK: TcxButton
      Left = 119
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
      Left = 203
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
  object eEMail: TcxTextEdit
    Left = 8
    Top = 20
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eEMailKeyDown
    Height = 21
    Width = 277
  end
  object eActivateKey: TcxTextEdit
    Left = 8
    Top = 60
    AutoSize = False
    BeepOnEnter = False
    Properties.EchoMode = eemPassword
    Properties.OnChange = eChange
    TabOrder = 1
    OnKeyDown = eEMailKeyDown
    Height = 21
    Width = 277
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 4
    Caption = #1040#1076#1088#1077#1089' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1087#1086#1095#1090#1099':'
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 44
    Caption = #1050#1086#1076' '#1072#1082#1090#1080#1074#1072#1094#1080#1080':'
    Transparent = True
  end
  object eID: TcxTextEdit
    Left = 8
    Top = 100
    TabStop = False
    AutoSize = False
    BeepOnEnter = False
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 2
    Height = 21
    Width = 277
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 84
    Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072':'
    Transparent = True
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = eActivateKey
        Properties.Strings = (
          'Text')
      end
      item
        Component = eEMail
        Properties.Strings = (
          'Text')
      end>
    StorageName = 'Activation.ini'
    Left = 144
    Top = 36
  end
end
