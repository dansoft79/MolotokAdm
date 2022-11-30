//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Выбор типа
//
//------------------------------------------------------------------------------
unit USelectType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxListBox;

type
  TSelectTypeForm = class(TForm)
    pBottom: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    ListBox: TcxListBox;
    procedure ListBoxDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectType(ACaption : string; ATypes : string) : integer;

implementation

{$R *.dfm}

function SelectType(ACaption : string; ATypes : string) : integer;
begin
  with TSelectTypeForm.Create(nil) do
    try
      Caption := ACaption;

      ListBox.Items.Delimiter := ';';
      ListBox.Items.StrictDelimiter := true;
      ListBox.Items.DelimitedText := ATypes;

      ListBox.ItemIndex := 0;

      Result := -1;
      if ShowModal = mrOK then
      begin
        Result := ListBox.ItemIndex;
      end;
    finally
      Free;
    end;
end;

procedure TSelectTypeForm.ListBoxDblClick(Sender: TObject);
begin
  if ListBox.ItemIndex >= 0 then
    ModalResult := mrOK;  
end;

end.
