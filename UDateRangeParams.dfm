object DateRangeForm: TDateRangeForm
  Left = 436
  Top = 309
  HelpContext = -1
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1076#1080#1072#1087#1086#1079#1086#1085#1072' '#1076#1072#1090
  ClientHeight = 91
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 58
    Width = 233
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      233
      33)
    object bOK: TcxButton
      Left = 59
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 0
      OnClick = bOKClick
      NumGlyphs = 2
    end
    object bCancel: TcxButton
      Left = 143
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
  object eDate: TcxDateEdit
    Left = 8
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 1
    OnKeyDown = eDateKeyDown
    Height = 21
    Width = 105
  end
  object eDate1: TcxDateEdit
    Left = 120
    Top = 24
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 2
    OnKeyDown = eDateKeyDown
    Height = 21
    Width = 105
  end
  object Label1: TcxLabel
    Left = 8
    Top = 8
    Caption = #1057':'
    Transparent = True
  end
  object Label2: TcxLabel
    Left = 120
    Top = 8
    Caption = #1055#1086':'
    Transparent = True
  end
end
