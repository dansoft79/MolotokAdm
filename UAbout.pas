//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Окно с информацией о программе
//
//------------------------------------------------------------------------------
unit UAbout;

interface

{$I MolotokAdm.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg, StdCtrls, Buttons, Menus,
  cxLookAndFeelPainters, cxButtons, dxSkinsCore, dxSkinsDefaultPainters,
  cxControls, cxContainer, cxEdit, cxLabel, JvExControls, JvLabel, cxGraphics,
  cxLookAndFeels, dxGDIPlusClasses;

type
  TAboutForm = class(TForm)
    lProdVersion: TjvLabel;
    Panel1: TPanel;
    lProductName: TjvLabel;
    pImage: TPanel;
    Image: TImage;
    lCopyright: TLabel;
    lEMail: TLabel;
    lwww: TLabel;
    bClose: TcxButton;
    cxLabel4: TcxLabel;
    lbuy: TLabel;
    procedure FormShow(Sender: TObject);
    procedure lwwwClick(Sender: TObject);
    procedure lbuyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

procedure ShowAbout;

implementation

{$R *.DFM}

uses
  MainUnit, jvVersionInfo, UUtil, DTKUtils, mesdlg, UOptions, UDatas,
  ShellAPI;

procedure ShowAbout;
begin
  with TAboutForm.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
  with AppVerInfo do
  begin
    lProductName.Caption := AppVerInfo.ProductName;
    lProdVersion.Caption := AppVerInfo.FileVersion;
  end;

  {$IFDEF BUYINFO}
  lBuy.Visible := vTrialExpired;
  {$ENDIF}
end;

procedure TAboutForm.lbuyClick(Sender: TObject);
begin
  {$IFDEF BUYINFO}
  ShellExecute(0,'open','https://portalpro.ru','','',SW_SHOW);
  {$ENDIF}
end;

procedure TAboutForm.lwwwClick(Sender: TObject);
begin
  ShellExecute(0,'open',PChar(String(lwww.Caption)),'','',SW_SHOW);
end;

end.
