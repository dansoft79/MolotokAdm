object WorkTypeSynonymParamForm: TWorkTypeSynonymParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1080#1085#1085#1086#1085#1080#1084#1072' '#1074#1080#1076#1072' '#1088#1072#1073#1086#1090
  ClientHeight = 125
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
    Top = 89
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 419
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
      ExplicitLeft = 245
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
      ExplicitLeft = 329
    end
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 48
    Caption = #1048#1084#1103'-'#1089#1080#1085#1086#1085#1080#1084':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eWorkType: TcxButtonEdit
    Left = 8
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonClick
    TabOrder = 0
    OnDblClick = eWorkTypeDblClick
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object eName: TcxTextEdit
    Left = 8
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eNamePropertiesChange
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
end
