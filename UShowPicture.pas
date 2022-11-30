//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Просмотр картинки в модальном режиме
//
//------------------------------------------------------------------------------
unit UShowPicture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, cxControls, cxContainer, cxEdit, cxImage,
  StdCtrls, Buttons, ExtCtrls, cxCheckBox, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TPictureForm = class(TForm)
    pBottom: TPanel;
    bOK: TBitBtn;
    bCancel: TBitBtn;
    Image: TcxImage;
    cbStretched: TcxCheckBox;
    procedure cbStretchedPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowPicture(ABitmap : TBitmap);

implementation

{$R *.dfm}

procedure ShowPicture(ABitmap : TBitmap);
begin
  with TPictureForm.Create(nil) do
    try
      Image.Picture.Assign(ABitmap);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TPictureForm.cbStretchedPropertiesChange(Sender: TObject);
begin
  Image.Properties.Stretch := cbStretched.Checked;
end;

end.
