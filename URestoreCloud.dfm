object RestoreCloudForm: TRestoreCloudForm
  Left = 546
  Top = 366
  HelpContext = -1
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 98
  ClientWidth = 392
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
  object OpenDialog: TOpenDialog
    DefaultExt = 'bak'
    Filter = #1056#1077#1079#1077#1088#1074#1085#1072#1103' '#1082#1086#1087#1080#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093'|*.bak'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 256
    Top = 44
  end
end
