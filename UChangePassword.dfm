object ChangePasswordForm: TChangePasswordForm
  Left = 517
  Top = 262
  HelpContext = 624200
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103
  ClientHeight = 157
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    294
    157)
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 124
    Width = 294
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      294
      33)
    object bOK: TcxButton
      Left = 120
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
      Left = 204
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
  object eOldPassword: TcxTextEdit
    Left = 8
    Top = 20
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BeepOnEnter = False
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = 'X'
    Properties.OnChange = eOldPasswordChange
    TabOrder = 0
    OnKeyDown = eKeyDown
    Height = 21
    Width = 279
  end
  object eNewPassword: TcxTextEdit
    Left = 8
    Top = 60
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BeepOnEnter = False
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = 'X'
    Properties.OnChange = eNewPasswordChange
    TabOrder = 1
    OnKeyDown = eKeyDown
    Height = 21
    Width = 279
  end
  object eConfirm: TcxTextEdit
    Left = 8
    Top = 100
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BeepOnEnter = False
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = 'X'
    Properties.OnChange = eConfirmChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 279
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 4
    Caption = #1057#1090#1072#1088#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 84
    Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 44
    Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
end
