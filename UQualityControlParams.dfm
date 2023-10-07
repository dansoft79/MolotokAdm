object QualityControlParamForm: TQualityControlParamForm
  Left = 436
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1082#1072#1095#1077#1089#1090#1074#1072
  ClientHeight = 152
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
    Top = 116
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
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
  object cbActive: TcxCheckBox
    Left = 8
    Top = 12
    AutoSize = False
    Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1080#1074#1085#1072
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 76
    Caption = #1057#1090#1072#1090#1091#1089' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1082#1072#1095#1077#1089#1090#1074#1072':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbStatusTypeQC: TcxComboBox
    Left = 8
    Top = 92
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsFixedList
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 201
  end
  object cbOrderList: TcxLabel
    Left = 8
    Top = 36
    Caption = #1047#1072#1082#1072#1079':'
    ParentFont = False
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object eOrderList: TcxButtonEdit
    Left = 8
    Top = 52
    AutoSize = False
    BeepOnEnter = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end
      item
        Caption = 'X'
        Kind = bkText
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = eWorkerCompanyPropertiesButtonClick
    TabOrder = 1
    OnDblClick = eOrderListDblClick
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object qStatus: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select distinct STV.ID, STV.Name, STV.Color'
      'from StatustypeQCview STV, StatusTypeQCFromTo FT'
      'where'
      '  FT.ID_StatusTypeQCFrom = :ID1 and'
      '  STV.ID = FT.ID_StatusTypeQCTo'
      ''
      'union'
      ''
      'select ID, Name, Color'
      'from StatusTypeQCView'
      'where ID = :ID2'
      ''
      'union'
      ''
      'select ID, Name, Color'
      'from StatusTypeQCView'
      'where :ID3 = 0 and defstatus = 1'
      ''
      'order by Name')
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
      end
      item
        DataType = ftUnknown
        Name = 'ID3'
        ParamType = ptUnknown
      end>
    Left = 313
    Top = 40
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
      end
      item
        DataType = ftUnknown
        Name = 'ID3'
        ParamType = ptUnknown
      end>
  end
end
