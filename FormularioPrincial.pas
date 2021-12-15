unit FormularioPrincial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    mniSistemaPagoUnico: TMenuItem;
    Cerrar2: TMenuItem;
    procedure mniSistemaPagoUnicoClick(Sender: TObject);
    procedure Cerrar2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  FormularioPagoUnico, DataModuleDatos;

{$R *.dfm}

procedure TFrmPrincipal.Cerrar2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.mniSistemaPagoUnicoClick(Sender: TObject);
begin

  if DMDatos = nil then
  begin
    Application.CreateForm(TDMDatos, DMDatos);
  end;

  TFmSistemaPagoUnico.Create(Self).Show;

end;

end.
