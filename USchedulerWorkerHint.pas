//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно хинта шедулера для рабочего
//
//------------------------------------------------------------------------------
unit USchedulerWorkerHint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, Vcl.ExtCtrls;

type
  TSchedulerWorkerHintForm = class(TForm)
    lFIO: TcxLabel;
    lText: TcxLabel;
    Timer: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIDWorker: integer;
    procedure SetIDWorker(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property IDWorker : integer read FIDWorker write SetIDWorker;
    procedure FillWorker;
  end;

var
  WorkerHintVisible : boolean = false;
  SchedulerWorkerHintForm : TSchedulerWorkerHintForm = nil;
  IDWorkerLast : integer = 0;

procedure ShowWorkerHint(AIDWorker : integer);

procedure HideWorkerHint;

implementation

{$R *.dfm}

uses
  UDatas, UUtil, DTKUtils, StrUtils;

procedure ShowWorkerHint(AIDWorker : integer);
begin
  if IDWorkerLast = AIDWorker then Exit;
  
  if not Assigned(SchedulerWorkerHintForm) then
  begin
    SchedulerWorkerHintForm := TSchedulerWorkerHintForm.Create(Application);
  end;

  if SchedulerWorkerHintForm.IDWorker = 0 then
  begin
    SchedulerWorkerHintForm.IDWorker := AIDWorker;
    SchedulerWorkerHintForm.FillWorker;

  //  vForm.ClientHeight := vForm.lText.Top + vForm.lText.Height - 20;
    SchedulerWorkerHintForm.AutoSize := true;
    SchedulerWorkerHintForm.AutoSize := false;
  end
  else
    if SchedulerWorkerHintForm.IDWorker <> AIDWorker then
    begin
      HideWorkerHint;
      ShowWorkerHint(AIDWorker);
    end;
end;

procedure HideWorkerHint;
begin
  if Assigned(SchedulerWorkerHintForm) then
  begin
    SchedulerWorkerHintForm.Timer.Enabled := false;
    SchedulerWorkerHintForm.Close;
  end;

  IDWorkerLast := 0;
end;

{ TSchedulerWorkerHintForm }

procedure TSchedulerWorkerHintForm.FillWorker;
  var
    v : variant;
    s : string;
begin
  v := Datas.ReadValuesSQL('select Surname,Name,Patro,Phone,EMail, WorkerDistrictList(ID) as DList from Worker where ID = ' + IntToStr(FIDWorker), 'Surname;Name;Patro;Phone;EMail;DList');
  lFIO.Caption := IsNUll(v[0], '') + ' ' + IsNUll(v[1], '') + ' ' + IsNUll(v[2], '');

  s := PhoneFormat(IsNUll(v[3], ''));
  lText.Caption := '+7 ' + s;

  s := IsNUll(v[4], '');
  if s <> '' then lText.Caption := lText.Caption + ', ' + s;

  s := IsNUll(v[5], '');
  s := ReplaceStr(s, ', ', #13#10);
  s := Trim(s);

  if s <> '' then lText.Caption := lText.Caption + #13#10#13#10 + s;
end;

procedure TSchedulerWorkerHintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  WorkerHintVisible := false;
  SchedulerWorkerHintForm := nil;
  IDWorkerLast := FIDWorker;
end;

procedure TSchedulerWorkerHintForm.FormCreate(Sender: TObject);
begin
  WorkerHintVisible := true;
end;

procedure TSchedulerWorkerHintForm.SetIDWorker(const Value: integer);
begin
  FIDWorker := Value;
end;

procedure TSchedulerWorkerHintForm.TimerTimer(Sender: TObject);
begin
  Close;
end;

end.
