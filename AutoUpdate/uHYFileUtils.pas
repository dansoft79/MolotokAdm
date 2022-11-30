unit uHYFileUtils;

{$INCLUDE Hydra.inc}

interface

uses
  {$IFDEF DELPHI5}uHYD5Helpers,{$ENDIF}
  {$IFDEF MSWINDOWS}Windows,{$ENDIF}
  Classes, Contnrs, SysUtils, uHYConsts;

const
  def_CopyBufferSize = 16384;

  AnyFile = '*.*';
  faArchiveAndDirectory = faArchive or faDirectory;

  { Macro directory names }
  mcr_Symbol = '$';
  mcr_Application = 'APPLICATION';

  {$IFDEF MSWINDOWS}
  mcr_Windows = 'WINDOWS';
  mcr_System = 'SYSTEM';
  {$ENDIF}

  id_Class = 'Class';

type
  { Exceptions }                        
  EHYFileError = class(EHYException);

  EHYFileNotFound = class(EHYFileError);

  EHYFileOpenError = class(EHYFileError);
  EHYFileClosedError = class(EHYFileError);

  { Forwards }
  THYCustomFile = class;
  THYFile = class;
  THYDirectory = class;

  THYFileClass = class of THYFile;
  THYDirectoryClass = class of THYDirectory;

  { THYCustomFile }
  THYCustomFile = class(TInterfacedObject)
  private
    fFileInfo: TSearchRec;
    fDirectory: THYDirectory;
    fData: pointer;

    function GetAttributes: integer;
    function GetName: string;
    function GetTime: TDateTime;
    procedure SetTime(const Value: TDateTime);
    procedure SetAttributes(const Value: integer);
    procedure SetName(const Value: string);
    function GetAttributesString: string;
    function GetVersionString: string;

  protected
    function GetSize: integer; virtual;
    function GetFullName: string; virtual;

  public
    constructor Create(aParent: THYDirectory; aSearchRec: TSearchRec); overload; virtual;
    constructor Create(aParent: THYDirectory; const aName: string); overload;

    { Properties }
    property Directory: THYDirectory read fDirectory;

    property Name: string read GetName write SetName;
    property FullName: string read GetFullName;

    property Size: integer read GetSize;
    property Attributes: integer read GetAttributes write SetAttributes;
    property AttributesString: string read GetAttributesString;
    property VersionString: string read GetVersionString;
    property Time: TDateTime read GetTime write SetTime; // Last write time

    property Data: pointer read fData write fData;
  end;

  { THYFile }
  THYFile = class(THYCustomFile)
  private
    fStream: TFileStream;

    function GetIsOpen: boolean;
    function GetHandle: integer;
    function GetPosition: integer;
    procedure SetPosition(const Value: integer);
    function GetLastChunkSize(aStream: TStream;
      aNormalChunkSize: integer): integer;

  protected
    procedure CheckOpen(MustBeOpen: boolean);

    function GetSize: integer; override;

  public
    constructor CreateNew(aParent: THYDirectory; const aName: string; KeepOpen: boolean = TRUE);
    destructor Destroy; override;

    { File Management }
    procedure Open(aFileMode: cardinal);
    procedure Close;

    procedure Copy(aDestination: string);
    procedure Delete;

    function CopyToStream(aDestination: TStream; aCount: integer): integer;
    function CopyFromStream(aSource: TStream; aCount: integer): integer;

    { Properties }
    property Stream: TFileStream read fStream;
    property Handle: integer read GetHandle;
    property IsOpen: boolean read GetIsOpen;
    property Position: integer read GetPosition write SetPosition;
  end;

  { Events }
  THYFindFileEvent = procedure(Sender: THYDirectory; aFile: THYFile; var Accept: boolean) of object;
  THYFindDirectoryEvent = procedure(Sender: THYDirectory; aDirectory: THYDirectory; var Accept: boolean) of object;
  THYFileCopyProgressEvent = procedure(Sender: THYDirectory; Source: THYFile; const Destination: string; Position, TotalSize: integer) of object;
  THYFileCopyStartEvent = procedure(Sender: THYDirectory; Source: THYFile; const Destination: string) of object;
  THYFileCopyEndEvent = procedure(Sender: THYDirectory; Source, Destination: THYFile) of object;

  { Enums }
  THYDirectoryOption = (doPropagateAttributes);
  THYDirectoryOptions = set of THYDirectoryOption;

  THYDirectoryRefreshOption = (roFiles, roDirectories);
  THYDirectoryRefreshOptions = set of THYDirectoryRefreshOption;

  { Interfaces }
  IHYDirectoryAttributes = interface
  ['{18E47F3E-E1F8-4C31-9766-6C8417D9D737}']
    procedure SetOnFindDirectory(const Value: THYFindDirectoryEvent);
    procedure SetOnFindFile(const Value: THYFindFileEvent);
    function GetOnFindDirectory: THYFindDirectoryEvent;
    function GetOnFindFile: THYFindFileEvent;
    function GetOptions: THYDirectoryOptions;
    procedure SetOptions(const Value: THYDirectoryOptions);
    function GetOnCopyFileProgress: THYFileCopyProgressEvent;
    procedure SetOnCopyFileProgress(const Value: THYFileCopyProgressEvent);
    function GetOnCopyFileStart: THYFileCopyStartEvent;
    procedure SetOnFileCopyStart(const Value: THYFileCopyStartEvent);
    function GetOnCopyFileEnd: THYFileCopyEndEvent;
    procedure SetOnCopyFileEnd(const Value: THYFileCopyEndEvent);
    function GetCopyBufferSize: integer;
    procedure SetCopyBufferSize(const Value: integer);

    property Options: THYDirectoryOptions read GetOptions write SetOptions;
    property OnFindFile: THYFindFileEvent read GetOnFindFile write SetOnFindFile;
    property OnFindDirectory: THYFindDirectoryEvent read GetOnFindDirectory write SetOnFindDirectory;
    property OnCopyFileStart: THYFileCopyStartEvent read GetOnCopyFileStart write SetOnFileCopyStart;
    property OnCopyFileEnd: THYFileCopyEndEvent read GetOnCopyFileEnd write SetOnCopyFileEnd;
    property OnCopyFileProgress: THYFileCopyProgressEvent read GetOnCopyFileProgress write SetOnCopyFileProgress;
    property CopyBufferSize: integer read GetCopyBufferSize write SetCopyBufferSize;
  end;

  { THYDirectory }
  THYDirectory = class(THYCustomFile, IHYDirectoryAttributes)
  private
    fSavedDirectories: TStringList;
    fDirectories,
    fFiles: TObjectList;
    fFileMask: string;
    fOnFindDirectory: THYFindDirectoryEvent;
    fOnFindFile: THYFindFileEvent;
    fOptions: THYDirectoryOptions;
    fRefreshedFiles,
    fRefreshedDirectories: boolean;
    fOnCopyFileProgress: THYFileCopyProgressEvent;
    fOnFileCopyStart: THYFileCopyStartEvent;
    fOnFileCopyEnd: THYFileCopyEndEvent;
    fCopyBufferSize: integer;

    function GetFileCount: integer;
    function GetFiles(Index: integer): THYFile;
    function GetDirectories(Index: integer): THYDirectory;
    function GetDirectoryCount: integer;
    procedure PropagateAttributes;
    function GetSavedDirectories(Index: integer): string;
    function GetSavedDirectoryCount: integer;
    function GetSavedDirectoriesList: TStringList;

  protected
    function CreateFileObject(aParent: THYDirectory; aSearchRec: TSearchRec): THYFile; dynamic;
    function CreateDirectoryObject(aParent: THYDirectory; aSearchRec: TSearchRec): THYDirectory; dynamic;

    procedure AssignAttributes(const Source: IHYDirectoryAttributes);

    function GetSize: integer; override;

    { IHYDirectoryAttributes }
    procedure SetOnFindDirectory(const Value: THYFindDirectoryEvent);
    procedure SetOnFindFile(const Value: THYFindFileEvent);
    function GetOnFindDirectory: THYFindDirectoryEvent;
    function GetOnFindFile: THYFindFileEvent;
    function GetOptions: THYDirectoryOptions;
    procedure SetOptions(const Value: THYDirectoryOptions);
    function GetOnCopyFileProgress: THYFileCopyProgressEvent;
    procedure SetOnCopyFileProgress(const Value: THYFileCopyProgressEvent);
    function GetOnCopyFileStart: THYFileCopyStartEvent;
    procedure SetOnFileCopyStart(const Value: THYFileCopyStartEvent);
    function GetOnCopyFileEnd: THYFileCopyEndEvent;
    procedure SetOnCopyFileEnd(const Value: THYFileCopyEndEvent);
    function GetCopyBufferSize: integer;
    procedure SetCopyBufferSize(const Value: integer);

  public
    constructor Create(aParent: THYDirectory; aSearchRec: TSearchRec); override;
    destructor Destroy; override;

    { List Management }
    procedure Clear;
    function Refresh(const aFileMask: string;
                     Options: THYDirectoryRefreshOptions;
                     Recursive: boolean = FALSE;
                     aSearchAttr: integer = faArchiveAndDirectory): integer;

    { Directory Management }
    procedure PushDir;
    function PopDir: boolean;
    procedure ClearSavedDirectoriesList;

    { File operations }
    procedure CopyFile(const aFileName, aDestinationDirectory: string);
    procedure CopyFiles(const aDestinationDirectory: string; const aList: array of string);

    { Properties }
    property Files[Index: integer]: THYFile read GetFiles; default;
    property FileCount: integer read GetFileCount;

    property Directories[Index: integer]: THYDirectory read GetDirectories;
    property DirectoryCount: integer read GetDirectoryCount;

    property FileMask: string read fFileMask;

    property Options: THYDirectoryOptions read GetOptions write SetOptions;

    property RefreshedFiles: boolean read fRefreshedFiles;
    property RefreshedDirectories: boolean read fRefreshedDirectories;

    property CopyBufferSize: integer read GetCopyBufferSize write SetCopyBufferSize;

    property SavedDirectories[Index: integer]: string read GetSavedDirectories;
    property SavedDirectoryCount: integer read GetSavedDirectoryCount;

    { Events }
    property OnFindFile: THYFindFileEvent read GetOnFindFile write SetOnFindFile;
    property OnFindDirectory: THYFindDirectoryEvent read GetOnFindDirectory write SetOnFindDirectory;
    property OnCopyFileStart: THYFileCopyStartEvent read GetOnCopyFileStart write SetOnFileCopyStart;
    property OnCopyFileEnd: THYFileCopyEndEvent read GetOnCopyFileEnd write SetOnCopyFileEnd;
    property OnCopyFileProgress: THYFileCopyProgressEvent read GetOnCopyFileProgress write SetOnCopyFileProgress;
  end;

  { THYDirectoryManager }
  THYDirectoryManager = class(TComponent, IHYDirectoryAttributes)
  private
    fOnFindDirectory: THYFindDirectoryEvent;
    fOnFindFile: THYFindFileEvent;
    fOnCopyFileProgress: THYFileCopyProgressEvent;
    fDirectoryOptions: THYDirectoryOptions;
    fOnFileCopyStart: THYFileCopyStartEvent;
    fOnCopyFileEnd: THYFileCopyEndEvent;
    fCopyBufferSize: integer;

  protected
    { IHYDirectoryAttributes }
    procedure SetOnFindDirectory(const Value: THYFindDirectoryEvent);
    procedure SetOnFindFile(const Value: THYFindFileEvent);
    function GetOnFindDirectory: THYFindDirectoryEvent;
    function GetOnFindFile: THYFindFileEvent;

    // Renamed just in case we want to add some FileOptions later
    function IHYDirectoryAttributes.GetOptions = GetDirectoryOptions;
    procedure IHYDirectoryAttributes.SetOptions = SetDirectoryOptions;

    function GetDirectoryOptions: THYDirectoryOptions;
    procedure SetDirectoryOptions(const Value: THYDirectoryOptions);

    function GetOnCopyFileProgress: THYFileCopyProgressEvent;
    procedure SetOnCopyFileProgress(const Value: THYFileCopyProgressEvent);
    function GetOnCopyFileStart: THYFileCopyStartEvent;
    procedure SetOnFileCopyStart(const Value: THYFileCopyStartEvent);
    function GetOnCopyFileEnd: THYFileCopyEndEvent;
    procedure SetOnCopyFileEnd(const Value: THYFileCopyEndEvent);

    function GetCopyBufferSize: integer;
    procedure SetCopyBufferSize(const Value: integer);

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function NewDirectory(const aName: string): THYDirectory;

  published
    property DirectoryOptions: THYDirectoryOptions read GetDirectoryOptions write SetDirectoryOptions;

    property OnFindFile: THYFindFileEvent read GetOnFindFile write SetOnFindFile;
    property OnFindDirectory: THYFindDirectoryEvent read GetOnFindDirectory write SetOnFindDirectory;
    property OnCopyFileStart: THYFileCopyStartEvent read GetOnCopyFileStart write SetOnFileCopyStart;
    property OnCopyFileEnd: THYFileCopyEndEvent read GetOnCopyFileEnd write SetOnCopyFileEnd;
    property OnCopyFileProgress: THYFileCopyProgressEvent read GetOnCopyFileProgress write SetOnCopyFileProgress;
    property CopyBufferSize: integer read GetCopyBufferSize write SetCopyBufferSize default def_CopyBufferSize;
  end;

{ Quick file routines }
function ReadFileSize(const aFileName: string; out Exists: boolean): integer;

{ Routines to create components from INI file values }
procedure ReadComponent(const Parameters: TStrings; var Reference; IdentClassName: string = id_Class; aOwner: TComponent = NIL);

{ Misc. }
function ReplaceDirMacrosWithPaths(const aPath: string): string;
function ReplacePathsWithDirMacros(const aString: string): string;
function CleanDirectoryString(const aDirectory: string): string;

var
  ApplicationFileName: string = '';
  DirApplication: string = '';
  {$IFDEF MSWINDOWS}
  DirWindows: string = '';
  DirSystem: string = '';
  {$ENDIF}

implementation

uses
  TypInfo, jvVersionInfo;

{ Quick file routines }
function ReadFileSize(const aFileName: string; out Exists: boolean): integer;
begin
  result := 0;
  Exists := FileExists(aFileName);
  if not Exists then Exit
  else with THYFile.Create(NIL, aFileName) do try
    result := Size;
  finally
    Free;
  end;
end;

{ Routines to create components from INI file values }
procedure ReadComponent(const Parameters: TStrings; var Reference; IdentClassName: string = id_Class; aOwner: TComponent = NIL);
var compclassname: string;
    compclass: TComponentClass;
    obj: TComponent;
    i: integer;
    boolval: string;
begin
  // If no component reference is passed, tries to create one
  if (pointer(Reference)=NIL) then begin
    compclassname := Parameters.Values[IdentClassName];
    compclass := TComponentClass(FindClass(compclassname)); // Raises an exception if class is not found

    obj := compclass.Create(aOwner);
    pointer(Reference) := pointer(obj);
  end
  else obj := pointer(Reference);

  // Reads the propety values and assignes them to the reference
  for i := 0 to (Parameters.Count-1) do begin
    if SameText(id_Class, Parameters.Names[i]) then Continue; // Class was already processed

    boolval := UpperCase(Parameters.Values[Parameters.Names[i]]);
    if (boolval='TRUE')
      then SetVariantProp(obj, Parameters.Names[i], TRUE)

    else if (boolval='FALSE')
      then SetVariantProp(obj, Parameters.Names[i], TRUE)

    else SetStrProp(obj, Parameters.Names[i], Parameters.Values[Parameters.Names[i]]);
  end;
end;

{ Misc. }
function CleanDirectoryString(const aDirectory: string): string;
var l: integer;
begin
  result := aDirectory;

  repeat
    l := Length(result);
    if (l<=0) then Break
    else if (result[l]=PathDelim)
      then Delete(result, l, 1)
    else Break;
  until (1=0);
end;

function ReplaceDirMacrosWithPaths(const aPath: string): string;
begin
  result := aPath;

  {$IFDEF MSWINDOWS}
  // Windows directory
  result := StringReplace(result, mcr_Symbol+mcr_Windows, DirWindows, [rfReplaceAll, rfIgnoreCase]);

  // System directory
  result := StringReplace(result, mcr_Symbol+mcr_System, DirSystem, [rfReplaceAll, rfIgnoreCase]);
  {$ENDIF}

  // Application directory
  result := StringReplace(result, mcr_Symbol+mcr_Application, DirApplication, [rfReplaceAll, rfIgnoreCase]);
end;

function ReplacePathsWithDirMacros(const aString: string): string;
begin
  result := aString;

  {$IFDEF MSWINDOWS}
  // Windows directory
  result := StringReplace(result, DirWindows, mcr_Symbol+mcr_Windows, [rfReplaceAll, rfIgnoreCase]);

  // System directory
  result := StringReplace(result, DirSystem, mcr_Symbol+mcr_System, [rfReplaceAll, rfIgnoreCase]);
  {$ENDIF}

  // Application directory
  result := StringReplace(result,
                          DirApplication,
                          mcr_Symbol+mcr_Application, [rfReplaceAll, rfIgnoreCase]);
end;

{ THYCustomFile }
constructor THYCustomFile.Create(aParent: THYDirectory; aSearchRec: TSearchRec);
begin
  inherited Create;

  fDirectory := aParent;
  fFileInfo := aSearchRec;
end;

constructor THYCustomFile.Create(aParent: THYDirectory;
  const aName: string);
var sr: TSearchRec;
begin
  if (FindFirst(ExcludeTrailingPathDelimiter(aName), faAnyFile, sr)=0) then try
    if (aParent=NIL)
      then sr.Name := ExcludeTrailingPathDelimiter(aName);

    Create(aParent, sr);
  finally
    FindClose(sr);
  end
  else raise EHYFileNotFound.CreateFmt(msg_FileNotFound, [aName]);
end;

function THYCustomFile.GetAttributes: integer;
begin
  result := fFileInfo.Attr;
end;

function THYCustomFile.GetFullName: string;
begin
  result := Name;
  if (Directory<>NIL)
    then result := IncludeTrailingPathDelimiter(Directory.FullName)+result;
end;

function THYCustomFile.GetName: string;
begin
  result := fFileInfo.Name;
end;

function THYCustomFile.GetSize: integer;
begin
  result := fFileInfo.Size;
end;

function THYCustomFile.GetTime: TDateTime;
begin
  result := FileDateToDateTime(fFileInfo.Time);
end;

function THYCustomFile.GetVersionString: string;
begin
  try
    with TJvVersionInfo.Create(GetFullName) do
      try
        Result := FileVersion;
      finally
        Free;
      end;
  except
    Result := '';
  end;
end;

procedure THYCustomFile.SetTime(const Value: TDateTime);
var ostime: integer;
begin
  // This actually modifies the last write time
  ostime := DateTimeToFileDate(Value);
  if ({$IFDEF DELPHI5}uHYD5Helpers.{$ENDIF}FileSetDate(FullName, ostime)=S_OK)
    then fFileInfo.Time := ostime
    else RaiseLastOSError;
end;

procedure THYCustomFile.SetAttributes(const Value: integer);
begin
  {$IFDEF MSWINDOWS}
  if (FileSetAttr(FullName, Value)=S_OK)
    then fFileInfo.Attr := Value
    else RaiseLastOSError;
  {$ENDIF}
end;

procedure THYCustomFile.SetName(const Value: string);
var oldname, path: string;
begin
  oldname := FullName;
  path := IncludeTrailingPathDelimiter(ExtractFilePath(oldname));

  if RenameFile(oldname, path+Value)
    then fFileInfo.Name := Value;
end;

function THYCustomFile.GetAttributesString: string;
begin
  SetLength(result, 4);
  FillChar(result[1], 4, 32);
  with fFileInfo do begin
    if (Attr and faReadOnly<>0) then result[1] := 'R';
    if (Attr and faHidden<>0) then result[2] := 'H';
    if (Attr and faSysFile<>0) then result[3] := 'S';
    if (Attr and faArchive<>0) then result[4] := 'A';
  end;
end;


{ THYFile }
constructor THYFile.CreateNew(aParent: THYDirectory; const aName: string; KeepOpen: boolean = TRUE);
begin
  // Creates the actual file
  fStream := TFileStream.Create(aName, fmCreate);
  if not KeepOpen then FreeAndNIL(fStream);

  // The proceeds as usual
  inherited Create(aParent, aName);
end;

destructor THYFile.Destroy;
begin
  if IsOpen
    then Close;
    
  inherited;
end;

procedure THYFile.Close;
begin
  CheckOpen(TRUE);

  FreeAndNIL(fStream);
end;

function THYFile.GetIsOpen: boolean;
begin
  result := (fStream<>NIL);
end;

procedure THYFile.Open(aFileMode: cardinal);
begin
  CheckOpen(FALSE);

  fStream := TFileStream.Create(FullName, aFileMode);
end;

procedure THYFile.CheckOpen(MustBeOpen: boolean);
begin
  if IsOpen and not MustBeOpen
    then raise EHYFileOpenError.Create(msg_FileAlreadyOpen)

  else if not IsOpen and MustBeOpen
    then raise EHYFileClosedError.Create(msg_FileNotOpen);
end;

function THYFile.GetHandle: integer;
begin
  result := 0;
  if (fStream<>NIL)
    then result := fStream.Handle;
end;

procedure THYFile.Delete;
begin
  DeleteFile(FullName);
end;

function THYFile.GetPosition: integer;
begin
  result := -1;
  if IsOpen
    then result := fStream.Position
end;

procedure THYFile.SetPosition(const Value: integer);
begin
  CheckOpen(TRUE);
  fStream.Position := Value;
end;

function THYFile.GetSize: integer;
begin
  if IsOpen
    then result := fStream.Size
    else result := inherited GetSize;
end;

function THYFile.GetLastChunkSize(aStream: TStream; aNormalChunkSize: integer): integer;
begin
  if (aStream.Size-aStream.Position<aNormalChunkSize)
    then result := aStream.Size-aStream.Position
    else result := aNormalChunkSize;
end;

function THYFile.CopyToStream(aDestination: TStream; aCount: integer): integer;
begin
  CheckOpen(TRUE);

  result := GetLastChunkSize(fStream, aCount);

  if (result>0)
    then aDestination.CopyFrom(fStream, result);
end;

function THYFile.CopyFromStream(aSource: TStream; aCount: integer): integer;
begin
  CheckOpen(TRUE);

  result := GetLastChunkSize(aSource, aCount);

  if (result>0)
    then fStream.CopyFrom(aSource, result);
end;

procedure THYFile.Copy(aDestination: string);
var wasopen: boolean;
begin
  wasopen := IsOpen;

  with TFileStream.Create(aDestination, fmCreate) do try
    // If the file is not open, temporarily opens it
    if not wasopen
      then Open(fmOpenRead or fmShareDenyWrite);

    CopyFrom(fStream, fStream.Size);
  finally
    Free;

    if not wasopen
      then Close;
  end;
end;

{ THYDirectory }
procedure THYDirectory.Clear;
begin
  fFiles.Clear;
  fDirectories.Clear;

  fRefreshedFiles := FALSE;
  fRefreshedDirectories := FALSE;
end;

constructor THYDirectory.Create(aParent: THYDirectory; aSearchRec: TSearchRec);
begin
  inherited;

  fOptions := [doPropagateAttributes];
  fCopyBufferSize := def_CopyBufferSize;
  fFileMask := AnyFile;

  fFiles := TObjectList.Create;
  fDirectories := TObjectList.Create;
end;

destructor THYDirectory.Destroy;
begin
  FreeAndNIL(fFiles);
  FreeAndNIL(fDirectories);
  FreeAndNIL(fSavedDirectories);
  
  inherited;
end;

function THYDirectory.GetDirectories(Index: integer): THYDirectory;
begin
  result := THYDirectory(fDirectories[Index]);
end;

function THYDirectory.CreateDirectoryObject(aParent: THYDirectory;
  aSearchRec: TSearchRec): THYDirectory;
begin
  result := THYDirectory.Create(aParent, aSearchRec);

  // Propagates the event handlers to children if needed
  if (doPropagateAttributes in Options)
    then result.AssignAttributes(Self);
end;

function THYDirectory.CreateFileObject(aParent: THYDirectory;
  aSearchRec: TSearchRec): THYFile;
begin
  result := THYFile.Create(aParent, aSearchRec);
end;

function THYDirectory.GetDirectoryCount: integer;
begin
  result := fDirectories.Count;
end;

function THYDirectory.GetFileCount: integer;
begin
  result := fFiles.Count;
end;

function THYDirectory.GetFiles(Index: integer): THYFile;
begin
  result := THYFile(fFiles[Index]);
end;

function THYDirectory.Refresh(const aFileMask: string;
                     Options: THYDirectoryRefreshOptions;
                     Recursive: boolean = FALSE;
                     aSearchAttr: integer = faArchiveAndDirectory): integer;
var dirinfo: TSearchRec;
    newfile: THYFile;
    newdir: THYDirectory;
    accept: boolean;
begin
  result := 0;
  fFileMask := aFileMask;


  if (roDirectories in Options) then begin
    fDirectories.Clear;
    fRefreshedDirectories := TRUE;

    // Changes the current directory
    PushDir;
    ChDir(FullName);
    try
      // Searches directories first
      if (FindFirst(FullName+PathDelim+AnyFile, faDirectory, dirinfo)=0) then begin
        repeat
          accept := TRUE;

          if (dirinfo.Name[1]='.')
            then Continue

          else if (dirinfo.Attr and faDirectory<>0) then begin
            newdir := CreateDirectoryObject(Self, dirinfo);

            if Assigned(fOnFindDirectory)
              then fOnFindDirectory(Self, newdir, accept);

            if accept then begin
              fDirectories.Add(newdir);

              if Recursive
                then Inc(result, newdir.Refresh(aFileMask, Options, Recursive, aSearchAttr)+1)
                else Inc(result, 1);
            end;
          end;
        until (FindNext(dirinfo)<>0);

        FindClose(dirinfo);
      end;
    finally
      // Restores the current directory
      PopDir;
    end;
  end;

  // Searches files
  if (roFiles in Options) then begin
    fFiles.Clear;
    fRefreshedFiles := TRUE;
    
    if (FindFirst(FullName+PathDelim+FileMask, aSearchAttr, dirinfo)=0) then begin
      repeat
        accept := TRUE;

        if (dirinfo.Attr and faDirectory=0) then begin
          newfile := CreateFileObject(Self, dirinfo);

          if Assigned(fOnFindFile) then fOnFindFile(Self, newfile, accept);

          if accept then begin
            fFiles.Add(newfile);
            Inc(result);
          end;
        end;

      until (FindNext(dirinfo)<>0);

      FindClose(dirinfo);
    end;
  end;
end;

procedure THYDirectory.AssignAttributes(const Source: IHYDirectoryAttributes);
begin
  Options:= Source.Options;
  CopyBufferSize := Source.CopyBufferSize;
  OnFindFile := Source.OnFindFile;
  OnFindDirectory := Source.OnFindDirectory;
  OnCopyFileProgress := Source.OnCopyFileProgress;
  OnCopyFileStart := Source.OnCopyFileStart;
  OnCopyFileEnd := Source.OnCopyFileEnd;
end;

procedure THYDirectory.PropagateAttributes;
var i: integer;
begin
  for i := 0 to (DirectoryCount-1) do
    Directories[i].AssignAttributes(Self);
end;

function THYDirectory.PopDir: boolean;
var dirs: TStringList;
begin
  result := FALSE;
  dirs := GetSavedDirectoriesList;

  if (dirs.Count=0)
    then Exit;

  {$I+}
  ChDir(dirs[dirs.Count-1]);
  dirs.Delete(dirs.Count-1);
  {$I-}

  result := TRUE;
end;

function THYDirectory.GetSavedDirectoriesList: TStringList;
begin
  if (fSavedDirectories=NIL)
    then fSavedDirectories := TStringList.Create;

  result := fSavedDirectories
end;

procedure THYDirectory.PushDir;
var thedir: string;
begin
  GetDir(0, thedir);
  GetSavedDirectoriesList.Add(thedir);
end;

function THYDirectory.GetSize: integer;
var sze, i: integer;
begin
  result := 0;

  for i := 0 to (DirectoryCount-1) do begin
    sze := Directories[i].Size;
    Inc(result, sze);
  end;

  for i := 0 to (FileCount-1) do begin
    sze := Files[i].Size;
    Inc(result, sze);
  end;
end;

procedure THYDirectory.CopyFiles(const aDestinationDirectory: string;
  const aList: array of string);
var i: integer;
begin
  for i := 0 to High(aList) do begin
    CopyFile(aList[i], aDestinationDirectory);
  end;
end;

procedure THYDirectory.CopyFile(const aFileName, aDestinationDirectory: string);
var source, dest: THYFile;
begin
  source := NIL;
  dest := NIL;

  try
    source := THYFile.Create(NIL, aFileName);
    source.Open(fmOpenRead+fmShareDenyWrite);

    dest := THYFile.CreateNew(NIL, IncludeTrailingPathDelimiter(aDestinationDirectory)+ExtractFileName(aFileName));

    if Assigned(fOnFileCopyStart)
      then fOnFileCopyStart(Self, source, aDestinationDirectory);
      
    repeat
      if Assigned(fOnCopyFileProgress)
        then fOnCopyFileProgress(Self, source, aDestinationDirectory, source.Stream.Position, source.Size);
    until (dest.CopyFromStream(source.Stream, CopyBufferSize)<=0);

    if Assigned(fOnFileCopyEnd)
      then fOnFileCopyEnd(Self, source, dest);

  finally
    source.Free;
    dest.Free;
  end;
end;

procedure THYDirectory.SetOnFindDirectory(
  const Value: THYFindDirectoryEvent);
begin
  fOnFindDirectory := Value;

  if (doPropagateAttributes in Options)
    then PropagateAttributes;
end;

procedure THYDirectory.SetOnFindFile(const Value: THYFindFileEvent);
begin
  fOnFindFile := Value;

  if (doPropagateAttributes in Options)
    then PropagateAttributes;
end;

function THYDirectory.GetOnFindDirectory: THYFindDirectoryEvent;
begin
  result := fOnFindDirectory
end;

function THYDirectory.GetOnFindFile: THYFindFileEvent;
begin
  result := fOnFindFile
end;

function THYDirectory.GetOptions: THYDirectoryOptions;
begin
  result := fOptions
end;

procedure THYDirectory.SetOptions(const Value: THYDirectoryOptions);
begin
  fOptions := Value
end;

function THYDirectory.GetOnCopyFileProgress: THYFileCopyProgressEvent;
begin
  result := fOnCopyFileProgress
end;

procedure THYDirectory.SetOnCopyFileProgress(
  const Value: THYFileCopyProgressEvent);
begin
  fOnCopyFileProgress := Value;

  if (doPropagateAttributes in Options)
    then PropagateAttributes;
end;

function THYDirectory.GetOnCopyFileStart: THYFileCopyStartEvent;
begin
  result := fOnFileCopyStart
end;

procedure THYDirectory.SetOnFileCopyStart(
  const Value: THYFileCopyStartEvent);
begin
  fOnFileCopyStart := Value;

  if (doPropagateAttributes in Options)
    then PropagateAttributes;
end;

function THYDirectory.GetOnCopyFileEnd: THYFileCopyEndEvent;
begin
  result := fOnFileCopyEnd
end;

procedure THYDirectory.SetOnCopyFileEnd(const Value: THYFileCopyEndEvent);
begin
  fOnFileCopyEnd := Value
end;

function THYDirectory.GetCopyBufferSize: integer;
begin
  result := fCopyBufferSize;
end;

procedure THYDirectory.SetCopyBufferSize(const Value: integer);
begin
  fCopyBufferSize  := Value;
end;

function THYDirectory.GetSavedDirectories(Index: integer): string;
begin
  result := GetSavedDirectoriesList[Index]
end;

function THYDirectory.GetSavedDirectoryCount: integer;
begin
  result := GetSavedDirectoriesList.Count
end;

procedure THYDirectory.ClearSavedDirectoriesList;
begin
  GetSavedDirectoriesList.Clear;
end;

{ THYDirectoryManager }

constructor THYDirectoryManager.Create(aOwner: TComponent);
begin
  fDirectoryOptions := [doPropagateAttributes];
  fCopyBufferSize := def_CopyBufferSize;

  inherited;
end;

destructor THYDirectoryManager.Destroy;
begin
  inherited;
end;

function THYDirectoryManager.GetOnFindDirectory: THYFindDirectoryEvent;
begin
  result := fOnFindDirectory
end;

function THYDirectoryManager.GetOnFindFile: THYFindFileEvent;
begin
  result := fOnFindFile
end;

function THYDirectoryManager.GetDirectoryOptions: THYDirectoryOptions;
begin
  result := fDirectoryOptions
end;

function THYDirectoryManager.NewDirectory(const aName: string): THYDirectory;
var ok: boolean;
begin
  result := THYDirectory.Create(NIL, aName);

  // Copies the relevant properties
  result.AssignAttributes(Self);

  // Triggers the event for the new directory
  ok := TRUE;
  if Assigned(fOnFindDirectory) then fOnFindDirectory(result, result, ok);
  if not ok
    then FreeAndNIL(result);
end;

procedure THYDirectoryManager.SetOnFindDirectory(
  const Value: THYFindDirectoryEvent);
begin
  fOnFindDirectory := Value;
end;

procedure THYDirectoryManager.SetOnFindFile(const Value: THYFindFileEvent);
begin
  fOnFindFile := Value;
end;

procedure THYDirectoryManager.SetDirectoryOptions(const Value: THYDirectoryOptions);
begin
  fDirectoryOptions := Value;
end;

function THYDirectoryManager.GetOnCopyFileProgress: THYFileCopyProgressEvent;
begin
  result := fOnCopyFileProgress;
end;

procedure THYDirectoryManager.SetOnCopyFileProgress(
  const Value: THYFileCopyProgressEvent);
begin
  fOnCopyFileProgress := Value;
end;

function THYDirectoryManager.GetOnCopyFileStart: THYFileCopyStartEvent;
begin
  result := fOnFileCopyStart
end;

procedure THYDirectoryManager.SetOnFileCopyStart(
  const Value: THYFileCopyStartEvent);
begin
  fOnFileCopyStart := Value
end;

function THYDirectoryManager.GetOnCopyFileEnd: THYFileCopyEndEvent;
begin
  result := fOnCopyFileEnd
end;

procedure THYDirectoryManager.SetOnCopyFileEnd(
  const Value: THYFileCopyEndEvent);
begin
  fOnCopyFileEnd := Value
end;

function THYDirectoryManager.GetCopyBufferSize: integer;
begin
  result := fCopyBufferSize
end;

procedure THYDirectoryManager.SetCopyBufferSize(const Value: integer);
begin
  fCopyBufferSize := Value
end;

{$IFDEF MSWINDOWS}
type TTempArray = array[0..199] of char;
var buf: ^TTempArray;
{$ENDIF}

initialization
  ApplicationFileName := ParamStr(0);
  DirApplication := ExcludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0)));

  {$IFDEF MSWINDOWS}
  New(buf);
  try
    // Windows directory
    GetWindowsDirectory(buf^, SizeOf(TTempArray));
    DirWindows := ExcludeTrailingPathDelimiter(buf^);

    // System directory
    GetSystemDirectory(buf^, SizeOf(TTempArray));
    DirSystem := ExcludeTrailingPathDelimiter(buf^);
  finally
    Dispose(buf);
  end;
  {$ENDIF}
end.
