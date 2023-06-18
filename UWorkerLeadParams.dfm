object WorkerLeadParamForm: TWorkerLeadParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1083#1080#1076#1072' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
  ClientHeight = 424
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
    Top = 388
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 19
    ExplicitTop = 344
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
      WordWrap = True
      OnClick = bInputClick
    end
  end
  object eFIO: TcxTextEdit
    Left = 8
    Top = 132
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 116
    Caption = #1060#1048#1054':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel12: TcxLabel
    Left = 8
    Top = 236
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1084#1072#1089#1090#1077#1088#1072':'
    Transparent = True
  end
  object cbWorkClass: TcxComboBox
    Left = 8
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = eChange
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object lDepartment: TcxLabel
    Left = 8
    Top = 76
    Caption = #1058#1080#1087' '#1088#1072#1073#1086#1090#1099':'
    FocusControl = cbWorkClass
    ParentFont = False
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eComment: TcxMemo
    Left = 8
    Top = 252
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 16
    OnKeyDown = eKeyDown
    Height = 57
    Width = 409
  end
  object ePhone: TcxTextEdit
    Left = 8
    Top = 172
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 9
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 156
    Caption = #1058#1077#1083#1077#1092#1086#1085':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 312
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
    Transparent = True
  end
  object eInfo: TcxMemo
    Left = 8
    Top = 328
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 18
    OnKeyDown = eKeyDown
    Height = 57
    Width = 409
  end
  object cbStatusTypeLead: TcxComboBox
    Left = 8
    Top = 52
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 36
    Caption = #1057#1090#1072#1090#1091#1089':'
    FocusControl = cbStatusTypeLead
    ParentFont = False
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbDistrict: TcxComboBox
    Left = 216
    Top = 172
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = eChange
    TabOrder = 10
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel2: TcxLabel
    Left = 216
    Top = 156
    Caption = #1056#1072#1081#1086#1085':'
    FocusControl = cbDistrict
    ParentFont = False
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eLeadDateTime: TcxDateEdit
    Left = 8
    Top = 212
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.Kind = ckDateTime
    TabOrder = 13
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 196
    Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103':'
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
  object eLeadDateTimeComment: TcxTextEdit
    Left = 216
    Top = 212
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 14
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel5: TcxLabel
    Left = 216
    Top = 196
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1076#1072#1090#1077':'
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
  object cbActive: TcxCheckBox
    Left = 8
    Top = 8
    AutoSize = False
    Caption = #1040#1082#1090#1080#1074#1085#1072
    Properties.FullFocusRect = True
    Properties.OnChange = eChange
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = False
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
end
