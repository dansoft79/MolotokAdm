object ShowMsgRichForm: TShowMsgRichForm
  Left = 268
  Top = 262
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1058#1080#1087' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  ClientHeight = 276
  ClientWidth = 594
  Color = clBtnFace
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pButtons: TPanel
    Left = 0
    Top = 235
    Width = 594
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object lText: TcxRichEdit
    AlignWithMargins = True
    Left = 4
    Top = 4
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alClient
    ParentFont = False
    Properties.AllowObjects = True
    Properties.AutoURLDetect = True
    Properties.ReadOnly = True
    Properties.ScrollBars = ssVertical
    Properties.OnURLClick = lTextPropertiesURLClick
    Style.Color = clWhite
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Arial Narrow'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 231
    Width = 586
  end
end
