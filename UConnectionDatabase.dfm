object ConnectionDatabaseForm: TConnectionDatabaseForm
  Left = 546
  Top = 366
  HelpContext = 788700
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081' '#1082' '#1073#1072#1079#1072#1084' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 372
  ClientWidth = 853
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
    Width = 853
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      853
      36)
    object bClose: TcxButton
      Left = 763
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
    object cxButton1: TcxButton
      Left = 675
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
    Width = 853
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
      object TableViewServer: TcxGridDBColumn
        DataBinding.FieldName = 'Server'
        Width = 100
      end
      object TableViewDatabase: TcxGridDBColumn
        DataBinding.FieldName = 'Database'
        Width = 100
      end
      object TableViewPort: TcxGridDBColumn
        DataBinding.FieldName = 'Port'
      end
      object TableViewProtocol: TcxGridDBColumn
        DataBinding.FieldName = 'Protocol'
        Width = 67
      end
      object TableViewUser: TcxGridDBColumn
        DataBinding.FieldName = 'User'
        Width = 85
      end
      object TableViewPassword: TcxGridDBColumn
        DataBinding.FieldName = 'Password'
        Width = 76
      end
      object TableViewParams: TcxGridDBColumn
        DataBinding.FieldName = 'Params'
        Width = 126
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
      object CardViewServer: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Server'
        Position.BeginsLayer = True
      end
      object CardViewDatabase: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Database'
        Position.BeginsLayer = True
      end
      object CardViewPort: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Port'
        Position.BeginsLayer = True
      end
      object CardViewProtocol: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Protocol'
        Position.BeginsLayer = True
      end
      object CardViewUser: TcxGridDBCardViewRow
        DataBinding.FieldName = 'User'
        Position.BeginsLayer = True
      end
      object CardViewPassword: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Password'
        Position.BeginsLayer = True
      end
      object CardViewParams: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Params'
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
  object DataSource: TDataSource
    DataSet = MemData
    Left = 176
    Top = 124
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
    Left = 244
    Top = 124
    object MemDataServer: TStringField
      DisplayLabel = #1048#1084#1103' '#1089#1077#1088#1074#1077#1088#1072
      FieldName = 'Server'
      Size = 100
    end
    object MemDataDatabase: TStringField
      DisplayLabel = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      FieldName = 'Database'
      Size = 100
    end
    object MemDataPort: TIntegerField
      DisplayLabel = #1055#1086#1088#1090
      FieldName = 'Port'
    end
    object MemDataProtocol: TStringField
      DisplayLabel = #1055#1088#1086#1090#1086#1082#1086#1083
      FieldName = 'Protocol'
      Size = 50
    end
    object MemDataUser: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'User'
      Size = 50
    end
    object MemDataPassword: TStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      FieldName = 'Password'
      Size = 50
    end
    object MemDataParams: TStringField
      DisplayLabel = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      FieldName = 'Params'
      Size = 200
    end
    object MemDataComment: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
      FieldName = 'Comment'
      Size = 200
    end
  end
end
