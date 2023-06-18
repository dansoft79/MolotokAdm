object GStatusTypeParamForm: TGStatusTypeParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1090#1072#1090#1091#1089#1072' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 497
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
    Top = 461
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 23
    ExplicitTop = 430
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
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
      OnClick = bOKClick
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
  object eComment: TcxMemo
    Left = 8
    Top = 252
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 49
    Width = 409
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 236
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbColor: TcxLabel
    Left = 216
    Top = 88
    Caption = #1062#1074#1077#1090':'
    Style.TextStyle = []
    Transparent = True
  end
  object cbDef: TcxCheckBox
    Left = 8
    Top = 308
    AutoSize = False
    Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 7
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbFin: TcxCheckBox
    Left = 8
    Top = 332
    AutoSize = False
    Caption = #1047#1072#1082#1088#1099#1074#1072#1102#1097#1080#1081
    Properties.FullFocusRect = True
    Properties.ImmediatePost = True
    Properties.OnEditValueChanged = cbFinCancelPropertiesEditValueChanged
    Style.TextStyle = [fsBold]
    TabOrder = 8
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
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
  object cxLabel2: TcxLabel
    Left = 8
    Top = 48
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1091#1073#1083#1080#1095#1085#1086#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 88
    Caption = #1053#1086#1084#1077#1088' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091':'
    Style.TextStyle = []
    Transparent = True
  end
  object eStatusOrder: TcxSpinEdit
    Left = 8
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbWorkerVisible: TcxCheckBox
    Left = 8
    Top = 356
    AutoSize = False
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1074#1080#1076#1080#1090' '#1079#1072#1082#1072#1079
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 10
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbWorkerSetup: TcxCheckBox
    Left = 216
    Top = 356
    AutoSize = False
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1091#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1077#1090
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 11
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object eColor: TdxColorEdit
    Left = 216
    Top = 104
    Properties.ImmediatePost = True
    Properties.ColorSet = csTheme1
    TabOrder = 3
    Width = 201
  end
  object cbTrimTime: TcxCheckBox
    Left = 8
    Top = 380
    AutoSize = False
    Caption = #1057#1086#1082#1088#1072#1097#1072#1077#1090' '#1074#1088#1077#1084#1103' '#1076#1086' '#1090#1077#1082#1091#1097'.'
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 12
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbShowCancelButton: TcxCheckBox
    Left = 216
    Top = 380
    AutoSize = False
    Caption = #1050#1085#1086#1087#1082#1072' '#1054#1090#1084#1077#1085#1072
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 13
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbShowPayButton: TcxCheckBox
    Left = 8
    Top = 404
    AutoSize = False
    Caption = #1050#1085#1086#1087#1082#1072' '#1054#1087#1083#1072#1090#1072
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 14
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbShowWarrantyButton: TcxCheckBox
    Left = 216
    Top = 404
    AutoSize = False
    Caption = #1050#1085#1086#1087#1082#1072' '#1043#1072#1088#1072#1085#1090#1080#1103
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 15
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbNeedCall: TcxCheckBox
    Left = 8
    Top = 428
    AutoSize = False
    Caption = #1058#1088#1077#1073#1091#1077#1090#1089#1103' '#1079#1074#1086#1085#1086#1082
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 16
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbMasterNotify: TcxCheckBox
    Left = 216
    Top = 428
    AutoSize = False
    Caption = #1059#1074#1077#1076#1086#1084#1083#1103#1090#1100' '#1084#1072#1089#1090#1077#1088#1072
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = False
    TabOrder = 17
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object mMasterNotifyText: TcxMemo
    Left = 8
    Top = 184
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Properties.OnChange = mMasterNotifyTextPropertiesChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 49
    Width = 409
  end
  object lMasterNotifyText: TcxLabel
    Left = 8
    Top = 168
    Caption = #1058#1077#1082#1089#1090' PUSH '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1084#1072#1089#1090#1077#1088#1072':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 128
    Caption = #1054#1073#1088#1072#1073#1086#1090#1095#1080#1082':'
    Style.TextStyle = []
    Transparent = True
  end
  object eCode: TcxDBLookupComboBox
    Left = 8
    Top = 144
    AutoSize = False
    BeepOnEnter = False
    DataBinding.DataField = 'Handler'
    DataBinding.DataSource = dsHandler
    Properties.KeyFieldNames = 'HandlerName'
    Properties.ListColumns = <
      item
        FieldName = 'HandlerCaption'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsList
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbFinCancel: TcxCheckBox
    Left = 218
    Top = 332
    AutoSize = False
    Caption = #1047#1072#1082#1088#1099#1074#1072#1077#1090' '#1086#1090#1084#1077#1085#1086#1081
    Properties.FullFocusRect = True
    Properties.OnEditValueChanged = cbFinCancelPropertiesEditValueChanged
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = False
    TabOrder = 9
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object qList: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from WorkerAppHandler'
      'order by HandlerCaption')
    Params = <>
    Left = 320
    Top = 136
  end
  object dsList: TDataSource
    DataSet = qList
    Left = 368
    Top = 136
  end
  object mdHandler: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 208
    Top = 136
    object mdHandlerHandler: TStringField
      FieldName = 'Handler'
      Size = 50
    end
  end
  object dsHandler: TDataSource
    DataSet = mdHandler
    Left = 260
    Top = 136
  end
end
