object GSearchHintParamForm: TGSearchHintParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1086#1074#1086#1081' '#1087#1086#1076#1089#1082#1072#1079#1082#1080
  ClientHeight = 154
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
    Top = 118
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 144
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
  end
  object eHintText: TcxTextEdit
    Left = 8
    Top = 52
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 36
    Caption = #1058#1077#1082#1089#1090' '#1087#1086#1076#1089#1082#1072#1079#1082#1080':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbActive: TcxCheckBox
    Left = 8
    Top = 8
    AutoSize = False
    Caption = #1040#1082#1090#1080#1074#1085#1072
    Properties.FullFocusRect = True
    Properties.OnChange = eChange
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 76
    Caption = #1058#1080#1087' '#1088#1072#1073#1086#1090#1099':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbWorkClass: TcxComboBox
    Left = 8
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
end
