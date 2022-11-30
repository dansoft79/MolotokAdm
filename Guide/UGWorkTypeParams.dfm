object GWorkTypeParamsForm: TGWorkTypeParamsForm
  Left = 546
  Top = 366
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1080#1076#1072' '#1088#1072#1073#1086#1090
  ClientHeight = 460
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = eKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 424
    Width = 425
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 27
    DesignSize = (
      425
      36)
    object bOK: TcxButton
      Left = 251
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      OptionsImage.NumGlyphs = 2
      TabOrder = 1
    end
    object bCancel: TcxButton
      Left = 335
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      OptionsImage.NumGlyphs = 2
      TabOrder = 2
    end
    object bLoadImage: TcxButton
      Left = 11
      Top = 4
      Width = 134
      Height = 25
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091' '#1080#1079' '#1092#1072#1081#1083#1072'...'
      Cancel = True
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bLoadImageClick
    end
  end
  object eName: TcxTextEdit
    Left = 8
    Top = 152
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 4
    OnExit = eNameExit
    OnKeyDown = eKeyDown
    Height = 21
    Width = 305
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 136
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 56
    Caption = #1058#1080#1087' '#1088#1072#1073#1086#1090':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cbWorkClass: TcxComboBox
    Left = 8
    Top = 72
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.OnChange = cbServiceClassPropertiesChange
    TabOrder = 2
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel3: TcxLabel
    Left = 112
    Top = 260
    Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088'.:'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object eCode: TcxTextEdit
    Left = 320
    Top = 152
    AutoSize = False
    BeepOnEnter = False
    Properties.OnChange = eChange
    TabOrder = 5
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object cxLabel4: TcxLabel
    Left = 320
    Top = 136
    Caption = #1050#1086#1076':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel5: TcxLabel
    Left = 216
    Top = 260
    Caption = #1062#1077#1085#1072':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object ePrice: TcxCalcEdit
    Left = 216
    Top = 276
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    TabOrder = 9
    OnExit = eCalcExit
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 260
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object eAmount: TcxCalcEdit
    Left = 8
    Top = 276
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    TabOrder = 7
    OnExit = eCalcExit
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object cxLabel8: TcxLabel
    Left = 8
    Top = 300
    Caption = #1053#1086#1088#1084#1072' ('#1084#1080#1085'.):'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object eNorm: TcxCalcEdit
    Left = 8
    Top = 316
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.ImmediatePost = True
    Properties.OnChange = eChange
    TabOrder = 11
    OnExit = eCalcExit
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object eComment: TcxMemo
    Left = 8
    Top = 356
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Style.LookAndFeel.ScrollbarMode = sbmDefault
    StyleDisabled.LookAndFeel.ScrollbarMode = sbmDefault
    StyleFocused.LookAndFeel.ScrollbarMode = sbmDefault
    StyleHot.LookAndFeel.ScrollbarMode = sbmDefault
    TabOrder = 17
    OnKeyDown = eKeyDown
    Height = 65
    Width = 305
  end
  object cxLabel9: TcxLabel
    Left = 8
    Top = 340
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    Style.TextStyle = []
    Transparent = True
  end
  object cxLabel10: TcxLabel
    Left = 8
    Top = 96
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103':'
    Style.TextStyle = [fsBold]
    Transparent = True
  end
  object cxLabel11: TcxLabel
    Left = 216
    Top = 300
    Caption = #1042#1080#1076' '#1075#1072#1088#1072#1085#1090#1080#1080':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
    OnExit = eCalcExit
  end
  object cxLabel12: TcxLabel
    Left = 112
    Top = 300
    Caption = #1057#1088#1086#1082' '#1075#1072#1088#1072#1085#1090#1080#1080':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cbWarrantyType: TcxComboBox
    Left = 216
    Top = 316
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Items.Strings = (
      #1042' '#1076#1085#1103#1093
      #1042' '#1084#1077#1089#1103#1094#1072#1093)
    Properties.OnChange = eChange
    TabOrder = 13
    OnExit = cbWarrantyTypeExit
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object eWarrantyTime: TcxSpinEdit
    Left = 112
    Top = 316
    AutoSize = False
    BeepOnEnter = False
    Properties.AssignedValues.MinValue = True
    Properties.ImmediatePost = True
    Properties.MaxValue = 9999.000000000000000000
    Properties.OnChange = eChange
    TabOrder = 12
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object cbFreqWork: TcxCheckBox
    Left = 8
    Top = 8
    AutoSize = False
    Caption = #1063#1072#1089#1090#1086' '#1079#1072#1082#1072#1079#1099#1074#1072#1077#1084#1072#1103
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cbPublicWork: TcxCheckBox
    Left = 8
    Top = 32
    AutoSize = False
    Caption = #1055#1091#1073#1083#1080#1095#1085#1072#1103' '#1088#1072#1073#1086#1090#1072
    Properties.FullFocusRect = True
    Style.TextStyle = [fsBold]
    TabOrder = 1
    Transparent = True
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cbWorkerClass: TcxComboBox
    Left = 8
    Top = 112
    AutoSize = False
    BeepOnEnter = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.OnChange = cbWorkerClassPropertiesChange
    TabOrder = 3
    OnKeyDown = eKeyDown
    Height = 21
    Width = 409
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 176
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    Style.TextStyle = []
    Transparent = True
  end
  object eDescription: TcxMemo
    Left = 8
    Top = 192
    Lines.Strings = (
      '')
    Properties.ScrollBars = ssVertical
    Properties.WantReturns = False
    Style.LookAndFeel.ScrollbarMode = sbmDefault
    StyleDisabled.LookAndFeel.ScrollbarMode = sbmDefault
    StyleFocused.LookAndFeel.ScrollbarMode = sbmDefault
    StyleHot.LookAndFeel.ScrollbarMode = sbmDefault
    TabOrder = 6
    OnKeyDown = eKeyDown
    Height = 65
    Width = 409
  end
  object eUnit: TcxComboBox
    Left = 112
    Top = 276
    AutoSize = False
    BeepOnEnter = False
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.OnChange = eChange
    TabOrder = 8
    OnKeyDown = eKeyDown
    Height = 21
    Width = 97
  end
  object cxLabel13: TcxLabel
    Left = 320
    Top = 340
    Caption = #1050#1072#1088#1090#1080#1085#1082#1072':'
    Style.TextStyle = []
    Transparent = True
  end
  object Image: TcxImage
    Left = 320
    Top = 356
    Properties.GraphicClassName = 'TdxSmartImage'
    Properties.ImmediatePost = True
    Properties.PopupMenuLayout.MenuItems = [pmiCut, pmiCopy, pmiPaste, pmiDelete, pmiCustom]
    Properties.PopupMenuLayout.CustomMenuItemCaption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091' '#1080#1079' '#1092#1072#1081#1083#1072'...'
    Properties.OnCustomClick = ImagePropertiesCustomClick
    TabOrder = 18
    OnDblClick = bLoadImageClick
    OnKeyDown = eKeyDown
    Height = 65
    Width = 96
  end
  object OpenDialog: TOpenPictureDialog
    DefaultExt = 'png'
    Filter = 
      #1042#1089#1077' '#1092#1072#1081#1083#1099' (*.png,*.bmp,*.jpg)|*.png;*.bmp;*.jpg|Portable Network' +
      ' Graphics (*.png)|*.png|Bitmaps (*.bmp)|*.bmp|JPEG Image File (*' +
      '.jpg)|*.jpg'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1054#1090#1082#1088#1099#1090#1080#1077' '#1082#1072#1088#1090#1080#1085#1082#1080
    Left = 264
    Top = 300
  end
end
