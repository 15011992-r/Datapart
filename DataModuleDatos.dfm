object DMDatos: TDMDatos
  Height = 502
  Width = 675
  PixelsPerInch = 96
  object VTCabecera: TVirtualTable
    IndexFieldNames = 'IdMaestro'
    FieldDefs = <
      item
        Name = 'IdMaestro'
        DataType = ftInteger
      end
      item
        Name = 'Fecha'
        DataType = ftDate
      end
      item
        Name = 'Capital'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'Interes'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'CantidadCouta'
        DataType = ftInteger
      end>
    BeforePost = VTCabeceraBeforePost
    AfterPost = VTCabeceraAfterPost
    OnNewRecord = VTCabeceraNewRecord
    Left = 96
    Top = 48
    Data = {
      04000500090049644D61657374726F0300000000000000050046656368610900
      00000000000007004361706974616C060000000F0000000700496E7465726573
      060000000F0000000D0043616E7469646164436F757461030000000000000000
      000100000004000000010000000800000059430B000000000008000000000000
      00804F12410800000000000000000010400400000005000000}
    object VTCabeceraIdMaestro: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IdMaestro'
      KeyFields = 'IdMaestro'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object VTCabeceraFecha: TDateField
      FieldName = 'Fecha'
    end
    object VTCabeceraCapital: TFloatField
      FieldName = 'Capital'
      DisplayFormat = '###,##0.00'
    end
    object VTCabeceraInteres: TFloatField
      FieldName = 'Interes'
    end
    object VTCabeceraCantidadCuota: TIntegerField
      FieldName = 'CantidadCouta'
    end
  end
  object DSCabecera: TDataSource
    DataSet = VTCabecera
    Left = 96
    Top = 104
  end
  object DSDetalle: TDataSource
    DataSet = VTDetalle
    Left = 96
    Top = 232
  end
  object VTDetalle: TVirtualTable
    MasterSource = DSCabecera
    MasterFields = 'IdMaestro'
    DetailFields = 'IdMaestro'
    OnNewRecord = VTDetalleNewRecord
    Left = 96
    Top = 176
    Data = {04000000000000000000}
    object VTDetalleIdDetalle: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IdDetalle'
    end
    object VTDetalleIdMaestro: TIntegerField
      FieldName = 'IdMaestro'
    end
    object VTDetalleCuotaNro: TStringField
      FieldName = 'CuotaNro'
    end
    object VTDetalleInteres: TFloatField
      FieldName = 'Interes'
      DisplayFormat = '###,##0.00'
    end
    object VTDetalleSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '###,##0.00'
    end
    object VTDetallePago: TFloatField
      FieldName = 'Pago'
      DisplayFormat = '###,##0.00'
    end
    object VTDetalleSaldoDeudor: TFloatField
      FieldName = 'SaldoDeudor'
      DisplayFormat = '###,##0.00'
    end
  end
end
