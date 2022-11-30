object EditTextForm: TEditTextForm
  Left = 390
  Top = 204
  HelpContext = 736800
  BorderIcons = [biSystemMenu, biMaximize]
  ClientHeight = 266
  ClientWidth = 394
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 200
  Font.Charset = RUSSIAN_CHARSET
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
    Top = 233
    Width = 394
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object bOK: TcxButton
      AlignWithMargins = True
      Left = 218
      Top = 4
      Width = 80
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'OK'
      ModalResult = 1
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
    end
    object bCancel: TcxButton
      AlignWithMargins = True
      Left = 306
      Top = 4
      Width = 80
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 8
      Margins.Bottom = 4
      Align = alRight
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      OptionsImage.NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Memo: TcxMemo
    AlignWithMargins = True
    Left = 4
    Top = 4
    HelpContext = 736800
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Lines.Strings = (
      '')
    ParentFont = False
    Properties.ScrollBars = ssBoth
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleFocused.BorderColor = clWindowFrame
    TabOrder = 1
    Height = 225
    Width = 386
  end
end
