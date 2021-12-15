object FmSistemaPagoUnico: TFmSistemaPagoUnico
  Left = 0
  Top = 0
  Caption = 'Sistema de Pago '#250'nico'
  ClientHeight = 367
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object lblCodigo: TLabel
    Left = 8
    Top = 40
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
    FocusControl = txtCodigo
  end
  object Label2: TLabel
    Left = 128
    Top = 40
    Width = 31
    Height = 15
    Caption = 'Fecha'
    FocusControl = txtFecha
  end
  object lblCapital: TLabel
    Left = 8
    Top = 71
    Width = 37
    Height = 15
    Caption = 'Capital'
    FocusControl = txtCapital
  end
  object Label4: TLabel
    Left = 185
    Top = 71
    Width = 35
    Height = 15
    Caption = 'Interes'
    FocusControl = txtInteres
  end
  object Label5: TLabel
    Left = 294
    Top = 71
    Width = 83
    Height = 15
    Caption = 'Cantidad Cuota'
    FocusControl = txtCuota
  end
  object lblPorcentaje: TLabel
    Left = 268
    Top = 71
    Width = 10
    Height = 15
    Caption = '%'
    FocusControl = txtInteres
  end
  object dbnvgr1: TDBNavigator
    Left = 0
    Top = 0
    Width = 430
    Height = 25
    DataSource = DMDatos.DSCabecera
    Align = alTop
    TabOrder = 0
    OnClick = dbnvgr1Click
  end
  object txtCodigo: TDBEdit
    Left = 53
    Top = 38
    Width = 60
    Height = 23
    DataField = 'IdMaestro'
    DataSource = DMDatos.DSCabecera
    ParentColor = True
    ReadOnly = True
    TabOrder = 1
  end
  object txtFecha: TDBEdit
    Left = 165
    Top = 38
    Width = 121
    Height = 23
    DataField = 'Fecha'
    DataSource = DMDatos.DSCabecera
    TabOrder = 2
  end
  object txtCuota: TDBEdit
    Left = 381
    Top = 67
    Width = 41
    Height = 23
    Hint = '5'
    DataField = 'CantidadCouta'
    DataSource = DMDatos.DSCabecera
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object txtInteres: TDBEdit
    Left = 226
    Top = 67
    Width = 33
    Height = 23
    Hint = '4'
    DataField = 'Interes'
    DataSource = DMDatos.DSCabecera
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object txtCapital: TDBEdit
    Left = 58
    Top = 67
    Width = 121
    Height = 23
    DataField = 'Capital'
    DataSource = DMDatos.DSCabecera
    TabOrder = 3
  end
  object btnCalcular: TButton
    Left = 8
    Top = 98
    Width = 113
    Height = 25
    Caption = 'Calcular Pago'
    TabOrder = 6
    OnClick = btnCalcularClick
  end
  object grdDetalle: TDBGrid
    Left = 8
    Top = 129
    Width = 414
    Height = 224
    DataSource = DMDatos.DSDetalle
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = grdDetalleDrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CuotaNro'
        Title.Alignment = taCenter
        Title.Caption = 'Cuota N'#176
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Interes'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saldo'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pago'
        Title.Alignment = taCenter
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SaldoDeudor'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Deudor'
        Width = 90
        Visible = True
      end>
  end
end
