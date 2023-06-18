object GWorkerCompanyParamForm: TGWorkerCompanyParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
  ClientHeight = 519
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
    Top = 483
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 34
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
      AlignWithMargins = True
      Left = 19
      Top = 4
      Width = 80
      Height = 25
      Hint = #1042#1074#1077#1089#1090#1080' '#1074#1088#1091#1095#1085#1091#1102' '#1080#1083#1080' '#1086#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1089' '#1087#1086#1084#1086#1097#1100#1102' '#1089#1077#1088#1074#1080#1089#1072' DaData'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1042#1074#1077#1089#1090#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bInputClick
    end
  end
  object eName: TcxTextEdit
    Left = 8
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Height = 21
    Width = 249
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
    Top = 408
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 424
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 30
    OnKeyDown = eKeyDown
    Height = 57
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 264
    Top = 8
    Caption = #1058#1080#1087':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eOrgType: TcxComboBox
    Left = 264
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Items.Strings = (
      #1054#1054#1054
      #1048#1055
      #1057#1072#1084#1086#1079#1072#1085#1103#1090#1099#1081)
    Properties.OnChange = eOrgTypePropertiesChange
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 21
    Width = 153
  end
  object eINN: TcxTextEdit
    Left = 8
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 48
    Caption = #1048#1053#1053':'
    Style.TextStyle = []
    Transparent = True
  end
  object eOGRN: TcxTextEdit
    Left = 264
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 21
    Width = 153
  end
  object eKPP: TcxTextEdit
    Left = 136
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 121
  end
  object cxLabel5: TcxLabel
    Left = 136
    Top = 48
    Caption = #1050#1055#1055':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel6: TcxLabel
    Left = 264
    Top = 48
    Caption = #1054#1043#1056#1053':'
    Style.TextStyle = []
    Transparent = True
  end
  object eAddressJur: TcxTextEdit
    Left = 8
    Top = 184
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 9
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 168
    Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089':'
    Style.TextStyle = []
    Transparent = True
  end
  object eAddressFact: TcxTextEdit
    Left = 8
    Top = 224
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 11
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel8: TcxLabel
    Left = 8
    Top = 208
    Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089':'
    Style.TextStyle = []
    Transparent = True
  end
  object eBank: TcxTextEdit
    Left = 8
    Top = 264
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 13
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel9: TcxLabel
    Left = 8
    Top = 244
    Caption = #1041#1072#1085#1082':'
    Style.TextStyle = []
    Transparent = True
  end
  object eBIK: TcxTextEdit
    Left = 264
    Top = 304
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 17
    OnKeyDown = eKeyDown
    Height = 21
    Width = 153
  end
  object cxLabel10: TcxLabel
    Left = 264
    Top = 288
    Caption = #1041#1048#1050':'
    Style.TextStyle = []
    Transparent = True
  end
  object eKS: TcxTextEdit
    Left = 8
    Top = 304
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 15
    OnKeyDown = eKeyDown
    Height = 21
    Width = 249
  end
  object cxLabel11: TcxLabel
    Left = 8
    Top = 288
    Caption = #1050#1086#1088'. '#1089#1095#1077#1090':'
    Style.TextStyle = []
    Transparent = True
  end
  object eRS: TcxTextEdit
    Left = 8
    Top = 344
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 19
    OnKeyDown = eKeyDown
    Height = 21
    Width = 249
  end
  object cxLabel12: TcxLabel
    Left = 8
    Top = 328
    Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel13: TcxLabel
    Left = 136
    Top = 368
    Caption = #1050#1086#1084#1080#1089#1089#1080#1103' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComissionSize: TcxCalcEdit
    Left = 136
    Top = 384
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    TabOrder = 24
    OnKeyDown = eKeyDown
    Height = 21
    Width = 121
  end
  object eMasterPost: TcxTextEdit
    Left = 8
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel14: TcxLabel
    Left = 8
    Top = 88
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object eMasterName: TcxTextEdit
    Left = 8
    Top = 144
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 8
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel15: TcxLabel
    Left = 8
    Top = 128
    Caption = #1060#1048#1054' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel16: TcxLabel
    Left = 8
    Top = 368
    Caption = #1058#1080#1087' '#1082#1086#1084#1080#1089#1089#1080#1080':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbComissionType: TcxComboBox
    Left = 8
    Top = 384
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      #1055#1088#1086#1094#1077#1085#1090
      #1057#1091#1084#1084#1072)
    TabOrder = 22
    Text = #1055#1088#1086#1094#1077#1085#1090
    OnKeyDown = eKeyDown
    Height = 21
    Width = 121
  end
  object cxLabel17: TcxLabel
    Left = 264
    Top = 368
    Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1082#1086#1084#1080#1089#1089#1080#1080':'
    Style.TextStyle = []
    Transparent = True
  end
  object eComissionDate: TcxTextEdit
    Left = 264
    Top = 384
    AutoSize = False
    BeepOnEnter = False
    Properties.ReadOnly = True
    TabOrder = 25
    Height = 21
    Width = 153
  end
end
