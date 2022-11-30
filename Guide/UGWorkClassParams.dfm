object GWorkClassParamForm: TGWorkClassParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1090#1080#1087#1072' '#1088#1072#1073#1086#1090
  ClientHeight = 292
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
    Top = 256
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
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
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 0
    OnExit = eNameExit
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 8
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 172
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 188
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Style.LookAndFeel.ScrollbarMode = sbmDefault
    StyleDisabled.LookAndFeel.ScrollbarMode = sbmDefault
    StyleFocused.LookAndFeel.ScrollbarMode = sbmDefault
    StyleHot.LookAndFeel.ScrollbarMode = sbmDefault
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 65
    Width = 409
  end
  object eNamePublic: TcxTextEdit
    Left = 8
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 48
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1091#1073#1083#1080#1095#1085#1086#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eDescription: TcxMemo
    Left = 8
    Top = 104
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Style.LookAndFeel.ScrollbarMode = sbmDefault
    StyleDisabled.LookAndFeel.ScrollbarMode = sbmDefault
    StyleFocused.LookAndFeel.ScrollbarMode = sbmDefault
    StyleHot.LookAndFeel.ScrollbarMode = sbmDefault
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 65
    Width = 409
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 88
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    Style.TextStyle = []
    Transparent = True
  end
end
