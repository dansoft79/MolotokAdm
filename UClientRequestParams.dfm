object ClientRequestParamForm: TClientRequestParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1087#1088#1086#1089#1072
  ClientHeight = 262
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
    Top = 226
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
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
    Top = 72
    Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 148
    Caption = #1057#1077#1089#1089#1080#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object eClientSession: TcxMemo
    Left = 8
    Top = 164
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 57
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 32
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbProcessed: TcxCheckBox
    Left = 8
    Top = 8
    AutoSize = False
    Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1086
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object eWorkType: TcxButtonEdit
    Left = 8
    Top = 48
    AutoSize = False
    BeepOnEnter = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonClick
    TabOrder = 1
    OnDblClick = eWorkTypeDblClick
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object eRequestText: TcxMemo
    Left = 8
    Top = 88
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Properties.OnChange = eRequestTextPropertiesChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 57
    Width = 409
  end
end
