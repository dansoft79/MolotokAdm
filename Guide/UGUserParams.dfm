object UserParamForm: TUserParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
  ClientHeight = 284
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
  DesignSize = (
    425
    284)
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 248
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 14
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
      TabOrder = 1
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
      TabOrder = 2
    end
    object bInput: TcxButton
      Left = 12
      Top = 4
      Width = 80
      Height = 25
      Hint = #1042#1074#1077#1089#1090#1080' '#1074#1088#1091#1095#1085#1091#1102' '#1080#1083#1080' '#1086#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1089' '#1087#1086#1084#1086#1097#1100#1102' '#1089#1077#1088#1074#1080#1089#1072' DaData'
      Caption = #1042#1074#1077#1089#1090#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      Visible = False
      OnClick = bInputClick
    end
  end
  object eLogin: TcxTextEdit
    Left = 8
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object ePassword: TcxTextEdit
    Left = 216
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object eSurname: TcxTextEdit
    Left = 8
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object eName: TcxTextEdit
    Left = 8
    Top = 144
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 197
  end
  object ePatro: TcxTextEdit
    Left = 212
    Top = 144
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 21
    Width = 205
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Caption = #1051#1086#1075#1080#1085':'
    ParentFont = False
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 216
    Top = 8
    Caption = #1055#1072#1088#1086#1083#1100':'
    ParentFont = False
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 128
    Caption = #1048#1084#1103':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel5: TcxLabel
    Left = 212
    Top = 128
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 88
    Caption = #1060#1072#1084#1080#1083#1080#1103':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel12: TcxLabel
    Left = 8
    Top = 168
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Transparent = True
  end
  object cbUserRole: TcxComboBox
    Left = 8
    Top = 64
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object lDepartment: TcxLabel
    Left = 8
    Top = 48
    Caption = #1056#1086#1083#1100':'
    FocusControl = cbUserRole
    ParentFont = False
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 184
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 61
    Width = 409
  end
end
