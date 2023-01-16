object DmReserva: TDmReserva
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 269
  Width = 485
  object FDConect: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Alan\OneDrive - Educacional\Desktop\DEVDELPHIS' +
        'UPREMO\ReservaManager\RESERVA_MANAGER.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1253'
      'Server=localhost'
      'Protocol=TCPIP'
      'Port=3050'
      'DriverID=FB')
    TxOptions.StopOptions = [xoIfCmdsInactive, xoIfAutoStarted, xoFinishRetaining]
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 88
  end
end
