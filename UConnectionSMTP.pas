//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Редактор подключений SMTP
//
//------------------------------------------------------------------------------
unit UConnectionSMTP;

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
  TConnectionSMTPForm = class(TForm)
    pBottom: TPanel;
    bClose: TcxButton;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    LevelTable: TcxGridLevel;
    Query: TZQuery;
    DataSource: TDataSource;
    QueryID: TSmallintField;
    QueryName: TWideStringField;
    QueryEMailHost: TWideStringField;
    QueryEMailLogin: TWideStringField;
    QueryEMailPassword: TWideStringField;
    QueryEMailPort: TSmallintField;
    QueryEMailAuthType: TSmallintField;
    QueryEMailTLSType: TSmallintField;
    QueryEMailName: TWideStringField;
    QueryEMailCharset: TWideStringField;
    QueryFromEMail: TWideStringField;
    QueryComment: TWideStringField;
    TableViewName: TcxGridDBColumn;
    TableViewEMailHost: TcxGridDBColumn;
    TableViewEMailLogin: TcxGridDBColumn;
    TableViewEMailPassword: TcxGridDBColumn;
    TableViewEMailPort: TcxGridDBColumn;
    TableViewEMailAuthType: TcxGridDBColumn;
    TableViewEMailTLSType: TcxGridDBColumn;
    TableViewEMailName: TcxGridDBColumn;
    TableViewEMailCharset: TcxGridDBColumn;
    TableViewFromEMail: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    CardView: TcxGridDBCardView;
    CardViewName: TcxGridDBCardViewRow;
    CardViewEMailHost: TcxGridDBCardViewRow;
    CardViewEMailLogin: TcxGridDBCardViewRow;
    CardViewEMailPassword: TcxGridDBCardViewRow;
    CardViewEMailPort: TcxGridDBCardViewRow;
    CardViewEMailAuthType: TcxGridDBCardViewRow;
    CardViewEMailTLSType: TcxGridDBCardViewRow;
    CardViewEMailName: TcxGridDBCardViewRow;
    CardViewEMailCharset: TcxGridDBCardViewRow;
    CardViewFromEMail: TcxGridDBCardViewRow;
    CardViewComment: TcxGridDBCardViewRow;
    LevelCard: TcxGridLevel;
    EditRepository: TcxEditRepository;
    AuthEdit: TcxEditRepositoryImageComboBoxItem;
    TLSEdit: TcxEditRepositoryImageComboBoxItem;
    bOK: TcxButton;
    MemData: TdxMemData;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetOKEnabled;
    procedure SaveData;
  end;

function ConnectionSMTPEditor : boolean;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, DTKUtils;

function ConnectionSMTPEditor : boolean;
begin
  with TConnectionSMTPForm.Create(nil) do
    try
      Query.Close;
      Query.Open;

      MemData.CreateFieldsFromDataSet(Query);
      MemData.LoadFromDataSet(Query);

      if ShowModal = mrOK then
      begin
        SaveData;
      end;

      Query.Close;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TConnectionSMTPForm.SaveData;
  var
    i : integer;
begin
  Query.Close;
  ExecSQL('delete from ConnectionSMTP');
  Query.Open;

  MemData.First;
  while not MemData.eof do
  begin
    Query.Append;
    CopyRecord(MemData, Query, 'RecID', true);
    Query.Post;
    MemData.Next;
  end;
end;

procedure TConnectionSMTPForm.SetOKEnabled;
begin
  bClose.Enabled := true;
end;

procedure TConnectionSMTPForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
