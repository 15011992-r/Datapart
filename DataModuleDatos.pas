unit DataModuleDatos;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, VirtualTable, Vcl.Dialogs,
  Vcl.Graphics, Vcl.DBCtrls, Vcl.Forms,Vcl.ExtCtrls;

type
  TDetalle = record
    Interes: Double;
    SaldoDeudor: Double;
    // Suma
    SumaInteres: Double;
    SumaSaldo: Double;
    SumaPago: Double;
  end;

  TDMDatos = class(TDataModule)
    VTCabecera: TVirtualTable;
    VTCabeceraIdMaestro: TIntegerField;
    VTCabeceraFecha: TDateField;
    VTCabeceraCapital: TFloatField;
    VTCabeceraInteres: TFloatField;
    VTCabeceraCantidadCuota: TIntegerField;
    DSCabecera: TDataSource;
    DSDetalle: TDataSource;
    VTDetalle: TVirtualTable;
    VTDetalleIdDetalle: TIntegerField;
    VTDetalleIdMaestro: TIntegerField;
    VTDetalleCuotaNro: TStringField;
    VTDetalleInteres: TFloatField;
    VTDetalleSaldo: TFloatField;
    VTDetallePago: TFloatField;
    VTDetalleSaldoDeudor: TFloatField;
    procedure VTDetalleNewRecord(DataSet: TDataSet);
    procedure VTCabeceraNewRecord(DataSet: TDataSet);
    procedure VTCabeceraAfterPost(DataSet: TDataSet);
    procedure VTCabeceraBeforePost(DataSet: TDataSet);
  private
    { Private declarations }

    DetalleAUX: TDetalle;
  public
    { Public declarations }

    procedure CargoSumariaFinal;
    procedure CerrarAux;
    procedure DetalleBorrar;
    procedure ProcesarCalculoPago;

  var
    VarUltimoID: Integer;
  end;

var
  DMDatos: TDMDatos;

implementation

uses
  FormularioPagoUnico;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDMDatos.VTCabeceraAfterPost(DataSet: TDataSet);
begin
  // guardo ID
  VarUltimoID := VTCabeceraIdMaestro.Value;
end;

procedure TDMDatos.VTCabeceraBeforePost(DataSet: TDataSet);
begin
  if (DMDatos.VTCabeceraCapital.Value < 1) then
  begin
    MessageDlg('El capital debe ser mayor que 0', mtInformation, [mbOK], 0);
    //TDBEdit(FmSistemaPagoUnico.txtCapital).Color  := clInfoBk;
    Abort;
  end;

  if (DMDatos.VTCabeceraInteres.Value < 1) then
  begin
    MessageDlg('El Interes debe ser mayor que 0', mtInformation, [mbOK], 0);
    //TDBEdit(FmSistemaPagoUnico.txtInteres).Color := clInfoBk;
    Abort;
  end;

  if (DMDatos.VTCabeceraCantidadCuota.Value < 2) then
  begin
    MessageDlg('La cantidad de cuota debe ser mayor que 1', mtInformation, [mbOK], 0);
    //FmSistemaPagoUnico.txtCuota.Color := clInfoBk;
    Abort;
  end;
end;

procedure TDMDatos.CargoSumariaFinal;
begin
  // Cargo las sumaria
  VTDetalle.Append;
  VTDetalleCuotaNro.Value := 'TOTAL';
  VTDetalleInteres.Value := DetalleAUX.SumaInteres;
  VTDetalleSaldo.Value := DetalleAUX.SumaSaldo;
  VTDetallePago.Value := DetalleAUX.SumaPago;
  VTDetalle.Post;
end;

procedure TDMDatos.CerrarAux;
begin
  DetalleAUX.Interes := 0;
  DetalleAUX.SaldoDeudor := 0;
  DetalleAUX.SumaInteres := 0;
  DetalleAUX.SumaSaldo := 0;
  DetalleAUX.SumaPago := 0;
end;

procedure TDMDatos.DetalleBorrar;
begin
  while not(DMDatos.VTDetalle.Eof) do
  begin
    DMDatos.VTDetalle.First;
    DMDatos.VTDetalle.Delete;
  end;
end;

procedure TDMDatos.ProcesarCalculoPago;
var
  I: Integer;
begin

  CerrarAux;

  // 0  Primer valor
  VTDetalle.Append;
  VTDetalleCuotaNro.Value := '0';
  VTDetalleInteres.Value := 0;
  VTDetalleSaldo.Value := 0;
  VTDetallePago.Value := 0;
  VTDetalleSaldoDeudor.Value := DMDatos.VTCabeceraCapital.Value;
  VTDetalle.Post;

  // 1
  for I := 1 to DMDatos.VTCabeceraCantidadCuota.Value do
  begin
    DMDatos.VTDetalle.Last;
    // Auxiliar
    DetalleAUX.Interes := VTDetalleInteres.Value;
    DetalleAUX.SaldoDeudor := VTDetalleSaldoDeudor.Value;

    if I < DMDatos.VTCabeceraCantidadCuota.Value then
    begin
      //
      VTDetalle.Append;
      VTDetalleCuotaNro.Value := IntToStr(I);
      VTDetalleInteres.Value := DetalleAUX.SaldoDeudor * (VTCabeceraInteres.Value / 100);
      VTDetalleSaldo.Clear;
      VTDetallePago.Clear;
      VTDetalleSaldoDeudor.Value := DetalleAUX.SaldoDeudor + VTDetalleInteres.Value;
      VTDetalle.Post;
    end
    else
    begin
      VTDetalle.Append;
      VTDetalleCuotaNro.Value := IntToStr(I);
      VTDetalleInteres.Value := DetalleAUX.SaldoDeudor * (VTCabeceraInteres.Value / 100);
      VTDetalleSaldo.Value := VTCabeceraCapital.Value;
      VTDetallePago.Value := DetalleAUX.SaldoDeudor + VTDetalleInteres.Value;
      VTDetalleSaldoDeudor.Clear;
      VTDetalle.Post;
    end;

    // AcumuladorSumaTotal
    DetalleAUX.SumaInteres := DetalleAUX.SumaInteres + VTDetalleInteres.Value;
    DetalleAUX.SumaSaldo := DetalleAUX.SumaSaldo + VTDetalleSaldo.Value;
    DetalleAUX.SumaPago := DetalleAUX.SumaPago + VTDetallePago.Value;
  end;

  CargoSumariaFinal;
end;

procedure TDMDatos.VTCabeceraNewRecord(DataSet: TDataSet);
begin
  VTCabeceraFecha.Value := Now;
  VTCabeceraIdMaestro.Value := (VarUltimoID + 1);
end;

procedure TDMDatos.VTDetalleNewRecord(DataSet: TDataSet);
begin
  VTDetalleIdMaestro.Value := VTCabeceraIdMaestro.Value;
end;

end.
