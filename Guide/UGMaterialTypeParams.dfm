object GMaterialTypeParamForm: TGMaterialTypeParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
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
    TabOrder = 14
    ExplicitTop = 236
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
    Top = 64
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
    Top = 48
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 144
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 11
    OnKeyDown = eKeyDown
    Height = 57
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 128
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eCode: TcxTextEdit
    Left = 8
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 8
    Caption = #1050#1086#1076':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel10: TcxLabel
    Left = 112
    Top = 8
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbCategory: TcxComboBox
    Left = 112
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 21
    Width = 305
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 88
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbUnit: TcxComboBox
    Left = 112
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.OnChange = eChange
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel5: TcxLabel
    Left = 112
    Top = 88
    Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eAmount: TcxCalcEdit
    Left = 8
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = ',0.######'
    Properties.Precision = 15
    Properties.OnChange = eChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object cxLabel6: TcxLabel
    Left = 320
    Top = 88
    Caption = #1062#1077#1085#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object ePrice: TcxCalcEdit
    Left = 320
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = ',0.##'
    Properties.Precision = 15
    Properties.OnChange = eChange
    TabOrder = 7
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
end
