unit FormularioPagoUnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFmSistemaPagoUnico = class(TForm)
    dbnvgr1: TDBNavigator;
    lblCodigo: TLabel;
    Label2: TLabel;
    lblCapital: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtCodigo: TDBEdit;
    txtFecha: TDBEdit;
    txtCuota: TDBEdit;
    txtInteres: TDBEdit;
    txtCapital: TDBEdit;
    btnCalcular: TButton;
    grdDetalle: TDBGrid;
    lblPorcentaje: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure grdDetalleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FmSistemaPagoUnico: TFmSistemaPagoUnico;

implementation

uses
  DataModuleDatos;

{$R *.dfm}

procedure TFmSistemaPagoUnico.btnCalcularClick(Sender: TObject);
begin

  if DMDatos.VTCabecera.State in dsEditModes then
  begin // guardo la cabecera
    DMDatos.VTCabecera.Post;
  end;

  if not(DMDatos.VTDetalle.RecordCount = 0) then
  begin
    if MessageDlg('Seguro que desea regenerar?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    begin

      with DMDatos do
      begin
        DetalleBorrar;
        ProcesarCalculoPago;
      end;
    end;
  end;

  DMDatos.DetalleBorrar;

  if (DMDatos.VTDetalle.RecordCount = 0) then
  begin
    DMDatos.ProcesarCalculoPago;
  end;

end;

procedure TFmSistemaPagoUnico.dbnvgr1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    txtCapital.SetFocus;
  end;
end;

procedure TFmSistemaPagoUnico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMDatos.VTCabecera.State in dsEditModes then
  begin // cancelo la opracion
    DMDatos.VTCabecera.Cancel;
  end;

  Action := caFree;
end;

procedure TFmSistemaPagoUnico.FormShow(Sender: TObject);
begin
  // activo los dataSet
  if DMDatos.VTCabecera.Active = False then
  begin
    DMDatos.VTCabecera.Open;
  end;

  // ultimo Registro
  DMDatos.VTCabecera.Last;
  // guardo ID
  DMDatos.VarUltimoID := DMDatos.VTCabeceraIdMaestro.Value;

  if DMDatos.VTDetalle.Active = False then
  begin
    DMDatos.VTDetalle.Open;
  end;

end;

procedure TFmSistemaPagoUnico.grdDetalleDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if DMDatos.VTDetalle.FieldByName('CuotaNro').Value = 'TOTAL' then
  BEGIN
    grdDetalle.Canvas.Brush.Color := clInfoBk;
    grdDetalle.Canvas.Font.Style := [fsBold];
    grdDetalle.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

end.
