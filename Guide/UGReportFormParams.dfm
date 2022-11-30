object ReportFormParamsForm: TReportFormParamsForm
  Left = 372
  Top = 268
  HelpContext = 671400
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 270
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
    Top = 237
    Width = 425
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
    DesignSize = (
      425
      33)
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
  end
  object bEditForm: TcxButton
    Left = 8
    Top = 176
    Width = 137
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1092#1086#1088#1084#1091' ...'
    OptionsImage.NumGlyphs = 2
    TabOrder = 3
    TabStop = False
    OnClick = bEditFormClick
  end
  object bDelForm: TcxButton
    Left = 8
    Top = 208
    Width = 137
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1088#1084#1091' ...'
    OptionsImage.NumGlyphs = 2
    TabOrder = 4
    TabStop = False
    OnClick = bDelFormClick
  end
  object eName: TcxTextEdit
    Left = 8
    Top = 60
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eNameChange
    TabOrder = 1
    OnKeyDown = eTypeKeyDown
    Height = 21
    Width = 409
  end
  object eType: TcxComboBox
    Left = 8
    Top = 20
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eTypeChange
    TabOrder = 0
    OnKeyDown = eTypeKeyDown
    Height = 21
    Width = 409
  end
  object Label1: TcxLabel
    Left = 8
    Top = 4
    Caption = #1058#1080#1087':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 44
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 84
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    Style.TextStyle = []
    Transparent = True
  end
  object mComment: TcxMemo
    Left = 8
    Top = 100
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 2
    OnKeyDown = eTypeKeyDown
    Height = 69
    Width = 409
  end
end
