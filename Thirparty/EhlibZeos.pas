//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Надстройка ZEOS DBO для использования EhLib и MySQL
//
//------------------------------------------------------------------------------
unit EhLibZeos;
{$I EhLib.Inc}
interface
uses
  ToolCtrlsEh, DbUtilsEh, DBGridEh, Db, ZAbstractDataset,
  System.SysUtils;
type
  TZeosDatasetFeaturesEh = class(TSQLDatasetFeaturesEh)
  public
    constructor Create; override;
    procedure ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
    procedure ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
  end;
implementation
uses
  ZDataset;
function DateValueToMySQLStringProc(DataSet: TDataSet; Value: Variant): String;
begin
  Result := '"' + FormatDateTime('yyyy-mm-dd', Value) + '"';
end;

{ TZeosDatasetFeaturesEh }
function DateValueToSQLStringProc(DataSet: TDataSet; Value: Variant): String;
begin
  Result := DateValueToDataBaseSQLString('STANDARD', Value)
end;
procedure TZeosDatasetFeaturesEh.ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
  var
    s : string;
begin
  if Sender is TDBGridEh then
    if (Sender as TDBGridEh).STFilter.Local then
    begin
      DataSet.Filter :=
        GetExpressionAsFilterString(
          TDBGridEh(Sender),
          GetOneExpressionAsLocalFilterString,
          DateValueToMySQLStringProc,
          false,
          true);
      DataSet.Filtered := (DataSet.Filter <> '');
    end
    else
      ApplyFilterSQLBasedDataSet(TDBGridEh(Sender), DataSet, DateValueToSQLStringProc, IsReopen, 'SQL');
end;
procedure TZeosDatasetFeaturesEh.ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
var
  s: String;
  i: Integer;
begin
  if Sender is TCustomDBGridEh then
    if TCustomDBGridEh(Sender).SortLocal then
    begin
      s := '';
      for i := 0 to TCustomDBGridEh(Sender).SortMarkedColumns.Count - 1 do
      begin
        s := s + TCustomDBGridEh(Sender).SortMarkedColumns[i].FieldName;
        if TCustomDBGridEh(Sender).SortMarkedColumns[i].Title.SortMarker =  smDownEh
          then s := s + ' DESC, '
          else s := s + ', ';
      end;
      TZAbstractDataset(DataSet).SortedFields := Copy(s, 1, Length(s) - 2);
    end
    else
      inherited ApplySorting(Sender, DataSet, IsReopen);
end;
constructor TZeosDatasetFeaturesEh.Create;
begin
  inherited;
  SupportsLocalLike := True;
end;
initialization
  RegisterDatasetFeaturesEh(TZeosDatasetFeaturesEh, TZAbstractDataset);
  DBUtilsEh.LFBr := '"';
  DBUtilsEh.RFBr := '"';
end.
