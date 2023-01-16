object FConsultarReserva: TFConsultarReserva
  Left = 0
  Top = 0
  Caption = 'Consultar Agendamento'
  ClientHeight = 295
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 96
    Width = 85
    Height = 13
    Caption = 'MARCA_VEICULO'
  end
  object PnConsultar: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 81
    Align = alTop
    TabOrder = 0
    object lblConsultaReserva: TLabel
      Left = 169
      Top = 12
      Width = 158
      Height = 13
      Caption = 'Informe a Data do Agendamento'
    end
    object LblMarca: TLabel
      Left = 3
      Top = 12
      Width = 83
      Height = 13
      Caption = 'Informe o Veiculo'
    end
    object Edit1: TEdit
      Left = 3
      Top = 31
      Width = 150
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BtnSair: TButton
      Left = 345
      Top = 28
      Width = 89
      Height = 27
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 650
    Height = 214
    Align = alClient
    DataSource = DsConsulta
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_RESERVA'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOLICITANTE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_RESERVA'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NECESSARIOS'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_RESERVA'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_RESERVA'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_FIM_RESERVA'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARCA_VEICULO'
        Visible = True
      end>
  end
  object DateTimePicker1: TDateTimePicker
    Left = 169
    Top = 31
    Width = 158
    Height = 21
    Date = 44936.000000000000000000
    Time = 0.797762106478330700
    TabOrder = 2
    OnChange = DateTimePicker1Change
  end
  object DsConsulta: TDataSource
    AutoEdit = False
    DataSet = FDQryConsulta
    Left = 456
    Top = 136
  end
  object FDQryConsulta: TFDQuery
    Connection = DmReserva.FDConect
    Transaction = FdTransactConsulta
    UpdateTransaction = FdTransactConsulta
    SQL.Strings = (
      'select * from Reserva_veiculo')
    Left = 504
    Top = 136
    object FDQryConsultaNOME_SOLICITE: TStringField
      FieldName = 'NOME_SOLICITE'
      Origin = 'NOME_SOLICITE'
      Required = True
      Size = 500
    end
    object FDQryConsultaMOTIVO_RESERVA: TStringField
      FieldName = 'MOTIVO_RESERVA'
      Origin = 'MOTIVO_RESERVA'
      Required = True
      Size = 500
    end
    object FDQryConsultaID_RESERVA: TIntegerField
      FieldName = 'ID_RESERVA'
      Origin = 'ID_RESERVA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQryConsultaHORA_RESERVA: TTimeField
      FieldName = 'HORA_RESERVA'
      Origin = 'HORA_RESERVA'
      Required = True
    end
    object FDQryConsultaMARCA_VEICULO: TStringField
      FieldName = 'MARCA_VEICULO'
      Origin = 'MARCA_VEICULO'
      Required = True
      Size = 30
    end
    object FDQryConsultaHORA_FIM_RESERVA: TTimeField
      FieldName = 'HORA_FIM_RESERVA'
      Origin = 'HORA_FIM_RESERVA'
      Required = True
    end
    object FDQryConsultaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 255
    end
    object FDQryConsultaDATA_RESERVA: TDateField
      FieldName = 'DATA_RESERVA'
      Origin = 'DATA_RESERVA'
    end
    object FDQryConsultaNECESSARIOS: TStringField
      FieldName = 'NECESSARIOS'
      Origin = 'NECESSARIOS'
      Required = True
      Size = 255
    end
  end
  object FdTransactConsulta: TFDTransaction
    Connection = DmReserva.FDConect
    Left = 416
    Top = 136
  end
end
