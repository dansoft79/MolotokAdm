//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Резервное копирование
//
//------------------------------------------------------------------------------
unit UBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, cxShellBrowserDialog, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxPropertiesStore;

type
  TBackupForm = class(TForm)
    SaveDialog: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
    function SaveBackup : boolean;
  end;

function BackupDatabase : boolean;

implementation

{$R *.dfm}

uses
  UOptions, UDatas, jclfileutils, DTKUtils, UUtil, strUtils, DateUtils,
  mesDlg;

function BackupDatabase : boolean;
begin
  with TBackupForm.Create(nil) do
    try
      Result := SaveBackup;
    finally
      Free;
    end;
end;

function TBackupForm.SaveBackup: boolean;
  var
    vNow : TDateTime;
    s, t, s1, s2 : string;
begin
  vNow := Now;

  s :=
    Datas.ZConnection.Database + '-' +
    ReplaceStr(DateToSQLDate(vNow), '.', '') + '-' +
    ReplaceStr(TimeToStr(TimeOf(vNow)), ':', '') + '.bak';

  SaveDialog.InitialDir := cABSBackupDir;
  SaveDialog.FileName := s;

  Result := SaveDialog.Execute;

  if Result then
  begin
    //сохраняем бакап
    t := ChangeFileExt(SaveDialog.FileName, '.sql');
    s := SaveDialog.FileName;
    Result := CreateDatabaseBackup(t) = 0;
    if Result then
    begin
      Result := PackBackup(t, s);
      if Result then
      begin
        sysutils.DeleteFile(t);
        s1 := ExtractFilePath(t);
        s1 := CorrectPath(s1);
        s2 := cABSBackupDir;
        s2 := CorrectPath(s2);
        if s1 <> s2 then
          if ShowMsg('Запомнить путь для сохранения резервных копий?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
          begin
            cBackupDir := s1;
            cABSBackupDir := s1;
          end;
      end
      else ShowMsg('Резервную копию базы данных сжать не удалось!', smtError, [smbOK], smbOK, smbOK);
    end
    else
    begin
      ShowMsg('Резервную копию базы данных создать не удалось!', smtError, [smbOK], smbOK, smbOK);
    end;
  end;
end;

end.
