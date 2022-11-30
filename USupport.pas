//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Техническая поддержка
//
//------------------------------------------------------------------------------
unit USupport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, DBClient, Menus,
  cxLookAndFeelPainters, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxButtons, cxGraphics, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLabel, cxMemo, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, cxPropertiesStore,
  cxButtonEdit, Mask,  cxShellBrowserDialog, dxSkinsCore,
  dxSkinsDefaultPainters, SOAPConn, SOAPMidas, cxLookAndFeels;

type
  ISupportDatas = interface(IAppServerSOAP)
   ['{83DCBC2A-97D8-4A2C-8CB0-E12CA2219BCC}']
    Function SendSupportMessage(AEMail: string; AName: string;AType: string;  AText: string; AMailed: integer; ASoft: string; AVersion: string; AFile: string; AFileName: string): integer; stdcall;
    function GetFileSize:integer; stdcall;
  end;

  TSupportForm = class(TForm)
    HTTP: TIdHTTP;
    PropertiesStore: TcxPropertiesStore;
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    cbMailed: TcxCheckBox;
    Label3: TcxLabel;
    Label1: TcxLabel;
    Label2: TcxLabel;
    cxLabel1: TcxLabel;
    lFile: TcxLabel;
    eMail: TcxTextEdit;
    eName: TcxTextEdit;
    cbMessageType: TcxComboBox;
    eAtachFile: TcxButtonEdit;
    OpenDialog: TcxShellBrowserDialog;
    eText: TcxMemo;
    Connection: TSoapConnection;
    procedure eChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eAtachFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure eKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FFileSize: integer;
  public
    { Public declarations }
    procedure SetOKEnabled;

    procedure SendSupportMessage;
  end;

function ShowSupport: boolean;

implementation

{$R *.dfm}

uses
  UDatas, UConsts, DTKUtils, UUtil, UWaiting, MainUnit, jclFileUtils,
  LbString, mesdlg, UOptions, InvokeRegistry, jvVersionInfo;

function GetBooleanValue(Flag: boolean): integer;
Begin
  If Flag Then Result := 1 else Result := 0;
End;

function ShowSupport: boolean;
begin
  with TSupportForm.Create(nil) do
    try
      cbMessageType.ItemIndex := 0;

      Result := ShowModal = mrOK;

      if Result then
        SendSupportMessage;
    finally
      Free;
    end;
end;

procedure TSupportForm.eKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    FindNextControl(TWinControl(Sender), true, true, false).SetFocus;
  end;
end;

procedure TSupportForm.eAtachFilePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenDialog.Execute then
    if not FileExists(OpenDialog.Path) then ShowMsg('Файл не найден!', smtInformation, [smbOK], smbOK, smbOK)
    else
    begin
      eAtachFile.Text := OpenDialog.Path
    end;
end;

procedure TSupportForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TSupportForm.SendSupportMessage;
  var
    s : string;
    path, ServAdr : string;
    vFile: TStream;
    vStr: TStringStream;
    vRes : integer;
    vFileName: string;
    vRecFile: string;
    vAdr : TStringList;
    ServUser, ServPass: string;
    FSupportDatas : ISupportDatas;
    b : boolean;
    vName, vVer : string;
begin
  Application.ProcessMessages;
  ShowWaiting('Подключение к сети Internet...');
  b := false;
  try
    s := http.Get('http://www.ciritas.ru/supportparams.html');// получаем адрес сервиса регистрации
//    s := http.Get('http://kirill/Scripts/SupportParams.html');// получаем адрес сервиса регистрации
    b := true;
  except
  end;
  HideWaiting;

  if b then
  begin
    //параметры
    vAdr := TStringList.Create;
    vAdr.Text := s;
    ServAdr := vAdr.Values['server'];
    path := vAdr.Values['path'];
    if path <> '' then
      path := path + '/';
    ServUser := vAdr.Values['user'];
    ServPass := vAdr.Values['password'];
    ServAdr := 'http://' + ServAdr + '/' + Path + 'STOwnerService.exe/soap/IRegDatas';
    vAdr.Free;

    Connection.URL := ServAdr;

    if ServUser <> '' then Connection.UserName := ServUser;
    if ServPass <> '' then Connection.Password := ServPass;

    if Connection.Connected then Connection.Close;

    b := false;
    try
      Connection.Open;
      FSupportDatas := Connection.RIO as ISupportDatas;
      ShowWaiting('Подключение к сети Internet...');
      try
        FFileSize := FSupportDatas.GetFileSize;
      finally
        HideWaiting;
      end;
      b := true;
    except
      ShowMsg('Не удалось получить параметры сервера поддержки!', smtWarning, [smbOK], smbOK, smbOK);
    end;

    if b then
    begin
      if (Trim(eAtachFile.Text) <> '') and FileExists(eAtachFile.Text) then
      Begin

        if GetFileSize(OpenDialog.Path) > FFileSize then
        begin
          vRecFile := '';
          vFileName := '';
          ShowMsg('Размер прикрепляемого файла не может быть больше ' + IntToStr(FFileSize) + ' байт!', smtWarning, [smbOK], smbOK, smbOK)
        end
        else
        begin
          eAtachFile.Text := OpenDialog.Path;

          vFile := TFileStream.Create(eAtachFile.Text,fmOpenRead);
          vFile.Position := 0;
          vStr := TStringStream.Create('');
          try
            LbEncodeBase64(vFile, vStr);
            vRecFile := vStr.DataString;
            vFileName := ExtractFileName(eAtachFile.Text);
          finally
            vStr.Free;
            vFile.Free;
          end;
        end;
      End;

      try
        ShowWaiting('Отправка сообщения...');
        vName := AppVerInfo.ProductName;
        vVer := AppVerInfo.FileVersion;
        try
          vRes :=
            FSupportDatas.SendSupportMessage(
              LowerCase(EMail.Text),
              eName.Text,
              cbMessageType.Text,
              eText.Text,
              GetBooleanValue(cbMailed.Checked),
              vName,
              vVer,
              vRecFile ,
              vFileName);
          case vRes of
          1 : ShowMsg('В данный момент сообщение не может быть принято!', smtError, [smbOK], smbOK, smbOK);
          end;
        finally
          HideWaiting;
        end;
      except
        ShowMsg('Ошибка отправки сообщения', smtError, [smbOK], smbOK, smbOK);
      end;
      Connection.Close;
    end;

    HideWaiting;
  end
  else
    ShowMsg('Не удалось подключиться к сети Internet!', smtError, [smbOK], smbOK, smbOK);

  FSupportDatas := nil;
end;

procedure TSupportForm.SetOKEnabled;
begin
  bOK.Enabled :=
    (Trim(eName.Text) <> '') and
    (Trim(eMail.Text)<> '') and
    (cbMessageType.ItemIndex <> -1) and
    (trim(eText.Text) <> '');
end;

procedure TSupportForm.FormCreate(Sender: TObject);
begin
  PropertiesStore.StorageName := cIniFileName;
  PropertiesStore.RestoreFrom;
end;

procedure TSupportForm.FormDestroy(Sender: TObject);
begin
  PropertiesStore.StoreTo(false);
end;

procedure TSupportForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ISupportDatas), 'urn:USupportDatas-ISupportDatas');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISupportDatas), 'urn:USupportDatas-ISupportDatas#SendSupportMessage');
end.
