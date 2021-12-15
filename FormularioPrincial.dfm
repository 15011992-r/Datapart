object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Sistema de Amortizaci'#243'n de Intereses'
  ClientHeight = 581
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmPrincipal
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 15
  object mmPrincipal: TMainMenu
    OwnerDraw = True
    Left = 304
    Top = 224
    object mniSistemaPagoUnico: TMenuItem
      Caption = 'Sistema de Pago '#250'nico'
      OnClick = mniSistemaPagoUnicoClick
    end
    object Cerrar2: TMenuItem
      Caption = 'Cerrar'
      OnClick = Cerrar2Click
    end
  end
end
