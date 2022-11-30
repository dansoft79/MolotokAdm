object SelectTypeForm: TSelectTypeForm
  Left = 0
  Top = 0
  HelpContext = 777800
  BorderStyle = bsDialog
  ClientHeight = 129
  ClientWidth = 394
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
    Top = 93
    Width = 394
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      394
      36)
    object bOK: TcxButton
      Left = 220
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
      Left = 304
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
  object ListBox: TcxListBox
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 386
    Height = 85
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = ListBoxDblClick
  end
end
