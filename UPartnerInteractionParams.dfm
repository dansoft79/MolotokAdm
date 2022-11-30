object PartnerInteractionParamsForm: TPartnerInteractionParamsForm
  Left = 546
  Top = 366
  HelpContext = 723620
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103' '#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
  ClientHeight = 391
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 355
    Width = 363
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 16
    DesignSize = (
      363
      36)
    object bOK: TcxButton
      Left = 189
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      NumGlyphs = 2
    end
    object bCancel: TcxButton
      Left = 273
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      NumGlyphs = 2
    end
  end
  object Label1: TcxLabel
    Left = 8
    Top = 8
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object Label2: TcxLabel
    Left = 8
    Top = 48
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086':'
    Style.TextStyle = []
    Transparent = True
  end
  object Label3: TcxLabel
    Left = 8
    Top = 128
    Caption = #1044#1072#1090#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object Label4: TcxLabel
    Left = 184
    Top = 128
    Caption = #1042#1088#1077#1084#1103':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object Label5: TcxLabel
    Left = 8
    Top = 88
    Caption = #1058#1080#1087' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103':'
    Style.TextStyle = []
    Transparent = True
  end
  object Label6: TcxLabel
    Left = 8
    Top = 168
    Caption = #1055#1088#1077#1076#1084#1077#1090':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object Label7: TcxLabel
    Left = 8
    Top = 208
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090':'
    Style.TextStyle = []
    Transparent = True
  end
  object Label8: TcxLabel
    Left = 8
    Top = 248
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
    Transparent = True
  end
  object cbPartner: TcxComboBox
    Left = 8
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = cbPartnerPropertiesChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Height = 21
    Width = 345
  end
  object cbPartnerContact: TcxComboBox
    Left = 8
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = eChange
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 21
    Width = 345
  end
  object cbActionType: TcxComboBox
    Left = 8
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 345
  end
  object eActionDate: TcxDateEdit
    Left = 8
    Top = 144
    AutoSize = False
    BeepOnEnter = False
    EditValue = 38652d
    Properties.OnChange = eChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 169
  end
  object eActionTime: TcxTimeEdit
    Left = 184
    Top = 144
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.771585648148148d
    Properties.OnChange = eChange
    TabOrder = 4
    OnKeyDown = eKeyDown
    Height = 21
    Width = 169
  end
  object eSubject: TcxTextEdit
    Left = 8
    Top = 184
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 21
    Width = 345
  end
  object eResult: TcxTextEdit
    Left = 8
    Top = 224
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 21
    Width = 345
  end
  object mComment: TcxMemo
    Left = 8
    Top = 264
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 7
    OnKeyDown = eKeyDown
    Height = 89
    Width = 345
  end
  object qPartner: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select ShortName, ID'
      'from Partner'
      'where'
      
        '  (select Admin + AccessAllPartner from Employee where ID = :ID1' +
        ') > 0 or'
      
        '  ID in (select ID_Partner from PartnerFix where ID_Employee = :' +
        'ID2)  '
      'order by ShortName'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2'
        ParamType = ptUnknown
      end>
    Left = 236
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2'
        ParamType = ptUnknown
      end>
  end
  object qPartnerContact: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select Concat(Surname, '#39' '#39', Name, '#39' '#39', Patro) as CCName, ID'
      'from PartnerContact'
      'where'
      '  ID_Partner = :IDC'
      'order by CCName'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDC'
        ParamType = ptUnknown
      end>
    Left = 236
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDC'
        ParamType = ptUnknown
      end>
  end
  object qActionType: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select distinct ActionType'
      'from PartnerInteraction'
      'order by ActionType'
      '')
    Params = <>
    Left = 236
    Top = 96
  end
end
