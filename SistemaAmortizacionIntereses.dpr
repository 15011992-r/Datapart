program SistemaAmortizacionIntereses;

uses
  Vcl.Forms,
  FormularioPrincial in 'FormularioPrincial.pas' {FrmPrincipal},
  FormularioPagoUnico in 'FormularioPagoUnico.pas' {FmSistemaPagoUnico},
  DataModuleDatos in 'DataModuleDatos.pas' {DMDatos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
