//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Мастер выполнения SQL-запросов
//
//------------------------------------------------------------------------------
unit UQuery;

interface
                                                        
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ImgList, ActnList, DB, DBClient, ExtCtrls,
  MemoComponentUnit, cxGraphics, cxControls, dxStatusBar, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxBar, dxBarExtItems, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxSplitter, cxPropertiesStore, ADODB,
  SynEditHighlighter, SynHighlighterSQL, SynEdit, SynMemo, StdCtrls,
  SynCompletionProposal, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, cxLookAndFeels,
  cxLookAndFeelPainters, System.Actions, cxNavigator, dxDateRanges,
  dxBarBuiltInMenu, cxContainer, cxLabel;

type
  TQueryForm = class(TForm)
    ActionList: TActionList;
    aCancel: TAction;
    dsQuery: TDataSource;
    aPrint: TAction;
    aExecute: TAction;
    aOpen: TAction;
    aSave: TAction;
    dSave: TSaveDialog;
    dOpen: TOpenDialog;
    StatusBar: TdxStatusBar;
    TableView: TcxGridDBTableView;
    DBGridLevel: TcxGridLevel;
    DBGrid: TcxGrid;
    BarManager: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    dxBarEditTitle: TdxBarEdit;
    dxBarButton5: TdxBarButton;
    PopupMenu: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    cxSplitter: TcxSplitter;
    Memo: TSynMemo;
    SynSQLSyn: TSynSQLSyn;
    SynAutoComplete: TSynAutoComplete;
    SynCompletion: TSynCompletionProposal;
    Query: TZQuery;
    bGridmode: TdxBarButton;
    SQL: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aExecuteExecute(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure bGridmodeClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledButtons;
  public
    { Public declarations }
  end;

procedure ShowQuery(AParentAction : TAction);

implementation

{$R *.dfm}

uses
  UDatas, UUtil, MainUnit, mesdlg, UOptions,
  UWaiting, UConsts, RecError, DBConsts, MidConst, DTKUtils;

procedure ShowQuery(AParentAction : TAction);
  var
    vForm : TQueryForm;
begin
  vForm := TQueryForm.Create(Application);
  with vForm do
  begin
    Tag := MaxMDITag(ClassType) + 1;
    if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);

    Show;
  end;
end;

procedure TQueryForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  try
    Memo.Lines.Text := DecodeBase64String(SQL.Caption);
  except
    Memo.Lines.Text := '';
  end;
  SetEnabledButtons;
end;

procedure TQueryForm.FormDestroy(Sender: TObject);
begin
  Query.Close;
end;

procedure TQueryForm.SetEnabledButtons;
  var
    e : boolean;
begin
  e := Trim(Memo.Text) <> '';
  aExecute.Enabled := e;
end;

procedure TQueryForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TQueryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SQL.Caption := EncodeBase64String(Memo.Lines.Text);

  with PropertiesStore do StoreTo(false);

  UnregisterFloatingForm(self);
    
  Action := caFree;
end;

procedure TQueryForm.aExecuteExecute(Sender: TObject);
  var
    s : string;
begin
  s := Memo.Text;
  if Query.Active then Query.Close;
  Query.SQL.Text := s;
  TableView.ClearItems;

  TableView.DataController.DataSource := nil;
  try
    Query.Open;
  finally
    TableView.BeginUpdate;
    try
      TableView.DataController.DataSource := dsQuery;
      TableView.DataController.CreateAllItems;      
      TableView.EndUpdate;
//      TableView.ApplyBestFit();
    finally
    end;
  end;
end;

procedure TQueryForm.MemoChange(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TQueryForm.aOpenExecute(Sender: TObject);
begin
  with dOpen do
  begin
    InitialDir := cABSSQLDir;
    if Execute then
      Memo.Lines.LoadFromFile(FileName);
  end;
end;

procedure TQueryForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, DBGrid);
end;

procedure TQueryForm.aSaveExecute(Sender: TObject);
begin
  with dSave do
  begin
    InitialDir := cABSSQLDir;
    if Execute then
      Memo.Lines.SaveToFile(FileName);
  end;
end;

procedure TQueryForm.bGridmodeClick(Sender: TObject);
begin
  TableView.DataController.DataModeController.GridMode :=  bGridmode.Down;
end;

end.
