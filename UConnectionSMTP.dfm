object ConnectionSMTPForm: TConnectionSMTPForm
  Left = 546
  Top = 366
  HelpContext = 789000
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081' SMTP'
  ClientHeight = 372
  ClientWidth = 914
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
    Top = 336
    Width = 914
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      914
      36)
    object bClose: TcxButton
      Left = 824
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
    end
    object bOK: TcxButton
      Left = 736
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'OK'
      ModalResult = 1
      OptionsImage.NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 0
    Width = 914
    Height = 336
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    object TableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = True
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Visible = True
      DataController.DataSource = DataSource
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1079#1076#1077#1089#1100' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Appending = True
      OptionsData.CancelOnExit = False
      OptionsData.DeletingConfirmation = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TableViewName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 120
      end
      object TableViewEMailHost: TcxGridDBColumn
        DataBinding.FieldName = 'EMailHost'
        Width = 100
      end
      object TableViewEMailLogin: TcxGridDBColumn
        DataBinding.FieldName = 'EMailLogin'
        Width = 100
      end
      object TableViewEMailPassword: TcxGridDBColumn
        DataBinding.FieldName = 'EMailPassword'
        Width = 80
      end
      object TableViewEMailPort: TcxGridDBColumn
        DataBinding.FieldName = 'EMailPort'
        Width = 40
      end
      object TableViewEMailAuthType: TcxGridDBColumn
        DataBinding.FieldName = 'EMailAuthType'
        RepositoryItem = AuthEdit
        Width = 70
      end
      object TableViewEMailTLSType: TcxGridDBColumn
        DataBinding.FieldName = 'EMailTLSType'
        RepositoryItem = TLSEdit
        Width = 70
      end
      object TableViewEMailName: TcxGridDBColumn
        DataBinding.FieldName = 'EMailName'
        Width = 120
      end
      object TableViewEMailCharset: TcxGridDBColumn
        DataBinding.FieldName = 'EMailCharset'
        Width = 80
      end
      object TableViewFromEMail: TcxGridDBColumn
        DataBinding.FieldName = 'FromEMail'
        Width = 120
      end
      object TableViewComment: TcxGridDBColumn
        DataBinding.FieldName = 'Comment'
        Width = 200
      end
    end
    object CardView: TcxGridDBCardView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Append.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Visible = True
      DataController.DataSource = DataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Appending = True
      OptionsData.CancelOnExit = False
      OptionsData.DeletingConfirmation = False
      OptionsView.CardIndent = 7
      OptionsView.CardWidth = 300
      object CardViewName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Name'
        Position.BeginsLayer = True
      end
      object CardViewEMailHost: TcxGridDBCardViewRow
        DataBinding.FieldName = 'EMailHost'
        Position.BeginsLayer = True
      end
      object CardViewEMailLogin: TcxGridDBCardViewRow
        DataBinding.FieldName = 'EMailLogin'
        Position.BeginsLayer = True
      end
      object CardViewEMailPassword: TcxGridDBCardViewRow
        DataBinding.FieldName = 'EMailPassword'
        Position.BeginsLayer = True
      end
      object CardViewEMailPort: TcxGridDBCardViewRow
        DataBinding.FieldName = 'EMailPort'
        Position.BeginsLayer = True
      end
      object CardViewEMailAuthType: TcxGridDBCardViewRow
        DataBinding.FieldName = 'EMailAuthType'
        RepositoryItem = AuthEdit
        Position.BeginsLayer = True
      end
      object CardViewEMailTLSType: TcxGridDBCardViewRow
        DataBinding.FieldName = 'EMailTLSType'
        RepositoryItem = TLSEdit
        Position.BeginsLayer = True
      end
      object CardViewEMailName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'EMailName'
        Position.BeginsLayer = True
      end
      object CardViewEMailCharset: TcxGridDBCardViewRow
        DataBinding.FieldName = 'EMailCharset'
        Position.BeginsLayer = True
      end
      object CardViewFromEMail: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FromEMail'
        Position.BeginsLayer = True
      end
      object CardViewComment: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Comment'
        Position.BeginsLayer = True
      end
    end
    object LevelTable: TcxGridLevel
      Caption = #1058#1072#1073#1083#1080#1094#1072
      GridView = TableView
    end
    object LevelCard: TcxGridLevel
      Caption = #1050#1072#1088#1090#1086#1090#1077#1082#1072
      GridView = CardView
    end
  end
  object Query: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from ConnectionSMTP'
      'order by name')
    Params = <>
    Left = 252
    Top = 40
    object QueryID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object QueryName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Required = True
      Size = 100
    end
    object QueryEMailHost: TWideStringField
      DisplayLabel = #1057#1077#1088#1074#1077#1088
      FieldName = 'EMailHost'
      Size = 50
    end
    object QueryEMailLogin: TWideStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      FieldName = 'EMailLogin'
      Size = 50
    end
    object QueryEMailPassword: TWideStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      FieldName = 'EMailPassword'
      Size = 50
    end
    object QueryEMailPort: TSmallintField
      DisplayLabel = #1055#1086#1088#1090
      FieldName = 'EMailPort'
    end
    object QueryEMailAuthType: TSmallintField
      DisplayLabel = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
      FieldName = 'EMailAuthType'
    end
    object QueryEMailTLSType: TSmallintField
      DisplayLabel = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
      FieldName = 'EMailTLSType'
    end
    object QueryEMailName: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'EMailName'
      Size = 50
    end
    object QueryEMailCharset: TWideStringField
      DisplayLabel = #1050#1086#1076#1080#1088#1086#1074#1082#1072
      FieldName = 'EMailCharset'
      Size = 50
    end
    object QueryFromEMail: TWideStringField
      DisplayLabel = #1054#1073#1088#1072#1090#1085#1099#1081' '#1072#1076#1088#1077#1089
      FieldName = 'FromEMail'
      Size = 50
    end
    object QueryComment: TWideStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
      FieldName = 'Comment'
      Size = 200
    end
  end
  object DataSource: TDataSource
    DataSet = MemData
    Left = 172
    Top = 40
  end
  object EditRepository: TcxEditRepository
    Left = 372
    Top = 196
    PixelsPerInch = 96
    object AuthEdit: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = #1053#1077' '#1091#1082#1072#1079#1072#1085#1086
          ImageIndex = 0
          Value = 0
        end
        item
          Description = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          Value = 1
        end
        item
          Description = 'SASL'
          Value = 2
        end>
    end
    object TLSEdit: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'TLS '#1085#1077' '#1087#1086#1076#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = 'Implicit TLS'
          Value = '1'
        end
        item
          Description = 'Require TLS'
          Value = '2'
        end
        item
          Description = 'Explicit TLS'
          Value = '3'
        end>
    end
  end
  object MemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 256
    Top = 112
  end
end
