inherited FormReserva: TFormReserva
  Caption = 'Reservas'
  ClientHeight = 261
  ClientWidth = 574
  ExplicitWidth = 590
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 117
    Width = 49
    Height = 13
    Caption = 'Solicitante'
  end
  object Label2: TLabel [1]
    Left = 5
    Top = 71
    Width = 62
    Height = 13
    Caption = 'ID_RESERVA'
  end
  object Label3: TLabel [2]
    Left = 267
    Top = 117
    Width = 32
    Height = 13
    Caption = 'Motivo'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 211
    Width = 108
    Height = 13
    Caption = 'Data do Agendamento'
  end
  object Label5: TLabel [4]
    Left = 130
    Top = 211
    Width = 119
    Height = 13
    Caption = 'Hora inicio Agendamento'
  end
  object Label6: TLabel [5]
    Left = 402
    Top = 210
    Width = 78
    Height = 13
    Caption = 'Lista de Veiculos'
  end
  object Label7: TLabel [6]
    Left = 267
    Top = 211
    Width = 112
    Height = 13
    Caption = 'Hora Fim Agendamento'
  end
  object Label8: TLabel [7]
    Left = 275
    Top = 165
    Width = 28
    Height = 13
    Caption = 'E-mail'
    FocusControl = DBEdtEmail
  end
  object LblNecessario: TLabel [8]
    Left = 8
    Top = 165
    Width = 57
    Height = 13
    Caption = 'Necessarios'
  end
  inherited Pn1: TPanel
    Width = 574
    ExplicitWidth = 574
    inherited BtnGravar: TButton
      OnClick = BtnGravarClick
    end
    inherited BtnCancel: TButton
      Visible = True
    end
  end
  object DBId_RSV: TDBEdit [10]
    Left = 8
    Top = 90
    Width = 41
    Height = 21
    DataField = 'ID_RESERVA'
    DataSource = DsReserva
    TabOrder = 1
  end
  object DBNomeSolici: TDBEdit [11]
    Left = 8
    Top = 136
    Width = 253
    Height = 21
    DataField = 'NOME_SOLICITE'
    DataSource = DsReserva
    TabOrder = 2
  end
  object cxDBDate_rsv: TcxDBDateEdit [12]
    Left = 8
    Top = 230
    DataBinding.DataField = 'DATA_RESERVA'
    DataBinding.DataSource = DsReserva
    TabOrder = 3
    Width = 109
  end
  object cxDBTimeRsv: TcxDBTimeEdit [13]
    Left = 130
    Top = 230
    DataBinding.DataField = 'HORA_RESERVA'
    DataBinding.DataSource = DsReserva
    TabOrder = 4
    Width = 131
  end
  object cxDBTimeFimRsv: TcxDBTimeEdit [14]
    Left = 269
    Top = 229
    DataBinding.DataField = 'HORA_FIM_RESERVA'
    DataBinding.DataSource = DsReserva
    TabOrder = 5
    Width = 127
  end
  object DBEdtEmail: TDBEdit [15]
    Left = 267
    Top = 184
    Width = 253
    Height = 21
    DataField = 'EMAIL'
    DataSource = DsReserva
    TabOrder = 6
  end
  object DBEdtNecessarios: TDBEdit [16]
    Left = 8
    Top = 184
    Width = 253
    Height = 21
    DataField = 'NECESSARIOS'
    DataSource = DsReserva
    TabOrder = 7
  end
  object DBMotivo_Rsv: TDBEdit [17]
    Left = 267
    Top = 136
    Width = 253
    Height = 21
    DataField = 'MOTIVO_RESERVA'
    DataSource = DsReserva
    TabOrder = 8
  end
  object DBComboBox1: TDBComboBox [18]
    Left = 402
    Top = 229
    Width = 118
    Height = 21
    DataField = 'MARCA_VEICULO'
    DataSource = DsReserva
    Items.Strings = (
      'MARCH'
      'SANDERO')
    TabOrder = 9
    OnChange = DBComboBox1Change
  end
  inherited FDQryReserva: TFDQuery
    SQL.Strings = (
      'SELECT * FROM rESERVA_VEICULO')
    Left = 1112
    Top = 192
    object FDQryReservaNOME_SOLICITE: TStringField
      FieldName = 'NOME_SOLICITE'
      Origin = 'NOME_SOLICITE'
      Size = 12
    end
    object FDQryReservaDATA_RESERVA: TDateField
      FieldName = 'DATA_RESERVA'
      Origin = 'DATA_RESERVA'
    end
    object FDQryReservaID_RESERVA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_RESERVA'
      Origin = 'ID_RESERVA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQryReservaHORA_RESERVA: TTimeField
      FieldName = 'HORA_RESERVA'
      Origin = 'HORA_RESERVA'
      Required = True
    end
    object FDQryReservaMARCA_VEICULO: TStringField
      FieldName = 'MARCA_VEICULO'
      Origin = 'MARCA_VEICULO'
      Required = True
      Size = 15
    end
    object FDQryReservaHORA_FIM_RESERVA: TTimeField
      FieldName = 'HORA_FIM_RESERVA'
      Origin = 'HORA_FIM_RESERVA'
      Required = True
    end
    object FDQryReservaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 255
    end
    object FDQryReservaNECESSARIOS: TStringField
      FieldName = 'NECESSARIOS'
      Origin = 'NECESSARIOS'
      Required = True
      Size = 255
    end
    object FDQryReservaMOTIVO_RESERVA: TStringField
      FieldName = 'MOTIVO_RESERVA'
      Origin = 'MOTIVO_RESERVA'
      Required = True
      Size = 500
    end
  end
  inherited FDUpReserva: TFDUpdateSQL
    Left = 1112
    Top = 152
  end
  inherited FDTransaction: TFDTransaction
    Left = 1112
    Top = 112
  end
  inherited DsReserva: TDataSource
    Left = 1040
    Top = 264
  end
  inherited FDQryPesquisa: TFDQuery
    Left = 1040
    Top = 208
  end
  object IdSMTP: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL
    OnDisconnected = BtnGravarClick
    OnConnected = BtnGravarClick
    Host = 'smtp.gmail.com'
    Port = 465
    SASLMechanisms = <>
    UseTLS = utUseImplicitTLS
    Left = 952
    Top = 72
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 992
    Top = 72
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'smtp.gmail.com:465'
    Host = 'smtp.gmail.com'
    MaxLineAction = maException
    Port = 465
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 1104
    Top = 72
  end
  object DataSetProvider1: TDataSetProvider
    Left = 1032
    Top = 128
  end
end
