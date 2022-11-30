//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Предварительный просмотр отчетов
//
//------------------------------------------------------------------------------
unit UReportPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxPreview, ActnList, stdctrls, ImgList, Menus, dxBar, cxClasses,
  dxSkinsCore, dxSkinsdxBarPainter, System.ImageList, System.Actions;

type
  TReportPreview = class(TForm)
    Preview: TfrxPreview;
    alInvoice: TActionList;
    aaFirst: TAction;
    aaPrev: TAction;
    aaNext: TAction;
    aaLast: TAction;
    aaOpen: TAction;
    aaSave: TAction;
    aaPrint: TAction;
    aaClose: TAction;
    Report: TfrxReport;
    ilPreview: TImageList;
    BarManager: TdxBarManager;
    dxBarButton4: TdxBarButton;
    bbFull: TdxBarButton;
    bbFit: TdxBarButton;
    bbWidth: TdxBarButton;
    bbOutline: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    bExport: TdxBarSubItem;
    cbZoom: TdxBarCombo;
    lExport: TdxBarListItem;
    procedure aaPrintExecute(Sender: TObject);
    procedure aaFirstExecute(Sender: TObject);
    procedure aaPrevExecute(Sender: TObject);
    procedure aaNextExecute(Sender: TObject);
    procedure aaLastExecute(Sender: TObject);
    procedure aaOpenExecute(Sender: TObject);
    procedure aaSaveExecute(Sender: TObject);
    procedure aaCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbZoomChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure bbFullClick(Sender: TObject);
    procedure bbFitClick(Sender: TObject);
    procedure bbWidthClick(Sender: TObject);
    procedure bbOutlineClick(Sender: TObject);
    procedure lExportClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FLoadedReport: Boolean;
  public
    { Public declarations }
    procedure CreateExportMenu;
    property LoadedReport : Boolean read FLoadedReport write FLoadedReport default true;
  end;

Procedure ReportPreview(AReport : TfrxReport; Const ACaption : String; AParentAction : TAction);

implementation

{$R *.dfm}

Uses
  MainUnit, UDatas, UUtil, UOptions, frxDsgnIntf, mesdlg;

Procedure ReportPreview(AReport : TfrxReport; Const ACaption : String; AParentAction : TAction);
var
  St : TMemoryStream;
  vForm : TReportPreview;
begin
  vForm := TReportPreview.Create(Application);
  with vForm do
  begin
    Tag := MaxMDITag(ClassType) + 1;
    if not OneWindow then Caption := Format('%s-%d', [Caption, Tag]);
    Name := Name + IntToStr(Tag);

    St := TMemoryStream.Create;
    try
      AReport.PreviewPages.SaveToStream(st);
      St.Position := 0;

      Report.Preview := nil;

      Report.Clear;
      Report.PreviewPages.Clear;

      Report.PreviewPages.LoadFromStream(st);
      Report.Preview := vForm.Preview;
      Report.FileName := ReportFileName + '.fp3';
      Report.ShowPreparedReport;

      Caption := Caption + '. ' + ACaption;
    finally
      st.Free
    end;

    RegisterFloatingForm(vForm, AParentAction, Caption); 

//    bbHand.Click;
//    bbFull.Click;
//    cbZoom.OnChange(cbZoom);
  end;
end;

procedure TReportPreview.aaPrintExecute(Sender: TObject);
begin
  Preview.Print;
end;

procedure TReportPreview.aaFirstExecute(Sender: TObject);
begin
  Preview.First;
end;

procedure TReportPreview.aaPrevExecute(Sender: TObject);
begin
  Preview.Prior;
end;

procedure TReportPreview.aaNextExecute(Sender: TObject);
begin
  Preview.Next;
end;

procedure TReportPreview.aaLastExecute(Sender: TObject);
begin
  Preview.Last;
end;

procedure TReportPreview.aaOpenExecute(Sender: TObject);
  var
    s1, s2 : string;
begin
  with TOpenDialog.Create(Application) Do
    try
      InitialDir := cABSReportDir;
      Filter := 'Файлы отчетов (*.fp3)|*.fp3';
      Title := 'Открытие отчета...';
      if Execute then
      begin
        FileName := ChangeFileExt(FileName,'.fp3');

        Report.Preview := nil;
        Report.Clear;
        Report.PreviewPages.Clear;
        Report.PreviewPages.LoadFromFile(FileName);
        Report.Preview := Self.Preview;
        Report.ShowPreparedReport;

        bbOutline.Down := Preview.ThumbnailVisible;

        s1 := ExtractFilePath(FileName);
        s1 := CorrectPath(s1);
        s2 := cABSReportDir;
        s2 := CorrectPath(s2);
        if s1 <> s2 then
          if ShowMsg('Запомнить путь для сохранения готовых отчетов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
          begin
            cReportDir := s1;
            cABSReportDir := s1;
          end;
      end;
    finally
      Free;
    end;
end;

procedure TReportPreview.aaSaveExecute(Sender: TObject);
  var
    s1, s2 : string;
begin
  with TSaveDialog.Create(Application) Do
    try
      InitialDir := cABSReportDir;
      Filter := 'Файлы отчетов (*.fp3)|*.fp3';
      Title := 'Сохранение отчета...';
      FileName := Report.FileName;
      if Execute then
      begin
        Report.PreviewPages.SaveToFile(FileName);

        s1 := ExtractFilePath(FileName);
        s1 := CorrectPath(s1);
        s2 := cABSReportDir;
        s2 := CorrectPath(s2);
        if s1 <> s2 then
          if ShowMsg('Запомнить путь для сохранения готовых отчетов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
          begin
            cReportDir := s1;
            cABSReportDir := s1;
          end;
      end;
    finally
      Free;
    end;
end;

procedure TReportPreview.aaCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TReportPreview.FormShow(Sender: TObject);
begin
  CreateExportMenu;

  cbZoom.OnChange(cbZoom);
end;

procedure TReportPreview.lExportClick(Sender: TObject);
  var
    n : integer;
    s1, s2 : string;
begin
  if lExport.ItemIndex <> -1 then
  begin
//    ShowMessage(lExport.Items[lExport.ItemIndex]);
    n := Integer(lExport.Items.objects[lExport.ItemIndex]);

//    ShowMessage(Report.FileName);

    TfrxCustomExportFilter(frxExportFilters[n].Filter).FileName := ChangeFileExt(Report.FileName, '.');

    Preview.Export(TfrxCustomExportFilter(frxExportFilters[n].Filter));

    if FileExists(frxExportFilters[n].Filter.FileName) then
    begin
      s1 := ExtractFilePath(frxExportFilters[n].Filter.FileName);
      s1 := CorrectPath(s1);
      s2 := cABSExportDir;
      s2 := CorrectPath(s2);
      if s1 <> s2 then
        if ShowMsg('Запомнить путь для экспорта файлов?', smtConfirmation, [smbYes, smbNo], smbNo, smbNo) = mrYes then
        begin
          cExportDir := s1;
          cABSExportDir := s1;
        end;

      Datas.UpdateExportDirs;
    end;
  end;
end;

procedure TReportPreview.bbFitClick(Sender: TObject);
begin
  cbZoom.ItemIndex := 8;
end;

procedure TReportPreview.bbFullClick(Sender: TObject);
begin
  cbZoom.ItemIndex := 4;
end;

procedure TReportPreview.bbWidthClick(Sender: TObject);
begin
  cbZoom.ItemIndex := 7;
end;

procedure TReportPreview.PreviewClick(Sender: TObject);
begin
  If Preview.Tool = ptZoom Then cbZoom.Text := FloatToStr(Round(Preview.Zoom*100)) + '%';
end;

procedure TReportPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TReportPreview.FormDestroy(Sender: TObject);
begin
  UnregisterFloatingForm(Self);
end;

procedure TReportPreview.FormResize(Sender: TObject);
begin
  cbZoom.OnChange(cbZoom);
end;

procedure TReportPreview.CreateExportMenu;
  var
    i : Integer;
begin
  lExport.Items.Clear;
  for i := 0 to frxExportFilters.Count - 1 do
  begin
    if frxExportFilters[i].Filter = frxDotMatrixExport then Continue;
    lExport.Items.AddObject(TfrxCustomExportFilter(frxExportFilters[i].Filter).GetDescription, pointer(i));
  end;
end;

procedure TReportPreview.bbOutlineClick(Sender: TObject);
begin
  Preview.ThumbnailVisible := bbOutline.Down;
end;

procedure TReportPreview.cbZoomChange(Sender: TObject);
  Var i : Integer;
begin
  Case cbZoom.ItemIndex Of
    7: begin
         Preview.ZoomMode := zmPageWidth;
         bbWidth.Down := true;
       end;
    8: begin
         Preview.ZoomMode := zmWholePage;
         bbFit.Down := true;
       end;
    else
      begin
        i := StrToInt(StringReplace(cbZoom.Text,'%','',[rfReplaceAll]));
        Preview.Zoom := i / 100;
        Preview.ZoomMode := zmDefault;

        if Preview.Zoom = 1 then bbFull.Down := true
        else
        begin
          bbFull.Down := false;
          bbFit.Down := false;
          bbWidth.Down := false;
        end;              
      end;
  End;
end;

end.
