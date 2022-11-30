object ColumnsFrame: TColumnsFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object pColumns: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Columns: TcxListView
      Left = 2
      Top = 2
      Width = 316
      Height = 236
      Align = alClient
      Checkboxes = True
      ColumnClick = False
      Columns = <
        item
          AutoSize = True
          Caption = #1042#1080#1076#1080#1084#1099#1077' '#1087#1086#1083#1103':'
        end>
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
end
