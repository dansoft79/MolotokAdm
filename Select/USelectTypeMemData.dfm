object SelectTypeMemDataForm: TSelectTypeMemDataForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  ClientHeight = 221
  ClientWidth = 593
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
    Top = 185
    Width = 593
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 443
    DesignSize = (
      593
      36)
    object bOK: TcxButton
      Left = 419
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 269
    end
    object bCancel: TcxButton
      Left = 503
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      OptionsImage.NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 353
    end
  end
  object DBGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 593
    Height = 185
    Align = alClient
    Constraints.MinHeight = 1
    TabOrder = 1
    ExplicitWidth = 443
    object TableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      OnCellDblClick = TableViewCellDblClick
      OnFocusedRecordChanged = TableViewFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = #1092#1080#1083#1100#1090#1088
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object DBGridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object DataSource: TDataSource
    DataSet = MemData
    Left = 104
    Top = 24
  end
  object MemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 188
    Top = 24
  end
end
