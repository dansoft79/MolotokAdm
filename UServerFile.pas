//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Фaйлы
//
//------------------------------------------------------------------------------
unit UServerFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  System.Actions, DelphiTwain, DelphiTwain_VCL, JvComponentBase, JvDragDrop,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, Vcl.Dialogs, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, dxBar, cxPropertiesStore, Vcl.ActnList, cxClasses,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxStatusBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxNavigator, dxDateRanges, dxBarBuiltInMenu;

type
  TServerFileForm = class(TForm)
    DataSource: TDataSource;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    Level: TcxGridLevel;
    StatusBar: TdxStatusBar;
    PopupMenu: TcxGridPopupMenu;
    BarManager: TdxBarManager;
    dxBarButton5: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    ActionList: TActionList;
    aAdd: TAction;
    aDelete: TAction;
    aEdit: TAction;
    aPrint: TAction;
    aCancel: TAction;
    PropertiesStore: TcxPropertiesStore;
    dxBarPopupMenu: TdxBarPopupMenu;
    Query: TZQuery;
    Table: TZQuery;
    QueryID: TIntegerField;
    QueryFileName: TWideStringField;
    QueryServerPath: TWideStringField;
    QueryServerFileName: TWideStringField;
    TableViewFileName: TcxGridDBColumn;
    TableViewServerPath: TcxGridDBColumn;
    TableViewServerFileName: TcxGridDBColumn;
    QueryComment: TWideStringField;
    aView: TAction;
    dxBarButton4: TdxBarButton;
    TableViewComment: TcxGridDBColumn;
    aSave: TAction;
    SaveDialog: TSaveDialog;
    dxBarButton6: TdxBarButton;
    aScan: TAction;
    dxBarButton7: TdxBarButton;
    QueryAppendDate: TDateTimeField;
    QueryID_EmployeeAppend: TSmallintField;
    QueryEAppend: TWideStringField;
    TableViewAppendDate: TcxGridDBColumn;
    TableViewEAppend: TcxGridDBColumn;
    QueryID_Base: TIntegerField;
    QueryBaseTableName: TWideStringField;
    aSendMail: TAction;
    dxBarButton9: TdxBarButton;
    aSelectAll: TAction;
    aUnselectAll: TAction;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    DragDrop: TJvDragDrop;
    procedure FormCreate(Sender: TObject);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure aPrintExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure TableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TableViewFocusedRecChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aViewExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aScanExecute(Sender: TObject);
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure aSendMailExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aUnselectAllExecute(Sender: TObject);
    procedure DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
  private
    { Private declarations }
    FTwain : TDelphiTwain;
    FModified : boolean;
    FIDBase : integer;
    FCanEdit : boolean;
    FBaseTableName : string;
    procedure SetEnabledButtons;

    function AddFileDialog(var IDFile : integer) : boolean;
    function AddFileFastDialog(AFileName, AComment : string; var IDFile : integer) : boolean;

    function EditFileDialog : boolean;
    function DeleteFileDialog : boolean;

    //отправка по электронной почте
    function SendFile : boolean;

  protected

    procedure WMDropFiles(var Msg: TWMDropFiles); //message WM_DROPFILES;

  public
    { Public declarations }
  end;

//отображение окна списка файлов
function ShowServerFile(AParentAction : TAction; ABaseTableName : string; ACaption : string; AIDBase : integer; ACanEdit : boolean) : boolean;

//добавление одного файла в хранилище
function AppendServerFile(ABaseTableName : string; AIDBase : integer; AFileName : string; var AID : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UFileParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts,
  MainUnit, UProgress, JvVersionInfo, UEditString, JPEG, UEMailParams, ShellAPI;

function ShowServerFile(AParentAction : TAction; ABaseTableName : string; ACaption : string; AIDBase : integer; ACanEdit : boolean) : boolean;
  var
    vForm : TServerFileForm;
begin
  vForm := TServerFileForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    FIDBase := AIDBase;
    FBaseTableName := ABaseTableName;
    FCanEdit := ACanEdit;

    DragAcceptFiles(Handle, FCanEdit);

    Query.ParamByName('BTN').AsString := ABaseTableName;
    Query.ParamByName('IDB').AsInteger := AIDBase;
    Query.Open;
    HideWaiting;

    FModified := false;
    Result := false;

    Tag := MaxMDITag(ClassType) + 1;
    Caption := Format('%s-%d', [ACaption, Tag]);
    Name := Name + IntToStr(Tag);

    RegisterFloatingForm(vForm, AParentAction, Caption);

    Show;
  end;
end;

//добавление одного файла в хранилище
function AppendServerFile(ABaseTableName : string; AIDBase : integer; AFileName : string; var AID : integer) : boolean;
  var
    vFileName, vServerPath, vServerFileName : string;
    vSend : boolean;
    vDate : TDateTime;
    Table : TZQuery;
begin
  Result := true;

  vFileName := AFileName;
  vServerPath := '';
  vServerFileName := '';

  Table := TZQuery.Create(nil);
  Table.Connection := Datas.ZConnection;
  Table.SQL.Text := 'select * from ServerFile where ID = :ID';
  Table.ParamByname('ID').AsInteger := 0;
  Table.Open;

  with Table do
  begin
    Append;
    FieldByName('BaseTableName').AsString := ABaseTableName;
    FieldByName('ID_Base').AsInteger := AIDBase;
    FieldByName('FileName').AsString := ExtractFileName(vFileName);
    FieldByName('ServerPath').AsString := vServerPath;
    FieldByName('ServerFileName').AsString := vServerFileName;
    FieldByName('Comment').AsString := '';
    FieldByName('ID_UserAppend').AsInteger := UserID;
    Post;
    AID := FieldByName('ID').AsInteger;
    Close;

    ParamByName('ID').AsInteger := AID;
    Open;
    vDate := FieldByName('AppendDate').AsDateTime;
    Close;

    vSend := ServerFileSend(ABaseTableName, vDate, AIDBase, AID, vFileName, vServerPath, vServerFileName);

    if not vSend then
    begin
      DeleteRec('ServerFile', AID, false);
      ShowMsg('Не удалось сохранить файл в хранилище!', smtWarning, [smbOK], smbOK, smbOK);
      Result := false;
      Exit;
    end;

    ParamByName('ID').AsInteger := AID;
    Open;
    if Locate('ID', AID, []) then
    begin
      Edit;
      FieldByName('ServerPath').AsString := vServerPath;
      FieldByName('ServerFileName').AsString := vServerFileName;
      Post;
    end;
    Close;
  end;
end;

function TServerFileForm.SendFile: boolean;
  var
    vServerpath, vServerFileName, vFileName, vFilePath : string;
    vReceive : boolean;
    vFileList, vSubject, vText, vEMail, s : string;
    vFiles : TStringList;
    i, j : integer;
begin
  Result := true;

  //сначала готовим файлы
  vFiles := TStringList.Create;
  vFiles.Delimiter := ';';
  vFiles.StrictDelimiter := true;

  for i := 0 to TableView.Controller.SelectedRecordCount - 1 do
    if TableView.Controller.SelectedRecords[i].IsData then
    with Query do
    begin
      s := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewFileName.Index], '');
      vFileName := s;

      s := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewServerPath.Index], '');
      vServerpath := s;

      s := IsNull(TableView.Controller.SelectedRecords[i].Values[TableViewServerFileName.Index], '');
      vServerFileName := s;

      vReceive := ServerFileReceive(vFileName, vServerPath, vServerFileName, vFilePath);

      if not vReceive then
      begin
        ShowMsg('Не удалось получить файл "' + vFileName + '" из хранилища, отправка файлов отменена!', smtWarning, [smbOK], smbOK, smbOK);
        Result := false;
        vFiles.Free;
        Exit;
      end;

      vFiles.Add(vFilePath);
    end;

  vFileList := vFiles.DelimitedText;
  vFiles.Free;

  if Result then
  begin
    vText := '';//GetEMailSignature;

    Result := EditEMailParams(vEMail, vSubject, vText, vFileList);

    if Result then
      SendEMAILMulti(vEMail, vSubject, vText, vFileList);
  end;

  SetEnabledButtons;
end;

procedure TServerFileForm.SetEnabledButtons;
  var
    ce, e : boolean;
begin
  with TableView.Controller do e := Assigned(FocusedRecord) and FocusedRecord.IsData and not FocusedRow.IsFilterRow;
  ce := FCanEdit;

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce;
  aEdit.Enabled := e and ce;

  aView.Enabled := e;
  aSave.Enabled := e;
  aScan.Enabled := ce;
  aSendmail.Enabled := e;
end;

procedure TServerFileForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aView.Enabled then aView.Execute;
end;

procedure TServerFileForm.TableViewFocusedRecChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TServerFileForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TServerFileForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TServerFileForm.FormDestroy(Sender: TObject);
begin
  if FTwain <> nil then FTwain.Free;

  DragAcceptFiles(Handle, false)
end;

procedure TServerFileForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteFileDialog or FModified;
  SetEnabledButtons;
end;

procedure TServerFileForm.aEditExecute(Sender: TObject);
begin
  FModified := EditFileDialog or FModified;
  SetEnabledButtons;
end;

procedure TServerFileForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TServerFileForm.aSaveExecute(Sender: TObject);
  var
    fn : string;
    vFileName, vServerFileName, vServerPath : string;
begin
  vFileName := Query.FieldByName('FileName').AsString;

  vServerFileName := Query.FieldByName('ServerFileName').AsString;
  vServerPath := Query.FieldByName('ServerPath').AsString;

  fn := MyDocDir + vFileName;
  SaveDialog.FileName := fn;
  SaveDialog.DefaultExt := ExtractFileExt(vFileName);
  SaveDialog.Filter := 'Файлы *' + SaveDialog.DefaultExt + '|*' + SaveDialog.DefaultExt + '|Все файлы|*.*'; 
  if SaveDialog.Execute then
  begin
    fn := SaveDialog.FileName;
    if not ServerFileSaveAs(fn, vServerPath, vServerFileName) then
      ShowMsg('Сохранить файл не удалось!', smtWarning, [smbOK], smbOK, smbOK)
    else
      if ShowMsg('Открыть файл?', smtConfirmation, [smbYes, smbNo], smbYes, smbNo) = mrYes then
      begin
        ShellExecute(0, 'open', PChar(fn), '', '', SW_SHOW);        
      end;     
  end;
end;

procedure TServerFileForm.aScanExecute(Sender: TObject);
var
  SelectedSource: Integer;

begin
  if FTwain = nil then
  begin
    FTwain := TDelphiTwain.Create;
    FTwain.OnTwainAcquire := TwainTwainAcquire;
  end;

  //Load Twain Library dynamically
  if FTwain.LoadLibrary then
  begin

    //Load source manager
    FTwain.SourceManagerLoaded := TRUE;

    //Allow user to select source -> only the first time
    if not Assigned(FTwain.SelectedSource) then
      FTwain.SelectSource;

    if Assigned(FTwain.SelectedSource) then
    begin
      //Load source, select transference method and enable (display interface)}
      FTwain.SelectedSource.Loaded := TRUE;
      FTwain.SelectedSource.ShowUI := TRUE;//display interface
      FTwain.SelectedSource.Enabled := True;
      FTwain.TransferMode := ttmMemory;
    end;
  end
  else
    showmessage('TWAIN не установлен.');
end;

procedure TServerFileForm.aSelectAllExecute(Sender: TObject);
begin
  TableView.DataController.SelectAll;
end;

procedure TServerFileForm.aSendMailExecute(Sender: TObject);
begin
  SendFile;
  SetEnabledButtons;
end;

procedure TServerFileForm.aUnselectAllExecute(Sender: TObject);
begin
  TableView.DataController.ClearSelection;
end;

procedure TServerFileForm.aViewExecute(Sender: TObject);
  var
    vServerpath, vServerFileName, vFileName, vFilePath : string;
    vReceive : boolean;
    vEXT : string;
begin
  with Query do
  begin
    vFileName := FieldByName('FileName').AsString;
    vServerpath := FieldByName('ServerPath').AsString;
    vServerFileName := FieldByName('ServerFileName').AsString;
  end;

  vReceive := ServerFileReceive(vFileName, vServerPath, vServerFileName, vFilePath);

  if not vReceive then
  begin
    ShowMsg('Не удалось получить файл из хранилища!', smtWarning, [smbOK], smbOK, smbOK);
    Exit;
  end;

  vEXT := AnsiLowerCase(ExtractFileExt(vFilePath));
  if vEXT = '.fp3' then
  begin
    OpenReadyReport3(MainForm.arOpenReport, vFilePath);
  end
  else
    ShellExecute(0, 'open', PChar(vFilePath), '', '', SW_SHOW);

  SetEnabledButtons;
end;

procedure TServerFileForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TServerFileForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TServerFileForm.TwainTwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
  var
    t, fn : string;
    vID : integer;
    jpg : TJPEGImage;
begin
  t := 'Документ';
  if EditString(t, 'Ввод названия документа', 'Название:', 0) then
  begin
    fn := cABSFileDir + t + '.jpg';
    jpg := TJPEGImage.Create;
    jpg.Assign(Image);
    jpg.CompressionQuality := 80;
    jpg.SaveToFile(fn);
//    Image. SaveToFile(fn);
    jpg.Free;
    if AddFileFastDialog(fn, t, vID) then
    begin
      Query.Close;
      Query.Open;
      Query.Locate('ID', vID, []);

      DeleteFile(fn);
    end;
  end;
  Cancel := true;
end;

procedure TServerFileForm.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array[0..MAX_PATH] of Char;
  IDFile : integer;
  i, c : integer;
begin
{  ShowWaiting('Сохранение файлов в хранилище...');
  try
    i := 0;
    c := DragQueryFile(Msg.Drop, Cardinal( - 1), CFileName, MAX_PATH);
    for i := 0 to c - 1 do
    begin
      ChangeWaiting(CFilename);
      DragQueryFile(Msg.Drop, i, CFilename, MAX_PATH);

      AddFileFastDialog(CFileName, '', IDFile);
      Msg.Result := 0;

      Query.Close;
      Query.Open;
      Query.Locate('ID', IDFile, []);
    end;
    Sleep(500);
  finally
    HideWaiting;
    DragFinish(Msg.Drop);
  end;}
end;

procedure TServerFileForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TServerFileForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TServerFileForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddFileDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TServerFileForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

function TServerFileForm.AddFileDialog(var IDFile: integer): boolean;
  var
    vFileName, vServerPath, vServerFileName, vComment : string;
    vSend : boolean;
    vDate : TDateTime;
begin
  vFileName := '';
  vServerPath := '';
  vServerFileName := '';
  vComment := '';

  Result :=
    GetFileParams(
      vFileName,
      vComment,
      false);

  if Result then
  begin
    with Table do
      begin
        Close;
        ParamByName('ID').AsInteger := 0;
        Open;
        Append;
        FieldByName('BaseTableName').AsString := FBaseTableName;
        FieldByName('ID_Base').AsInteger := FIDBase;
        FieldByName('FileName').AsString := ExtractFileName(vFileName);
        FieldByName('ServerPath').AsString := vServerPath;
        FieldByName('ServerFileName').AsString := vServerFileName;
        FieldByName('Comment').AsString := vComment;
        FieldByName('ID_UserAppend').AsInteger := UserID;
        Post;
        IDFile := FieldByName('ID').AsInteger;
        Close;

        ParamByName('ID').AsInteger := IDFile;
        Open;
        vDate := FieldByName('AppendDate').AsDateTime;
        Close;

        vSend := ServerFileSend(FBaseTableName, vDate, FIDBase, IDFile, vFileName, vServerPath, vServerFileName);

        if not vSend then
        begin
          DeleteRec('ServerFile', IDFile, false);
          ShowMsg('Не удалось сохранить файл в хранилище!', smtWarning, [smbOK], smbOK, smbOK);
          Result := false;
          Exit;
        end;

        ParamByName('ID').AsInteger := IDFile;
        Open;
        if Locate('ID', IDFile, []) then
        begin
          Edit;
          FieldByName('ServerPath').AsString := vServerPath;
          FieldByName('ServerFileName').AsString := vServerFileName;
          Post;
        end;
        Close;

        Query.Close;
        Query.Open;
        Query.Locate('ID', IDFile, []);
      end;
  end;
  SetEnabledButtons;
end;

function TServerFileForm.AddFileFastDialog(AFileName, AComment : string; var IDFile: integer): boolean;
  var
    vFileName, vServerPath, vServerFileName, vComment : string;
    vSend : boolean;
    vDate : TDateTime;
begin
  Result := true;

  vFileName := AFileName;
  vServerPath := '';
  vServerFileName := '';
  vComment := AComment;

  if Result then
  begin
    with Table do
      begin
        Close;
        ParamByName('ID').AsInteger := 0;
        Open;
        Append;
        FieldByName('BaseTableName').AsString := FBaseTableName;
        FieldByName('ID_Base').AsInteger := FIDBase;
        FieldByName('FileName').AsString := ExtractFileName(vFileName);
        FieldByName('ServerPath').AsString := vServerPath;
        FieldByName('ServerFileName').AsString := vServerFileName;
        FieldByName('Comment').AsString := vComment;
        FieldByName('ID_UserAppend').AsInteger := UserID;
        Post;
        IDFile := FieldByName('ID').AsInteger;
        Close;

        ParamByName('ID').AsInteger := IDFile;
        Open;
        vDate := FieldByName('AppendDate').AsDateTime;
        Close;

        vSend := ServerFileSend(FBaseTableName, vDate, FIDBase, IDFile, vFileName, vServerPath, vServerFileName);

        if not vSend then
        begin
          DeleteRec('ServerFile', IDFile, false);
          ShowMsg('Не удалось сохранить файл в хранилище!', smtWarning, [smbOK], smbOK, smbOK);
          Result := false;
          Exit;
        end;

        ParamByName('ID').AsInteger := IDFile;
        Open;
        if Locate('ID', IDFile, []) then
        begin
          Edit;
          FieldByName('ServerPath').AsString := vServerPath;
          FieldByName('ServerFileName').AsString := vServerFileName;
          Post;
        end;
        Close;

        Query.Close;
        Query.Open;
        Query.Locate('ID', IDFile, []);
      end;
  end;
  SetEnabledButtons;
end;

function TServerFileForm.DeleteFileDialog: boolean;
  var
    i, c, n, vID : integer;
    vFileName, vServerpath, vServerFileName : string;
    vDel : boolean;
    vDelError : integer;
begin
  Result := ShowMsg('Действительно удалить выделенные файлы (' + IntToStr(TableView.Controller.SelectedRecordCount) + ' шт.)? ', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if not Result then Exit;

  vDelError := 0;

  ShowProgress('Удаление файлов...');

  n := TableView.Controller.FocusedRowIndex;
  c := TableView.Controller.SelectedRecordCount;
  for i := 0 to c - 1 do
    if TableView.Controller.SelectedRecords[i].IsData then
    begin
      try
        TableView.Controller.FocusedRecord := TableView.Controller.SelectedRecords[i];

        with Query do
        begin
          vFileName := FieldByname('ServerPath').AsString;
          vServerpath := FieldByname('ServerPath').AsString;
          vServerFileName := FieldByname('ServerFileName').AsString;
          vID := FieldByName('ID').AsInteger;
        end;

        ChangeProgress(i / TableView.Controller.SelectedRecordCount * 100, vFileName);

        if (vServerFileName <> '') and ServerFileExists(vServerPath, vServerFileName) then
          vDel := ServerFileDelete(vServerpath, vServerFileName)
        else
          vDel := true;

        if not vDel then
        begin
          Inc(vDelError);
        end
        else DeleteRec('ServerFile', vID);
      except
        on E: Exception do ShowMsg('Во время удаления файла возникла ошибка:' + #13#10 + E.Message, smtError, [smbOK], smbOK, smbOK);
      end;
    end;
  ChangeProgress(100);
  Sleep(500);
  HideProgress;

  if vDelError > 0 then
  begin
    Result := false;
    ShowMsg('Несколько файлов удалить из хранилища не удалось!', smtWarning, [smbOK], smbOK, smbOK);
  end;

  Query.Close;
  Query.Open;

  if (TableView.DataController.RecordCount > 0) then
  begin
    TableView.Controller.FocusedRowIndex := n;
    TableView.DataController.SelectRows(TableView.Controller.FocusedRowIndex, TableView.Controller.FocusedRowIndex);
  end;

  SetEnabledButtons;
end;

procedure TServerFileForm.DragDropDrop(Sender: TObject; Pos: TPoint;
  Value: TStrings);
var
  vFileName: string;
  IDFile : integer;
  i, c : integer;
begin
  ShowWaiting('Сохранение файлов в хранилище...');
  try
    i := 0;
    c := Value.Count;
    for i := 0 to c - 1 do
    begin
      vFileName := Value[i];

      ChangeWaiting(vFilename);

//      DragQueryFile(Msg.Drop, i, CFilename, MAX_PATH);

      AddFileFastDialog(vFileName, '', IDFile);

      Query.Close;
      Query.Open;
      Query.Locate('ID', IDFile, []);
    end;
    Sleep(500);
  finally
    HideWaiting;
  end;
end;

function TServerFileForm.EditFileDialog: boolean;
  var
    vFileName : string;
    vComment : string;
    vID : integer;
begin
  with Query do
  begin
    vFileName := FieldByName('FileName').AsString;
    vComment := FieldByName('Comment').AsString;
    vID := Query.FieldByName('ID').AsInteger;
  end;

  Result := GetFileParams(
    vFileName,
    vComment,
    true);

  if Result then
  begin
    with Table do
    begin
      Parambyname('ID').AsINteger := vID;
      Open;
      if Locate('ID', vID, []) then
      begin
        Edit;
        FieldByName('Comment').AsString := vComment;
        Post;
      end;
      Close;

      Query.Close;
      Query.Open;
      Query.Locate('ID', vID, []);
    end;
  end;
  SetEnabledButtons;
end;

procedure TServerFileForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
