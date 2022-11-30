//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно редактирования разрешений
//
//------------------------------------------------------------------------------
unit UPermitTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus, ImgList,
  ActnMan, dxBar, cxLookAndFeels, cxContainer, cxEdit, cxGroupBox, cxControls,
  cxSplitter, cxLookAndFeelPainters, cxButtons, cxCheckBox, cxListView,
  cxTreeView, dxSkinsCore, dxSkinsDefaultPainters, cxGraphics;

type
  TPermitTreeForm = class(TForm)
    Splitter: TcxSplitter;
    gbPermitTree: TcxGroupBox;
    gbList: TcxGroupBox;
    pEdit: TPanel;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    sbUnselectAll: TcxButton;
    sbSelectAll: TcxButton;
    Tree: TcxTreeView;
    List: TcxListView;
    cbEdit: TcxCheckBox;
    procedure ListChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cbEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSelectAllClick(Sender: TObject);
    procedure sbUnselectAllClick(Sender: TObject);
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    FAll, FPermissions, FTextPermissions : TStringList;
  public
    { Public declarations }
    procedure FillTree;

    procedure SelectInList(ACaption : string);
    procedure SelectInTree(ACaption : string);

    procedure LoadPermissions(APermissions : TStringList);
    procedure SavePermissions(APermissions : TStringList);
  end;

function EditPermitTree(AAddCaption : string; ATextPermissions : TStringList) : boolean;

implementation

{$R *.dfm}

uses
  UUtil, DTKUtils, MainUnit;

function EditPermitTree(AAddCaption : string; ATextPermissions : TStringList) : boolean;
begin
  with TPermitTreeForm.Create(nil) do
    try
      FAll := TStringList.Create;
      FPermissions := TStringList.Create;
      GetAllPermissions(FAll);
      FTextPermissions := ATextPermissions;
      TextToPermissions(FTextPermissions, FPermissions);
      Caption := Caption + ' - ' + AAddCaption;
      LoadPermissions(FPermissions);
      FillTree;
      Result := ShowModal = mrOK;
      if Result then
      begin
        SavePermissions(FPermissions);
        PermissionsToText(FPermissions, FTextPermissions);
        ATextPermissions.Text := FTextPermissions.Text;
      end;
      FAll.Free;
      FPermissions.Free;
    finally
      Free;
    end;
end;

{ TDepPermitForm }

procedure TPermitTreeForm.LoadPermissions(APermissions: TStringList);
  var
    i, n, m : integer;
    s : string;
begin
  List.Items.BeginUpdate;
  List.Items.Clear;
  with List.Items do
    for i := 0 to FAll.Count - 1 do
    begin
      with List.Items.Add do
      begin
        s := FAll[i];//название инструмента
        Caption := s;
        n := APermissions.IndexOf(s);
        if n <> -1 then
        begin
          Data := APermissions.Objects[n];//код дступа
          m := integer(Data);
          m := m div 10;
          m := m mod 2;
          Checked := m = 1;
        end;
      end;
    end;
  List.Items.EndUpdate;
end;

procedure TPermitTreeForm.SavePermissions(APermissions: TStringList);
  var
    vItem : TListItem;
    i : integer;
    s : string;
begin
  FPermissions.Clear;
  with List do
    for i := 0 to Items.Count - 1 do
    begin
      vItem := List.Items[i];
      s := vItem.Caption;
      FPermissions.AddObject(s, vItem.Data);
    end;
end;

procedure TPermitTreeForm.ListChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
  var
    n : integer;
    s : string;
begin
  if Item <> nil then
  begin
    if Change = ctState then
    begin
      n := integer(Item.Data);
      s := Item.Caption;
      if Item.Checked then n := (n mod 2) + 10
      else n := n mod 2;
      Item.Data := pointer(n);
    end;
  end;
end;

procedure TPermitTreeForm.ListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
  var
    i, p : integer;
    s : string;
begin
  if Selected then
  begin
    with Item do
    begin
      s := Item.Caption;
      i := FAll.IndexOf(s);
      p := integer(FAll.Objects[i]);
      cbEdit.Enabled := (p mod 2) = 1;
      p := integer(Data);
      cbEdit.Checked := (p mod 2) = 1;
    end;
    SelectInTree(Item.Caption);
  end
  else
  begin
    cbEdit.Checked := false;
    cbEdit.Enabled := false;
    SelectInTree('');
  end;
end;

procedure TPermitTreeForm.cbEditClick(Sender: TObject);
  var
    n : integer;
begin
  if List.Selected <> nil then
    with List.Selected do
    begin
      if Checked then n := 10
      else n := 0;
      if cbEdit.Checked then n := n + 1;
      Data := pointer(n);
    end;
end;

procedure TPermitTreeForm.FormShow(Sender: TObject);
begin
  ListSelectItem(List, nil, false);
end;

procedure TPermitTreeForm.sbSelectAllClick(Sender: TObject);
  var
    i, n : integer;
    s : string;
begin
  SavePermissions(FPermissions);
  for i := 0 to FPermissions.Count - 1 do
  begin
    s := FPermissions[i];
    n := FAll.IndexOf(s);
    FPermissions.Objects[i] := FAll.Objects[n];
  end;
  LoadPermissions(FPermissions);
end;

procedure TPermitTreeForm.sbUnselectAllClick(Sender: TObject);
  var
    i : integer;
begin
  SavePermissions(FPermissions);
  for i := 0 to FPermissions.Count - 1 do
    FPermissions.Objects[i] := pointer(0);
  LoadPermissions(FPermissions);
end;

procedure TPermitTreeForm.FillTree;
  var
    i : integer;
    vActionBar0 : TdxBar;
    vActionClients0 : TdxBarItemLinks;
  procedure FillItems(AActionClientItem : TdxBarItemLink; AParentNode : TTreeNode);
    var
      i : integer;
      vNode : TTreeNode;
      vCaption : string;
  begin
    vCaption := AActionClientItem.Caption;

    if vCaption <> '' then
    begin
      if (AActionClientItem.Item.Action = nil) or (AActionClientItem.Item.Action.Tag = 0) then
        vCaption := vCaption + ' (доступно всем)';
      vNode := Tree.Items.AddChild(AParentNode, StringReplace(vCaption, '&', '', [rfReplaceAll]));
      vNode.ImageIndex := AActionClientItem.Item.ImageIndex;
      vNode.SelectedIndex := AActionClientItem.Item.ImageIndex;
      vNode.Data := AActionClientItem;

      if AActionClientItem.Item is TdxBarSubitem then
        for i := 0 to TdxBarSubitem(AActionClientItem.Item).ItemLinks.Count - 1 do
          FillItems(TdxBarSubitem(AActionClientItem.Item).ItemLinks[i], vNode);
    end;
  end;
begin
  vActionBar0 := MainForm.BarManager.Bars[0];
  vActionClients0 := vActionBar0. ItemLinks;
  for i := 0 to vActionClients0.Count - 1 do
    FillItems(vActionClients0[i], nil);
end;

procedure TPermitTreeForm.TreeChange(Sender: TObject; Node: TTreeNode);
begin
  if (TdxBarItemLink(Node.Data).Item.Action = nil) or (TdxBarItemLink(Node.Data).Item.Action.Tag = 0) then
    SelectInList('')
  else
    SelectInList(Node.Text);
end;

procedure TPermitTreeForm.SelectInList(ACaption: string);
  var
    i : integer;
begin
  Tree.OnChange := nil;

  if ACaption = '' then
    List.Selected := nil
  else
    for i := 0 to List.Items.Count - 1 do
      if List.Items[i].Caption = ACaption then
      begin
        List.Selected := List.Items[i];
        List.Selected.MakeVisible(false);
        Break;        
      end;
      
  Tree.OnChange := TreeChange;
end;

procedure TPermitTreeForm.SelectInTree(ACaption: string);
  var
    i : integer;
begin
  List.OnSelectItem := nil;
  if ACaption <> '' then
    for i := 0 to Tree.Items.Count - 1 do
      if Tree.Items[i].Text = ACaption then
      begin
        Tree.Selected := Tree.Items[i];
        Tree.Selected.MakeVisible;
        Break;
      end;
  List.OnSelectItem := ListSelectItem;
end;

procedure TPermitTreeForm.FormResize(Sender: TObject);
begin
  gbPermitTree.Width := ClientWidth div 2;
end;

end.
