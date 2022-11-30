object GReasonParamForm: TGReasonParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1088#1080#1095#1080#1085#1099
  ClientHeight = 240
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
    Top = 204
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
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
  object eName: TcxTextEdit
    Left = 8
    Top = 88
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 72
    Caption = #1058#1077#1082#1089#1090' '#1087#1088#1080#1095#1080#1085#1099':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 112
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 128
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 7
    OnKeyDown = eKeyDown
    Height = 69
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 32
    Caption = #1057#1090#1072#1090#1091#1089':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbStatusType: TcxComboBox
    Left = 8
    Top = 48
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = eChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cbCommentRequired: TcxCheckBox
    Left = 8
    Top = 8
    AutoSize = False
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1086#1073#1103#1079#1072#1090#1077#1083#1077#1085
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 1
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
end
