object BackupForm: TBackupForm
  Left = 0
  Top = 0
  HelpContext = -1
  BorderStyle = bsDialog
  Caption = #1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 129
  ClientWidth = 500
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
  object SaveDialog: TSaveDialog
    DefaultExt = 'bak'
    Filter = #1056#1077#1079#1077#1088#1074#1085#1072#1103' '#1082#1086#1087#1080#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093'|*.bak'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 292
    Top = 20
  end
end
