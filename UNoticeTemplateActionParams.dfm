object NoticeTEmplateActionParamForm: TNoticeTEmplateActionParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
  ClientHeight = 164
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
    Top = 128
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
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
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Caption = #1055#1086#1083#1077' '#1079#1072#1082#1072#1079#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbOrderFieldName: TcxLookupComboBox
    Left = 8
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'OrderFieldName'
    Properties.ListColumns = <
      item
        FieldName = 'OrderFieldCaption'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsOrderFieldName
    Properties.OnChange = cbOrderFieldNamePropertiesChange
    TabOrder = 0
    OnKeyDown = eValueKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 48
    Caption = #1044#1077#1081#1089#1090#1074#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbActionType: TcxLookupComboBox
    Left = 8
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'ActionCaption'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsActionType
    Properties.OnChange = cbConditionTypePropertiesChange
    TabOrder = 1
    OnKeyDown = eValueKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 88
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbOrderFieldValue: TcxComboBox
    Left = 8
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.DropDownRows = 20
    Properties.DropDownSizeable = True
    Properties.ImmediatePost = True
    Properties.Nullstring = 'null'
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eValueKeyDown
    Height = 21
    Width = 409
  end
  object qOrderFieldName: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select distinct OrderFieldName, OrderFieldCaption'
      'from NoticeOptionsAction'
      'order by OrderFieldCaption')
    Params = <>
    Left = 92
    Top = 16
    object qOrderFieldNameOrderFieldName: TWideStringField
      FieldName = 'OrderFieldName'
      Size = 200
    end
    object qOrderFieldNameOrderFieldCaption: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1083#1103
      FieldName = 'OrderFieldCaption'
      Size = 400
    end
  end
  object dsOrderFieldName: TDataSource
    DataSet = qOrderFieldName
    Left = 184
    Top = 16
  end
  object qActionType: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      
        'select distinct 0 as id,  '#39'null'#39' as ActionType, '#39#1089#1073#1088#1086#1089#1080#1090#1100#39' as Ac' +
        'tionCaption, OrderFieldName, OrderFieldCaption, TableName, Field' +
        'Name, TableCaption, FieldCaption'
      'from NoticeOptionsAction'
      'where OrderFieldName = :OrderFieldName and CanSetNull = 1'
      ''
      'union'
      ''
      
        'select distinct 1 as id, '#39'value'#39' as ActionType, '#39#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100#39' as ' +
        'ActionCaption, OrderFieldName, OrderFieldCaption, TableName, Fie' +
        'ldName, TableCaption, FieldCaption'
      'from NoticeOptionsAction'
      'where OrderFieldName = :OrderFieldName and CanSetValue = 1'
      ''
      'order by id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'OrderFieldName'
        ParamType = ptUnknown
      end>
    DataSource = dsOrderFieldName
    Left = 264
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OrderFieldName'
        ParamType = ptUnknown
      end>
    object qActionTypeid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qActionTypeConditionType: TWideStringField
      FieldName = 'ActionType'
      ReadOnly = True
      Size = 8
    end
    object qActionTypeConditionCaption: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1086#1074#1080#1103
      FieldName = 'ActionCaption'
      ReadOnly = True
      Size = 32
    end
    object qActionTypeOrderFieldName: TWideStringField
      FieldName = 'OrderFieldName'
      ReadOnly = True
      Size = 200
    end
    object qActionTypeTableName: TWideStringField
      FieldName = 'TableName'
      ReadOnly = True
      Size = 200
    end
    object qActionTypeFieldName: TWideStringField
      FieldName = 'FieldName'
      ReadOnly = True
      Size = 200
    end
    object qActionTypeTableCaption: TWideStringField
      FieldName = 'TableCaption'
      ReadOnly = True
      Size = 200
    end
    object qActionTypeFieldCaption: TWideStringField
      FieldName = 'FieldCaption'
      ReadOnly = True
      Size = 400
    end
    object qActionTypeOrderFieldCaption: TWideStringField
      FieldName = 'OrderFieldCaption'
      ReadOnly = True
      Size = 400
    end
  end
  object dsActionType: TDataSource
    DataSet = qActionType
    Left = 348
    Top = 56
  end
  object qValue: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      '')
    Params = <>
    DataSource = dsActionType
    Left = 88
    Top = 108
  end
end
