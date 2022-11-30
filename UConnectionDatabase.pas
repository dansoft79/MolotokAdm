//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Редактор подключений к базам данных
//
//------------------------------------------------------------------------------
unit UConnectionDatabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Mask,  Menus,
  cxLookAndFeelPainters, cxGraphics, cxMemo, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel, cxButtons,
  dxSkinsCore, dxSkinsDefaultPainters, cxLookAndFeels, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxEditRepositoryItems,
  dxmdaset, cxNavigator, dxDateRanges;

type
  TConnectionDatabaseForm = class(TForm)
    pBottom: TPanel;
    bClose: TcxButton;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    LevelTable: TcxGridLevel;
    DataSource: TDataSource;
    CardView: TcxGridDBCardView;
    LevelCard: TcxGridLevel;
    EditRepository: TcxEditRepository;
    AuthEdit: TcxEditRepositoryImageComboBoxItem;
    TLSEdit: TcxEditRepositoryImageComboBoxItem;
    MemData: TdxMemData;
    MemDataServer: TStringField;
    MemDataDatabase: TStringField;
    MemDataPort: TIntegerField;
    MemDataProtocol: TStringField;
    MemDataUser: TStringField;
    MemDataPassword: TStringField;
    MemDataComment: TStringField;
    MemDataParams: TStringField;
    TableViewServer: TcxGridDBColumn;
    TableViewDatabase: TcxGridDBColumn;
    TableViewPort: TcxGridDBColumn;
    TableViewProtocol: TcxGridDBColumn;
    TableViewUser: TcxGridDBColumn;
    TableViewPassword: TcxGridDBColumn;
    TableViewParams: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    CardViewServer: TcxGridDBCardViewRow;
    CardViewDatabase: TcxGridDBCardViewRow;
    CardViewPort: TcxGridDBCardViewRow;
    CardViewProtocol: TcxGridDBCardViewRow;
    CardViewUser: TcxGridDBCardViewRow;
    CardViewPassword: TcxGridDBCardViewRow;
    CardViewParams: TcxGridDBCardViewRow;
    CardViewComment: TcxGridDBCardViewRow;
    cxButton1: TcxButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
    procedure ReadInfo;
    procedure WriteInfo;
  end;

function ConnectionDatabaseEditor : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, DTKUtils, UOptions;

function ConnectionDatabaseEditor : boolean;
begin
  with TConnectionDatabaseForm.Create(nil) do
    try
      MemData.Close;
      MemData.Open;

      ReadInfo;

      if ShowModal = mrOK then
        WriteInfo;

      MemData.Close;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TConnectionDatabaseForm.ReadInfo;
begin
  if FileExists(cIniFileNameDatas) then
  begin
    MemData.LoadFromBinaryFile(cIniFileNameDatas);
  end
  else
  begin
    MemData.Append;
    MemData.FieldByname('Server').asString := Server;
    MemData.FieldByname('Database').asString := Database;
    MemData.FieldByname('Protocol').asString := Protocol;
    MemData.FieldByname('Port').asString := Port;
    MemData.FieldByname('User').asString := User;
    MemData.FieldByname('Password').asString := Password;
    MemData.FieldByname('Params').asString := Params;
    MemData.Post;
  end;
end;

procedure TConnectionDatabaseForm.SetOKEnabled;
begin
  bClose.Enabled := true;
end;

procedure TConnectionDatabaseForm.WriteInfo;
begin
  MemData.SaveToBinaryFile(cIniFileNameDatas);
end;

procedure TConnectionDatabaseForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
