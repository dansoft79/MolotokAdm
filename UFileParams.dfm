object FileAddParamsForm: TFileAddParamsForm
  Left = 546
  Top = 366
  HelpContext = 787200
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1072#1081#1083#1072
  ClientHeight = 200
  ClientWidth = 560
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
    Top = 164
    Width = 560
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      560
      36)
    object bOK: TcxButton
      Left = 386
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
      Left = 470
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
  object cxLabel1: TcxLabel
    Left = 8
    Top = 12
    Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object eFileName: TcxButtonEdit
    Left = 8
    Top = 28
    AutoSize = False
    BeepOnEnter = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = eFileNamePropertiesButtonClick
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Height = 21
    Width = 545
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 56
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
  end
  object mComment: TcxMemo
    Left = 8
    Top = 72
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Properties.OnChange = mCommentPropertiesChange
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 89
    Width = 545
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072
    Left = 428
    Top = 68
  end
end
