object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 206
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Pn1: TPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 65
    Align = alTop
    TabOrder = 0
    object BtnNovo: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 57
      Caption = 'Novo'
      TabOrder = 0
      OnClick = BtnNovoClick
    end
    object BtnGravar: TButton
      Left = 81
      Top = 0
      Width = 75
      Height = 57
      Caption = 'Gravar'
      TabOrder = 1
    end
    object BtnCancel: TButton
      Left = 162
      Top = 0
      Width = 75
      Height = 57
      Caption = 'Cancel'
      TabOrder = 2
      Visible = False
      OnClick = BtnCancelClick
    end
  end
  object FDQryReserva: TFDQuery
    Connection = DmReserva.FDConect
    Transaction = FDTransaction
    UpdateTransaction = FDTransaction
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_RESERVA_VEICULO_ID'
    UpdateOptions.AutoIncFields = 'ID_RESERVA'
    Left = 584
    Top = 152
  end
  object FDUpReserva: TFDUpdateSQL
    Connection = DmReserva.FDConect
    Left = 584
    Top = 112
  end
  object FDTransaction: TFDTransaction
    Options.StopOptions = [xoIfCmdsInactive, xoIfAutoStarted, xoFinishRetaining]
    Connection = DmReserva.FDConect
    Left = 584
    Top = 72
  end
  object DsReserva: TDataSource
    DataSet = FDQryReserva
    Left = 512
    Top = 80
  end
  object FDQryPesquisa: TFDQuery
    Connection = DmReserva.FDConect
    Transaction = FDTransaction
    UpdateObject = FDUpReserva
    Left = 512
    Top = 136
  end
end
