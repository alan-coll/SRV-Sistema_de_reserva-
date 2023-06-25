object Config_bd: TConfig_bd
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o de banco'
  ClientHeight = 100
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 13
  object lblcaminho: TLabel
    Left = 4
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Caminho do Banco'
  end
  object EdtCaminhobanco: TEdit
    Left = 4
    Top = 27
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object BtnSalvar: TButton
    Left = 8
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Configurar'
    TabOrder = 1
    OnClick = BtnSalvarClick
  end
  object Opnpastas: TOpenDialog
    DefaultExt = 'fdb'
    Filter = 'Firebird|*.fdb'
    Left = 296
    Top = 32
  end
end
