//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ��������� ���� ����� ��� ���������� � ������
//
//------------------------------------------------------------------------------
unit UOrderWorkerTimeParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  Menus,
  cxLookAndFeelPainters, cxLabel, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxLookAndFeels, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxImage, cxCheckBox, cxMemo, cxRichEdit, cxColorComboBox, cxCalc,
  cxSpinEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, Data.DB, cxDBData, cxTimeEdit, cxClasses, dxmdaset,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridDBWinExplorerView,
  cxGridCardView, cxGridDBCardView, cxGridCustomLayoutView,
  cxGridCustomTableView, cxGridWinExplorerView, cxGridCustomView, cxGrid,
  cxGroupBox, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids,
  Vcl.DBGrids, dxScrollbarAnnotations;

type
  TOrderWorkerTimeParamsForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    gbTime: TcxGroupBox;
    GridTime: TcxGrid;
    ViewTime: TcxGridDBCardView;
    ViewTimeRow1: TcxGridDBCardViewRow;
    ViewTimeInfo: TcxGridDBCardViewRow;
    LevelTime: TcxGridLevel;
    GridDate: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridWinExplorerView1: TcxGridWinExplorerView;
    cxGridWinExplorerViewItem1: TcxGridWinExplorerViewItem;
    cxGridWinExplorerViewItem2: TcxGridWinExplorerViewItem;
    ViewDate: TcxGridDBCardView;
    ViewDateCaption: TcxGridDBCardViewRow;
    ViewDateDescription: TcxGridDBCardViewRow;
    cxGridDBWinExplorerView1: TcxGridDBWinExplorerView;
    cxGridDBWinExplorerViewItem1: TcxGridDBWinExplorerViewItem;
    cxGridDBWinExplorerViewItem2: TcxGridDBWinExplorerViewItem;
    LevelDate: TcxGridLevel;
    pTimeTop: TPanel;
    cxLabel17: TcxLabel;
    gbMaster: TcxGroupBox;
    GridWorker: TcxGrid;
    ViewWorker: TcxGridDBTableView;
    ViewWorkerWorkerName: TcxGridDBColumn;
    ViewWorkerCategoryList: TcxGridDBColumn;
    ViewWorkerRequestCount: TcxGridDBColumn;
    ViewWorkerSum: TcxGridDBColumn;
    LevelWorker: TcxGridLevel;
    mdDate: TdxMemData;
    mdDateCaption: TStringField;
    mdDateDescription: TStringField;
    mdDateDate: TDateTimeField;
    dsDate: TDataSource;
    dsTime: TDataSource;
    mdTime: TdxMemData;
    mdTimeFrom: TTimeField;
    mdTimeInfo: TStringField;
    mdWorker: TdxMemData;
    mdWorkerID: TIntegerField;
    StringField1: TStringField;
    mdWorkerWorkClass: TStringField;
    FloatField3: TFloatField;
    mdWorkerRequestCount: TIntegerField;
    mdWorkerCategoryList: TStringField;
    dsWorker: TDataSource;
    StyleRepository: TcxStyleRepository;
    TimeStyle: TcxStyle;
    DayStyle: TcxStyle;
    WeekdayStyle: TcxStyle;
    DayContentStyle: TcxStyle;
    TimeStyleContent: TcxStyle;
    TimeInfoStyle: TcxStyle;
    eClientTime: TcxTextEdit;
    cxLabel1: TcxLabel;
    eTimeLen: TcxTextEdit;
    qMaster: TZQuery;
    eCategoryList: TcxTextEdit;
    cxLabel2: TcxLabel;
    tWorkerClass: TZQuery;
    cxLabel3: TcxLabel;
    eWorkerCount: TcxTextEdit;
    qWorker: TZQuery;
    eDistrict: TcxTextEdit;
    cxLabel4: TcxLabel;
    mdData: TdxMemData;
    mdDataDate: TDateTimeField;
    mdDataTime: TDateTimeField;
    mdDataID_Worker: TIntegerField;
    qDataOrder: TZQuery;
    mdDataMaxTime: TIntegerField;
    dsData: TDataSource;
    qWorkRestDay: TZQuery;
    mdDataDay: TdxMemData;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure eKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbWorkerClassPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ViewDateFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewTimeFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewWorkerFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
    FIDOrderList : integer;
    FWorks : TDxMemData;
    FTimeLen, FIDWorker : integer;
    FCategoryList : string; //����������� �������� �������
    FWorkerClass : TStringList;
    FMasterList : TStringList;
    FIDDistrict : integer;
  public
    { Public declarations }
    //��������� �������� ������
    procedure GetDistrict;
    //��������� ������ ����������� ����������� ��������� ��� ���������� �����
    procedure GetCategoryList;
    //��������� ������ ������� � ������� ��������
    procedure GetMasterList;
    //���������� ������ �� ������� ����� �������� ������ ���, ������ � ��������
    procedure FillData;

    //������ ���������� ���
    procedure FillDate;
    //������ ���������� �������
    procedure FillTime;
    //������ ���������� �������
    procedure FillWorker;

    //����� ������������ ��������
    procedure SelectWorker;

    procedure SetOKEnabled;
  end;

function GetOrderListWorkerTimeParams(
    AIDOrderList : integer;
    AWorks : TdxMemData;
    AClientDateTime : string;
    ATimeLen : integer;
    AIDDistrict : integer;
  var
    AResDate : TDate;
  var
    AResTime : double;
  var
    AIDWorker : integer) : integer;

implementation

{$R *.dfm}

uses
  math, dateutils, mesdlg, UShowDatasetModal,
  UDatas, DTKUtils, UConsts, UOptions, UUtil;

const
  cMaxDay : integer = 13;

function GetOrderListWorkerTimeParams(
    AIDOrderList : integer;
    AWorks : TdxMemData;
    AClientDateTime : string;
    ATimeLen : integer;
    AIDDistrict : integer;
  var
    AResDate : TDate;
  var
    AResTime : double;
  var
    AIDWorker : integer) : integer;
begin
  with TOrderWorkerTimeParamsForm.Create(nil) do
    try
      FIDOrderList := AIDOrderList;//����� ��� ������ ��������� ���������� ��������� ������ � ������� ������
      FWorks := AWorks;
      FIDWorker := AIDWorker;
      FTimeLen := ATimeLen;
      FIDDistrict := AIDDistrict;

      eClientTime.Text := AClientDateTime;
      eTimeLen.Text := INtToStr(ATimeLen) + ' �.';

      GetDistrict;

      GetCategoryList;
      eCategoryList.Text := FCategoryList;

      GetMasterList;

      if qWorker.RecordCount = 0 then
        ShowMsg('��� �� ������ �������, ����������� ����� ������������ �������������: ' + eCategoryList.Text + '!', smtWarning)
      else
      begin
        FillData;
        if mdData.RecordCount = 0 then
          ShowMsg('���������� ��������� � ��������� ����� ��������� �������� ������: ' + eTimeLen.Text + '!')
        else
        begin
          FillDate;
          FillTime;
          FillWorker;

          ViewDate.OnFocusedRecordChanged := ViewDateFocusedRecordChanged;
          ViewTime.OnFocusedRecordChanged := ViewTimeFocusedRecordChanged;
          ViewWorker.OnFocusedRecordChanged := ViewWorkerFocusedRecordChanged;

          SelectWorker;

          FIDWorker := mdWorker.FieldByName('ID').AsInteger;

          SetOKEnabled;

          Result := ShowModal;

          if Result = mrOK then
          begin
            AIDWorker := FIDWorker;
            AResDate := DateOf(mdDate.FieldByName('Date').AsDateTime);
            AResTime := TimeOf(mdTime.FieldByName('From').AsDateTime);
          end;
        end;
      end;
    finally
      Free;
    end;
end;

{ TGuideParamsForm }

procedure TOrderWorkerTimeParamsForm.SelectWorker;
  var
    vID : integer;
    vSum : double;
begin
  if mdWorker.RecordCount <= 1 then Exit;

  vSum := RoundH(mdWorker.FieldByName('RequestSum').AsFloat);
  vID := mdWorker.FieldByName('ID').AsInteger;

  mdWorker.DisableControls;
  try
    mdWorker.First;
    while not mdWorker.EOF do
    begin
      if RoundH(vSum) > RoundH(mdWorker.FieldByName('RequestSum').AsFloat) then
      begin
        vSum := RoundH(mdWorker.FieldByName('RequestSum').AsFloat);
        vID := mdWorker.FieldByName('ID').AsInteger;
      end;

      mdWorker.Next;
    end;

    mdWorker.Locate('ID', vID, []);
  finally
    mdWorker.EnableControls;
  end;
end;

procedure TOrderWorkerTimeParamsForm.SetOKEnabled;
begin
  bOK.Enabled := (FIDWorker <> 0);
end;

procedure TOrderWorkerTimeParamsForm.ViewDateFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  ViewTime.OnFocusedRecordChanged := nil;
  ViewWorker.OnFocusedRecordChanged := nil;

  FillTime;
  FillWorker;

  ViewTime.OnFocusedRecordChanged := ViewTimeFocusedRecordChanged;
  ViewWorker.OnFocusedRecordChanged := ViewWorkerFocusedRecordChanged;

  SelectWorker;

  FIDWorker := mdWorker.FieldByName('ID').AsInteger;

  SetOKEnabled;
end;

procedure TOrderWorkerTimeParamsForm.ViewTimeFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  ViewWorker.OnFocusedRecordChanged := nil;

  FillWorker;

  ViewWorker.OnFocusedRecordChanged := ViewWorkerFocusedRecordChanged;

  SelectWorker;

  FIDWorker := mdWorker.FieldByName('ID').AsInteger;

  SetOKEnabled;
end;

procedure TOrderWorkerTimeParamsForm.ViewWorkerFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  FIDWorker := mdWorker.FieldByName('ID').AsInteger;
  SetOKEnabled;
end;

procedure TOrderWorkerTimeParamsForm.FillData;
  var
    vID, fh, th, i, j, k, wd, wdc, rdc : integer;
    vDate, d, d1, fd, td : TDateTime;
    vTime : TTime;
    t, vIDWorkerList, s : string;
    r, re : boolean;
  //������� ��� �������� �������� ���������� �� ����, ���������� true, ���� ������� ����
  function IsWorkDay(AFromDate, AToDate, ADate : TDate; AWorkDayCount, ARestDayCount : integer) : boolean;
    var
      n, m, y, r : integer;
      d : TDateTime;
  begin
    //��������� ��������� � ������ �������� ����������
    if (DateOf(ADate) >= DateOf(AFromDate)) and (DateOf(ADate) <= DateOf(AToDate)) then
    begin
      n := AWorkDayCount + ARestDayCount;
      m := DaysBetween(DateOf(AFromDate), DateOf(ADate));
      y := m div n;//�������� ���������� ������ ������� - ��������, ���� ����� ����� �������� ���� ������ �� ������� ����

      d := IncDay(DateOf(AFromDate), n * y);

      //���� �� ������ ���� ���� �� ����� ��� ����� ��������� �������, �� ��� ������� ����, ����� ��������
      r := DaysBetween(DateOf(d), DateOf(ADate)) + 1;
      if r <= AWorkDayCount then Result := true
      else Result := false;
    end;
  end;

  function IsWorkDayByPeriod(ADate : TDate; ADefWorkDay : boolean; var AWorkTIme : string) : boolean;
    var
      fd, td : TDateTime;
      t : integer;
  begin
    Result := ADefWorkDay;
    ADate := DateOf(ADate);
    //�������� ���������� �� ���� ����
    qWorkRestDay.First;
    while not qWorkRestDay.eof do
    begin
      t := qWorkRestDay.FieldByName('DateType').AsInteger;
      fd := DateOf(qWorkRestDay.FieldByName('FromDate').AsDateTime);
      td := DateOf(qWorkRestDay.FieldByName('ToDate').AsDateTime);

      //���� �������� � ������
      if (ADate >= fd) and (ADate <= td) then
      begin
        if t in [1..2] then
        begin
          Result := false;
          AWorkTime := '';
        end
        else
          if t in [3..3] then
          begin
            Result := true;
            AWorkTime := qWorkRestDay.FieldByName('WorkTime').AsString;
          end;
      end;

      qWorkRestDay.Next;
    end;
  end;
begin
  mdData.Close;
  mdData.Open;

  vIDWorkerList := '';

//  ShowDatasetModal(qWorker);

  qWorker.First;
  while not qWorker.eof do
  begin
    vIDWorkerList := vIDWorkerList + qWorker.FieldBYName('ID').AsString + ',';

    //������� ��� ����������
    if qWorker.FieldByName('TimingType').AsInteger = 1 then
    begin
      //������ ��� ���������� �� ������
      for i := 0 to cMaxDay do
      begin
        //������������� ��������� ����
        d := IncDay(Date, i);
        //����� ���������� � ���� ����
        wd := DayOfTheWeek(d);
        //�������� ���������� �� ���� ����
        t := qWorker.FieldByName('Day' + IntToStr(wd)).AsString;
        if t <> '' then
        begin
          //������ ���� ���� ������ � ���
          fh := StrToInt(Copy(t, 1, 2));
          //��������� ���� ���� ������ � ���
          th := StrToInt(Copy(t, 7, 2)) - 1;
          //��������� ��� �� ������, ���� ��� ����� ���� ����� ���� �������������

          //��� �������� - ����� �� ����� ������������ ��� , ������� ��� ������

          if (fh > 0) then
          begin
            mdData.Append;
            mdData.FieldByName('ID_Worker').AsInteger := qWorker.FieldByName('ID').AsInteger;
            mdData.FieldByName('Date').AsDateTime := d;
            mdData.FieldByName('Time').AsDateTime := StrToTime(IntToStr(fh - 1) + ':00:00');
            mdData.Post;
          end;
          for j := fh to th do
          begin
            mdData.Append;
            mdData.FieldByName('ID_Worker').AsInteger := qWorker.FieldByName('ID').AsInteger;
            mdData.FieldByName('Date').AsDateTime := d;
            mdData.FieldByName('Time').AsDateTime := StrToTime(IntToStr(j) + ':00:00');
            mdData.Post;
          end;
        end;

      end
    end
    else
    begin
      //����� ��� ���������� �������
      //����������� ������ �� ��������
      qWorkRestDay.Close;
      qWorkRestDay.ParamByName('IDW').AsInteger := qWorker.FieldByName('ID').AsInteger;
      qWorkRestDay.Open;

      for i := 0 to cMaxDay do
      begin
        //������������� ��������� ����
        d := IncDay(Date, i);

        //����� ���������� ������� � �������� ����
        wdc := qWorker.FieldByName('WorkDayCount').AsInteger;
        rdc := qWorker.FieldByName('RestDayCount').AsInteger;
        t := qWorker.FieldByName('WorkTime').AsString;

        s := qWorker.FieldByName('FromDate').AsString;
        if s = '' then fd := StrToDate('01.01.2000')
        else fd := StrToDate(s);

        s := qWorker.FieldByName('ToDate').AsString;
        if s = '' then td := StrToDate('31.12.9999')
        else td := StrToDate(s);

        r := IsWorkDay(DateOf(fd), DateOf(td), DateOf(d), wdc, rdc);

        re := IsWorkDayByPeriod(d, r, t);

        if not r and re then
        begin
          r := true;
        end;
        if r and not re then
        begin
          r := false;
        end;

        if r and (t = '') then
        begin
          //����� � ���������  �������� �� ���� �������, ������ ����� ����� ����� �����������
          //����� ���������� � ���� ����
          t := Datas.ReadOptions('WorkTime')[0];
        end;

        if r and (t <> '') then
        begin
          //������ ���� ���� ������ � ���
          fh := StrToInt(Copy(t, 1, 2));
          //��������� ���� ���� ������ � ���
          th := StrToInt(Copy(t, 7, 2)) - 1;
          //��������� ��� �� ������, ���� ��� ����� ���� ����� ���� �������������

          //��� �������� - ����� �� ����� ������������ ��� , ������� ��� ������

          if (fh > 0) then
          begin
            mdData.Append;
            mdData.FieldByName('ID_Worker').AsInteger := qWorker.FieldByName('ID').AsInteger;
            mdData.FieldByName('Date').AsDateTime := d;
            mdData.FieldByName('Time').AsDateTime := StrToTime(IntToStr(fh - 1) + ':00:00');
            mdData.Post;
          end;
          for j := fh to th do
          begin
            mdData.Append;
            mdData.FieldByName('ID_Worker').AsInteger := qWorker.FieldByName('ID').AsInteger;
            mdData.FieldByName('Date').AsDateTime := d;
            mdData.FieldByName('Time').AsDateTime := StrToTime(IntToStr(j) + ':00:00');
            mdData.Post;
          end;
        end;

      end;

      qWorkRestDay.Close;

    end;
    qWorker.Next;
  end;
  vIDWorkerList := Copy(vIDWorkerList, 1, Length(vIDWorkerList) - 1);
  //�������� ������ ������ ������� ���������� �� ���� ��������������� ������ �� ���� ������ ����������
  //�������� ������ ��������������� ��������, ��� ������������ ����� ��� ���������

  //������ ����������� ���������, ������� ��� ������ � ������ ���������� 1 ��� �� ������
  qDataOrder.Close;
  qDataOrder.ParamByName('FD').AsString := DateToSQLDate(Date);
  qDataOrder.ParamByName('TD').AsString := DateToSQLDate(IncDay(Date, cMaxDay));
  qDataOrder.ParamByName('IDE').AsInteger := FIDOrderList;
  qDataOrder.SQL[7] := '(' + vIDWorkerList + ')';
  qDataOrder.Open;
  qDataOrder.First;
  while not qDataOrder.eof do
  begin
    vID := qDataOrder.FieldByName('ID_Worker').AsInteger;
    d := DateOf(qDataOrder.FieldByName('WorkDate').AsDateTIme);
    fh := HourOf(qDataOrder.FieldByName('WorkTime').AsDateTIme);
    for i := 1 to qDataOrder.FieldByName('PlanTime').AsInteger do
    begin
      //�������� ������� ��������, ������� ���� ������
      t := IntToStr(fh + i - 1) + ':00:00';
      vTime := StrToTime(t);
      if mdData.Locate('ID_Worker;Date;Time', VarArrayOf([vID, d, vTime]), []) then
        mdData.Delete;
    end;
    //������� ��� �� ���������, �� ����� �� ������ ������
    if fh > 0 then
    begin
      t := IntToStr(fh - 1) + ':00:00';
      vTime := StrToTime(t);
      if mdData.Locate('ID_Worker;Date;Time', VarArrayOf([vID, d, vTime]), []) then
        mdData.Delete;
    end;

    qDataOrder.Next;
  end;
  qDataOrder.Close;

  //������ ����������� ��� ������� ����������� ��������� ����������� ����� � �����
  mdData.Last;
  vID := mdData.FieldByName('ID_Worker').AsInteger;
  d := DateOf(mdData.FieldByName('Date').AsDateTime);
  vTime := TimeOf(mdData.FieldByName('Time').AsDateTime);
  k := 1;
  while not mdData.bof do
  begin
    if
      (mdData.FieldByName('ID_Worker').AsInteger = vID) and
      (DateOf(mdData.FieldByName('Date').AsDateTime) = d) and
      (TimeOf(mdData.FieldByName('Time').AsDateTime) = vTime)
    then
    begin
      mdData.Edit;
      mdData.FieldByName('MaxTime').AsInteger := k;
      mdData.Post;
      k := k + 1;
      vTime := IncHour(vTime, - 1);
    end
    else
    begin
      k := 1;
      vID := mdData.FieldByName('ID_Worker').AsInteger;
      d := DateOf(mdData.FieldByName('Date').AsDateTime);
      vTime := TimeOf(mdData.FieldByName('Time').AsDateTime);
      mdData.Edit;
      mdData.FieldByName('MaxTime').AsInteger := k;
      mdData.Post;
      k := k + 1;
      vTime := IncHour(vTime, - 1);
    end;

    mdData.Prior;
  end;

  //������ ������ ���������, ����� ������� �� �������� � ������ ���� �� ���������
  mdData.First;
  while not mdData.eof do
  begin
    if mdData.FieldByName('MaxTime').AsInteger < (FTimeLen + 1) then mdData.Delete
    else mdData.Next;
  end;

  //������ ������� ���������, ������� ��� ������ ��� �� ��������
  //��������� �� ���������� ���� � ���������� ���� ���???
  d := Trunc(Now() * 24) / 24 + 1 / 24;
  vDate := DateOf(d);
  vTime := TimeOf(d);
  vTime := StrToTime(IntToStr(HourOf(vTime)) + ':00:00');
  d := vDate + vTime;
  mdData.First;
  while not mdData.eof do
  begin
    vDate := DateOf(mdData.FieldByName('Date').AsDateTime);
    vTime := TimeOf(mdData.FieldByName('Time').AsDateTime);
    d1 := vDate + vTime;
    if d > d1 then mdData.Delete
    else mdData.Next;
  end;
end;

procedure TOrderWorkerTimeParamsForm.FillDate;
  var
    i : integer;
    vDate : TDate;
    function GetDateCaption(ADate : TDate) : string;
    begin
      if ADate = Date then Result := '�������'
      else
        if ADate = (Date + 1) then Result := '������'
        else
{          if ADate = (Date + 2) then Result := '�����������'
          else}
          begin
            Result := IntToStr(DayOf(ADate));
          end
    end;
    function GetDateDescription(ADate : TDate) : string;
      const
        wd: array [1..7] of string = ('��', '��', '��', '��', '��', '��', '��');
      var
        d : integer;
    begin
      d := DayOfTheWeek(ADate);
      Result := wd[d];
    end;
begin
  mdDate.DisableControls;
  try

    mdDate.Close;
    mdDate.Open;

    for i := 0 to cMaxDay do
    begin
      vDate := Date + i;
      //���� ���� ���� ��� ����������� � ������ ����������
      if mdData.Locate('Date', vDate, []) then
      begin
        mdDate.Append;
        mdDate.FieldByName('Date').AsDateTime := vDate;
        mdDate.FieldByName('Caption').AsString := GetDateCaption(vDate);
        mdDate.FieldByName('Description').AsString := GetDateDescription(vDate);
        mdDate.Post;
      end;
    end;

    mdDate.First;

  finally
    mdDate.EnableControls;
  end;
end;

procedure TOrderWorkerTimeParamsForm.FillTime;
  var
    i, c : integer;
    vDate : TDate;
    vTime : TTime;
begin
  mdTime.DisableControls;
  try

    vDate := DateOf(mdDate.FieldByName('Date').AsDateTime);

    mdTime.Close;
    mdTime.Open;

    for i := 0 to 23 do
    begin
      vTime := StrToTime(IntToStr(i) + ':00:00');

      if mdData.Locate('Date;Time', VarArrayOf([vDate, vTime]), []) then
      begin
        c := 0;
        mdData.First;
        while not mdData.eof do
        begin
          if (DateOf(mdData.FieldByName('Date').AsDateTIme) = vDate) and (TimeOf(mdData.FieldByName('Time').AsDateTIme) = vTime) then
            inc(c);
          mdData.Next;
        end;

        mdTime.Append;
        mdTime.FieldBYName('From').AsDateTIme := StrToTime(IntToStr(i + 1) + ':00:00');
        mdTime.FieldBYName('Info').AsString := IntToStr(c);
        mdTime.Post;
      end;
    end;

    mdTime.First;
  finally
    mdTime.EnableControls;
  end;
end;

procedure TOrderWorkerTimeParamsForm.FillWorker;
  var
    vDate, vTime : TDateTime;
    vID : integer;
begin
  mdWorker.DisableControls;

  try
    vDate := DateOf(mdDate.FieldByName('Date').AsDateTime);
    vTime := IncHour(TimeOf(mdTime.FieldByName('From').AsDateTime), -1);

    mdWorker.Close;
    mdWorker.Open;

    mdData.First;
    while not mdData.eof do
    begin
      if (DateOf(mdData.FieldBYName('Date').AsDateTime) = vDate) and (TimeOf(mdData.FieldBYName('Time').AsDateTime) = vTime) then
      begin
        vID := mdData.FieldBYName('ID_Worker').AsInteger;
        if qWorker.Locate('ID', vID, []) then
        begin
          mdWorker.Append;
          mdWorker.FieldBYName('ID').AsInteger := vID;
          mdWorker.FieldBYName('WorkerName').AsString := qWorker.FieldByName('Surname').AsString + ' ' + qWorker.FieldByName('Name').AsString + ' ' + qWorker.FieldByName('Patro').AsString;
          mdWorker.FieldBYName('CategoryList').AsString := qWorker.FieldBYName('CategoryList').AsString;
          mdWorker.FieldBYName('RequestCount').AsInteger := qWorker.FieldBYName('RequestCount').AsInteger;
          mdWorker.FieldBYName('RequestSum').AsFloat := qWorker.FieldBYName('RequestSum').AsFloat;
          mdWorker.Post;
        end;
      end;

      mdData.Next;
    end;

    mdWorker.First;
  finally
    mdWorker.EnableControls;
  end;
end;

procedure TOrderWorkerTimeParamsForm.FormCreate(Sender: TObject);
begin
  FWorkerClass := TStringList.Create;
  FMasterList := TStringList.Create;

  mdDate.Persistent.Option := poNone;
  mdTime.Persistent.Option := poNone;
end;

procedure TOrderWorkerTimeParamsForm.FormDestroy(Sender: TObject);
begin
  FWorkerClass.Free;
  FMasterList.Free;
end;

procedure TOrderWorkerTimeParamsForm.FormShow(Sender: TObject);
begin
  SetOKEnabled;
end;

procedure TOrderWorkerTimeParamsForm.GetCategoryList;
  var
    vStrList : TStringList;
    s : string;
    v : variant;
    vID, vIDWorkerClass, i, vPriority, p : integer;
begin
  vStrList := TStringList.Create;
  FWorks.DisableControls;

  try
    FWorks.First;
    while not FWorks.eof do
    begin
      s := FWorks.FieldByName('WorkerClassTag').AsString;
      vIDWorkerClass := FWorks.FieldByName('ID_WorkerClass').AsInteger;
      v := Datas.ReadValues('WorkerClass', 'Priority;ID_WorkClass', vIDWorkerClass);
      vPriority := IsNull(v[0], 0);
      vID := IsNull(v[1], 0);

      if FWorkerClass.IndexOfName(IntToStr(vID)) = -1 then
      begin
        FWorkerClass.Add(IntToStr(vID) + '=' + IntToStr(vPriority));
      end
      else
      begin
        //������������� ����� ������� ��������� �� ��������
        p := StrToInt(FWorkerClass.Values[IntToStr(vID)]);
        if p < vPriority then
          FWorkerClass.Values[IntToStr(vID)] := IntToStr(vPriority);
      end;

      FWorks.Next;
    end;

    //������� �� ������� ���� ������ ������������ ���������� ���������
    //������ �������� ������ �� �����, ���� ��������� ��������, ��� ����� �� ��������
    tWorkerClass.Close;
    tWorkerClass.Open;
    s := '';
    for i := 0 to FWorkerClass.Count - 1 do
    begin
      p := StrToInt(FWorkerClass.ValueFromIndex[i]);
      vID := StrToInt(FWorkerClass.Names[i]);
      if tWorkerClass.Locate('ID_WorkClass;Priority', VarArrayOf([vID, p]), []) then
        s := s + tWorkerClass.FieldBYName('Tag').AsString + ', ';
    end;
    s := Copy(s, 1, Length(s) - 2);
    FCategoryList := s;

  finally
    FWorks.EnableControls;
    vStrList.Free;
  end;
end;

procedure TOrderWorkerTimeParamsForm.GetDistrict;
  var
    v : variant;
begin
  v := Datas.ReadValues('district', 'Name', FIDDistrict);
  eDistrict.Text := IsNull(v[0], '');
end;

procedure TOrderWorkerTimeParamsForm.GetMasterList;
  var
    p, vID, s, vSQL : string;
    i : integer;
begin
  //� ������� qWorker ����� ������ ������ �������� � ������� ������������� � ���������� � ��������� ������
  //��� ����� ���������� � ������������� ��������

  for i := 0 to FWorkerClass.Count - 1 do
  begin
    vID := FWorkerClass.Names[i];
    p := FWorkerClass.ValueFromIndex[i];
    s := 'Exists(select WC2.ID from WorkerClass WC1, WorkerCategory WC2 where WC2.ID_Worker = W.ID and WC2.ID_WorkerClass = WC1.ID and WC1.ID_WorkClass = ' + vID + ' and WC1.Priority >= ' + p + ')';
    if vSQL <> '' then vSQL := vSQL + ' and ';
    vSQL := vSQL + s;
  end;

  if vSQL = '' then qWorker.SQL[7] := '(1 = 1)'
  else qWorker.SQL[7] := vSQL;

  qWorker.Close;
  qWorker.ParamByName('IDD').AsInteger := FIDDistrict;
  qWorker.Open;

{  qWorker.First;

  mdWorker.Close;
  mdWorker.Open;

  while not qWorker.eof do
  begin
    mdWorker.Append;
    mdWorker.FieldBYName('WorkerName').AsString := qWorker.FieldByName('Surname').AsString + ' ' + qWorker.FieldByName('Name').AsString + ' ' + qWorker.FieldByName('Patro').AsString;
    mdWorker.FieldBYName('CategoryList').AsString := qWorker.FieldBYName('CategoryList').AsString;
    mdWorker.FieldBYName('RequestCount').AsInteger := qWorker.FieldBYName('RequestCount').AsInteger;
    mdWorker.FieldBYName('RequestSum').AsFloat := qWorker.FieldBYName('RequestSum').AsFloat;
    mdWorker.Post;

    qWorker.Next;
  end;

  mdWorker.First;}

  eWorkerCount.Text := IntToStr(qWorker.RecordCount);
end;

procedure TOrderWorkerTimeParamsForm.eKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    Key := vk_Tab;
end;

procedure TOrderWorkerTimeParamsForm.cbWorkerClassPropertiesChange(Sender: TObject);
begin
  SetOKEnabled
end;

procedure TOrderWorkerTimeParamsForm.eChange(Sender: TObject);
begin
  SetOKEnabled;
end;

end.
