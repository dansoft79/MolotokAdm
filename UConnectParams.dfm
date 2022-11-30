object ConnectParamsForm: TConnectParamsForm
  Left = 445
  Top = 262
  HelpContext = 624000
  BorderStyle = bsToolWindow
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
  ClientHeight = 277
  ClientWidth = 392
  Color = clBtnFace
  Constraints.MinWidth = 200
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object eUser: TcxTextEdit
    Left = 8
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = ePropertiesChange
    TabOrder = 2
    OnKeyDown = eHostKeyDown
    Height = 21
    Width = 185
  end
  object ePassword: TcxTextEdit
    Left = 200
    Top = 64
    AutoSize = False
    BeepOnEnter = False
    TabOrder = 3
    OnKeyDown = eHostKeyDown
    Height = 21
    Width = 185
  end
  object eProtocol: TcxTextEdit
    Left = 8
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = ePropertiesChange
    TabOrder = 4
    OnKeyDown = eHostKeyDown
    Height = 21
    Width = 185
  end
  object ePort: TcxSpinEdit
    Left = 200
    Top = 104
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = ePropertiesChange
    TabOrder = 5
    OnKeyDown = eHostKeyDown
    Height = 21
    Width = 185
  end
  object mParams: TcxMemo
    Left = 8
    Top = 144
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    TabOrder = 6
    OnKeyDown = eHostKeyDown
    Height = 97
    Width = 377
  end
  object pBottom: TPanel
    Left = 0
    Top = 244
    Width = 392
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 7
    object bOK: TcxButton
      AlignWithMargins = True
      Left = 216
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
      TabOrder = 0
    end
    object bCancel: TcxButton
      AlignWithMargins = True
      Left = 304
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
      TabOrder = 1
    end
    object bSelect: TcxButton
      AlignWithMargins = True
      Left = 8
      Top = 4
      Width = 80
      Height = 25
      Margins.Left = 8
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 2
      OnClick = bSelectClick
    end
    object bCheck: TcxButton
      AlignWithMargins = True
      Left = 96
      Top = 4
      Width = 80
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
      TabOrder = 3
      OnClick = bCheckClick
    end
  end
  object eDatabase: TcxTextEdit
    Left = 200
    Top = 24
    BeepOnEnter = False
    TabOrder = 1
    OnKeyDown = eHostKeyDown
    Width = 185
  end
  object eHost: TcxTextEdit
    Left = 8
    Top = 24
    BeepOnEnter = False
    TabOrder = 0
    OnKeyDown = eHostKeyDown
    Width = 185
  end
  object Label2: TcxLabel
    Left = 8
    Top = 8
    Caption = #1057#1077#1088#1074#1077#1088':'
    Transparent = True
  end
  object lDatabase: TcxLabel
    Left = 200
    Top = 8
    Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093':'
    Transparent = True
  end
  object Label3: TcxLabel
    Left = 8
    Top = 48
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
    Transparent = True
  end
  object Label4: TcxLabel
    Left = 200
    Top = 48
    Caption = #1055#1072#1088#1086#1083#1100':'
    Transparent = True
  end
  object Label5: TcxLabel
    Left = 8
    Top = 88
    Caption = #1055#1088#1086#1090#1086#1082#1086#1083':'
    Transparent = True
  end
  object Label6: TcxLabel
    Left = 200
    Top = 88
    Caption = #1055#1086#1088#1090':'
    Transparent = True
  end
  object Label12: TcxLabel
    Left = 8
    Top = 128
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099':'
    Transparent = True
  end
  object Connection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = ''
    Left = 112
    Top = 172
  end
end
