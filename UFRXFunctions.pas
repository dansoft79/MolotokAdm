//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Дополнительные функции для Fast Report
//
//------------------------------------------------------------------------------
unit UFRXFunctions;

interface

Uses
   SysUtils, Dialogs, Classes, fs_iinterpreter, fs_itools,MonthEdit, frxClass,
   frxDsgnIntf, UUtil, Variants,   MainUnit, cxSpinEdit, cxCalc,
   JvSpin, JvBaseEdits;

Type
  TFunctions = class(TfsRTTIModule)
  private
    function CallMethod(Instance: TObject; ClassType: TClass;
      const MethodName: String; var Params: Variant): Variant;
  public
    constructor Create(AScript: TfsScript); override;
    destructor Destroy; override;
  end;

  TfrxMonthEdit =  class(TfrxDialogControl)
  private
    FMonthEdit: TMonthEdit;
    FOnChange: TfrxNotifyEvent;
    procedure DoOnChange(Sender: TObject);
    procedure SetText(const Value: String);
    function GetText: String;
    function GetAlignment: TAlignment;
    procedure SetAlignment(const Value: TAlignment);
  public
    constructor Create(AOwner: TComponent); override;
    class function GetDescription: String; override;
    property MonthEdit: TMonthEdit read FMonthEdit;
  published
    property Text : String read GetText write SetText;
    property Alignment: TAlignment read GetAlignment write SetAlignment
      default taRightJustify;
    property Color;
    property OnChange: TfrxNotifyEvent read FOnChange write FOnChange;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;


  TfrxSpinEdit =  class(TfrxDialogControl)
  private
    FSpinEdit: TJvSpinEdit;
    FOnChange: TfrxNotifyEvent;
    procedure DoOnChange(Sender: TObject);
    procedure SetText(const Value: String);
    function GetText: String;
    function GetAlignment: TAlignment;
    procedure SetAlignment(const Value: TAlignment);
    function GetAsInteger: Integer;
    function GetValue: Extended;
    procedure SetAsInteger(const Value: Integer);
    procedure SetValue(const Value: Extended);
  public
    constructor Create(AOwner: TComponent); override;
    class function GetDescription: String; override;
    property SpinEdit: TjvSpinEdit read FSpinEdit;
  published
    property Text : String read GetText write SetText;
    property Value : Extended read GetValue write SetValue;
    property AsInteger : Integer read GetAsInteger write SetAsInteger;
    property Alignment: TAlignment read GetAlignment write SetAlignment
      default taRightJustify;
    property Color;
    property OnChange: TfrxNotifyEvent read FOnChange write FOnChange;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TfrxCalcEdit =  class(TfrxDialogControl)
  private
    FCalcEdit: TjvCalcEdit;
    FOnChange: TfrxNotifyEvent;
    procedure DoOnChange(Sender: TObject);
    procedure SetText(const Value: String);
    function GetText: String;
    function GetAlignment: TAlignment;
    procedure SetAlignment(const Value: TAlignment);
    function GetAsInteger: Integer;
    function GetValue: Extended;
    procedure SetAsInteger(const Value: Integer);
    procedure SetValue(const Value: Extended);
  public
    constructor Create(AOwner: TComponent); override;
    class function GetDescription: String; override;
    property CalcEdit: TJvCalcEdit read FCalcEdit;
  published
    property Text : String read GetText write SetText;
    property Value : Extended read GetValue write SetValue;
    property AsInteger : Integer read GetAsInteger write SetAsInteger;
    property Alignment: TAlignment read GetAlignment write SetAlignment
      default taRightJustify;
    property Color;
    property OnChange: TfrxNotifyEvent read FOnChange write FOnChange;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

var
  Functions: TFunctions;

implementation

Uses
  UDatas, DateUtils, DTKUtils, UShowText, Chart, JvVersionInfo,
  USelectUserMulti, USelectUser, types;

//Перевод рабочего месяца в дату
Function WorkMonthToValidDate(Const AWorkMonth : String) : String;
  Var WM : String;
begin
   WM := '';
   WM := Copy(AWorkMonth,1,4)+ Wm;
   WM := '.'+WM;
   WM := Copy(AWorkMonth,6,2)+WM;
   WM := '.'+WM;
   WM := '01' + WM;
   Result := WM;
end;

//Перевод рабочего месяца в строковый вид
Function WorkMonthToStr(Const AWorkMonth : String) : String;
  Var WM : String;
      Tmp : String;
begin
   WM := '';
   WM := Copy(AWorkMonth,1,4)+ Wm;
   WM := '.'+WM;
   WM := Copy(AWorkMonth,6,2)+WM;
   WM := '.'+WM;
   WM := '01' + WM;
   Tmp := FormatDateTime('mmmm.yyyy', StrToDAte(WM));
   Wm := Copy(Tmp,1,Pos('.',Tmp)-1);
   Delete(Tmp,1,Pos('.',Tmp));
   Wm := Wm + ' ' + Tmp;
   Result := Wm;
end;

{ TFunctions }

function TFunctions.CallMethod(Instance: TObject; ClassType: TClass;
  const MethodName: String; var Params: Variant): Variant;
  Var
    s, s1, s2 : string;
    Ch : Char;
    vID : TIntegerDynArray;
    vName : TStringDynArray;
    n : integer;
    d : double;
    v, v1 : variant;
    dt : TDateTime;
begin
  if MethodName = 'IFNULL' then
  begin
    Result := Isnull(Params[0], Params[1]);
  end
  else
  if MethodName = 'ISNULL' then
  begin
    v := Params[0];
    v1 := Params[1];
    Result := Isnull(v, v1);
  end
  else
  if MethodName = 'INCDAY' then
  begin
    dt := Params[0];
    n := Params[1];
    Result := IncDay(dt, n);
  end
  Else if MethodName = 'INCMONTH' then
  begin
    dt := Params[0];
    n := Params[1];
    Result := IncMonth(dt, n);
  end
  Else if MethodName = 'INCYEAR' then
  begin
    dt := Params[0];
    n := Params[1];
    Result := IncYear(dt, n);
  end
  Else if MethodName = 'INCWORKMONTH' then
  begin
    Result := DeltaMonth(Params[0], Params[1]);
  end
  Else if MethodName = 'CURRENTWORKMONTH' then
  begin
    Result := WorkMonth;
  end
  Else if MethodName = 'INTTOSTRF' then
  begin
    ch := String(Params[2])[1];
    Result := IntToStrF(Params[0],Params[1],Ch);
  end
  Else
  if MethodName = 'SOFTNAME' then
  begin
    Result := AppVerInfo.ProductName;
  end
  Else if MethodName = 'SOFTCOPYRIGHT' then
  begin
    Result := AppVerInfo.LegalCopyright;
  end
  Else if MethodName = 'SOFTVERSION' then
  begin
    Result := AppVerInfo.FileVersion;
  end
  else if MethodName = 'USERNAME' then
  begin
    Result := USERName;
  end
  else if MethodName = 'SHOWMESSAGE' then
  begin
    ShowMessage(Params[0]);
  end
  else if MethodName = 'DATETOSQLDATE' then
  begin
    Result := DateToSQLDate(Params[0]);
  end
  else if MethodName = 'SETSTARTTIME' then
  begin
    StartTime := Now;
  end
  else if MethodName = 'WORKMONTHTODATE' then
  begin
    Result := StrToDate(WorkMonthToValidDate(Params[0]));
  end
  else if MethodName = 'WORKMONTHTOSTR' then
  begin
    Result := WorkMonthToStr(Params[0]);
  end
  else if MethodName = 'IDUSER' then
  begin
    Result := USERID;
  end
  else if MethodName = 'ISWORKMONTH' then
  begin
    s := Params[0];
    Result := IsWorkMonth(s);
  end
  else if MethodName = 'SUMTOTEXT' then
  begin
    d := Params[0];
    Result := UUtil.SumToWord(d);
  end
  else if MethodName = 'GETUSERLIST' then
  begin
    if SelectUserMulti(vID, vName) then
    begin
      Result := GetIntegerListString(vID) + '=' + GetStringListString(vName);
    end
    else Result := '';
  end
  else if MethodName = 'GETUSER' then
  begin
    n := 0;
    if SelectUser(n) then
    begin
      Result := n;
    end
    else
      Result := 0;
  end
  else if MethodName = 'SHOWTEXT' then
  begin
    ShowText(nil, Params[0], Params[1]);
  end
  else if AnsiLowerCase(MethodName) = AnsiLowerCase('ActivateSeries') then
  begin
    TChart(integer(Params[0])).SeriesList[Params[1]].Active := true;
  end
  else if AnsiLowerCase(MethodName) = AnsiLowerCase('SetReportFileName') then
  begin
    ReportFileName := Params[0];
  end
  else if AnsiLowerCase(MethodName) = AnsiLowerCase('StringReplace') then
  begin
    s := Params[0];
    s1 := Params[1];
    s2 := Params[2];
    Result := StringReplace(s, s1, s2, [rfReplaceAll]);
  end
end;

constructor TFunctions.Create(AScript: TfsScript);
begin
  with AScript do
  begin
    AddedBy := Self;
    AddClass(TfrxMonthEdit,'TfrxDialogControl');
    AddClass(TfrxSpinEdit,'TfrxDialogControl');
    AddClass(TfrxCalcEdit,'TfrxDialogControl');

    AddMethod('function StringReplace(AStr, AFrom, ATo : string) : string',CallMethod,'Дополнительные', 'Заменяет в строке AStr текст AFrom на текст ATo');

    AddMethod('procedure SetReportFileName(AValue : string)',CallMethod,'Дополнительные', 'Устанавливает имя файла для экспорта');

    AddMethod('function IfNull(AValue : variant; ANullValue : variant) : variant',CallMethod,'Дополнительные', 'Заменяет значение AValue равное Null на ANullValue');
    AddMethod('function IsNull(AValue : variant; ANullValue : variant) : variant',CallMethod,'Дополнительные', 'Заменяет значение AValue равное Null на ANullValue');

    AddMethod('function ShowMessage(AText : String)',CallMethod,'Дополнительные', 'Отображение сообщения');

    AddMethod('function IncDay(ADate : TDateTime; Const ACount : Integer) : TDateTime',CallMethod,'Дополнительные', 'Увеличивает AData на один день');
    AddMethod('function IncMonth(ADate : TDateTime; Const ACount : Integer) : TDateTime',CallMethod,'Дополнительные', 'Увеличивает AData на один месяц');
    AddMethod('function IncYear(ADate : TDateTime; Const ACount : Integer) : TDateTime',CallMethod,'Дополнительные', 'Увеличивает AData на один год');
    AddMethod('function IncWorkMonth(S : String, Count : Integer) : String',CallMethod,'Дополнительные', 'Увеличивает <Рабочий месяц> на <Count> месяцев');
    AddMethod('function WorkMonthToDate(AWorkMonth : string) : TDate', CallMethod, 'Дополнительные', 'Переводит рабочий месяц в дату с первым числом месяца');
    AddMethod('function WorkMonthToStr(AWorkMonth : string) : string', CallMethod, 'Дополнительные', 'WORKMONTHTOSTR(<Рабочий месяц>)/ Переводит рабочий месяц в строковый вид');

    AddMethod('function DateToSQLDate(ADate : TDate) : string', CallMethod, 'Дополнительные', 'Преобразование даты в текст в формате ГГГГ.ММ.ДД');

    AddMethod('function IDUser : integer',CallMethod,'Дополнительные', 'Возвращает идентификатор загрузившегося пользователя');

    AddMethod('function CurrentWorkMonth : String',CallMethod,'Дополнительные', 'Возвращает текущий рабочий месяц');

    AddMethod('function SoftName : String',CallMethod,'Дополнительные', 'Получение названия программы');
    AddMethod('function SoftCopyright : String',CallMethod,'Дополнительные', 'Получение права копирования');
    AddMethod('function SoftVersion : String',CallMethod,'Дополнительные', 'Получение информации о версии программы');

    AddMethod('function IsWorkMonth(AMonth : string) : boolean', CallMethod, 'Дополнительные', 'Возвращает true, если строка является месяцем в формате ГГГГ.ММ, иначе возвращается false');

    AddMethod('function IntToStrF(AInteger : integer; ALength : byte; AFillChar : Char) : String',CallMethod,'Дополнительные', 'Возвращает отформатированную строку');

    AddMethod('procedure SetStartTime', CallMethod, 'Дополнительные', 'Запись времени начала построения отчета');

    AddMethod('function SumToText(ASum : double) : string', CallMethod, 'Дополнительные', 'Возвращает текстовую запись переменной <Сумма>');

    AddMethod('function GetUserList : string', CallMethod, 'Дополнительные', 'Возвращает список пользователей двумя подстроками разделенными знаком "=", в первой - идентификаторы, во второй - псевдонимы');

    AddMethod('function GetUser : integer', CallMethod, 'Дополнительные', 'Возвращает идентификатор выбранного пользователя');

    AddMethod('procedure ShowText(AText, ACaption : string)', CallMethod, 'Дополнительные', 'Отображение текста');

    AddMethod('procedure ActivateSeries(AChart : TChart; AIndex : integer)', CallMethod, 'Дополнительные', 'Активация серии в графике');

    AddedBy := nil;
  end;
end;

destructor TFunctions.Destroy;
begin
  if fsGlobalUnit <> nil then
    fsGlobalUnit.RemoveItems(Self);
  inherited;
end;


{ TfrxMonthEdit }

constructor TfrxMonthEdit.Create(AOwner: TComponent);
begin
  inherited;
  FMonthEdit := TMonthEdit.Create(nil);
  FMonthEdit.OnChange := DoOnChange;
  InitControl(FMonthEdit);
  Width := 145;
  Height := 21;
end;

procedure TfrxMonthEdit.DoOnChange(Sender: TObject);
begin
  if Report <> nil then
    Report.DoNotifyEvent(Self, FOnChange);
end;

function TfrxMonthEdit.GetAlignment: TAlignment;
begin
   Result := FMonthEdit.Alignment;
end;

class function TfrxMonthEdit.GetDescription: String;
begin
  Result := 'TMonthEdit';
end;

function TfrxMonthEdit.GetText: String;
begin
  Result := FMonthEdit.Text;
end;

procedure TfrxMonthEdit.SetAlignment(const Value: TAlignment);
begin
  FMonthEdit.Alignment := Value;
end;

procedure TfrxMonthEdit.SetText(const Value: String);
begin
  FMonthEdit.Text := Value;
end;

{ TfrxSpinEdit }

constructor TfrxSpinEdit.Create(AOwner: TComponent);
begin
  inherited;
  FSpinEdit := TJvSpinEdit.Create(nil);
  FSpinEdit.OnChange := DoOnChange;
  InitControl(FSpinEdit);
  Width := 145;
  Height := 21;
end;

procedure TfrxSpinEdit.DoOnChange(Sender: TObject);
begin
  if Report <> nil then
    Report.DoNotifyEvent(Self, FOnChange);
end;

function TfrxSpinEdit.GetAlignment: TAlignment;
begin
 Result := FSpinEdit.Alignment;
end;

function TfrxSpinEdit.GetAsInteger: Integer;
begin
 Result := FSpinEdit.AsInteger;
end;

class function TfrxSpinEdit.GetDescription: String;
begin
  Result := 'TSpinEdit';
end;

function TfrxSpinEdit.GetText: String;
begin
  Result := FSpinEdit.Text;
end;

function TfrxSpinEdit.GetValue: Extended;
begin
 Result := FSpinEdit.Value;
end;

procedure TfrxSpinEdit.SetAlignment(const Value: TAlignment);
begin
 FSpinEdit.Alignment := Value;
end;

procedure TfrxSpinEdit.SetAsInteger(const Value: Integer);
begin
  FSpinEdit.AsInteger := Value;
end;

procedure TfrxSpinEdit.SetText(const Value: String);
begin
  FSpinEdit.Text := Value;
end;

procedure TfrxSpinEdit.SetValue(const Value: Extended);
begin
  FSpinEdit.Value := Value;
end;

{ TfrxCalcEdit }

constructor TfrxCalcEdit.Create(AOwner: TComponent);
begin
  inherited;
  FCalcEdit := TjvCalcEdit.Create(nil);
  FCalcEdit.OnChange := DoOnChange;
  InitControl(FCalcEdit);
  Width := 145;
  Height := 21;
end;

procedure TfrxCalcEdit.DoOnChange(Sender: TObject);
begin
  if Report <> nil then
    Report.DoNotifyEvent(Self, FOnChange);
end;

function TfrxCalcEdit.GetAlignment: TAlignment;
begin
  Result := FCalcEdit.Alignment
end;

function TfrxCalcEdit.GetAsInteger: Integer;
begin
  Result := FCalcEdit.AsInteger;
end;

class function TfrxCalcEdit.GetDescription: String;
begin
  Result := 'TCalcEdit';
end;

function TfrxCalcEdit.GetText: String;
begin
  Result := FCalcEdit.Text;
end;

function TfrxCalcEdit.GetValue: Extended;
begin
  Result := FCalcEdit.Value;
end;

procedure TfrxCalcEdit.SetAlignment(const Value: TAlignment);
begin
  FCalcEdit.Alignment := Value;
end;

procedure TfrxCalcEdit.SetAsInteger(const Value: Integer);
begin
  FCalcEdit.AsInteger := Value;
end;

procedure TfrxCalcEdit.SetText(const Value: String);
begin
  FCalcEdit.Text := Value;
end;

procedure TfrxCalcEdit.SetValue(const Value: Extended);
begin
  FCalcEdit.Value := Value;
end;

initialization
  fsRTTIModules.Add(TFunctions);
  frxObjects.RegisterObject1(TfrxMonthEdit, nil, '', '', 0, -1);
  frxObjects.RegisterObject1(TfrxSpinEdit, nil, '', '', 0, -1);
  frxObjects.RegisterObject1(TfrxCalcEdit, nil, '', '', 0, -1);
end.
