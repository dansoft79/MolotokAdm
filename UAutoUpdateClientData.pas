//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Автообновление
//
//------------------------------------------------------------------------------
unit UAutoUpdateClientData;

interface

uses
  SysUtils, Classes, uROClient, uRORemoteService,
  uHYAutoUpdateClient, uHYFileUtils, HydraAutoUpdate_Intf,
  uROWinInetHttpChannel, uROBinMessage, uROProxy,
  UROTransportChannel, UROMessage;

{ TODO:
    -riguardare UpdateID e come si gestisce
}

const
  { INI sections }
  sect_Configuration = 'Configuration';
  sect_AutoUpdateClient = 'AutoUpdateClient';
  sect_Message = 'Message';
  sect_Channel = 'Channel';
  sect_Directories = 'Directories';

  id_LastUpdateID = 'LastUpdateID';
  id_ServiceName = 'ServiceName';
  id_Interactive = 'Interactive';
  id_ForceDownload = 'ForceDownload';

  { Messages }
  msg_CannotFindINIFile = 'Не найден файл инициализации %s';
  msg_UnknownClass      = 'Неизвестный класс %s';

type
  { Forwards }
  TAutoUpdateClientData = class;

  { Events }
  TOnResetUpdates = procedure(Sender : TAutoUpdateClientData; anUpdateList : THYFileUpdateInfoArray) of object;

  { TAutoUpdateClientData }
  TAutoUpdateClientData = class(TDataModule)
  private
    fCanResume : boolean;
    fLastUpdateID : string;
    fFileUpdateHelper : THYFileUpdateHelper;
    fChannel : TROTransportChannel;
    fMessage : TROMessage;
    fUpdates: THYFileUpdateInfoArray;
    fOnResetUpdates: TOnResetUpdates;
    fInteractive: boolean;
    fINIFileName: string;
    fForceDownload: boolean;

    procedure SetUpdates(const Value: THYFileUpdateInfoArray);

  protected
    procedure ReadConfiguration; 
    procedure UpdateLastUpdateID;

  public
    AutoUpdateClient: THYAutoUpdateClient;

    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;

    { Methods }
    function CheckForUpdates : boolean;
    function DownloadUpdates : boolean;

    { Properties }
    property Channel : TROTransportChannel read fChannel;
    property Message : TROMessage read fMessage;
    property Updates : THYFileUpdateInfoArray read fUpdates write SetUpdates;

    property CanResume : boolean read fCanResume;

    property OnResetUpdates : TOnResetUpdates read fOnResetUpdates write fOnResetUpdates;

    property ForceDownload : boolean read fForceDownload;
    property Interactive : boolean read fInteractive;

    property INIFileName : string read fINIFileName;
  end;

var
  AutoUpdateClientData: TAutoUpdateClientData;

implementation

uses
  Forms, INIFiles, UOptions;

{$R *.dfm}
constructor TAutoUpdateClientData.Create(aOwner: TComponent);
  var
    s : string;
begin
  inherited;

  AutoUpdateClient := THYAutoUpdateClient.Create(Self);

  s := ChangeFileExt(ExtractFileName(Application.ExeName), '');
  s := CurrentDir + s + 'Updater.ini';

  fINIFileName := s;
  fFileUpdateHelper := THYFileUpdateHelper.Create;

  ReadConfiguration; // fChannel and fMessage are created there
end;

destructor TAutoUpdateClientData.Destroy;
begin
  FreeAndNIL(fChannel);
  FreeAndNIL(fMessage);

  FreeAndNIL(fUpdates);
  FreeAndNIL(fFileUpdateHelper);

  inherited;
end;

procedure TAutoUpdateClientData.ReadConfiguration;
var ini : TINIFile;
    list : TStringList;
begin
  if not FileExists(INIFileName)
    then raise Exception.CreateFmt(msg_CannotFindINIFile, [INIFileName]);

  ini := TIniFile.Create(INIFileName);
  list := TStringList.Create;

  try
    // If no UpdateID is provided, it defaults to the directory name
    fLastUpdateID := ini.ReadString(sect_Configuration, id_LastUpdateID, DirApplication);
    fInteractive := ini.ReadBool(sect_Configuration, id_Interactive, TRUE);
    fForceDownload := ini.ReadBool(sect_Configuration, id_ForceDownload, TRUE);

    // Reads the names of the directories where to peform file searches
    ini.ReadSectionValues(sect_Directories, list);
    ParseSearchInfoDirectories(AutoUpdateClient.FileSearchInfo, list);

    // Reads the parameters associated to the AutoUpdateClient
    ini.ReadSectionValues(sect_AutoUpdateClient, list);
    ReadComponent(list, AutoUpdateClient);

    // Reads the parmeters about the message class, creates it and associates it
    // to the AutoUpdateClient
    ini.ReadSectionValues(sect_Message, list);
    ReadComponent(list, fMessage);
    AutoUpdateClient.Message := fMessage;

    // Reads the parmeters about the channel class, creates it and associates it
    // to the AutoUpdateClient
    ini.ReadSectionValues(sect_Channel, list);
    ReadComponent(list, fChannel);
    AutoUpdateClient.Channel := fChannel;
  finally
    ini.Free;
    list.Free;
  end;
end;

procedure TAutoUpdateClientData.UpdateLastUpdateID;
var ini : TINIFile;
begin
  ini := TIniFile.Create(INIFileName);
  try
    ini.WriteString(sect_Configuration, id_LastUpdateID, fLastUpdateID);
  finally
    ini.Free;
  end;
end;

procedure TAutoUpdateClientData.SetUpdates(
  const Value: THYFileUpdateInfoArray);
begin
  if (Value=fUpdates) then Exit;

  FreeAndNIL(fUpdates); // Discards whatever previously set
  fUpdates := Value;

  if Assigned(OnResetUpdates)
    then fOnResetUpdates(Self, fUpdates);
end;

function TAutoUpdateClientData.CheckForUpdates : boolean;
var currupdateid, userdata : string;
begin
  result := FALSE;
  fCanResume := FALSE;

  FreeAndNIL(fUpdates);
  try
    // Checks to see if there are any updates. If the download is forced, ignores this step and continues to
    // get the actual list of updates required
    if not ForceDownload and (AutoUpdateClient.VerifyUpdateStatus(fLastUpdateID, currupdateid, userdata)=usNoUpdates)
      then Exit;

    fLastUpdateID := currupdateid;
    
    // Retrieves the list of updates from the server and stores it in the
    // private field "fUpdates" (THYFileUpdateInfoArray) by using the property
    // Updates. Updates has a property setter SetUpdates which updates the
    // listview in the application's mainform
    Updates := AutoUpdateClient.GetUpdatesInfo(fLastUpdateID, fCanResume);
  finally
    result := (Updates<>NIL) and (Updates.Count>0);
  end;
end;

function TAutoUpdateClientData.DownloadUpdates : boolean;
begin
  with AutoUpdateClient do begin
    result := DownloadUpdates(Updates);
    if result then begin
      result := FinalizeUpdate(Updates);

      // Finally updates the LastUpdateID in the ini file
      UpdateLastUpdateID;
    end;
  end;
end;

end.
