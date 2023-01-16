object FMainMenu: TFMainMenu
  Left = 0
  Top = 0
  Caption = 'FMainMenu'
  ClientHeight = 69
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 16
    Top = 8
    object Arquivo1: TMenuItem
      Caption = 'Cadastros'
      object CadastrarUsuario1: TMenuItem
        Caption = ' Usuario'
        OnClick = CadastrarUsuario1Click
      end
      object CadastrarVeiculo1: TMenuItem
        Caption = 'Veiculo'
        OnClick = CadastrarVeiculo1Click
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object ReservarVeiculo1: TMenuItem
      Caption = 'Reservar Veiculo'
      OnClick = ReservarVeiculo1Click
    end
    object FiltrarVeiculo1: TMenuItem
      Caption = 'Filtrar Veiculo'
      OnClick = FiltrarVeiculo1Click
    end
  end
end
