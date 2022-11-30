//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Справочник видов отчетов
//
//------------------------------------------------------------------------------
unit UGReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  DB,  ADODB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxMemo, dxStatusBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid,
  ActnList, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, cxPropertiesStore,
  cxShellBrowserDialog, TreeScan, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter, cxLookAndFeels,
  cxLookAndFeelPainters, System.Actions, frxClass, cxNavigator, dxDateRanges,
  dxBarBuiltInMenu, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  cxContainer, cxTextEdit, cxRichEdit, cxDBRichEdit, cxImage, cxDBEdit,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, PropFilerEh, PropStorageEh;

type
  TGReportFormForm = class(TForm)
    DataSource: TDataSource;
    StatusBar: TdxStatusBar;
    BarManager: TdxBarManager;
    dxBarButton4: TdxBarButton;
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
    aOK: TAction;
    aCancel: TAction;
    aEditForm: TAction;
    aCreateReport: TAction;
    aImportForm: TAction;
    aExportForm: TAction;
    TreeScanner: TTreeScanner;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    Query: TZQuery;
    QueryAssertTime: TDateTimeField;
    QueryType: TWideStringField;
    QueryName: TWideStringField;
    QuerySize: TIntegerField;
    QueryVersion: TWideStringField;
    Table: TZQuery;
    QueryID: TSmallintField;
    aOpenForm: TAction;
    dxBarButton11: TdxBarButton;
    OpenDialog: TOpenDialog;
    BrowseFolder: TcxShellBrowserDialog;
    SaveDialog: TSaveDialog;
    aSaveForm: TAction;
    dxBarButton12: TdxBarButton;
    QueryComment: TWideStringField;
    QueryData: TBlobField;
    Button1: TButton;
    QueryActive: TSmallintField;
    QueryDeleted: TSmallintField;
    dxBarPopupMenu: TdxBarPopupMenu;
    PopupMenu: TcxGridPopupMenu;
    PropertiesStore: TcxPropertiesStore;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    Level: TcxGridLevel;
    TableViewType: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewSize: TcxGridDBColumn;
    TableViewVersion: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    QueryID_AssertUser: TSmallintField;
    QueryAssertUser: TWideStringField;
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
    procedure aEditFormExecute(Sender: TObject);
    procedure aCreateReportExecute(Sender: TObject);
    procedure aImportFormExecute(Sender: TObject);
    procedure aExportFormExecute(Sender: TObject);
    procedure TreeScannerFileFound(Sender: TObject);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aOpenFormExecute(Sender: TObject);
    procedure aSaveFormExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
    FModified : boolean;
    procedure SetEnabledButtons;
    function AddReportFormDialog(var IDReportForm : integer) : boolean;
    function EditReportFormDialog : boolean;
    function DeleteReportFormDialog : boolean;

    function CreateFormDialog : boolean;
    function EditFormDialog : boolean;

    function SaveReports(AFolderName : string) : boolean;
  public
    { Public declarations }
  end;

//отображение окна справочника
function ShowReportForm(AParentAction : TAction) : boolean;

//вызов окна добавления записи в справочник
function AddReportForm(var AIDReportForm : integer) : boolean;

//вызов окна изменения записи справочника
function EditReportForm(AIDReportForm : integer) : boolean;

//удаление указанной записи справочника
function DeleteReportForm(AIDReportForm : integer) : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, UGReportFormParams, mesdlg, UUtil, DTKUtils, UWaiting, UConsts, 
  MainUnit, DateUtils;

function DoAction(var AIDReportForm : integer; AAction : string; AParentAction : TAction) : boolean;
  var
    vForm : TGReportFormForm;
begin
  if (AAction = cOpenAction) and OneWindow and ExistsForm(TGReportFormForm) then
  begin
    with FindForm(TGReportFormForm) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      BringToFront;
    end;
    Exit;
  end;

  vForm := TGReportFormForm.Create(Application);
  with vForm do
  begin
    ShowWaiting(cDataGetting);
    Query.Open;
    Table.Open;
    HideWaiting;

    FModified := false;
    Result := false;
    if AAction = cOpenAction then
    begin
      Tag := MaxMDITag(ClassType) + 1;
      if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
      Name := Name + IntToStr(Tag);

      RegisterFloatingForm(vForm, AParentAction, Caption);

      Show;
    end
    else
      if AAction = cAddAction then Result := AddReportFormDialog(AIDReportForm)
      else
        if AAction = cEditAction then
        begin
          Query.Locate('ID', AIDReportForm, []);
          Result := EditReportFormDialog;
          Close;
        end
        else
          if AAction = cDeleteAction then
          begin
            Query.Locate('ID', AIDReportForm, []);
            Result := DeleteReportFormDialog;
            Close;
          end;
  end;
end;

function ShowReportForm(AParentAction : TAction) : boolean;
  var
    n : integer;
begin
  n := -1;
  Result := DoAction(n, cOpenAction, AParentAction);
end;

function AddReportForm(var AIDReportForm : integer) : boolean;
begin
  Result := DoAction(AIDReportForm, cAddAction, nil);
end;

function EditReportForm(AIDReportForm : integer) : boolean;
begin
  Result := DoAction(AIDReportForm, cEditAction, nil);
end;

function DeleteReportForm(AIDReportForm : integer) : boolean;
begin
  Result := DoAction(AIDReportForm, cDeleteAction, nil);
end;

function TGReportFormForm.SaveReports(AFolderName: string): boolean;
  var
    vFileStream : TFileStream;
    s : string;
begin
  AFolderName := CorrectPath(AFolderName);

  Query.DisableControls;
  Query.First;

  Result := true;

  ShowWaiting('');
  try
    while Result and not Query.Eof do
    begin
      s :=
        Query.FieldByname('Type').AsString + '. ' +
        Query.FieldByname('Name').AsString + '.fr3';
      ChangeWaiting(AFolderName + s);
      try
        vFileStream := TFileStream.Create(AFolderName + s, fmCreate);
        TBlobField(Query.FieldByName('Data')).SaveToStream(vFileStream);
        vFileStream.Free;
      except
        on E:Exception do
        begin
          Result := false;
          ShowMsg(E.Message, smtError, [smbOK], smbOK, smbOK);
        end;
      end;
      Query.Next;
    end;
  finally
    Query.EnableControls;
    HideWaiting;
  end;
end;

procedure TGReportFormForm.SetEnabledButtons;
  var
    ce, e : boolean;
begin
  with TableView.Controller do
    e :=
      Query.Active and
      not Query.IsEmpty and
      Assigned(FocusedRow) and
      FocusedRow.IsData;

  ce := CanEditInActionByAction(MainForm.agUserROle);

  aAdd.Enabled := ce;
  aDelete.Enabled := e and ce;
  aEdit.Enabled := e and ce;
  aEditForm.Enabled := e and ce;

  aOpenForm.Enabled := ce;

  aCreateReport.Enabled := e and CanShowAction(MainForm.arCreateReport);

  aImportForm.Enabled := ce;
  aExportForm.Enabled := e;

  aSaveForm.Enabled := e;
end;

procedure TGReportFormForm.TableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

procedure TGReportFormForm.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  SetEnabledButtons;
end;

procedure TGReportFormForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareFormName(self); PropertiesStore.StoreTo(false);
  TableView.StoreToIniFile(cIniFileName, false);
  BarManager.SaveToIniFile(cIniFileNameToolbar);

  UnRegisterFloatingForm(self);

  Action := caFree;
end;

procedure TGReportFormForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
  TableView.RestoreFromIniFile(cIniFileName);
  try BarManager.LoadFromIniFile(cIniFileNameToolbar) except ResetBarManager(BarManager) end;
end;

procedure TGReportFormForm.aDeleteExecute(Sender: TObject);
begin
  FModified := DeleteReportFormDialog or FModified;
  SetEnabledButtons;
end;

procedure TGReportFormForm.aEditExecute(Sender: TObject);
begin
  FModified := EditReportFormDialog or FModified;
  SetEnabledButtons;
end;

procedure TGReportFormForm.aEditFormExecute(Sender: TObject);
begin
  FModified := EditFormDialog or FModified;
  SetEnabledButtons;
end;

procedure TGReportFormForm.aExportFormExecute(Sender: TObject);
  var
    vID: integer;
    s1, s2 : string;
begin
  vID := Query.FieldByName('ID').AsInteger;
  BrowseFolder.Options.ShowNonFolders := false;
  BrowseFolder.Path := cABSDotDir;
  if BrowseFolder.Execute then
  begin
    if SaveReports(BrowseFolder.Path) then ShowMsg('Сохранение успешно завершено!', smtInformation, [smbOK], smbOK, smbOK)
    else ShowMsg('Отчеты сохранить не удалось!', smtError, [smbOK], smbOK, smbOK);
    cABSDotDir := BrowseFolder.Path;

    s1 := BrowseFolder.Path;
    s1 := CorrectPath(s1);
    s2 := cABSDotDir;
    s2 := CorrectPath(s2);
    if s1 <> s2 then
      if ShowMsg('Запомнить путь для сохранения шаблонов отчетов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
      begin
        cDotDir := s1;
        cABSDotDir := s1;
      end;
  end;

  Query.Close;
  Query.Open;

  Query.Locate('ID', vID, []);
  SetEnabledButtons;
end;

procedure TGReportFormForm.aImportFormExecute(Sender: TObject);
  var
    vID: integer;
    s1, s2 : string;
begin
  vID := Query.FieldByName('ID').AsInteger;
  BrowseFolder.Options.ShowNonFolders := false;
  BrowseFolder.Path := cABSDotDir;
  if BrowseFolder.Execute then
  begin
    TreeScanner.InitialDirectory := BrowseFolder.Path;
    try
      ShowWaiting('Импорт форм...');
      try
        TreeScanner.ScanTree;
      finally
        HideWaiting;
      end;
      ShowMsg('Сканирование успешно завершено!', smtInformation, [smbOK], smbOK, smbOK)
    except
      on E:Exception do
        ShowMsg('Сканирование завершилось ошибкой:'#10#13 +
                E.Message, smtError, [smbOK], smbOK, smbOK)
    end;

    s1 := BrowseFolder.Path;
    s1 := CorrectPath(s1);
    s2 := cABSDotDir;
    s2 := CorrectPath(s2);
    if s1 <> s2 then
      if ShowMsg('Запомнить путь для сохранения шаблонов отчетов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
      begin
        cDotDir := s1;
        cABSDotDir := s1;
      end;
  end;

  Query.Close;
  Query.Open;

  Query.Locate('ID', vID, []);
  SetEnabledButtons;
end;

procedure TGReportFormForm.aOpenFormExecute(Sender: TObject);
  var
    fn, s, t, n, s1, s2 : string;
    i : integer;
    vID : integer;
    vFileStream : TFileStream;
begin
  OpenDialog.InitialDir := cABSDotDir;
  if OpenDialog.Execute then
  begin
    if FileExists(OpenDialog.FileName) then
    begin
      fn := OpenDialog.FileName;
      s := ExtractFileName(OpenDialog.FileName);
      i := Pos('.', Copy(s, 1, Length(s) - 4));
      if i = 0 then
      begin
        t := cNoType;
        n := Copy(s, 1, Length(s) - 4);
      end
      else
      begin
        t := trim(Copy(s, 1, i - 1));
        n := trim(Copy(s, i + 1, Length(s) - i - 4));
      end;
      if not Table.Locate('Type;Name', VarArrayOf([t, n]), []) then
      begin
        Table.Append;
        Table.FieldByName('ID_AssertUser').AsInteger := UserID;
        Table.FieldByName('Type').AsString := t;
        Table.FieldByName('Name').AsString := n;
        vFileStream := TFileStream.Create(fn, fmOpenReadWrite);
        TBlobField(Table.FieldByName('Data')).LoadFromStream(vFileStream);
        Table.FieldByName('Size').AsFloat := vFileStream.Size;
        Table.FieldByname('Version').AsString := GetFastReport3FormVersion(vFileStream);
        vFileStream.Free;

        Table.Post;
        vID := Table.FieldByName('ID').AsInteger;

        Query.Close;
        Query.Open;

        Query.Locate('ID', vID, []);
      end
      else
        if ShowMsg('Отчетная форма "' + ExtractFileName(s) + '" уже есть в справочнике!'#10#13 +
                   'Обновить форму?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes
        then
        begin
          Table.Edit;
          Table.FieldByName('ID_AssertUser').AsInteger := UserID;
          Table.FieldByName('Type').AsString := t;
          Table.FieldByName('Name').AsString := n;
          vFileStream := TFileStream.Create(fn, fmOpenReadWrite);
          TBlobField(Table.FieldByName('Data')).LoadFromStream(vFileStream);
          Table.FieldByName('Size').AsFloat := vFileStream.Size;
          Table.FieldByname('Version').AsString := GetFastReport3FormVersion(vFileStream);
          vFileStream.Free;
          Table.Post;
          vID := Table.FieldByName('ID').AsInteger;
          Query.Close;
          Query.Open;

          Query.Locate('ID', vID, []);
        end;

        s1 := ExtractFilePath(OpenDialog.FileName);
        s1 := CorrectPath(s1);
        s2 := cABSDotDir;
        s2 := CorrectPath(s2);
        if s1 <> s2 then
          if ShowMsg('Запомнить путь для сохранения шаблонов отчетов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
          begin
            cDotDir := s1;
            cABSDotDir := s1;
          end;
    end
    else
    begin
      ShowMsg('Файл не найден!', smtError, [smbOK], smbOK, smbOK);
    end;
  end;

  SetEnabledButtons;
end;

procedure TGReportFormForm.aPrintExecute(Sender: TObject);
begin
  PrintGuideGridDX(Caption, Grid);
end;

procedure TGReportFormForm.aSaveFormExecute(Sender: TObject);
  var
    s1, s2, fn : string;
begin
  SaveDialog.InitialDir := cABSDotDir;

  SaveDialog.FileName :=
    Query.FieldByname('Type').AsString + '. ' +
    Query.FieldByname('Name').AsString;

  if SaveDialog.Execute then
  begin
    fn := SaveDialog.FileName;

    if FileExists(fn) then
      if DeleteFile(fn) then TBlobField(Query.FieldByName('Data')).SaveToFile(fn)
      else ShowMsg('Не удалось удалить файл "' + fn + '"', smtError, [smbOK], smbOK, smbOK)
    else TBlobField(Query.FieldByName('Data')).SaveToFile(fn);

    s1 := ExtractFilePath(SaveDialog.FileName);
    s1 := CorrectPath(s1);
    s2 := cABSDotDir;
    s2 := CorrectPath(s2);
    if s1 <> s2 then
      if ShowMsg('Запомнить путь для сохранения шаблонов отчетов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
      begin
        cDotDir := s1;
        cABSDotDir := s1;
      end;
  end;
    
  SetEnabledButtons;
end;

procedure TGReportFormForm.Button1Click(Sender: TObject);
  var
    vTemp : TMemoryStream;
    vForm : TMemoryStream;
    vVer1, vVer2, vAuthor1, vAuthor2,
    vYear, s, t, n : string;
    r, vID : integer;
begin
  Query.First;
  while not Query.eof do
  begin
    vID := Query.FieldByName('ID').AsInteger;

    vTemp := TMemoryStream.Create;
    vForm := TMemoryStream.Create;
    TBlobField(Query.FieldByName('Data')).SaveToStream(vTemp);
    vTemp.Position := 0;
    vForm.CopyFrom(vTemp, vTemp.Size);
    vForm.Position := 0;

    vVer1 := GetFastReportVersion(vForm);

    with TFrxReport.Create(Application) do
      try
        StoreInDFM := true;
        vForm.Position := 0;
        Clear;
        If vForm.Size > 0 Then LoadFromStream(vForm);
        if IsInteger(ReportOptions.VersionBuild) then
          ReportOptions.VersionBuild := IntToStr(StrToInt(ReportOptions.VersionBuild) + 1)
        else
          ReportOptions.VersionBuild := '1';

        vVer2 :=
          ReportOptions.VersionMajor + '.' +
          ReportOptions.VersionMinor + '.' +
          ReportOptions.VersionRelease + '.' +
          ReportOptions.VersionBuild;

        s := ReportOptions.Author;
        vAuthor1 := s;

        vYear := IntToStr(YearOf(Now));
        if s = '' then ReportOptions.Author := '(c) ' + vYear + ', ЦИРИТАС'
        else
        begin
          s := Copy(s, 4, Length(s) - 3);
          s := Trim(s);
          t := '(c) ';
          n := Copy(s, 1, 4);
          if IsInteger(n) then
          begin
            t := t + n;
            if n < vYear then t := t + '-' + vYear + ', ЦИРИТАС'
            else t := t + ', ЦИРИТАС';
          end
          else ReportOptions.Author := '(c) ' + vYear + ', ЦИРИТАС';

          ReportOptions.Author := t;
        end;
        vAuthor2 := ReportOptions.Author;

        vForm.Clear;
        vForm.Position := 0;
        SaveToStream(vForm);
        Clear;
      finally
        Free;
      end;

    r :=
    ShowMsg(
      Query.FieldByName('Type').AsString + '. ' + Query.FieldByName('Name').AsString + #13#10 +
      vVer1 + ' > ' + vVer2 + #13#10 +
      vAuthor1 + ' > ' + vAuthor2, smtConfirmation, [smbYes, smbNo, smbCancel], smbNo, smbCancel);

    if r = mrCancel then Break
    else
    if r = mrYes then
    with Table do
    begin
      Locate('ID', vID, []);
      Edit;

      FieldByName('AssertTime').AsDateTime := ServerTime;
      FieldByName('ID_AssertUser').AsInteger := UserID;

      FieldByName('Data').Value := null;
      TBlobField(FieldByName('Data')).LoadFromStream(vForm);
      FieldByName('Size').AsInteger := vForm.Size;
      FieldByName('Version').AsString := GetFastReportVersion(vForm);
      Post;
    end;

    Query.Next;
  end;
end;

function TGReportFormForm.CreateFormDialog: boolean;
  var
    vForm : TMemoryStream;
begin
  vForm := TMemoryStream.Create;
  try
    TBlobField(Query.FieldByName('Data')).SaveToStream(vForm);
    Result := CreateReport3(MainForm.arCreateReport, vForm, Query.FieldByName('Name').AsString);
  finally
    vForm.Free;
    SetEnabledButtons;
  end;
end;

procedure TGReportFormForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  45 : if aAdd.Enabled then aAdd.Execute;
  46 : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGReportFormForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  '+' : if aAdd.Enabled then aAdd.Execute;
  '-' : if aDelete.Enabled then aDelete.Execute;
  end;
end;

procedure TGReportFormForm.TreeScannerFileFound(Sender: TObject);
  var
    fn, s, t, n : string;
    i : integer;
    vFileStream : TFileStream;
begin
  fn := TreeScanner.FileFound;
  ChangeWaiting(fn);
  s := ExtractFileName(TreeScanner.FileFound);
  i := Pos('.', Copy(s, 1, Length(s) - 4));
  if i = 0 then
  begin
    t := cNoType;
    n := Copy(s, 1, Length(s) - 4);
  end
  else
  begin
    t := trim(Copy(s, 1, i - 1));
    n := trim(Copy(s, i + 1, Length(s) - i - 4));
  end;
  if not Table.Locate('Type;Name', VarArrayOf([t, n]), []) then
  begin
    Table.Append;
    Table.FieldByName('ID_AssertUser').AsInteger := UserID;
    Table.FieldByName('Type').AsString := t;
    Table.FieldByName('Name').AsString := n;
    vFileStream := TFileStream.Create(fn, fmOpenReadWrite);
    TBlobField(Table.FieldByName('Data')).LoadFromStream(vFileStream);
    Table.FieldByName('Size').AsFloat := vFileStream.Size;
    Table.FieldByname('Version').AsString := GetFastReport3FormVersion(vFileStream);
    vFileStream.Free;
    Table.Post;
  end
  else
  begin
    HideWaiting;
    if ShowMsg('Отчетная форма "' + ExtractFileName(s) + '" уже есть в справочнике!'#10#13 +
               'Обновить форму?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes
    then
    begin
      Table.Edit;
      Table.FieldByName('ID_AssertUser').AsInteger := UserID;
      Table.FieldByName('Type').AsString := t;
      Table.FieldByName('Name').AsString := n;
      vFileStream := TFileStream.Create(fn, fmOpenReadWrite);
      TBlobField(Table.FieldByName('Data')).LoadFromStream(vFileStream);
      Table.FieldByName('Size').AsFloat := vFileStream.Size;
      Table.FieldByname('Version').AsString := GetFastReport3FormVersion(vFileStream);
      vFileStream.Free;
      Table.Post;
    end;
  end;
end;

procedure TGReportFormForm.QueryAfterScroll(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

procedure TGReportFormForm.FormShow(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TGReportFormForm.aAddExecute(Sender: TObject);
  var
    vID : integer;
begin
  FModified := AddReportFormDialog(vID) or FModified;
  SetEnabledButtons;
end;

procedure TGReportFormForm.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TGReportFormForm.aCreateReportExecute(Sender: TObject);
begin
  CreateFormDialog;
end;

function TGReportFormForm.AddReportFormDialog(var IDReportForm: integer): boolean;
  var
    vName : string;
    vType : String;
    vForm : TMemoryStream;
    vComment : string;
begin
  vName := '';
  vType := '';
  vForm := TMemoryStream.Create;
  vComment := '';

  Result :=
    GetReportFormParams(
      vType,
      vName,
      vComment,
      vForm);

  if Result then
  begin
    if Query.Locate('Name;Type', VarArrayOf([vName,vType]), []) then ShowMsg('Отчет уже существует в базе данных', smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := 0;
      Open;
      Append;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Deleted').AsInteger := 0;
      FieldByName('Active').AsInteger := 1;

      FieldByName('Name').AsString := vName;
      FieldByName('Type').AsString := vType;
      FieldByName('Size').AsFloat := vForm.Size;
      FieldByname('Version').AsString := GetFastReport3FormVersion(vForm);
      FieldByname('Comment').AsString := vComment;
      tBlobField(FieldByName('Data')).LoadFromStream(vForm);
      Post;
      IDReportForm := FieldByName('ID').AsInteger;
      Close;

      Query.Refresh;

      Query.Locate('ID', IDReportForm, []);
    end;
  end;
  vForm.free;
  SetEnabledButtons;
end;

procedure TGReportFormForm.DBGridDblClick(Sender: TObject);
begin
  if aEdit.Enabled then aEdit.Execute;
end;

function TGReportFormForm.DeleteReportFormDialog: boolean;
  var
    vID, vRecNo : integer;
begin
  vID := Query.FieldByName('ID').AsInteger;

  Result := ShowMsg(cConfirmDelete, smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes;

  if Result then
    if DeleteRec('ReportForm', vID) then
    begin
      vRecNo := Query.RecNo;

      Query.Refresh;

      if Query.RecordCount > 1 then
        Query.RecNo := vRecNo;
    end;
  SetEnabledButtons;
end;

function TGReportFormForm.EditFormDialog: boolean;
  var
    vTemp : TMemoryStream;
    vForm : TMemoryStream;
    vID : integer;
begin
  vTemp := TMemoryStream.Create;
  vForm := TMemoryStream.Create;
  TBlobField(Query.FieldByName('Data')).SaveToStream(vTemp);
  vTemp.Position := 0;
  vForm.CopyFrom(vTemp, vTemp.Size);
  vForm.Position := 0;
  vID := Query.FieldByName('ID').AsInteger;

  Result :=
    UDatas.EditReport3(
      Query.FieldByName('Name').AsString,
      Query.FieldByName('Type').AsString + '. ' + Query.FieldByName('Name').AsString,
      vForm);

  vForm.Position := 0;
  vTemp.Position := 0;

  if
    Result and
    ((vTemp.Size <> vForm.Size) or not CompareMem(vTemp.Memory, vForm.Memory, vTemp.Size - 8))
    then
    if ShowMsg('Форма отчета изменена. Сохранить изменения в базу данных?', smtConfirmation, [smbYes, smbNo], smbYes, smbNo) = mrYes then
      with Table do
      begin
        Close;
        ParamByName('ID').AsInteger := vID;
        Open;
        Edit;
        FieldByName('ID_AssertUser').AsInteger := UserID;
        FieldByname('Version').AsString := GetFastReport3FormVersion(vForm);
        FieldByname('Size').AsInteger := vForm.Size;
        FieldByName('Data').Value := null;
        TBlobField(FieldByName('Data')).LoadFromStream(vForm);
        Post;
        Close;

        Query.Refresh;

        Query.Locate('ID', vID, []);
      end;
  vForm.Free;
  vTemp.Free;
  SetEnabledButtons;
end;

function TGReportFormForm.EditReportFormDialog: boolean;
  var
    vName : string;
    vID : integer;
    vType : String;
    vForm : TMemoryStream;
    vComment : string;
begin
  vForm := TMemoryStream.Create;
  with Query do
  begin
    vName := FieldByName('Name').AsString;
    vType := FieldByName('Type').AsString;
    TBlobField(FieldByName('Data')).SaveToStream(vForm);
    vComment := FieldByName('Comment').AsString;
    vID := FieldByName('ID').AsInteger;
  end;

  Result :=
    GetReportFormParams(
      vType,
      vName,
      vComment,
      vForm);

  if Result then
  begin
    if Query.Locate('Name;Type', VarArrayOf([vName,vType]), []) and (Query.FieldByName('ID').AsInteger <> vID) then ShowMsg('Отчет уже существует в базе данных', smtInformation, [smbOK], smbOK, smbOK)
    else
    with Table do
    begin
      Close;
      ParamByName('ID').AsInteger := vID;
      Open;
      Edit;
      FieldByName('ID_AssertUser').AsInteger := UserID;
      FieldByName('Name').AsString := vName;
      FieldByName('Type').AsString := vType;
      FieldByName('Size').AsFloat := vForm.Size;
      FieldByname('Version').AsString := GetFastReport3FormVersion(vForm);
      FieldByname('Comment').AsString := vComment;
      TBlobField(FieldByName('Data')).LoadFromStream(vForm);
      Post;
      Close;

      Query.Refresh;

      Query.Locate('ID', vID, []);
    end;
  end;
  vForm.Free;
  SetEnabledButtons;
end;

procedure TGReportFormForm.QueryAfterOpen(DataSet: TDataSet);
begin
  SetEnabledButtons;
end;

end.
