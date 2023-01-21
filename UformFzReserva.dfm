inherited FormReserva: TFormReserva
  Caption = 'Reservas'
  ClientHeight = 267
  ClientWidth = 575
  OnClose = FormClose
  ExplicitWidth = 591
  ExplicitHeight = 306
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
    Left = 275
    Top = 117
    Width = 32
    Height = 13
    Caption = 'Motivo'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 210
    Width = 108
    Height = 13
    Caption = 'Data do Agendamento'
  end
  object Label5: TLabel [4]
    Left = 130
    Top = 210
    Width = 119
    Height = 13
    Caption = 'Hora inicio Agendamento'
  end
  object Label6: TLabel [5]
    Left = 410
    Top = 210
    Width = 78
    Height = 13
    Caption = 'Lista de Veiculos'
  end
  object Label7: TLabel [6]
    Left = 275
    Top = 210
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
    Width = 575
    ExplicitWidth = 575
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
  object DBEdtEmail: TDBEdit [12]
    Left = 275
    Top = 183
    Width = 253
    Height = 21
    DataField = 'EMAIL'
    DataSource = DsReserva
    TabOrder = 3
  end
  object DBEdtNecessarios: TDBEdit [13]
    Left = 8
    Top = 184
    Width = 253
    Height = 21
    DataField = 'NECESSARIOS'
    DataSource = DsReserva
    TabOrder = 4
  end
  object DBMotivo_Rsv: TDBEdit [14]
    Left = 275
    Top = 136
    Width = 253
    Height = 21
    DataField = 'MOTIVO_RESERVA'
    DataSource = DsReserva
    TabOrder = 5
  end
  object DBComboBox1: TDBComboBox [15]
    Left = 410
    Top = 229
    Width = 118
    Height = 21
    DataField = 'MARCA_VEICULO'
    DataSource = DsReserva
    Items.Strings = (
      'March'
      'Sandeiro'
      'Partner'
      'Celta'
      'Partner CET'
      'HR')
    TabOrder = 6
    OnChange = DBComboBox1Change
  end
  object TimePicker1: TTimePicker [16]
    Left = 130
    Top = 229
    Width = 131
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 7
    Time = 0.301388888888888900
    TimeFormat = 'hh:mm'
  end
  object TimePicker2: TTimePicker [17]
    Left = 275
    Top = 229
    Width = 112
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 8
    Time = 0.302083333333333300
    TimeFormat = 'hh:mm'
  end
  object DateTimePicker1: TDateTimePicker [18]
    Left = 8
    Top = 229
    Width = 108
    Height = 21
    Date = 44943.000000000000000000
    Time = 0.581408333331637600
    TabOrder = 9
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
    MasterSource = DsReserva
    UpdateTransaction = FDTransaction
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
