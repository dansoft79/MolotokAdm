object EditDateForm: TEditDateForm
  Left = 0
  Top = 0
  HelpContext = -1
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1090#1099
  ClientHeight = 108
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 72
    Width = 296
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      296
      36)
    object bOK: TcxButton
      Left = 122
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
      Left = 206
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
  object EditLabel: TcxLabel
    Left = 8
    Top = 12
    Caption = #1053#1072#1076#1087#1080#1089#1100':'
    Transparent = True
  end
  object eDate: TcxDateEdit
    Left = 8
    Top = 32
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnChange = eDatePropertiesChange
    Properties.OnEditValueChanged = eDatePropertiesEditValueChanged
    TabOrder = 0
    OnKeyDown = eDateKeyDown
    Height = 21
    Width = 277
  end
end
