//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// просмотр данных
//
//------------------------------------------------------------------------------
unit UShowDataset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, cxGraphics, cxContainer,
  cxEdit, cxTextEdit, cxMemo, cxRichEdit, cxControls, dxStatusBar, dxBar,
  ActnList, cxClasses, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TDatasetForm = class(TForm)
    Panel: TPanel;
    StatusBar: TdxStatusBar;
    ActionList: TActionList;
    aOK: TAction;
    BarManager: TdxBarManager;
    dxBarButton1: TdxBarButton;
    aPrint: TAction;
    dxBarButton2: TdxBarButton;
    DBGrid: TcxGrid;
    TableView: TcxGridDBTableView;
    DBGridLevel: TcxGridLevel;
    dsQuery: TDataSource;
    PopupMenu: TcxGridPopupMenu;
    procedure aOKExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDataset : TDataset;
  public
    { Public declarations }
    procedure UpdateInfo;
  end;

procedure ShowDataset(AParentAction : TAction; ADataset : TDataset; ACaption : string = '');

implementation

{$R *.dfm}

uses
  UOptions, UUtil, mesdlg, MainUnit, UDatas;

procedure ShowDataset(AParentAction : TAction; ADataset : TDataset; ACaption : string = '');
  var
    vForm : TDatasetForm;
begin
  vForm := TDatasetForm.Create(Application);
  with vForm do
  begin
    if ACaption <> '' then
      Caption := Caption + '. ' + ACaption;

    Tag := MaxMDITag(ClassType) + 1;
    if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);

    FDataset := ADataset;
    dsQuery.Dataset := FDataset;

    TableView.BeginUpdate;
    try
      TableView.DataController.DataSource := dsQuery;
      TableView.DataController.CreateAllItems;
    finally
      TableView.EndUpdate;
    end;

    UpdateInfo;

    Show;
  end;
end;

procedure TDatasetForm.aOKExecute(Sender: TObject);
begin
  Close;
end;

procedure TDatasetForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, DBGrid);
end;

procedure TDatasetForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TDatasetForm.FormCreate(Sender: TObject);
begin
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TDatasetForm.UpdateInfo;
begin
  if FDataset.Active then
  begin
    StatusBar.Panels[1].Text := IntToStr(FDataset.RecordCount);
  end;
end;

end.
