object OrderParamForm: TOrderParamForm
  Left = 436
  Top = 305
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 803
  ClientWidth = 936
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pBottom: TPanel
    Left = 0
    Top = 767
    Width = 936
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    OnDblClick = pBottomDblClick
    DesignSize = (
      936
      36)
    object bOK: TcxButton
      Left = 762
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
      Left = 846
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
    object ldadata: TcxLabel
      Left = 12
      Top = 4
      Transparent = True
    end
  end
  object pLeft: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 767
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinWidth = 329
    TabOrder = 0
    object gbClient: TcxGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 0
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alTop
      Caption = #1050#1083#1080#1077#1085#1090':'
      TabOrder = 0
      Height = 241
      Width = 635
      object sbCopy: TSpeedButton
        Left = 264
        Top = 40
        Width = 25
        Height = 24
        Hint = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
        ImageIndex = 0
        Images = TelImageList
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopyClick
      end
      object sbPaste: TSpeedButton
        Left = 216
        Top = 40
        Width = 25
        Height = 24
        Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1086#1073#1084#1077#1085#1072
        ImageIndex = 1
        Images = TelImageList
        ParentShowHint = False
        ShowHint = True
        OnClick = sbPasteClick
      end
      object SpeedButton1: TSpeedButton
        Left = 288
        Top = 40
        Width = 25
        Height = 24
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1080' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
        ImageIndex = 4
        Images = TelImageList
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object sbCall: TSpeedButton
        Left = 240
        Top = 40
        Width = 25
        Height = 24
        Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1086#1073#1084#1077#1085#1072
        ImageIndex = 3
        Images = TelImageList
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCallClick
      end
      object lPhone: TcxLabel
        Left = 12
        Top = 20
        Caption = #1058#1077#1083#1077#1092#1086#1085':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel1: TcxLabel
        Left = 320
        Top = 20
        Caption = #1048#1084#1103':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 12
        Top = 68
        Caption = #1040#1076#1088#1077#1089':'
        Style.TextStyle = []
        Transparent = True
      end
      object eName: TcxTextEdit
        Left = 320
        Top = 40
        AutoSize = False
        BeepOnEnter = False
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        OnKeyDown = eKeyDown
        Height = 24
        Width = 301
      end
      object cxLabel4: TcxLabel
        Left = 321
        Top = 68
        Caption = #1050#1074#1072#1088#1090#1080#1088#1072':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 12
        Top = 116
        Caption = #1056#1072#1081#1086#1085' '#1075#1086#1088#1086#1076#1072':'
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 320
        Top = 116
        Caption = #1057#1090#1072#1085#1094#1080#1103' '#1084#1077#1090#1088#1086':'
        Transparent = True
      end
      object eAddress: TcxComboBox
        Left = 12
        Top = 88
        AutoSize = False
        BeepOnEnter = False
        ParentFont = False
        Properties.DropDownRows = 20
        Properties.DropDownSizeable = True
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.IncrementalSearch = False
        Properties.Items.Strings = (
          '')
        Properties.OnChange = eAddressPropertiesChange
        Properties.OnPopup = eAddressPropertiesPopup
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 7
        OnEnter = eAddressEnter
        OnExit = eAddressExit
        OnKeyDown = eAddressKeyDown
        Height = 24
        Width = 301
      end
      object cbDistrict: TcxComboBox
        Left = 12
        Top = 136
        AutoSize = False
        BeepOnEnter = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.OnChange = cbDistrictPropertiesChange
        Properties.OnPopup = cbDistrictPropertiesPopup
        TabOrder = 12
        OnKeyDown = eKeyDown
        Height = 24
        Width = 301
      end
      object cbMetro: TcxComboBox
        Left = 320
        Top = 136
        AutoSize = False
        BeepOnEnter = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.OnPopup = cbMetroPropertiesPopup
        TabOrder = 13
        OnKeyDown = eKeyDown
        Height = 24
        Width = 301
      end
      object ePhone: TcxMaskEdit
        Left = 216
        Top = 12
        AutoSize = False
        BeepOnEnter = False
        Properties.EditMask = '!\(999\)000-0000;1;_'
        Properties.OnChange = ePhonePropertiesChange
        TabOrder = 0
        Text = '(   )   -    '
        Visible = False
        OnExit = ePhoneExit
        OnKeyDown = eKeyDown
        Height = 24
        Width = 97
      end
      object cxLabel10: TcxLabel
        Left = 12
        Top = 164
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1072#1076#1088#1077#1089#1091':'
        Style.TextStyle = []
        Transparent = True
      end
      object eClientComment: TcxMemo
        Left = 12
        Top = 184
        Lines.Strings = (
          '123123123'
          '234234234'
          '3333333333')
        Properties.ScrollBars = ssVertical
        Properties.WantReturns = False
        Properties.OnChange = eRequestTextPropertiesChange
        TabOrder = 15
        OnKeyDown = eKeyDown
        Height = 41
        Width = 609
      end
      object cbClientDomSPB: TcxCheckBox
        Left = 482
        Top = 88
        AutoSize = False
        Caption = #1050#1083#1080#1077#1085#1090' '#1044#1086#1084' '#1057#1055#1041
        Properties.FullFocusRect = True
        Style.TextStyle = []
        TabOrder = 9
        Transparent = True
        OnKeyDown = eKeyDown
        Height = 21
        Width = 135
      end
      object cbPhone: TcxLookupComboBox
        Left = 12
        Top = 40
        AutoSize = False
        BeepOnEnter = False
        ParentFont = False
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsEditList
        Properties.DropDownRows = 20
        Properties.DropDownSizeable = True
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'Phone'
        Properties.ListColumns = <
          item
            Caption = #1058#1077#1083#1077#1092#1086#1085
            Fixed = True
            Width = 80
            FieldName = 'Phone'
          end
          item
            Caption = #1048#1084#1103
            Width = 150
            FieldName = 'Name'
          end
          item
            Caption = #1040#1076#1088#1077#1089
            Width = 150
            FieldName = 'Address'
          end
          item
            Caption = #1050#1074#1072#1088#1090#1080#1088#1072
            Fixed = True
            Width = 80
            FieldName = 'FlatNumber'
          end>
        Properties.ListSource = dsClientList
        Properties.PostPopupValueOnTab = True
        Properties.OnChange = cbPhonePropertiesChange
        Properties.OnValidate = cbPhonePropertiesValidate
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = cbPhoneEnter
        OnExit = cbPhoneExit
        OnKeyDown = eKeyDown
        OnKeyPress = cbPhoneKeyPress
        Height = 24
        Width = 205
      end
      object eFlatNumber: TcxTextEdit
        Left = 322
        Top = 88
        AutoSize = False
        BeepOnEnter = False
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 8
        OnKeyDown = eKeyDown
        Height = 24
        Width = 151
      end
    end
    object gbWork: TcxGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 249
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = #1056#1072#1073#1086#1090#1099':'
      TabOrder = 1
      Height = 375
      Width = 635
      object cxLabel3: TcxLabel
        Left = 12
        Top = 20
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1079#1072#1082#1072#1079#1091':'
        Style.TextStyle = []
        Transparent = True
      end
      object eRequestText: TcxMemo
        Left = 12
        Top = 40
        Lines.Strings = (
          '1123123'
          '234234234'
          '345345345')
        Properties.ScrollBars = ssVertical
        Properties.WantReturns = False
        Properties.OnChange = eRequestTextPropertiesChange
        TabOrder = 1
        OnKeyDown = eKeyDown
        Height = 61
        Width = 609
      end
      object cxLabel7: TcxLabel
        Left = 12
        Top = 104
        Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1073#1086#1090':'
        Transparent = True
      end
      object GridWork: TcxGrid
        Left = 48
        Top = 124
        Width = 573
        Height = 141
        TabOrder = 7
        LookAndFeel.ScrollbarMode = sbmDefault
        object ViewWork: TcxGridDBTableView
          PopupMenu = pmMenu
          Navigator.Buttons.OnButtonClick = ViewWorkNavigatorButtonsButtonClick
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
          OnCellDblClick = ViewWorkCellDblClick
          DataController.DataSource = dsWork
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = ViewWorkWorkName
            end
            item
              Format = ',0'
              Kind = skSum
              Column = ViewWorkSum
            end
            item
              Kind = skSum
              Column = ViewWorkTimeSum
            end
            item
              Format = ',0'
              Kind = skSum
              Column = ViewWorkDiscountSum
            end
            item
              Format = ',0'
              Kind = skSum
              Column = ViewWorkDiscountPromoSum
            end
            item
              Format = ',0'
              Kind = skSum
              Column = ViewWorkDiscountSumRes
            end
            item
              Format = ',0'
              Kind = skSum
              Column = ViewWorkDiscountPromoSumApply
            end
            item
              Format = ',0'
              Kind = skSum
              Column = ViewWorkWorkSum
            end>
          DataController.Summary.SummaryGroups = <>
          DataController.Summary.OnAfterSummary = ViewWorkDataControllerSummaryAfterSummary
          FilterRow.ApplyChanges = fracImmediately
          NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
          OptionsBehavior.CellHints = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
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
          object ViewWorkWorkerClassTag: TcxGridDBColumn
            DataBinding.FieldName = 'WorkerClassTag'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            MinWidth = 30
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Styles.Content = BoldColumn
            Width = 30
            IsCaptionAssigned = True
          end
          object ViewWorkWorkName: TcxGridDBColumn
            DataBinding.FieldName = 'WorkName'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            MinWidth = 200
            Options.Moving = False
            Width = 300
          end
          object ViewWorkAmountText: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'AmountText'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            MinWidth = 50
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 50
          end
          object ViewWorkPrice: TcxGridDBColumn
            Caption = #1062#1077#1085#1072' ('#1088')'
            DataBinding.FieldName = 'Price'
            OnGetCellHint = ViewWorkPriceGetCellHint
            MinWidth = 70
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Options.Moving = False
            Styles.OnGetContentStyle = ViewWorkPriceStylesGetContentStyle
            Width = 70
          end
          object ViewWorkSum: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' ('#1088')'
            DataBinding.FieldName = 'Sum'
            OnGetCellHint = ViewWorkSumGetCellHint
            MinWidth = 70
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Options.Moving = False
            Styles.Content = BoldColumn
            Styles.OnGetContentStyle = ViewWorkSumStylesGetContentStyle
            Width = 70
          end
          object ViewWorkAmount: TcxGridDBColumn
            DataBinding.FieldName = 'Amount'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkUnitName: TcxGridDBColumn
            DataBinding.FieldName = 'UnitName'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkNorm: TcxGridDBColumn
            DataBinding.FieldName = 'Norm'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkTimeSum: TcxGridDBColumn
            DataBinding.FieldName = 'TimeSum'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkDiscountSum: TcxGridDBColumn
            DataBinding.FieldName = 'DiscountSum'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkWorkSum: TcxGridDBColumn
            DataBinding.FieldName = 'WorkSum'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkWorkPrice: TcxGridDBColumn
            DataBinding.FieldName = 'WorkPrice'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkDiscountPromoSum: TcxGridDBColumn
            DataBinding.FieldName = 'DiscountPromoSum'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkDiscountSumRes: TcxGridDBColumn
            DataBinding.FieldName = 'DiscountSumRes'
            Visible = False
            VisibleForCustomization = False
          end
          object ViewWorkDiscountPromoSumApply: TcxGridDBColumn
            DataBinding.FieldName = 'DiscountPromoSumApply'
            Visible = False
            VisibleForCustomization = False
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
          DataController.DataSource = dsWork
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
        object LevelWork: TcxGridLevel
          GridView = ViewWork
        end
      end
      object cbPaymentForm: TcxComboBox
        Left = 12
        Top = 334
        AutoSize = False
        BeepOnEnter = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.OnChange = cbPaymentFormPropertiesChange
        TabOrder = 9
        OnKeyDown = eKeyDown
        Height = 24
        Width = 209
      end
      object lPaymentForm: TcxLabel
        Left = 12
        Top = 314
        Caption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099':'
        Style.TextStyle = [fsBold]
        Transparent = True
      end
      object cbPayed: TcxCheckBox
        Left = 224
        Top = 336
        AutoSize = False
        Caption = #1054#1087#1083#1072#1095#1077#1085#1086
        Properties.FullFocusRect = True
        Style.TextStyle = []
        TabOrder = 12
        Transparent = True
        OnKeyDown = eKeyDown
        Height = 21
        Width = 85
      end
      object lInfo1: TcxLabel
        Left = 12
        Top = 272
        Caption = #1056#1072#1073#1086#1090':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object lInfo21: TcxLabel
        Left = 484
        Top = 272
        Caption = #1057#1082#1080#1076#1082#1072'/'#1055#1088#1086#1084#1086': 0 '#1088'.'
        ParentColor = False
        ParentFont = False
        Style.Color = clRed
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 621
      end
      object bAdd: TcxButton
        Left = 14
        Top = 124
        Width = 31
        Height = 33
        Action = aAddGuide
        OptionsImage.Images = UtilForm.ImageList
        PaintStyle = bpsGlyph
        ParentShowHint = False
        ShowHint = True
        SpeedButtonOptions.AllowAllUp = True
        TabOrder = 2
        WordWrap = True
      end
      object bAddManual: TcxButton
        Left = 14
        Top = 160
        Width = 31
        Height = 33
        Action = aAddManual
        OptionsImage.Images = UtilForm.ImageList
        PaintStyle = bpsGlyph
        ParentShowHint = False
        ShowHint = True
        SpeedButtonOptions.AllowAllUp = True
        TabOrder = 3
        WordWrap = True
      end
      object bEdit: TcxButton
        Left = 14
        Top = 196
        Width = 31
        Height = 33
        Action = aEdit
        OptionsImage.Images = UtilForm.ImageList
        PaintStyle = bpsGlyph
        ParentShowHint = False
        ShowHint = True
        SpeedButtonOptions.AllowAllUp = True
        TabOrder = 4
        WordWrap = True
      end
      object bDelete: TcxButton
        Left = 14
        Top = 232
        Width = 31
        Height = 33
        Action = aDel
        OptionsImage.Images = UtilForm.ImageList
        PaintStyle = bpsGlyph
        ParentShowHint = False
        ShowHint = True
        SpeedButtonOptions.AllowAllUp = True
        TabOrder = 5
        WordWrap = True
      end
      object lInfo11: TcxLabel
        Left = 12
        Top = 292
        Caption = #1056#1072#1073#1086#1090':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object lInfo2: TcxLabel
        Left = 572
        Top = 292
        Caption = #1048#1058#1054#1043#1054':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 621
      end
      object eCheckNum: TcxTextEdit
        Left = 316
        Top = 334
        Properties.ReadOnly = True
        TabOrder = 15
        Width = 145
      end
      object lCheckNum: TcxLabel
        Left = 316
        Top = 314
        Caption = #1053#1086#1084#1077#1088' '#1095#1077#1082#1072':'
        Style.TextStyle = [fsBold]
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 468
        Top = 314
        Caption = #1055#1088#1086#1084#1086#1082#1086#1076':'
        Style.TextStyle = [fsBold]
        Transparent = True
      end
      object ePromocode: TcxButtonEdit
        Left = 468
        Top = 334
        Properties.Buttons = <
          item
            Default = True
            Hint = #1042#1099#1073#1088#1072#1090#1100
            Kind = bkEllipsis
          end
          item
            Caption = 'X'
            Hint = #1059#1076#1072#1083#1080#1090#1100
            Kind = bkText
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ePromocodePropertiesButtonClick
        Style.TextColor = clRed
        Style.TextStyle = []
        TabOrder = 17
        Width = 153
      end
      object lInfo0: TcxLabel
        Left = 316
        Top = 272
        Caption = #1057#1091#1084#1084#1072': 0 '#1088'.'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
    end
    object gbRes: TcxGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 632
      Margins.Left = 4
      Margins.Top = 8
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alBottom
      Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1080' '#1074#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103':'
      TabOrder = 2
      Height = 127
      Width = 635
      object cxLabel18: TcxLabel
        Left = 12
        Top = 20
        Caption = #1050#1083#1080#1077#1085#1090#1089#1082#1086#1077' '#1074#1088#1077#1084#1103':'
        Style.TextStyle = []
        Transparent = True
      end
      object bResManual: TcxButton
        Left = 472
        Top = 40
        Width = 105
        Height = 24
        Caption = #1042#1088#1091#1095#1085#1091#1102
        SpeedButtonOptions.AllowAllUp = True
        TabOrder = 5
        WordWrap = True
        OnClick = bResManualClick
      end
      object eResMaster: TcxButtonEdit
        Left = 316
        Top = 88
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = eResMasterPropertiesButtonClick
        TabOrder = 14
        Width = 305
      end
      object cxLabel19: TcxLabel
        Left = 316
        Top = 68
        Caption = #1052#1072#1089#1090#1077#1088':'
        Style.TextStyle = []
        Transparent = True
      end
      object bResAuto: TcxButton
        Left = 316
        Top = 40
        Width = 145
        Height = 24
        Caption = #1040#1074#1090#1086#1074#1099#1073#1086#1088
        SpeedButtonOptions.AllowAllUp = True
        TabOrder = 4
        WordWrap = True
        OnClick = bResAutoClick
      end
      object eResDate: TcxDateEdit
        Left = 164
        Top = 40
        EditValue = '01.02.2022'
        Enabled = False
        Properties.Alignment.Horz = taCenter
        Properties.ImmediatePost = True
        Properties.InputKind = ikRegExpr
        Properties.ReadOnly = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = eResDatePropertiesChange
        TabOrder = 2
        Width = 89
      end
      object cxLabel20: TcxLabel
        Left = 164
        Top = 20
        Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1085#1086#1077' '#1074#1088#1077#1084#1103':'
        Style.TextStyle = []
        Transparent = True
      end
      object cxLabel21: TcxLabel
        Left = 12
        Top = 68
        Caption = #1044#1083#1080#1090'-'#1089#1090#1100' ('#1088#1072#1089#1095'./'#1092#1072#1082#1090'.):'
        Style.TextStyle = []
        Transparent = True
      end
      object eTimeCalc: TcxButtonEdit
        Left = 12
        Top = 88
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end
          item
            Caption = '5 '#1095'.'
            Kind = bkText
            LeftAlignment = True
            Width = 71
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = eTImeCalcPropertiesButtonClick
        TabOrder = 7
        Width = 73
      end
      object eClientTime: TcxTextEdit
        Left = 12
        Top = 40
        Enabled = False
        Properties.ReadOnly = False
        TabOrder = 1
        Width = 145
      end
      object eResTime: TcxTimeEdit
        Left = 252
        Top = 40
        Enabled = False
        Properties.Alignment.Horz = taCenter
        Properties.ImmediatePost = True
        Properties.TimeFormat = tfHourMin
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = eResTimePropertiesChange
        TabOrder = 3
        OnExit = eResTimeExit
        Width = 57
      end
      object eTimeLen: TcxSpinEdit
        Left = 84
        Top = 88
        Properties.Alignment.Horz = taCenter
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = ',0. '#1095'"."'
        Properties.EditFormat = ',0. '#1095'"."'
        Properties.ImmediatePost = True
        Properties.MaxValue = 24.000000000000000000
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = eTimeLenPropertiesChange
        TabOrder = 8
        Width = 73
      end
      object bClear: TcxButton
        Left = 588
        Top = 40
        Width = 33
        Height = 24
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1103' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1076#1072#1090#1099', '#1074#1088#1077#1084#1077#1085#1080' '#1080' '#1084#1072#1089#1090#1077#1088#1072
        Caption = 'X'
        ParentShowHint = False
        ShowHint = True
        SpeedButtonOptions.AllowAllUp = True
        TabOrder = 6
        WordWrap = True
        OnClick = bClearClick
      end
      object cxLabel12: TcxLabel
        Left = 164
        Top = 68
        Caption = #1055#1077#1088#1080#1086#1076' '#1074#1088#1077#1084#1077#1085#1080':'
        Style.TextStyle = []
        Transparent = True
      end
      object eCalcTime: TcxTextEdit
        Left = 164
        Top = 88
        Enabled = False
        Properties.ReadOnly = False
        TabOrder = 9
        Width = 145
      end
    end
  end
  object pRight: TPanel
    Left = 639
    Top = 0
    Width = 297
    Height = 767
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object gbParams: TcxGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 0
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 8
      Align = alTop
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099':'
      Constraints.MaxWidth = 300
      Constraints.MinWidth = 165
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      DesignSize = (
        289
        445)
      Height = 445
      Width = 289
      object sStatusTypeColor: TShape
        Left = 12
        Top = 236
        Width = 16
        Height = 16
        Pen.Color = clWindowFrame
        Shape = stCircle
      end
      object sSourceTypeColor: TShape
        Left = 12
        Top = 188
        Width = 16
        Height = 16
        Pen.Color = clWindowFrame
        Shape = stCircle
      end
      object sSignalTypeColor: TShape
        Left = 12
        Top = 140
        Width = 16
        Height = 16
        Pen.Color = clWindowFrame
        Shape = stCircle
      end
      object cxLabel13: TcxLabel
        Left = 12
        Top = 164
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082':'
        Style.TextStyle = [fsBold]
        Transparent = True
      end
      object cxLabel14: TcxLabel
        Left = 12
        Top = 212
        Caption = #1057#1090#1072#1090#1091#1089':'
        Style.TextStyle = [fsBold]
        Transparent = True
      end
      object cxLabel15: TcxLabel
        Left = 12
        Top = 20
        Caption = #1053#1086#1084#1077#1088' '#1080' '#1076#1072#1090#1072' '#1079#1072#1082#1072#1079#1072':'
        Style.TextStyle = []
        Transparent = True
      end
      object eID: TcxTextEdit
        Left = 12
        Top = 40
        Anchors = [akLeft, akTop, akRight]
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 129
      end
      object eAddDate: TcxTextEdit
        Left = 148
        Top = 40
        Anchors = [akTop, akRight]
        Properties.ReadOnly = True
        TabOrder = 2
        Width = 129
      end
      object eOrderType: TcxTextEdit
        Left = 12
        Top = 88
        Anchors = [akLeft, akTop, akRight]
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 266
      end
      object cxLabel23: TcxLabel
        Left = 12
        Top = 68
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1079#1072#1082#1072#1079#1072':'
        Style.TextStyle = []
        Transparent = True
      end
      object cxLabel24: TcxLabel
        Left = 12
        Top = 116
        Caption = #1057#1080#1075#1085#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077':'
        Style.TextStyle = [fsBold]
        Transparent = True
      end
      object cxLabel25: TcxLabel
        Left = 12
        Top = 356
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1090#1072#1090#1091#1089#1091':'
        Style.TextStyle = []
        Transparent = True
      end
      object mStatusComment: TcxMemo
        Left = 12
        Top = 376
        Anchors = [akLeft, akTop, akRight]
        Properties.ScrollBars = ssVertical
        Properties.WantReturns = False
        Properties.OnChange = eRequestTextPropertiesChange
        TabOrder = 16
        OnKeyDown = eKeyDown
        Height = 57
        Width = 265
      end
      object cbStatusType: TcxLookupComboBox
        Left = 32
        Top = 232
        Properties.DropDownRows = 20
        Properties.DropDownWidth = 240
        Properties.GridMode = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 150
            FieldName = 'Name'
          end
          item
            Caption = #1062#1074#1077#1090
            Fixed = True
            MinWidth = 50
            RepositoryItem = ColorEdit
            Width = 50
            FieldName = 'Color'
          end>
        Properties.ListOptions.ColumnSorting = False
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsStatus
        Properties.OnChange = cbStatusTypeColorPropertiesChange
        TabOrder = 10
        OnKeyDown = eKeyDown
        Width = 245
      end
      object cbReason: TcxComboBox
        Left = 12
        Top = 280
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BeepOnEnter = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.OnChange = cbReasonPropertiesChange
        TabOrder = 12
        OnKeyDown = eKeyDown
        Height = 24
        Width = 265
      end
      object lReason: TcxLabel
        Left = 12
        Top = 260
        Caption = #1055#1088#1080#1095#1080#1085#1072':'
        Style.TextStyle = [fsBold]
        Transparent = True
      end
      object cbSourceType: TcxLookupComboBox
        Left = 32
        Top = 184
        Properties.DropDownRows = 20
        Properties.DropDownWidth = 240
        Properties.GridMode = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 150
            FieldName = 'Name'
          end
          item
            Caption = #1062#1074#1077#1090
            Fixed = True
            MinWidth = 50
            RepositoryItem = ColorEdit
            Width = 50
            FieldName = 'Color'
          end>
        Properties.ListOptions.ColumnSorting = False
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsSource
        Properties.OnChange = cbSourceTypePropertiesChange
        TabOrder = 8
        OnKeyDown = eKeyDown
        Width = 245
      end
      object cbSignalType: TcxLookupComboBox
        Left = 32
        Top = 136
        Properties.DropDownRows = 20
        Properties.DropDownWidth = 240
        Properties.GridMode = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 150
            FieldName = 'Name'
          end
          item
            Caption = #1062#1074#1077#1090
            Fixed = True
            MinWidth = 50
            RepositoryItem = ColorEdit
            Width = 50
            FieldName = 'Color'
          end>
        Properties.ListOptions.ColumnSorting = False
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsSignal
        Properties.OnChange = cbSignalTypePropertiesChange
        TabOrder = 6
        OnKeyDown = eKeyDown
        Width = 245
      end
      object lNeedCallDate: TcxLabel
        Left = 12
        Top = 308
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1079#1074#1086#1085#1082#1072' '#1082#1083#1080#1077#1085#1090#1091':'
        Style.TextStyle = [fsBold]
        Transparent = True
      end
      object eNeedCallDate: TcxDateEdit
        Left = 12
        Top = 328
        Properties.DateButtons = [btnClear]
        Properties.DisplayFormat = 'dd.mm.yyyy hh:nn'
        Properties.EditFormat = 'dd.mm.yyyy hh:nn'
        Properties.ImmediatePost = True
        Properties.InputKind = ikRegExpr
        Properties.Kind = ckDateTime
        Properties.ValidationOptions = []
        Properties.OnChange = eNeedCallPropertiesChange
        TabOrder = 13
        Width = 265
      end
    end
    object gbChat: TcxGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 453
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 8
      Align = alClient
      Caption = #1044#1080#1072#1083#1086#1075' '#1089' '#1084#1072#1089#1090#1077#1088#1086#1084':'
      TabOrder = 1
      DesignSize = (
        289
        306)
      Height = 306
      Width = 289
      object bSend: TcxButton
        Left = 12
        Top = 251
        Width = 265
        Height = 41
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1053#1072#1087#1080#1089#1072#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
        SpeedButtonOptions.AllowAllUp = True
        SpeedButtonOptions.Transparent = True
        TabOrder = 0
        WordWrap = True
        OnClick = bSendClick
      end
      object GridChat: TcxGrid
        Left = 12
        Top = 24
        Width = 265
        Height = 217
        TabOrder = 1
        LookAndFeel.ScrollbarMode = sbmDefault
        object ViewChat: TcxGridDBBandedTableView
          Navigator.Buttons.OnButtonClick = ViewWorkNavigatorButtonsButtonClick
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
          DataController.DataSource = dsChat
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.ApplyChanges = fracImmediately
          NewItemRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1086#1082#1080
          OptionsBehavior.CellHints = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelectMode = msmPersistent
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.NavigatorOffset = 0
          OptionsView.ScrollBars = ssVertical
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.Indicator = True
          OptionsView.BandHeaders = False
          Preview.Column = ViewChatMessageText
          Preview.MaxLineCount = 0
          Preview.Visible = True
          Styles.OnGetContentStyle = ViewChatStylesGetContentStyle
          Styles.OnGetPreviewStyle = ViewChatStylesGetPreviewStyle
          Bands = <
            item
            end>
          object ViewChatAddDateTime: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AddDateTime'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.DisplayFormat = 'dd.mm hh:nn'
            MinWidth = 80
            Options.Editing = False
            Options.Focusing = False
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object ViewChatMessageText: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MessageText'
            PropertiesClassName = 'TcxMemoProperties'
            Options.Editing = False
            Options.Focusing = False
            Width = 123
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 1
          end
          object ViewChatUseerWorkerInfo: TcxGridDBBandedColumn
            DataBinding.FieldName = 'UseerWorkerInfo'
            Options.Editing = False
            Options.Focusing = False
            Width = 157
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object ViewChatID_Worker: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID_Worker'
            Visible = False
            Options.Editing = False
            Options.Focusing = False
            VisibleForCustomization = False
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object ViewChatID_User: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID_User'
            Visible = False
            Options.Editing = False
            Options.Focusing = False
            VisibleForCustomization = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
        end
        object LevelChat: TcxGridLevel
          GridView = ViewChat
        end
      end
    end
  end
  object tClient: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from Client'
      'where Phone = :P'
      'order by Phone, Name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'P'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 76
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P'
        ParamType = ptUnknown
      end>
  end
  object mdWork: TdxMemData
    Indexes = <>
    SortOptions = []
    OnCalcFields = mdWorkCalcFields
    Left = 188
    Top = 404
    object mdWorkID: TIntegerField
      FieldName = 'ID'
    end
    object mdWorkID_WorkType: TIntegerField
      FieldName = 'ID_WorkType'
    end
    object mdWorkID_WorkerClass: TIntegerField
      FieldName = 'ID_WorkerClass'
    end
    object mdWorkWorkName: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      FieldName = 'WorkName'
      Size = 100
    end
    object mdWorkWorkPrice: TFloatField
      FieldName = 'WorkPrice'
    end
    object mdWorkWorkAmount: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'WorkAmount'
    end
    object mdWorkWorkSum: TFloatField
      FieldName = 'WorkSum'
    end
    object mdWorkUnitName: TStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084#1077#1088'.'
      FieldName = 'WorkUnitName'
    end
    object mdWorkWorkNorm: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' ('#1084')'
      FieldName = 'WorkNorm'
    end
    object mdWorkWorkWarranryType: TIntegerField
      FieldName = 'WorkWarrantyType'
    end
    object mdWorkWorkWarranryTime: TIntegerField
      FieldName = 'WorkWarrantyTime'
    end
    object mdWorkWorkerClassTag: TStringField
      DisplayWidth = 2
      FieldName = 'WorkerClassTag'
      Size = 2
    end
    object mdWorkEdited: TSmallintField
      FieldName = 'Edited'
    end
    object mdWorkPrice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price'
      DisplayFormat = ',0'
      Calculated = True
    end
    object mdWorkSum: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' ('#1088#1091#1073')'
      FieldKind = fkCalculated
      FieldName = 'Sum'
      DisplayFormat = ',0'
      Calculated = True
    end
    object mdWorkTimeSum: TFloatField
      DisplayLabel = #1042#1088#1077#1084#1103' ('#1095')'
      FieldKind = fkCalculated
      FieldName = 'TimeSum'
      Calculated = True
    end
    object mdWorkAmountText: TStringField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldKind = fkCalculated
      FieldName = 'AmountText'
      Calculated = True
    end
    object mdWorkID_Discount: TIntegerField
      FieldName = 'ID_Discount'
    end
    object mdWorkID_DiscountPromo: TIntegerField
      FieldName = 'ID_DiscountPromo'
    end
    object mdWorkDiscountPercent: TFloatField
      FieldName = 'DiscountPercent'
    end
    object mdWorkDiscountSum: TFloatField
      FieldName = 'DiscountSum'
    end
    object mdWorkDiscountPromoPercent: TFloatField
      FieldName = 'DiscountPromoPercent'
    end
    object mdWorkDiscountPromoSum: TFloatField
      FieldName = 'DiscountPromoSum'
    end
    object mdWorkTotalPrice: TFloatField
      FieldName = 'TotalPrice'
    end
    object mdWorkTotalSum: TFloatField
      FieldName = 'TotalSum'
    end
    object mdWorkDiscountDebtType: TIntegerField
      FieldName = 'DiscountDebtType'
    end
    object mdWorkDiscountSubType: TIntegerField
      FieldName = 'DiscountSubType'
    end
    object mdWorkDiscountCanAdd: TIntegerField
      FieldName = 'DiscountCanAdd'
    end
    object mdWorkDiscountMinOrderSum: TFloatField
      FieldName = 'DiscountMinOrderSum'
    end
    object mdWorkDiscountPromoDebtType: TIntegerField
      FieldName = 'DiscountPromoDebtType'
    end
    object mdWorkDiscountPromoSubType: TIntegerField
      FieldName = 'DiscountPromoSubType'
    end
    object mdWorkDiscountPromoCanAdd: TIntegerField
      FieldName = 'DiscountPromoCanAdd'
    end
    object mdWorkDiscountPromoMinOrderSum: TFloatField
      FieldName = 'DiscountPromoMinOrderSum'
    end
    object mdWorkDiscountSumRes: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089#1082#1080#1076#1082#1080' '#1080' '#1087#1088#1086#1084#1086
      FieldKind = fkCalculated
      FieldName = 'DiscountSumRes'
      Calculated = True
    end
    object mdWorkDiscountPromoSumApply: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DiscountPromoSumApply'
      Calculated = True
    end
  end
  object dsWork: TDataSource
    DataSet = mdWork
    Left = 240
    Top = 404
  end
  object qWorkType: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *, WorkClassInfo(ID_WorkClass) as WCInfo'
      'from WorkType'
      'order by WCInfo, Name')
    Params = <>
    Left = 76
    Top = 404
  end
  object dsWorkType: TDataSource
    DataSet = qWorkType
    Left = 300
    Top = 404
  end
  object tPhone: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select distinct Phone'
      'from Client'
      'order by Phone')
    Params = <>
    Left = 396
    Top = 136
  end
  object StyleRepository: TcxStyleRepository
    Left = 381
    Top = 404
    PixelsPerInch = 96
    object TimeStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clGreen
    end
    object DayStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clMaroon
    end
    object WeekdayStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object DayContentStyle: TcxStyle
      AssignedValues = [svColor]
      Color = clCream
    end
    object TimeStyleContent: TcxStyle
      AssignedValues = [svColor]
      Color = clCream
    end
    object TimeInfoStyle: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clTeal
    end
    object BoldColumn: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object ChatStyleUser: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14348768
      TextColor = clWindowText
    end
    object ChatStyleWorker: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15391423
      TextColor = clWindowText
    end
    object ChatStyleTextUser: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15858419
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object ChatStyleTextWorker: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16249062
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object StyleDiscount: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
  end
  object mdPhotoClient: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000300494400000000000F00
      060050686F746F00010100000000000000010200000000000000010300000000
      0000000104000000000000000105000000000000000106000000000000000107
      00000000000000010800000000000000010900000000000000010A0000000000
      0000010B00000000000000010C00000000000000010D00000000000000}
    SortOptions = []
    Left = 140
    Top = 228
    object mdPhotoClientID: TIntegerField
      FieldName = 'ID'
    end
    object mdPhotoClientPhoto: TGraphicField
      DisplayLabel = #1060#1086#1090#1086
      FieldName = 'Photo'
      BlobType = ftGraphic
    end
  end
  object mdPhotoMaster: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000300494400000000000F00
      060050686F746F00010100000000000000010200000000000000010300000000
      0000000104000000000000000105000000000000000106000000000000000107
      00000000000000010800000000000000}
    SortOptions = []
    Left = 132
    Top = 280
    object IntegerField2: TIntegerField
      FieldName = 'ID'
    end
    object GraphicField1: TGraphicField
      DisplayLabel = #1060#1086#1090#1086
      FieldName = 'Photo'
      BlobType = ftGraphic
    end
  end
  object dsPhotoClient: TDataSource
    DataSet = mdPhotoClient
    Left = 212
    Top = 228
  end
  object dsPhotoMaster: TDataSource
    DataSet = mdPhotoMaster
    Left = 212
    Top = 280
  end
  object PopupMenu: TcxGridPopupMenu
    Grid = GridWork
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
      end>
    Left = 124
    Top = 404
  end
  object dsClientList: TDataSource
    DataSet = Datas.tClientList
    Left = 160
    Top = 76
  end
  object ActionList: TActionList
    Images = UtilForm.ImageListBig
    Left = 368
    Top = 281
    object aAddGuide: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1099' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 259
      ShortCut = 16449
      OnExecute = aAddGuideExecute
    end
    object aAddManual: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1088#1091#1095#1085#1091#1102
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1074#1088#1091#1095#1085#1091#1102
      ImageIndex = 100
      ShortCut = 32833
      OnExecute = aAddManualExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 102
      ShortCut = 16453
      OnExecute = aEditExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 101
      ShortCut = 16452
      OnExecute = aDelExecute
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
    Left = 432
    Top = 277
    PixelsPerInch = 96
    object dxBarButton1: TdxBarButton
      Action = aAddGuide
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = aAddManual
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = aEdit
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = aDel
      Category = 0
    end
  end
  object pmMenu: TdxBarPopupMenu
    BarManager = BarMan
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton1'
      end
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end
      item
        Visible = True
        ItemName = 'dxBarButton3'
      end
      item
        Visible = True
        ItemName = 'dxBarButton4'
      end>
    UseOwnFont = False
    Left = 500
    Top = 281
    PixelsPerInch = 96
  end
  object qMetro: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *, DistrictInfo(ID_District) as DInfo'
      'from Metro'
      'where ID_District <> :IDD'
      'order by Name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IDD'
        ParamType = ptUnknown
      end>
    Left = 552
    Top = 109
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDD'
        ParamType = ptUnknown
      end>
  end
  object qStatus: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select distinct STV.ID, STV.Name, STV.Color, STV.NeedCall'
      'from Statustypeview STV, StatusTypeFromTo FT '
      'where '
      '  FT.ID_StatusTypeFrom = :ID1 and '
      '  STV.ID = FT.ID_StatusTypeTo '
      ''
      'union '
      ''
      'select ID, Name, Color, NeedCall'
      'from StatusTypeView'
      'where ID = :ID2'
      ''
      'order by Name')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2'
        ParamType = ptUnknown
      end>
    Left = 699
    Top = 556
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2'
        ParamType = ptUnknown
      end>
  end
  object dsStatus: TDataSource
    DataSet = qStatus
    Left = 747
    Top = 556
  end
  object EditRepository: TcxEditRepository
    Left = 691
    Top = 637
    PixelsPerInch = 96
    object ColorEdit: TcxEditRepositoryColorEdit
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.ColorSet = csTheme1
    end
  end
  object qSignal: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select STV.ID, STV.Name, STV.Color'
      'from SignalTypeView STV'
      'order by Name')
    Params = <>
    Left = 699
    Top = 500
  end
  object dsSignal: TDataSource
    DataSet = qSignal
    Left = 747
    Top = 500
  end
  object qSource: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select STV.ID, STV.Name, STV.Color'
      'from SourceTypeView STV'
      'order by Name')
    Params = <>
    Left = 691
    Top = 480
  end
  object dsSource: TDataSource
    DataSet = qSource
    Left = 747
    Top = 452
  end
  object TimerChat: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TimerChatTimer
    Left = 819
    Top = 545
  end
  object qChat: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *, UserWorkerInfo(ID_User, ID_Worker) as UseerWorkerInfo'
      'from OrderChat'
      'where ID_OrderList = :ID'
      'order by AddDateTime')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 839
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qChatID: TLargeintField
      FieldName = 'ID'
      Required = True
    end
    object qChatAddDateTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 'AddDateTime'
    end
    object qChatID_OrderList: TIntegerField
      FieldName = 'ID_OrderList'
    end
    object qChatID_Worker: TIntegerField
      FieldName = 'ID_Worker'
    end
    object qChatID_User: TIntegerField
      FieldName = 'ID_User'
    end
    object qChatMessageText: TWideStringField
      DisplayLabel = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      FieldName = 'MessageText'
      Size = 1000
    end
    object qChatUseerWorkerInfo: TWideStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090
      FieldName = 'UseerWorkerInfo'
      ReadOnly = True
      Size = 50
    end
  end
  object dsChat: TDataSource
    DataSet = qChat
    Left = 875
    Top = 472
  end
  object ClipboardMonitor: TJvClipboardMonitor
    OnChange = ClipboardMonitorChange
    Left = 524
    Top = 32
  end
  object TelImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 1048976
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001C24944415478DA9593C94EC25014867D2C5FC147F029D48543586834
          4E8931319A1817440D2E1CE28013600C8A06071029A45004C4C820880A562896
          B6C0EFBD6D346A4AAA37F977E7FFCEB96768D17B432363D05357AF29D53330DC
          DA62F468B0ACD4211189720D15A986B2A8209A7CC4C0E864C53438DE6608506A
          1A809A4BEF0A5E0519B9828064FE0D4313D372475F7FFB97C1BC60C1774DCDCC
          62737B0F8EC32314F8324AA206B80A4660B53B61B62CA3B3DB54FC01D07BB9FC
          33AC7B07C83EBDA22848782E49C8F155BC9465B527860051AC229DE7B1BE6DC7
          8EC309B73708E799EFEF8074E601D70116B64317D6B6F6C9FF793C14FF5141BD
          DE501B5925B2AC6C10881DC79781E6008EE3904824C0300CC2E130D850083E7F
          401DE5AAD586952D1B82B18C71058D46037522998C522463A45A5CDE50012E4F
          B0398066A755F8FD7EB06C08C7AE13ECEE3B90C93D616E7E094CE41E99663DA0
          5969D9B1F82D4EDDE7884463B8F05CE32E958540F680C6500035EB0214D2B064
          328DF34B2FB81BCDECF6F8E06558759168CCEFDBF801A0DDE6A271846FE24865
          F378A3EB5B9151284BE02B1AA0E9EE7F02DE25ED7084AAA21E0FCD4CCD45B2C6
          8680BF48CFFB01F03E9BDEB56E93E60000002B74455874436F70797269676874
          00436F7079726967687420A920323030382D3230313120494E434F525320476D
          6248108E214F0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000023F4944415478DA7D91CD4B546114879F77E6CE38938A952E5C283A7E
          92CE22145AB489C036194144146DCA222A6991468B685B9654502EA34D4492B4
          A93F40A245DB4090C0745C888145A1A3F371EFDCFB9ED3C2714647F4C0CB7957
          CF797EE7505983172EF7B7B4774F0C9EBB94B97AE376AE277974E2D4E9B3FDEC
          51066064F8CC50C19A3B0B2BD57D03274FD073A48B64B297F4FA06A9D422EF27
          A7C8BA2EF1DCB7EFD6CFBCFC3CFDEFDD16C001A8AFAF793D74FDAE13362E9FBE
          ACF0EBF72A0B4BD3B89E4736EBD2D4DAC6F9E371EA1B06FA9E8D3F7C03EC0458
          3FEFC46351B2990D8E7558543C90801016B58A091D043F43B5C9118FC5A3DB23
          3800E9B53F48E0613D9786C3B5200534B0A816501B41FC1CD689E1446AA8AD3B
          B47B11B7AEF4EADFA5AF9A9AF9A88B331F74F4DEA88EDC7FB0DF936B3787974A
          06462CE27B88EF62D4E2DB302F9E8F01A0AA582B5891CD6E051131638F1E3795
          0060B1818B062EAAB664363BF713551001514154512B74265A77EE40AD402187
          061E88BF795B20D9DDB59741054005EBE711DFC57162600CAACAECDC3CAAC518
          2A882888EE3630E2237E1E0DF25836E9D60A473ADAC97B05A211A73859112982
          CC368088A05E06095CC4CB620C58117ECCA750B4644111D099485444109FC0CF
          63F3694C280244B156E86E4BA05A066C4D57558C316540247200EBA6112F8B13
          ABC31423CCA5164BA75455B4F8EF68A9BC02612414A3CA518CE481AAA26A6B11
          5086940DB601969757A65EBD9DBC180E47686C6C663DDDCCF893A7EC53BAB69A
          5E06F80FF2568A2EBF9D926A0000002B74455874436F7079726967687400436F
          7079726967687420A920323030382D3230313120494E434F525320476D624810
          8E214F0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000024D4944415478DAD5D34D48D301180670E9D041E810044287C8EA900D
          0D13DDACB9DACA74B0566E7319CE741BCDB6B50F373264B9725F4E9DFFAD3931
          D3845A6EA29939F16381C349BAA6D23E4C2B2125A98BA450481D2A9EC24B8415
          5D7D8F2FFC78E1E179B7256C89A92EE4655ECD67C50C6CCE370DE3F49C8A4677
          2BA9F433C2A3D93BFE092D426192AE80E7B30B84DF671DCD5872B562D668C590
          5C0DF7453194F4DC853FC20B2525DB75E7B82AAB50BC3ED3D286F79E1E441B1C
          78A63320A637216EACC370B9029223E4B54DD858559D535B2A5AEEBB69C2DA93
          00163DDD88D439103158B0D0D884F00D331E89A4980B8E432A53467F41932145
          71591BD25D33E165288295A91856FA7C784D38B1403461A9FD1E46155ACCB8BD
          580C4FC3C1398FD20C326F033B895B570C7AEBD7D06414F1F965F846A6E0EA18
          46BDAB0F5DEDFD9876B4C02FD7201E7C8AD8032FDACFF221CFA62DB393921213
          CA4DA644B3D9F67165751D9353AF70BF2B009BEB316A891E385BFB51525E83C1
          0E2F22FE510C4954D09F624142A159C507B3776D5CB71376A9A7BB17FEB10888
          E687B034B851EFF0A0A2D2066E710506FD4184CCF5B8C32D8380CC581551E8F9
          BF85565555B3149D7F8BC5771FF0FCC51BF40E8CA34CACC3F51A029D3D035014
          6BA13CC141613A6D824FCADCBD297541997A5DA1698456D7868ECE110426A270
          DEBE0B995A8FBC5C31B2488C4F79A9F482BF9685C91665E53105FE9374FE1716
          F3128A8A2AC162CB90935180C3FBA96387F65293FFABAE697B683B5353685252
          32259C7EE0F8E7B47DC7B43FD75BE0D97E00EB2838CE75FE1A3C0000002B7445
          5874436F7079726967687400436F7079726967687420A920323030382D323031
          3120494E434F525320476D6248108E214F0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002F74944415478DAB5935F48D35114C7E76F9B65BA9A53E774F3CFA426
          B9656EB9B9A66E4367FED734A7F95FA1D44C5DA9CDF20FEA98669A9AE9CC8929
          36A1B087D49250848CF24F568A4911424FD24B4284BDD8837EFB29BDEDA1973A
          7038E7DECBF7C339F7DC4BF927764224F57262F3CF4B833413EAF0E4AD507522
          44FEC1DB4C47AF4DBB43AE6B2EAEFC7181AFE4669042136F2516F849637D8E4A
          B695EA64A46596A1A36B188626132AAB5A505462C0659D1125E5CD28253D495B
          80E884AC25B69B402B959E71DC07F8FACA569F4EBD81B1A51FDA741D582C0E14
          CA709047FB4EA7DBC1DB4784405924F22ED6A2CE6042726A21C8EABE33185C39
          45A539F76D6E7E059AC81CA8C2D340B3E5EE0929B28828082364437B312042D5
          476EADF49A2D783C368B7AA399AC5607077BCE22A5A854BF6D681D407D531F5C
          D84252EC00FD8D1634B6F5203DFF1A62538A101E938B1055047A4C1694EA1A11
          9F548098B80B2008E6164520940FB97185BB743A7BE70893BB63BA67C1F2EA3A
          A6A71730B7B0868C9C2B90C9A3E0E32BC7E8C43C52324A1118140B0E4F0C4FBE
          F8D79FAB74E6D4D51915D979653B2F5FADA0DB3482B6F6FB783EB580ACDCAB70
          72F6869F2814EE3C114E8A35A0D1DC41B77527A3E3C6BE7C60E0213BBFA0F2C7
          CC8B653C1A9D4283A11B4DCD66BC7DBF0E79701C781E7ED89B925812067B070E
          6854D66BC286F9C4C9C94BB90F282CD66FCCCCBEC3C0D0385ADB07C9510E626E
          F113AAEB3B112009C1296924C234A9242C11219A3858BD8594CC12F40F3FC3D8
          E43CBA7A465074A906094979508525213A361B72451C99A7C1CFFF34F8C78E5B
          03A2CFE6A3ADEB0174D76FA3A2F60EF4F577D1D062C6ADCE41545435233BAF02
          5EDE32707902B26FDA172B808F40BC19A48C41794D07AA0DBDA831F6C1D03688
          9B1D162C7DF80A4960143C3C45A052899F2C164B6D05706432F9341AB5974C3F
          DBD93376030243A1CD2A4673C73026673F92FD279362EA1683C150FFF563F1F9
          7C77BB8307D2091B8A995CAE1304B16B43D86C1C66304228FFC37E03575357CD
          5D8D4BD40000002B74455874436F7079726967687400436F7079726967687420
          A920323030382D3230313120494E434F525320476D6248108E214F0000000049
          454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002AC4944415478DA75535B489361187EE761CDA17816C5F3D90B05BD10
          0541C40C4B67A5E9DC163996329B126A1E900852E820D67597410475616468A9
          85589B736AE1213B58414444595D651781057B7AFEC9C44C3FF8D8BFEF7B9FE7
          7DDEE77D3FF1AE032235FB45D60F8A1CE75F95ECB2AA45EA7422BF8E8A18FEB9
          2817A9376A34EEC99E1E340606A246C4BC9384ACC666B5DA7DA7B414CDFBF6A1
          5EA4612BB341AB754FF7F561696000CEDE5ED8B45A18B691F0C3789AA0B18A0A
          8C969561A8A808A7FCFD51C773A1EC1F0F5B5BB1D4DF8FB9AE2EB8DADAE0B05A
          D1A1D1C048AC02EE54AB31595E8E07252518CECFC7506E2E6EA5A529047F14F9
          FA06CAB7DB6C70723B2C16B8CC66CCE8F5E866962E829DCC6AA7F447050518C9
          C9C1706A2ABA7D7D9504164F19C798C5CAC02746235C2613666B6BF1ACBADA03
          9C292EC66C5E1EA6E2E3311612827B0101382782932256427DB64C32287532A3
          B3B2120B55555866BD0B94FA343ADAB3E7A2A2E020C1051F1FD87682B73BDDEE
          E707576121169393F1223616AB0909584D4CC442440406096ED90BACAC132438
          43799341417845C91F5252F03923039FD2D3B142822B2A153A7769B1785BD5C6
          80718297E3E2F09EE06F9999F849D3D6B3B3B1C6EFD724B9CA989E9D2474D3D8
          C28BBBECFF4C64245648F0914EBF8989C15A52123668E2F7AC2C0FE96268282E
          31B6C34BC2B1D43789B86F7250C6838331CD2CCF49B04CA28BAC7990C15FE8C3
          572A78475F96E88B9D71FD3CB72AB61D16D9B8C69EDE661B4739C68FC3C3610F
          0B43DFA661667AA25364BFA59A97249A6747A6787F9F6A9B94413A22626AA471
          D7D9C2611E8E90A477B355DE3A55AC59779949E6A9CEC13D419FCE92943893C7
          03E56134F3E00655B4F3D7F2BFD32AD6AC3B4FE2092650C02DDEC7E45DB564E3
          6CFF36EEFD9C55947C887BA3C99B99EB2F88B141FECE143B5F0000002B744558
          74436F7079726967687400436F7079726967687420A920323030382D32303131
          20494E434F525320476D6248108E214F0000000049454E44AE426082}
      end>
  end
  object AddressTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = AddressTimerTimer
    Left = 72
    Top = 116
  end
  object qLocations: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from AddressLimit'
      'order by AddressType')
    Params = <>
    Left = 36
    Top = 73
  end
  object qDiscount: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from DiscountType'
      'where '
      '  Active = 1 and Deleted = 0 and '
      
        '  ((Date_Format(FromDate, '#39'%Y.%m.%d'#39') <= :DT) or FromDate is nul' +
        'l) and'
      
        '  ((Date_Format(ToDate, '#39'%Y.%m.%d'#39') >= :DT) or ToDate is null) a' +
        'nd'
      '  AllWorkType = :AWT and'
      '  MinOrderSum <= :SM and'
      '  Promocode = '#39#39' '
      'order by CanAdd desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AWT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SM'
        ParamType = ptUnknown
      end>
    Left = 76
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AWT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SM'
        ParamType = ptUnknown
      end>
  end
  object qDiscountWorkType: TZQuery
    Connection = Datas.ZConnection
    SQL.Strings = (
      'select *'
      'from DiscountWorkType'
      'where ID_DiscountType = :ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 172
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object HintStyleController: TcxHintStyleController
    Global = False
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.CallOutPosition = cxbpLeftBottom
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'Tahoma'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -13
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = [fsBold]
    UseHintControlLookAndFeel = True
    Left = 336
    Top = 465
  end
end
