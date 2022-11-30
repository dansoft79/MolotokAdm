object SupportForm: TSupportForm
  Left = 436
  Top = 305
  HelpContext = 744800
  BorderStyle = bsDialog
  Caption = #1058#1077#1093#1085#1080#1095#1077#1089#1082#1072#1103' '#1087#1086#1076#1076#1077#1088#1078#1082#1072
  ClientHeight = 299
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 266
    Width = 401
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 11
    object bOK: TcxButton
      AlignWithMargins = True
      Left = 225
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
      Left = 313
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
  end
  object cbMailed: TcxCheckBox
    Left = 8
    Top = 242
    AutoSize = False
    Caption = #1055#1086#1083#1091#1095#1072#1090#1100' '#1086#1090#1074#1077#1090#1099' '#1085#1072' E-Mail'
    Properties.OnChange = eChange
    TabOrder = 5
    Transparent = True
    Height = 21
    Width = 193
  end
  object Label3: TcxLabel
    Left = 8
    Top = 44
    Caption = 'E-Mail:'
    ParentFont = False
    Transparent = True
  end
  object Label1: TcxLabel
    Left = 8
    Top = 4
    Caption = #1058#1080#1087' '#1089#1086#1086#1073#1097#1077#1085#1080#1103':'
    ParentFont = False
    Transparent = True
  end
  object Label2: TcxLabel
    Left = 8
    Top = 84
    Caption = #1058#1077#1082#1089#1090':'
    ParentFont = False
    Transparent = True
  end
  object cxLabel1: TcxLabel
    Left = 204
    Top = 44
    Caption = #1048#1084#1103':'
    ParentFont = False
    Transparent = True
  end
  object lFile: TcxLabel
    Left = 8
    Top = 200
    Caption = #1055#1088#1080#1082#1088#1077#1087#1083#1103#1077#1084#1099#1081' '#1092#1072#1081#1083':'
    ParentFont = False
    Transparent = True
  end
  object eMail: TcxTextEdit
    Left = 8
    Top = 60
    AutoSize = False
    Properties.OnChange = eChange
    TabOrder = 1
    OnKeyPress = eKeyPress
    Height = 21
    Width = 189
  end
  object eName: TcxTextEdit
    Left = 204
    Top = 60
    AutoSize = False
    Properties.OnChange = eChange
    TabOrder = 2
    OnKeyPress = eKeyPress
    Height = 21
    Width = 189
  end
  object cbMessageType: TcxComboBox
    Left = 8
    Top = 20
    AutoSize = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1054#1096#1080#1073#1082#1072
      #1055#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077
      #1042#1086#1087#1088#1086#1089
      #1044#1088#1091#1075#1080#1077)
    Properties.OnChange = eChange
    TabOrder = 0
    OnKeyPress = eKeyPress
    Height = 21
    Width = 385
  end
  object eAtachFile: TcxButtonEdit
    Left = 8
    Top = 216
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = eAtachFilePropertiesButtonClick
    Properties.OnChange = eChange
    TabOrder = 4
    OnKeyPress = eKeyPress
    Width = 385
  end
  object eText: TcxMemo
    Left = 8
    Top = 100
    Properties.OnChange = eChange
    TabOrder = 3
    OnKeyPress = eKeyPress
    Height = 97
    Width = 385
  end
  object HTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 80
    Top = 124
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = cbMessageType
        Properties.Strings = (
          'ItemIndex')
      end
      item
        Component = eMail
        Properties.Strings = (
          'Text')
      end
      item
        Component = eName
        Properties.Strings = (
          'Text')
      end>
    StorageName = 'PropertiesStore'
    Left = 208
    Top = 96
  end
  object OpenDialog: TcxShellBrowserDialog
    FolderLabelCaption = #1060#1072#1081#1083':'
    Options.ShowNonFolders = True
    Root.BrowseFolder = bfDrives
    Left = 268
    Top = 152
  end
  object Connection: TSoapConnection
    SOAPServerIID = 'ISupportDatas - {83DCBC2A-97D8-4A2C-8CB0-E12CA2219BCC}'
    UseSOAPAdapter = True
    Left = 324
    Top = 96
  end
end
