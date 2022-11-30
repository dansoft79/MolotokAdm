//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ������������� ���� ������ �� ������� ������
//
//------------------------------------------------------------------------------
unit URestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, ComCtrls, ShlObj, cxShellCommon, cxShellListView;

type
  TRestoreForm = class(TForm)
    OpenDialog: TOpenDialog;
  private
    { Private declarations }
  public
    { Public declarations }
    function RestoreBackup : boolean;    
  end;

function RestoreDatabase : boolean;

implementation

{$R *.dfm}

uses
  UDatas, DTKUtils, UConsts, UOptions, UUtil, MesDlg;

function RestoreDatabase : boolean;
begin
  with TRestoreForm.Create(nil) do
    try
      Result := RestoreBackup;
    finally
      Free;
    end;
end;

function TRestoreForm.RestoreBackup: boolean;
  var
    s, t : string;
begin
  OpenDialog.InitialDir := cABSBackupDir;

  Result := OpenDialog.Execute;

  if Result then
  begin
    //��������� �� ������ sql ����
    s := OpenDialog.FileName;
    Result := UnpackBackup(s, t);

    if Result then
    begin
      //��������������� �����
      Result := RestoreDatabaseBackup(t) = 0;
      Sysutils.DeleteFile(t);
      if not Result then ShowMsg('��������� ����� ���� ������ ������������ �� �������!', smtError, [smbOK], smbOK, smbOK);
    end
    else ShowMsg('��������� ����� ���� ������ ����������� �� �������!', smtError, [smbOK], smbOK, smbOK);
  end;
end;

end.
