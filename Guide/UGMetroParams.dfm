object GMetroParamForm: TGMetroParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1090#1072#1085#1094#1080#1080' '#1084#1077#1090#1088#1086
  ClientHeight = 245
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
    Top = 209
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 10
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
    TabOrder = 1
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
    Top = 128
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 144
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 9
    OnKeyDown = eKeyDown
    Height = 61
    Width = 409
  end
  object cbDistrict: TcxComboBox
    Left = 7
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = eChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object lDepartment: TcxLabel
    Left = 8
    Top = 48
    Caption = #1056#1072#1081#1086#1085':'
    FocusControl = cbDistrict
    ParentFont = False
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbColor: TcxLabel
    Left = 216
    Top = 88
    Caption = #1062#1074#1077#1090':'
    Style.TextStyle = []
    Transparent = True
  end
  object eTag: TcxMaskEdit
    Left = 8
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '..'
    Properties.OnChange = eChange
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 88
    Caption = #1058#1101#1075':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eColor: TdxColorEdit
    Left = 216
    Top = 104
    Properties.ImmediatePost = True
    Properties.ColorSet = csTheme1
    TabOrder = 7
    Width = 201
  end
end
