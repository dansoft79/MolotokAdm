unit uHYAutoUpdateClient;

{$INCLUDE 'Hydra.inc'}

interface

uses
  Classes, SysUtils, Windows,
  uHYConsts, uRORemoteService, uHYFileUtils, HydraAutoUpdate_Intf;

const
  def_DownloadBufferSize = 48000;
  def_TemporaryFileNamePrefix = '$$';

type
  { Events and enums }
  THYAutoUpdateClient = class;

  THYDownloadResumeEvent = procedure(Sender: THYAutoUpdateClient; UpdateInfo: THYFileUpdateInfo; Progress: integer; var CanResume: boolean) of object;
  THYDownloadProgressEvent = procedure(Sender: THYAutoUpdateClient; UpdateInfo: THYFileUpdateInfo; Progress: integer; var Continue: boolean) of object;
  THYDownloadUpdateEndEvent = procedure(Sender: THYAutoUpdateClient; UpdateInfo: THYFileUpdateInfo) of object;

  THYUpdatesFoundEvent = procedure(Sender: THYAutoUpdateClient; const anUpdateList: THYFileUpdateInfoArray; Resumable: boolean) of object;
  THYUpdatesNotFoundEvent = procedure(Sender: THYAutoUpdateClient) of object;

  THYDownloadUpdatesNotificationEvent = procedure(Sender: THYAutoUpdateClient; const anUpdateList: THYFileUpdateInfoArray) of object;
  THYDownloadUpdatesEndEvent = procedure(Sender: THYAutoUpdateClient; const anUpdateList: THYFileUpdateInfoArray; UserInterrupted: boolean) of object;
  THYVerityUpdateStatusEvent = procedure(Sender: THYAutoUpdateClient; var Status: THYUpdateStatus; const ServerUpdateID, UserData: string) of object;
  THYDownloadUpdateBeginEvent = procedure(Sender: THYAutoUpdateClient; UpdateInfo: THYFileUpdateInfo; Resumed: boolean; Progress, Size: integer) of object;
  THYUpdateComparisonEvent = procedure(Sender: TObject; aFileInfo, anUpdate: THYFileUpdateInfo; var FileInfoIsUpToDate: boolean) of object;

  THYBeforeFileReplaceEvent = procedure(Sender: THYAutoUpdateClient; anUpdate: THYFileUpdateInfo) of object;
  THYAfterFileReplaceEvent = procedure(Sender: THYAutoUpdateClient; anUpdate: THYFileUpdateInfo; Failed: boolean; var Ignore: boolean) of object;

  { THYCustomFileSearchInfo }
  THYCustomFileSearchInfo = class(THYFileSearchInfo)
  protected
    function GetDisplayName: string; override;
  end;

  { THYFileUpdateHelper }
  THYDirTranslationType = (dttClientToServer, dttServerToClient);

  THYFileUpdateHelper = class
  private
  protected
  public
    destructor Destroy; override;

    // Utility methods
    function FindFileUpdate(const aFileName: string; const anArray: THYFileUpdateInfoArray): integer;

    function ArrayToCollection(const anArray: THYFileUpdateInfoArray;
                               const aCollection: THYFileUpdateInfoCollection;
                               ClearCollection: boolean = FALSE): integer;

    function CollectionToArray(const aCollection: THYFileUpdateInfoCollection;
                               const anArray: THYFileUpdateInfoArray;
                               ClearArray: boolean = FALSE): integer;

    // Comparison and delta generation
    function GenerateDelta(const aServerList,
                           aClientList: THYFileUpdateInfoArray;
                           aSearchInfoCollection: THYFileSearchInfoCollection;
                           anUpdateComparisonMethod: THYUpdateComparisonMethod;
                           anUpdateComparisonHandler: THYUpdateComparisonEvent = NIL): THYFileUpdateInfoArray;

    // Directory scan
    function ScanForFiles(const aSearchInfo: THYFileSearchInfo;
                          const aDestination: THYFileUpdateInfoArray;
                          ClearDestination: boolean = FALSE): integer;

    function AddDirectoryFiles(aDirectory: THYDirectory;
      aDestination: THYFileUpdateInfoArray; Recursive: boolean): integer;

    // Misc
    procedure TranslateDirectories(aFileUpdateInfo: THYFileUpdateInfo;
                                   aFileSearchCollection: THYFileSearchInfoCollection;
                                   aTranslationType: THYDirTranslationType); overload;
    procedure TranslateDirectories(aFileUpdateInfoArray: THYFileUpdateInfoArray;
                                   aFileSearchCollection: THYFileSearchInfoCollection;
                                   aTranslationType: THYDirTranslationType); overload;
  end;

  { THYAutoUpdateClient }
  THYResumableUpdatesOperation = (ruoAdjustDownloadProgress, ruoDelete, ruoReplaceOldFiles);
  THYAutoUpdateClient = class(TRORemoteService, IHYAutoUpdateService)
  private
    fFileUpdateHelper: THYFileUpdateHelper;
    fOnBeginDownloadUpdates: THYDownloadUpdatesNotificationEvent;
    fOnDownloadProgress: THYDownloadProgressEvent;
    fOnEndDownloadUpdates: THYDownloadUpdatesEndEvent;
    fDownloadBufferSize: integer;
    fOnEndDownloadUpdate: THYDownloadUpdateEndEvent;
    fOnVerityUpdateStatus: THYVerityUpdateStatusEvent;
    fFileSearchInfo: THYFileSearchInfoCollection;
    fTemporaryFileNamePrefix: string;
    fOnResumeDownload: THYDownloadResumeEvent;
    fOnBeginDownloadUpdate: THYDownloadUpdateBeginEvent;
    fDownloading: boolean;
    fDownloadSize: integer;
    fDownloadProgress: integer;
    fOnUpdatesFound: THYUpdatesFoundEvent;
    fOnUpdatesNotFound: THYUpdatesNotFoundEvent;
    fOnAfterFileReplace: THYAfterFileReplaceEvent;
    fOnBeforeFileReplace: THYBeforeFileReplaceEvent;
    fDownloadAborted: boolean;

    function GetAutoUpdateService: IHYAutoUpdateService;
    function GetFileSearchInfo: THYFileSearchInfoCollection;
    procedure SetFileSearchInfo(const Value: THYFileSearchInfoCollection);

  protected
    procedure DoDownloadUpdates(anUpdateList: THYFileUpdateInfoArray; out UserInterrupted: boolean); virtual;
    function LoopResumableUpdates(anUpdateInfoArray: THYFileUpdateInfoArray; anOperation: THYResumableUpdatesOperation): integer;

    property AutoUpdateService: IHYAutoUpdateService read GetAutoUpdateService implements IHYAutoUpdateService;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    // Key methods
    function VerifyUpdateStatus(const aLastUpdateID: string; out CurrentUpdateID: string; out UserData: string): THYUpdateStatus;
    function GetUpdatesInfo(const aLastUpdateID: string; out CanResume: boolean): THYFileUpdateInfoArray;
    function DownloadUpdates(const anUpdateList: THYFileUpdateInfoArray): boolean;
    function FinalizeUpdate(anUpdateList: THYFileUpdateInfoArray): boolean;

    // Misc
    function DeleteTemporaryFiles(anUpdateList: THYFileUpdateInfoArray): integer;
    function RefreshDownloadProgress(anUpdateList: THYFileUpdateInfoArray): integer;

    procedure StopDownload;

    property DownloadSize: integer read fDownloadSize;
    property DownloadProgress: integer read fDownloadProgress;

    property Downloading: boolean read fDownloading;

  published
    property OnResumeDownload: THYDownloadResumeEvent read fOnResumeDownload write fOnResumeDownload;

    property OnBeginDownloadUpdate: THYDownloadUpdateBeginEvent read fOnBeginDownloadUpdate write fOnBeginDownloadUpdate;
    property OnDownloadProgress: THYDownloadProgressEvent read fOnDownloadProgress write fOnDownloadProgress;
    property OnEndDownloadUpdate: THYDownloadUpdateEndEvent read fOnEndDownloadUpdate write fOnEndDownloadUpdate;

    property OnBeginDownloadUpdates: THYDownloadUpdatesNotificationEvent read fOnBeginDownloadUpdates write fOnBeginDownloadUpdates;
    property OnEndDownloadUpdates: THYDownloadUpdatesEndEvent read fOnEndDownloadUpdates write fOnEndDownloadUpdates;

    property OnVerityUpdateStatus: THYVerityUpdateStatusEvent read fOnVerityUpdateStatus write fOnVerityUpdateStatus;

    property OnUpdatesFound: THYUpdatesFoundEvent read fOnUpdatesFound write fOnUpdatesFound;
    property OnUpdatesNotFound: THYUpdatesNotFoundEvent read fOnUpdatesNotFound write fOnUpdatesNotFound;

    property OnBeforeFileReplace: THYBeforeFileReplaceEvent read fOnBeforeFileReplace write fOnBeforeFileReplace;
    property OnAfterFileReplace: THYAfterFileReplaceEvent read fOnAfterFileReplace write fOnAfterFileReplace;

    property TemporaryFileNamePrefix: string read fTemporaryFileNamePrefix write fTemporaryFileNamePrefix;
    property DownloadBufferSize: integer read fDownloadBufferSize write fDownloadBufferSize default def_DownloadBufferSize;

    property FileSearchInfo: THYFileSearchInfoCollection read GetFileSearchInfo write SetFileSearchInfo;
  end;

{ Misc }
function ParseSearchInfoDirectories(aFileSearchInfoCollection: THYFileSearchInfoCollection; aList: TStrings): integer;

implementation

uses
  uROTypes;

{ Misc }
function ParseSearchInfoDirectories(aFileSearchInfoCollection: THYFileSearchInfoCollection; aList: TStrings): integer;
{ 0=$APPLICATION\Update.1\*.*|$APPLICATION\*.*,Recursive
  1=$WINDOWS\SomethingForWindows.txt }
var i, x: integer;
    dirline, s: string;
    item: THYFileSearchInfo;
begin
  result := 0;
  aFileSearchInfoCollection.Clear;

  for i := 0 to (aList.Count-1) do begin
    dirline := aList.Values[aList.Names[i]];
    item := aFileSearchInfoCollection.Add;

    // Locates the "Recursive" or "True" text after the comma
    item.Recursive := FALSE;
    x := Pos(',', dirline);
    if (x>0) then begin
      s := UpperCase(Copy(dirline, x+1, MaxInt));
      item.Recursive := (s='RECURSIVE') or (s='TRUE');
      Delete(dirline, x, MaxInt);
    end;

    // Extracts SearchMask and TargetClientDirectory
    x := Pos('|', dirline);
    if (x>0) then begin
      item.TargetClientDirectory := Copy(dirline, x+1, MaxInt);
      Delete(dirline, x, MaxInt);
    end;

    item.SearchMask := dirline;
  end;
end;

{ THYCustomFileSearchInfo }
function THYCustomFileSearchInfo.GetDisplayName: string;
begin
  if Recursive
    then result := '[Recursive] '
    else result := '';

  if (SearchMask<>'')
    then result := result+SearchMask
    else result := result+'<Unspecified>';

  if (TargetClientDirectory<>'')
    then result := result+' --> '+TargetClientDirectory;
end;

{ THYFileUpdateHelper }
destructor THYFileUpdateHelper.Destroy;
begin
  inherited;
end;

function THYFileUpdateHelper.CollectionToArray(const aCollection: THYFileUpdateInfoCollection;
  const anArray: THYFileUpdateInfoArray; ClearArray: boolean = FALSE): integer;
var i: integer;
begin
  if ClearArray
    then anArray.Resize(0);

  anArray.Resize(anArray.Count+aCollection.Count);
  for i := 0 to aCollection.Count-1 do
    if Assigned(aCollection[i])
      then anArray[i] := aCollection[i].Clone() as THYFileUpdateInfo
      else anArray[i] := NIL;      

  result := aCollection.Count;
end;

function THYFileUpdateHelper.ArrayToCollection(const anArray: THYFileUpdateInfoArray;
  const aCollection: THYFileUpdateInfoCollection; ClearCollection: boolean = FALSE): integer;
var i: integer;
begin
  if ClearCollection
    then aCollection.Clear;

  for i := 0 to anArray.Count-1 do
    aCollection.Add.Assign(anArray[i]);

  result := anArray.Count;
end;

function THYFileUpdateHelper.AddDirectoryFiles(aDirectory: THYDirectory;
  aDestination: THYFileUpdateInfoArray; Recursive: boolean{; aSourceSearchInfo: THYFileSearchInfo}): integer;
var i: integer;
    info: THYFileUpdateInfo;
    fname: string;
begin
  result := 0;

  with aDirectory do begin
    if Recursive then
      for i := 0 to (DirectoryCount-1) do
        Inc(result, AddDirectoryFiles(Directories[i], aDestination, Recursive));//, aSourceSearchInfo));

    for i := 0 to (FileCount-1) do begin
      fname := ReplacePathsWithDirMacros(Files[i].FullName);
      if (FindFileUpdate(fname, aDestination)>=0) then Continue; // No duplicates!

      // Adds the new entry
      info := aDestination.Add;
      info.FileName := fname;

      // Modifies the path to match the TargetClientDirectory, if any is specified
(*      if UseTargetClientDirectory and (aSourceSearchInfo<>NIL) then begin
        targetdir := Trim(aSourceSearchInfo.TargetClientDirectory);
        if (targetdir<>'') then begin
          origdir := ExcludeTrailingPathDelimiter(ExtractFilePath(aSourceSearchInfo.SearchMask));
          info.FileName := StringReplace(info.FileName, origdir, targetdir, [rfReplaceAll, rfIgnoreCase]);
        end;
      end;*)

      info.Size := Files[i].Size;
      info.TimeStamp := Files[i].Time;
      info.Version := Files[i].VersionString;
      info.Operation := uoClient;
      info.UserData := '';

      Inc(result);
    end;
  end;
end;

function THYFileUpdateHelper.ScanForFiles(
  const aSearchInfo: THYFileSearchInfo;
  const aDestination: THYFileUpdateInfoArray;
  ClearDestination: boolean = FALSE): integer;
var dir: THYDirectory;
    dirname, filemask: string;
begin
  if ClearDestination
    then aDestination.Clear;

  dirname := ExtractFilePath(ReplaceDirMacrosWithPaths(aSearchInfo.SearchMask));
  filemask := ExtractFileName(aSearchInfo.SearchMask);

  dir := THYDirectory.Create(NIL, dirname);
  try
    dir.Refresh(filemask, [roFiles, roDirectories], aSearchInfo.Recursive);

    result := AddDirectoryFiles(dir, aDestination, TRUE);
  finally
    dir.Free;
  end;
end;

function THYFileUpdateHelper.GenerateDelta(const aServerList,
                           aClientList: THYFileUpdateInfoArray;
                           aSearchInfoCollection: THYFileSearchInfoCollection;
                           anUpdateComparisonMethod: THYUpdateComparisonMethod;
                           anUpdateComparisonHandler: THYUpdateComparisonEvent = NIL): THYFileUpdateInfoArray;
var idx, i: integer;
    newitem: THYFileUpdateInfo;
    skip: boolean;
begin
  result := THYFileUpdateInfoArray.Create;

  for i := 0 to (aServerList.Count-1) do begin
    skip := TRUE; // By default the file is up to date

    // Now we have the right file name the client might have sent and we try to locate it
    idx := FindFileUpdate(aServerList[i].FileName, aClientList);

    if (idx<0)
      then skip := FALSE // The update is not in the reference list, so we add it

    else begin
      // The update is in the reference list, so we compare it. Size MUST be the same, otherwise the file is considered corrupt
      if (aClientList[idx].Size<>aServerList[i].Size) then skip := FALSE

      else begin
        // File is intact, other comparisosn
        case anUpdateComparisonMethod of
          ucmCompareTime: begin
            skip := not (aClientList[idx].TimeStamp<aServerList[i].TimeStamp); // Compares time
          end;
          ucmCompareVersion: begin
            skip := SameText(aClientList[idx].Version, aServerList[i].Version); // Ensures the version matches
          end;
          ucmUserDefined: begin
            if Assigned(anUpdateComparisonHandler)
              then anUpdateComparisonHandler(Self, aClientList[idx], aServerList[i], skip);
          end;
        end;
      end;
    end;

    // Adds it, if required
    if skip then Continue;

    newitem := result.Add;
    newitem.Assign(aServerList[i]);
  end;
end;

function THYFileUpdateHelper.FindFileUpdate(
  const aFileName: string; const anArray: THYFileUpdateInfoArray): integer;
var i: integer;
begin
  result := -1;
  for i := 0 to (anArray.Count-1) do
    if SameText(anArray[i].FileName, aFileName) then begin
      result := i;
      Exit;
    end;
end;

procedure THYFileUpdateHelper.TranslateDirectories(aFileUpdateInfo: THYFileUpdateInfo;
                                   aFileSearchCollection: THYFileSearchInfoCollection;
                                   aTranslationType: THYDirTranslationType);
var i: integer;
    clientdir, serverdir: string;
begin
  for i := 0 to (aFileSearchCollection.Count-1) do begin
    serverdir := ReplacePathsWithDirMacros(ExcludeTrailingPathDelimiter(ExtractFilePath(aFileSearchCollection[i].SearchMask)));
    clientdir := aFileSearchCollection[i].TargetClientDirectory;

    case aTranslationType of
      dttClientToServer: begin
        if (Pos(clientdir, aFileUpdateInfo.FileName)=1)
            then aFileUpdateInfo.FileName := StringReplace(aFileUpdateInfo.FileName, clientdir, serverdir, [rfIgnoreCase]);
      end;
      dttServerToClient: begin
        if (Pos(serverdir, aFileUpdateInfo.FileName)=1)
          then aFileUpdateInfo.FileName := StringReplace(aFileUpdateInfo.FileName, serverdir, clientdir, [rfIgnoreCase]);
      end;
    end;
  end;
end;

procedure THYFileUpdateHelper.TranslateDirectories(aFileUpdateInfoArray: THYFileUpdateInfoArray;
                                   aFileSearchCollection: THYFileSearchInfoCollection;
                                   aTranslationType: THYDirTranslationType);
var i: integer;
begin
  for i := 0 to (aFileUpdateInfoArray.Count-1) do
    TranslateDirectories(aFileUpdateInfoArray[i], aFileSearchCollection, aTranslationType);
end;

{ THYAutoUpdateClient }
constructor THYAutoUpdateClient.Create(aOwner: TComponent);
begin
  fDownloadBufferSize := def_DownloadBufferSize;
  fFileSearchInfo := THYFileSearchInfoCollection.Create(THYCustomFileSearchInfo);
  fTemporaryFileNamePrefix := def_TemporaryFileNamePrefix;
  
  inherited;

  fFileUpdateHelper := THYFileUpdateHelper.Create;
end;

destructor THYAutoUpdateClient.Destroy;
begin
  inherited;

  FreeAndNIL(fFileSearchInfo);
  FreeAndNIL(fFileUpdateHelper);
end;

function THYAutoUpdateClient.VerifyUpdateStatus(const aLastUpdateID: string;
  out CurrentUpdateID: string; out UserData: string): THYUpdateStatus;
begin
  result := AutoUpdateService.VerifyUpdateStatus(aLastUpdateID, CurrentUpdateID, UserData);

  if Assigned(fOnVerityUpdateStatus)
    then fOnVerityUpdateStatus(Self, result, CurrentUpdateID, UserData);
end;

function THYAutoUpdateClient.GetUpdatesInfo(const aLastUpdateID: string; out CanResume: boolean): THYFileUpdateInfoArray;
var clientfiles: THYFileUpdateInfoArray;
    i: integer;
begin
  clientfiles := THYFileUpdateInfoArray.Create;
  try
    // Prepares the list to send to the server
    for i := 0 to (fFileSearchInfo.Count-1) do
      fFileUpdateHelper.ScanForFiles(fFileSearchInfo[i], clientfiles);

    // Sends the list and expects a list of updates back
    result := AutoUpdateService.GetUpdatesInfo(aLastUpdateID, clientfiles);

    CanResume := (LoopResumableUpdates(result, ruoAdjustDownloadProgress)>0); // Updates the download progress

    if (result<>NIL) and (result.Count>0) then begin
      if Assigned(fOnUpdatesFound)
        then fOnUpdatesFound(Self, result, CanResume);
    end
    else if Assigned(fOnUpdatesNotFound)
      then fOnUpdatesNotFound(Self);
  finally
    clientfiles.Free;
  end;
end;

function THYAutoUpdateClient.GetAutoUpdateService: IHYAutoUpdateService;
begin
  result := THYAutoUpdateService_Proxy.Create(ServiceName, Message, Channel);
end;

procedure THYAutoUpdateClient.DoDownloadUpdates(anUpdateList: THYFileUpdateInfoArray; out UserInterrupted: boolean);
var i: integer;
    currupdate: THYFileUpdateInfo;
    tempfilename: string;
    filestream: THYFile;
    buffer: Binary;
    resumed, cancontinue, fullydownloaded: boolean;
begin
  currupdate :=  NIL; // To avoid an annoying compiler warning
  fDownloading := TRUE;
  fDownloadAborted := FALSE;
  
  try
    // Updates the counters
    fDownloadSize := 0;
    fDownloadProgress := 0;
    for i := 0 to (anUpdateList.Count-1) do begin
      Inc(fDownloadSize, anUpdateList[i].Size);
      Inc(fDownloadProgress, anUpdateList[i].DownloadProgress);
    end;

    // Downloads the files
    for i := 0 to (anUpdateList.Count-1) do try
      currupdate := anUpdateList[i];
      filestream := NIL;
      resumed := FALSE;

      // Creates the file in the correct update directory
      tempfilename := ReplaceDirMacrosWithPaths(currupdate.FileName);
      tempfilename := ExtractFilePath(tempfilename)+TemporaryFileNamePrefix+ExtractFileName(tempfilename);

      if not DirectoryExists(ExtractFilePath(tempfilename))
        then ForceDirectories(ExtractFilePath(tempfilename));

      if FileExists(tempfilename) then begin
        resumed := TRUE;

        filestream := THYFile.Create(NIL, tempfilename);
        if (filestream.Size=currupdate.Size) then Continue; // File is fully downloaded, no resume needed

        filestream.Open(fmOpenReadWrite or fmShareDenyWrite);
        filestream.Position := filestream.Size;

        if Assigned(fOnResumeDownload) then begin
          cancontinue := TRUE;
          fOnResumeDownload(Self, currupdate, filestream.Position, cancontinue);

          if not cancontinue then begin
            FreeAndNIL(filestream);
            resumed := FALSE;
          end;
        end;
      end;

      if not resumed // File not found or resume not accepted
        then filestream := THYFile.CreateNew(NIL, tempfilename);

      if Assigned(fOnBeginDownloadUpdate)
        then fOnBeginDownloadUpdate(Self, currupdate, resumed, filestream.Position, currupdate.Size);

      // Starts fetching data
      while (filestream.Position<currupdate.Size) do try
        cancontinue := TRUE;

        fullydownloaded := (filestream.Position>=currupdate.Size); // If the file is already fully downloaded, no need to make a server call

        if Assigned(fOnDownloadProgress)
          then fOnDownloadProgress(Self, currupdate, filestream.Position, cancontinue);

        // Reads more data from the server
        if not fullydownloaded then begin
          AutoUpdateService.GetFileData(currupdate, filestream.Position, fDownloadBufferSize, buffer);

          // Appends the data to the file stream
          filestream.CopyFromStream(buffer, buffer.Size);

          // Updates the counters
          currupdate.DownloadProgress := currupdate.DownloadProgress+buffer.Size;
          fDownloadProgress := fDownloadProgress+buffer.Size;
        end;

        // Download End, fires event
        if (filestream.Position>=currupdate.Size) then begin
          if Assigned(fOnEndDownloadUpdate)
            then fOnEndDownloadUpdate(Self, currupdate);
        end;

        if not cancontinue then begin
          UserInterrupted := TRUE;
          Break;
        end
        else if fDownloadAborted then begin
          UserInterrupted := TRUE;
          Exit;  
        end;
      finally
        buffer.Free;
      end;

    finally
      FreeAndNIL(filestream);

      // Modifies the file date to match the one of the server
      FileSetDate(tempfilename, DateTimeToFileDate(currupdate.TimeStamp));
    end;
  finally
    fDownloading := FALSE;
  end;
end;

function THYAutoUpdateClient.DownloadUpdates(const anUpdateList: THYFileUpdateInfoArray): boolean;
var userinterrupted: boolean;
begin
  userinterrupted := FALSE;

  if Assigned(fOnBeginDownloadUpdates)
    then fOnBeginDownloadUpdates(Self, anUpdateList);

  // Downloads the files
  DoDownloadUpdates(anUpdateList, userinterrupted);

  if Assigned(fOnEndDownloadUpdates)
      then fOnEndDownloadUpdates(Self, anUpdateList, userinterrupted);

  result := not userinterrupted;
end;

function THYAutoUpdateClient.GetFileSearchInfo: THYFileSearchInfoCollection;
begin
  result := fFileSearchInfo
end;

procedure THYAutoUpdateClient.SetFileSearchInfo(
  const Value: THYFileSearchInfoCollection);
begin
  fFileSearchInfo.Assign(Value);
end;

function THYAutoUpdateClient.LoopResumableUpdates(anUpdateInfoArray: THYFileUpdateInfoArray;
  anOperation: THYResumableUpdatesOperation): integer;
var sze, i: integer;
    originalexists, updateexists, failed, ignore: boolean;
    originalfilename,
    filename: string;
begin
  result := 0;
  for i := 0 to (anUpdateInfoArray.Count-1) do begin
    originalfilename := ReplaceDirMacrosWithPaths(anUpdateInfoArray[i].FileName);
    filename := IncludeTrailingPathDelimiter(ExtractFileDir(originalfilename))+TemporaryFileNamePrefix+ExtractFileName(originalfilename);

    originalexists := FileExists(originalfilename);
    sze := ReadFileSize(filename, updateexists);

    if updateexists then
      case anOperation of
        ruoAdjustDownloadProgress: begin
          anUpdateInfoArray[i].DownloadProgress := sze;
          Inc(result, sze);
        end;
        ruoDelete: begin
          Windows.DeleteFile(PChar(FileName));
          Inc(result, sze);
        end;
        ruoReplaceOldFiles: begin
          // Fires event
          if Assigned(fOnBeforeFileReplace)
            then fOnBeforeFileReplace(Self, anUpdateInfoArray[i]);

          // Tries to rename the file
          failed := (originalexists and not Windows.DeleteFile(PChar(originalfilename))) or
                    not Windows.MoveFile(PChar(filename), PChar(originalfilename));

          if not failed
            then anUpdateInfoArray[i].Status := fusUpdated;

          // Triggers the second event
          ignore := FALSE;
          if Assigned(fOnAfterFileReplace)
            then fOnAfterFileReplace(Self, anUpdateInfoArray[i], failed, ignore);

          if (not failed) or ignore
            then Inc(result);
        end;
      end;
  end;
end;

function THYAutoUpdateClient.DeleteTemporaryFiles(
  anUpdateList: THYFileUpdateInfoArray): integer;
begin
  result := LoopResumableUpdates(anUpdateList, ruoDelete);
end;

function THYAutoUpdateClient.RefreshDownloadProgress(
  anUpdateList: THYFileUpdateInfoArray): integer;
begin
  result := LoopResumableUpdates(anUpdateList, ruoAdjustDownloadProgress);
end;

function THYAutoUpdateClient.FinalizeUpdate(anUpdateList: THYFileUpdateInfoArray): boolean;
var res: integer;
begin
  res := LoopResumableUpdates(anUpdateList, ruoReplaceOldFiles);
  result := (res=anUpdateList.Count);
end;

procedure THYAutoUpdateClient.StopDownload;
begin
  fDownloadAborted := TRUE;
end;

end.
