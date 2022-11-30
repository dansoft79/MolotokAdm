//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Восстановление базы данных в облако
//
//------------------------------------------------------------------------------
unit URestoreCloud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, ComCtrls, ShlObj, cxShellCommon, cxShellListView;

type
  TRestoreCloudForm = class(TForm)
    OpenDialog: TOpenDialog;
  private
    { Private declarations }
  public
    { Public declarations }
    function RestoreBackupCloud : boolean;
  end;

function RestoreDatabaseCloud : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, MesDlg, UConnectParams;

var
  vHost, vDatabase, vUser, vPassword, vProtocol, vPort, vParams : String;

function RestoreDatabaseCloud : boolean;
begin
  with TRestoreCloudForm.Create(nil) do
    try
      vHost := Server;
      vDatabase := '';
      vUser := User;
      vPassword := Password;
      vProtocol := Protocol;
      vPort := Port;
      vParams := Params;

      if not ConnectParams(vHost, vDatabase, vUser, vPassword, vProtocol, vPort, vParams) then
        Exit;

      Result := RestoreBackupCloud;
    finally
      Free;
    end;
end;

function TRestoreCloudForm.RestoreBackupCloud: boolean;
  var
    s, t : string;
begin
  OpenDialog.InitialDir := cABSBackupDir;

  Result := OpenDialog.Execute;

  if Result then
  begin
    //извлекаем из бакапа sql файл
    s := OpenDialog.FileName;
    Result := UnpackBackup(s, t);

    if Result then
    begin
      //восстанавливаем бакап
      Result := RestoreDatabaseBackupCloud(t, vHost, vDatabase, vUser, vPassword, vProtocol, vPort, vParams) = 0;
      Sysutils.DeleteFile(t);
      if not Result then ShowMsg('Резервную копию базы данных восстановить не удалось!', smtError, [smbOK], smbOK, smbOK);
    end
    else ShowMsg('Резервную копию базы данных распаковать не удалось!', smtError, [smbOK], smbOK, smbOK);
  end;
end;

end.
