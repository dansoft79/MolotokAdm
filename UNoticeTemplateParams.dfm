object NoticeTemplateParamForm: TNoticeTemplateParamForm
  Left = 436
  Top = 305
  HelpType = htKeyword
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1096#1072#1073#1083#1086#1085#1072' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
  ClientHeight = 656
  ClientWidth = 451
  Color = clBtnFace
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
  object pBottom: TPanel
    Left = 0
    Top = 620
    Width = 451
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      451
      36)
    object bOK: TcxButton
      Left = 277
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
      OnClick = bOKClick
    end
    object bCancel: TcxButton
      Left = 361
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
    object bTest: TcxButton
      Left = 9
      Top = 4
      Width = 80
      Height = 25
      Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1090#1100
      OptionsImage.NumGlyphs = 2
      TabOrder = 2
      OnClick = bTestClick
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 4
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103':'
    TabOrder = 0
    Height = 193
    Width = 433
    object eHeader: TcxTextEdit
      Left = 12
      Top = 36
      AutoSize = False
      BeepOnEnter = False
      Properties.OnChange = eChange
      TabOrder = 1
      OnKeyDown = eKeyDown
      Height = 21
      Width = 409
    end
    object cxLabel3: TcxLabel
      Left = 12
      Top = 20
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082':'
      Style.TextStyle = [fsBold]
      Transparent = True
    end
    object eText: TcxMemo
      Left = 12
      Top = 76
      Properties.ScrollBars = ssVertical
      Properties.WantReturns = False
      Properties.OnChange = eChange
      TabOrder = 3
      OnKeyDown = eKeyDown
      Height = 61
      Width = 305
    end
    object cbColor: TcxLabel
      Left = 220
      Top = 140
      Caption = #1062#1074#1077#1090':'
      Style.TextStyle = []
      Transparent = True
    end
    object eColor: TdxColorEdit
      Left = 220
      Top = 156
      Properties.ImmediatePost = True
      Properties.ColorSet = csTheme1
      Properties.OnChange = eChange
      TabOrder = 9
      Width = 201
    end
    object cxLabel1: TcxLabel
      Left = 12
      Top = 60
      Caption = #1058#1077#1082#1089#1090':'
      Style.TextStyle = [fsBold]
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 12
      Top = 140
      Caption = #1042#1088#1077#1084#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' ('#1089#1077#1082'.):'
      Style.TextStyle = []
      Transparent = True
    end
    object eShowTime: TcxSpinEdit
      Left = 12
      Top = 156
      AutoSize = False
      BeepOnEnter = False
      Properties.AssignedValues.MinValue = True
      Properties.ImmediatePost = True
      Properties.OnChange = eChange
      TabOrder = 5
      OnKeyDown = eKeyDown
      Height = 21
      Width = 201
    end
    object cxLabel13: TcxLabel
      Left = 324
      Top = 60
      Caption = #1048#1082#1086#1085#1082#1072':'
      Style.TextStyle = []
      Transparent = True
    end
    object Image: TcxImage
      Left = 324
      Top = 76
      Properties.GraphicClassName = 'TdxSmartImage'
      Properties.ImmediatePost = True
      Properties.PopupMenuLayout.MenuItems = [pmiCut, pmiCopy, pmiPaste, pmiDelete, pmiCustom]
      Properties.PopupMenuLayout.CustomMenuItemCaption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091' '#1080#1079' '#1092#1072#1081#1083#1072'...'
      Properties.OnCustomClick = ImagePropertiesCustomClick
      TabOrder = 4
      OnDblClick = bLoadImageClick
      OnKeyDown = eKeyDown
      Height = 61
      Width = 96
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 204
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1090#1086#1095#1082#1072':'
    TabOrder = 1
    Height = 109
    Width = 433
    object cxLabel4: TcxLabel
      Left = 12
      Top = 20
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1090#1086#1095#1082#1072':'
      Style.TextStyle = []
      Transparent = True
    end
    object cxLabel5: TcxLabel
      Left = 12
      Top = 60
      Caption = #1059#1089#1083#1086#1074#1080#1077':'
      Style.TextStyle = []
      Transparent = True
    end
    object cxLabel6: TcxLabel
      Left = 220
      Top = 60
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077' ('#1084#1080#1085'.):'
      Style.TextStyle = []
      Transparent = True
    end
    object cbTimeCondition: TcxComboBox
      Left = 12
      Top = 76
      AutoSize = False
      BeepOnEnter = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnChange = eChange
      TabOrder = 4
      OnKeyDown = eKeyDown
      Height = 21
      Width = 201
    end
    object cbTimeFieldName: TcxLookupComboBox
      Left = 12
      Top = 36
      AutoSize = False
      BeepOnEnter = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FieldName'
      Properties.ListColumns = <
        item
          Caption = #1055#1086#1083#1077' '#1074#1088#1077#1084#1077#1085#1080
          Width = 200
          FieldName = 'FieldCaption'
        end
        item
          Caption = #1052#1080#1085#1080#1084#1091#1084
          Width = 100
          FieldName = 'MinValue'
        end
        item
          Caption = #1052#1072#1082#1089#1080#1084#1091#1084
          Width = 100
          FieldName = 'MaxValue'
        end>
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsTimeOptions
      Properties.OnChange = cbTimeFieldNamePropertiesChange
      TabOrder = 1
      OnKeyDown = eKeyDown
      Height = 21
      Width = 409
    end
    object eTimeValue: TcxSpinEdit
      Left = 220
      Top = 76
      Properties.AssignedValues.MinValue = True
      Properties.ImmediatePost = True
      Properties.LargeIncrement = 60.000000000000000000
      Properties.SpinButtons.ShowFastButtons = True
      Properties.OnChange = eChange
      TabOrder = 5
      OnKeyDown = eKeyDown
      Width = 201
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 8
    Top = 320
    Caption = #1059#1089#1083#1086#1074#1080#1103':'
    TabOrder = 2
    Height = 145
    Width = 433
    object GridCond: TcxGrid
      Left = 48
      Top = 24
      Width = 369
      Height = 105
      TabOrder = 1
      LookAndFeel.ScrollbarMode = sbmDefault
      object ViewCond: TcxGridDBTableView
        OnDblClick = ViewCondDblClick
        OnKeyDown = ViewCondKeyDown
        OnKeyPress = ViewCondKeyPress
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = UtilForm.ImageList
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = False
        Navigator.Buttons.Insert.Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Navigator.Buttons.Insert.ImageIndex = 259
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1088#1091#1095#1085#1091#1102
        Navigator.Buttons.Append.ImageIndex = 100
        Navigator.Buttons.Append.Visible = True
        Navigator.Buttons.Delete.ImageIndex = 101
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.ImageIndex = 102
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsCond
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
          end
          item
            Format = ',0'
            Kind = skSum
          end
          item
            Kind = skSum
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.NavigatorHints = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NavigatorOffset = 0
        OptionsView.ScrollBars = ssVertical
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object ViewCondOrderFieldCaption: TcxGridDBColumn
          DataBinding.FieldName = 'OrderFieldCaption'
          Width = 150
        end
        object ViewCondConditionTypeCaption: TcxGridDBColumn
          DataBinding.FieldName = 'ConditionTypeCaption'
          Width = 80
        end
        object ViewCondOrderFieldValueCaption: TcxGridDBColumn
          DataBinding.FieldName = 'OrderFieldValueCaption'
          Width = 200
        end
      end
      object ViewWorkBanded: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = True
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
        Navigator.InfoPanel.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsCond
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1042#1089#1077#1075#1086': ,0'
            Kind = skCount
            Column = ViewWorkBandedWorkName
          end
          item
            Kind = skSum
            Column = ViewWorkBandedSum
          end
          item
            Kind = skSum
            Column = ViewWorkBandedTimeSum
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.ImmediateEditor = False
        OptionsData.Appending = True
        OptionsData.CancelOnExit = False
        OptionsData.DeletingConfirmation = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ScrollBars = ssNone
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.BandHeaders = False
        Bands = <
          item
            Caption = #1042#1080#1076#1099' '#1088#1072#1073#1086#1090
            Options.HoldOwnColumnsOnly = True
          end>
        object ViewWorkBandedWorkName: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkName'
          Width = 200
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object ViewWorkBandedWorkerClassTag: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkerClassTag'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object ViewWorkBandedPrice: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Price'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 1
        end
        object ViewWorkBandedAmount: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Amount'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 1
        end
        object ViewWorkBandedSum: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Sum'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 1
        end
        object ViewWorkBandedUnitName: TcxGridDBBandedColumn
          DataBinding.FieldName = 'UnitName'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 1
        end
        object ViewWorkBandedNorm: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Norm'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 1
        end
        object ViewWorkBandedTimeSum: TcxGridDBBandedColumn
          DataBinding.FieldName = 'TimeSum'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 1
        end
      end
      object LevelCond: TcxGridLevel
        GridView = ViewCond
      end
    end
    object bAddCond: TcxButton
      Left = 14
      Top = 24
      Width = 31
      Height = 33
      Action = aAddCond
      OptionsImage.Images = UtilForm.ImageList
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.AllowAllUp = True
      TabOrder = 0
      WordWrap = True
    end
    object bEditCond: TcxButton
      Left = 14
      Top = 60
      Width = 31
      Height = 33
      Action = aEditCond
      OptionsImage.Images = UtilForm.ImageList
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.AllowAllUp = True
      TabOrder = 2
      WordWrap = True
    end
    object bDelCond: TcxButton
      Left = 14
      Top = 96
      Width = 31
      Height = 33
      Action = aDelCond
      OptionsImage.Images = UtilForm.ImageList
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.AllowAllUp = True
      TabOrder = 3
      WordWrap = True
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 8
    Top = 472
    Caption = #1044#1077#1081#1089#1090#1074#1080#1103':'
    TabOrder = 3
    Height = 145
    Width = 433
    object GridAction: TcxGrid
      Left = 48
      Top = 24
      Width = 369
      Height = 105
      TabOrder = 1
      LookAndFeel.ScrollbarMode = sbmDefault
      object ViewAction: TcxGridDBTableView
        OnDblClick = ViewActionDblClick
        OnKeyDown = ViewActionKeyDown
        OnKeyPress = ViewActionKeyPress
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = UtilForm.ImageList
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = False
        Navigator.Buttons.Insert.Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Navigator.Buttons.Insert.ImageIndex = 259
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1088#1091#1095#1085#1091#1102
        Navigator.Buttons.Append.ImageIndex = 100
        Navigator.Buttons.Append.Visible = True
        Navigator.Buttons.Delete.ImageIndex = 101
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.ImageIndex = 102
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsAction
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
          end
          item
            Format = ',0'
            Kind = skSum
          end
          item
            Kind = skSum
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.NavigatorHints = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NavigatorOffset = 0
        OptionsView.ScrollBars = ssVertical
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object ViewActionOrderFieldCaption: TcxGridDBColumn
          DataBinding.FieldName = 'OrderFieldCaption'
          Width = 150
        end
        object ViewActionActionTypeCaption: TcxGridDBColumn
          DataBinding.FieldName = 'ActionTypeCaption'
          Width = 80
        end
        object ViewActionOrderFieldValueCaption: TcxGridDBColumn
          DataBinding.FieldName = 'OrderFieldValueCaption'
          Width = 200
        end
      end
      object cxGridDBBandedTableView1: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = True
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] '#1080#1079' [RecordCount]'
        Navigator.InfoPanel.Visible = True
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsCond
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1042#1089#1077#1075#1086': ,0'
            Kind = skCount
            Column = cxGridDBBandedColumn1
          end
          item
            Kind = skSum
            Column = cxGridDBBandedColumn5
          end
          item
            Kind = skSum
            Column = cxGridDBBandedColumn8
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.ImmediateEditor = False
        OptionsData.Appending = True
        OptionsData.CancelOnExit = False
        OptionsData.DeletingConfirmation = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ScrollBars = ssNone
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.BandHeaders = False
        Bands = <
          item
            Caption = #1042#1080#1076#1099' '#1088#1072#1073#1086#1090
            Options.HoldOwnColumnsOnly = True
          end>
        object cxGridDBBandedColumn1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkName'
          Width = 200
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn2: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WorkerClassTag'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGridDBBandedColumn3: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Price'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 1
        end
        object cxGridDBBandedColumn4: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Amount'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 1
        end
        object cxGridDBBandedColumn5: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Sum'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 1
        end
        object cxGridDBBandedColumn6: TcxGridDBBandedColumn
          DataBinding.FieldName = 'UnitName'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 1
        end
        object cxGridDBBandedColumn7: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Norm'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 1
        end
        object cxGridDBBandedColumn8: TcxGridDBBandedColumn
          DataBinding.FieldName = 'TimeSum'
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 1
        end
      end
      object LevelAction: TcxGridLevel
        GridView = ViewAction
      end
    end
    object bAddAction: TcxButton
      Left = 14
      Top = 24
      Width = 31
      Height = 33
      Action = aAddAction
      OptionsImage.Images = UtilForm.ImageList
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.AllowAllUp = True
      TabOrder = 0
      WordWrap = True
    end
    object bEditAction: TcxButton
      Left = 14
      Top = 60
      Width = 31
      Height = 33
      Action = aEditAction
      OptionsImage.Images = UtilForm.ImageList
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.AllowAllUp = True
      TabOrder = 2
      WordWrap = True
    end
    object bDelAction: TcxButton
      Left = 14
      Top = 96
      Width = 31
      Height = 33
      Action = aDelAction
      OptionsImage.Images = UtilForm.ImageList
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.AllowAllUp = True
      TabOrder = 3
      WordWrap = True
    end
  end
  object OpenDialog: TOpenPictureDialog
    DefaultExt = 'png'
    Filter = 
      #1042#1089#1077' '#1092#1072#1081#1083#1099' (*.png,*.bmp,*.jpg)|*.png;*.bmp;*.jpg|Portable Network' +
      ' Graphics (*.png)|*.png|Bitmaps (*.bmp)|*.bmp|JPEG Image File (*' +
      '.jpg)|*.jpg'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1054#1090#1082#1088#1099#1090#1080#1077' '#1082#1072#1088#1090#1080#1085#1082#1080
    Left = 368
    Top = 84
  end
  object dsCond: TDataSource
    DataSet = mdCond
    Left = 112
    Top = 384
  end
  object mdCond: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 156
    Top = 384
    object mdCondID: TIntegerField
      FieldName = 'ID'
    end
    object mdCondID_NoticeTemplate: TIntegerField
      FieldName = 'ID_NoticeTemplate'
    end
    object mdCondPosNum: TIntegerField
      FieldName = 'PosNum'
    end
    object mdCondOrderFieldName: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'OrderFieldName'
      Size = 50
    end
    object mdCondOrderFieldCaption: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'OrderFieldCaption'
      Size = 50
    end
    object mdCondConditionType: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1077
      FieldName = 'ConditionType'
      Size = 50
    end
    object mdCondConditionTypeCaption: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1077
      FieldName = 'ConditionTypeCaption'
      Size = 50
    end
    object mdCondTableName: TStringField
      DisplayLabel = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      FieldName = 'TableName'
      Size = 50
    end
    object mdCondTableCaption: TStringField
      DisplayLabel = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      FieldName = 'TableCaption'
      Size = 50
    end
    object mdCondFieldName: TStringField
      DisplayLabel = #1055#1086#1083#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      FieldName = 'FieldName'
      Size = 50
    end
    object mdCondFieldCaption: TStringField
      DisplayLabel = #1055#1086#1083#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      FieldName = 'FieldCaption'
      Size = 50
    end
    object mdCondOrderFieldValue: TStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'OrderFieldValue'
      Size = 500
    end
    object mdCondOrderFieldValueCaption: TStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'OrderFieldValueCaption'
      Size = 500
    end
    object mdCondEdited: TBooleanField
      FieldName = 'Edited'
    end
  end
  object BarMan: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = UtilForm.ImageList
    ImageOptions.LargeImages = UtilForm.ImageListBig
    ImageOptions.StretchGlyphs = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 188
    Top = 85
    PixelsPerInch = 96
    object dxBarButton1: TdxBarButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1099' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Visible = ivAlways
      ImageIndex = 259
      ShortCut = 16449
    end
    object dxBarButton2: TdxBarButton
      Action = aAddCond
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aEditCond
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aDelCond
      Category = 0
    end
  end
  object ActionList: TActionList
    Images = UtilForm.ImageListBig
    Left = 124
    Top = 89
    object aAddCond: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077
      ImageIndex = 100
      ShortCut = 32833
      OnExecute = bAddCondClick
    end
    object aEditCond: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077
      ImageIndex = 102
      ShortCut = 16453
      OnExecute = bEditCondClick
    end
    object aDelCond: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 101
      ShortCut = 16452
      OnExecute = bDelCondClick
    end
    object aAddAction: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1081#1089#1090#1074#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1081#1089#1090#1074#1080#1077
      ImageIndex = 100
      OnExecute = bAddActionClick
    end
    object aEditAction: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1081#1089#1090#1074#1080#1077
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1081#1089#1090#1074#1080#1077
      ImageIndex = 102
      OnExecute = bEditActionClick
    end
    object aDelAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1081#1089#1090#1074#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1081#1089#1090#1074#1080#1077
      ImageIndex = 101
      OnExecute = bDelActionClick
    end
  end
  object dsAction: TDataSource
    DataSet = mdAction
    Left = 116
    Top = 528
  end
  object qTimeOptions: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from noticeoptionstime'
      'order by  FieldCaption')
    Params = <>
    Left = 276
    Top = 216
    object qTimeOptionsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qTimeOptionsFieldName: TWideStringField
      FieldName = 'FieldName'
      Size = 200
    end
    object qTimeOptionsFieldCaption: TWideStringField
      FieldName = 'FieldCaption'
      Size = 400
    end
    object qTimeOptionsCondBefore: TSmallintField
      FieldName = 'CondBefore'
    end
    object qTimeOptionsCondAfter: TSmallintField
      FieldName = 'CondAfter'
    end
    object qTimeOptionsMinValue: TIntegerField
      FieldName = 'MinValue'
    end
    object qTimeOptionsMaxValue: TIntegerField
      FieldName = 'MaxValue'
    end
  end
  object dsTimeOptions: TDataSource
    DataSet = qTimeOptions
    Left = 356
    Top = 216
  end
  object mdAction: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 176
    Top = 528
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_NoticeTemplate'
    end
    object IntegerField3: TIntegerField
      FieldName = 'PosNum'
    end
    object StringField1: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'OrderFieldName'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'OrderFieldCaption'
      Size = 50
    end
    object StringField3: TStringField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1080#1077
      FieldName = 'ActionType'
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1080#1077
      FieldName = 'ActionTypeCaption'
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      FieldName = 'TableName'
      Size = 50
    end
    object StringField6: TStringField
      DisplayLabel = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      FieldName = 'TableCaption'
      Size = 50
    end
    object StringField7: TStringField
      DisplayLabel = #1055#1086#1083#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      FieldName = 'FieldName'
      Size = 50
    end
    object StringField8: TStringField
      DisplayLabel = #1055#1086#1083#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      FieldName = 'FieldCaption'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'OrderFieldValue'
      Size = 500
    end
    object StringField10: TStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'OrderFieldValueCaption'
      Size = 500
    end
    object BooleanField1: TBooleanField
      FieldName = 'Edited'
    end
  end
end
