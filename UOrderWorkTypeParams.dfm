object OrderListWorkTypeParamsForm: TOrderListWorkTypeParamsForm
  Left = 546
  Top = 366
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1080#1076#1072' '#1088#1072#1073#1086#1090#1099
  ClientHeight = 283
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pBottom: TPanel
    Left = 0
    Top = 247
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 16
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
    object bDel: TcxButton
      Left = 11
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ModalResult = 3
      OptionsImage.NumGlyphs = 2
      TabOrder = 2
    end
  end
  object eName: TcxTextEdit
    Left = 8
    Top = 76
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 56
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel3: TcxLabel
    Left = 216
    Top = 104
    Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 152
    Caption = #1062#1077#1085#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object ePrice: TcxCalcEdit
    Left = 8
    Top = 172
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = ',0. '#1088#1091#1073
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    TabOrder = 9
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 104
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eAmount: TcxCalcEdit
    Left = 8
    Top = 124
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object eUnit: TcxComboBox
    Left = 216
    Top = 124
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.OnChange = eChange
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cbWorkerClass: TcxComboBox
    Left = 8
    Top = 28
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Height = 24
    Width = 409
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 8
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 216
    Top = 152
    Caption = #1053#1086#1088#1084#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eNorm: TcxSpinEdit
    Left = 216
    Top = 172
    AutoSize = False
    BeepOnEnter = False
    Properties.AssignedValues.MinValue = True
    Properties.DisplayFormat = ',0. '#1084#1080#1085
    Properties.ImmediatePost = True
    Properties.MaxValue = 1440.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.OnChange = eChange
    TabOrder = 10
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel12: TcxLabel
    Left = 8
    Top = 201
    Caption = #1057#1088#1086#1082' '#1075#1072#1088#1072#1085#1090#1080#1080':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object eWarrantyTime: TcxSpinEdit
    Left = 8
    Top = 220
    AutoSize = False
    BeepOnEnter = False
    Properties.AssignedValues.MinValue = True
    Properties.ImmediatePost = True
    Properties.MaxValue = 9999.000000000000000000
    Properties.OnChange = eChange
    TabOrder = 13
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cbWarrantyType: TcxComboBox
    Left = 216
    Top = 220
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Items.Strings = (
      #1042' '#1076#1085#1103#1093
      #1042' '#1084#1077#1089#1103#1094#1072#1093)
    TabOrder = 14
    OnKeyDown = eKeyDown
    Height = 24
    Width = 201
  end
  object cxLabel11: TcxLabel
    Left = 216
    Top = 201
    Caption = #1042#1080#1076' '#1075#1072#1088#1072#1085#1090#1080#1080':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
end
