object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 65
  ClientWidth = 590
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
    Left = 8
    Top = 8
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      Visible = False
    end
    object ReservarVeiculos1: TMenuItem
      Caption = 'Reservar Veiculos'
      OnClick = ReservarVeiculos1Click
    end
    object Consultar1: TMenuItem
      Caption = 'Consultar Agendamentos'
      OnClick = Consultar1Click
    end
  end
end
