//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Просмотр данных в модальном режиме
//
//------------------------------------------------------------------------------
unit UShowDatasetModal;

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
  TDatasetModalForm = class(TForm)
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

procedure ShowDatasetModal(ADataset : TDataset; ACaption : string = '');

implementation

{$R *.dfm}

uses
  UOptions, UUtil, mesdlg, MainUnit, UDatas;

procedure ShowDatasetModal(ADataset : TDataset; ACaption : string = '');
begin
  with TDatasetModalForm.Create(Application) do
    try
      if ACaption <> '' then
        Caption := Caption + '. ' + ACaption;

      FDataset := ADataset;
      dsQuery.Dataset := FDataset;

      TableView.BeginUpdate;
      TableView.DataController.DataSource := dsQuery;
      TableView.DataController.CreateAllItems;
      TableView.EndUpdate;

      UpdateInfo;

      ShowModal;
    finally
      Free;
    end;
end;

procedure TDatasetModalForm.aOKExecute(Sender: TObject);
begin
  Close;
end;

procedure TDatasetModalForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, DBGrid);
end;

procedure TDatasetModalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BarManager.SaveToIniFile(cIniFileNameToolbar);
end;

procedure TDatasetModalForm.FormCreate(Sender: TObject);
begin
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TDatasetModalForm.UpdateInfo;
begin
  if FDataset.Active then
  begin
    StatusBar.Panels[1].Text := IntToStr(FDataset.RecordCount);
  end;
end;

end.
