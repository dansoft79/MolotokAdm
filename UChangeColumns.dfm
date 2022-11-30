object FormChangeColumns: TFormChangeColumns
  Left = 447
  Top = 259
  HelpContext = 36
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1074#1080#1076#1080#1084#1099#1093' '#1082#1086#1083#1086#1085#1086#1082
  ClientHeight = 273
  ClientWidth = 294
  Color = clBtnFace
  Constraints.MaxHeight = 302
  Constraints.MaxWidth = 300
  Constraints.MinHeight = 300
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 240
    Width = 294
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      294
      33)
    object bOK: TBitBtn
      Left = 118
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 202
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  inline ColumnsFrame: TColumnsFrame
    Left = 0
    Top = 0
    Width = 294
    Height = 240
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 294
    inherited pColumns: TPanel
      Width = 294
      ExplicitWidth = 294
      inherited Columns: TcxListView
        Width = 290
        ExplicitWidth = 290
      end
    end
  end
end
