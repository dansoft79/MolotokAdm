//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Параметры подключения
//
//------------------------------------------------------------------------------
unit UConnectParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, cxEdit, cxTextEdit, cxControls, cxContainer,
  cxListBox, cxMaskEdit, cxSpinEdit, cxMemo, cxGraphics, cxDropDownEdit,
  cxMRUEdit, dxSkinsCore, dxSkinsDefaultPainters, cxLookAndFeels, cxButtonEdit,
  ZAbstractConnection, ZConnection, cxLabel;

type
  TConnectParamsForm = class(TForm)
    eUser: TcxTextEdit;
    ePassword: TcxTextEdit;
    eProtocol: TcxTextEdit;
    ePort: TcxSpinEdit;
    mParams: TcxMemo;
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    eDatabase: TcxTextEdit;
    eHost: TcxTextEdit;
    bSelect: TcxButton;
    bCheck: TcxButton;
    Connection: TZConnection;
    Label2: TcxLabel;
    lDatabase: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    Label6: TcxLabel;
    Label12: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure ePropertiesChange(Sender: TObject);
    procedure eHostKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bSelectClick(Sender: TObject);
    procedure bCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetEnabledButtons;
  end;

function ConnectParams(var AHost, ADatabase, AUser, APassword, AProtocol, APort, AParams : String) : boolean;

implementation

{$R *.dfm}

uses
  UUtil, UOptions, USplash, USelectTypeMemData, UConnectionDatabase, mesdlg;

function ConnectParams(var AHost, ADatabase, AUser, APassword, AProtocol, APort, AParams : String) : boolean;
begin
  with TConnectParamsForm.Create(nil) do
    try
      eHost.Text := AHost;

      if ADatabase <> '' then
      begin
        eDatabase.Text := ADatabase;
        eDatabase.Visible := true;
        lDatabase.Visible := true;
      end
      else
      begin
        eDatabase.Visible := false;
        lDatabase.Visible := false;
      end;

      eUser.Text := AUser;
      ePassword.Text := APassword;
      eProtocol.Text := AProtocol;
      ePort.Text := APort;

      mParams.Lines.Delimiter := ';';
      mParams.Lines.StrictDelimiter := true;
      mParams.Lines.DelimitedText := AParams;

      Result := ShowModal = mrOK;

      if Result then
      begin
        AHost := eHost.Text;
        ADatabase := eDatabase.Text;
        AUser := eUser.Text;
        APassword := ePassword.Text;
        AProtocol := eProtocol.Text;
        APort := ePort.Text;
        AParams := mParams.Lines.DelimitedText;
      end;
    finally
      Free;
    end;
end;

procedure TConnectParamsForm.bCheckClick(Sender: TObject);
begin
  Connection.Disconnect;
  Connection.Hostname := eHost.Text;
  Connection.Database := eDatabase.Text;
  Connection.Protocol := eProtocol.Text;
  Connection.Port := ePort.Value;
  Connection.User := eUser.Text;
  Connection.Password := ePassword.Text;
  Connection.Properties.Text := mParams.Text;
  try
    Connection.Connect;
    if Connection.Connected then
      ShowMsg('Подключение произошло успешно!', smtInformation);
  except
    On E: Exception do
      ShowMsg('Во время проверки подключения произошла ошибка:' + #13#10 + E.Message, smtError);
  end;
end;

procedure TConnectParamsForm.bSelectClick(Sender: TObject);
  var
    vFields : string;
begin
  vFields := SelectTypeMemData('Выбор сохраненного подключения', cIniFileNameDatas, 'server=Сервер;database=База данных;protocol=Протокол;port=Порт;user=Пользователь;password=Пароль;params=Параметры;comment=Комментарии', 788800);
  if vFields <> '' then
  begin
    eHost.Text := GetParamValue(vFields, 'server');
    eDatabase.Text := GetParamValue(vFields, 'database');
    eProtocol.Text := GetParamValue(vFields, 'protocol');
    ePort.Text := GetParamValue(vFields, 'port');
    eUser.Text := GetParamValue(vFields, 'user');
    ePassword.Text := GetParamValue(vFields, 'password');
    mParams.Text := GetParamValue(vFields, 'params');
  end;
end;

procedure TConnectParamsForm.eHostKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TConnectParamsForm.ePropertiesChange(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TConnectParamsForm.SetEnabledButtons;
begin
  bOK.Enabled :=
    (Trim(eHost.Text) <> '') and
    ((Trim(eDatabase.Text) <> '') or not eDatabase.Visible)and
    (Trim(eUser.Text) <> '') and
    (Trim(eProtocol.Text) <> '') and
    (ePort.Value <> 0);
end;

procedure TConnectParamsForm.FormShow(Sender: TObject);
begin
  if Assigned(SplashForm) then HideSplash;

  SetEnabledButtons;
end;

end.
